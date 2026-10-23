# Достойно есть (liturgie, "In waarheid"): sources

Research of 2026-10-23. The question: what is "In waarheid" in the typeset
Dutch liturgy (`~/dev/liturgie/ly/liturgie.pdf`, pp. 47–48; scan pp.
57–58; `ly/stukken/20-in-waarheid.ily`), credited "Harmonisatie:
Kastorskij / Arr. M. Fortounatto"? The user noticed that its music
resembles parts of Feofan's Eucharistic Canon, (19a) on p. 44 (see
`milost_mira_sources.md`). It seems to take part of the canon and make
it more repetitive. There is no MuseScore score of it here.

## Conclusion

"In waarheid" is the «Достойно есть» ("It is truly meet") that parish
practice calls **Kievan chant**, in essentially the common four-part
harmonization. The resemblance to Feofan's canon is real, because the
canon uses the same melodic lines. But it is not the Kievan «Достойно
есть» of the Synodal *Обиход нотного пения* (1909), whose melody is
different. That makes it more likely that the parish "Kievan" melody
comes from Feofan than the other way round, but it does not prove it
(see "Which came first"). The attribution to Kastorsky's harmonization
is plausible but not confirmed.

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

### The Synodal Obikhod of 1909 (looked into on 2026-10-23)

The Synodal *Обиход нотного пения употребительных церковных роспевов*,
part 2 (Liturgy, Moscow 1909), was found as a PDF; see "Local copies".
It has a «Достойно есть» «Кіевскаго роспѣва, гласъ 8» on p. 262. The
same page range has the shortened Greek, the Greek ("Жуковская"), the
Tsar Fyodor and the Bulgarian settings (pp. 260–263). The Kievan
«Милость мира» is on pp. 256–257.

The book is not older than Feofan (died 1852). But the Synodal chant
books go back to 1772, and the Kievan chant in them is the official
form, so it is the obvious source to test (a) against.

**The 1909 Kievan «Достойно есть»** was transcribed from the square
notation by staff position. The notehead positions were measured with a
script and checked by eye on the first staff. Transposed to the Dutch
key, its first line «Достойно есть яко воистину» runs F♯ G A B B A A G
G │ G. The whole chant stays within those four notes and recites on G.
"In waarheid" opens F♯ F♯ F♯ F♯ F♯ │ G–B A G │ F♯ G: it recites on F♯,
leaps to B, and later reaches D.

Compared by diatonic contour at the best transposition, the Synodal
chant shares no run of six or more notes with any voice of "In waarheid"
or of azbyka.ru's modern Kievan setting, tenor and bass included. The
controls show what chance gives. In runs of ten or more notes, unrelated
pieces (`heer_ik_roep_t6`, `bogoroditse_dievo`) score up to 0.51
against these voices; the Synodal chant scores 0.00. So the parish
"Kievan" «Достойно есть» is **not** the Synodal Kievan chant.

**The 1909 Kievan «Милость мира»** recites on a single note («Ми-лость
ми-ра жер-тву хва-ле-…» on one pitch, with short cadences). Feofan's
canon is a through-composed melody spanning an octave (F♯ G A B D C B A
…). So Feofan's canon is not the Synodal Kievan «Милость мира» either.
This was judged by eye and by notehead measurement. A full automatic
transcription of these pages failed: their stems point down, and the
measurement does not handle that yet.

**Consequence.** The lines shared by Feofan's canon and the parish
"Kievan" «Достойно есть» are not those of the Synodal Kievan chant.
That weakens (a), at least in the form "Feofan took them from the
official Kievan chant". It makes (b) more likely: the parish «Достойно
есть» took its lines from Feofan and is called "Kievan" by tradition, as
Pariisky says happened to Feofan's pieces. It is not proof. A local
Kievan variant outside the Synodal books, such as those of the
Kiev-Pechersk Lavra, could still be a common source of both.

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
- *Обиход нотного пения употребительных церковных роспевов*, ч. 2,
  Божественная литургия, Moscow: Synodal Press, 1909:
  [PDF](http://quadratum.glagol-verbum.com/biblioteka/obihod1909_lit.pdf) from the library of the church-singing
  school "Глаголь" ([library](https://glagol-verbum.com/biblioteka)), a
  2004 retypesetting (PageMaker) in the original square notation, layout
  and page numbers (206–308; PDF page = printed page − 204). The original
  print: [Russian State Library copy, digitized 2021](https://kp.rusneb.ru/item/material/obihod-notnogo-peniya-upotrebitelnyh-cerkovnyh-rospevov-odnogolosie--ch-2-bozhestvennaya-liturgiya)
  (viewer only).

## Local copies

In `references/dostojno_est/` (gitignored; see `heer_ik_roep_sources.md`,
"References", and `tools/download-references.sh`):

- `azbyka_kievan.pdf`: the Kievan «Достойно есть», azbyka.ru

and in `references/obihod_1909/`: `obihod_1909_ch2_liturgiya.pdf`, the
Synodal Obikhod, part 2 (Kievan «Достойно есть» on p. 262, PDF p. 58;
Kievan «Милость мира» on pp. 256–257, PDF pp. 52–53).
