#!/usr/bin/env python3
"""Add a hidden time signature to every measure of a MuseScore 4 .mscz whose
length (<Measure len="n/d">) differs from the previous one in that staff, so
MusicXML export carries <time print-object="no"> for each length change.

The time signatures are invisible and show no courtesy signature at a line
break, so MuseScore's layout stays exactly as without them.

usage: tools/mscz-add-hidden-timesig.py score.mscz            (in place)
       tools/mscz-add-hidden-timesig.py in.mscz out.mscz
"""
import re
import sys
import zipfile

TIMESIG = ("<TimeSig>\n<visible>0</visible>\n<showCourtesySig>0</showCourtesySig>\n"
           "<sigN>{}</sigN>\n<sigD>{}</sigD>\n</TimeSig>\n")


def patch_staff(staff):
    prev = None

    def measure(m):
        nonlocal prev
        head, body = m.group(1), m.group(2)
        ln = re.search(r'len="(\d+)/(\d+)"', head)
        # without a time signature the nominal length is 4/4
        sig = ln.groups() if ln else ("4", "4")
        if sig == prev:
            return m.group(0)
        prev = sig
        ts = TIMESIG.format(*sig)
        # segment order is Clef, KeySig, TimeSig: go after a leading KeySig
        lead = body.split("<Chord>")[0].split("<Rest>")[0]
        if "</KeySig>" in lead:
            body = re.sub(r"(</KeySig>\n)", r"\1" + ts, body, count=1)
        elif re.search(r"</Clef>\n", lead):
            body = re.sub(r"(</Clef>\n)", r"\1" + ts, body, count=1)
        else:
            body = re.sub(r"(<voice>\n)", r"\1" + ts, body, count=1)
        return head + body

    return re.sub(r"(<Measure[^>]*>)(.*?</Measure>)", measure, staff, flags=re.S)


def patch_mscx(txt):
    if "<TimeSig>" in txt:
        sys.exit("score already has time signatures; not touching it")
    # one chunk per staff, so "previous length" is tracked per staff
    return "<Staff id=".join(patch_staff(c) for c in txt.split("<Staff id="))


def main(src, dst=None):
    dst = dst or src
    with zipfile.ZipFile(src) as zin:
        # patch first, so a refused score leaves no half-written dst behind
        files = [(info, zin.read(info)) for info in zin.infolist()]
        files = [(info, patch_mscx(data.decode("utf-8")).encode("utf-8") if info.filename.endswith(".mscx") else data)
                 for info, data in files]
    with zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED) as zout:
        for info, data in files:
            zout.writestr(info, data)


if __name__ == "__main__":
    main(*sys.argv[1:3])
