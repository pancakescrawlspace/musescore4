# Блажен муж ("Welzalig is de mens", Kathisma 1): sources

Research of 2026-10-23. The question: which setting of «Блажен муж» is
the choir's "Kathisma 1, Welzalig is de mens (Блажен муж)"? The choir's
copy has no attribution. It is not digitized yet; it is known here from
a phone photo (`~/Downloads/20260822_183035.jpg`, not kept in the
repository).

## Conclusion

It is the **common obikhod «Блажен муж»** («Обычный напев»,
«Обиход»), in its standard anonymous four-part harmonization and in the
same key, G major / E minor. It is not Kastorsky's Kievan-chant setting,
whose melody differs. No edition found names a harmonizer.

## The choir's copy

Four voices on two staves, G major / E minor. Measure 1 sets the psalm
verse; measure 2 has the threefold Alleluia. The further verses are text
only ("Want de Heer kent de weg van de rechtvaardigen…", "Dient de Heer
met vreze…", "Welzalig allen die op Hem vertrouwen"), each followed by
"Alleluja…". The photo was read chord by chord, with pitch guide lines
drawn over each staff. One chord ("-de-" of "goddelozen") was first
misread a step too low; the reading below is the corrected one.

Soprano / alto / tenor / bass:

| text | chord | rhythm |
|---|---|---|
| Wel-za-lig-is | G / E / B / E (four times) | quarters |
| de | A / F♯ / D / D | quarter |
| mens | B / G / D / G | half |
| die niet | A / F♯ / D / D | quarter |
| wandelt naar de raad der | A / F♯ / D / D | breve |
| god | A / F♯ / D / D | quarter |
| -de- | G / E / B / E | half |
| -lo-zen | G / E / B / E | half |
| Al-le-lu-ja | G A B B over E D G G | q q h. q |
| al-le-lu-ja | B B … over G G G D | q q h h |
| al-le-lu-ja | … G F♯ G over … E B E (D♯ in the alto) | q q h h w |

## The match: «Обычный напев»

[«Блажен муж», Обычный напев](https://azbyka.ru/kliros/wp-content/uploads/2025/03/blazhen-muzh_obychnyj.pdf)
(azbyka.ru, 2025; "6. Блажен муж … Обычный напев", restored by the
portal, «Восстановлено порталом»). It is in the same key and fits chord
for chord, rhythm included:

| | soprano | bass |
|---|---|---|
| azbyka.ru | G A B(h) A A(breve) A G(h) G(h) │ G A B(h) B B B B(h) A(h) A A G(h) F♯(h) G(w) | E D G D D(breve) D E E │ E D G G G G G(h) D(h) D D E(h) B(h) E(w) |
| the choir | G G G G A B(h) A A(breve) A G(h) G(h) │ G A B(h.) B │ B B …(h) …(h) │ … … G(h) F♯(h) G(w) | E E E E D G D D(breve) D E E │ E D G G │ G G G D │ D D E B E |

The alto and tenor agree too. The alto runs in thirds below the soprano
(E F♯ G F♯ F♯ … E D♯ E); the tenor is on B and D. The only differences
come from the Dutch text. The reciting G is repeated on "Wel-za-lig-is",
where the Slavonic has one syllable («Бла-»). The Alleluia has four
syllables instead of five, so the notes are spread differently.

The same harmonization is on azbyka.ru twice more, labelled only
«Обиход»:
[2024](https://azbyka.ru/kliros/wp-content/uploads/2024/02/blazhen-muzh-obihod.pdf)
(in C, with a "Бар." part label) and
[2023](https://azbyka.ru/kliros/wp-content/uploads/2023/04/blazhen-muzh-obihod.pdf)
("Блажен муж обиход смх 4г"). Their soprano and bass are identical to
the 2025 file, except for the number of repeated notes on the Alleluia.

## Settings compared

azbyka.ru's page for «Блажен муж» lists 144 files
([Название: Блажен муж](https://azbyka.ru/kliros/metka/nazvanie-blazhen-muzh/)).
The 36 that are chant-based, common-practice or otherwise likely were
downloaded and read with `tools/compare-sources/ocaread.py`. Their
soprano and bass (pitch classes, repeats merged, the first 40 notes,
best of twelve transpositions) were compared with the photo's. A score
of 1.00 means all of the photo's notes, in order.

- **The match**, in all four voices and in rhythm: «Обычный напев»
  (2025), «Обиход» (2024, 2023). See above.
- **The same opening, a different continuation.** These score 0.9–1.0
  on soprano and bass, because many settings share the opening G A B A
  over E D G D:
  - Kievan chant edited by Kastorsky, and «Киевское» (2024, 2025): after
    the opening, the melody rocks G–F♯ over E–B
  - Kievan chant arranged by Lvovsky
  - Simonov chant, Yur'ev chant, Pochaev chant
  - Greek chant (Solov'ev's, and «Греческого роспева 1», 2024)
  - Monastery chant arranged by Ozerov, and Lvovsky's own setting
- **Different melodies**, scoring at most 0.83 on the soprano:
  Valaam (two), Zosima hermitage, Gornensky, Karaganda, Riga (two),
  Kiev-Pechersk Lavra (two), Trinity-Sergius Lavra (two), the Moscow
  Dormition Cathedral (two), Znamenny chant, Greek chant after the 1909
  Obikhod, «Обычного напева» (2024, in D minor), an anonymous setting,
  and the composers Arkhangelsky, Kastalsky (op. 26) and Kustovsky.

Not compared: the remaining composers' settings on the page
(Chesnokov, Rachmaninoff, Kalinnikov, Ippolitov-Ivanov and many more).
The match makes them unnecessary.

## Sources

- [azbyka.ru: Название «Блажен муж»](https://azbyka.ru/kliros/metka/nazvanie-blazhen-muzh/):
  the list of settings
- [Блажен муж, Обычный напев (PDF, 2025)](https://azbyka.ru/kliros/wp-content/uploads/2025/03/blazhen-muzh_obychnyj.pdf)
- [Блажен муж, Обиход (PDF, 2024)](https://azbyka.ru/kliros/wp-content/uploads/2024/02/blazhen-muzh-obihod.pdf)
- [Блажен муж обиход смх 4г (PDF, 2023)](https://azbyka.ru/kliros/wp-content/uploads/2023/04/blazhen-muzh-obihod.pdf)
- [Блажен муж, Киевский распев в ред. Касторского (PDF)](https://azbyka.ru/kliros/wp-content/uploads/2023/04/blazhen-muzh-kievskij.pdf)

## Local copies

In `references/blazhen_muzh/` (gitignored; see `heer_ik_roep_sources.md`,
"References", and `tools/download-references.sh`):

- `azbyka_obychnyj_napev.pdf`: «Обычный напев» (2025), the match
- `azbyka_obihod.pdf`: «Обиход» (2024), the same harmonization
- `azbyka_obihod_2023.pdf`: «Обиход» (2023), the same harmonization
- `azbyka_kievan_kastorsky.pdf`: Kievan chant edited by Kastorsky, for
  comparison
