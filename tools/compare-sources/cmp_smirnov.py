#!/usr/bin/env python3
"""Compare Smirnov's men's-choir "На Господи воззвах" (TTBB) with heer_ik_roep_tN, and the OCA's
setting with it on the same terms. Page 1 only: page 2 holds the psalm-verse refrains.
Men's and mixed voices differ in range, so voices are compared by pitch class, repeats merged;
the transposition is the one that best matches the upper voices; each Smirnov voice is paired
with the Dutch voice it matches best (the melody need not be in the same voice).
"covers" is the share of the Dutch notes that the reference has in the same order.
usage: cmp_smirnov.py TONE [PDF [PAGE]]   (PDF defaults to glas-TONE-red-smirnova.pdf, PAGE to 1)"""
import sys, difflib
import ocaread, cmp_oca

DIR = f"{cmp_oca.CH}/references/heer_ik_roep/smirnov"
NAMES = "C C# D Eb E F F# G Ab A Bb B".split()
LET = {"C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11}
REF = {"S": "T1", "A": "T2", "T": "Bar", "B": "B"}
def pc(n): return (LET[n[0]] + n.count("#") - n.count("b")) % 12

def collapse(seq):
    out = []
    for item in seq:
        if not out or out[-1][0] != item[0]: out.append(item)
    return out

def matcher(a, b):
    return difflib.SequenceMatcher(None, [x[0] for x in a], [x[0] for x in b], autojunk=False)

def covers(a, b):
    return sum(m.size for m in matcher(a, b).get_matching_blocks()) / len(b)

def ref_voices(notes, shift):
    return {v: collapse([((pc(n) + shift) % 12, i) for i, (n, _) in enumerate(notes[v])]) for v in "SATB"}

def main(tone, pdf=None, page=1):
    pdf = pdf or f"{DIR}/glas-{tone}-red-smirnova.pdf"
    r = ocaread.read(pdf, page)
    d = cmp_oca.dutch(tone)
    b = {v: collapse([(pc(n), m) for n, m in d[v]]) for v in "SATB"}
    shift = max(range(12), key=lambda s: max(covers(ref_voices(r, s)[v], b[w]) for v in "SA" for w in "SA"))
    a = ref_voices(r, shift)
    oca = ref_voices(ocaread.read(f"{cmp_oca.CH}/references/heer_ik_roep/oca/t{tone}-lic-obikhod-tt.pdf"), 0)
    print(f"=== tone {tone}: {pdf.split('/')[-1]} p.{page}, transposed {shift:+d} semitones (mod 12)")
    print("  covers, Smirnov voice (rows) against Dutch voice (columns):")
    print("          " + "  ".join(f"{w:>4}" for w in "SATB"))
    for v in "SATB":
        print(f"    {REF[v]:>3}   " + "  ".join(f"{covers(a[v], b[w]):4.2f}" for w in "SATB"))
    print("    OCA   " + "  ".join(f"{covers(oca[w], b[w]):4.2f}" for w in "SATB") + "   (OCA S A T B against Dutch S A T B)")
    for v in "SATB":
        w = max("SATB", key=lambda w: covers(a[v], b[w]))
        print(f"  {REF[v]} against Dutch {w}: covers {covers(a[v], b[w]):.2f}, Smirnov {len(a[v])} / Dutch {len(b[w])} notes")
        for op, i1, i2, j1, j2 in matcher(a[v], b[w]).get_opcodes():
            if op == "equal": continue
            ms = sorted({b[w][j][1] for j in range(j1, j2)}) or ([b[w][j1][1]] if j1 < len(b[w]) else ["end"])
            print(f"     m{','.join(map(str, ms))} {op:7s} Smirnov [{' '.join(NAMES[x[0]] for x in a[v][i1:i2])}]"
                  f"  Dutch [{' '.join(NAMES[x[0]] for x in b[w][j1:j2])}]")

if __name__ == "__main__":
    main(int(sys.argv[1]), sys.argv[2] if len(sys.argv) > 2 else None, int(sys.argv[3]) if len(sys.argv) > 3 else 1)
