#!/usr/bin/env python3
"""Compare the OCA Common Chant "Lord, I Call" with heer_ik_roep_tN, voice by voice."""
import sys, zipfile, difflib
import xml.etree.ElementTree as ET
from fractions import Fraction as F
import ocaread
from pathlib import Path

CH = str(Path(__file__).resolve().parents[2])   # the church repository
DUR = {"whole": F(1), "half": F(1, 2), "quarter": F(1, 4), "eighth": F(1, 8)}
SP = "FCGDAEB"

def dutch(n):
    z = zipfile.ZipFile(f"{CH}/heer_ik_roep_t{n}.mscz")
    sc = ET.fromstring(z.read([m for m in z.namelist() if m.endswith(".mscx")][0])).find("Score")
    out = {}
    for si, st in enumerate(sc.findall("Staff")):
        for vi, name in enumerate(("SA", "TB")[si]):
            seq = []
            for mi, m in enumerate(st.findall("Measure")):
                vs = m.findall("voice")
                if vi >= len(vs): continue
                for c in vs[vi].findall("Chord"):
                    nt = c.find("Note"); p, t = int(nt.findtext("pitch")), int(nt.findtext("tpc"))
                    L = SP[(t - 6) % 7]; a = (t - 6) // 7 - 1
                    seq.append((L + {-1: "b", 0: "", 1: "#"}[a] + str((p - a) // 12 - 1), mi + 1))
            out[name] = seq
    return out

def collapse(seq):
    out = []
    for item in seq:
        if not out or out[-1][0] != item[0]: out.append(item)
    return out

def main(tones):
    for n in tones:
        o = ocaread.read(f"{CH}/references/heer_ik_roep/oca/t{n}-lic-obikhod-tt.pdf")
        d = dutch(n)
        print(f"=== tone {n}")
        for v in "SATB":
            a = collapse([(nm, i) for i, (nm, _) in enumerate(o[v])])
            b = collapse(d[v])
            sm = difflib.SequenceMatcher(None, [x[0] for x in a], [x[0] for x in b], autojunk=False)
            print(f"  {v}: ratio {sm.ratio():.2f}  OCA {len(a)} / Dutch {len(b)} (repeats merged)")
            for op, i1, i2, j1, j2 in sm.get_opcodes():
                if op == "equal": continue
                ms = sorted({b[j][1] for j in range(j1, j2)}) or ([b[j1][1]] if j1 < len(b) else ["end"])
                print(f"     m{','.join(map(str, ms))} {op:7s} OCA [{' '.join(x[0] for x in a[i1:i2])}]  Dutch [{' '.join(x[0] for x in b[j1:j2])}]")

if __name__ == "__main__":
    main([int(t) for t in sys.argv[1:]])
