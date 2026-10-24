\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/voznesenie_tropar_krasnogorskij.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Тропарь Вознесения"
  subsubtitle = "глас 4"
  composer = \markup \right-column { "Знаменный распев" "по Красногорской рукописи" }
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-24"
}
\layout {
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative c' {
  \clef "treble" \once \omit Staff.TimeSignature \time 5/1 \key c \major \U c4 (
  \U d4 ) \U e2 \U e2 \U e2 \U e2 \U d4 ( \U e4 ) \U f2 \U e2 \U d4 ( \U e4 ) \U
  f2 | \break % 1
  \once \omit Staff.TimeSignature \time 11/2 \U e2 \U d2 c1 \U e2 \U e2 \U e2 \U
  d4 ( \U e4 ) \U f2 \U e2 \U d4 ( \U e4 ) | \break % 2
  \once \omit Staff.TimeSignature \time 5/1 \U f4 ( \U g4 ) \U g4 ( \U f4 ) e1
  \U c2 \U c2 \U d2 \U e2 \U e2 \U e2 | \break % 3
  \once \omit Staff.TimeSignature \time 11/2 \U d4 ( \U e4 ) \U f2 \U e2 d1 c1
  \U c2 \U d2 \U e2 \U e2 | \break % 4
  \once \omit Staff.TimeSignature \time 5/1 \U e2 \U e2 \U e2 \U e2 \U e2 \U d4
  ( \U e4 ) \U f4 ( \U g4 ) \U g4 ( \U f4 ) e1 | \break % 5
  \U c2 \U d2 \U e2 \U e2 \U e2 \U d4 ( \U e4 ) \U f2 \U e2 \U d4 ( \U e4 ) \U f2
  | \break % 6
  \once \omit Staff.TimeSignature \time 3/1 \U e2 \U d4 ( \U c4 ) d1 c1 \bar
  "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Во" __ \skip1 "зне" -- "слся" "е" -- "си" "во" __ \skip1 "сла" -- "ве" "Хри"
  __ \skip1 "сте" "Бо" -- "же" "наш," "ра" -- "дость" "со" -- "тво" __ \skip1
  "ри" -- "вый" "у" __ \skip1 "че" __ \skip1 "ни" __ \skip1 "ком" "о" -- "бе" --
  "то" -- "ва" -- "ни" -- "ем" "Свя" __ \skip1 "та" -- "го" "Ду" -- "ха," "и" --
  "зве" -- "ще" -- "нным" "им" "бы" -- "вшым" "бла" -- "го" -- "сло" __ \skip1
  "ве" __ \skip1 "ни" __ \skip1 "ем," "я" -- "ко" "Ты" "е" -- "си" "Сын" __
  \skip1 "Бо" -- "жий," "И" __ \skip1 "зба" -- "ви" -- "тель" __ \skip1 "ми" --
  "ра."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
      \set Staff.instrumentName = "Voice"
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \PartPOneVoiceOne
        }
        \new Lyrics \lyricsto "PartPOneVoiceOne" {
          \PartPOneVoiceOneLyricsOne
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

