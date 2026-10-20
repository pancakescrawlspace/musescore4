#!/usr/bin/env python3
"""Split a MuseScore score's two-voice staves into one staff per voice, as
voice-explode-ly.py does for LilyPond: Women (soprano + alto) and Men
(tenor + bass) become four staves, Soprano, Alto, Tenor, Bass, each its own
part (instrument), so each has its own mixer channel.

usage: tools/voice-explode-mscz.py [--single-lyrics] [--names A,B,...] [--tenor-bass]
                                   [--spotlight VOICE [--background-db DB]
                                    [--spotlight-color COLOR]]
                                   IN.mscz OUT.mscz

Each staff with several voices becomes one staff per voice, each in a part of
its own, copied from the original part with only that voice's channel.
Voice 1 keeps the staff's frames, line breaks, voltas and repeat counts; the
other voices get the clefs, key and time signatures and barlines, and rests
where they had nothing (a voice-2 gap, or a measure without voice 2).
Forced stem directions go; a fermata below (voice 2) turns to above, and a
voice without a fermata where another voice of its staff had one, on a note
or rest that starts at the same moment, gets a copy. Single-voice staves
stay as they are.

Names: a part name that splits on "/" or "," into one name per voice
("Alto, Tenor") is split. Otherwise two staves of two voices become Soprano,
Alto, Tenor, Bass, and anything else "Women 1", "Women 2". --names sets them
all, top to bottom. The mixer name is always set; the long and short staff
names (S., A., ...) only when the staff had them.

Lyrics: a note without lyrics gets copies of the lyrics of the first voice
in the score that has lyrics at the same moment (same measure, same
position), as voice-explode.py does for MusicXML. A syllable on a moment
where the voice holds an earlier note is lost. --single-lyrics leaves the
lyrics where they are.

The tenor (a voice named Tenor, or the upper voice of a bass-clef staff with
several voices) gets the octave treble clef; --tenor-bass keeps its clef.

--spotlight sets the mixer: every part except the named voice (e.g.
"soprano") is turned down to --background-db (default -12 dB).
--spotlight-color also colours that voice's notes (heads, dots,
accidentals, stems, flags, beams), rests, slurs, ties and lyrics.

--instrument sets the sound of every part, and --spotlight-instrument and
--background-instrument those of the spotlighted voice and the others
(both default to --instrument; without any, the sounds stay as they were).
The names are presets of the soundfont the mixer uses, MuseScore's MS Basic
("Flute", "Grand Piano", "Choir Aahs", ...), in any case.
"""
import argparse, copy, difflib, json, os, re, struct, sys, zipfile
import xml.etree.ElementTree as ET
from fractions import Fraction

DURATIONS = {"long": Fraction(4), "breve": Fraction(2), "whole": Fraction(1),
             "half": Fraction(1, 2), "quarter": Fraction(1, 4), "eighth": Fraction(1, 8),
             "16th": Fraction(1, 16), "32nd": Fraction(1, 32), "64th": Fraction(1, 64),
             "128th": Fraction(1, 128)}
CHORD_REST = {"Chord", "Rest"}
STAFF_WIDE = {"KeySig", "TimeSig", "Clef", "BarLine"}  # copied to every voice's staff
ANNOTATIONS = {"Spanner", "Fermata", "PlayCountText", "StaffText", "SystemText", "Tempo",
               "RehearsalMark", "Dynamic", "Breath", "Harmony", "Expression", "InstrumentChange",
               "Beam"}  # a beam's properties, before the chord where it starts
GRACE = {"acciaccatura", "appoggiatura", "grace4", "grace16", "grace32",
         "grace8after", "grace16after", "grace32after"}
TREBLE8 = "G8vb"
SOUNDFONT_DIRS = ["/Applications/MuseScore 4.app/Contents/Resources/sound",
                  os.path.expanduser("~/Documents/MuseScore4/SoundFonts")]


def duration(cr):
    if any(c.tag == "Tuplet" for c in cr):
        sys.exit("tuplets are not supported")
    if any(c.tag in GRACE for c in cr):
        sys.exit("grace notes are not supported")
    kind = cr.findtext("durationType")
    if kind == "measure":
        return Fraction(cr.findtext("duration"))
    if kind not in DURATIONS:
        sys.exit(f"unknown duration {kind!r}")
    dots = int(cr.findtext("dots") or 0)
    return DURATIONS[kind] * (2 - Fraction(1, 2 ** dots))


def timeline(voice):
    """(tick, element) for each element of a <voice> but <location>, and the end tick."""
    tick, out = Fraction(0), []
    for el in voice if voice is not None else []:
        if el.tag == "location":
            if el.find("measures") is not None:
                sys.exit("a <location> across measures inside a voice is not supported")
            tick += Fraction(el.findtext("fractions") or "0")
            continue
        if el.tag not in CHORD_REST | STAFF_WIDE | ANNOTATIONS:
            sys.exit(f"<{el.tag}> in a voice is not supported")
        out.append((tick, el))
        if el.tag in CHORD_REST:
            tick += duration(el)
    return out, tick


def rests(start, length, whole):
    """(tick, Rest) filling [start, start + length); whole is the measure length as
    written ("4/4", not "1"), for a measure rest."""
    def rest(kind, dur=None):
        r = ET.Element("Rest")
        ET.SubElement(r, "durationType").text = kind
        if dur is not None:
            ET.SubElement(r, "duration").text = str(dur)
        return r
    if whole:
        return [(start, rest("measure", whole))]
    out = []
    for kind, d in DURATIONS.items():
        while length >= d and kind not in ("long", "breve"):
            out.append((start, rest(kind)))
            start, length = start + d, length - d
    if length:
        sys.exit(f"can't fill a gap of {length} with rests")
    return out


def strip_eids(el):
    for parent in el.iter():
        for c in parent.findall("eid"):
            parent.remove(c)


def tidy(el, tenor):
    """Remove the two-voice layout from a copied voice."""
    for parent in el.iter():
        for c in parent.findall("StemDirection"):
            parent.remove(c)
    for f in el.iter("Fermata"):
        sub = f.find("subtype")
        if sub is not None and sub.text and sub.text.endswith("Below"):
            sub.text = sub.text[:-len("Below")] + "Above"
    if tenor:
        for clef in el.iter("Clef"):
            for c in clef:
                if c.tag in ("concertClefType", "transposingClefType"):
                    c.text = TREBLE8


def add_lyrics(chord, lyrics):
    at = next((i for i, c in enumerate(chord) if c.tag in ("Spanner", "Note")), len(chord))
    for ly in reversed(lyrics):
        new = copy.deepcopy(ly)
        strip_eids(new)
        chord.insert(at, new)


def explode_staff(staff, j, nvoices, lyric_at, tenor):
    """The staff for voice j of a score-level <Staff>."""
    new = ET.Element("Staff", staff.attrib)
    new.text, new.tail = staff.text, staff.tail
    mi, sig = -1, None
    for child in staff:
        if child.tag != "Measure":
            if j == 0:
                new.append(copy.deepcopy(child))  # the title frame
            continue
        mi += 1
        voices = child.findall("voice")
        measure = ET.Element("Measure", child.attrib)
        measure.text, measure.tail = child.text, child.tail
        for c in child:
            if c.tag != "voice" and (j == 0 or c.tag != "LayoutBreak"):
                measure.append(copy.deepcopy(c))
        first, end = timeline(voices[0] if voices else None)
        for _, el in first:
            if el.tag == "TimeSig":
                sig = f'{el.findtext("sigN")}/{el.findtext("sigD")}'
        written = child.get("len") or sig
        if written is None or Fraction(written) != end:
            written = f"{end.numerator}/{end.denominator}"
        mine, _ = timeline(voices[j] if j < len(voices) else None)
        items = [(t, 0, copy.deepcopy(el)) for t, el in first if j > 0 and el.tag in STAFF_WIDE]
        items += [(t, 1, copy.deepcopy(el)) for t, el in mine
                  if j == 0 or el.tag not in STAFF_WIDE]
        # rests in the gaps
        tick, starts = Fraction(0), set()
        for t, el in mine:
            if el.tag in CHORD_REST:
                if t < tick:
                    sys.exit(f"measure {mi + 1}, voice {j + 1}: notes overlap")
                if t > tick:
                    items += [(s, 1, r) for s, r in rests(tick, t - tick, None)]
                starts.add(t)
                tick = t + duration(el)
        if tick < end:
            items += [(s, 1, r) for s, r in rests(tick, end - tick, None if starts else written)]
        # fermatas of the other voices, at moments where this voice starts something
        have = {t for t, el in mine if el.tag == "Fermata"}
        for k, v in enumerate(voices):
            if k == j:
                continue
            for t, el in timeline(v)[0]:
                if el.tag == "Fermata" and t in starts and t not in have:
                    items.append((t, 0.5, copy.deepcopy(el)))  # before its note
                    have.add(t)
        items.sort(key=lambda i: (i[0], i[1]))
        voice = ET.SubElement(measure, "voice")
        for t, _, el in items:
            if el.tag == "Chord" and el.find("Lyrics") is None and lyric_at:
                add_lyrics(el, lyric_at.get((mi, t), []))
            voice.append(el)
        tidy(voice, tenor)
        new.append(measure)
    if j > 0:
        strip_eids(new)
    return new


def instrument_names(part):
    inst = part.find("Instrument")
    long = inst.findtext("longName")
    return long or part.findtext("trackName") or "", long is not None, inst.find("shortName") is not None


def staff_names(exploded, override):
    """New (name, has long name, has short name) per voice, staff by staff: only for
    the exploded staves, a list of names each."""
    splits = []
    for part, n in exploded:
        name = instrument_names(part)[0]
        parts = re.split(r"\s*[/,]\s*", name) if name else []
        splits.append(parts if len(parts) == n else None)
    satb = [n for _, n in exploded] == [2, 2] and splits == [None, None]
    names = []
    for i, (part, n) in enumerate(exploded):
        name = instrument_names(part)[0]
        if satb:
            names.append(["Soprano", "Alto", "Tenor", "Bass"][2 * i:2 * i + 2])
        elif splits[i]:
            names.append(splits[i])
        else:
            names.append([f"{name} {j + 1}" if name else f"Voice {j + 1}" for j in range(n)])
    if override:
        total = sum(len(n) for n in names)
        if len(override) != total:
            sys.exit(f"--names: {total} exploded staves, {len(override)} names given")
        it = iter(override)
        names = [[next(it) for _ in n] for n in names]
    return names


def set_child(parent, tag, text, before=None):
    el = parent.find(tag)
    if el is None:
        el = ET.Element(tag)
        at = next((i for i, c in enumerate(parent) if c.tag == before), len(parent))
        parent.insert(at, el)
    el.text = text


def explode(root, single_lyrics, override, tenor_treble8):
    score = root.find("Score")
    parts, staves = score.findall("Part"), score.findall("Staff")
    if any(len(p.findall("Staff")) != 1 for p in parts):
        sys.exit("only parts with a single staff are supported")
    if len(parts) != len(staves):
        sys.exit(f"{len(parts)} parts but {len(staves)} staves")
    nvoices = [max([len(m.findall("voice")) for m in s.iter("Measure")] or [1]) for s in staves]
    if max(nvoices) < 2:
        sys.exit("no staff with more than one voice")

    # lyrics of the first voice in the score that has any at (measure, tick)
    lyric_at = {}
    for s in staves if not single_lyrics else []:
        for mi, m in enumerate(s.iter("Measure")):
            for v in m.findall("voice"):
                for t, el in timeline(v)[0]:
                    if el.tag == "Chord" and el.find("Lyrics") is not None:
                        lyric_at.setdefault((mi, t), el.findall("Lyrics"))

    exploded = [(p, n) for p, n in zip(parts, nvoices) if n > 1]
    names = iter(staff_names(exploded, override))
    new_parts, new_staves, part_map, first_new = [], [], {}, []
    for part, staff, n in zip(parts, staves, nvoices):
        first_new.append(len(new_staves))
        old_id = part.get("id")
        if n == 1:
            new_parts.append(part)
            new_staves.append(staff)
            part_map[old_id] = [part]
            continue
        voice_names = next(names)
        _, has_long, has_short = instrument_names(part)
        bass = (part.find("Staff").findtext("defaultClef") or "").startswith("F")
        part_map[old_id] = []
        for j in range(n):
            name = voice_names[j]
            tenor = tenor_treble8 and (name.lower() == "tenor" or (j == 0 and bass))
            p = copy.deepcopy(part)
            if j > 0:
                strip_eids(p)
                for b in p.find("Staff").findall("bracket"):
                    p.find("Staff").remove(b)
            p.find("trackName").text = name
            inst = p.find("Instrument")
            set_child(inst, "trackName", name)
            if has_long:
                set_child(inst, "longName", name)
            if has_short:
                set_child(inst, "shortName", f"{name[0]}." if name else "")
            channels = inst.findall("Channel")
            if len(channels) == n:
                for k, c in enumerate(channels):
                    if k != j:
                        inst.remove(c)
            if tenor:
                set_child(p.find("Staff"), "defaultClef", TREBLE8)
                set_child(inst, "clef", TREBLE8, before="Channel")
            new_parts.append(p)
            new_staves.append(explode_staff(staff, j, n, lyric_at, tenor))
            part_map[old_id].append(p)
    first_new.append(len(new_staves))

    # brackets span the copies of the staves they spanned
    for i in range(len(parts)):
        for b in new_parts[first_new[i]].find("Staff").findall("bracket"):
            span = int(b.get("span", "1"))
            b.set("span", str(first_new[min(i + span, len(parts))] - first_new[i]))

    # replace parts and staves in place, renumbered
    at = list(score).index(parts[0])
    for el in parts + staves:
        score.remove(el)
    for k, el in enumerate(new_parts + new_staves):
        score.insert(at + k, el)
    old_ids = {}
    for k, p in enumerate(new_parts):
        old_ids[str(k + 1)] = next(o for o, ps in part_map.items() if p in ps)
        p.set("id", str(k + 1))
    for k, s in enumerate(new_staves):
        s.set("id", str(k + 1))
    return new_parts, old_ids


def rgb(color):
    """(r, g, b) of a colour name or #rrggbb."""
    named = {"red": "#ff0000", "blue": "#0000ff", "green": "#008000", "orange": "#ff8000"}
    m = re.fullmatch(r"#?([0-9a-f]{6})", named.get(color.lower(), color.lower()))
    if m is None:
        sys.exit(f"--spotlight-color: {color!r} is not one of {', '.join(named)} or #rrggbb")
    return tuple(int(m.group(1)[k:k + 2], 16) for k in (0, 2, 4))


def set_color(el, color):
    """Give an element a colour, written as MuseScore writes it, after its eid."""
    c = el.find("color")
    if c is None:
        c = ET.Element("color")
        el.insert(next((i + 1 for i, x in enumerate(el) if x.tag == "eid"), 0), c)
    c.attrib = dict(zip("rgba", map(str, (*color, 255))))


def paint(staff, color):
    """Colour a staff's notes (heads, dots, accidentals, stems, flags, beams), rests,
    slurs, ties and lyrics; ledger lines, clefs and the rest stay black."""
    for chord in staff.iter("Chord"):
        for tag in ("Stem", "Hook"):
            if tag == "Hook" and (DURATIONS.get(chord.findtext("durationType"), 1) > Fraction(1, 8)):
                continue
            if chord.find(tag) is None:
                at = next((i for i, c in enumerate(chord) if c.tag == "Note"), len(chord))
                chord.insert(at, ET.Element(tag))
            set_color(chord.find(tag), color)
    for cr in staff.iter():
        if cr.tag not in CHORD_REST:
            continue
        for dotted in cr.findall("Note") if cr.tag == "Chord" else [cr]:
            dots = dotted.findall("NoteDot")
            for _ in range(int(cr.findtext("dots") or 0) - len(dots)):
                dotted.append(ET.Element("NoteDot"))
            for dot in dotted.findall("NoteDot"):
                set_color(dot, color)
    for el in staff.iter():
        if el.tag in ("Note", "Rest", "Accidental", "Lyrics", "Beam", "Slur", "Tie"):
            set_color(el, color)


def presets(name):
    """{lower-case preset name: (bank, program, name)} of the soundfont the mixer calls name."""
    path = next((p for d in SOUNDFONT_DIRS for ext in (".sf3", ".sf2")
                 if os.path.exists(p := os.path.join(d, name + ext))), None)
    if path is None:
        sys.exit(f"soundfont {name!r} not found in {', '.join(SOUNDFONT_DIRS)}")
    data = open(path, "rb").read()

    def chunks(start, end):
        while start + 8 <= end:
            cid, size = data[start:start + 4], struct.unpack("<I", data[start + 4:start + 8])[0]
            yield cid, start + 8, size
            start += 8 + size + size % 2
    found = {}
    for cid, at, size in chunks(12, len(data)):
        if cid == b"LIST" and data[at:at + 4] == b"pdta":
            for sub, sat, ssize in chunks(at + 4, at + size):
                if sub == b"phdr":
                    for k in range(sat, sat + ssize - 38, 38):  # the last record is EOP
                        pname = data[k:k + 20].split(b"\0")[0].decode("latin-1").strip()
                        program, bank = struct.unpack("<HH", data[k + 20:k + 24])
                        found.setdefault(pname.lower(), (bank, program, pname))
    return found


def set_sound(track, preset):
    """Point a mixer track at a preset of its soundfont."""
    meta = track.get("in", {}).get("resourceMeta", {})
    attrs = meta.get("attributes", {})
    if meta.get("type") != "fluid_soundfont" or "soundFontName" not in attrs:
        sys.exit(f"part {track.get('partId')}: its sound isn't a soundfont, can't set {preset!r}")
    font = attrs["soundFontName"]
    known = presets(font)
    if preset.lower() not in known:
        close = difflib.get_close_matches(preset.lower(), known, n=5, cutoff=0.4)
        sys.exit(f"{font} has no preset {preset!r}"
                 + (f"; did you mean {', '.join(known[c][2] for c in close)}?" if close else ""))
    bank, program, name = known[preset.lower()]
    attrs.update(presetBank=str(bank), presetProgram=str(program), presetName=name)
    meta["id"] = f"{font}\\{bank}\\{program}"


def audio_settings(text, new_parts, old_ids, spotlight, background_db, sounds=(None, None)):
    """audiosettings.json with a mixer track per new part, copied from the old part's;
    sounds are the presets for the spotlighted part and the others (None: unchanged)."""
    settings = json.loads(text)
    tracks = {t.get("partId"): t for t in settings.get("tracks", [])}
    out = []
    for p in new_parts:
        track = tracks.get(old_ids[p.get("id")])
        if track is None:
            if not (spotlight or any(sounds)):
                continue
            # a score saved by the command line has no mixer tracks: MuseScore's default one
            track = {"in": {"resourceMeta": {"attributes": {"playbackSetupData": "last.last.last",
                                                            "soundFontName": "MS Basic"},
                                             "hasNativeEditorSupport": False, "id": "MS Basic",
                                             "type": "fluid_soundfont", "vendor": "Fluid"},
                            "unitConfiguration": {}},
                     "instrumentId": p.find("Instrument").get("id"),
                     "out": {"balance": 0, "fxChain": {}, "volumeDb": 0}}
        track = copy.deepcopy(track)
        track["partId"] = p.get("id")
        background = spotlight and p.findtext("trackName").lower() != spotlight.lower()
        if background:
            track.setdefault("out", {})["volumeDb"] = background_db
        if sounds[bool(background)]:
            set_sound(track, sounds[bool(background)])
        out.append(track)
    out += [t for t in settings.get("tracks", []) if t.get("partId") not in old_ids.values()]
    settings["tracks"] = out
    return json.dumps(settings, indent=4)


def main():
    ap = argparse.ArgumentParser(description="Split two-voice staves into one staff per voice.")
    ap.add_argument("input")
    ap.add_argument("output")
    ap.add_argument("--single-lyrics", action="store_true",
                    help="leave the lyrics under the voices that have them")
    ap.add_argument("--names", help="comma-separated names for the new staves, top to bottom")
    ap.add_argument("--tenor-bass", action="store_true",
                    help="keep the tenor's clef instead of the octave treble clef")
    ap.add_argument("--spotlight", metavar="VOICE",
                    help="turn every other part down in the mixer, e.g. soprano")
    ap.add_argument("--background-db", type=float, default=-12.0,
                    help="mixer volume of the other parts with --spotlight (default -12)")
    ap.add_argument("--spotlight-color", metavar="COLOR",
                    help="colour of the spotlighted voice's notes and lyrics: red, blue, "
                         "green, orange or #rrggbb")
    ap.add_argument("--instrument", metavar="PRESET",
                    help='sound of every part, a soundfont preset such as "Grand Piano"')
    ap.add_argument("--spotlight-instrument", metavar="PRESET",
                    help="sound of the spotlighted part (default: --instrument)")
    ap.add_argument("--background-instrument", metavar="PRESET",
                    help="sound of the other parts with --spotlight (default: --instrument)")
    args = ap.parse_args()
    sounds = (args.spotlight_instrument or args.instrument,
              args.background_instrument or args.instrument)
    if not args.spotlight and (args.spotlight_instrument or args.background_instrument
                               or args.spotlight_color):
        sys.exit("--spotlight-instrument, --background-instrument and --spotlight-color "
                 "need --spotlight")
    override = [n.strip() for n in args.names.split(",")] if args.names else None

    with zipfile.ZipFile(args.input) as zin:
        entries = [(i, zin.read(i.filename)) for i in zin.infolist()]
    mscx = [i.filename for i, _ in entries if i.filename.endswith(".mscx")]
    if len(mscx) != 1:
        sys.exit(f"{args.input}: expected one .mscx inside, found {len(mscx)}")
    data = dict((i.filename, d) for i, d in entries)
    root = ET.fromstring(data[mscx[0]])
    new_parts, old_ids = explode(root, args.single_lyrics, override, not args.tenor_bass)
    names = [p.findtext("trackName").lower() for p in new_parts]
    if args.spotlight and args.spotlight.lower() not in names:
        sys.exit(f"--spotlight: no part {args.spotlight!r}; the parts are {', '.join(names)}")
    if args.spotlight_color:
        color = rgb(args.spotlight_color)
        staves = root.find("Score").findall("Staff")
        paint(staves[names.index(args.spotlight.lower())], color)
    data[mscx[0]] = (b'<?xml version="1.0" encoding="UTF-8"?>\n'
                     + ET.tostring(root, encoding="utf-8", xml_declaration=False))
    if "audiosettings.json" in data:
        data["audiosettings.json"] = audio_settings(
            data["audiosettings.json"].decode("utf-8"), new_parts, old_ids,
            args.spotlight, args.background_db, sounds).encode("utf-8")
    elif args.spotlight or any(sounds):
        sys.exit("--spotlight, --instrument: the score has no audiosettings.json")
    with zipfile.ZipFile(args.output, "w", zipfile.ZIP_DEFLATED) as zout:
        for info, _ in entries:
            zout.writestr(info, data[info.filename])


if __name__ == "__main__":
    main()
