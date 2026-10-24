\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/voznesenie_tropar_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Тропарь Вознесения"
  subsubtitle = "глас 4"
  composer = "Знаменный распев"
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
PartPOneVoiceOne = \relative d' {
  \clef "treble" \once \omit Staff.TimeSignature \time 9/2 \key c \major \U d4 (
  \U c4 ) \U d4 ( \U e4 \U f2 ) \U e2 \U d2 \U d4 ( \U e4 ) \U d4 ( \U c4 ) \U b4
  ( \U c4 \U d4 \U e4 ) | \break % 1
  \once \omit Staff.TimeSignature \time 13/2 \U e4 ( \U d2. ) \U e2 \U f4 ( \U e4
  ) \U d4 ( \U e4 \U f2 ) e1 d1 \U f2 ( \U g2 ) \U g2 | \break % 2
  \once \omit Staff.TimeSignature \time 6/1 \U g4 ( \U f4 ) \U e4 ( \U f4 ) \U g2
  f1 \U f4 ( \U g4 ) \U f4 ( \U e4 ) \U d2 \U f4 ( \U g2 \U f4 ) e1 | \break % 3
  d1 \U c2 \U d4 ( \U c4 ) \U d4 ( \U e4 ) f1 \U e4 ( \U f4 \U e4 \U c4 ) d1 \U
  f4 ( \U e4 ) | \break % 4
  \once \omit Staff.TimeSignature \time 13/2 \U f4 ( \U g4 \U f4 ) \U e4 \U d2 (
  \U c2 ) \U d2 ( \U e2 ) f1 \U g4 \U f4 ( \U e2 ) \U f2 ( g1 ) | \break % 5
  \U f4 ( \U e4 ) f1 e1 \U d2. ( \U c4 ) \U d4 ( \U e4 \U f2 ) e1 \U f4 ( \U e4
  ) \U f4 ( \U g4 ) | \break % 6
  \once \omit Staff.TimeSignature \time 6/1 \U a2 \U g2 \U g2 \U e2 ( \U g2 ) f1
  \U g2 \U f4 ( \U e4 ) \U f4 ( \U g4 ) a1 | \break % 7
  \U e2 ( \U f2 ) g1 \U a2 ( \U g2 ) \U a4 ( \U g4 ) \U f4 ( \U e4 ) \U d4 ( \U
  e4 \U f2 ) \U e2 ( \U f2 ) | \break % 8
  \once \omit Staff.TimeSignature \time 13/2 \U e4 ( \U d4 ) \U e2 d1 \U e2 d1
  \U d4 ( \U c4 ) \U d4 ( \U e4 ) f1 \U e2 \U e4 ( \U d4 ) | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 6/1 \U e4 ( \U f4 ) \U g2 ( \U f2 ) e1
  \U e4 ( \U f4 ) g1 \U f4 ( \U e4 \U d2 ) \U f4 ( \U g4 ) \U f8 ( [ \U e8 ] \U
  d4 ) | \break % 10
  \once \omit Staff.TimeSignature \time 3/1 \U f4 ( \U g2 \U f4 ) e1 d1 \bar
  "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Во" __ \skip1 "зне" __ \skip1 \skip1 "слся" "е" -- "си" __ \skip1 "во" __
  \skip1 "сла" __ \skip1 \skip1 \skip1 "ве" __ \skip1 "Хри" -- "сте" __ \skip1
  "Бо" __ \skip1 \skip1 "же" "наш," "ра" __ \skip1 "дость" "со" __ \skip1 "тво"
  __ \skip1 "ри" -- "вый" "у" __ \skip1 "че" __ \skip1 "ни" -- "ком" __ \skip1
  \skip1 \skip1 \skip1 "о" -- "бе" __ \skip1 "то" __ \skip1 "ва" -- "ни" __
  \skip1 \skip1 \skip1 "ем" "Свя" __ \skip1 "та" __ \skip1 \skip1 "го" "Ду" __
  \skip1 "ха," __ \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "и" __ \skip1 "зве" __
  \skip1 "ще" -- "нным" "им" "бы" __ \skip1 "вшым" "бла" -- "го" __ \skip1 "сло"
  __ \skip1 "ве" -- "ни" __ \skip1 "ем," __ \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 "я" __ \skip1 "ко" __ \skip1 "Ты" "е" -- "си" __ \skip1 "Сын" __ \skip1
  "Бо" __ \skip1 "жий," "И" __ \skip1 "зба" __ \skip1 \skip1 \skip1 "ви" __
  \skip1 "тель" __ \skip1 \skip1 "ми" __ \skip1 \skip1 \skip1 "ра."
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

