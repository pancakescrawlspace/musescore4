# Милость мира (liturgie 19a, Eucharistische Kanon): sources

Research of 2026-10-23. The question: who is the "Archimandriet Feofan"
credited for "(19a) Eucharistische Kanon" in the typeset Dutch liturgy
(`~/dev/liturgie/ly/liturgie.pdf`, p. 44; scan pp. 54–56), and which
setting of his is it? There is no MuseScore score of it here; the Dutch
version exists only in that LilyPond liturgy (`ly/stukken/19a-eucharistische-kanon.ily`).

## Conclusion

The composer is **Archimandrite Feofan (Aleksandrov)** (1785–1852). The
Dutch "Barmhartigheid, Vrede, een Offer…" is his common «Милость мира»,
often called «Феофановская». It is **not** his larger setting, «Милость
мира (Большое)». The closest edition found is Georgy Smirnov's for men's
choir, credited "Муз. еп. Феофана". Its top voice matches the Dutch
soprano note for note in the opening phrases, a fifth higher (A minor;
the Dutch is in E minor).

## The composer

Archimandrite Feofan (Aleksandrov), born Fyodor Vasil'ev Nekrasov in
1785, the son of a church reader in Gorodishche (Kashira district, Tula
diocese). He became a monk in 1812.

- He studied and taught at the seminary of the Trinity-Sergius Lavra,
  and was regent of the metropolitan's choir there.
- 1809–1814: teaching posts in St Petersburg. 1814–1817: posts in
  Yaroslavl and Chernigov.
- 1817–1832: abbot of the Transfiguration monastery in Kazan and rector
  of the Kazan seminary. His monastery choir was said to be a match for
  the bishop's.
- 1832–1850: abbot of the Donskoy monastery in Moscow.
- He died on 23 October 1852 (Old Style) at the Trinity-Makariev
  monastery in Kalyazin.

He composed church music and harmonized common chant. His Christmas
irmoi became so popular that they are treated as folk melodies (S.
Golubtsov). According to an article by Prof. L. Pariisky, every church
choir, however small, sings his Great Doxology, «Милость мира» and
«Величит душа Моя». Pariisky adds that his pieces were often printed
without his name, as "Kievan chant" or «Донское» (after the Donskoy
monastery). Pariisky is cited here from a search summary; his article
was not read in full.

## The settings compared

azbyka.ru files five «Милость мира» settings under the name Feofan. Only
the opening phrases were compared, by eye, as scale degrees, with
p. 44 of the typeset liturgy: «Милость мира, жертву хваления» / "Barm-
hartigheid, Vrede, een Offer van lof", and «И со духом Твоим» / "En met
uw Geest". The Dutch soprano runs, in E minor:

> 2 │ 3 (2) 3 4 │ 5 7 6 5 │ 4 4 4 │ 5 4 3 2 3 5 │ 6 5 4 3 2 2 │ 3

The notes are F♯ │ G (F♯) G A │ B D C B │ A A A │ B A G F♯ G B │
C B A G F♯ F♯ │ G. The text is repeated ("een Offer, een Offer"), as
«жертву, жертву» is in Feofan's setting.

| setting | voicing, key | the Dutch melody? |
|---|---|---|
| «Муз. еп. Феофана», [arranged by G. Smirnov](https://azbyka.ru/kliros/wp-content/uploads/2023/11/milost-mira-feofan-v-obrabotke-g.-smirnova.pdf) | TTBB, A minor | **Yes:** the first tenor is the Dutch soprano, degree for degree (3 2 3 4 │ 5 7 6 5 │ 4 4 4 │ 5 4 3 2 3 5 │ 6 5 4 3 2 2 │ 3), and «И со духом Твоим» too. The Dutch only adds an upbeat (2) on "Barm-" and puts 3–2 on "-har-" |
| «Феофановская», [harmonized at the Diveevo convent](https://azbyka.ru/kliros/wp-content/uploads/2023/11/milost-mira-feofana-diveev.-m-rya.pdf) | men's choir (octave treble clef), C minor | The same piece, voiced differently. Its top voice first recites on 5 (5 5 5 5 │ 5 5). In «жертву хваления» it follows the Dutch alto line (3 2 1 7 1 3 │ 4 3 2 1 7 7 │ 1), with the natural seventh where the Dutch alto has D♯ |
| «арх. Феофана», [arranged by Hieromonk M. Zazvonov](https://azbyka.ru/kliros/wp-content/uploads/2023/03/milost-mira-feofan-obr.-zazvonova-m.h..pdf) | men's choir, D minor | The same as the Diveevo version |
| «арх. Феофан (Большое)», [typeset by koranna79](https://azbyka.ru/kliros/wp-content/uploads/2023/03/milost-mira-arh.-feofan-bolshoe.pdf) | mixed choir, G minor | **No:** a different, larger setting. Its soprano recites around one note (B♭ A B♭ A B♭ A B♭ │ C A B♭), and «поклонятися» has imitation in the bass |
| «Музыка иг. Феофана (Зиборова)», [arranged by G. Smirnov](https://azbyka.ru/kliros/wp-content/uploads/2023/11/milost-mira-feofan-ziborov-tenor-v-obrabotke-g.-smirnova.pdf) | TTBB, A minor | **No:** another composer, Hegumen Feofan (Ziborov), and another melody (1 1 2 3 │ 2 3 2 1 7 │ 1) |

Smirnov's edition credits "bishop (еп.) Feofan". Feofan Aleksandrov was
an archimandrite, not a bishop, and no other Feofan with this «Милость
мира» was found. azbyka.ru files these settings under "Феофан архим.".
The "bishop" is taken to be a slip, but this has not been confirmed.

Not done yet: a note-by-note comparison of the whole canon. Smirnov's
PDF is a vector file, which `tools/compare-sources/ocaread.py` can
probably read. The Dutch notes would have to come from the LilyPond
source, e.g. through a MIDI export.

## Sources

- [S. Golubtsov, «Церковный композитор архимандрит Феофан»](https://azbyka.ru/otechnik/Sergij_Golubcov/tserkovnyj-kompozitor-arhimandrit-feofan/)
  (azbyka.ru): biography
- [Prof. L. Pariisky, «Церковный композитор архимандрит Феофан»](https://www.azbyka.ru/otechnik/Feofan-Aleksandrov/tserkovnyj-kompozitor-arhimandrit-feofan-prof-l-parijskij/)
  (azbyka.ru): his popularity, and the printing under chant names
- [azbyka.ru: Феофан архим., ноты для хора](https://azbyka.ru/kliros/metka/kompozitory-feofan-arhim/):
  his pieces on azbyka.ru, including «Милость мира (Большое)»
- [azbyka.ru: Литургия: Милость мира, ноты для мужского хора](https://azbyka.ru/kliros/liturgiya-milost-mira-noty-dlya-muzhskogo-hora/):
  the other four settings

## Local copies

In `references/milost_mira/` (gitignored; see `heer_ik_roep_sources.md`,
"References", and `tools/download-references.sh`):

- `azbyka_feofan_smirnov_ttbb.pdf`: «еп. Феофан», arr. Smirnov (the match)
- `azbyka_feofan_diveevo.pdf`: «Феофановская», Diveevo harmonization
- `azbyka_feofan_zazvonov.pdf`: arr. Zazvonov
- `azbyka_feofan_bolshoe.pdf`: «Большое»
- `azbyka_ziborov_smirnov_ttbb.pdf`: Hegumen Feofan (Ziborov), arr. Smirnov
