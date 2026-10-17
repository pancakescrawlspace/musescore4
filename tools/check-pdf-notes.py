#!/usr/bin/env python3
"""Check that a LilyPond PDF shows the same notes as a MuseScore 4 .mscz.

The .mscz is ground truth. The PDF is read independently of any MusicXML or
.ly file: `mutool draw -F trace` gives every glyph by name (Emmentaler
noteheads, clefs, accidentals, dots) and every path (staff lines, stems,
barlines, slurs). From those it works out, per staff and voice:

  pitch    clef + staff position + key signature + accidentals, which last
           to the barline in their own octave (LilyPond's default style)
  duration notehead type + dots
  voice    stem up = voice 1, stem down = voice 2; stemless whole notes by
           elimination within their column
  measure  barlines

and compares each voice note by note (spelling included, so Bb4 != A#4),
plus the number of measures, the total length of every measure and every slur.

Stems must follow the voices: up in voice 1, down in voice 2. A stem
direction forced against its voice in the .mscz (StemDirection down in voice
1 or up in voice 2, where the staff has both voices in that measure) is a
problem, and so is a column in the PDF whose two notes have their stems the
same way. Such a note was usually entered in the wrong voice and moved
later, keeping its stem.

Scope is what the church scores use: two staves (treble + bass) with two
voices each, one note per chord, quarter/half/whole notes with dots, slurs.
Anything else (rests, ties, beams, tuplets, more staves) stops the check
with exit status 2 rather than giving a false pass.

usage: tools/check-pdf-notes.py score.mscz score.pdf [score2.mscz score2.pdf ...]
exit status: 0 all match, 1 differences found, 2 unsupported input
"""
import collections
import subprocess
import sys
import zipfile
import xml.etree.ElementTree as ET
from fractions import Fraction as F

LETTERS = "CDEFGAB"
DUR = {"whole": F(1), "half": F(1, 2), "quarter": F(1, 4)}
HEAD_DUR = {"s0": F(1), "s1": F(1, 2), "s2": F(1, 4)}
CLEF_BOTTOM_LINE = {"clefs.G": (2, 4), "clefs.F": (4, 2)}  # (letter index, octave): E4, G2
PAGE_OFFSET = 10000  # stack pages downwards in one coordinate frame


class Unsupported(Exception):
    pass


def name(letter, alter, octave):
    return letter + {-2: "bb", -1: "b", 0: "", 1: "#", 2: "x"}[alter] + str(octave)


def dotted(d, dots):
    return d * (2 - F(1, 2 ** dots))


# ---------------------------------------------------------------- .mscz
def read_mscz(path):
    """-> ({staff id: [voice 1 notes, voice 2 notes]}, [measure lengths], [problems]).
    A note is (measure index, name, duration, slur start, slur end). A measure's
    length is its len attribute, else that of the time signature in force."""
    with zipfile.ZipFile(path) as z:
        mscx = [n for n in z.namelist() if n.endswith(".mscx")][0]
        score = ET.fromstring(z.read(mscx)).find("Score")
    staves, lens, problems = {}, None, []
    for staff in score.findall("Staff"):
        voices = collections.defaultdict(list)
        staff_lens = []
        sig = None
        for mi, meas in enumerate(staff.findall("Measure")):
            ts = meas.find("voice/TimeSig")
            if ts is not None:
                sig = F(int(ts.findtext("sigN")), int(ts.findtext("sigD")))
            staff_lens.append(F(meas.get("len")) if meas.get("len") else sig)
            stems = []  # (voice index, forced direction, note name)
            for vi, voice in enumerate(meas.findall("voice")):
                if vi > 1:
                    raise Unsupported(f"more than two voices (m{mi + 1})")
                for el in voice:
                    if el.tag in ("Rest", "Tuplet"):
                        raise Unsupported(f"{el.tag} in m{mi + 1}")
                    if el.tag != "Chord":
                        continue
                    if el.findtext("visible") == "0":
                        raise Unsupported(f"invisible chord in m{mi + 1}")
                    dtype = el.findtext("durationType")
                    if dtype not in DUR:
                        raise Unsupported(f"{dtype} note in m{mi + 1}")
                    d = dotted(DUR[dtype], int(el.findtext("dots") or 0))
                    notes = el.findall("Note")
                    if len(notes) != 1:
                        raise Unsupported(f"chord with {len(notes)} notes in m{mi + 1}")
                    n = notes[0]
                    if n.find("Tie") is not None or any(s.get("type") == "Tie" for s in n.findall("Spanner")):
                        raise Unsupported(f"tie in m{mi + 1}")
                    pitch, tpc = int(n.findtext("pitch")), int(n.findtext("tpc"))
                    letter, alter = "FCGDAEB"[(tpc - 6) % 7], (tpc - 6) // 7 - 1
                    octave = (pitch - alter) // 12 - 1
                    assert 12 * (octave + 1) + [0, 2, 4, 5, 7, 9, 11][LETTERS.index(letter)] + alter == pitch
                    slurs = [s for s in el.findall("Spanner") if s.get("type") == "Slur"]
                    voices[vi].append((mi, name(letter, alter, octave), d,
                                       any(s.find("next") is not None for s in slurs),
                                       any(s.find("prev") is not None for s in slurs)))
                    if el.findtext("StemDirection"):
                        stems.append((vi, el.findtext("StemDirection"), voices[vi][-1][1]))
            two_voices = len([v for v in meas.findall("voice") if v.find("Chord") is not None]) == 2
            for vi, direction, nm in stems:
                if two_voices and direction != ("up", "down")[vi]:
                    problems.append(f"staff {staff.get('id')} voice {vi + 1} m{mi + 1} {nm}: "
                                    f"stem forced {direction} in the mscz")
        staves[int(staff.get("id"))] = [voices[0], voices[1]]
        lens = staff_lens
    if len(staves) != 2:
        raise Unsupported(f"{len(staves)} staves")
    return staves, lens, problems


# ---------------------------------------------------------------- PDF
def read_trace(pdf):
    trace = subprocess.run(["mutool", "draw", "-q", "-F", "trace", "-o", "-", pdf],
                           check=True, capture_output=True).stdout
    root = ET.fromstring(trace)
    glyphs, hlines, stems, bars, curves = [], [], [], [], []
    for page, pg in enumerate(root.iter("page")):
        dy = -page * PAGE_OFFSET
        for el in pg.iter():
            if el.tag == "span":
                for g in el.iter("g"):
                    glyphs.append((g.get("glyph"), float(g.get("x")), float(g.get("y")) + dy))
            elif el.tag in ("stroke_path", "fill_path"):
                # LilyPond paths are in units of 0.1 pt, flipped like the text, so
                # x/10, y/10 lands in the same frame as the glyph positions
                if el.get("transform").split()[:4] != [".1", "0", "0", "-.1"]:
                    raise Unsupported(f"unexpected path transform {el.get('transform')}")
                pts = [(float(p.get("x")) / 10, float(p.get("y")) / 10 + dy)
                       for p in el if p.tag in ("moveto", "lineto")]
                cps = [p for p in el if p.tag == "curveto"]
                if cps:
                    if el.tag == "fill_path":  # slur: from the moveto to the end of the first curve
                        curves.append((pts[0], (float(cps[0].get("x3")) / 10, float(cps[0].get("y3")) / 10 + dy)))
                    continue
                xs, ys = [p[0] for p in pts], [p[1] for p in pts]
                w, h = max(xs) - min(xs), max(ys) - min(ys)
                if el.tag == "stroke_path" and len(pts) == 2 and h < 0.01 and w > 3:
                    hlines.append((min(xs), max(xs), ys[0], el.get("linewidth")))
                elif el.tag == "fill_path" and len(pts) == 4 and w < 0.27 and 3 < h < 25:
                    stems.append((min(xs), min(ys), max(ys)))
                elif el.tag == "stroke_path" and len(pts) == 2 and w < 0.01 and h > 3:
                    bars.append((xs[0], min(ys), max(ys)))
    bad = sorted(set(g for g, _, _ in glyphs if g.split(".")[0] in ("rests", "flags", "timesig", "ties")))
    if bad:
        raise Unsupported(f"glyphs not handled: {bad}")
    # staff lines: the line width of the longest horizontal line
    staff_lw = max(hlines, key=lambda l: l[1] - l[0])[3]
    hlines = [l[:3] for l in hlines if l[3] == staff_lw]
    return glyphs, hlines, stems, bars, curves


def read_pdf(pdf):
    glyphs, hlines, stems, bars, curves = read_trace(pdf)

    # staves: groups of five equally spaced lines, top to bottom
    ys = sorted(set(round(y, 2) for _, _, y in hlines), reverse=True)
    if len(ys) % 5:
        raise Unsupported(f"{len(ys)} staff lines")
    staves = []
    for i in range(0, len(ys), 5):
        five = ys[i:i + 5]
        sp = (five[0] - five[4]) / 4
        assert all(abs((five[j] - five[j + 1]) - sp) < 0.05 for j in range(4)), five
        x0 = min(a for a, b, y in hlines if abs(y - five[0]) < 0.01)
        staves.append(dict(top=five[0], bottom=five[4], x0=x0, key={}, keyaccs=[]))
    sp = (staves[0]["top"] - staves[0]["bottom"]) / 4

    def staff_of(y):
        return min(staves, key=lambda s: abs((s["top"] + s["bottom"]) / 2 - y))

    for st in staves:
        cl = [g for g, x, y in glyphs if g.startswith("clefs.")
              and st["bottom"] - sp < y < st["top"] + sp and x < st["x0"] + 6 * sp]
        assert len(cl) == 1, cl
        st["clef"] = cl[0]
    systems = list(zip(staves[0::2], staves[1::2]))
    if any((t["clef"], b["clef"]) != ("clefs.G", "clefs.F") for t, b in systems):
        raise Unsupported("systems are not treble + bass staff pairs")

    heads = []
    for g, x, y in glyphs:
        if g.startswith("noteheads."):
            st = staff_of(y)
            pos = round((y - st["bottom"]) / (sp / 2))
            assert abs((y - st["bottom"]) / (sp / 2) - pos) < 0.05
            heads.append(dict(type=g.split(".")[1], x=x, y=y, st=st, pos=pos,
                              acc=None, dot=0, voices=set(), flag=None))

    # voices from stems; a stem starts at its head's centre
    for sx, sy0, sy1 in stems:
        cand = []
        for h in heads:
            if h["type"] != "s0" and h["x"] - 0.3 <= sx <= h["x"] + 2 * sp:
                if abs(sy0 - h["y"]) < 0.6 * sp:
                    cand.append((abs(sy0 - h["y"]), h, 1))
                if abs(sy1 - h["y"]) < 0.6 * sp:
                    cand.append((abs(sy1 - h["y"]), h, 2))
        assert cand, ("stem without notehead", sx, sy0)
        # a unison is drawn as two identical heads: give each stem its own head
        cand.sort(key=lambda c: (round(c[0], 2), bool(c[1]["voices"])))
        _, h, v = cand[0]
        assert (sx > h["x"] + 0.5 * sp) if v == 1 else (abs(sx - h["x"]) < 0.3), ("stem on wrong side", sx, h["x"])
        h["voices"].add(v)
    # two heads of one column with their stems the same way: an error, reported
    # by check(); the higher is taken as voice 1 so that the comparison can go on
    for h in heads:
        col = [o for o in heads if o is not h and o["st"] is h["st"] and abs(o["x"] - h["x"]) < 0.5
               and len(h["voices"]) == 1 and o["voices"] == h["voices"] and o["y"] != h["y"]]
        if col:
            assert len(col) == 1
            hi, lo = sorted((h, col[0]), key=lambda o: -o["y"])
            way = "up" if h["voices"] == {1} else "down"
            hi["voices"], lo["voices"] = {1}, {2}
            hi["flag"] = lo["flag"] = f"stem {way}, the same way as the other note in its column"
    for h in heads:
        assert h["type"] == "s0" or h["voices"], ("notehead without stem", h["x"], h["y"])

    for g, x, y in glyphs:
        if g == "dots.dot":
            st = staff_of(y)
            cand = [h for h in heads if h["st"] is st and 0 < x - h["x"] < 3.5 * sp and abs(y - h["y"]) <= 0.75 * sp]
            assert cand, ("dot without notehead", x, y)
            min(cand, key=lambda h: (abs(y - h["y"]), x - h["x"]))["dot"] += 1

    # barlines that span one staff; a double or final bar counts once
    for st in staves:
        xs = sorted(x for x, y0, y1 in bars
                    if y0 <= st["bottom"] + 0.2 and y1 >= st["top"] - 0.2 and y1 - y0 < 5 * sp and x > st["x0"] + 1)
        st["bars"] = [x for i, x in enumerate(xs) if i == 0 or x - xs[i - 1] >= 1.5 * sp]

    # accidentals: belong to the next head at the same position, else to the key signature
    for g, x, y in glyphs:
        if g.startswith("accidentals."):
            st = staff_of(y)
            pos = round((y - st["bottom"]) / (sp / 2))
            kind = {"flat": -1, "natural": 0, "sharp": 1}[g.split(".")[1]]
            cand = [h for h in heads if h["st"] is st and h["pos"] == pos and 0 < h["x"] - x < 3 * sp]
            if cand:
                h = min(cand, key=lambda h: h["x"] - x)
                assert h["acc"] is None
                h["acc"] = kind
            else:
                assert x < min(h["x"] for h in heads if h["st"] is st), ("accidental without notehead", x, y)
                li = CLEF_BOTTOM_LINE[st["clef"]][0]
                st["key"][LETTERS[(li + pos) % 7]] = kind

    voices = {1: {1: [], 2: []}, 2: {1: [], 2: []}}  # staff -> voice -> [(measure, head)]
    first_measure = 0
    for t, b in systems:
        if len(t["bars"]) != len(b["bars"]):
            raise Unsupported("staves of one system have different barlines")
        for stn, st in ((1, t), (2, b)):
            li, oc = CLEF_BOTTOM_LINE[st["clef"]]
            sh = sorted((h for h in heads if h["st"] is st), key=lambda h: h["x"])
            carried = {}
            for h in sh:
                h["m"] = first_measure + sum(1 for x in st["bars"] if x < h["x"])
                d = li + h["pos"]
                letter, octave = LETTERS[d % 7], oc + d // 7
                k = (h["m"], letter, octave)
                if h["acc"] is not None:
                    carried[k] = h["acc"]
                h["name"] = name(letter, carried.get(k, st["key"].get(letter, 0)), octave)
                h["dur"] = dotted(HEAD_DUR[h["type"]], h["dot"])
            for h in sh:  # whole notes have no stem
                if h["type"] != "s0":
                    continue
                wholes = [o for o in sh if o is not h and o["type"] == "s0" and abs(o["x"] - h["x"]) < 2.5 * sp]
                stemmed = set().union(*(o["voices"] for o in sh if o["type"] != "s0" and abs(o["x"] - h["x"]) < 1.5 * sp))
                if wholes:
                    assert len(wholes) == 1 and not stemmed
                    o = wholes[0]
                    if abs(o["y"] - h["y"]) < 0.01:  # unison: printed side by side
                        h["voices"] = {1} if h["x"] < o["x"] else {2}
                    else:
                        h["voices"] = {1} if h["y"] > o["y"] else {2}
                elif stemmed:
                    assert len(stemmed) == 1
                    h["voices"] = {3 - min(stemmed)}
                else:
                    h["voices"] = {1, 2}
                    h["flag"] = "lone whole note, taken as both voices"
            for v in (1, 2):
                voices[stn][v] += [h for h in sh if v in h["voices"]]
        first_measure += len(t["bars"])
    keys = sorted(set(tuple(sorted(st["key"].items())) for st in staves))
    return voices, first_measure, keys, curves, sp


# ---------------------------------------------------------------- compare
def check(mscz, pdf):
    print(f"{mscz}  vs  {pdf}")
    ms, lens, problems = read_mscz(mscz)
    pv, nmeasures, keys, curves, sp = read_pdf(pdf)
    if nmeasures != len(lens):
        problems.append(f"{len(lens)} measures in mscz, {nmeasures} in pdf")
    total = nslurs = 0
    unused = list(curves)
    for stn, sid in ((1, 1), (2, 2)):
        for v in (1, 2):
            a, b = ms[sid][v - 1], pv[stn][v]
            where = f"staff {stn} voice {v}"
            total += len(a)
            if len(a) != len(b):
                problems.append(f"{where}: {len(a)} notes in mscz, {len(b)} in pdf")
            for i, ((mm, nm, d, _, _), h) in enumerate(zip(a, b)):
                if (mm, nm, d) != (h["m"], h["name"], h["dur"]):
                    problems.append(f"{where} note {i + 1}: mscz m{mm + 1} {nm} {d}, pdf m{h['m'] + 1} {h['name']} {h['dur']}")
                if h["flag"]:
                    problems.append(f"{where} m{h['m'] + 1} {h['name']}: in the pdf, {h['flag']}")
            sums = collections.Counter()
            for h in b:
                sums[h["m"]] += h["dur"]
            for m, ln in enumerate(lens):
                if sums[m] != ln:
                    problems.append(f"{where} m{m + 1}: pdf notes add up to {sums[m]}, measure is {ln}")
            # slurs: pair starts and ends within the voice, then find the curve between the two heads
            open_, pairs = [], []
            for i, (mm, _, _, start, end) in enumerate(a):
                if end:
                    if not open_:
                        raise Unsupported(f"{where} m{mm + 1}: slur end without a slur start in that voice")
                    pairs.append((open_.pop(), i))
                if start:
                    open_.append(i)
            nslurs += len(pairs)
            side = 1 if v == 1 else -1
            for i, j in pairs:
                label = f"{where} slur {a[i][1]} (m{a[i][0] + 1}) -> {a[j][1]} (m{a[j][0] + 1})"
                if j >= len(b):
                    problems.append(f"{label}: notes missing in pdf")
                    continue
                h0, h1 = b[i], b[j]
                found = [c for c in unused
                         if h0["x"] - sp < c[0][0] < h0["x"] + 2.5 * sp and h1["x"] - 1.5 * sp < c[1][0] < h1["x"] + 2 * sp
                         and 0 < side * (c[0][1] - h0["y"]) < 4 * sp and 0 < side * (c[1][1] - h1["y"]) < 4 * sp]
                if len(found) == 1:
                    unused.remove(found[0])
                else:
                    problems.append(f"{label}: {len(found)} matching curves in pdf")
    for c in unused:
        problems.append(f"curve in pdf at x={c[0][0]:.1f} matches no slur in mscz")
    print(f"  {total} notes, {nslurs} slurs, {nmeasures} measures; key signature in pdf: {keys}")
    for p in problems:
        print("  PROBLEM:", p)
    print("  OK" if not problems else f"  {len(problems)} problem(s)")
    return not problems


def main(args):
    if not args or len(args) % 2:
        sys.exit(__doc__.strip().split("\n\n")[-1])
    status = 0
    for mscz, pdf in zip(args[0::2], args[1::2]):
        try:
            if not check(mscz, pdf):
                status = max(status, 1)
        except Unsupported as e:
            print(f"  UNSUPPORTED: {e}")
            status = 2
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
