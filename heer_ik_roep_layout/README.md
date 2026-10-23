# Heer ik roep: trial layouts for the choir prints

The choir prints of tones 1 and 3 (`../heer_ik_roep_koor/`) have the line
breaks of the choir's sheets (photographed): six lines, with a split measure
(an invisible barline) in m4 and m8:

    m1 m2 | m3 m4a | m4b m5 m6 | m7 m8a | m8b m9 | m10 m11

This folder tries that layout on the choir prints (16pt) of the other tones,
without replacing anything. Two variants, after the split points of tone 1
and tone 3:

| suffix    | m4 split before | m8 split before | like   |
|-----------|-----------------|-----------------|--------|
| `_als_t1` | "sme-king"      | "voor"          | tone 1 |
| `_als_t3` | "mijn"          | "Uw"            | tone 3 |

- Tone 2 has only `_als_t1`: split before "mijn", the third line ("mijn
  sme-king … o Heer") is about 10% wider than the page at 16pt. Tone 2's
  choir print in `../heer_ik_roep_koor/` keeps its own sheet's layout (m4, m6
  and m8 split).
- Tones 4-8 have both.

Each `NAME_koor.pdf` is one page and passes `tools/check-pdf-notes.py`. The
whole set of eight choir prints, tones 1 and 3 as in `../heer_ik_roep_koor/`
and tone 2 as `_als_t1`:

- `heer_ik_roep_alle_tonen_koor_als_t1.pdf`: tones 4-8 like tone 1;
- `heer_ik_roep_alle_tonen_koor_als_t3.pdf`: tones 4-8 like tone 3.

The layouts are in `layouts.txt`; the scores themselves aren't split.
`tools/koor-variant.py` splits a temporary copy of the source score and makes
the choir print from it:

```sh
tools/koor-variant.py --out-dir heer_ik_roep_layout heer_ik_roep_t4_als_t1
```

To adopt a variant, copy its line to `../heer_ik_roep_koor/layouts.txt`
without the name and with the source score as the name (for example
`heer_ik_roep_t4  4:8 8:4 | 2,4a,6,8a,9`), and run
`tools/koor-variant.py --out-dir heer_ik_roep_koor heer_ik_roep_t4` (without
`--free-breaks`).
