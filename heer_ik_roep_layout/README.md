# Heer ik roep: trial layouts

Tones 1 and 3 have the line breaks of the choir's sheets (photographed). Both
have six lines, with a split measure (an invisible barline) in m4 and m8:

    m1 m2 | m3 m4a | m4b m5 m6 | m7 m8a | m8b m9 | m10 m11

This folder tries that layout on the other tones, without replacing anything;
the scores next to the repository root are unchanged. Two variants, after the
split points of tone 1 and tone 3:

| suffix    | m4 split before | m8 split before | like   |
|-----------|-----------------|-----------------|--------|
| `_als_t1` | "sme-king"      | "voor"          | tone 1 |
| `_als_t3` | "mijn"          | "Uw"            | tone 3 |

- Tone 2 has only `_als_t1`: split before "mijn", the third line ("mijn
  sme-king … o Heer") is about 10% wider than the page at 16pt. Tone 2 in the
  root keeps its own sheet's layout (m4, m6 and m8 split).
- Tones 4-8 have both.

Every variant has its `.mscz`, `.musicxml`, `.ly` and `.pdf` (14pt) here,
and its choir print (16pt, `_koor.ly` and `_koor.pdf`) in `koor/`; all are
one page and pass `tools/check-pdf-notes.py`. Also in `koor/`, the whole set
of eight choir prints, tones 1 and 3 as in `../heer_ik_roep_koor/` and tone 2
as `_als_t1`:

- `heer_ik_roep_alle_tonen_koor_als_t1.pdf`: tones 4-8 like tone 1;
- `heer_ik_roep_alle_tonen_koor_als_t3.pdf`: tones 4-8 like tone 3.

Made with (`SPLITS` = `4:8 8:4` for `_als_t1`, `4:7 8:5` for `_als_t3`):

```sh
tools/mscz-split-measures.py heer_ik_roep_layout/NAME.mscz SPLITS --line-breaks 2,4a,6,8a,9
tools/rebuild-score.py heer_ik_roep_layout/NAME
tools/koor-variant.py --out-dir heer_ik_roep_layout/koor heer_ik_roep_layout/NAME
```

To adopt a variant, copy its `.mscz` over `heer_ik_roep_tN.mscz` in the root
and rebuild there (`rebuild-score.py`, then `koor-variant.py --out-dir
heer_ik_roep_koor`).
