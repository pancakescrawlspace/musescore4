# Church scores

Liturgical choir scores, written in MuseScore 4. The `.mscz` files are the
source; everything else here is generated from them: MusicXML, LilyPond
`.ly` and PDF.

## Files per score

For a score `X`:

| File | What it is |
|---|---|
| `X.mscz` | The score. Edit only this one. |
| `X_timesig.mscz` | Generated copy with hidden time signatures (see below). |
| `X_timesig.musicxml` | MusicXML export of the copy. |
| `X_timesig.ly` | `musicxml2ly` output plus a few hand edits. |
| `X_timesig.pdf` | The engraved score. |

Scores that have real time signatures skip the hidden-time-signature copy
and use `_styled` instead of `_timesig`. That applies to
`groot_prokimen_pinksteren`, `nog_vele_jaren_trouwmap` and `o_czom`.

Older files without a suffix (`heer_ik_roep_t1.ly`, `heer_ik_roep_t3.pdf`,
`onder_uwe_hoede.mxl`, …) are earlier exports and not part of this
pipeline. `o_czom.ly`/`o_czom.pdf` are an earlier hand-finished version:
don't regenerate them. `o_czom.mscz` now has all four of its verses, and
`o_czom_styled.*` generated from it has the same music and lyrics. It
differs only in house style (title layout, default lyric spacing) and
uses ’ throughout where the hand-finished file sometimes has '.

## Why the `_timesig` copy

Most of these scores have no time signature, only measures of custom
length (chant-style psalm tones). Their MusicXML export has no `<time>`,
so `musicxml2ly` writes no `\time` and LilyPond rebars everything as 4/4.
`tools/mscz-add-hidden-timesig.py` makes a copy with a hidden time
signature wherever the measure length changes. Its export carries
`<time print-object="no">`, which becomes
`\time 14/4 \omit Staff.TimeSignature` in the `.ly`, so the barlines match
MuseScore.

## Rebuilding a score

After saving `X.mscz` in MuseScore:

```sh
tools/rebuild-score.py X            # e.g. tools/rebuild-score.py heer_ik_roep_t3
tools/rebuild-score.py X Y Z        # several at once
```

This runs all the steps below. It picks the route from the score: a score
with time signatures goes the `_styled` route, a free-meter one the
`_timesig` route. The generic hand edits (and the line-break spacer below)
are carried over from the current `.ly`; a score without a `.ly` yet gets
its title and subtitle from its title frame. If a `.ly` has hand edits
the script can't carry over (groot_prokimen's voltas), it stops before
replacing the `.ly`, so you can run the steps by hand. It also runs the
note check, and rejoins `heer_ik_roep_alle_tonen.pdf` when a Heer ik roep
tone was rebuilt.

It adds one thing `musicxml2ly` can't: the count of a repeat played three
or more times ("3×" above the end repeat, at the lyrics' size, as in
onder_uwe_hoede's last measure), using `\textEndMark`. Repeats with volta brackets don't need
it, and a count of 2 isn't printed (also as in MuseScore).

The steps it runs, for doing it by hand (from the repository root):

```sh
# 1. hidden time signatures (skip for the _styled scores)
tools/mscz-add-hidden-timesig.py X.mscz X_timesig.mscz

# 2. MusicXML (the _styled scores export X.mscz to X_styled.musicxml)
"/Applications/MuseScore 4.app/Contents/MacOS/mscore" -o X_timesig.musicxml X_timesig.mscz

# 3. LilyPond source
musicxml2ly -o X_timesig.ly X_timesig.musicxml
rm -f X_timesig.ly~      # backup left behind by musicxml2ly's convert-ly step

# 4. hand edits (below)

# 5. PDF
lilypond X_timesig.ly

# 6. check the notes in the PDF against the score
tools/check-pdf-notes.py X.mscz X_timesig.pdf
```

`mscore -o` sometimes exits with status 134 after writing a complete file,
so check that the MusicXML ends with `</score-partwise>` rather than
trusting the exit status (see "MuseScore command line" below).

### Hand edits to the `.ly`

Step 3 overwrites the `.ly`, so reapply these afterwards. Each `.ly` lists
its hand edits in a comment near the top, and `git diff` shows anything
you missed.

In every `_timesig.ly` and `_styled.ly`:

- `\include "church_style.ily"` right after `\version`;
- the comment `% hand edits after conversion: …` after musicxml2ly's
  "automatically converted" line;
- in `\header`, replace musicxml2ly's `title` ("Untitled score") and
  `composer` with the title from the score's title frame, plus `subtitle`
  if there is one (e.g. `subtitle = "toon 3"`).

A few files have more, each marked with a `% hand edit:` comment:

- `canon_kruisverheffing_timesig.ly`: `{ s4*15 \bar "" }` before the first
  voice, which allows a line break in the long first measure.
- `groot_prokimen_pinksteren_styled.ly`: a new system for the voltas, the
  volta label `1.-2.` (LilyPond 2.24's volta font has no comma or en dash),
  and the final barline (musicxml2ly drops it inside `\alternative`).

`groot_prokimen_pinksteren.mscz` also has hidden copies of its two voltas
on the men's staff. MuseScore exports voltas only on staves that have
them, and `musicxml2ly` needs them in every part. The copies aren't linked
to the originals, so mirror any volta change there.

### House style

`church_style.ily` holds the shared look: Helvetica throughout, 14 pt
lyrics, no staff names, verse numbers only when a score has more than one
verse, no first-system indent, no footer, and the title on the left with
the subtitle on the right (or the title centered when there is no
subtitle). It uses LilyPond 2.24 syntax.

### Checking the result

`tools/check-pdf-notes.py` reads the notes back from the PDF itself and
compares them with the `.mscz`: pitch and spelling, durations, measures
and slurs. It covers the two-staff SATB layout with quarter, half and
whole notes; anything else (rests, ties, beams, tuplets) is reported as
unsupported rather than passed. See `tools/README.md`.

## Heer ik roep: all eight tones

`heer_ik_roep_alle_tonen.pdf` is the eight `heer_ik_roep_tN_timesig.pdf`
files, toon 1 to toon 8, one per page. `tools/rebuild-score.py` rejoins it
when it rebuilds a tone; by hand:

```sh
qpdf --empty --pages heer_ik_roep_t{1,2,3,4,5,6,7,8}_timesig.pdf -- heer_ik_roep_alle_tonen.pdf
```

## Videos

The `heer_ik_roep_tN.mp4` videos (not in git) are made from the `.mscz`
with MuseScore's video export, using "Reflow to fit video resolution":

```sh
tools/score-video.py heer_ik_roep_t{1,2,3,4,5,6,7,8}.mscz    # writes heer_ik_roep_tN.mp4
```

The defaults (1080p, 24 fps) match the export dialog's defaults; use
`--resolution` and `--fps` for others. `heer_ik_roep_t4_piano.mp4` is a
separate video and isn't made this way.

## MuseScore command line

Findings about `mscore` (MuseScore Studio 4.7.5, at
`/Applications/MuseScore 4.app/Contents/MacOS/mscore`):

- **Exit status:** `mscore -o` sometimes exits with status 134 after
  writing a complete file. Check the output file, not the exit status.
- **Video export:** `mscore --score-video -o out.mp4 score.mscz` makes the
  same video as File > Export > Video, with options `--resolution`
  (2160p … 360p, default 1080p), `--fps` (60, 30, 24; default 24), `--ls`
  and `--ts` (pause before and after playback, default 3 s) and
  `--no-audio`.
- **No reflow from the command line:** the command line always uses "Use
  page layout", which shows whole A4 pages scaled into the frame. "Reflow
  to fit video resolution" is set only in the export dialog. It isn't saved
  in MuseScore's preferences, and no command-line option sets it. (In the
  source, `src/importexport/videoexport`: the view mode defaults to
  `PageFull`, and only the dialog calls `setViewMode(Flexible)`.)
- **What reflow does** (`VideoWriter::prepareScore`, view mode
  `Flexible`): it hides the title frame and the instrument names. It sets
  the page to the video size at 300 dpi (6.4 × 3.6 in for 1080p), with no
  top or bottom margins, one-sided, without header or footer, system
  distance 10 sp and staff borders 7/5 sp. Scores with more than three
  staves are also scaled to fit a whole page's height.
- **The title card:** the video opens with a card showing the score's
  title, taken from the title frame (`notationTitle()`). If there is no
  title frame, it falls back to the `workTitle` metadata (File > Project
  properties), which in these scores is still MuseScore's default
  "Untitled score".
- **View settings are ignored:** the command line ignores
  `showVerticalFrames` in the `.mscz`'s `viewsettings.json`, so it can't
  hide the title frame the way reflow does.
- **How `tools/score-video.py` gets reflow anyway:** it makes reflow's
  changes in a temporary copy of the score: the style in `score_style.mss`
  inside the `.mscz`, and removing the title frame, with the frame's title
  text copied into `workTitle` for the title card. It then exports that
  copy with page layout. Because the page now has the video's aspect
  ratio, page layout fills the frame exactly as reflow does. Checked
  against `heer_ik_roep_t2.mp4` exported from the dialog: every frame of
  the video is identical. Not handled: scores with more than three staves,
  and instrument names (these scores hide them already).
- **Repeat counts:** a repeated passage is marked with start/end repeat
  barlines, and the end repeat's "play count" says how often it is played
  (Properties panel on the barline). The count printed above it is a
  separate `PlayCountText` element (style "Play count text" under
  Repeats). MuseScore's presets write "3x" with a letter x; onder_uwe_hoede
  uses the custom text "3×" instead, to match the PDF. MuseScore adds the
  element only when you change the play count in the interface, and it
  isn't exported to MusicXML. So a repeat made by
  editing the `.mscz` file needs that element added too, and the LilyPond
  side gets the count from `rebuild-score.py`.

## Lyrics in MuseScore

The conversion depends on how lyrics are entered:

- A syllable sung on several notes gets a melisma line (the underscore in
  MuseScore's lyric entry), reaching the last note. MuseScore only draws
  that line on a word's last syllable, so a word-internal melisma is
  entered as separate words: "sme ___ king" rather than "sme-king".
- Syllables that soprano and alto sing together go on the soprano
  (voice 1). Syllables entered on voice 2 end up on a separate, lower
  lyric line in LilyPond.

## Beginsystemen

`beginsystemen/stichiertonen/` holds the first system of each tone, put
together on one page by `beginsystemen.typ`, which includes the cropped
SVGs. The `heer_ik_roep_tN_first_sys.ly` files there are edited by hand
(marked `%rene`) and are not regenerated by the steps above.

## Tools

- MuseScore Studio 4 (`mscore` inside the app bundle), plus FFmpeg for its
  video export
- LilyPond 2.24 with `musicxml2ly`
- `mutool` (MuPDF), used by `check-pdf-notes.py`
- `qpdf`, for the combined PDF

`.mscz` files are stored in Git LFS. `.mp3`/`.mp4` renderings are
ignored by git.
