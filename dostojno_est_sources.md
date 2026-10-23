# Достойно есть (liturgie, "In waarheid"): sources

Research of 2026-10-23. The question: what is "In waarheid" in the typeset
Dutch liturgy (`~/dev/liturgie/ly/liturgie.pdf`, pp. 47–48; scan pp.
57–58; `ly/stukken/20-in-waarheid.ily`), credited "Harmonisatie:
Kastorskij / Arr. M. Fortounatto"? The user noticed that its music
resembles parts of Feofan's Eucharistic Canon, (19a) on p. 44 (see
`milost_mira_sources.md`). It seems to take part of the canon and make
it more repetitive. There is no MuseScore score of it here.

## Conclusion

"In waarheid" is «Достойно есть» ("It is truly meet") in the **Kievan
chant**, in essentially the common four-part harmonization. The
resemblance to Feofan's canon is real, because the canon uses the same
melodic lines. But the evidence does not show that "In waarheid" was
taken from the canon (see "Which came first"). The attribution to
Kastorsky's harmonization is plausible but not confirmed.

## The Kievan «Достойно есть»

The witness is azbyka.ru's anonymous setting "Достойно есть, Киевский
распев" ([page](https://azbyka.ru/kliros/dostojno-est-kievskij-raspev-dlya-razuchivaniya/),
[PDF](https://azbyka.ru/kliros/wp-content/uploads/2025/07/dostojno-est-kievski-raspev-4g-smh.pdf)).
It is for mixed choir, SATB on two staves, in G major / E minor like the
Dutch. It names no harmonizer.

It was compared with the Dutch with `tools/compare-sources/cmp_waarheid.py`,
which reads the Dutch voices from the liturgy's LilyPond file and the
PDF with `ocaread.py`. The comparison is by pitch class, repeats merged,
pitch only. A chant like this repeats a few lines in an order set by the
text, so the main measure is the share of the Dutch notes that lie in a
**run of eight or more notes found anywhere in the reference**, in any
order. The share in the same order is given as "covers".

| voice | runs ≥ 8 | covers (in order) |
|---|---|---|
| soprano | **1.00** | 0.74 |
| alto | **0.98** | 0.73 |
| tenor | 0.91 | 0.91 |
| bass | 0.67 | 0.72 |

Every line of the Dutch soprano and alto occurs in the Kievan setting.
The order differs in one place: a block of about 30 soprano notes stands
earlier in the Dutch than in the Russian, as the two texts divide into
lines differently. The tenor (mostly reciting) agrees, and the bass
agrees for the most part. So the Dutch harmony is essentially this
setting, with a different bass in places.

**Control.** Shorter runs prove little in stepwise melodies within one
key. Against unrelated sopranos in G major, the Dutch soprano scores
0.57–0.68 for runs of four or more notes, and 0.00–0.27 for runs of
eight or more. The unrelated pieces were `bogoroditse_dievo` (Greek
chant, 52 notes) and `heer_ik_roep_t6` (41 notes). So only runs of
eight or more mean something.

`ocaread.py` reads one D natural in the Kievan soprano («истину») as
D♯. The script corrects it in the soprano only, since the alto's D♯s are
real leading notes of E minor.

## The resemblance to Feofan's canon

The canon's soprano (`19a-eucharistische-kanon.ily`, 221 notes, repeats
merged) contains 0.88 of the "In waarheid" soprano in runs of eight or
more. It contains 0.89 of the Kievan «Достойно есть» soprano the same
way. In order, the shares are only 0.55 and 0.52. So the canon is built
from the same melodic lines, through-composed rather than repeated. The
clearest case is the canon's «Тебе поем» ("U bezingen wij", p. 46):
F♯ F♯ │ G–B A G │ F♯ G–A │ B–D C B │ A. "In waarheid" opens the same
way, with more repeated reciting notes: F♯ F♯ F♯ F♯ F♯ │ G–B A G │ F♯
G │ A B D C B A. The canon is about four times longer than the controls
above, which raises its chance level somewhat.

### Which came first

Two explanations fit the data:

- **(a)** Feofan built his canon from lines of the Kievan chant, and
  «Достойно есть» is that chant in its plain, repetitive form.
  Pariisky's remark that Feofan's pieces were often printed as
  "Киевского роспева" (see `milost_mira_sources.md`) fits this, if the
  label was meant as a source.
- **(b)** The "Kievan" «Достойно есть» was itself derived from Feofan
  and carries the chant label by tradition. The same remark of
  Pariisky's fits this too.

What would settle it: the unison Kievan «Достойно есть» in an old chant
book, such as the Synodal *Обиход нотного пения* (1909), or another
pre-Feofan source. If it has these lines, (a) holds. It was not found
online yet.

## The attribution

- **Kastorsky**, A. V. Kastorsky (1869–1944; see
  `bogoroditse_dievo_sources.md`), harmonized Kievan chant among others.
  Those on azbyka.ru include «Блажен муж» and «Свете тихий», Kievan chant
  «в ред. Касторского». His *Церковные хоры*, part 2 (Liturgy, 1901),
  would contain a «Достойно есть». Whether the anonymous azbyka.ru
  setting is his harmonization, or simply the common parish one, cannot
  be told without his collection. No «Достойно есть» by Kastorsky was
  found online.
- **M. Fortounatto** is Archpriest Michael Fortounatto (1931–2022),
  choir director of the Russian Orthodox Cathedral of the Dormition in
  London from 1965 (after his father-in-law, Mikhail Feokritoff). He
  harmonized many chants and helped adapt Russian chant to English. His
  part here was presumably fitting the music to an English text, and
  through that to the Dutch. That is an assumption, not checked.
- The same Dutch liturgy credits Kastorsky only here. The choir also
  sings a Cherubic Hymn credited to him, and a Dutch «Богородице Дево»
  that credits him, probably wrongly (see `bogoroditse_dievo_sources.md`).

## Sources

- [azbyka.ru: Достойно есть, Киевский распев](https://azbyka.ru/kliros/dostojno-est-kievskij-raspev-dlya-razuchivaniya/)
  ([PDF](https://azbyka.ru/kliros/wp-content/uploads/2025/07/dostojno-est-kievski-raspev-4g-smh.pdf))
- [azbyka.ru: Касторский, ноты для хора](https://azbyka.ru/kliros/metka/kompozitory-kastorskij/)
- [Православная энциклопедия: КАСТОРСКИЙ](https://www.pravenc.ru/text/1681335.html)
- [Sourozh: Archpriest Michael Fortounatto celebrated his 90th birthday](https://www.sourozh.org/maineng/2021/5/19/archpriest-michael-fortounatto-celebrated-his-90th-birthday.html)
- [In memoriam Father Michael Fortounatto](https://archeveche.eu/en/in-memoriam-father-michael-fortounatto/)
- [Prof. L. Pariisky on Archimandrite Feofan (azbyka.ru)](https://www.azbyka.ru/otechnik/Feofan-Aleksandrov/tserkovnyj-kompozitor-arhimandrit-feofan-prof-l-parijskij/)

## Local copies

In `references/dostojno_est/` (gitignored; see `heer_ik_roep_sources.md`,
"References", and `tools/download-references.sh`):

- `azbyka_kievan.pdf`: the Kievan «Достойно есть», azbyka.ru
