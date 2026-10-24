#!/usr/bin/env python3
"""Set the sound and mixer volume of every part of a MuseScore score, without
changing its staves: for scores voice-explode-mscz.py refuses (no staff with
two voices), such as the unison Znamenny scores, whose videos play piano.

usage: tools/mscz-set-sound.py --instrument PRESET [--volume-db DB] IN.mscz [OUT.mscz]

PRESET is a preset of the soundfont in the mixer, MuseScore's MS Basic
("Grand Piano", "Flute", ...), or of another soundfont in
~/Documents/MuseScore4/SoundFonts named before it, as in
"Arachno-SoundFont-1.0:Grand Piano". The names are checked as by
voice-explode-mscz.py, whose code this uses. Without OUT the score is
changed in place.
"""
import argparse, importlib.util, os, shutil, sys, tempfile, zipfile
import xml.etree.ElementTree as ET

sys.dont_write_bytecode = True
_spec = importlib.util.spec_from_file_location(
    "voice_explode_mscz", os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                       "voice-explode-mscz.py"))
vx = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(vx)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--instrument", required=True, metavar="PRESET",
                    help='sound of every part, e.g. "Arachno-SoundFont-1.0:Grand Piano"')
    ap.add_argument("--volume-db", type=float, help="mixer volume of every part (default: unchanged)")
    ap.add_argument("input")
    ap.add_argument("output", nargs="?")
    args = ap.parse_args()

    with zipfile.ZipFile(args.input) as z:
        items = [(i, z.read(i.filename)) for i in z.infolist()]
    data = {i.filename: d for i, d in items}
    mscx = [n for n in data if n.endswith(".mscx")]
    if len(mscx) != 1:
        sys.exit(f"{args.input}: expected one .mscx inside, found {len(mscx)}")
    parts = ET.fromstring(data[mscx[0]]).find("Score").findall("Part")
    ids = {p.get("id"): p.get("id") for p in parts}
    text = data.get("audiosettings.json", b'{"tracks": []}').decode()
    settings = vx.audio_settings(text, parts, ids, None, 0, sounds=(args.instrument, args.instrument),
                                 volume_db=args.volume_db)

    fd, tmp = tempfile.mkstemp(suffix=".mscz", dir=os.path.dirname(os.path.abspath(args.output or args.input)))
    os.close(fd)
    with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as z:
        for info, d in items:
            z.writestr(info, settings.encode() if info.filename == "audiosettings.json" else d)
        if "audiosettings.json" not in data:
            z.writestr("audiosettings.json", settings)
    shutil.move(tmp, args.output or args.input)
    print(f"{args.input} -> {args.output or args.input}: {args.instrument}"
          + (f", {args.volume_db:+g} dB" if args.volume_db is not None else ""))


if __name__ == "__main__":
    main()
