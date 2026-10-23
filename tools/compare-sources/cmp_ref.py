#!/usr/bin/env python3
"""Compare a page of a reference PDF (read by ocaread) with heer_ik_roep_tN, transposed.
usage: cmp_ref.py PDF PAGE TONE SEMITONES  (SEMITONES added to the reference)"""
import sys, difflib
import ocaread, cmp_oca

NAMES = "C C# D Eb E F F# G Ab A Bb B".split()
LET = {"C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11}
def midi(n):
    acc = n.count("#") - n.count("b")
    return 12 * (int(n[-1]) + 1) + LET[n[0]] + acc
def nm(m): return NAMES[m % 12] + str(m // 12 - 1)

def collapse(seq):
    out = []
    for item in seq:
        if not out or out[-1][0] != item[0]: out.append(item)
    return out

pdf, page, tone, shift = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
r = ocaread.read(pdf, page)
d = cmp_oca.dutch(tone)
print(f"=== tone {tone}: {pdf.split('/')[-1]} p.{page}, transposed {shift:+d}")
for v in "SAB":
    a = collapse([(midi(n) + shift, i) for i, (n, _) in enumerate(r[v])])
    b = collapse([(midi(n), m) for n, m in d[v]])
    sm = difflib.SequenceMatcher(None, [x[0] for x in a], [x[0] for x in b], autojunk=False)
    print(f"  {v}: ratio {sm.ratio():.2f}  ref {len(a)} / Dutch {len(b)} (repeats merged)")
    print(f"     ref:   {' '.join(nm(x[0]) for x in a[:24])}")
    print(f"     Dutch: {' '.join(nm(x[0]) for x in b[:24])}")
