# tools

Scripts for getting the church scores from MuseScore to LilyPond. They use
the Python standard library only, except `video-audio.py`, which also needs
numpy; run them from the repository root. The
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
comment, the `\header` title/subsubtitle and the line-break spacer. The
`subtitle` and `composer` come from the score's Subtitle and Composer texts
on every rebuild. Other
`% hand edit:` lines stop the script before it replaces the `.ly`. Lyric
syllables underlined in the score (stressed syllables) become
`\markup \stressed`, a red underline from `church_style.ily`. Exit
status 0 means done, 1 means a note check found differences, 2 means a step
failed.

## Videos with reflow (`score-reflow.py`, `score-video.py`, `video-audio.py`)

Two steps, plus a third for other audio, so that each can be run (or
redone) by itself:

1. `score-reflow.py` writes a copy of the score laid out as with "Reflow to
   fit video resolution" in MuseScore's export dialog, which the command line
   can't select. The copy goes into `--out-dir` under the score's own name;
   the score itself isn't touched.
2. `score-video.py` exports a score to MP4 as it is, next to it (or into
   `--out-dir`). It warns if the page doesn't match the video, i.e. the score
   wasn't reflowed for that `--resolution`. The video has the score's own
   audio, AAC at about 125 kbps.
3. `video-audio.py` replaces that audio by the audio of another score of
   the same music, the audio score, at 320 kbps (Apple's AAC encoder, 48
   kHz), the picture untouched. For a video score `X.mscz` it takes `X.mp4`
   next to it and the audio score `audio/X.mscz` next to that (or in
   `--audio-dir`: `--audio-dir .` takes the original scores, from the
   repository root, so the video gets its own audio again at 320 kbps).
   This is how a spotlighted video gets its picture from two staves and
   its sound from a staff per voice (see "One staff per voice in
   MuseScore" below).

`video-audio.py` exports both scores as WAV. MuseScore's audio starts after
the title card, 3.0418 s into the video at the defaults; the script finds
that moment, to the sample, by cross-correlating the video's audio with the
video score's own WAV, and puts the audio score's WAV in there. (Matching
the video against the audio score directly doesn't work: its sounds differ,
and that was off by up to 0.17 s.) The moment goes into the MP4's metadata
(comment `video-audio.py start=3.041814`), so the script can run again on
its own, e.g. after a change in the audio score's mixer; a video without
that comment whose audio isn't the video score's is refused. A warning
says when the two scores don't last equally long, i.e. their timing
differs. YouTube
re-encodes every upload anyway (its recommendation is AAC at 384 kbps), but
from a better source. Above 320 (the maximum of Apple's encoder, `aac_at`,
macOS only) `--audio-bitrate` gets ffmpeg's own AAC encoder, which treats
the bitrate as a ceiling: 384 gave only 261 kbps, so 320 is the default.

The reflowed copy stays next to its video, so the video can also be made
again from MuseScore itself: open the copy, File > Export > Video, with
"Reflow to fit video resolution" off (the copy is reflowed already). Details are in `../README.md`
under "MuseScore command line".

```sh
tools/score-reflow.py --out-dir /tmp/video heer_ik_roep_t3.mscz   # 1080p
tools/score-video.py /tmp/video/heer_ik_roep_t3.mscz               # 24 fps
tools/score-reflow.py --out-dir /tmp/video --resolution 720p heer_ik_roep_t3.mscz
tools/score-video.py --resolution 720p --fps 30 /tmp/video/heer_ik_roep_t3.mscz
tools/video-audio.py --audio-dir . /tmp/video/heer_ik_roep_t3.mscz  # own audio, 320 kbps
tools/score-reflow.py --out-dir /tmp/video --staff-scale 0.7 bwv4.8_tenor.mscz
```

Give both steps the same `--resolution`. `--staff-scale` makes the staves
smaller in the copy, for a system that is taller than the frame: four
staves with two lines of text each (the Bach chorales split by
`voice-explode-mscz.py`) need about 0.7. It also makes them larger, for a
system that fills only part of the frame, with `--top-margin` and
`--side-margin` (inches) instead of reflow's margins (none at the top, the
score's own 0.59 in at the sides). Two staves with lyrics, as in the
`video/` set, get `--staff-scale 1.4 --side-margin 0.2 --top-margin 0.18`
(chosen 2026-10-21): the system then fills the frame, centred (16-84 % of
its height in all eight tones of heer_ik_roep, against 7-56 % before). The
width sets the limit: at 1.7 the lyrics of tone 8's longest line ran
together, and 1.4 keeps its melisma line only with the narrower side
margins. bogoroditse_dievo's m2 (31/8) is wider still: at 1.4 its hyphens
touched the syllables, and 1.2 was still cramped, so its video has no
`--staff-scale` (reflow's own size). A top margin of 0.68 in alone centres the system at its old size,
but leaves too much room above it.

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
voices per staff, whole notes down to sixteenths, dots, slurs. Eighths and
sixteenths are read from their flags or beams (one per halving), and the beam
groups themselves aren't compared: the `.mscz` doesn't store them, MuseScore
beams by the time signature as it lays out. A chord within a voice (the
bass's octaves) is compared as a whole. Stemless whole notes can't show their
voice, so a column of three or more is read as voice 1 on top and voice 2 for
the rest; a score that splits them differently gets a `PROBLEM:`, not a pass.
Rests, ties, tuplets, a slur end without a start in its voice, and other
layouts give exit status 2 rather than a false pass.

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
tools/score-reflow.py --out-dir /tmp/video kelk_alto.mscz
tools/score-video.py /tmp/video/kelk_alto.mscz
```

Voice 1's staff keeps the title frame, line breaks, voltas and repeat
counts; the other voices get the clefs, key and time signatures and
barlines, and rests wherever they had nothing. Forced stem directions go,
a fermata below becomes a fermata above, and a voice gets a copy of a
fermata from another voice on its staff when it starts a note or rest at
the same moment. Dynamics are copied the same way: MuseScore plays a
dynamic for every voice of its staff (unless it's set to its own voice
only), so the alto needs the soprano's *p*. Until 2026-10-22 they weren't
copied, and only the voice they were attached to followed them. Brackets grow to cover the new staves.

Names work as in `voice-explode-ly.py` (`--names` for all new staves). The
mixer name is always set; the staff names only when the staff had them.
Lyrics are copied by position, not attached to the soprano's rhythm as in
LilyPond: a note without lyrics gets those of the first voice in the score
with lyrics at the same moment, so a syllable that falls while the voice
holds an earlier note is lost (`--single-lyrics` copies none; this happens
in megalinarion_geboorte and prokimen_t8_huwelijkskroning). Each syllable
is held until the next one, so every note has a syllable or a melisma
line: the copies get the voice's own lines, over its notes up to its next
syllable, and none on a single note. Where a voice has a melisma the
soprano lacks, a word-internal syllable is split as in the house style
("sme ___ king"); where it lacks the soprano's melisma, a word split for
it is joined again ("of-fer" on one note), but only if that split is in
`tools/split-words.txt`, since the score can't tell "sme ___ king" from
"U ___ roep". Add new scores' word-internal melisma splits there. The tenor
(a voice named Tenor, or the upper voice of a bass-clef staff) gets the
octave treble clef; `--tenor-bass` keeps its clef.

`--spotlight VOICE` sets all other parts in the mixer to `--background-db`
(default -12 dB, as in `practice-mp3.py`; the mixer's slider stops at
+12, but MuseScore plays more from the file) and `--spotlight-db` the
spotlighted voice (default: unchanged), so both can go down together
when the background would need more than +12. Without `--spotlight`,
`--volume-db` sets every part (the whole-score video). MuseScore's
audio and video exports, also from the command line, use those settings.
Tuplets and grace notes are refused.

The sounds can be set too, as in `practice-mp3.py`, but by the preset
names of the soundfont in the mixer, MuseScore's MS Basic (`Flute`,
`"Grand Piano"`, `"Choir Aahs"`, ...; a wrong name gets suggestions):
`--instrument` for every part, `--spotlight-instrument` and
`--background-instrument` for the spotlighted voice and the others.
Another soundfont in `~/Documents/MuseScore4/SoundFonts` goes before the
preset, by its file name: `"GeneralUser-GS:Grand Piano"` (MuseScore plays
some other sound, without a warning, for a soundfont name it doesn't know,
such as the name inside the file, so the script checks it).

The `video/` set (the MP4s gitignored, their scores committed) is the whole
score in piano plus one video per voice, that voice on a solo instrument
and the others on piano, with the audio at 320 kbps. Each video has two
scores: the video score `video/X.mscz`, the original two staves with the
lyrics between them, reflowed with larger staves that fill the frame
(see "Videos with reflow"), and the spotlighted voice in red
(`voice-color-mscz.py`, below), and the audio score `video/audio/X.mscz`,
one staff per voice from this script, with the sounds and levels below in
its mixer. `video-audio.py` puts the audio score's sound into the video
score's video. (Until 2026-10-21 the videos showed the four staves of the
audio score itself.) The solo
instruments come from the SGM-V2.01 soundfont and the piano from Arachno's
(`SGM-V2.01.sf2` and `Arachno-SoundFont-1.0.sf2` in
`~/Documents/MuseScore4/SoundFonts`, where all the soundfonts are kept;
without them there the script refuses the names). The mixer levels:

| video          | spotlight | spotlight dB | piano (Arachno "Grand Piano") dB |
|----------------|-----------|-------------:|---------------------------------:|
| whole score    | –         |            – |                             +0.1 |
| `_soprano`     | Flute     |         +4.0 |                             +7.1 |
| `_alto`        | Oboe      |         +3.5 |                             +6.9 |
| `_tenor`       | Clarinet  |         +2.2 |                             +8.6 |
| `_bass`        | Cello     |         +2.7 |                             +4.4 |

How they were found (all 2026-10-20, by ear, on tone 1): first everything
was MS Basic with the flute for every voice. Its piano is 6-7 dB softer
than its flute, so the piano voices are turned up instead: -12, -6 and -3
were too soft, and of +0 to +12, +8 and +10 were fine and +12 probably too
loud, so +8. The flute's range starts at C4, too weak for the tenor and
bass, so the tenor got the clarinet (fine at +8) and the bass the cello,
which needed the piano at +4 (bassoon had the piano on top at +8, trombone
was too loud). Then Arachno sounded best of three other soundfonts
(GeneralUser GS, Chorium). Its instruments are louder than MS Basic's by
different amounts, so the levels were re-measured (integrated loudness of
each sound alone) to keep those balances. Its clarinet is so loud that the
piano would need +13, beyond the slider (MuseScore does play it) and
clipping the audio, so both are turned down by 5 dB instead. On 2026-10-21
the cello still sounded a bit soft; of +0 to +4 dB (piano unchanged) the
user chose +2. The alto (C4-B♭4) lies in the flute's weak bottom octave, so
it got the oboe instead (chosen over English horn and viola), at the
flute's measured balance (−1.8 dB). That gave, in Arachno: flute 0 / piano
+7.5, oboe −1.8 / +7.5, clarinet −5 / +8, cello +2 / +3.7, whole score 0.
The same day SGM won a comparison with Musyng Kite (its Fazioli piano
sounded muffled), Timbres of Heaven and a Salamander piano (converted from
SFZ with Polyphone), each part matched in loudness to the Arachno mix, which
gave the levels above.

On 2026-10-22 eight pianos were compared on bogoroditse_dievo's
whole-score video, each set to the same loudness (−29 LUFS): Arachno's
"Grand Piano" was clearly best, SGM's "Piano 1" a close second, and MS Basic,
Salamander, Musyng Kite, Timbres of Heaven, GeneralUser GS and Chorium far
behind, despite their size. So every video got Arachno's piano, 3.3 dB
below SGM's levels (Arachno's piano is that much louder, on bogoroditse_dievo
and tones 1 and 5 alike); until then the piano was SGM's "Piano 1" at
+3.4, +10.4, +10.2, +11.9 and +7.7 dB. bogoroditse_dievo_arkhangelsky's video has the
same +0.1 dB (from 2026-10-23, when it got the scan's *p*; −6.2 before). (At first the tenor seemed to
dominate bogoroditse_dievo; that was the *p* on the women's staff only, not
the piano: see the dynamics above.)

`--spotlight-color red` (or blue, green, orange, `#rrggbb`) shows the
spotlighted voice in that colour as well: note heads, dots, accidentals,
stems, flags, beams, rests, slurs, ties and lyrics (with their hyphens
and melisma lines). Ledger lines stay black, like the staff lines. The
`video/` set colours the voice on two staves instead, with
`voice-color-mscz.py`:

```sh
s=heer_ik_roep_t1
f=SGM-V2.01   # ${f} in braces: in zsh, "$f:P..." is a path modifier
a=Arachno-SoundFont-1.0
mkdir -p video/audio /tmp/color
tools/voice-explode-mscz.py --instrument "${a}:Grand Piano" --volume-db 0.1 $s.mscz video/audio/$s.mscz
for v in soprano:Flute:7.1:4.0 alto:Oboe:6.9:3.5 tenor:Clarinet:8.6:2.2 bass:Cello:4.4:2.7; do
  IFS=: read voice sound db sdb <<< $v
  tools/voice-explode-mscz.py --spotlight $voice \
    --spotlight-instrument "${f}:${sound}" --background-instrument "${a}:Grand Piano" \
    --background-db $db --spotlight-db $sdb $s.mscz video/audio/${s}_$voice.mscz
  tools/voice-color-mscz.py --voice $voice --color red $s.mscz /tmp/color/${s}_$voice.mscz
done
tools/score-reflow.py --out-dir video --staff-scale 1.4 --side-margin 0.2 --top-margin 0.18 \
  $s.mscz /tmp/color/${s}_*.mscz
tools/score-video.py video/$s.mscz video/${s}_*.mscz
tools/video-audio.py video/$s.mscz video/${s}_*.mscz
```

The audio scores aren't reflowed: only their sound is used. A change of
level needs only the audio score's mixer (or `audiosettings.json`) and
`video-audio.py` again; a change in the picture needs `score-video.py` and
then `video-audio.py`.

A score saved by MuseScore's command line (such as the Bach chorales) has
no mixer tracks; the parts then get MuseScore's default track before the
sound or volume is set.

Only the mixer changes, not the instrument in the score, so the staves
keep their vocal ranges and no note shows up as out of range. (The MIDI
program and instrument id in the score don't change the sound; MuseScore
plays what the mixer's `audiosettings.json` says: preset bank, program and
name, and the resource id `MS Basic\0\73`.)

## One voice in colour (`voice-color-mscz.py`)

Colours one voice of a score without splitting its staves: the picture of
a spotlighted video, whose sound comes from `voice-explode-mscz.py` (see
above).

```sh
tools/voice-color-mscz.py --voice alto heer_ik_roep_t1.mscz /tmp/heer_ik_roep_t1_alto.mscz
tools/voice-color-mscz.py --voice tenor --color blue de_kelk_des_heils.mscz /tmp/kelk_tenor.mscz
```

The voices have the names `voice-explode-mscz.py` gives their staves
(Soprano, Alto, Tenor, Bass for two staves of two voices; `--names` as
there). The colour (`--color`, default red; blue, green, orange or
`#rrggbb`) goes on the same things as `--spotlight-color` there, but not on
the lyrics, which belong to all voices of the staff. Where two voices sing
the same pitch at the same moment with the same kind of head, MuseScore
draws one head, in the colour of the voice it draws last, so the other
voice's head gets the colour too (soprano and alto in heer_ik_roep_t5,
tenor and bass in t6).

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
2026-10-20; the default 0.5 left the piano too soft), matching the videos
of that day; the `video/` set has since moved to other sounds (see above).

The score is split with `voice-explode-ly.py`, so every voice is a staff
and so its own MIDI channel. LilyPond writes the MIDI (repeats played out),
FluidSynth plays it with MuseScore's soundfont
(`MuseScore_General.sf3` in `~/Documents/MuseScore4/SoundFonts`, or
`--soundfont`/`SOUNDFONT`), and
ffmpeg encodes it, normalised to a peak of -1 dB. The other voices get MIDI
expression 0.5, about 12 dB softer (`--background 0.4` is about 16 dB). The
scores have no tempo marking, so the default is MuseScore's ♩ = 120. The
title tag is the score's title, subtitle and subsubtitle, plus the voice. Needs
`lilypond`, `fluidsynth` and `ffmpeg`; the MP3s are ignored by git.

## Downloading the sources (`download-references.sh`)

Downloads the sources of `heer_ik_roep_sources.md` and
`bogoroditse_dievo_sources.md` into `references/` (gitignored), where
`heer_ik_roep_sources.md` lists them under "References". Needs `curl`.

```sh
tools/download-references.sh
```

## Comparing the sources (`compare-sources/`)

The scripts behind `heer_ik_roep_sources.md` (see "How the comparisons
were made" there): they read the voices from the vector PDFs in
`references/` and compare them with the `heer_ik_roep_tN.mscz` scores.
They import each other, hence the underscores in their names, and need
`mutool`.

```sh
tools/compare-sources/cmp_oca.py 1 2 3 4 5 6 7 8
tools/compare-sources/cmp_lines.py 1 references/heer_ik_roep/moscow_osmoglasie/glas1.pdf 1-7
```
