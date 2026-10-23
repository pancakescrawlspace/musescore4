# Благослови, душе моя ("Zegen, mijn ziel, de Heer", Psalm 103): sources

Research of 2026-10-23. The question: what is the choir's "Psalm 103,
Zegen, mijn ziel, de Heer" (`zegen_mijn_ziel_de_heer.mscz`, so far only
soprano and alto of the first measure), whose melody resembles
Rachmaninov's «Благослови, душе моя» (All-Night Vigil, Op. 37 No. 2)?
The choir's copy is known from six phone photos
(`~/Downloads/20260822_182951.jpg` … `_183027.jpg`, not kept in the
repository). A pencil note on the first page reads «Предначинательный
псалом «Благослови душе моя Господа»».

## Conclusion

It is «Благослови, душе моя, Господа», the introductory psalm
(*предначинательный псалом*) of the Vigil, in **Greek chant**
(*греческий распев*), in the common anonymous four-part harmonization.
The closest witness is azbyka.ru's «11. Предначинательный псалом,
Греческий распев» (four voices, mixed choir, D major, the Dutch key). It
has the Dutch first measure note for note.

Rachmaninov's No. 2 is based on the same chant: Wikipedia, CPDL and
Musica Russica all label it «Греческого распева». That explains the
resemblance; his setting gives the melody to a solo alto over the choir.
One introductory article calls it Znamenny instead.

## The comparison

Compared with the Dutch first measure as transcribed: soprano F♯ F♯ G A
B A G F♯ G A B C B A G F♯ G G F♯, D major, the alto a third below. That
is 17 notes with repeats merged, including the characteristic C natural.
azbyka.ru's page for the introductory psalm lists 160 settings
([Название: Предначинательный псалом](https://azbyka.ru/kliros/metka/nazvanie-prednachinatelnyj-psalom/)).
27 were downloaded and read with `tools/compare-sources/ocaread.py`: all
18 in Greek chant, and the common-chant ones (Court Chapel, «Обычного
распева», Moscow, Don and Kievan chant, the Lavras, an anonymous
setting). Each was compared at the best transposition, in soprano and
alto.

- **Matches**, all 17 notes as one unbroken run:
  - [«11. Предначинательный псалом», Греческий распев](https://azbyka.ru/kliros/wp-content/uploads/2025/02/11_prednachinatelnyj-psalom_grecheskogo-raspeva.pdf)
    (2025, 3 pp., D major, «Восстановлено порталом Азбука певческая»).
    The rest of its first page also fits the photos, compared by eye:
    the bass held on D under the first verse with the tenor on A, the
    refrain «Благословен еси, Господи» ("Gezegend zijt Gij, o Heer")
    with its moving tenor over a held bass, and «На горах станут воды»
    ("Bergen rijzen…").
  - [«Предначинательный псалом Греческого распева 2»](https://azbyka.ru/kliros/wp-content/uploads/2024/02/prednachinatelnyj-psalom-grecheskogo-raspeva-2.pdf):
    Georgy Smirnov's arrangement for men's choir (2021, G major). The
    same melody and a closely related harmony, voiced for men.
- **The same chant, other harmonizations**, all 17 notes but in shorter
  runs (9 or fewer): Trinity-Sergius Lavra, «Греческого распева_1». The
  Moscow chant, Kastalsky, Samarin, Sakhno, L'vov and the Don chant
  cover 0.88–0.94.
- **Not readable automatically**: Koval'dzhi's two Greek-chant
  harmonizations and the «Обычного распева» trio (three voices).

Only the first measure was compared note by note. The rest of the Dutch
setting has not been transcribed.

## The "restored" series

The matching file is no. 11 of an anonymous azbyka.ru series «Восстановлено
порталом Азбука певческая». The choir's «Блажен муж» is no. 6 of the same
series («6. Блажен муж, Обычный напев»; see `blazhen_muzh_sources.md`). So
the choir sings at least two pieces from one common parish repertoire.
What printed source the series restores was not found.

## Sources

- [azbyka.ru: Предначинательный псалом, all settings](https://azbyka.ru/kliros/metka/nazvanie-prednachinatelnyj-psalom/)
- [Wikipedia: All-Night Vigil (Rachmaninoff)](https://en.wikipedia.org/wiki/All-Night_Vigil_(Rachmaninoff))
- [CPDL: Vsenoshchnoe bdenie, Op. 37](https://cpdl.org/wiki/index.php/Vsenoshchnoe_bdenie_(All-Night_Vigil),_Op._37_(Sergei_Rachmaninoff))
- [Musica Russica: Rachmaninoff Op. 37 No. 2](https://musicarussica.com/sheet_music_pieces/ra024)

## Local copies

In `references/blagoslovi/` (gitignored; see `heer_ik_roep_sources.md`,
"References", and `tools/download-references.sh`):

- `azbyka_11_grecheskij_raspev.pdf`: «11. Предначинательный псалом», the match
- `azbyka_grecheskij_raspev_smirnov_ttbb.pdf`: Smirnov's arrangement for men's choir
