# tools

Scripts for getting the church scores from MuseScore to LilyPond. They use
the Python standard library only; run them from the repository root. The
pipeline as a whole is described in `../README.md`.

## Rebuilding a score (`rebuild-score.py`)

Runs the whole pipeline for one or more scores: hidden-time-signature copy
(for free-meter scores), MusicXML export with MuseScore, `musicxml2ly`, the
hand edits, LilyPond, and the note check below.

```sh
tools/rebuild-score.py heer_ik_roep_t3 onder_uwe_hoede
```

The hand edits come from the current `.ly`: the `\include`, the hand-edit
comment, the `\header` title/subtitle and the line-break spacer. Other
`% hand edit:` lines stop the script before it replaces the `.ly`. Exit
status 0 means done, 1 means a note check found differences, 2 means a step
failed.

## Free-meter scores (`mscz-add-hidden-timesig.py`)

A MuseScore score with no time signature, only measures of custom length
(chant-style psalm tones), exports MusicXML without any `<time>` element.
`musicxml2ly` then emits no `\time`, and LilyPond rebars everything as 4/4.
`mscz-add-hidden-timesig.py` writes a copy of the `.mscz` with a hidden time
signature wherever the measure length changes; its MusicXML export carries
`<time print-object="no">`, which `musicxml2ly` turns into
`\time 14/4 \omit Staff.TimeSignature` etc. It refuses scores that already
have time signatures.

```sh
tools/mscz-add-hidden-timesig.py score.mscz score_timesig.mscz
```

This is where the `*_timesig.mscz` copies come from. Make the copy again after
editing the original, then export MusicXML from the copy.

## Checking the PDF against the score (`check-pdf-notes.py`)

Checks that a LilyPond PDF shows the same notes as the `.mscz` it came from,
with the `.mscz` as ground truth. It reads the PDF itself (through
`mutool draw -F trace`, so `mutool` must be on `PATH`), not the MusicXML or
`.ly`, so it also catches mistakes made by the conversion. It compares every
voice note by note (pitch with spelling, duration and dots, measure), the
number of measures, the length of every measure and every slur.

```sh
tools/check-pdf-notes.py heer_ik_roep_t1.mscz heer_ik_roep_t1_timesig.pdf
# several pairs at once
tools/check-pdf-notes.py $(for n in 1 2 3 4 5 6 7 8; do
    echo heer_ik_roep_t$n.mscz heer_ik_roep_t${n}_timesig.pdf; done)
```

Exit status 0 means everything matches, 1 means differences (listed as
`PROBLEM:` lines) and 2 means the score uses something the checker can't read
yet. The check is written for the two-staff SATB layout of these scores: two
voices per staff, one note per chord, quarter/half/whole notes, dots, slurs.
Rests, ties, beams, tuplets and other layouts give exit status 2 rather than a
false pass.

`note:` lines are not errors. A stem direction forced in MuseScore
(`StemDirection`) shows up in the PDF too. The checker then decides the voices
of that column by height, and lists them so you can see which notes it handled
that way.
