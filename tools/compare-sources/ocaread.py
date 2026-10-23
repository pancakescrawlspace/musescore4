#!/usr/bin/env python3
"""Read the four voices (S A T B) from an OCA two-staff Finale/Maestro PDF.
Notes come back as (name, duration) per voice, e.g. ("Bb4", 1/4)."""
import subprocess, sys, re
import xml.etree.ElementTree as ET
from fractions import Fraction as F

HEADS = {"œ": F(1, 4), "ˆ": F(1, 4), "˙": F(1, 2), "ϖ": F(1), "w": F(1), "W": F(2)}  # W: a breve, used as a reciting note; ˆ: a quarter (Anastasia)
LET = "CDEFGAB"

def page_items(pdf, page=1):
    st = subprocess.run(["mutool", "draw", "-q", "-F", "stext", "-o", "-", pdf, str(page)],
                        capture_output=True, check=True).stdout
    tr = subprocess.run(["mutool", "draw", "-q", "-F", "trace", "-o", "-", pdf, str(page)],
                        capture_output=True, check=True).stdout
    def norm(c):  # a symbol-encoded font puts its glyphs at U+F000 + the MacRoman code
        return bytes([ord(c) - 0xF000]).decode("mac_roman") if c and 0xF000 <= ord(c[0]) < 0xF100 else c
    fonts = list(ET.fromstring(st).iter("font"))
    # the music font: Maestro by name, or any font (all its blocks) that has noteheads
    music = {f.get("name") for f in fonts
             if f.get("name", "") in ("Maestro", "Opus") or "Maestro" in f.get("name", "") or any(norm(c.get("c")) in ("œ", "˙") for c in f.iter("char"))}
    chars = [(norm(c.get("c")), float(c.get("x")), float(c.get("y")))
             for f in fonts if f.get("name") in music for c in f.iter("char")]
    lines = []
    root = ET.fromstring(tr)
    for el in root.iter():
        if el.tag not in ("stroke_path", "fill_path"):
            continue
        m = [float(v) for v in el.get("transform").split()]
        pts = [(float(p.get("x")), float(p.get("y"))) for p in el if p.tag in ("moveto", "lineto")]
        xs, ys = [p[0] for p in pts], [p[1] for p in pts]
        if not pts or max(xs) - min(xs) < 300:
            continue
        # a stroked line, or a thin filled rectangle (Sibelius)
        if (el.tag == "stroke_path" and len(pts) == 2 and max(ys) - min(ys) < 0.01) or \
           (el.tag == "fill_path" and len(pts) == 4 and max(ys) - min(ys) < 1.0):
            y = (min(ys) + max(ys)) / 2
            # page coords, y down: y' = d y + f (no rotation here)
            lines.append(round(m[3] * y + m[5], 1))
        elif el.tag == "stroke_path":
            # one path of many segments, each staff line drawn as two edges 0.5 apart (Finale 2007)
            segs = [(a, b) for a, b in zip(el, list(el)[1:]) if a.tag == "moveto" and b.tag == "lineto"]
            for a, b in segs:
                (x0, y0), (x1, y1) = [(float(p.get("x")), float(p.get("y"))) for p in (a, b)]
                if abs(x1 - x0) >= 300 and abs(y1 - y0) < 0.01:
                    y = m[3] * y0 + m[5]
                    if not any(abs(y - l) < 1.0 for l in lines):
                        lines.append(round(y, 1))
    # staves drawn as "=" glyphs, one per staff segment, on the bottom line (Finale, Anastasia font)
    rows = {}
    for f in fonts:
        if f.get("name") in music:
            for c in f.iter("char"):
                if norm(c.get("c")) == "=":
                    rows.setdefault(round(float(c.get("y")), 1), float(f.get("size")))
    rows = {y: size for y, size in rows.items() if sum(1 for c, x, cy in chars if c == "=" and round(cy, 1) == y) >= 2}
    if rows:
        lines = [round(y - i * size / 4, 1) for y, size in rows.items() for i in range(5)]
    return chars, sorted(set(lines))

def read(pdf, page=1):
    chars, lines = page_items(pdf, page)
    staves = [lines[i:i + 5] for i in range(0, len(lines) - len(lines) % 5, 5)]
    sp = (staves[0][4] - staves[0][0]) / 4
    def staff_of(y):
        return min(range(len(staves)), key=lambda k: abs((staves[k][0] + staves[k][4]) / 2 - y))
    first_on = {}
    for c, x, y in chars:
        if c in HEADS:
            k = staff_of(y); first_on[k] = min(first_on.get(k, x), x)
    clefs = {}
    for c, x, y in chars:   # only left of the first note: ">" is also an accent
        if c in ("%", ">", "&", "?", "V") and x < first_on.get(staff_of(y), 0):   # V: treble clef an octave down (tenor)
            clefs[staff_of(y)] = {"V": "G8"}.get(c, "G" if c in ("%", "&") else "F")
    for k in range(len(staves)):   # a staff fragment without a clef: as the same staff of the system above
        if k not in clefs:
            clefs[k] = clefs.get(k - 2, "G" if k % 2 == 0 else "F")
    # key signature: accidentals left of the first note on each staff
    first_note_x = min(x for c, x, y in chars if c in HEADS)
    key = {}
    acc_chars = {"α": -1, "b": -1, "#": 1, "µ": 0, "n": 0}
    voices = {"S": [], "A": [], "T": [], "B": []}
    def name_of(k, y, local):
        bottom = staves[k][4]
        step = round((bottom - y) / (sp / 2))
        base = {"G": (2, 4), "G8": (2, 3), "F": (4, 2)}[clefs[k]]   # E4, E3 or G2 on the bottom line
        d = base[0] + step
        letter, octave = LET[d % 7], base[1] + d // 7
        alt = local.get((letter, octave), key.get((k, letter), 0))
        return letter + {-1: "b", 0: "", 1: "#"}[alt] + str(octave), (letter, octave)
    keysig = set()
    for c, x, y in chars:
        k = staff_of(y)
        if c in acc_chars and x < first_on.get(k, 0) - 5:
            nm, (letter, _) = name_of(k, y, {})
            key[(k, letter)] = acc_chars[c]
            keysig.add((c, x, y))
    # systems: pairs of staves (treble, bass)
    heads = [(x, y, HEADS[c]) for c, x, y in chars if c in HEADS]
    dots = [(x, y) for c, x, y in chars if c in ("−", ".")]
    accs = [(c, x, y) for c, x, y in chars if c in acc_chars and (c, x, y) not in keysig]
    for s0 in range(0, len(staves), 2):
        for k, (hi, lo) in ((s0, ("S", "A")), (s0 + 1, ("T", "B"))):
            hs = [(x, y, d) for x, y, d in heads if staff_of(y) == k]
            # dots: a dot right of a head, same height (±half space)
            hs2 = []
            for x, y, d in hs:
                if any(0 < dx - x < 3 * sp and abs(dy - y) < 0.6 * sp for dx, dy in dots):
                    d = d * 3 / 2
                hs2.append((x, y, d))
            cols = {}
            for x, y, d in hs2:
                key_x = next((cx for cx in cols if abs(cx - x) < 2.5), x)
                cols.setdefault(key_x, []).append((y, d, x))
            t = F(0); end = {hi: F(0), lo: F(0)}; local = {}
            for cx in sorted(cols):
                col = sorted(cols[cx])            # top first (smaller y)
                t = min(end.values()) if col else t
                free = [v for v in (hi, lo) if end[v] <= t]
                # accidentals in this column
                for c, ax, ay in accs:
                    if staff_of(ay) == k and 0 < cx - ax < 3 * sp:
                        _, lo_oct = name_of(k, ay, {})
                        local[lo_oct] = acc_chars[c]
                if len(col) >= 2 and len(free) == 2:
                    pairs = [(hi, col[0]), (lo, col[-1])]
                elif len(col) == 1 and len(free) == 2:
                    pairs = [(hi, col[0]), (lo, col[0])]
                elif len(free) == 1:
                    pairs = [(free[0], col[0] if free[0] == hi else col[-1])]
                else:
                    pairs = [(hi, col[0]), (lo, col[-1])]
                for v, (y, d, x) in pairs:
                    nm, _ = name_of(k, y, local)
                    voices[v].append((nm, d))
                    end[v] = t + d
            # a barline resets accidentals; Finale barlines are paths, ignored here (no accidentals expected to carry)
    return voices

if __name__ == "__main__":
    v = read(sys.argv[1])
    for k in "SATB":
        print(k, " ".join(f"{n}:{d}" for n, d in v[k]))
