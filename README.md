# Church scores

Liturgical choir scores, written in MuseScore 4. The `.mscz` files are the
source; everything else here is generated from them: MusicXML, LilyPond
`.ly` and PDF.

## Files per score

For a score `X`:

| File | What it is |
|---|---|
| `X.mscz` | The score. Edit only this one. |
| `X.musicxml` | Its MusicXML export. |
| `X.ly` | `musicxml2ly` output plus a few hand edits. |
| `X.pdf` | The engraved score. |
| `X.mp4` | Video (not in git), see "Videos". |

`o_czom_hand.ly`/`o_czom_hand.pdf` (with the `o_czom_hand.musicxml` it
was converted from) are an earlier hand-finished version of o_czom: don't
regenerate them. `o_czom_hand.ly` is LilyPond 2.24 code; to compile it
with 2.26, first run `convert-ly -e o_czom_hand.ly`. `o_czom.png` is the original score it was transcribed
from. The generated `o_czom.*` has the same music and lyrics as the hand
version; it differs only in house style (title layout, default lyric
spacing) and uses ’ throughout where the hand version sometimes has '.

`groot_prokimen_pinksteren_alt.ly`/`.pdf` are a hand-made alternative
layout of groot_prokimen, written from `groot_prokimen_pinksteren.ly`:
no voltas, but mm1–18 as the piece, then the caption "De laatste keer
worden de drie slotmaten als volgt gezongen:" and the last-time ending
(mm19–21) as a separate small score. Don't regenerate it; mirror note
changes by hand.

(Until 2026-10-16 the generated files of groot_prokimen_pinksteren,
nog_vele_jaren_trouwmap and o_czom were named `X_styled.*`, and the hand
version was `o_czom.ly`/`.pdf`.)

## Hidden time signatures

Most of these scores are in free meter: measures of custom length
(chant-style psalm tones), no visible time signature. Without any time
signature, their MusicXML export has no `<time>`, so `musicxml2ly` writes
no `\time` and LilyPond rebars everything as 4/4. So each of them has a
hidden time signature wherever the measure length changes. The export
then carries `<time print-object="no">`, which becomes
`\time 14/4 \omit Staff.TimeSignature` in the `.ly`, and the barlines
match MuseScore.

The hidden time signatures also show no courtesy signature at a line
break, so MuseScore looks exactly as without them. For a new free-meter
score, add them once:

```sh
tools/mscz-add-hidden-timesig.py X.mscz      # in place
```

After that, keep them right when you change a measure's length: give the
measure a time signature of its new length (and hide it, without courtesy
signature), or the measures after it get the wrong one. `rebuild-score.py`
refuses a score without any time signatures.

(Until 2026-10-16 the hidden time signatures lived in separate generated
`X_timesig.mscz` copies, and all outputs were named `X_timesig.*`.)

## Rebuilding a score

After saving `X.mscz` in MuseScore:

```sh
tools/rebuild-score.py X            # e.g. tools/rebuild-score.py heer_ik_roep_t3
tools/rebuild-score.py X Y Z        # several at once
```

This runs all the steps below. The generic hand edits (and the line-break spacer below)
are carried over from the current `.ly`; a score without a `.ly` yet gets
its title and subtitle from its title frame. If a `.ly` has hand edits
the script can't carry over (groot_prokimen's voltas), it stops before
replacing the `.ly`, so you can run the steps by hand. It also runs the
note check, and rejoins `heer_ik_roep_alle_tonen.pdf` when a Heer ik roep
tone was rebuilt.

It also adds what `musicxml2ly` leaves out:

- **Line breaks:** system and page breaks set in MuseScore become
  `\break`/`\pageBreak` at the same measures. They're read from the
  `.mscz` itself, because MuseScore exports them to MusicXML only with a
  matching preference. In each Heer ik roep tone, one odd-numbered measure
  has a line to itself: the one with the most notes (counting all voices;
  ties go to the earliest), which is m1 or m3. Every other line holds two
  measures. This also shows in MuseScore and the videos.
- **Verse numbers:** "1.", "2.", ... when a voice has more than one verse
  (`musicxml2ly` 2.26 no longer writes them).
- **Repeat counts:** see below.

The count of a repeat played three
or more times ("3×" above the end repeat, at the lyrics' size, as in
onder_uwe_hoede's last measure), using `\textEndMark`. Repeats with volta brackets don't need
it, and a count of 2 isn't printed (also as in MuseScore). Nor is a count
that equals the number of verses: in o_czom (four verses, the whole piece
repeated four times, so each verse gets the refrain) the verse numbers
already say it, and the count is hidden in MuseScore too.

The steps it runs, for doing it by hand (from the repository root):

```sh
# 1. MusicXML
"/Applications/MuseScore 4.app/Contents/MacOS/mscore" -o X.musicxml X.mscz

# 2. LilyPond source
musicxml2ly -o X.ly X.musicxml
rm -f X.ly~      # backup left behind by musicxml2ly's convert-ly step

# 3. hand edits (below), and the repeat count if there is one

# 4. PDF
lilypond X.ly

# 5. check the notes in the PDF against the score
tools/check-pdf-notes.py X.mscz X.pdf
```

`mscore -o` sometimes exits with status 134 after writing a complete file,
so check that the MusicXML ends with `</score-partwise>` rather than
trusting the exit status (see "MuseScore command line" below).

### Hand edits to the `.ly`

Step 2 overwrites the `.ly`, so reapply these afterwards. Each `.ly` lists
its hand edits in a comment near the top, and `git diff` shows anything
you missed.

In every generated `.ly`:

- `\include "church_style.ily"` right after `\version`;
- the comment `% hand edits after conversion: …` after musicxml2ly's
  "automatically converted" line;
- in `\header`, replace musicxml2ly's `title` ("Untitled score") and
  `composer` with the title from the score's title frame, plus `subtitle`
  if there is one (e.g. `subtitle = "toon 3"`);
- `subsubtitle` from the title frame's Subtitle text (MuseScore's
  Subtitle style, which MuseScore centers below the title), if there is
  one. MuseScore doesn't export it to MusicXML; `rebuild-score.py` reads it
  from the `.mscz` on every rebuild (bogoroditse_dievo: "Verheug U Maagd").

A few files have more, each marked with a `% hand edit:` comment:

- `canon_kruisverheffing.ly`: `{ s4*15 \bar "" }` before the first
  voice, which allows a line break in the long first measure.
- `groot_prokimen_pinksteren.ly`: a new system for the voltas, their
  labels "Alle keren behalve de laatste" and "Laatste keer" in 10 pt
  bold (musicxml2ly leaves out the ending text), a final barline instead of the end repeat after
  the first volta, the final barline at the end (musicxml2ly drops
  it inside `\alternative`), and `allow-span-bar = ##f` on both staves so
  the barlines aren't connected, as in MuseScore (this `.ly` is older
  `musicxml2ly` output, from before 2.26, which writes that itself). The prokimen is sung several times, but not
  straight after each other and not a fixed number of times, so the
  score has voltas without repeat barlines, labelled in words.

`groot_prokimen_pinksteren.mscz` also has hidden copies of its two voltas
on the men's staff. MuseScore exports voltas only on staves that have
them, and `musicxml2ly` needs them in every part. The copies aren't linked
to the originals, so mirror any volta change there.

### House style

`church_style.ily` holds the shared look: Helvetica throughout, 14 pt
lyrics, no staff names, verse numbers only when a score has more than one
verse, no first-system indent, no footer, and the title on the left with
the subtitle on the right (or the title centered when there is no
subtitle). A subsubtitle goes centered below the title, in bold at 14 pt
(the title is about 17.5 pt). It uses LilyPond 2.26 syntax. The minimum gap between lyric
words is 1.6. With 2.26 it was 1.4 for a while, because 1.6 didn't fit two
measures per line in the Heer ik roep tones when m11 stood alone; with the
densest odd measure alone (see "Line breaks" above) it fits.

### Checking the result

`tools/check-pdf-notes.py` reads the notes back from the PDF itself and
compares them with the `.mscz`: pitch and spelling, durations, measures
and slurs. It also rejects stems that point against their voice. It covers the two-staff SATB layout with whole notes down
to sixteenths (flags and beams) and chords within a voice; anything else
(rests, ties, tuplets) is reported as unsupported rather than passed. See
`tools/README.md`.

## Heer ik roep: all eight tones

`heer_ik_roep_alle_tonen.pdf` is the eight `heer_ik_roep_tN.pdf`
files, toon 1 to toon 8, one per page. `tools/rebuild-score.py` rejoins it
when it rebuilds a tone; by hand:

```sh
qpdf --empty --pages heer_ik_roep_t{1,2,3,4,5,6,7,8}.pdf -- heer_ik_roep_alle_tonen.pdf
```

## Videos

The `heer_ik_roep_tN.mp4` videos (not in git) are made from the `.mscz`
with MuseScore's video export, using "Reflow to fit video resolution":

```sh
tools/score-video.py heer_ik_roep_t{1,2,3,4,5,6,7,8}.mscz    # writes heer_ik_roep_tN.mp4
tools/video-audio.py --audio-dir . heer_ik_roep_t{1,2,3,4,5,6,7,8}.mscz   # audio at 320 kbps
```

The defaults (1080p, 24 fps) match the export dialog's defaults; use
`--resolution` and `--fps` for others. `video-audio.py` replaces
MuseScore's audio (AAC at about 125 kbps) by the same audio at 320 kbps;
without it the video keeps MuseScore's (see `tools/README.md`). `heer_ik_roep_t4_piano.mp4` is a
separate video and isn't made this way. `onder_uwe_hoede.mp4` and
`o_czom.mp4` are made the same way.

The spotlighted videos in `video/` show the two staves with one voice in
red, and sound from a copy of the score with a staff per voice, one voice
on a solo instrument and the others on piano: two scores per video, put
together by `tools/video-audio.py`. The recipe is in `tools/README.md`
under "One staff per voice in MuseScore".

## MuseScore command line

Findings about `mscore` (MuseScore Studio 4.7.5, at
`/Applications/MuseScore 4.app/Contents/MacOS/mscore`):

- **Exit status:** `mscore -o` sometimes exits with status 134 after
  writing a complete file. Check the output file, not the exit status.
- **Video export:** `mscore --score-video -o out.mp4 score.mscz` makes the
  same video as File > Export > Video, with options `--resolution`
  (2160p … 360p, default 1080p), `--fps` (60, 30, 24; default 24), `--ls`
  and `--ts` (pause before and after playback, default 3 s) and
  `--no-audio`. Its audio is AAC, 44.1 kHz stereo, at about 125 kbps, and
  no option changes that (`tools/video-audio.py` replaces it afterwards).
  The audio starts 3.0418 s into the video (at the defaults), after the
  title card, at the start of a WAV export of the same score.
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
  "Untitled score". The card shows only the title's first line, so a
  title like "Heer ik roep" + line break + "toon 1" loses the tone, in the
  dialog's export too.
- **View settings are ignored:** the command line ignores
  `showVerticalFrames` in the `.mscz`'s `viewsettings.json`, so it can't
  hide the title frame the way reflow does.
- **How `tools/score-reflow.py` gets reflow anyway:** it makes reflow's
  changes in a copy of the score (kept, for `tools/score-video.py` to
  export or for MuseScore's dialog with reflow off): the style in `score_style.mss`
  inside the `.mscz`, and removing the title frame, with the frame's title
  text copied into `workTitle` for the title card, its lines joined
  with " – " ("Heer ik roep – toon 1"; since 2026-10-20, so the videos
  made before then lack the tone). `score-video.py` then exports that
  copy with page layout. Because the page now has the video's aspect
  ratio, page layout fills the frame exactly as reflow does. Checked
  against `heer_ik_roep_t2.mp4` exported from the dialog: every frame of
  the video is identical. Reflow also hides instrument names ("Women",
  "W."), so the copy gets empty names. Not copied: for more than three
  staves reflow renders at a lower dpi, so that the original page's height
  fits the video (`VideoWriter::prepareScore`: video height × 1200 / (page
  height in 1/1200 in − margins + 200), about 91 dpi for A4 at 1080p). That
  makes a short four-staff score one unreadable line; the script keeps
  300 dpi, and `--staff-scale` shrinks the staves where a system is taller
  than the frame, or enlarges them where it fills only part of it (with
  `--top-margin` and `--side-margin`, see `tools/README.md`).
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
- Stressed syllables can be marked by underlining them (select the
  syllable's text while editing it, and underline it). `musicxml2ly` turns
  that into `\markup \underline`, and `rebuild-score.py` makes it
  `\markup \stressed`, which `church_style.ily` draws as a thick red line
  a little below the text, so it clears a "g" and doesn't look like a
  melisma line. MuseScore itself shows a plain black underline. Used in
  ti_ipermacho, for the stress of the transliterated Greek.

## Beginsystemen

`beginsystemen/stichiertonen/` holds the first system of each tone, put
together on one page by `beginsystemen.typ`, which includes the cropped
SVGs. The `heer_ik_roep_tN_first_sys.mscz` scores have a hidden time
signature in every measure, so the MusicXML export carries the barlines
and `musicxml2ly` gets them right. The `.ly` files were converted from that
and then edited by hand (marked `%rene` and `hand edit`); they are not
regenerated by the steps above.

To rebuild the page, in that directory (each `.ly` also has its build
command in a comment at the top):

```sh
for i in 1 2 3 4 5 6 7 8; do
  lilypond heer_ik_roep_t${i}_first_sys.ly                  # .pdf
  lilypond -dbackend=svg -dcrop heer_ik_roep_t${i}_first_sys.ly   # .svg and .cropped.svg
done
typst compile beginsystemen.typ                              # beginsystemen.pdf
```

Until 2026-10-18 the page was built from separate versions without time
signatures, whose barlines were corrected by hand in the `.ly`, and the
versions with time signatures were named `heer_ik_roep_tN_first_sys_timesig.*`.
These files were LilyPond 2.24 until 2026-10-18. With 2.26 they
set the side margins to 2.24's 10 mm (2.26 has 15 mm), so the systems keep
their size on the page, and their barlines aren't connected between the
staves, as in MuseScore and the full scores.

The "Toon N" labels are Helvetica, like the page heading. In the SVG they
are text that Typst draws with its own copy of the font, and `-dcrop` cuts
exactly at LilyPond's measured box for it, which shaved the top off the T.
So each label's box is 0.25 staff space taller at the top (the
`TextScript.stencil` override). More than that pushes Toon 8 onto a second
page.

## Tools

- MuseScore Studio 4 (`mscore` inside the app bundle), plus FFmpeg for its
  video export
- `ffmpeg` and numpy for `video-audio.py`: up to 320 kbps it uses
  ffmpeg's AudioToolbox encoder `aac_at`, which only exists on macOS
  (MacPorts' ffmpeg has it)
- LilyPond 2.26 with `musicxml2ly`: the official build in
  `~/Applications/lilypond-2.26.0`, with its commands linked into
  `~/.local/bin` (MacPorts only had 2.24 and the 2.25 development version
  in October 2026). Since 2026-10-16; the `.ly` files were 2.24 before.
- `mutool` (MuPDF), used by `check-pdf-notes.py`
- `qpdf`, for the combined PDF

`.mscz` files are stored in Git LFS. `.mp3`/`.mp4` renderings are
ignored by git.
