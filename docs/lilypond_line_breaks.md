# Setting line breaks by hand in the LilyPond files

How to add or remove line breaks in a choir print (`NAME_koor.ly`; those of
Heer ik roep are in `heer_ik_roep_koor/`), for
example to match the breaks of the sheets the choir already sings from.
The same commands work in the ordinary `NAME.ly`.

**First choice: let the tools set the breaks.** Line breaks set in
MuseScore end up in `NAME.ly` and `NAME_koor.ly` on every rebuild. For a
choir print with breaks of its own, also inside a measure, list them in a
`layouts.txt` next to the choir prints (`heer_ik_roep_koor/layouts.txt`; see
`koor-variant.py` in `tools/README.md`): they survive every rebuild, and the
score stays as it is. Heer ik roep tones 1–3 are done that way. Editing the
`.ly` by hand, as below, is for a quick change or a try-out, or for the choir
prints made with `koor-variant.py --free-breaks` (tones 4–8).

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

A piece of `heer_ik_roep_koor/heer_ik_roep_t4_koor.ly` (made with
`koor-variant.py --free-breaks`):

```lilypond
PartPOneVoiceOne = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key f \major \U g4
  \U g4 \U g4 \U g4 \U g4 \U g4 \noBreak \U a2 \U a2 |  % 1
  \once \omit Staff.TimeSignature \time 7/4 \U bes4 \noBreak \U bes2 \U bes4 \U bes4 \U a2
  | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U c2 \break \U bes4 \U a4 \U a4 \U a4 \U
```

How to read it:

- `\U g4`, `\U bes2`, `a2` and so on are notes: the pitch (`bes` = B♭) and
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
  so the breaks you see in the PDF are all in the file. Here the third line
  starts at "ik", in the middle of measure 3.

To find a note, count along the lyrics. `PartPOneVoiceOneLyricsOne` has one
item per soprano note: a syllable, or `\skip1` for a note that continues a
melisma. `--` joins syllables of a word, and `__` is a melisma line.

```lilypond
Heer ik roep tot U ver -- hoor mij ver -- hoor mij o Heer Heer ik roep tot U
```

`Heer` is the 1st note (`g4`), `ik` the 2nd, and so on: measure 1 has 8
notes ("Heer … mij"), measure 2 has 5 ("ver-hoor mij o Heer"), so the third
"Heer" is the `c2` at the start of measure 3, and "ik" after it the `bes4`
with the `\break`. In other tones a melisma shows up as `\skip1`: `Heer __ \skip1 ik`
means "Heer" is sung on two notes, and "ik" is the 3rd note.

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
  `\break`; don't leave both. Nothing else is needed for it, also in a file
  that never had a break inside a measure (see the next section). Break
  only before the first note of a word.

- **Accidentals after a break inside a measure.** LilyPond doesn't repeat an
  accidental after a line break if it was printed earlier in the same
  measure, so a C♯ in the new line would show as a plain C. Add `!` after
  the pitch (and its octave marks) of the first such note after the break,
  in every voice where it happens: `cis4` becomes `cis!4`, `cis'4` becomes
  `cis'!4`. When you move a break, move these too: remove the `!` at the
  old break (it would print a needless sharp) and check the notes after the
  new one. `check-pdf-notes.py` (see "Building and checking") reports a
  missing one as a wrong pitch.

## A file without breaks inside measures

A `.ly` straight from `rebuild-score.py` (any `NAME.ly`, or a choir print made
without `--free-breaks` and without a `layouts.txt` line) breaks only at
barlines. To break inside a measure there:

1. **A break you choose:** just put `\break` before the note, as above, and
   add the forced accidentals after it (see "Adding a break"). That is all:
   LilyPond (2.26) obeys a `\break` anywhere, also inside a measure. The
   measure numbers stay as they were; a line that starts inside a measure
   just has no number at its start. (Tried on tone 5, with a break in
   measure 6 between "mij" and "o": with `cis!4` for the alto's C♯ after the
   break, `check-pdf-notes.py` says `OK`.)

2. **Letting LilyPond choose breaks inside measures:** it only does that
   when this line comes after the `\include` line(s) at the top:

   ```lilypond
   \layout { \context { \Score forbidBreakBetweenBarLines = ##f } }
   ```

   Then it may break before any note, also in the middle of a word, so put
   `\noBreak` before every soprano note that doesn't start a word (a
   syllable after `--`, a `\skip1`, or the second half of a word split at a
   melisma, like "wie __ rook"). `koor-variant.py --free-breaks` does all of
   this for you, writes the breaks it got as `\break`s and adds the forced
   accidentals; use that rather than doing it by hand.

An invisible barline (`\bar ""`) before the `\break` isn't needed, and it
doesn't help with the accidentals either: they only start afresh in a real
new measure, as made by `tools/mscz-split-measures.py` (which the
`layouts.txt` route uses).

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
lilypond -I . -o heer_ik_roep_koor/heer_ik_roep_t4_koor heer_ik_roep_koor/heer_ik_roep_t4_koor.ly
tools/check-pdf-notes.py heer_ik_roep_t4.mscz heer_ik_roep_koor/heer_ik_roep_t4_koor.pdf
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
