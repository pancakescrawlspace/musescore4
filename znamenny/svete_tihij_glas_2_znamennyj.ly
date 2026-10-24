\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/svete_tihij_glas_2_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Свете тихий"
  subsubtitle = "глас 2"
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
PartPOneVoiceOne = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 15/2 \key f \major \U e4
  ( \U f4 \U g2 \U f4 \U g4 ) \U f4 ( \U e4 ) \U d2 ( \U e4 \U f4 ) g1 \U f4 (
  \U g4 ) \U a2 \U a4 ( \U g4 ) \U f2 ( \U e2 ) d1 | \break % 1
  \once \omit Staff.TimeSignature \time 17/2 \U d4 ( \U e4 ) \U f2. ( \U e4 \U f4
  \U g4 \U f2 \U f4 \U e4 ) \U d2 ( \U e4 \U d4 \U c2 ) \U d2 ( \U e2 \U d2 \U d4
  \U f4 e1 d1 ) | \break % 2
  \U d4 ( \U e4 ) \U f2 \U d2 \U d2 ( \U c4 ) \U c4 ( \U d4 \U e4 ) d1 \U a'2 g1
  \U a2 \U a4 ( \U g4 ) \U f2 \U e2 d1 | \break % 3
  \once \omit Staff.TimeSignature \time 7/1 \U c2 \U d4 ( \U c4 ) \U d4 ( \U e4
  \U f2 ) \U e2 ( \U d2 \U c4 ) \U c4 ( \U d4 \U e4 ) d1 \U e4 ( \U f4 ) \U g2 (
  \U f4 \U e4 ) \U d2 | \break % 4
  \U g4 ( \U a4 ) \D bes4 ( \U a4 \U g2 ) \U a4 ( \U g4 ) \U f2. ( \U e4 ) \U f4
  ( \U g4 \U f4 \U e4 ) \U d2 ( g1 ) \U f2 \U f4 ( \U e4 ) \U f4 ( \U g4 ) | \break % 5
  \once \omit Staff.TimeSignature \time 33/4 \U f4 ( \U e4 ) \U d2 ( \U f2 ) \U
  f2 ( e1 \U d2. \U c4 \U d4 \U e2. d1 ) \U d4 ( \U e4 ) \U f2 \U d2 \U d2 ( \U
  c4 ) | \break % 6
  \once \omit Staff.TimeSignature \time 39/4 \U c4 ( \U d4 \U e4 ) d1 \U d4 ( \U
  c4 ) \U d4 ( \U e4 ) f1 \U e4 f1 \U e4 d1 ( \U e2 \U d2 ) \U e2 ( \U f2 g1 \U
  f2 ) | \break % 7
  \once \omit Staff.TimeSignature \time 15/2 \U e4 ( \U f4 \U g4 \U e4 f1 ) \U f4
  ( \U e4 ) \U f4 ( \U g4 \U f4 \U e4 ) \U d2 \U e4 ( \U f4 ) g1 \U f2 \U g2 \U
  g2 \U g4 ( \U f4 ) | \break % 8
  \once \omit Staff.TimeSignature \time 13/2 \U g2 ( \U f4 \U e4 \U d2 ) \U g4 (
  \U f4 ) \U g4 ( \U a4 \D bes2 ) \U a2 \U g4 ( \U a4 ) \U g4 ( \U f4 ) \U e4 (
  \U f4 ) \U g2 \U f2 ( \U e2 ) | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 8/1 d1 c1 \U f2. \U e4 \U d2. ( \U c4 \U
  e2. \U d4 \U e2 \U d2 \U c4 \U d4 \U e2 d1 ) | \break % 10
  \once \omit Staff.TimeSignature \time 9/1 \U e2 ( \U d4 \U c4 \U d4 \U e4 f1
  \U e2. \U d4 \U e2 \U d2 \U d4 \U f4 e1 d1 \U c2 \U d4 \U e4 d1 ) | \break % 11
  \once \omit Staff.TimeSignature \time 8/1 \U f4 ( \U g4 ) \U a2 \U g2 \U f2 (
  \U e2 \U f4 \U e4 \U d2 \U f2 \U g2 \U a4 \U g4 \U f2 g1 ) \U f4 ( \U g4 \U a2
  ) \U g4 ( \U f4 ) | \break % 12
  \once \omit Staff.TimeSignature \time 9/2 \U g2 ( \U f4 \U e4 ) \U d2 \U f4 (
  \U g4 \U a2 g1 ) f1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Све" __ \skip1 \skip1 \skip1 \skip1 "те" __ \skip1 "ти" __ \skip1 \skip1
  "хий" "свя" __ \skip1 "ты" -- "я" __ \skip1 "сла" __ \skip1 "вы," "бе" __
  \skip1 "зсме" __ \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "ртна" __ \skip1
  \skip1 \skip1 "го," __ \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "От" __
  \skip1 "ца" "не" -- "бе" __ \skip1 "сна" __ \skip1 \skip1 "го," "свя" -- "та"
  -- "го" "бла" __ \skip1 "жен" -- "на" -- "го," "И" -- "и" __ \skip1 "су" __
  \skip1 \skip1 "се" __ \skip1 \skip1 "Хри" __ \skip1 \skip1 "сте," "при" __
  \skip1 "ше" __ \skip1 \skip1 "дше" "на" __ \skip1 "за" __ \skip1 \skip1 "пад"
  __ \skip1 "со" __ \skip1 "лнца," __ \skip1 \skip1 \skip1 "ви" __ \skip1 "де"
  -- "вше" __ \skip1 "свет" __ \skip1 "ве" __ \skip1 "че" __ \skip1 "рний," __
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "по" __ \skip1 "ем" "О" -- "тца," __
  \skip1 "Сы" __ \skip1 \skip1 "на," "и" __ \skip1 "Свя" __ \skip1 "та" -- "го"
  "Ду" -- "ха," "Бо" __ \skip1 \skip1 "га" __ \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 "до" __ \skip1 "сто" __ \skip1 \skip1 \skip1 "ин" "е" __
  \skip1 "си" "во" "вся" "вре" -- "ме" __ \skip1 "на" __ \skip1 \skip1 \skip1
  "пет" __ \skip1 "бы" __ \skip1 \skip1 "ти" "гла" __ \skip1 "сы" __ \skip1
  "пре" __ \skip1 "по" -- "до" __ \skip1 "бны" -- "ми," "Сы" -- "не" "Бо" __
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 "жий," "жи" __ \skip1 "вот" "да" -- "яй:" __
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "те" __
  \skip1 \skip1 "мже" __ \skip1 "мир" __ \skip1 \skip1 "Тя" "сла" __ \skip1
  \skip1 \skip1 "вит."
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

