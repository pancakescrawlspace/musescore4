# Богородице Дево (bogoroditse_dievo): sources

Collected on 2026-10-22, while identifying the composer and checking the
transcription in `bogoroditse_dievo.mscz`.

## The scan the score was transcribed from

- `IMG_6744.jpeg` (in this folder; first in `~/Downloads`): phone photo
  (640×480) of a printed page in a choir folder. Too small to check notes against, but the enlarged
  header and footer read:
  - top right: "Греческий распев, в перел. А. А. Архангельского" (Greek
    chant, arranged by Alexander Andreyevich Arkhangelsky, 1846–1924);
  - bottom: "© МПРС, нотный набор, оформление, 2002" (typesetting and
    layout; the last digit of the year is hard to read).

## The arrangement: Greek chant, arr. A. A. Arkhangelsky

- [Всенощное бдение, kpds42.ru](https://kpds42.ru/pages/vsenoshchnoe-bdenie):
  list of Vigil hymns with "Богородице Дево, греч.р., гарм. Архангельского":
  - [PDF](https://kpds42.ru/files/content/bogorodice_devo_grecheskiy_arhangelskiy.pdf):
    "Богородице Дево. Греческий распев. Муз. А. Архангельского", G major,
    SATB on two staves, in doubled note values (quarters where the score
    has eighths). The same arrangement as the scan.
  - [MIDI](https://kpds42.ru/files/content/bogorodice_devo_grecheskiy_arhangelskiy.mid):
    a recorded performance (soprano in the track named "Tenor", alto in
    "Lead", tenor and bass together in "Choir Aahs").

Compared note for note (pitches and durations, all four voices) with the
MIDI, and the doubtful spots checked in the PDF:

- From "Ма-ри-е" in m2 to the end, all four voices agree note for note,
  except as listed below.
- m1 and the start of m2 differ, from the rearranged underlay. In the
  source, "це" and "Де" are two-note melismas, "ра-дуй-ся" is sung on
  D–C–B (soprano) at the start of the next phrase, and "бла-го-дат-на-я"
  on B–A–B–B–B. The score has the melismas as single notes, with an extra
  B for "це", "радуйся" on C–B–B, and "Благодатная" on D–C–B–A–B.
  This is deliberate: it is how the choir has always sung it. "радуйся"
  moved onto the notes of "Дево", "Дево" onto those of "це" (so "це" got
  a chord of its own: B/G/D/G), and three chords of m2 were dropped.
- m4, "Тво-е-го,": the last chord is a half note in the source (a whole
  note in the PDF's doubled values), and a dotted half in the score.
- m5, the final chord: a half note in the source (whole note in the PDF)
  and a whole note with a fermata in the score. The source's bass has no
  low G2.

`bogoroditse_dievo_arkhangelsky.mscz` (with its `.musicxml`/`.ly`/`.pdf`)
is meant to match the scan exactly: the kpds42.ru edition written into a
copy of `bogoroditse_dievo.mscz`, then corrected to the scan where the two
differ (2026-10-23). From the kpds42.ru edition: the notes and slurs of m1
and of the first five chords of m2 (the scan's, before the choir's
rearrangement), and the text with "Тобою:" and "женах,". As in the scan:
the dotted half at the end of m4, the whole note with fermatas at the end
of m5, the bass's low G2 there, the *p* at the start (shown above the
women's staff, hidden on the men's), "Плод" with a capital, and the
attribution "Греческий распев / в перел. А. А. Архангельского" as composer
text. It has the score's note values (half those of the PDF), measures,
house-style underlay ("Де ___ во,") and hyphenation (the PDF hyphenates
"ра-ду-йся", "Бла-го-да-тна-я", "Го-сподь", "Бла-го-сло-ве-нна"). Not
checked against the scan: the title (perhaps «Богородице Дево…») and the
punctuation.

"перел." is *переложение* ("в переложении", in the arrangement of): the
setting of an existing chant melody for choir, as opposed to "муз."
(music by), which the kpds42.ru edition has.

The downloaded scores (the kpds42.ru PDF and MIDI, and the azbyka.ru
PDFs below) are in `references/bogoroditse_dievo/` (gitignored).

## The chant behind the arrangement

- [Архангельский, Александр – Богородице Дево, orthodoxchoral.ru](https://www.orthodoxchoral.ru/ru/sources/3623)
  (catalogue card; 404 when fetched on 2026-10-23, quoted by the search
  results): the melody is "из Обихода нотного пения, Греческого распева,
  подобен «Еже от века утаенное»", SATB, first printed edition Ar002-16.
- [Обиход нотного пения употребительных церковных роспевов, ч. 1, Всенощное бдение (Синодальное изд., 1909), Русское нотное наследие](https://kp.rusneb.ru/item/material/obihod-notnogo-peniya-upotrebitelnyh-cerkovnyh-rospevov-odnogolosie--ch-1-vsenoshchnoe-bdenie):
  the Synodal monophonic chant book (first redaction 1892) the melody
  comes from. Not yet compared with the score.
- [Богородичны отпустительные, azbyka.ru](https://azbyka.ru/bogosluzhenie/bogorodichny-otpustitelnye-poyushhiesya-posle-troparej-ves-god/):
  «Еже от века утаенное» is the dismissal Theotokion of tone 4. "Подобен"
  means the text is sung to that hymn's melody; the D major Greek-chant
  setting below is likewise labelled "Греческого распева, гл. 4".
- [ikliros.com: Еже от века утаенное](https://ikliros.com/category/pervye-slova-pesnopeniya/ezhe-ot-veka-utaennoe):
  settings of that Theotokion (other chants), found while searching.

## Other settings looked at (not this arrangement)

- [Всенощная: «Богородице, Дево, радуйся» – подборка нот, azbyka.ru](https://azbyka.ru/kliros/vsenoshhnaya-bogorodicze-devo-radujsya-podborka-not-pesnopeniya/):
  azbyka.ru's collection of settings of the hymn, where the following came from.
- ["Богородице Дево", Греческий распев (PDF)](https://azbyka.ru/kliros/wp-content/uploads/2023/05/bogorodicze-devo-grecheskaya.pdf):
  the same chant in G major, typeset by koranna79, no arranger named.
  Same melody, but a different harmonization from m2 on (e.g. "Господь с
  Тобою"), and its *p* is at "ю" instead of at the start.
- [Богородице Дево греческого распева, гл. 4 (PDF)](https://azbyka.ru/kliros/wp-content/uploads/2023/05/bogoroditse_devo_grecheskogo_raspeva_gl_4.pdf):
  the same chant in D major, with the melody in thirds.
- [Архангельский, ор. 39 № 8 (PDF)](https://azbyka.ru/kliros/wp-content/uploads/2026/05/bogorodicze-devo-arhangelskij-or-39-%E2%84%96-8-4g-smh.pdf):
  Arkhangelsky's own composition on the text (D major, 3/4), unrelated to
  the chant. The same piece is No. 08 in
  [Сборник нот Всенощное бдение А. Архангельского](https://azbyka.ru/kliros/sbornik-not-vsenoshhnoe-bdenie-a-arhangelkogo-v-nabore-anny-korol/)
  ([PDF](https://azbyka.ru/kliros/wp-content/uploads/2023/06/08-bogorodicze-devo.pdf)).
- [Архангельский, Александр – Богородице Дево, orthodoxchoral.ru](https://www.orthodoxchoral.ru/ru/sources/3623):
  according to the search results, an SATB arrangement by Arkhangelsky of
  the Greek chant from the Обиход нотного пения, "подобен «Еже от века
  утаенное»". The page returned 404 when fetched.
- Other catalogues that turned up in searches, not used:
  [azbyka.ru: Название «Богородице Дево»](https://azbyka.ru/kliros/metka/nazvanie-bogorodicze-devo/),
  [azbyka.ru: Греческий распев](https://azbyka.ru/kliros/metka/grecheskij-raspev/),
  [azbyka.ru: Архангельский А.](https://azbyka.ru/kliros/metka/a-arhangelskij/),
  [ikliros.com: Богородице Дево радуйся](https://ikliros.com/category/pervye-slova-pesnopeniya/bogoroditse-devo-raduisya)
  (with Г. В. Григорьев's Greek-chant setting).

## The text

The spelling and punctuation were checked against the standard text of the
prayer in Russian civil script, from memory rather than an online source:

> Богородице Дево, радуйся, Благодатная Марие, Господь с Тобою;
> благословенна Ты в женах и благословен плод чрева Твоего, яко Спаса
> родила еси душ наших.

The score capitalizes *Плод* (by choice) and *Благословенна*.

## Terminology

Russian terms in the headings and catalogues above:

- **распев** (older spelling *роспев*): a chant, not a hymn. Either a whole
  chant tradition in one style (*знаменный распев*, Znamenny chant;
  *киевский*, Kievan; *греческий*, Greek; *болгарский*, Bulgarian), or one
  chant's melody for a particular text ("the Greek *распев* of «Богородице
  Дево»"). From *распевать*, "to sing out, to draw out in singing", which is
  why a melisma (a syllable over several notes) is also a *распев*. The
  Obikhod's title "…употребительных церковных роспевов" means "of the
  chants in common use".
- **греческий распев** (Greek chant): not the singing of the Greek Church,
  but a chant that became known in Muscovite Russia in the mid-17th
  century, the last of three new chants then (after Kievan and Bulgarian
  chant). Its origins are debated, and it has no melodies for some
  categories of hymns. The Synodal Obikhod of 1909 includes it in shortened
  (*сокращённый*) form.
- **песнопение**: a hymn, a liturgical chant as a text-and-music item
  ("Богородице Дево" is a *песнопение*).
- **напев**: a tune, often a local variant within a chant (*Киево-Печерский
  напев*, the *напев Валаамского монастыря*).
- **подобен** ("like"): a hymn whose melody and metre follow a model hymn;
  "подобен «Еже от века утаенное»" means: sung to the melody of that hymn.
- **глас** (tone): one of the eight modes of the Octoechos; «Еже от века
  утаенное» belongs to tone 4 (*глас 4*, *гл. 4*).
- **переложение**, abbreviated *перел.* ("в переложении", in the arrangement
  of): a choral setting of an existing chant melody, the harmony and
  voicing by the arranger. **гармонизация** (*гарм.*) means much the same.
- **муз.** (*музыка*, music by): credits the composer with the music itself,
  as for an original work like Arkhangelsky's Op. 39 No. 8. For a chant
  setting "перел." is the accurate attribution.
- **Обиход** (*Обиход нотного пения*): the book of the chants in regular
  use (first printed in 1772); here the Synodal edition the Greek-chant
  melody comes from.

Checked on 2026-10-23 against:
[Распев (Музыкальная энциклопедия, booksite.ru)](https://booksite.ru/FullText/1/001/008/095/538.htm)
("самостоятельная система монодии… роспев"),
[Подобен (azbyka.ru)](https://azbyka.ru/podoben),
[Greek chant (churchmotherofgod.org)](https://churchmotherofgod.org/terminologies/greek-chant/),
[Russian Chant (OrthodoxWiki)](https://orthodoxwiki.org/Russian_Chant),
[Obikhod (churchmotherofgod.org)](https://churchmotherofgod.org/terminologies/obikhod/)
and the 1909 Obikhod's catalogue entry linked above. The meanings of
*песнопение*, *напев*, *глас*, *переложение*/*гармонизация* and *муз.* are
from general knowledge, not from these sources.
