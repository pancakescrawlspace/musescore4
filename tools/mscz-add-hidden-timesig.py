#!/usr/bin/env python3
"""Copy a MuseScore 4 .mscz, adding a hidden time signature to every measure
whose length (<Measure len="n/d">) differs from the previous one in that staff,
so MusicXML export carries <time print-object="no"> for each length change.

usage: tools/mscz-add-hidden-timesig.py in.mscz out.mscz
"""
import re
import sys
import zipfile

TIMESIG = "<TimeSig>\n<visible>0</visible>\n<sigN>{}</sigN>\n<sigD>{}</sigD>\n</TimeSig>\n"


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


def main(src, dst):
    with zipfile.ZipFile(src) as zin, zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED) as zout:
        for info in zin.infolist():
            data = zin.read(info)
            if info.filename.endswith(".mscx"):
                data = patch_mscx(data.decode("utf-8")).encode("utf-8")
            zout.writestr(info, data)


if __name__ == "__main__":
    main(*sys.argv[1:3])
