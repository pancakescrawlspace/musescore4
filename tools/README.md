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
```

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
