#!/usr/bin/env python3
"""Compare a book of tone lines (any order, repeats) with heer_ik_roep_tN, measure by measure.
For each Dutch measure and voice: the best window anywhere in the reference, by pitch class with
repeats merged, scored by difflib's ratio (1.00: the same notes in the same order, nothing extra).
Transposition and the pairing of voices are chosen as in cmp_smirnov.
usage: cmp_lines.py TONE PDF PAGES [SHIFT]   (PAGES like 1-2 or 3; SHIFT in semitones, default: the best)"""
import sys, difflib
import ocaread, cmp_oca, cmp_smirnov as c

def window_cover(m, ref):
    """Best match of m (a list of pitch classes) with any window of ref, by difflib's ratio,
    which counts the window's extra notes against it; windows of len(m) - 2 … len(m) + 2."""
    if not m: return 1.0, []
    best, at = 0, (0, 0)
    for w in range(max(1, len(m) - 2), len(m) + 3):
        for i in range(max(1, len(ref) - w + 1)):
            r = difflib.SequenceMatcher(None, m, ref[i:i + w], autojunk=False).ratio()
            if r > best: best, at = r, (i, i + w)
    return best, ref[at[0]:at[1]]

def read_pages(pdf, pages):
    a, b = (int(p) for p in (pages.split("-") * 2)[:2])
    r = {v: [] for v in "SATB"}
    for p in range(a, b + 1):
        for v, notes in ocaread.read(pdf, p).items():
            r[v] += notes
    return r

def main(tone, pdf, pages, shift=None, verbose=True):
    r = read_pages(pdf, pages)
    d = cmp_oca.dutch(tone)
    b = {v: c.collapse([(c.pc(n), m) for n, m in d[v]]) for v in "SATB"}
    shift = shift if shift is not None else max(range(12), key=lambda s: max(c.covers(c.ref_voices(r, s)[v], b[w]) for v in "SA" for w in "SA"))
    a = c.ref_voices(r, shift)
    measures = sorted({m for v in "SATB" for _, m in b[v]})
    out = {}
    for w in "SATB":
        # the reference voice that covers this Dutch voice best, measure by measure
        best = None
        for v in "SATB":
            ref = [x[0] for x in a[v]]
            per = [(m, *window_cover([x[0] for x in b[w] if x[1] == m], ref)) for m in measures]
            score = sum(cv for _, cv, _ in per) / len(per)
            if best is None or score > best[0]: best = (score, v, per)
        out[w] = best
    print(f"=== tone {tone}: {pdf.split('/')[-1]} pp.{pages}, transposed {shift:+d}: "
          + "  ".join(f"{w} {out[w][0]:.2f} ({out[w][1]})" for w in "SATB"))
    if verbose:
        for w in "SATB":
            for m, cv, win in out[w][2]:
                if cv < 1:
                    dm = [c.NAMES[x[0]] for x in b[w] if x[1] == m]
                    print(f"   {w} m{m} {cv:.2f}  Dutch [{' '.join(dm)}]  best [{' '.join(c.NAMES[x] for x in win)}]")
    return out

if __name__ == "__main__":
    main(int(sys.argv[1]), sys.argv[2], sys.argv[3], int(sys.argv[4]) if len(sys.argv) > 4 else None)
