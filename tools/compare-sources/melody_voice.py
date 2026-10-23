#!/usr/bin/env python3
"""Which voice of heer_ik_roep_tN carries the chant melody: each measure's soprano and alto, as
scale degrees (repeats merged), against the melody's phrases sung in unison, from the OCA's
"Learning the Tones" (unison examples, moveable do). A line a third away has other intervals,
so only the melody voice matches.
usage: melody_voice.py TONE...   (tones 2, 5, 7)"""
import sys, difflib
import cmp_oca

LET = {"C": 0, "D": 2, "E": 4, "F": 5, "G": 7, "A": 9, "B": 11}
MAJ = {0: 1, 2: 2, 4: 3, 5: 4, 7: 5, 9: 6, 11: 7}   # anything else prints as ?semitones

# (do of the Dutch version, phrases); a primed phrase is the variant with its intonation
PHRASES = {
    # Kievan chant, Tutorial-Kievan-Tone2-Explanation.pdf pp. 15-19 (OCA in G; the Dutch in F)
    2: ("F", {"A": [2, 3, 2, 4, 3, 2], "B": [2, 1, 2, 3, 2], "C": [4, 3, 2, 3, 1], "C'": [2, 3, 4, 3, 2, 3, 1],
              "D": [3, 2, 1, 7, 1, 2], "D'": [1, 3, 2, 1, 7, 1, 2], "Final": [2, 3, 2, 1, 3, 2, 1, 2, 1, 7]}),
    # Common Chant, Tutorial-Common-Tone5-Explanation.pdf pp. 37-39 (F, as the Dutch)
    5: ("F", {"A": [2, 3, 1], "B": [3, 2], "C": [2, 7, 1, 7, 6], "Final": [3, 2, 1, 7, 1, 7, 6]}),
    # Kievan chant, Tutorial-Kievan-Tone7-Explanation.pdf pp. 57-60 (OCA in G, final on re = A;
    # the Dutch ends on D, so do = C; the melody uses do-sol only, which fits the F key signature)
    7: ("C", {"A(sol)": [4, 3, 4, 5, 4, 3], "A(sol)'": [1, 2, 3, 4, 5, 4, 3], "A(mi)": [3, 2, 3, 4, 3],
              "A(mi)'": [1, 2, 3, 2, 3, 4, 3], "B": [5, 4, 3, 2, 1], "B'": [3, 4, 5, 4, 3, 2, 1],
              "Final": [3, 4, 5, 4, 3, 4, 3, 2], "Final'": [2, 3, 4, 5, 4, 3, 4, 3, 2]}),
}

def degree(name, do):
    pc = (LET[name[0]] + name.count("#") - name.count("b") - LET[do]) % 12
    return MAJ.get(pc, f"?{pc}")

def main(tone):
    do, phrases = PHRASES[tone]
    d = cmp_oca.dutch(tone)
    measures = sorted({m for _, m in d["A"]})
    total = {"S": 0, "A": 0}
    print(f"=== tone {tone} (do = {do})")
    for m in measures:
        row = []
        for v in "SA":
            seq = []
            for n, mm in d[v]:
                if mm == m:
                    g = degree(n, do)
                    if not seq or seq[-1] != g: seq.append(g)
            name, ph = max(phrases.items(), key=lambda kv: difflib.SequenceMatcher(None, seq, kv[1]).ratio())
            r = difflib.SequenceMatcher(None, seq, ph).ratio()
            total[v] += r
            row.append(f"{v} {' '.join(map(str, seq)):<22} ~{name:<8} {r:.2f}")
        print(f" m{m:<3} " + " | ".join(row))
    print(f"  mean: soprano {total['S'] / len(measures):.2f}, alto {total['A'] / len(measures):.2f}")

if __name__ == "__main__":
    for t in sys.argv[1:]:
        main(int(t))
