#!/bin/sh
# Downloads the sources of heer_ik_roep_sources.md,
# bogoroditse_dievo_sources.md and vriendelijk_licht_sources.md into
# references/ (gitignored), where the files are listed under "References"
# in heer_ik_roep_sources.md.
#
# usage: tools/download-references.sh
#
# Two downloads are indirect. ecmr.fi was down (HTTP 503) on 2026-10-23, so
# Bakhmetev's Obikhod comes from the Wayback Machine; the "id_" in its URL
# gives the file itself, not the archive's viewer page. The 1914 Court
# Obikhod is on Google Drive, whose share link opens a viewer;
# "uc?export=download" gives the file.

set -e
cd "$(dirname "$0")/.."

A=https://azbyka.ru/kliros/wp-content/uploads; O=https://www.oca.org/PDF/Music; T=https://media.oca.org/chanting-tutorial
d=references/bogoroditse_dievo; mkdir -p $d
curl -sSL -o $d/kpds42_arkhangelsky_greek.pdf https://kpds42.ru/files/content/bogorodice_devo_grecheskiy_arhangelskiy.pdf
curl -sSL -o $d/kpds42_arkhangelsky_greek.mid https://kpds42.ru/files/content/bogorodice_devo_grecheskiy_arhangelskiy.mid
curl -sSL -o $d/azbyka_grecheskaya.pdf $A/2023/05/bogorodicze-devo-grecheskaya.pdf
curl -sSL -o $d/azbyka_grecheskogo_raspeva_gl4.pdf $A/2023/05/bogoroditse_devo_grecheskogo_raspeva_gl_4.pdf
curl -sSL -o $d/azbyka_arkhangelsky_op39_no8.pdf "$A/2026/05/bogorodicze-devo-arhangelskij-or-39-%E2%84%96-8-4g-smh.pdf"
d=references/heer_ik_roep; mkdir -p $d/oca $d/obikhod_azbyka $d/obikhod_arkhangelsk $d/smirnov
for n in 1 2 3 4 5 6 7 8; do
  curl -sSL -o $d/oca/t$n-lic-obikhod-tt.pdf $O/Tone$n/t$n-lic-obikhod-tt.pdf
  case $n in 2|5|7) curl -sSL -o $d/oca/t$n-lic-obikhod-yy.pdf $O/Tone$n/t$n-lic-obikhod-yy.pdf;; esac
  curl -sSL -o $d/obikhod_azbyka/gospodi-vozzvah-glas-$n-4g-smh.pdf $A/2025/09/gospodi-vozzvah-glas-$n-4g-smh.pdf
done
curl -sSL -o $d/oca/t1-lic-kievan-tt.pdf $O/Tone1/t1-lic-kievan-tt.pdf
curl -sSL -o $d/oca/LIC-T1-serb-tt.pdf $O/Tone1/LIC-T1-serb-tt.pdf
for f in Tutorial-Intro-Obikhod-Tone1-Explanation Tutorial-Obikhod-Tone2-Explanation Tutorial-Common-Tone3-Explanation Tutorial-Obikhod-Tone4-Explanation Tutorial-Common-Tone5-Explanation Tutorial-Common-Tone6-Explanation Tutorial-Common-Tone7-Explanation Tutorial-Obikhod-Tone8-Explanation Tutorial-Intro-Kievan-Tone1-Explanation Tutorial-Kievan-Tone2-Explanation Tutorial-Kievan-Tone7-Explanation; do
  curl -sSL -o $d/oca/$f.pdf $T/$f.pdf
done
curl -sSL -o $d/obikhod_arkhangelsk/obihod1_arhangelsk.pdf http://kliros.ru/noty/obihod1_arhangelsk.pdf
mkdir -p $d/moscow_osmoglasie $d/mrps
for f in glas1 glas2 glas3 glas4 glas4a glas5 glas6 glas7 glas8 glashelp; do
  curl -sSL -o $d/moscow_osmoglasie/$f.pdf $A/kliros/kust/pdf/osmoglas/$f.pdf
done
curl -sSL -o $d/moscow_osmoglasie/posobie-po-izucheniyu-osmoglasiya-e.-kustovskij-n.-potemkina.pdf $A/2024/12/posobie-po-izucheniyu-osmoglasiya-e.-kustovskij-n.-potemkina.pdf
curl -sSL -o $d/mrps/g1.pdf $A/2022/10/g1.pdf
for n in 1 2 3 4 5 6 7 8; do
  curl -sSL -o $d/mrps/pesnopenia_voskresnoy_sluzhby_glas_$n.pdf $A/2022/10/pesnopenia_voskresnoy_sluzhby_glas_$n.pdf
done
curl -sSL -o $d/smirnov/glas-1-red-smirnova.pdf $A/2024/02/na-gospodi-vozzvah-stihiry-voskresnye-glas-1.-red.-g.-smirnova.pdf
curl -sSL -o $d/smirnov/glas-2-lavrskogo-napeva.pdf $A/2024/02/na-gospodi-vozzvah-stihiry-voskresnye-glas-2-lavrskogo-napeva.pdf
curl -sSL -o $d/smirnov/glas-2-sokr-kievskogo-rospeva.pdf $A/2024/02/na-gospodi-vozzvah-stihiry-voskresnye-glas-2-sokrashhennogo-kievskogo-rospeva.pdf
for n in 3 4 5 6 7 8; do
  curl -sSL -o $d/smirnov/glas-$n-red-smirnova.pdf $A/2024/02/na-gospodi-vozzvah-stihiry-voskresnye-glas-$n-red.-g.-smirnova.pdf
done
P=https://precentor.ru/s_g; mkdir -p $d/smirnov/precentor/men $d/smirnov/precentor/mix
for f in tone_1/01_vozzvax tone_2/01b_na_gv_glas_2_lavrsky tone_2/01_na_gv_glas_2_obihod tone_2/01b_na_gv_glas_2_lavrsky_tesn tone_2/01c_na_gv_glas_2_tesn tone_3/glas_3_na_gv tone_5/01_glas_5_na_gospodi_vozzvah tone_6/01_glas_6_gospodi_vozzvah tone_7/01_glas_7_gospodi_vozzvah tone_8/01_gospodi_vozzvah; do
  curl -sSL -o $d/smirnov/precentor/mix/$(echo $f | tr / _).pdf $P/octoechos_mix/$f.pdf
done
for f in tone_1/tone_1_00_titul tone_2/glas_2_00_titul_soderzanie tone_3/tone_3_00_titul_soderzanie tone_4/tone_4_00_titul tone_5/glas_5_00_titul tone_6/glas_6_00_titul tone_7/00_titul_soderzanie tone_8/tone_8_00_titul tone_1/tone_1_01_na_gospodi_vozzvah tone_4/tone_4_01_na_gospodi_vozzvah; do
  curl -sSL -o $d/smirnov/precentor/men/$(echo $f | tr / _).pdf $P/octoechos/$f.pdf
done
curl -sSL -o $d/bakhmetev_obikhod_1869_vol1_ecmr.pdf 'https://web.archive.org/web/2025id_/https://ecmr.fi/Scanned_Chantbooks/Obihod1869Bahm1.pdf'
curl -sSL -o $d/court_obikhod_1914_djukliros.pdf 'https://drive.google.com/uc?export=download&id=1oRzhP6P_ELtLYkSjQFdhvKzYBculR1F7'
d=references/svete_tihij; mkdir -p $d
curl -sSL -o $d/azbyka_dvoretsky.pdf $A/2024/02/svete-tihij-i.-dvoreczkij.pdf
curl -sSL -o $d/azbyka_kievan_dvoretsky_ttbb.pdf $A/2024/02/svete-tihij-kievskogo-rospeva.pdf
