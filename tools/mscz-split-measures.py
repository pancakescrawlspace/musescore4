#!/usr/bin/env python3
"""Split measures of a church score, as MuseScore's "Split measure before selected note" does,
so that a line can break inside a long free-meter measure; optionally set the line breaks.

usage: tools/mscz-split-measures.py SCORE.mscz [M:K ...] [--line-breaks SPEC]

M:K splits measure M before its K-th note (both counted from 1, the note in
the soprano: voice 1 of the top staff). M is the measure number as MuseScore
shows it, so the halves of an earlier split don't count. The split is made on
all staves at the same moment (every voice needs a note starting there), and
refused if a slur crosses it. The two halves get:

- an invisible barline between them (MusicXML bar-style none, LilyPond \\bar "");
- hidden time signatures for their lengths (and the following measure one for
  its own length, if it had none);
- "Exclude from measure count" on the second half, so the measure numbers stay
  as they were (tools/rebuild-score.py does the same in LilyPond).

--line-breaks SPEC replaces all line breaks of the score: SPEC lists, comma-
separated, the measures after which a line breaks, as MuseScore numbers them;
"4a" is the first half of a split measure 4 (the break at the split). For
example "2,4a,6,8a,9". Without it the line breaks stay as they are.

The score is changed in place. Afterwards: tools/rebuild-score.py SCORE.
"""
import copy, re, sys, zipfile
from fractions import Fraction as F
import xml.etree.ElementTree as ET

DUR = {"breve": F(2), "whole": F(1), "half": F(1, 2), "quarter": F(1, 4), "eighth": F(1, 8),
       "16th": F(1, 16), "32nd": F(1, 32)}


def length(el):
    if el.tag not in ("Chord", "Rest"):
        return F(0)
    d = DUR[el.findtext("durationType")] if el.findtext("durationType") != "measure" \
        else F(el.findtext("duration"))
    dots = int(el.findtext("dots") or 0)
    return d * (2 - F(1, 2 ** dots))


def numbered(staff):
    """Measures of a staff with the number MuseScore shows (irregular ones share the previous one)."""
    out, n = [], 0
    for m in staff.findall("Measure"):
        if m.findtext("irregular") != "1":
            n += 1
        out.append((n, m))
    return out


def timesig(n, d):
    ts = ET.Element("TimeSig")
    for tag, val in (("visible", "0"), ("showCourtesySig", "0"), ("sigN", str(n)), ("sigD", str(d))):
        ET.SubElement(ts, tag).text = val
    return ts


def measure_len(meas, sig):
    return F(meas.get("len")) if meas.get("len") else sig


def slur_reach(el, t):
    """For a chord starting at t: the moment its slurs (starting here) end, or None."""
    out = None
    for sp in el.findall("Spanner"):
        if sp.get("type") != "Slur" or sp.find("next") is None:
            continue
        loc = sp.find("next/location")
        if loc is None:
            continue
        if loc.findtext("measures"):
            return F(10 ** 6)               # ends in a later measure
        out = max(out or t, t + F(loc.findtext("fractions") or "0"))
    return out


def split(staff, number, k_note, at=None):
    """Split the measure shown as `number` on this staff; returns the split moment."""
    meas_list = numbered(staff)
    cands = [m for n, m in meas_list if n == number and m.findtext("irregular") != "1"]
    if not cands:
        raise SystemExit(f"no measure {number}")
    meas = cands[0]
    # the time signature in force and the following measure
    sig, measures = None, staff.findall("Measure")
    for m in measures:
        ts = m.find("voice/TimeSig")
        if ts is not None:
            sig = F(int(ts.findtext("sigN")), int(ts.findtext("sigD")))
        if m is meas:
            break
    total = measure_len(meas, sig)
    if at is None:
        chords = [c for c in meas.find("voice") if c.tag in ("Chord", "Rest")]
        if not 1 < k_note <= len(chords):
            raise SystemExit(f"measure {number} has {len(chords)} notes in the soprano; can't split before note {k_note}")
        at = sum(length(c) for c in chords[:k_note - 1])
    a, b = ET.Element("Measure"), ET.Element("Measure")
    for el in list(meas):
        if el.tag == "voice":
            va, vb = ET.SubElement(a, "voice"), ET.SubElement(b, "voice")
            t, pending = F(0), []
            for c in list(el):
                if c.tag == "TimeSig":
                    continue
                if c.tag not in ("Chord", "Rest"):
                    pending.append(c); continue
                target = va if t < at else vb
                if t < at:
                    reach = slur_reach(c, t)
                    if reach is not None and reach > at:
                        raise SystemExit(f"measure {number}: a slur crosses the split")
                for p in pending: target.append(p)
                pending = []
                target.append(c)
                t += length(c)
                if t > at and target is va:
                    raise SystemExit(f"measure {number}: a note in staff {staff.get('id')} "
                                     f"sounds across the split")
            for p in pending: vb.append(p)    # end barline and the like stay at the end
        elif el.tag in ("LayoutBreak",):
            b.append(el)
        elif el.tag != "eid":
            a.append(copy.deepcopy(el)); b.append(el)
    na, nb = at, total - at
    quarters = lambda x: f"{int(x * 4)}/4" if (x * 4).denominator == 1 else str(x)
    a.set("len", quarters(na)); b.set("len", quarters(nb))
    a.find("voice").insert(0, timesig(*map(int, a.get("len").split("/"))))
    b.find("voice").insert(0, timesig(*map(int, b.get("len").split("/"))))
    for v in a.findall("voice"):
        bl = ET.SubElement(v, "BarLine")
        ET.SubElement(bl, "subtype").text = "normal"
        ET.SubElement(bl, "visible").text = "0"
    irr = ET.Element("irregular"); irr.text = "1"
    b.insert(0, irr)
    # the following measure keeps its length: give it a time signature if it relied on this one
    idx = list(staff).index(meas)
    nxt = measures[measures.index(meas) + 1] if measures.index(meas) + 1 < len(measures) else None
    if nxt is not None and nxt.find("voice/TimeSig") is None:
        q = total * 4
        nxt.find("voice").insert(0, timesig(q.numerator, 4) if q.denominator == 1
                                 else timesig(total.numerator, total.denominator))
    staff.remove(meas)
    staff.insert(idx, b)
    staff.insert(idx, a)
    return at


def set_breaks(staff, spec):
    targets = set()
    for item in spec.split(","):
        item = item.strip()
        if not item: continue
        mm = re.fullmatch(r"(\d+)(a?)", item)
        if not mm: raise SystemExit(f"bad line break {item!r}")
        targets.add((int(mm.group(1)), bool(mm.group(2))))
    meas_list = numbered(staff)
    found = set()
    for i, (n, m) in enumerate(meas_list):
        for lb in m.findall("LayoutBreak"):
            if lb.findtext("subtype") == "line":
                m.remove(lb)
        nxt_irregular = i + 1 < len(meas_list) and meas_list[i + 1][1].findtext("irregular") == "1"
        is_first_half = nxt_irregular and m.findtext("irregular") != "1"
        last_of_number = not nxt_irregular
        if ((n, True) in targets and is_first_half) or ((n, False) in targets and last_of_number):
            lb = ET.Element("LayoutBreak"); ET.SubElement(lb, "subtype").text = "line"
            m.insert(0, lb)
            found.add((n, is_first_half and (n, True) in targets))
    missing = targets - found
    if missing:
        raise SystemExit(f"line breaks not placed: {sorted(missing)} (no such measure or split)")


def main(args):
    if not args or not args[0].endswith(".mscz"):
        sys.exit(__doc__.split("\n\n")[1])
    path, splits, spec = args[0], [], None
    rest = args[1:]
    while rest:
        a = rest.pop(0)
        if a == "--line-breaks":
            spec = rest.pop(0)
        else:
            mm = re.fullmatch(r"(\d+):(\d+)", a)
            if not mm: raise SystemExit(f"bad split {a!r} (expected M:K)")
            splits.append((int(mm.group(1)), int(mm.group(2))))
    z = zipfile.ZipFile(path)
    name = [n for n in z.namelist() if n.endswith(".mscx")][0]
    root = ET.fromstring(z.read(name))
    staves = root.find("Score").findall("Staff")
    for number, k in sorted(splits, reverse=True):
        at = split(staves[0], number, k)
        for st in staves[1:]:
            split(st, number, None, at)
        print(f"  measure {number} split before soprano note {k} (after {at} of a whole)")
    if spec is not None:
        for st in staves:
            set_breaks(st, spec)
        print(f"  line breaks after {spec}")
    data = '<?xml version="1.0" encoding="UTF-8"?>\n' + ET.tostring(root, encoding="unicode")
    items = [(it, z.read(it.filename)) for it in z.infolist()]
    z.close()
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as out:
        for it, raw in items:
            out.writestr(it, data.encode() if it.filename == name else raw)


if __name__ == "__main__":
    main(sys.argv[1:])
