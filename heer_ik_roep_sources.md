# Heer, ik roep (heer_ik_roep_t1–t8): sources

Where the eight tones of "Heer, ik roep tot U" (Ps. 140/141, Slavonic
«Господи, воззвах») in `heer_ik_roep_t1.mscz` … `heer_ik_roep_t8.mscz`
come from. Research of 2026-10-23. This is a summary. The full research
log, with every intermediate comparison, is in git history (up to commit
47d5dec).

## Conclusion

The Dutch tones are the stichera tones of the **contemporary Moscow
obikhod** («современная московская традиция»). This is the practice of
Moscow parish choirs: four-part close harmony, with soprano and alto in
parallel thirds. Its best printed witness is Kustovsky & Potemkina's
handbook (1999). It matches the Dutch note for note in all four voices
in tones 1, 2, 6 and 8, and differs only by a few ornamental notes in 3,
4, 5 and 7.

Nobody knows yet who made the Dutch adaptation, or whether it was made
from a printed source or from singing (see "Open questions").

## The tradition, and how the sources relate

The Moscow tones combine two older chants:

- the **Court chant** (*придворный напев*): harmonized under A. F. L'vov
  (1848), edited by N. Bakhmetev (1869) and reprinted in the 1914 Court
  Obikhod. It is in open score, with the melody in the top voice.
  Moscow takes tones 1, 3, 4, 5, 6 and 8 from it.
- the **Kievan chant** (*Киевский распев*). Moscow takes tone 7 from it,
  and tone 2 from its shortened form (*сокращённый киевский распев*).

Kustovsky & Potemkina's preface traces the melodies to the «Круг
церковных песнопений обычного напева Московской епархии» (earliest
surviving edition 1882, written down from Moscow parish precentors). It
names influences from the St Petersburg Court Chapel and from the Kiev
and Trinity-Sergius Lavras. They describe the harmony as a matter of
practice, not of any one edition: "в современной певческой практике …
верхние голоса поют мелодию напева параллельными терциями". This sets it
apart from Kastalsky (open harmony, melody in sixths), Smolensky (men's
choir, sixths) and Martynov (1991; soprano and tenor in sixths).

The sources compared fall into three groups:

- **Witnesses of the Moscow practice.** The Dutch matches these in every
  diagnostic detail. They are Kustovsky & Potemkina (1999), the closest;
  the 1996 «Живоносный Источник» book, which is the same tradition but
  not the Dutch model; a tone 1 setting from the Moscow Regent-Singing
  Seminary; and Georgy Smirnov's settings (2007, 2013, 2021). Smirnov
  names his source simply «Обиход».
- **The OCA's "Common Chant, arr. from L'vov/Bakhmetev"**: a close
  relative, also in close harmony with the melody in the alto. It is
  taken directly from Bakhmetev, so it lacks the Moscow cadence turns.
  In tones 2 and 7 it uses the Court chant, not the Kievan. In tone 5 it
  keeps the melody in the alto.
- **The Court editions** (Bakhmetev 1869, the 1914 Court Obikhod and
  azbyka.ru's retypesetting of it). In the first phrase of tones 1, 3,
  4, 5, 6 and 8 they have the Dutch melody, but in open harmony and
  without the turns.

### Diagnostic details

These features separate the Moscow practice from its relatives. Measure
numbers are those of the Dutch.

| feature of the Dutch | Moscow handbook | Smirnov | OCA | Bakhmetev / 1914 |
|---|---|---|---|---|
| tone 1: the melody keeps falling at "verhoor mij", 2…2 7 1 7 6 (m1, m5) | yes | yes | no | no (2…2 7 1) |
| tone 2: Kievan chant in F major | yes | yes (shortened Kievan; the 2007 close-harmony setting is also in F) | no: Court chant, G minor | no: Court chant |
| tone 3: a G before each first phrase, and a turn at "verhoor mij" | yes | yes (turn B♭–A–G–A for B♭–A–G–F) | no | no |
| tone 5: melody in the soprano, the alto a third below | yes | yes | no: melody in the alto | melody on top (as in all tones) |
| tone 6: D♯ in the alto (m3) | yes | yes | no (D) | – |
| tone 7: Kievan chant, reciting plainly | yes | partly: differs in m4–7, bass far off | no: Court chant, rising 7–1–2 into the reciting note | no: Court chant |

### All sources compared measure by measure

Each source was compared with the Dutch measure by measure with
`cmp_lines.py`. The scores are for soprano, alto, tenor and bass, where
1.00 means the same notes in the same order. The method is under "How
the comparisons were made".

| tone | Moscow handbook (1999) | OCA | Smirnov | other |
|---|---|---|---|---|
| 1 | **1.00 1.00 1.00 1.00** | 0.91 0.91 0.94 0.97 | 1.00 1.00 0.96 0.98 | seminary `g1.pdf` 1.00 1.00 0.94 1.00 |
| 2 | **1.00 1.00 1.00 1.00** | 0.91 0.91 0.97 0.86 | shortened Kievan 0.94 1.00 0.97 0.97; 2007 close 1.00 1.00 1.00 0.98 | Kievan (Arkhangelsk) 1.00 1.00 0.97 0.97 |
| 3 | 0.94 0.94 1.00 1.00 | 0.90 0.90 1.00 0.93 | 0.91 0.91 1.00 1.00 | |
| 4 | 1.00 1.00 1.00 0.96 | 0.99 0.99 0.94 1.00 | 0.97 0.97 1.00 0.97 | |
| 5 | 0.91 0.90 0.96 1.00 | 0.87 0.66 0.97 0.96 | 0.91 0.90 0.86 1.00 | Kievan 0.91 0.90 0.96 1.00 |
| 6 | **1.00 1.00 1.00 1.00** | 1.00 1.00 0.97 0.96 | 1.00 1.00 1.00 0.98 | |
| 7 | 0.96 0.96 1.00 0.89 | 0.83 0.83 1.00 0.92 | 0.89 0.89 0.98 0.89 | Kievan 0.96 0.96 0.88 0.99 |
| 8 | **1.00 1.00 1.00 1.00** | 1.00 1.00 0.94 1.00 | 1.00 1.00 1.00 0.98 | |

A stricter measure, which checks the order across the whole tone, put
the OCA well behind on its own tones 2, 5 and 7 (upper voices 0.24–0.48
of the Dutch notes). In tones 1, 3, 5 and 6 it put Smirnov ahead of the
OCA, and in tones 4 and 8 the OCA ahead of Smirnov. In tone 4 Smirnov
adds passing notes, and in tone 8 turns, that neither the OCA nor the
Dutch has.

## The eight tones

| tone | chant | melody in | key: Dutch / handbook | where the Dutch differs from the handbook |
|---|---|---|---|---|
| 1 | Court | alto | F / F | – |
| 2 | shortened Kievan | alto | F / F | – |
| 3 | Court | alto | F / G | an added A in soprano and alto (G A B♭ A G F G for G B♭ A G F G; m1, 3, 5, 7, 9); a slightly different cadence in m6, m11 |
| 4 | Court | alto | F / F | two bass passing notes fewer (F A D for F G A D; m6, m11) |
| 5 | Court | **soprano** | F / G | small added turns in the upper voices (E–D, C–D; m3, m9) and a longer final cadence (m6, m11); bass identical |
| 6 | Court | alto | G / G | – |
| 7 | Kievan | alto | F / G | a passing F in soprano and alto (A F G for A G); E–F neighbour notes in the bass |
| 8 | Court | alto | F / G | – |

All tones are four-part on two staves, reciting tones with cadence
formulas. The authors of the handbook expect variants like these between
choirs ("иные традиционные варианты напевов … не считать их
«неправильными»").

### Tone 5

Tone 5 was first taken to be a mixture of Court chant (melody) and
Kievan chant (bass). The Moscow sources showed that it is not. It is the
Court chant with the melody kept on top, as Smirnov and the handbook
have it, over the same bass. Only the OCA moves the melody to the alto,
so its tone 5 differs from the Dutch in soprano, alto and tenor.

## Which voice has the melody

The chant melody is in the **alto** in tones 1–4 and 6–8, with the
soprano a third above. In tone 5 it is in the **soprano**, with the alto
a third below. The other upper voice is not a second copy of the melody.
Within the key its thirds alternate between major and minor, so its
intervals differ from the melody's, and it does not fit the tone's
phrases. (The handbook's "parallel thirds" describes the texture. It
does not make the two voices equivalent.)

- **Tones 1, 3, 4, 6, 8:** the Dutch alto is the OCA's alto. The OCA's
  tutorial names that voice as the melody ("in 'narrow' or 'closed'
  harmony, and the melody is found in the alto voice"). It is also
  Bakhmetev's top voice.
- **Tones 2, 5, 7:** each Dutch voice was checked against the unison
  melody of the OCA's "Learning the Tones" (`melody_voice.py`, as scale
  degrees, mean difflib ratio per measure). Tone 2 (Kievan): alto 0.73,
  soprano 0.46. Tone 5 (Common): soprano 0.82, alto 0.53. Tone 7
  (Kievan): alto 0.94, soprano 0.47. In tone 2 the alto scores lower
  because of the Dutch's own phrase variants. In tone 7 the five-note
  melody lies on C–G, do = C, with the final on re = D. The soprano
  touches B♭, which is outside it.

## How the comparisons were made

The scripts are in [`tools/compare-sources/`](tools/compare-sources/).
They need `mutool` and read the downloaded PDFs in `references/` (see
"References"), e.g. `tools/compare-sources/cmp_oca.py 1 2 3 4 5 6 7 8`.

- `ocaread.py` reads the voices from a vector PDF (Finale, Sibelius);
  the others use it.
- `cmp_oca.py` compares the OCA's settings with `heer_ik_roep_tN.mscz`;
  `cmp_ref.py` any page, transposed, with a tone; `cmp_smirnov.py`
  Smirnov's TTBB settings (and the OCA's) by pitch class.
- `cmp_lines.py` compares a book of tone lines, measure by measure.
- `melody_voice.py` finds which voice has the melody (tones 2, 5, 7).

How they compare:

- Notes are compared by scale degree or pitch class, after transposing,
  so a change of key or of voice range does not hide a match. Repeated
  notes are merged, because English, Slavonic and Dutch put different
  numbers of syllables on a reciting note.
- **Vector PDFs** are read exactly from their noteheads and staff lines
  by `ocaread.py`. This covers the OCA's and Smirnov's PDFs and the
  handbook (Finale: Maestro, Jazz and Anastasia fonts, glyphs at U+F000+)
  and the Arkhangelsk obikhod (Sibelius, Opus font). It cannot read
  MusiXTeX PDFs or Smirnov's 2013 tone 4 file, whose fonts have no
  Unicode map.
- **Scans** were read by eye: Bakhmetev 1869 (C clefs, skewed print; an
  automatic reading with scipy proved unreliable) and the 1996 book, at
  150 dpi. Bakhmetev was compared only in the first phrase of each tone.
- **Two measures.** "Covers / match" (`cmp_oca.py`, `cmp_ref.py`,
  `cmp_smirnov.py`) aligns whole tones in order. "Covers" is the share
  of the Dutch notes that the source has. "Match" (difflib's ratio) also
  counts the source's extra notes. The per-measure measure
  (`cmp_lines.py TONE PDF PAGES [SHIFT]`) is needed for the handbook,
  which gives lines rather than a through-composed setting. It matches
  each Dutch measure with the best window anywhere in the source. Since
  it does not check the order of the lines, it is the milder of the two.
  Set SHIFT explicitly: the automatic transposition can pick the wrong
  one.

## Sources

### The contemporary Moscow obikhod

- **E. Kustovsky, N. Potemkina, *Пособие по изучению осмогласия
  современной московской традиции***, Moscow: издательство Церкви Трех
  Святителей на Кулишках, 1999. On azbyka.ru as
  [the whole book](https://azbyka.ru/kliros/wp-content/uploads/2024/12/posobie-po-izucheniyu-osmoglasiya-e.-kustovskij-n.-potemkina.pdf)
  (87 pp., with the preface, pp. 1–8) and as
  [one PDF per tone](https://azbyka.ru/kliros/posobie-po-izucheniyu-osmoglasiya-sovremennoj-moskovskoj-tradiczii/)
  (`kust/pdf/osmoglas/glasN.pdf`, page numbers as printed; tone 1 is
  pp. 12–18). For each tone it gives A. стихирный (refrain, lines 1–4,
  variants, closing line, "Порядок строк"), Б. тропарный, В.
  ирмологический and Г. прокимен. The stichera lines are what match the
  Dutch.
- ***Песнопения воскресной службы***, глас 1–8, Moscow: Православный
  центр «Живоносный Источник» в Царицыне, 1996 (ed. S. Potokina). This
  is the Sunday Octoechos with "Образцы обиходных напевов" at the end;
  the handbook names it as giving the obikhod tones "в одном варианте".
  Scans on azbyka.ru, one post per tone
  ([tone 1](https://azbyka.ru/kliros/glas-1-voskresnye-pesnopeniya-oktoiha-mosk-reg-pev-seminarii-tsl-smesh-hor/),
  [tone 2](https://azbyka.ru/kliros/voskresnye-pesnopeniya-oktoiha-glas-2-smesh-hor/)
  … `voskresnye-pesnopeniya-oktoiha-glas-N-smesh-hor/`, tone 6
  `…-gals-6-…`). "Господи, воззвах" is on PDF pages 36, 44, 48, 69, 63,
  96, 67, 76 (tones 1–8). Tone 1 is in F; tones 2–8 are in G, including
  tone 6 ("в тесном расположении"). Read by eye, it is the same
  tradition, but **not the Dutch model**. Its tenor lies on the treble
  staff in tones 1–2. Its tone 3 cadence has an upper neighbour where
  the Dutch has a lower one. Its tone 8 m2 has an extra A–B. Where the
  Dutch differs from the handbook (tones 5, 7), this book agrees with
  the handbook. Its keys agree with the Dutch only in tones 1 and 6.
- **`g1.pdf`**, on the tone 1 post above: a four-part vector setting of
  tone 1 whose URL names the Moscow Regent-Singing Seminary of the
  Trinity-Sergius Lavra. It is the Dutch in all four voices but for one
  tenor C (Dutch C♯) at the final cadence. There are no `g2` … `g8`.
- **Georgy Smirnov** (b. 1960): precentor at the Danilov Monastery and
  the Cathedral of Christ the Saviour, leader of the men's choir
  «Православные Певчие» ([precentor.ru](https://precentor.ru/s_g/info_r.html)).
  His source, as he names it, is «Обиход». It is not the Court editions:
  those lack his cadence turns.
  - [Октоих для смешанного хора](https://precentor.ru/s_g/octoechos_mix.html),
    Cathedral of Christ the Saviour, 2007 (no tone 4). Tone 2 is
    "Сокращённого киевского роспева, «Обиход»", in two layouts. The
    small-mixed-choir version in close harmony (`01c_na_gv_glas_2_tesn.pdf`)
    is the closest witness found for any tone: soprano, alto and tenor
    are the Dutch, note for note, in the same key (F). The other tones
    are the same harmonization as the men's set, revoiced. Tone 8 is in
    F, as the Dutch is.
  - [Октоих для мужского хора](https://precentor.ru/s_g/octoechos.html),
    Trinity Church in Ostankino, 2013–2015.
  - The same men's arrangements, retypeset in 2021:
    [Воскресные стихиры на Господи воззвах](https://azbyka.ru/kliros/voskresnye-stihiry-na-gospodi-vozzvah-noty-dlya-muzhskogo-hora/)
    (T1, T2, baritone, bass). Tone 2 is given there in two versions,
    the shortened Kievan chant (= the Dutch) and the Lavra chant
    (unrelated). Smirnov writes in C (tone 1 B♭, tone 6 F). T1/T2/bar./B
    correspond to the Dutch S/A/T/B; in tone 6 they are A/T/S/B. Only
    page 1 of each PDF (the psalm verses) has a Dutch counterpart.

### The Court chant

- **Bakhmetev**, *Обиход нотнаго церковнаго пения при высочайшем дворе
  употребляемый*, ч. 1, St Petersburg, Court Chapel, 1869
  ([Книжный памятник РГБ № 33912](https://knpam.rusneb.ru/kp/item33912)).
  A scan is on [ECMR, scanned chant books](https://ecmr.fi/scannedchantbooks.html)
  (`Obihod1869Bahm1.pdf`; vol. 2 is `…Bahm2.pdf`). "Господи воззвах" is
  on printed pp. 5, 8, 11, 14, 18, 21, 24, 27 (tones 1–8; PDF page =
  printed + 4). It is in open score on four staves (C clefs), with no
  key signatures and the melody on top. L'vov's own 1848 edition was not
  found online. It is not needed, since the OCA names the 1869 edition
  as its source.
- **The 1914 Court Obikhod**, "Господи воззвах, придворный напев (1914)",
  on [djuKliros: Octoechos / Гласы](https://www.djukliros.com/octoechos-%D0%B3%D0%BB%D0%B0%D1%81%D1%8B):
  the same melodies (checked in tones 1 and 2), melody in the soprano,
  tone 1 in G.
- **azbyka.ru "Обиход"**:
  [Господи, воззвах гласы 1–8 для смешанного хора](https://azbyka.ru/kliros/noty-pesnopenij-gospodi-vozzvah-glasy-1-8-dlya-smeshannogo-hora/).
  This is the 1914 edition retypeset in MusiXTeX (2001), identical
  system for system in tone 1.
- **The OCA**:
  [Learning the Tones](https://www.oca.org/liturgics/learning-the-tones),
  a self-study course for Common (L'vov-Bakhmetev) and Kievan chant
  (stichera only for now). Each tone has an explanation PDF and
  recordings (unison, full choir, each voice alone)
  ([announcement](https://www.oca.org/news/headline-news/liturgical-music-tutorial-now-available)).
  The introduction (D. Drillock, Deacon G. Ealy, in the tone 1 PDF)
  names Bakhmetev's 1869 edition as the source and puts the melody in
  the alto. The settings, "Lord, I Call", Common Chant, are at
  `https://www.oca.org/PDF/Music/ToneN/tN-lic-obikhod-tt.pdf` (e.g.
  [tone 1](https://www.oca.org/PDF/Music/Tone1/t1-lic-obikhod-tt.pdf);
  `-yy` is the "You" layout; the stichera are separate files,
  `tN-lic-stichera-obikhod-tt.pdf`). They are listed on the
  [download page per tone](https://www.oca.org/liturgics/music-downloads/tone-1)
  (`tone-1` … `tone-8`, as "Obikhod").

### The Kievan chant

- *Обиход церковного пения*, ч. 1, Храм святителя Тихона, Архангельск
  2005 (music typeset by Д. В. Аллеманов):
  [PDF on kliros.ru](http://kliros.ru/noty/obihod1_arhangelsk.pdf). See
  "Образцы напевов на «Господи воззвах»: Киевский распев", pp. 8–15
  (tone 2 p. 9 in F, tone 5 p. 12 in G, tone 7 p. 14 in G). It has
  soprano, alto and bass on two staves. Tones 2 and 7 are close to the
  Dutch, but Smirnov's shortened Kievan tone 2 and the handbook are
  closer.
- The OCA's Kievan tutorials (tones 1, 2, 7) supply the unison melodies
  used in "Which voice has the melody".

### Not online, not consulted

- *Воскресная служба Октоиха. Гласы 1–8. По обиходу Синодального хора*,
  гарм. А. Кастальского (Живоносный Источник, 2005;
  [shop listing](https://music-festivals.ru/catalog/noti/voskresnaya-sluzhba-oktoikha-glasy-1-8-po-obikhodu-sinodalnogo-khora-garm-a-kastalskogo)).
  It is ruled out anyway by its texture (open harmony, melody in sixths).
- *Осмогласие на «Господи воззвах»*, St Petersburg Theological Academy,
  2014, ISBN 978-5-906627-07-0
  ([description](https://esxatos.com/osmoglasie-na-gospodi-vozzvah-kievskogo-raspeva)).
  It has Bakhmetev in all tones and Kastalsky in tones 1, 2, 3 and 7.

### Ruled out

- The OCA's tone 1 in [Kievan chant (arr. B. Ledkovsky)](https://www.oca.org/PDF/Music/Tone1/t1-lic-kievan-tt.pdf)
  and [Serbian chant (arr. P. Drobac)](https://www.oca.org/PDF/Music/Tone1/LIC-T1-serb-tt.pdf):
  different melodies.
- Smirnov's tone 2 in Lavra chant, and Kastalsky (see above).

### Searched without result

- Dutch scores of the text ("Heer, ik roep tot U, verhoor mij", with
  "toon", "noten", "vespers", "orthodoxe parochie"): none online.
- `~/dev/liturgie`: only the Divine Liturgy, no vespers.
- [kpds42.ru: Всенощное бдение](https://kpds42.ru/pages/vsenoshchnoe-bdenie):
  no "Господи воззвах".
- For the identity of Smirnov's «Обиход»: his own pages (the tone 4
  contents cite "Обиход 1892 г." only for the dogmatik); ECMR (no
  Synodal edition); Archimandrite Matfey's library at
  [lavra-noty.ru](https://lavra-noty.ru/rukopisnaia-biblioteka-arhim-matfeia/stixiry-na-gospodi-vozzvax-100004/)
  (22 items, all Znamenny, Kievan or monastery chants).

## Open questions

1. **Who made the Dutch adaptation**, and when. A Dutch parish book or
   the choir's own sheets would settle it.
2. **From what.** The adapter may have worked from a printed witness or
   from singing. Of the printed witnesses found, the handbook is the
   closest. The 1996 book is not the model.
3. **The keys.** The Dutch keys (F, tone 6 G) are the OCA's in every
   tone but 2 (the OCA has G minor). The handbook's keys agree only in
   tones 1, 2, 4 and 6, and the 1996 book's only in 1 and 6. This may
   mean the adapter also used the OCA's settings, or it may just reflect
   a convenient common key.

## References

Local copies of the sources of this file and the other `*_sources.md`
files are kept in `references/` (gitignored,
about 72 MB, most of it the Bakhmetev scan).
[`tools/download-references.sh`](tools/download-references.sh) downloads
them again.

- `bogoroditse_dievo/`
  - `kpds42_arkhangelsky_greek.pdf`, `.mid`: the arrangement, as
    [PDF](https://kpds42.ru/files/content/bogorodice_devo_grecheskiy_arhangelskiy.pdf)
    and [MIDI](https://kpds42.ru/files/content/bogorodice_devo_grecheskiy_arhangelskiy.mid)
    (kpds42.ru)
  - `azbyka_grecheskaya.pdf`: [Greek chant, another harmonization](https://azbyka.ru/kliros/wp-content/uploads/2023/05/bogorodicze-devo-grecheskaya.pdf)
  - `azbyka_grecheskogo_raspeva_gl4.pdf`: [Greek chant, tone 4, in D major](https://azbyka.ru/kliros/wp-content/uploads/2023/05/bogoroditse_devo_grecheskogo_raspeva_gl_4.pdf)
  - `azbyka_arkhangelsky_op39_no8.pdf`: [Arkhangelsky's own Op. 39 No. 8](https://azbyka.ru/kliros/wp-content/uploads/2026/05/bogorodicze-devo-arhangelskij-or-39-%E2%84%96-8-4g-smh.pdf)
- `heer_ik_roep/`
  - `moscow_osmoglasie/`: Kustovsky & Potemkina 1999
    - `glas1.pdf` … `glas8.pdf`, `glas4a.pdf` (tone 4 prokeimena),
      `glashelp.pdf` (the signs used): [one PDF per tone](https://azbyka.ru/kliros/posobie-po-izucheniyu-osmoglasiya-sovremennoj-moskovskoj-tradiczii/)
    - `posobie-po-izucheniyu-osmoglasiya-e.-kustovskij-n.-potemkina.pdf`:
      [the whole book](https://azbyka.ru/kliros/wp-content/uploads/2024/12/posobie-po-izucheniyu-osmoglasiya-e.-kustovskij-n.-potemkina.pdf),
      from [Обиход церковного пения: нотные сборники](https://azbyka.ru/kliros/obihod-czerkovnogo-peniya-notnye-sborniki/)
  - `mrps/`: «Песнопения воскресной службы», 1996, from the azbyka.ru
    posts per tone ([tone 1](https://azbyka.ru/kliros/glas-1-voskresnye-pesnopeniya-oktoiha-mosk-reg-pev-seminarii-tsl-smesh-hor/),
    [tone 2](https://azbyka.ru/kliros/voskresnye-pesnopeniya-oktoiha-glas-2-smesh-hor/) …;
    the directory is named after the tone 1 post's "mosk-reg-pev-seminarii")
    - `pesnopenia_voskresnoy_sluzhby_glas_1.pdf` … `_8.pdf`: the scans
    - `g1.pdf`: tone 1, the seminary setting
  - `smirnov/`: Smirnov's settings for men's choir, 2021, from
    [azbyka.ru](https://azbyka.ru/kliros/voskresnye-stihiry-na-gospodi-vozzvah-noty-dlya-muzhskogo-hora/):
    `glas-1-red-smirnova.pdf`, `glas-3-…` … `glas-8-red-smirnova.pdf`,
    `glas-2-sokr-kievskogo-rospeva.pdf`, `glas-2-lavrskogo-napeva.pdf`
    - `precentor/`: from Smirnov's own site, each file named
      `<tone dir>_<file>.pdf` after its URL `…/<tone dir>/<file>.pdf`
      - `men/`: [Октоих для мужского хора](https://precentor.ru/s_g/octoechos.html),
        2013–2015: contents pages of tones 1–8, "Господи воззвах" tones 1 and 4
      - `mix/`: [Октоих для смешанного хора](https://precentor.ru/s_g/octoechos_mix.html),
        2007: "Господи воззвах" tones 1, 2 (four versions), 3, 5–8
  - `bakhmetev_obikhod_1869_vol1_ecmr.pdf`: Bakhmetev's Obikhod, vol. 1
    (217 pages), from [ECMR](https://ecmr.fi/scannedchantbooks.html)
    through the [Wayback Machine](https://web.archive.org/web/2025/https://ecmr.fi/scannedchantbooks.html)
  - `court_obikhod_1914_djukliros.pdf`: the 1914 Court Obikhod (28 pages),
    on [Google Drive](https://drive.google.com/open?id=1oRzhP6P_ELtLYkSjQFdhvKzYBculR1F7),
    from [djuKliros](https://www.djukliros.com/octoechos-%D0%B3%D0%BB%D0%B0%D1%81%D1%8B)
  - `obikhod_azbyka/gospodi-vozzvah-glas-1-4g-smh.pdf` … `glas-8-…`:
    [the 1914 Court Obikhod retypeset](https://azbyka.ru/kliros/noty-pesnopenij-gospodi-vozzvah-glasy-1-8-dlya-smeshannogo-hora/)
  - `oca/`: from the OCA
    - `t1-lic-obikhod-tt.pdf` … `t8-…`: "Lord, I Call", Common Chant, tones
      [1](https://www.oca.org/PDF/Music/Tone1/t1-lic-obikhod-tt.pdf),
      [2](https://www.oca.org/PDF/Music/Tone2/t2-lic-obikhod-tt.pdf),
      [3](https://www.oca.org/PDF/Music/Tone3/t3-lic-obikhod-tt.pdf),
      [4](https://www.oca.org/PDF/Music/Tone4/t4-lic-obikhod-tt.pdf),
      [5](https://www.oca.org/PDF/Music/Tone5/t5-lic-obikhod-tt.pdf),
      [6](https://www.oca.org/PDF/Music/Tone6/t6-lic-obikhod-tt.pdf),
      [7](https://www.oca.org/PDF/Music/Tone7/t7-lic-obikhod-tt.pdf),
      [8](https://www.oca.org/PDF/Music/Tone8/t8-lic-obikhod-tt.pdf);
      `t2-`, `t5-`, `t7-lic-obikhod-yy.pdf`: the "You" layout, same music
    - `t1-lic-kievan-tt.pdf`, `LIC-T1-serb-tt.pdf`: tone 1 in
      [Kievan](https://www.oca.org/PDF/Music/Tone1/t1-lic-kievan-tt.pdf) and
      [Serbian](https://www.oca.org/PDF/Music/Tone1/LIC-T1-serb-tt.pdf) chant, ruled out
    - `Tutorial-*-Explanation.pdf`: [Learning the Tones](https://www.oca.org/liturgics/learning-the-tones),
      Common Chant tones 1–8, Kievan chant tones 1, 2 and 7
  - `obikhod_arkhangelsk/obihod1_arhangelsk.pdf`: [the Arkhangelsk obikhod](http://kliros.ru/noty/obihod1_arhangelsk.pdf),
    Kievan chant, tones 1–8 on pp. 8–15
- `svete_tihij/`: «Свете тихий», Kievan chant arr. Dvoretsky, from
  [azbyka.ru](https://azbyka.ru/kliros/svete-tihij-noty-pesnopenij-dlya-muzhskogo-hora/)
  (see `vriendelijk_licht_sources.md`)
  - `azbyka_kievan_dvoretsky_ttbb.pdf`: [Smirnov's edition for men's choir](https://azbyka.ru/kliros/wp-content/uploads/2024/02/svete-tihij-kievskogo-rospeva.pdf)
  - `azbyka_dvoretsky.pdf`: [a scan of an old print](https://azbyka.ru/kliros/wp-content/uploads/2024/02/svete-tihij-i.-dvoreczkij.pdf)
- `milost_mira/`: «Милость мира» settings by Archimandrite Feofan and
  others, from [azbyka.ru](https://azbyka.ru/kliros/liturgiya-milost-mira-noty-dlya-muzhskogo-hora/)
  (see `milost_mira_sources.md`)
  - `azbyka_feofan_smirnov_ttbb.pdf`: [«еп. Феофан», arr. Smirnov](https://azbyka.ru/kliros/wp-content/uploads/2023/11/milost-mira-feofan-v-obrabotke-g.-smirnova.pdf)
  - `azbyka_feofan_diveevo.pdf`: [«Феофановская», Diveevo harmonization](https://azbyka.ru/kliros/wp-content/uploads/2023/11/milost-mira-feofana-diveev.-m-rya.pdf)
  - `azbyka_feofan_zazvonov.pdf`: [arr. Zazvonov](https://azbyka.ru/kliros/wp-content/uploads/2023/03/milost-mira-feofan-obr.-zazvonova-m.h..pdf)
  - `azbyka_feofan_bolshoe.pdf`: [«Большое»](https://azbyka.ru/kliros/wp-content/uploads/2023/03/milost-mira-arh.-feofan-bolshoe.pdf)
  - `azbyka_ziborov_smirnov_ttbb.pdf`: [Hegumen Feofan (Ziborov), arr. Smirnov](https://azbyka.ru/kliros/wp-content/uploads/2023/11/milost-mira-feofan-ziborov-tenor-v-obrabotke-g.-smirnova.pdf)
- `dostojno_est/`: «Достойно есть» (see `dostojno_est_sources.md`)
  - `azbyka_kievan.pdf`: [Kievan chant, azbyka.ru](https://azbyka.ru/kliros/wp-content/uploads/2025/07/dostojno-est-kievski-raspev-4g-smh.pdf),
    from [this page](https://azbyka.ru/kliros/dostojno-est-kievskij-raspev-dlya-razuchivaniya/)
- `blazhen_muzh/`: «Блажен муж», from
  [azbyka.ru](https://azbyka.ru/kliros/metka/nazvanie-blazhen-muzh/)
  (see `blazhen_muzh_sources.md`)
  - `azbyka_obychnyj_napev.pdf`: [«Обычный напев» (2025)](https://azbyka.ru/kliros/wp-content/uploads/2025/03/blazhen-muzh_obychnyj.pdf), the choir's setting
  - `azbyka_obihod.pdf`: [«Обиход» (2024)](https://azbyka.ru/kliros/wp-content/uploads/2024/02/blazhen-muzh-obihod.pdf)
  - `azbyka_obihod_2023.pdf`: [«Обиход» (2023)](https://azbyka.ru/kliros/wp-content/uploads/2023/04/blazhen-muzh-obihod.pdf)
  - `azbyka_kievan_kastorsky.pdf`: [Kievan chant, ed. Kastorsky](https://azbyka.ru/kliros/wp-content/uploads/2023/04/blazhen-muzh-kievskij.pdf)
