#!/usr/bin/env python3
"""Transcribe a unison chant score from its vector PDF into a MuseScore score
in the house style: the scores in znamenny/ from azbyka.ru's PDFs.

usage: tools/transcribe-pdf/transcribe.py [--show] [--musicxml DIR] NAME [NAME ...]

NAME is a score in tools/transcribe-pdf/scores/: NAME.json with the PDF and
the editorial choices, and for a score entered by hand also NAME.py (see
ison_score.py). The steps:

1. the PDF is read (pdf_notes.py) and turned into MusicXML (notes_musicxml.py),
   or the hand-entered score is written as MusicXML (ison_score.py);
2. MuseScore imports it with score_style.mss (the house style: Arial 14
   lyrics, minimum distance 1.3), which writes znamenny/NAME.mscz;
3. the title frame gets the tone as the title's second line (the LilyPond
   subsubtitle) and the composer text, the part its empty name;
4. mscz-add-hidden-timesig.py adds the hidden time signatures.

Then build the outputs with tools/rebuild-score.py znamenny/NAME, and
compare them with the source by eye. An existing znamenny/NAME.mscz is
replaced, hand edits and all.

--show prints the reading (notes with slurs and syllables per system, and
the lyrics) instead; --musicxml DIR writes only the MusicXML to DIR/NAME.musicxml.

The JSON keys: pdf (relative to the repository root), title, sub (the
title's second line), composer_frame (the composer text; default
«Знаменный распев», lines separated by <br/>), caps (words written with a
capital), caps_next ({word: next word}: a capital only before that word),
fix ([text as printed, occurrence, new text]), insert ([system, note,
text, hyphen after], 1-based), pin (syllables not moved to the first note
of their slur), hand (true: the notes are in NAME.py).
"""
import argparse, importlib, json, os, re, subprocess, sys, tempfile, zipfile

sys.dont_write_bytecode = True
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, HERE)
import pdf_notes, notes_musicxml, ison_score

MSCORE = "/Applications/MuseScore 4.app/Contents/MacOS/mscore"


def load(name):
    with open(os.path.join(HERE, "scores", name + ".json"), encoding="utf-8") as f:
        return json.load(f)


def to_musicxml(name, cfg, show=False):
    if cfg.get("hand"):
        sc = importlib.import_module("scores." + name)
        return ison_score.musicxml(sc)
    systems = pdf_notes.read(os.path.join(ROOT, cfg["pdf"]))
    notes, syls = notes_musicxml.lyrics(systems, cfg)
    if show:
        pdf_notes.show(systems)
        print(notes_musicxml.text_view(syls))
    print(f"{name}: {len(notes)} notes, {len(syls)} syllables, {sum(s['mel'] for s in syls)} melismas",
          file=sys.stderr)
    return notes_musicxml.musicxml(systems, notes, syls, cfg["title"], "Знаменный распев")


def make_mscz(name, cfg, xml):
    out = os.path.join(ROOT, "znamenny", name + ".mscz")
    with tempfile.TemporaryDirectory() as tmp:
        src, mscz = os.path.join(tmp, name + ".musicxml"), os.path.join(tmp, name + ".mscz")
        with open(src, "w", encoding="utf-8") as f:
            f.write(xml)
        # mscore may exit 134 after writing a complete file, so check the file
        subprocess.run([MSCORE, "-S", os.path.join(HERE, "score_style.mss"), "-o", mscz, src],
                       capture_output=True)
        if not os.path.exists(mscz) or not os.path.getsize(mscz):
            raise SystemExit(f"{name}: MuseScore wrote no score")
        with zipfile.ZipFile(mscz) as z:
            items = [(i, z.read(i.filename)) for i in z.infolist()]
        title = cfg["title"] + (f'<br/><font size="14"/>{cfg["sub"]}' if cfg.get("sub") else "")
        composer = cfg.get("composer_frame", "Знаменный распев")
        fixed = []
        for info, data in items:
            if info.filename.endswith(".mscx"):
                s = data.decode("utf-8").replace("<longName>Voice</longName>", "<longName></longName>", 1)
                s = re.sub(r"(<style>title</style>\s*<text>)[^<]*(</text>)",
                           lambda m: m.group(1) + title + m.group(2), s, count=1)
                s = re.sub(r"(<style>composer</style>\s*<text>)[^<]*(</text>)",
                           lambda m: m.group(1) + composer + m.group(2), s, count=1)
                data = s.encode("utf-8")
            fixed.append((info, data))
        with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
            for info, data in fixed:
                z.writestr(info, data)
    subprocess.run([sys.executable, os.path.join(ROOT, "tools", "mscz-add-hidden-timesig.py"), out], check=True)
    print(f"{name}: -> {os.path.relpath(out, ROOT)}")


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--show", action="store_true", help="print the reading, write nothing")
    ap.add_argument("--musicxml", metavar="DIR", help="write only DIR/NAME.musicxml")
    ap.add_argument("names", nargs="+", metavar="NAME")
    args = ap.parse_args()
    for name in args.names:
        cfg = load(name)
        xml = to_musicxml(name, cfg, args.show)
        if args.show:
            continue
        if args.musicxml:
            os.makedirs(args.musicxml, exist_ok=True)
            with open(os.path.join(args.musicxml, name + ".musicxml"), "w", encoding="utf-8") as f:
                f.write(xml)
            continue
        make_mscz(name, cfg, xml)


if __name__ == "__main__":
    main()
