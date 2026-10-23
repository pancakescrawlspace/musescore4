\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/svete_tihij_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Свете тихий"
  composer = "Знаменный распев"
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-23"
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
PartPOneVoiceOne = \relative bes' {
  \clef "treble" \once \omit Staff.TimeSignature \time 23/4 \key f \major \D bes2
  \U a2 \U g2 ( \U f2 ) g1 \U g4 ( \U a4 ) \D bes2 \U a4 \U g2 ( \U f2 ) \U g4 (
  \U a4 ) | \break % 1
  \once \omit Staff.TimeSignature \time 24/4 \D bes2 \U a2 \U a4 \U g2 \U g4 (
  \U a4 ) \D bes2 \D bes4 \U a2 \U a4 g1 \U g4 ( \U a4 ) \D bes2 \U a4 | \break % 2
  \once \omit Staff.TimeSignature \time 21/4 \U a4 \U g2 \U f4 \U g2 \U g4 \U a4
  \D bes2 \U a4 \U a4 g1 \U f4 ( \U g4 ) \U a2 \U a4 | \break % 3
  \once \omit Staff.TimeSignature \time 26/4 \U g4 \U a2 \U a4 \U g2 ( \U f2 )
  \U g4 ( \U a4 ) \D bes2 \U a4 \U a4 \U g2 ( \U e2 ) \U f4 ( \U g4 ) \U a2 g1 | \break % 4
  \once \omit Staff.TimeSignature \time 27/4 \U g4 ( \U a4 ) \D bes2 \U a4 \U g2
  \U a2 \U g2 \U g4 \U a4 \D bes2 \U a4 \U a2 \U a4 \U g2 ( \U f2 ) g1 | \break % 5
  \once \omit Staff.TimeSignature \time 22/4 \U g4 ( \U a4 ) \D bes2 \U a4 \U a4
  \U g2 \U g4 ( \U a4 ) \D bes2 \U a4 \U a4 \U g4 ( \U a4 ) \D bes2 \U a2 \U g4
  ( \U a4 ) | \break % 6
  \once \omit Staff.TimeSignature \time 30/4 \D bes2 \U a4 \U a4 \U a4 \U g2 \U
  f2 \U g4 ( \U a4 ) \D bes2 \U a4 \U a2 g1 \U f4 \U g4 ( \U a2 ) \U g4 ( \U f4
  ) g1 | \break % 7
  \once \omit Staff.TimeSignature \time 36/4 \U f4 \U g4 ( \U a2 ) g1 \D bes4 (
  \U a4 ) \U g2. ( \U f4 \U g4 \U a4 \D bes4 \U a4 \U g4 \U a4 \D bes2 ) a1 ( g1
  \U f2 g1 ) \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Све" -- "те" "ти" __ \skip1 "хий," "свя" __ \skip1 "ты" -- "я" "сла" __
  \skip1 "вы," __ \skip1 "без" -- "сме" -- "ртна" -- "го" "О" __ \skip1 "тца"
  "не" -- "бе" -- "сна" -- "го," "свя" __ \skip1 "та" -- "го" "бла" -- "же" --
  "нна" -- "го," "И" -- "и" -- "су" -- "се" "Хри" -- "сте." "При" __ \skip1 "ше"
  -- "дше" "на" "за" -- "пад" "со" __ \skip1 "лнца," __ \skip1 "ви" -- "де" --
  "вше" "свет" __ \skip1 "ве" __ \skip1 "че" -- "рний," "по" __ \skip1 "ем" "О"
  -- "тца," "Сы" -- "на" "и" "Свя" -- "та" -- "го" "Ду" -- "ха," "Бо" __ \skip1
  "га." "До" __ \skip1 "сто" -- "ин" "е" -- "си" "во" __ \skip1 "вся" "вре" --
  "ме" -- "на" __ \skip1 "петь" "бы" -- "ти" __ \skip1 "гла" -- "сы" "пре" --
  "по" -- "до" -- "бны" -- "ми," __ \skip1 "Сы" -- "не" "Бо" -- "жий," "жи" --
  "вот" __ \skip1 "да" __ \skip1 "яй:" "тем" -- "же" __ \skip1 "мир" "Тя" __
  \skip1 "сла" __ \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "вит."
  __ \skip1 \skip1 \skip1
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

