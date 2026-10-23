# Vriendelijk licht (vriendelijk_licht): sources

Research of 2026-10-23. The question was whether `vriendelijk_licht.mscz`
(the vespers hymn "Gladsome light", Slavonic «Свете тихий») is Ivan
Dvoretsky's well-known setting.

## Conclusion

Yes. `vriendelijk_licht` is «Свете тихий» in the **Kievan chant,
arranged by I. Dvoretsky** («Свѣте Тихій Кіевскаго роспѣва. Переложеніе
Дворецкаго»). It is transposed from C major to F major, and its four
voices are set for mixed choir instead of men's choir, each Russian
voice going to one Dutch voice. The differences are a few accidentals
and passing notes (see below).

So Dvoretsky's «Свете тихий», which Musica Russica calls "a fixture in
the repertoire of Russian church choirs", is his harmonization of the
Kievan chant, not a melody of his own.

## The composer

Ivan Dvoretsky, mid-19th century. Musica Russica says that his dates and
birthplace are unknown and that he is known from only a few sacred
works. Musicanet gives "Ivan S. Dvoretsky (1835–1886)" without a source.
These two have not been reconciled.

## The sources

- **The typeset edition for men's choir** (T I, T II, baritone, bass on
  two staves; C major), "© 2021. Georgy Smirnov. Arrangement and typing",
  on azbyka.ru:
  [Свете тихий Киевского роспева (перелож. Дворецкого)](https://azbyka.ru/kliros/wp-content/uploads/2024/02/svete-tihij-kievskogo-rospeva.pdf).
  It keeps the old spelling of its source. It is a vector PDF, read
  exactly by `ocaread.py` and compared note by note (see below).
- **The scan**, also on azbyka.ru:
  [Свете тихий И. Дворецкий](https://azbyka.ru/kliros/wp-content/uploads/2024/02/svete-tihij-i.-dvoreczkij.pdf).
  These are pp. 30–31 of an unidentified printed collection from before
  the 1918 spelling reform: «Переложеніе Дворецкаго», "И. Дворецкий"
  added by hand, with pencil markings. It is in C major on two staves,
  two voices per staff. Its first two systems were read by eye. There
  it is the same music as Smirnov's edition, voice for voice (upper
  voices E D C B B C D C … over C B A G♯ G♯ A B A …). So Smirnov's
  edition is evidently a retypesetting of this print. The rest of the
  scan has not been checked.

  Both files are listed on azbyka.ru's page
  [Свете Тихий: ноты песнопений для мужского хора](https://azbyka.ru/kliros/svete-tihij-noty-pesnopenij-dlya-muzhskogo-hora/).
- **Musica Russica, V1-58**:
  [Gladsome Light (Svete tihiy)](https://musicarussica.com/composers/dvoretsky-ivan),
  SATB, an offprint from *One Thousand Years of Russian Church Music,
  988–1988*, series I, vol. 1 (1991). Per
  [Musicanet](https://www.musicanet.org/bdd/en/score/87374-svete-tikhii-ivan-s-dvoretsky),
  it is in F major and about 2 minutes long. It was recorded by the
  St Vladimir's Seminary Chorale on *Vigil*. This edition was **not
  consulted** (it is not free). It is in the same key as the Dutch
  version, which might have come from it.

## The comparison

`tools/compare-sources/cmp_vriendelijk.py` compares Smirnov's edition,
read by `ocaread.py`, with `vriendelijk_licht.mscz`. It works voice by
voice (T I, T II, baritone, bass against the Dutch soprano, alto, tenor,
bass) and by pitch class, transposed up a fourth (+5 semitones), with
repeated notes merged. Durations are not compared. "Covers" is the share
of the Dutch notes that the edition has, in the same order:

| voice | covers | match | untransposed (covers) |
|---|---|---|---|
| soprano | 0.98 | 0.98 | 0.28 |
| alto | 0.95 | 0.95 | 0.24 |
| tenor | 0.95 | 0.82 | 0.26 |
| bass | 0.91 | 0.90 | 0.17 |

The untransposed scores show what unrelated music gives.

Where the Dutch differs (Dutch measure numbers and text; the Russian
notes transposed to F):

- **Soprano**, m6 ("te loven"): B♭–C where the Russian has a raised C♯.
- **Alto**: F for F♯ in m2 ("Vader"); C for C♯ twice in m7 ("Zoon van
  God die het leven schenkt"); an added G in m6; C for F in m8.
- **Tenor**: an A for F in m4; it leaves out a few of the Russian's
  moving notes (C–F in m6, D–C–D–C in m8). These extra Russian notes
  are why the match is lower than the covers.
- **Bass**: a different line in m3 ("Gekomen bij zonsondergang": C♯–D–A
  for F–C–A); F–C–A left out in m1; C for G in m4; C♯ for C in m7.

The Dutch thus avoids several of the Russian's raised notes (F♯, C♯) in
the alto and soprano, but adds C♯ in the bass in m3 and m7.

## Local copies

In `references/svete_tihij/` (gitignored; see `heer_ik_roep_sources.md`,
"References", and `tools/download-references.sh`):

- `azbyka_kievan_dvoretsky_ttbb.pdf`: Smirnov's edition
- `azbyka_dvoretsky.pdf`: the scan
