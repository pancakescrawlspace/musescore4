#!/usr/bin/env python3
"""Compare "In waarheid" («Достойно есть») of the Dutch liturgy with the Kievan-chant «Достойно есть»
(azbyka.ru) and with Feofan's Eucharistic Canon (19a), voice by voice: pitch classes, repeats merged.
"runs >= N" is the share of the Dutch notes that lie in a run of N or more notes found anywhere in the
reference (order of the runs free: the chant repeats a few lines in an order set by the text);
"covers" the share found in the same order. The Dutch voices come from the liturgy's LilyPond files.
usage: cmp_waarheid.py [STUKKEN_DIR [PDF]]   (default: ~/dev/liturgie/ly/stukken, the azbyka.ru PDF)"""
import sys, re, difflib
from pathlib import Path
import ocaread, cmp_oca
from cmp_smirnov import NAMES, pc

STUKKEN = Path.home() / "dev/liturgie/ly/stukken"
PDF = f"{cmp_oca.CH}/references/dostojno_est/azbyka_kievan.pdf"
TOK = re.compile(r"^([a-g])((?:is|es)*|s)?[',]*(\d+\.*)?[()\[\]~]*$")
LY = {"c": 0, "d": 2, "e": 4, "f": 5, "g": 7, "a": 9, "b": 11}

def ly_voice(path, var):
    """Pitch classes of a voice variable (absolute notes, Dutch note names) in a LilyPond file."""
    body = re.search(var + r" = \{(.*?)\n\}", Path(path).read_text(), re.S).group(1)
    body = re.sub(r'"[^"]*"', "", re.sub(r"%.*", "", body))
    out = []
    for t in body.split():
        m = TOK.match(t)
        if m:
            acc = m.group(2) or ""
            out.append((LY[m.group(1)] + acc.count("is") - acc.count("es") - (acc == "s")) % 12)
    return out

def merge(seq):
    out = []
    for x in seq:
        if not out or out[-1] != x: out.append(x)
    return out

def runs(a, b, n):
    covered = [False] * len(a)
    for i in range(len(a)):
        for j in range(len(b)):
            k = 0
            while i + k < len(a) and j + k < len(b) and a[i + k] == b[j + k]: k += 1
            if k >= n: covered[i:i + k] = [True] * k
    return sum(covered) / len(a)

def report(name, d, r):
    sm = difflib.SequenceMatcher(None, d, r, autojunk=False)
    cov = sum(b.size for b in sm.get_matching_blocks()) / len(d)
    print(f"  {name:8s} runs>=4 {runs(d, r, 4):.2f}  >=6 {runs(d, r, 6):.2f}  >=8 {runs(d, r, 8):.2f}"
          f"  covers {cov:.2f}  match {sm.ratio():.2f}  (Dutch {len(d)}, ref {len(r)})")

def main(stukken, pdf):
    kiev = ocaread.read(pdf)
    waar = {v: merge(ly_voice(stukken / "20-in-waarheid.ily", lv))
            for v, lv in zip("SATB", ("sopraan", "alt", "tenor", "bas"))}
    # ocaread reads the soprano's D natural in «истину» as D#; the alto's D#s are real leading notes
    ref = {v: merge([2 if (v == "S" and pc(n) == 3) else pc(n) for n, _ in kiev[v]]) for v in "SATB"}
    print("In waarheid against the Kievan «Достойно есть»:")
    for v in "SATB": report(v, waar[v], ref[v])
    canon = merge(ly_voice(stukken / "19a-eucharistische-kanon.ily", "sopraan"))
    print("Sopranos against Feofan's canon (19a):")
    report("waarheid", waar["S"], canon)
    report("Kievan", ref["S"], canon)
    print("In waarheid S:", " ".join(NAMES[x] for x in waar["S"]))
    print("Kievan S:     ", " ".join(NAMES[x] for x in ref["S"]))

if __name__ == "__main__":
    main(Path(sys.argv[1]) if len(sys.argv) > 1 else STUKKEN, sys.argv[2] if len(sys.argv) > 2 else PDF)
