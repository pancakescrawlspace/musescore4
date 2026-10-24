#!/usr/bin/env python3
"""Write a unison score in square notation (Kievan, as in the Synodal chant
books) with LilyPond: the counterpart of a Znamenny score, from its MusicXML.

usage: tools/kievan-ly.py [--out-dir DIR] [--no-pdf] X.musicxml [Y.musicxml ...]

For znamenny/X.musicxml it writes znamenny/square/X.ly and runs LilyPond
on it (znamenny/square/X.pdf). Only the melody (voice 1) and its lyrics are
used: square notation is unison, so an ison, slurs, ties and articulations
are left out.

- Pitch: square notation has one clef, a C clef on the middle line, and
  its twelve-note scale G A B C D E F G A B♭ C D (docs/square_notation.md).
  A score in F major (one flat) is moved down a fourth, so that F becomes
  that C, as in the Synodal books; a score without key signature stays as
  it is. Other keys are refused, and so are notes outside the scale
  (warned about) after the move.
- Values: as in the score (whole, half, quarter, eighth, dots); the last
  note becomes the final note (two rectangles).
- The notes of one syllable are grouped close together (a Kievan
  ligature, \\[ \\], closed at a bar line), the groups separated by
  space, and the lyrics skip the melisma's other notes; each measure of the
  score (a printed line of the source) ends with a bar line (double where
  the score has one), the piece with the end-of-piece sign. LilyPond breaks the lines itself.
- Header: the title, subsubtitle (the tone), subtitle and composer of the
  score's own X.ly, and church_style.ily for the fonts.
"""
import argparse, os, re, subprocess, sys
import xml.etree.ElementTree as ET
from fractions import Fraction as F

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STEPS = "CDEFGAB"
DUR = {"whole": "1", "half": "2", "quarter": "4", "eighth": "8"}
LOW, HIGH = 7 * 3 + 4, 7 * 5 + 1   # G3 … D5 (step numbers, C4 = 28)


def notes_of(xml):
    """[(measure, step number, alter, type, dots, lyric or None, syllabic)] of voice 1, and the key."""
    root = ET.parse(xml).getroot()
    fifths = int(root.find(".//key/fifths").text)
    out, bars = [], {}
    for m in root.iter("measure"):
        style = m.findtext("barline/bar-style")
        if style: bars[m.get("number")] = style
        for n in m.findall("note"):
            if n.findtext("voice", "1") != "1" or n.find("rest") is not None or n.find("chord") is not None:
                continue
            p = n.find("pitch")
            step = 7 * int(p.findtext("octave")) + STEPS.index(p.findtext("step"))
            ly = n.find("lyric")
            text = ly.findtext("text") if ly is not None else None
            out.append(dict(measure=m.get("number"), step=step, alter=int(p.findtext("alter") or 0),
                            type=n.findtext("type"), dots=len(n.findall("dot")), text=text,
                            syllabic=ly.findtext("syllabic") if text is not None else None,
                            grace=n.find("grace") is not None))
    return out, fifths, bars


def pitch_name(step, alter):
    letter = STEPS[step % 7].lower()
    name = {("b", -1): "bes", ("e", -1): "ees", ("f", 1): "fis"}.get((letter, alter), letter)
    octave = step // 7 - 3
    return name + ("'" * octave if octave > 0 else "," * -octave)


def header(ly):
    """The header fields of the score's own .ly (title, subsubtitle, subtitle, composer)."""
    fields = {}
    if os.path.exists(ly):
        text = open(ly, encoding="utf-8").read()
        h = re.search(r"\\header\s*{(.*?)\n}", text, re.S)
        if h:
            for key in ("title", "subtitle", "subsubtitle", "composer"):
                m = re.search(rf"^\s*{key}\s*=\s*(\"[^\"]*\"|\\markup.*?$)", h.group(1), re.M)
                if m: fields[key] = m.group(1)
    return fields


def sci(step, alter):
    """E3, B♭4: a pitch for the messages."""
    return STEPS[step % 7] + {-1: "♭", 1: "♯"}.get(alter, "") + str(step // 7)


def lyric(t):
    return '"' + t.replace('"', '\\"') + '"'


def convert(xml, out_dir):
    notes, fifths, bars = notes_of(xml)
    if fifths == -1:
        shift, drop_flat = -3, True   # F major down a fourth: F → C, B♭ → F, E → B
    elif fifths == 0:
        shift, drop_flat = 0, False
    else:
        raise SystemExit(f"{xml}: key with {fifths} fifths, only F major and C major are converted")
    name = os.path.splitext(os.path.basename(xml))[0]
    music, words, measure = [], [], notes[0]["measure"]
    for i, n in enumerate(notes):
        step, alter = n["step"] + shift, n["alter"]
        letter = STEPS[step % 7]
        if drop_flat and n["alter"] == -1 and STEPS[n["step"] % 7] == "B":
            alter = 0
        # in the square-note scale B is natural below the middle C and flat above it
        if not (LOW <= step <= HIGH):
            print(f"{name}: m{n['measure']} {sci(step, alter)} lies outside the scale G3–D5", file=sys.stderr)
        if letter == "B" and ((step > 28 and alter != -1) or (step < 28 and alter != 0)):
            print(f"{name}: m{n['measure']} {sci(step, alter)}: the scale has B♮ below C4 and B♭ above",
                  file=sys.stderr)
        if letter != "B" and alter:
            print(f"{name}: m{n['measure']} {sci(step, alter)} is not in the square-note scale",
                  file=sys.stderr)
        if n["measure"] != measure:   # a double bar where the score has one
            music.append('\\bar "||"' if bars.get(measure) == "light-light" else '\\bar "|"')
            measure = n["measure"]
        last = i == len(notes) - 1
        dur = "\\longa" if last else DUR[n["type"]] + "." * n["dots"]
        tok = pitch_name(step, alter) + dur
        # a syllable's notes are grouped (a Kievan ligature), closed at a bar line; the
        # melisma's other notes get a lyric skip
        starts = n["text"] is not None
        new_measure = i > 0 and n["measure"] != notes[i - 1]["measure"]
        ends_group = last or notes[i + 1]["text"] is not None or notes[i + 1]["measure"] != n["measure"]
        opens = starts or new_measure
        if opens and not ends_group: tok += "\\["
        if not opens and ends_group: tok += "\\]"
        music.append(tok)
        if starts:
            words.append(lyric(n["text"]) + (" --" if n["syllabic"] in ("begin", "middle") else ""))
        else:
            words.append("_")
    music.append('\\bar "kievan"')
    h = header(os.path.splitext(xml)[0] + ".ly")
    hdr = "\n".join(f"  {k} = {v}" for k, v in h.items())
    body = " ".join(music)
    text = "\n".join(re.sub(r"(.{1,76})(\s+|$)", r"\1\n", body).splitlines())
    lyr = "\n".join(re.sub(r"(.{1,76})(\s+|$)", r"\1\n", " ".join(words)).splitlines())
    rel = os.path.relpath(ROOT, out_dir)
    ly = f'''\\version "2.26.0"
\\include "church_style.ily"
% generated by tools/kievan-ly.py from {os.path.relpath(xml, out_dir)}: square notation
% (Kievan, as in the Synodal chant books){", a fourth lower (F major: do on F)" if shift else ""}

\\header {{
{hdr}
}}

melody = {{
  \\clef "kievan-do" \\cadenzaOn
{text}
}}

words = \\lyricmode {{
{lyr}
}}

\\score {{
  <<
    % the square notes larger than church_style.ily's staff, the lyrics as there
    \\new KievanStaff \\with {{ \\magnifyStaff #(magstep 3) }} \\new KievanVoice = "melody" \\melody
    \\new Lyrics \\lyricsto "melody" \\words
  >>
  \\layout {{ indent = 0 }}
}}
'''
    os.makedirs(out_dir, exist_ok=True)
    path = os.path.join(out_dir, name + ".ly")
    with open(path, "w", encoding="utf-8") as f:
        f.write(ly)
    return path, rel


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--out-dir", help="default: square/ next to each score")
    ap.add_argument("--no-pdf", action="store_true", help="write the .ly only")
    ap.add_argument("scores", nargs="+", metavar="X.musicxml")
    args = ap.parse_args()
    for xml in args.scores:
        out_dir = args.out_dir or os.path.join(os.path.dirname(os.path.abspath(xml)), "square")
        path, rel = convert(xml, out_dir)
        print(f"{xml} -> {os.path.relpath(path)}")
        if not args.no_pdf:
            r = subprocess.run(["lilypond", "-s", "-I", ROOT, "-o", os.path.splitext(path)[0], path],
                               capture_output=True, text=True)
            if r.returncode:
                sys.exit(f"lilypond failed on {path}:\n{r.stderr}")


if __name__ == "__main__":
    main()
