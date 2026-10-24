\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/voznesenie_kondak_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Кондак Вознесения"
  subsubtitle = "глас 6"
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
PartPOneVoiceOne = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 5/1 \key c \major \U f2.
  ( \U e4 ) \U d4 ( \U e4 ) \U f2 \U e2 ( \U d2 ) \U c4 ( \U d4 ) \U e2 \U d2 \U
  c4 ( \U b4 ) | \break % 1
  \U a4 ( \U b4 \U c4 \U d4 ) \U c2 ( \U b4 \U c4 ) d1 \U d4 ( \U c4 ) \U d4 (
  \U e4 ) \U d4 ( \U c4 ) \U d2 | \break % 2
  \U e4 ( \U f4 ) g1 \U g2 \U g2 \U g4 ( \U f4 ) \U g4 ( \U a4 \U g4 \U f4 ) \U
  e4 ( \U f4 ) \U g2 | \break % 3
  \once \omit Staff.TimeSignature \time 6/1 \U f2 ( \U e2 ) d1 c1 \U e4 ( \U f4
  ) \U g2 \U f2 \U f4 ( \U e4 ) \U f4 ( \U g4 ) \U f4 ( \U e4 ) | \break % 4
  \once \omit Staff.TimeSignature \time 5/1 \U d2 ( \U f2 ) \U d4 ( \U e4 \U d4
  \U c4 ) \U d4 ( \U e4 ) \U f2 \U e2 ( \U d2 \U c4 ) \U c4 ( \U d4 \U e4 ) | \break % 5
  \once \omit Staff.TimeSignature \time 6/1 d1 \U b4 ( \U c4 ) d1 \U c4 ( \U b4
  ) a1 \U c4 ( \U b4 ) \U c4 ( \U d4 ) \U e4 ( \U d4 \U e2 ) | \break % 6
  \once \omit Staff.TimeSignature \time 11/2 \U d2 ( \U f2 ) \U e2 ( \U d2 ) \U
  f4 ( \U e4 ) \U f4 ( \U g4 ) \U f4 ( \U e4 ) \U d4 ( \U e4 \U f2 ) \U f2 \U d4
  ( \U e4 ) | \break % 7
  \U d4 ( \U c4 ) d1 c1 \U d2 \U e4 ( \U d4 ) \U e4 ( \U f4 ) \U g2 \U f4 ( \U g4
  \U f4 \U e4 ) | \break % 8
  \U d4 ( \U e4 ) \U f2 \U e2 ( \U d2 ) f1 \U e2 \U d2 \U d4 ( \U c4 ) \U e2 \U
  e4 ( \U d4 ) | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 13/2 \U e2 \U d2 \U c4 ( \U d4 \U e2 ) d1
  \U e2 \U d4 ( \U c4 ) \U d4 ( \U e4 f1 ) \U e2 \U e4 ( \U d4 ) | \break % 10
  \U e2 ( \U d2 ) \U d4 ( \U f4 ) e1 d1 \U c2 \U d4 ( \U e4 ) d1 \U c2 \U d4 (
  \U c4 ) | \break % 11
  \once \omit Staff.TimeSignature \time 4/1 \U d4 ( \U e4 \U f2 ) \U f4 ( \U e2
  \U f4 ) \U d2 ( \U c2 ) d1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Е" __ \skip1 "же" __ \skip1 "о" "нас" __ \skip1 "и" __ \skip1 "спо" -- "лнив"
  "смо" __ \skip1 "тре" __ \skip1 \skip1 \skip1 "ни" __ \skip1 \skip1 "е," "и"
  __ \skip1 "я" __ \skip1 "же" __ \skip1 "на" "зе" __ \skip1 "мли" "со" -- "е"
  -- "ди" __ \skip1 "нив" __ \skip1 \skip1 \skip1 \skip1 \skip1 "не" -- "бе" __
  \skip1 \skip1 "сным," "воз" __ \skip1 "не" -- "слся" "е" __ \skip1 "си" __
  \skip1 "во" __ \skip1 "сла" __ \skip1 "ве" __ \skip1 \skip1 \skip1 "Хри" __
  \skip1 "сте" "Бо" __ \skip1 \skip1 "же" __ \skip1 \skip1 "наш," "ни" __ \skip1
  "ка" -- "ко" __ \skip1 "же" "от" __ \skip1 "лу" __ \skip1 "ча" __ \skip1
  \skip1 "я" __ \skip1 "ся," __ \skip1 "но" __ \skip1 "пре" __ \skip1 "бы" __
  \skip1 "ва" __ \skip1 \skip1 "я" "не" __ \skip1 "от" __ \skip1 "ступ" --
  "ный," "и" "во" __ \skip1 "пи" __ \skip1 "я" "лю" __ \skip1 \skip1 \skip1 "бя"
  __ \skip1 "щым" "Тя:" __ \skip1 "Аз" "есмь" "с" "ва" __ \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "ми," __ \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 "и" "ни" __ \skip1 "кто" __ \skip1 \skip1 "же" __
  \skip1 \skip1 "на" __ \skip1 "вы."
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

