#!/usr/bin/env python3
"""Colour one voice of a MuseScore score, leaving its staves as they are: the
picture of a spotlighted video, two staves with the lyrics between them,
whose sound comes from voice-explode-mscz.py's score with a staff per voice
(video-audio.py puts the two together).

usage: tools/voice-color-mscz.py --voice VOICE [--color red] [--names A,B,...]
                                 IN.mscz OUT.mscz

The voices have the names voice-explode-mscz.py gives their staves: two
staves of two voices are Soprano, Alto, Tenor, Bass, a part name such as
"Alto, Tenor" splits into one name per voice, and --names sets them all, top
to bottom. A staff with a single voice keeps its part name.

The voice's notes (heads, dots, accidentals, stems, flags, beams), rests,
slurs and ties get the colour (red, blue, green, orange or #rrggbb), as with
voice-explode-mscz.py --spotlight-color. Where another voice has the same
pitch at the same moment with the same head (a unison), MuseScore draws one
head for both, in the colour of the voice drawn last, so that voice's head
is coloured too. The lyrics stay black: they are sung by all voices of the
staff. Ledger lines can't be coloured.
"""
import argparse, importlib.util, os, sys, zipfile
import xml.etree.ElementTree as ET

sys.dont_write_bytecode = True
_spec = importlib.util.spec_from_file_location(
    "voice_explode_mscz", os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                       "voice-explode-mscz.py"))
vx = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(vx)


def voices(score, override):
    """{lower-case voice name: (staff, voice index)}, named as voice-explode-mscz.py
    names its staves."""
    parts, staves = score.findall("Part"), score.findall("Staff")
    if any(len(p.findall("Staff")) != 1 for p in parts) or len(parts) != len(staves):
        sys.exit("only parts with a single staff are supported")
    nvoices = [max([len(m.findall("voice")) for m in s.iter("Measure")] or [1]) for s in staves]
    if max(nvoices) < 2:
        sys.exit("no staff with more than one voice")
    names = iter(vx.staff_names([(p, n) for p, n in zip(parts, nvoices) if n > 1], override))
    out = {}
    for part, staff, n in zip(parts, staves, nvoices):
        for j, name in enumerate(next(names) if n > 1 else [vx.instrument_names(part)[0]]):
            out[name.lower()] = (staff, j)
    return out


def head(chord):
    """What a chord's note heads look like: two voices' notes of the same pitch with
    the same look share one head."""
    kind = chord.findtext("durationType")
    return ("black" if vx.DURATIONS.get(kind, 1) <= vx.Fraction(1, 4) else kind,
            chord.findtext("dots") or "0")


def paint_unisons(measure, j, color):
    """Colour the other voices' note heads that MuseScore draws as one with voice j's:
    whichever voice is drawn last decides the shared head's colour."""
    vs = measure.findall("voice")
    mine = {}
    for t, el in vx.timeline(vs[j])[0]:
        if el.tag == "Chord":
            mine[t] = (head(el), {n.findtext("pitch") for n in el.findall("Note")})
    for k, v in enumerate(vs):
        for t, el in vx.timeline(v)[0] if k != j else []:
            if el.tag != "Chord" or t not in mine or head(el) != mine[t][0]:
                continue
            for note in el.findall("Note"):
                if note.findtext("pitch") in mine[t][1]:
                    for part in [note] + note.findall("Accidental") + note.findall("NoteDot"):
                        vx.set_color(part, color)


def main():
    ap = argparse.ArgumentParser(description="Colour one voice of a score.")
    ap.add_argument("input")
    ap.add_argument("output")
    ap.add_argument("--voice", required=True, help="the voice to colour, e.g. alto")
    ap.add_argument("--color", default="red",
                    help="red (default), blue, green, orange or #rrggbb")
    ap.add_argument("--names", help="comma-separated names for the voices, top to bottom")
    args = ap.parse_args()
    color = vx.rgb(args.color)
    override = [n.strip() for n in args.names.split(",")] if args.names else None

    with zipfile.ZipFile(args.input) as zin:
        entries = [(i, zin.read(i.filename)) for i in zin.infolist()]
    mscx = [i.filename for i, _ in entries if i.filename.endswith(".mscx")]
    if len(mscx) != 1:
        sys.exit(f"{args.input}: expected one .mscx inside, found {len(mscx)}")
    data = dict((i.filename, d) for i, d in entries)
    root = ET.fromstring(data[mscx[0]])
    found = voices(root.find("Score"), override)
    if args.voice.lower() not in found:
        sys.exit(f"--voice: no voice {args.voice!r}; the voices are {', '.join(found)}")
    staff, j = found[args.voice.lower()]
    for m in staff.iter("Measure"):
        vs = m.findall("voice")
        if j < len(vs):
            vx.paint(vs[j], color, lyrics=False)
            paint_unisons(m, j, color)
    data[mscx[0]] = (b'<?xml version="1.0" encoding="UTF-8"?>\n'
                     + ET.tostring(root, encoding="utf-8", xml_declaration=False))
    with zipfile.ZipFile(args.output, "w", zipfile.ZIP_DEFLATED) as zout:
        for info, _ in entries:
            zout.writestr(info, data[info.filename])


if __name__ == "__main__":
    main()
