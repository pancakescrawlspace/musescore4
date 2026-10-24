\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/voznesenie_kondak_krasnogorskij.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Кондак Вознесения"
  subsubtitle = "глас 6"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 13/2 \key c \major \U c2
  \U c2 \U d2 \U e2 \U e2 \U e2 \U d4 ( \U e4 ) \U f2 e1 \U d2 c1 | \break % 1
  \once \omit Staff.TimeSignature \time 11/2 \U c2 \U d2 \U d2 \U d2 \U d2 \U d2
  \U d2 \U d2 \U d2 \U d2 \U c2 | \break % 2
  \once \omit Staff.TimeSignature \time 13/2 \U d2 ( \U e2 ) e1 \U e2 \U e2 \U e2
  \U e2 \U e2 \U e2 \U e2 \U e2 \U d2 | \break % 3
  \once \omit Staff.TimeSignature \time 15/2 \U e2 ( \U f2 ) e1 \U d2 c1 \U c2
  \U d2 \U d2 \U d2 \U d2 \U c2 \U d2 ( \U e2 ) | \break % 4
  \U e2 e1 \U e2 \U e2 \U d4 ( \U e4 ) \U f2 \U e2 \U e2 \U d4 ( \U c4 ) d1 c1
  \U c2 | \break % 5
  \once \omit Staff.TimeSignature \time 7/1 \U c2 \U c2 \U d2 ( \U c2 ) \U d2 (
  \U e2 ) \U e2 \U d2 e1 \U e2 \U e2 \U e2 \U e2 | \break % 6
  \once \omit Staff.TimeSignature \time 6/1 \U e2 \U e2 \U e2 \U d4 ( \U c4 ) \U
  b2 \U c2 ( \U d2 \U e2 ) \U f4 ( \U e4 \U d2 ) e1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Е" -- "же" "о" "нас" "и" -- "спо" -- "лнив" __ \skip1 "смо" -- "тре" -- "ни"
  -- "е," "и" "я" -- "же" "на" "зе" -- "мли" "со" -- "е" -- "ди" -- "нив" "не"
  -- "бе" __ \skip1 "сным," "воз" -- "не" -- "слся" "е" -- "си" "во" "сла" --
  "ве" "Хри" -- "сте" __ \skip1 "Бо" -- "же" "наш," "ни" -- "ка" -- "ко" -- "же"
  "от" -- "лу" -- "ча" __ \skip1 "я" -- "ся," "но" "пре" -- "бы" __ \skip1 "ва"
  -- "я" "не" -- "от" __ \skip1 "ступ" -- "ный," "и" "во" -- "пи" -- "я" __
  \skip1 "лю" __ \skip1 "бя" -- "щым" "Тя:" "Аз" "есмь" "с ва" -- "ми," "и" "ни"
  -- "кто" -- "же" __ \skip1 "на" "вы." __ \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1
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

