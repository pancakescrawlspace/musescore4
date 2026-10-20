# tools

Scripts for getting the church scores from MuseScore to LilyPond. They use
the Python standard library only; run them from the repository root. The
pipeline as a whole is described in `../README.md`.

## Rebuilding a score (`rebuild-score.py`)

Runs the whole pipeline for one or more scores: MusicXML export with
MuseScore, `musicxml2ly`, the hand edits, LilyPond, and the note check
below. A score without time signatures is refused (see the next-but-one
section).

```sh
tools/rebuild-score.py heer_ik_roep_t3 onder_uwe_hoede
```

The hand edits come from the current `.ly`: the `\include`, the hand-edit
comment, the `\header` title/subtitle and the line-break spacer. Other
`% hand edit:` lines stop the script before it replaces the `.ly`. Lyric
syllables underlined in the score (stressed syllables) become
`\markup \stressed`, a red underline from `church_style.ily`. Exit
status 0 means done, 1 means a note check found differences, 2 means a step
failed.

## Videos with reflow (`score-video.py`)

Exports `score.mp4` from `score.mscz` with MuseScore, laid out as with
"Reflow to fit video resolution" in the export dialog, which the command
line can't select. It changes a temporary copy of the score to match
reflow and exports that; the score itself isn't touched. Details are in
`../README.md` under "MuseScore command line".

```sh
tools/score-video.py heer_ik_roep_t3.mscz                    # 1080p, 24 fps
tools/score-video.py --resolution 720p --fps 30 heer_ik_roep_t3.mscz
tools/score-video.py --staff-scale 0.7 bwv4.8_tenor.mscz   # smaller staves
```

`--staff-scale` makes the staves smaller in the video copy, for a system
that is taller than the frame: four staves with two lines of text each
(the Bach chorales split by `voice-explode-mscz.py`) need about 0.7.

## Free-meter scores (`mscz-add-hidden-timesig.py`)

A MuseScore score with no time signature, only measures of custom length
(chant-style psalm tones), exports MusicXML without any `<time>` element.
`musicxml2ly` then emits no `\time`, and LilyPond rebars everything as 4/4.
`mscz-add-hidden-timesig.py` adds a hidden time signature wherever the
measure length changes, without courtesy signatures, so MuseScore's layout
stays exactly the same. The MusicXML export then carries
`<time print-object="no">`, which `musicxml2ly` turns into
`\time 14/4 \omit Staff.TimeSignature` etc. It refuses scores that already
have time signatures.

```sh
tools/mscz-add-hidden-timesig.py score.mscz                 # in place
tools/mscz-add-hidden-timesig.py score.mscz copy.mscz
```

Run it once on a new free-meter score; the free-meter scores here all
have their hidden time signatures already.

## Checking the PDF against the score (`check-pdf-notes.py`)

Checks that a LilyPond PDF shows the same notes as the `.mscz` it came from,
with the `.mscz` as ground truth. It reads the PDF itself (through
`mutool draw -F trace`, so `mutool` must be on `PATH`), not the MusicXML or
`.ly`, so it also catches mistakes made by the conversion. It compares every
voice note by note (pitch with spelling, duration and dots, measure), the
number of measures, the length of every measure and every slur.

```sh
tools/check-pdf-notes.py heer_ik_roep_t1.mscz heer_ik_roep_t1.pdf
# several pairs at once
tools/check-pdf-notes.py $(for n in 1 2 3 4 5 6 7 8; do
    echo heer_ik_roep_t$n.mscz heer_ik_roep_t$n.pdf; done)
```

Exit status 0 means everything matches, 1 means differences (listed as
`PROBLEM:` lines) and 2 means the score uses something the checker can't read
yet. The check is written for the two-staff SATB layout of these scores: two
voices per staff, one note per chord, quarter/half/whole notes, dots, slurs.
Rests, ties, beams, tuplets, a slur end without a start in its voice, and
other layouts give exit status 2 rather than a false pass.

Stems must follow the voices: up in voice 1, down in voice 2. A stem
direction forced against its voice in MuseScore (`StemDirection` down in
voice 1 or up in voice 2, in a measure where the staff has both voices) is a
`PROBLEM:`, and so is a column in the PDF whose two notes have their stems the
same way. Such a note was usually entered in the wrong voice and moved later
with its stem left as it was (two soprano notes in `heer_ik_roep_t3` had
this). Fix it in MuseScore by setting the note's stem direction back to
Auto in the Properties panel. A forced direction that agrees with the voice
changes nothing and passes.

A measure without a `len` attribute takes its length from the time signature
in force; MuseScore leaves `len` out when the two agree.

## One staff per voice (`voice-explode-ly.py`)

The LilyPond counterpart of `~/dev/pitchmarks/tools/voice-explode.py`: it
splits the two-voice staves of a `.ly` into one staff per voice, so Women
and Men become Soprano, Alto, Tenor and Bass. It writes a new `.ly` and
leaves the original alone.

```sh
tools/voice-explode-ly.py de_kelk_des_heils.ly de_kelk_des_heils_satb.ly
tools/voice-explode-ly.py --single-lyrics --names "S,A,T,B" in.ly out.ly
```

It reads the musicxml2ly layout of the scores here: music in variables and
`\context Voice` / `\new Lyrics \lyricsto` blocks in the `\score`. Each
multi-voice staff is copied once per voice with the other voices taken out;
the rest of the staff (overrides, the line-break spacer) goes into every
copy. The music loses its two-voice layout (`\voiceOne`, `\oneVoice`,
`\stemUp`, the `\U`/`\D` stem macros, forced directions like `^\fermata`),
and its spacer rests become real rests (`s4` → `r4`, `s1*31` → `R1*31`).

Staff names: "Alto, Tenor" or "S/A" is split per voice; otherwise two
two-voice staves become Soprano, Alto, Tenor, Bass, and anything else
"Women 1", "Women 2"; `--names` sets them all. Every voice without lyrics of
its own gets a copy of the soprano's lyrics (attached to the soprano, so in
the soprano's rhythm), except a voice that only rests; `--single-lyrics`
leaves them under the soprano only. Clefs stay as they are, so the tenor
keeps the bass clef, unless `--tenor-treble8` gives it the octave treble
clef (`\clef "treble_8"`; the tenor is the upper voice of a bass-clef staff
with several voices). Scores whose staves are built by a music function
(`groot_prokimen_pinksteren_alt.ly`'s `\choir`) aren't read.

## One staff per voice in MuseScore (`voice-explode-mscz.py`)

The same split for a `.mscz`, written as a new `.mscz`: each voice becomes
a part (instrument) of its own, so it has its own mixer channel, e.g. for
a video in which one voice stands out.

```sh
tools/voice-explode-mscz.py de_kelk_des_heils.mscz de_kelk_des_heils_satb.mscz
tools/voice-explode-mscz.py --spotlight alto de_kelk_des_heils.mscz kelk_alto.mscz
tools/score-video.py kelk_alto.mscz
```

Voice 1's staff keeps the title frame, line breaks, voltas and repeat
counts; the other voices get the clefs, key and time signatures and
barlines, and rests wherever they had nothing. Forced stem directions go,
a fermata below becomes a fermata above, and a voice gets a copy of a
fermata from another voice on its staff when it starts a note or rest at
the same moment. Brackets grow to cover the new staves.

Names work as in `voice-explode-ly.py` (`--names` for all new staves). The
mixer name is always set; the staff names only when the staff had them.
Lyrics are copied by position, not attached to the soprano's rhythm as in
LilyPond: a note without lyrics gets those of the first voice in the score
with lyrics at the same moment, so a syllable that falls while the voice
holds an earlier note is lost (`--single-lyrics` copies none). The tenor
(a voice named Tenor, or the upper voice of a bass-clef staff) gets the
octave treble clef; `--tenor-bass` keeps its clef.

`--spotlight VOICE` sets all other parts in the mixer to `--background-db`
(default -12 dB, as in `practice-mp3.py`; up to +12); MuseScore's
audio and video exports, also from the command line, use those settings.
Tuplets and grace notes are refused.

The sounds can be set too, as in `practice-mp3.py`, but by the preset
names of the soundfont in the mixer, MuseScore's MS Basic (`Flute`,
`"Grand Piano"`, `"Choir Aahs"`, ...; a wrong name gets suggestions):
`--instrument` for every part, `--spotlight-instrument` and
`--background-instrument` for the spotlighted voice and the others. The
`video-flute/` set (gitignored, like all MP4s) is the whole score in piano
plus one video per voice, that voice on flute and the others on piano.
MS Basic's piano is 6-7 dB softer than its flute at the same mixer level,
so the piano voices are turned up instead (`--background-db 8`): -12, -6
and -3 were too soft, and of the samples from 0 to +12 (the mixer's
maximum), +8 and +10 were fine and +12 probably too loud.

`--spotlight-color red` (or blue, green, orange, `#rrggbb`) shows the
spotlighted voice in that colour as well: note heads, dots, accidentals,
stems, flags, beams, rests, slurs, ties and lyrics (with their hyphens
and melisma lines). Ledger lines stay black, like the staff lines. The
`video-flute/` spotlight videos are red:

```sh
s=heer_ik_roep_t1
tools/voice-explode-mscz.py --instrument "Grand Piano" $s.mscz /tmp/$s.mscz
for v in soprano alto tenor bass; do
  tools/voice-explode-mscz.py --spotlight $v --spotlight-color red \
    --spotlight-instrument Flute --background-instrument "Grand Piano" \
    --background-db 8 $s.mscz /tmp/${s}_$v.mscz
done
tools/score-video.py /tmp/$s.mscz /tmp/${s}_*.mscz && mv /tmp/$s*.mp4 video-flute/
```

A score saved by MuseScore's command line (such as the Bach chorales) has
no mixer tracks; the parts then get MuseScore's default track before the
sound or volume is set.

Only the mixer changes, not the instrument in the score, so the staves
keep their vocal ranges and no note shows up as out of range. (The MIDI
program and instrument id in the score don't change the sound; MuseScore
plays what the mixer's `audiosettings.json` says: preset bank, program and
name, and the resource id `MS Basic\0\73`.)

## Practice MP3s (`practice-mp3.py`)

Five MP3s per score for the singers to practise with, in `practice/`: the
whole choir (`NAME.mp3`) and one per voice in which that voice stands out
(`NAME_soprano.mp3`, `_alto`, `_tenor`, `_bass`). All voices are Choir Aahs.

```sh
tools/practice-mp3.py heer_ik_roep_t{1,2,3,4,5,6,7,8}
tools/practice-mp3.py --tempo 100 --background 0.4 onder_uwe_hoede
```

The instruments can differ too, e.g. a flute for the voice that stands out
against a piano for the others. Names are LilyPond's General MIDI names
(`"choir aahs"`, `"flute"`, `"acoustic grand"`, ...); a wrong name is
refused with suggestions. `--instrument` (default `"choir aahs"`) is the
whole choir's and the default for the other two. The file names don't
change with the instruments, so give each set its own `--out-dir`:

```sh
tools/practice-mp3.py --instrument "acoustic grand" --spotlight-instrument flute \
    --background-instrument "acoustic grand" --background 1.0 \
    --out-dir practice-flute heer_ik_roep_t{1,2,3,4,5,6,7,8}
```

With different instruments, `--background 1.0` keeps all voices equally
loud and lets the timbre alone pick out the voice: the flute is louder than
the piano by itself. That is how `practice-flute/` is made (since
2026-10-20; the default 0.5 left the piano too soft), matching the
`video-flute/` videos.

The score is split with `voice-explode-ly.py`, so every voice is a staff
and so its own MIDI channel. LilyPond writes the MIDI (repeats played out),
FluidSynth plays it with MuseScore's soundfont
(`~/soundfonts/MuseScore_General.sf3`, or `--soundfont`/`SOUNDFONT`), and
ffmpeg encodes it, normalised to a peak of -1 dB. The other voices get MIDI
expression 0.5, about 12 dB softer (`--background 0.4` is about 16 dB). The
scores have no tempo marking, so the default is MuseScore's ♩ = 120. The
title tag is the score's title and subtitle, plus the voice. Needs
`lilypond`, `fluidsynth` and `ffmpeg`; the MP3s are ignored by git.
