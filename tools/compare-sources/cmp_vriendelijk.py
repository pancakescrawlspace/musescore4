#!/usr/bin/env python3
"""Compare Dvoretsky's «Свете тихий» (Kievan chant; Smirnov's TTBB edition) with vriendelijk_licht,
voice by voice: pitch classes, repeats merged, after transposing. T1 T2 Bar B are paired with the
Dutch S A T B. "covers" is the share of the Dutch notes that the reference has in the same order.
usage: cmp_vriendelijk.py [PDF [SEMITONES]]   (default: the azbyka.ru TTBB PDF, +5: C major to F)"""
import sys
import ocaread, cmp_oca
from cmp_smirnov import NAMES, pc, collapse, matcher, covers

PDF = f"{cmp_oca.CH}/references/svete_tihij/azbyka_kievan_dvoretsky_ttbb.pdf"

def main(pdf, shift):
    ref = ocaread.read(pdf)
    dutch = cmp_oca.voices(f"{cmp_oca.CH}/vriendelijk_licht.mscz")
    for v in "SATB":
        a = collapse([(NAMES[(pc(n) + shift) % 12], i) for i, (n, _) in enumerate(ref[v])])
        b = collapse([(NAMES[pc(n)], m) for n, m in dutch[v]])
        print(f"{v}: covers {covers(a, b):.2f}  match {matcher(a, b).ratio():.2f}  (ref {len(a)} / Dutch {len(b)}, repeats merged)")
        for op, i1, i2, j1, j2 in matcher(a, b).get_opcodes():
            if op == "equal": continue
            ms = sorted({b[j][1] for j in range(j1, j2)}) or ([b[j1][1]] if j1 < len(b) else ["end"])
            print(f"   m{','.join(map(str, ms))} {op:7s} ref [{' '.join(x[0] for x in a[i1:i2])}]  Dutch [{' '.join(x[0] for x in b[j1:j2])}]")

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else PDF, int(sys.argv[2]) if len(sys.argv) > 2 else 5)
