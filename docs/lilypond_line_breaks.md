# Setting line breaks by hand in the LilyPond files

How to add or remove line breaks in a choir print (`NAME_koor.ly`; those of
Heer ik roep are in `heer_ik_roep_koor/`), for
example to match the breaks of the sheets the choir already sings from.
The same commands work in the ordinary `NAME.ly`.

**First choice: put the breaks in the `.mscz`.** Line breaks set in
MuseScore end up in `NAME.ly` and `NAME_koor.ly` on every rebuild, and a
break inside a measure can be made there too, by splitting the measure with
an invisible barline: `tools/mscz-split-measures.py` (see `tools/README.md`).
Heer ik roep tones 1–3 are done that way. Editing the `.ly` by hand, as
below, is for a quick change to one print, or for the choir prints made with
`koor-variant.py --free-breaks` (tones 4–8).

## Before you start: hand edits get overwritten

`tools/koor-variant.py` writes `NAME_koor.ly` from scratch, and
`tools/rebuild-score.py` does the same for `NAME.ly`. Running either of
them again throws away your hand edits to that file. So:

- edit the file, build the PDF with LilyPond (see "Building and checking"),
  and commit it;
- don't run `koor-variant.py` on that score again; if you must, copy your
  edited file first and redo the breaks.

## Where the breaks go

A line break is a command between two notes. It goes in the **soprano
voice only**, the variable `PartPOneVoiceOne`, and applies to the whole
system (all four voices, both staves). Leave the other voices alone.

A piece of `heer_ik_roep_t1_koor.ly`:

```lilypond
PartPOneVoiceOne = \relative bes' {
  \clef "treble" \once \omit Staff.TimeSignature \time 14/4 \key f \major \U bes2
  ( \noBreak \U c2 ) \U bes4 \U bes4 \U bes4 \U bes4 \U g4 \noBreak \U a2 ( \noBreak \U g4 ) \U f2 |  % 1
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \noBreak \U a2 \U bes4 \U bes4 \U g2 | % 2
```

How to read it:

- `\U bes2`, `\U c2`, `a4` and so on are notes: the pitch (`bes` = B♭) and
  the length (`2` = half note, `4` = quarter). `\U` only makes the stem
  point up.
- `|` ends a measure, and `% 1`, `% 2` give the measure numbers (comments;
  LilyPond ignores them).
- `\once \omit Staff.TimeSignature \time 7/4` at the start of a measure is
  the hidden time signature.
- `\noBreak` before a note means: no line break directly before this note.
  `koor-variant.py --free-breaks` puts it before every note that doesn't
  start a word, so LilyPond never breaks inside a word.
- `\break` before a note means: start a new line with this note.
  `koor-variant.py --free-breaks` writes one for every line LilyPond chose,
  so the breaks you see in the PDF are all in the file.

To find a note, count along the lyrics. `PartPOneVoiceOneLyricsOne` has one
item per soprano note: a syllable, or `\skip1` for a note that continues a
melisma. `--` joins syllables of a word, and `__` is a melisma line.

```lilypond
Heer __ \skip1 ik roep tot U ver -- hoor __ \skip1 "mij," ver -- hoor mij o
```

`Heer` is the 1st note (`bes2`), `\skip1` the 2nd (`c2`, still "Heer"),
`ik` the 3rd, and so on.

## Adding a break

Put `\break` directly before the note that should begin the new line.

- **At a barline** (after a measure): put it after the `|`, as in the
  14pt files:

  ```lilypond
  \U g2 ) \U f2 | \break % 1
  ```

- **Inside a measure**: put it before the note, for example before "ver"
  of "ver-hoor":

  ```lilypond
  \U bes4 \U bes4 \break \U a2 ...
  ```

  If that note has a `\noBreak` in front of it, replace the `\noBreak` with
  `\break`; don't leave both. A break inside a measure only works if this
  line is near the top of the file (`koor-variant.py --free-breaks` writes
  it):

  ```lilypond
  \layout { \context { \Score forbidBreakBetweenBarLines = ##f } }
  ```

- **Accidentals after a break inside a measure.** LilyPond doesn't repeat an
  accidental after a line break if it was printed earlier in the same
  measure, so a C♯ in the new line would show as a plain C. Add `!` after
  the pitch (and its octave marks) of the first such note after the break,
  in every voice where it happens: `cis4` becomes `cis!4`, `cis'4` becomes
  `cis'!4`. When you move a break, move these too: remove the `!` at the
  old break (it would print a needless sharp) and check the notes after the
  new one. `check-pdf-notes.py` (see "Building and checking") reports a
  missing one as a wrong pitch.

## Removing a break

- A `\break` you added: delete it.
- A break LilyPond chose by itself: put `\noBreak` before the note where it
  broke. LilyPond then breaks somewhere else.

## Fixing all breaks by hand

To match an existing sheet exactly, set every break yourself and stop
LilyPond from choosing:

1. Delete the `\break`s the tool wrote, and put a `\break` before the first
   note of every line on the sheet, except the first line.
2. Fix the accidentals around the old and new breaks (see "Adding a break").
3. Keep `page-count = 1` in the `\paper` line near the top if the page must
   stay one page.
4. You can leave the `\noBreak` commands where they are: where you didn't put
   a `\break` they only stop LilyPond from adding breaks of its own.

If a line is too full for the 16pt lyrics, LilyPond squeezes it, and the
syllables can collide. Then the sheet's break can't be kept at that size:
move the break, or use a smaller size (`koorPt = 16` at the top of the
file).

## Building and checking

From the `church` folder (`-I .` lets LilyPond find the style files in the
root; `-o` puts the PDF next to the `.ly`):

```sh
lilypond -I . -o heer_ik_roep_koor/heer_ik_roep_t1_koor heer_ik_roep_koor/heer_ik_roep_t1_koor.ly
tools/check-pdf-notes.py heer_ik_roep_t1.mscz heer_ik_roep_koor/heer_ik_roep_t1_koor.pdf
```

- LilyPond prints warnings in the terminal. "too few pages" only means it
  tightened the spacing to keep one page. Anything about "compressing" or
  collisions means a line is too full.
- `check-pdf-notes.py` compares the notes in the PDF with the MuseScore
  score. It should end with `OK`.
- To rebuild the combined PDF of the eight tones:

  ```sh
  qpdf --empty --pages heer_ik_roep_koor/heer_ik_roep_t?_koor.pdf -- heer_ik_roep_koor/heer_ik_roep_alle_tonen_koor.pdf
  ```
