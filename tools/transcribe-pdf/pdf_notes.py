"""Read the notes, slurs and syllables of a unison chant PDF, system by system.

Three engravings are read, all one staff per system, treble clef:
- azbyka.ru's numbered Znamenny series: notes drawn as shapes (no music
  font), measured in staff spaces;
- Finale (the Ascension set): noteheads, clef and dots as glyphs of a music
  font (Inkpen2, Maestro) at U+F000 + their MacRoman code, hyphens as text;
- LilyPond: glyphs with their names (noteheads.s2 …); only the pitches are
  read this way (see ison_score.py for those scores).
The lyrics are the text below each staff, in whatever font (Church Slavonic
UCS fonts give Latin letters and digits for some letters and accents;
notes_musicxml.py converts them).
"""
import sys
from pdf_trace import pages, trace

STEP = "CDEFGAB"


def near(a, b, t):
    return abs(a - b) <= t


def classify(s, sp):
    """The kind of a drawn shape, from its size in staff spaces."""
    w, h = (s["x1"] - s["x0"]) / sp, (s["y1"] - s["y0"]) / sp
    if s["color"] not in ("0", None): return "red"   # the pitch marks (pomety)
    if w > 50 and h < .2: return "staffline"
    if near(w, 1.37, .1) and near(h, 1.05, .1) and s["nsub"] == 1: return "filled"
    if near(w, 1.41, .1) and near(h, 1.08, .1) and s["nsub"] == 2: return "half"
    if near(w, 1.85, .12) and near(h, 1.08, .1) and s["nsub"] == 2: return "whole"
    if w < .15 and near(h, 3.34, .4): return "stem"
    if .5 < w < .7 and h < .2: return "hyphen"
    if 2 < w < 3.2 and h < .2: return "ledger"   # azbyka.ru 2.15, Finale 2.5-3
    if near(w, .38, .07) and near(h, .38, .07): return "dot"
    if near(w, 2.9, .15) and near(h, 7.5, .3): return "clef"
    if near(w, .93, .08) and near(h, 2.4, .12): return "flat"
    if w < .7 and 3.9 < h < 4.1: return "barline"
    if s["ncurve"] == 0 and s["npts"] <= 6 and w > 1 and h < 2.5 and s["kind"] == "fill": return "beam"
    if w > 1.6 and .5 < h < 8: return "slur"
    return "?"


def _mac(u):
    return bytes([ord(u) - 0xF000]).decode("mac_roman") if u and 0xF000 <= ord(u[0]) < 0xF100 else u


def _music_font(font):
    return "Inkpen" in font or "Maestro" in font


VOWELS = "аеёиоуыэюяѣѡѧіїєꙋaehijnswyz0‰AESZэtњHѓћ±"


def read(pdf, log=sys.stderr):
    """[{page, key, notes, slurs, syl}] per system. A note has x, d (diatonic
    step, C4 = 28), dur (quarters), dot; a slur is (first, last) note index; a
    syllable has t (text as printed), hyph (a hyphen follows) and note (its
    index)."""
    systems = []
    for page in range(1, pages(pdf) + 1):
        shapes, glyphs, height = trace(pdf, page)
        lines = sorted({round((s["y0"] + s["y1"]) / 2, 1) for s in shapes
                        if s["x1"] - s["x0"] > 300 and s["y1"] - s["y0"] < 1})
        merged = []
        for y in lines:
            if not merged or y - merged[-1] > 2: merged.append(y)
        gaps = [b - a for a, b in zip(merged, merged[1:]) if b - a < 10]
        SP = sum(gaps) / len(gaps)
        by = {}
        for s in shapes:
            s["cls"] = classify(s, SP); s["xc"] = (s["x0"] + s["x1"]) / 2; s["yc"] = (s["y0"] + s["y1"]) / 2
            by.setdefault(s["cls"], []).append(s)
        heads = {"œ": "filled", "˙": "half", "w": "whole"}
        for g in glyphs:
            if g["color"] != "0": continue
            u, fn = _mac(g["u"]), g["font"]
            box = lambda cls, x0, x1, xc, yc: by.setdefault(cls, []).append(
                dict(cls=cls, x0=x0, x1=x1, xc=xc, yc=yc, y0=yc - .5 * SP, y1=yc + .5 * SP))
            if _music_font(fn) and "Special" not in fn and u in heads:
                w = (1.6 if u == "w" else 1.18) * SP
                box(heads[u], g["x"], g["x"] + w, g["x"] + w / 2, g["y"])
            elif _music_font(fn) and "Special" not in fn and u == "&":
                box("clef", g["x"], g["x"] + 2.5 * SP, g["x"] + SP, g["y"] - SP)
            elif "Special" in fn and u == "™":   # Inkpen2Special's augmentation dot
                box("dot", g["x"], g["x"] + .4 * SP, g["x"] + .2 * SP, g["y"])
            elif u == "-" and ("Garamond" in fn or "Times" in fn):
                box("hyphen", g["x"], g["x"] + g["adv"], g["x"] + g["adv"] / 2, g["y"] - .3 * SP)
            elif g.get("name"):   # LilyPond: noteheads.s0/s1/s2, clefs.G
                n = g["name"]
                if n in ("noteheads.s2", "noteheads.s1", "noteheads.s0"):
                    cls = {"s2": "filled", "s1": "half", "s0": "whole"}[n.split(".")[1]]
                    w = (1.6 if cls == "whole" else 1.18) * SP
                    box(cls, g["x"], g["x"] + w, g["x"] + w / 2, g["y"])
                elif n == "clefs.G":
                    box("clef", g["x"], g["x"] + 2.5 * SP, g["x"] + SP, g["y"] - SP)
                elif n == "accidentals.flat":
                    box("flat", g["x"], g["x"] + .9 * SP, g["x"] + .45 * SP, g["y"])
                elif n == "dots.dot":
                    box("dot", g["x"], g["x"] + .4 * SP, g["x"] + .2 * SP, g["y"])
        glyphs = [g for g in glyphs if not _music_font(g["font"]) and not g.get("name", "").startswith(
            ("noteheads", "clefs", "accidentals", "dots", "rests", "flags")) and g["u"] != "-"]
        for s in by.get("?", []):
            print(f"p{page} unknown shape {(s['x1']-s['x0'])/SP:.2f}x{(s['y1']-s['y0'])/SP:.2f}sp "
                  f"at {s['x0']:.0f},{s['y0']:.0f}", file=log)
        ys = []
        for y in sorted({round(s["yc"], 1) for s in by["staffline"]}):
            if not ys or y - ys[-1] > 2: ys.append(y)
        if len(ys) % 5:
            raise SystemExit(f"{pdf} p{page}: {len(ys)} staff lines, not a multiple of 5")
        staves = [ys[i:i + 5] for i in range(0, len(ys), 5)]
        for k, st in enumerate(staves):
            systems.append(_system(page, k, st, staves[k + 1][0] if k + 1 < len(staves) else height,
                                   by, glyphs, log))
    return systems


def _system(page, k, st, nxt, by, glyphs, log):
    top, bot = st[0], st[4]
    sp = (bot - top) / 4
    inst = lambda s: top - 4 * sp < s["yc"] < bot + 4 * sp
    flats = [s for s in by.get("flat", []) if inst(s)]
    clefx = [c["x1"] for c in by.get("clef", []) if inst(c)][0]
    key = -len([f for f in flats if f["x0"] < clefx + 3 * sp])
    notes = []
    for hd in sorted((s for c in ("filled", "half", "whole") for s in by.get(c, []) if inst(s)),
                     key=lambda s: s["xc"]):
        d = 38 - round((hd["yc"] - top) / (sp / 2))   # 38: F5, the top line
        dur = {"filled": 1, "half": 2, "whole": 4}[hd["cls"]]
        dot = any(near(dt["yc"], hd["yc"], sp * .6) and -.2 * sp < dt["x0"] - hd["x1"] < 1.5 * sp
                  for dt in by.get("dot", []))
        acc = any(f["x0"] >= clefx + 3 * sp and 0 < hd["x0"] - f["x1"] < 1.6 * sp for f in flats)
        if dur == 1 and any(b["x0"] - .8 * sp <= hd["xc"] <= b["x1"] + .8 * sp and inst(b)
                            for b in by.get("beam", [])):
            dur = .5
        notes.append(dict(x=hd["xc"], d=d, dur=dur * (1.5 if dot else 1), dot=dot, acc=acc))
    # slurs (azbyka.ru draws each three times): each end to the nearest note
    uniq = []
    for s in sorted((s for s in by.get("slur", []) if top - 5 * sp < s["yc"] < bot + 5 * sp),
                    key=lambda s: (s["x0"], s["y0"])):
        if not any(near(s["x0"], u["x0"], 1.5) and near(s["x1"], u["x1"], 1.5) for u in uniq):
            uniq.append(s)
    slurs = []
    for s in uniq:
        a = min(range(len(notes)), key=lambda i: abs(notes[i]["x"] - s["x0"]))
        b = min(range(len(notes)), key=lambda i: abs(notes[i]["x"] - s["x1"]))
        if a >= b or max(abs(notes[a]["x"] - s["x0"]), abs(notes[b]["x"] - s["x1"])) > 2 * sp:
            print(f"p{page} st{k}: slur at x {s['x0']:.0f}-{s['x1']:.0f} left out (notes {a}-{b})", file=log)
            continue
        slurs.append((a, b))
    # syllables: the text glyphs below the staff, split at spaces, gaps, hyphens and punctuation
    band = lambda g: bot + sp < g["y"] < min(nxt - sp, bot + 12 * sp)
    gl = sorted((g for g in glyphs if g["color"] == "0" and band(g)
                 and ("Times" not in g["font"] or g["size"] > 10)), key=lambda g: g["x"])
    hy = [s for s in by.get("hyphen", []) if bot < s["yc"] < min(nxt, bot + 12 * sp)]
    toks, cur = [], None
    for g in gl:
        if g["u"] == " ":
            cur = None; continue
        diac = g["adv"] < .1   # combining accents have no width
        if cur and not diac and (g["x"] - cur["xe"] > .5 * sp or
                                 (cur["t"][-1:] in ",.:;" and g["u"] not in ",.:;")):
            cur = None
        if cur and any(cur["xe"] - 1 < h["x0"] and h["x1"] < g["x"] + 1 for h in hy):
            cur = None
        if cur is None:
            cur = dict(t="", xs=g["x"], xe=g["x"]); toks.append(cur)
        cur["t"] += g["u"]
        if not diac: cur["xe"] = max(cur["xe"], g["x"] + g["adv"])
    for i, t in enumerate(toks):
        nxtx = toks[i + 1]["xs"] if i + 1 < len(toks) else 1e9
        t["hyph"] = any(t["xe"] - 1 < h["x0"] and h["x1"] < nxtx + 1 for h in hy)
        xc = (t["xs"] + t["xe"]) / 2
        t["note"] = min(range(len(notes)), key=lambda j: abs(notes[j]["x"] - xc))
    # two syllables on one note: a vowel-less preposition («съ») joins the next syllable,
    # otherwise one of them moves to a free neighbouring note on its side
    for _ in range(3):
        used = {}
        for t in toks: used.setdefault(t["note"], []).append(t)
        for j, ts in used.items():
            if len(ts) < 2: continue
            a, b = sorted(ts, key=lambda t: t["xs"])[:2]
            if not any(ch.lower() in VOWELS for ch in a["t"]):
                b["t"] = a["t"] + " " + b["t"]; b["xs"] = a["xs"]; toks.remove(a)
                print(f"p{page} st{k}: «{b['t']}» on one note", file=log)
                break
            if j + 1 < len(notes) and j + 1 not in used: b["note"] = j + 1
            elif j - 1 >= 0 and j - 1 not in used: a["note"] = j - 1
            print(f"p{page} st{k}: two syllables on note {j}: {a['t']} / {b['t']}", file=log)
    return dict(page=page, key=key, notes=notes, slurs=slurs, syl=toks)


def show(systems, out=sys.stdout):
    """The reading, one line per system: pitch/quarters, (slurs), [syllables]."""
    for k, sy in enumerate(systems):
        print(f"== system {k + 1} (p{sy['page']}) key {sy['key']}", file=out)
        at = {t["note"]: t for t in sy["syl"]}
        cells = []
        for i, n in enumerate(sy["notes"]):
            c = f"{STEP[n['d'] % 7]}{n['d'] // 7}{'b' if n['acc'] else ''}/{n['dur']:g}"
            if any(a == i for a, b in sy["slurs"]): c = "(" + c
            if any(b == i for a, b in sy["slurs"]): c += ")"
            if i in at: c += f"[{at[i]['t']}{'-' if at[i]['hyph'] else ''}]"
            cells.append(c)
        print(" ".join(cells), file=out)
