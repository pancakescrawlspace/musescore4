#!/usr/bin/env python3
"""Practice MP3s for the singers: the whole choir, and one mix per voice in
which that voice stands out.

usage: tools/practice-mp3.py [--tempo BPM] [--background X] [--instrument I]
                             [--spotlight-instrument I] [--background-instrument I]
                             [--soundfont SF] [--out-dir DIR] NAME [NAME ...]

NAME is a score name like heer_ik_roep_t3 (or heer_ik_roep_t3.ly). The .ly is
split into one staff per voice with tools/voice-explode-ly.py, and LilyPond
makes a MIDI file of it with every staff on its own channel.
FluidSynth plays that, and ffmpeg makes the MP3. Five files per score in DIR
(default practice/):

  NAME.mp3            the four voices equally loud
  NAME_soprano.mp3    the soprano at full volume, the others softer
  NAME_alto.mp3, NAME_tenor.mp3, NAME_bass.mp3

(named after the staves of the split score, so other layouts work too).
The softer voices get MIDI expression X (default 0.5, about 12 dB softer with
FluidSynth; 0.4 is about 16 dB). Every MP3 is normalised to a peak of -1 dB.

Instruments are LilyPond's General MIDI names ("choir aahs", "flute",
"acoustic grand", "string ensemble 1", ...). --instrument (default
"choir aahs") is used for the whole choir and is the default for the two
others: --spotlight-instrument for the voice that stands out and
--background-instrument for the rest. A flute against a piano:

  tools/practice-mp3.py --spotlight-instrument flute \\
      --background-instrument "acoustic grand" --out-dir practice-flute NAME

With different instruments, --background 1.0 keeps the voices equally loud.
The files are named the same whatever the instruments, so give each set of
instruments its own --out-dir.

The scores have no tempo marking, so MuseScore plays them at its default,
quarter = 120; --tempo changes it. Repeats are played out. The soundfont
defaults to MuseScore's own (MuseScore_General.sf3 in
~/Documents/MuseScore4/SoundFonts), so the
choir sounds as in MuseScore.

Needs lilypond, fluidsynth and ffmpeg (with libmp3lame) on PATH.
"""
import argparse, difflib, os, re, subprocess, sys, tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXPLODE = os.path.join(ROOT, "tools", "voice-explode-ly.py")
SOUNDFONT = os.path.expanduser("~/Documents/MuseScore4/SoundFonts/MuseScore_General.sf3")
STAFF = re.compile(r'\\new\s+Staff\s*=\s*"[^"]*"\s*<<')


class Failed(Exception):
    pass


def run(*cmd):
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        raise Failed(f"{os.path.basename(cmd[0])}: {(r.stderr or r.stdout).strip()}")
    return r


def midi_score(ly, tempo):
    """The split score as MIDI-only LilyPond source, repeats played out."""
    score = ly.index("\\score")
    head, tail = ly[:score], ly[score:]
    tail = re.sub(r"\\score\s*\{", r"\\score { \\unfoldRepeats", tail, count=1)
    midi = f"\\midi {{\n    \\tempo 4 = {tempo}\n  }}"
    tail, n = re.subn(r"\\layout\s*\{\s*\}", lambda m: midi, tail, count=1)
    if not n:
        raise Failed("no \\layout {} in the \\score to replace with \\midi")
    return head + tail


def mix(ly, voices):
    """ly with each staff's (instrument, MIDI expression) set, staff by staff."""
    it = iter(voices)
    def staff(m):
        instrument, volume = next(it)
        return (f'{m.group()}\n        \\set Staff.midiInstrument = "{instrument}"'
                f"\n        \\set Staff.midiExpression = #{volume}")
    return STAFF.sub(staff, ly)


def instruments():
    """LilyPond's MIDI instrument names."""
    with tempfile.TemporaryDirectory() as tmp:
        ly = os.path.join(tmp, "names.ly")
        with open(ly, "w") as f:
            f.write('#(for-each (lambda (p) (format #t "~a\\n" (car p))) instrument-names-alist)\n')
        return set(run("lilypond", "-s", "-o", tmp, ly).stdout.splitlines())


def render(midi, mp3, soundfont, title, tmp):
    wav = os.path.join(tmp, "render.wav")
    run("fluidsynth", "-ni", "-q", "-g", "0.5", "-r", "44100", "-O", "float",
        "-F", wav, soundfont, midi)
    r = run("ffmpeg", "-hide_banner", "-i", wav, "-af", "volumedetect", "-f", "null", "-")
    peak = float(re.search(r"max_volume: (-?[\d.]+) dB", r.stderr).group(1))
    run("ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-i", wav,
        "-af", f"volume={-1 - peak:.1f}dB", "-codec:a", "libmp3lame", "-q:a", "2",
        "-metadata", f"title={title}", mp3)


def practice(name, args):
    name = re.sub(r"\.ly$", "", name)
    src = os.path.join(ROOT, name + ".ly")
    if not os.path.exists(src):
        raise Failed(f"no {name}.ly")
    print(f"== {name}")
    with tempfile.TemporaryDirectory() as tmp:
        split = os.path.join(tmp, "split.ly")
        run(sys.executable, EXPLODE, src, split)
        ly = midi_score(open(split, encoding="utf-8").read(), args.tempo)
        staves = re.findall(r'\\set\s+Staff\.instrumentName\s*=\s*"([^"]*)"', ly)
        if len(staves) != len(STAFF.findall(ly)):
            raise Failed("not every staff has an instrument name")
        header = re.search(r'^\s*title\s*=\s*"([^"]*)"', ly, re.M)
        subs = [re.search(rf'^\s*{f}\s*=\s*"([^"]*)"', ly, re.M) for f in ("subtitle", "subsubtitle")]
        title = ", ".join(m.group(1) for m in (header, *subs) if m) or name
        mixes = [("", [(args.instrument, 1.0)] * len(staves), title)]
        spot = (args.spotlight_instrument or args.instrument, 1.0)
        rest = (args.background_instrument or args.instrument, args.background)
        for i, voice in enumerate(staves):
            voices = [spot if j == i else rest for j in range(len(staves))]
            mixes.append((f"_{voice.lower().replace(' ', '_')}", voices, f"{title} ({voice})"))
        os.makedirs(args.out_dir, exist_ok=True)
        for suffix, volumes, mp3_title in mixes:
            ly_file = os.path.join(tmp, "mix.ly")
            with open(ly_file, "w", encoding="utf-8") as f:
                f.write(mix(ly, volumes))
            run("lilypond", "-s", "-I", ROOT, "-o", os.path.join(tmp, "mix"), ly_file)
            mp3 = os.path.join(args.out_dir, name + suffix + ".mp3")
            render(os.path.join(tmp, "mix.midi"), mp3, args.soundfont, mp3_title, tmp)
            print(f"  {os.path.relpath(mp3, ROOT)}")


def main():
    ap = argparse.ArgumentParser(description="Practice MP3s: the whole choir and one per voice.")
    ap.add_argument("names", nargs="+", metavar="NAME")
    ap.add_argument("--tempo", type=int, default=120, help="quarter notes per minute (default 120)")
    ap.add_argument("--background", type=float, default=0.5,
                    help="MIDI expression of the softer voices, 0-1 (default 0.5)")
    ap.add_argument("--instrument", default="choir aahs",
                    help='MIDI instrument of the whole choir (default "choir aahs")')
    ap.add_argument("--spotlight-instrument", help="instrument of the voice that stands out")
    ap.add_argument("--background-instrument", help="instrument of the other voices")
    ap.add_argument("--soundfont", default=os.environ.get("SOUNDFONT", SOUNDFONT))
    ap.add_argument("--out-dir", default=os.path.join(ROOT, "practice"))
    args = ap.parse_args()
    if not os.path.exists(args.soundfont):
        sys.exit(f"no soundfont {args.soundfont} (set --soundfont or SOUNDFONT)")
    known = instruments()
    for option in ("instrument", "spotlight_instrument", "background_instrument"):
        name = getattr(args, option)
        if name is not None and name not in known:
            words = set(name.lower().split())
            close = sorted(k for k in known if words & set(k.split()))
            close += [k for k in difflib.get_close_matches(name, known, n=4, cutoff=0.5)
                      if k not in close]
            sys.exit(f"--{option.replace('_', '-')}: no MIDI instrument {name!r}"
                     + (f"; did you mean {', '.join(map(repr, close))}?" if close else ""))
    status = 0
    for name in args.names:
        try:
            practice(os.path.basename(name), args)
        except Failed as e:
            print(f"  FAILED: {e}")
            status = 2
    return status


if __name__ == "__main__":
    sys.exit(main())
