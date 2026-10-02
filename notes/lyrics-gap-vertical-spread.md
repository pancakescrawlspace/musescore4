# Extra space below lyrics (looks like room for a second verse)

*Analysis 2026-10-02, MuseScore 4.7.5*

## Symptom

Some systems leave a large empty gap between the lyrics under the upper
staff and the lower staff, as if MuseScore were reserving room for a second
line of lyrics. Example: `o_czom.mscz`, page 2, all three systems. Page 1
of the same score looks normal.

## What it was *not*

There is no hidden second verse. Every `.mscz` in this repo was checked:
no lyrics have `<no>` > 0 (i.e. verse 2 or higher), and no lyric text
contains line breaks. Every score has just one line of lyrics.

## Cause

Vertical justification (`enableVerticalSpread` = 1, on in every score).
When a page is not full, MuseScore spreads the leftover height down the page.
It puts that space between systems, and also between the staves inside a
system, up to the **Max. staff distance** (`maxStaffSpread`). That was at
the default of 20 spaces. The extra room landed between the lyrics and the
lower staff, so it looked like space kept for a second verse.

Full pages (like page 1 of `o_czom`) have no leftover height to hand out,
which is why the problem only showed on underfilled pages.

## Fix

Lowered `maxStaffSpread` from 20 to **8** spaces in the style
(`score_style.mss` inside each `.mscz`) of all 14 scores.

In the MuseScore UI: Format → Style → Page → *Max. staff distance*
(vertical justification section).

On underfilled pages the extra space now goes only between systems, and
the staves in each system stay together. Nothing else in the files was
changed.

## Verification

- `o_czom` exported before and after: page 1 identical; on page 2 the
  lyrics now sit close to both staves in every system.
- With `maxStaffSpread` = 8 and = 3.5 the result for `o_czom` was the
  same: the lyrics already set the minimum gap. 8 leaves a little slack.
- All 14 modified files open and export to PDF from the command line.

## Notes for later

- If a sparse page should have a bit more room between staves, pick a value
  between 8 and 20.
- New scores created from MuseScore's default style get 20 again; change
  it there (or save a custom style) to avoid the problem.
- Exported PDFs/MP4s made before this change still show the old spacing.

## How to inspect / change it from the command line

```sh
# show the setting in a score
unzip -p o_czom.mscz score_style.mss | grep maxStaffSpread

# change it in place
mkdir -p /tmp/fix && cd /tmp/fix
unzip -o /path/to/score.mscz score_style.mss
sed -i '' 's#<maxStaffSpread>20</maxStaffSpread>#<maxStaffSpread>8</maxStaffSpread>#' score_style.mss
zip /path/to/score.mscz score_style.mss

# export to check
"/Applications/MuseScore 4.app/Contents/MacOS/mscore" -o out.pdf /path/to/score.mscz
```
