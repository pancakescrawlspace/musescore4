\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/svete_tihij_glas_3_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Свете тихий"
  subsubtitle = "глас 3"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 11/2 \key f \major \U f4
  ( \U g4 \U a2 \U g4 \U a4 ) \U g4 ( \U f4 ) \U e4 ( \U f4 \U g4 \U a4 ) \U a4
  ( \U g2. ) \U f4 ( \U g4 ) \U a2 \U g4 ( \U f4 ) | \break % 1
  \once \omit Staff.TimeSignature \time 13/2 \U g2 ( \U f2 ) e1 \U f4 ( \U g4 )
  \U a2 \U g2 \U g2 \U g4 ( \U f4 ) \U g4 ( \U a4 ) \U g4 ( \U f4 ) \U e4 ( \U f4
  \U g2 ) | \break % 2
  \U f4 ( \U e4 \U f2 ) e1 \U e4 ( \U d4 ) \U f4 ( \U g4 \U a4 \U g4 ) \U a2 \U
  g4 ( \U f4 ) \U g2 \U f2 e1 | \break % 3
  \once \omit Staff.TimeSignature \time 15/2 \U f2 \U e4 ( \U d4 ) \U f4 ( \U g4
  \U a2 ) \U g2 \U f2 \U g2 ( \U a2 \D bes2 \U a4 \U g4 bes1 \U a2 \U a4 \U g4
  \U a2 ) | \break % 4
  \U g2 ( \U g4 \D bes4 a1 g1 \U f2 \U g4 \U a4 g1 ) \U g4 ( \U f4 ) \U g4 ( \U
  a4 \U g4 \U f4 \U g2 \U a2 ) | \break % 5
  bes1 ( \D bes4 \D c4 \D bes4 \U a4 ) \U g4 ( \U f4 ) \U g4 ( \U a4 ) \D bes2 (
  \U g4 \U a4 ) \U g4 ( \U f4 ) g1 f1 \U e2 \U d2 | \break % 6
  \once \omit Staff.TimeSignature \time 13/2 \U e4 ( \U d4 ) \U f4 ( \U g4 \U a2
  ) \U g4 ( \U f4 ) \U g2 ( \U f2 ) e1 \U d2 \U e4 ( \U f4 \U g2 ) \U f4 ( \U g4
  ) \U a2 | \break % 7
  \once \omit Staff.TimeSignature \time 15/2 \U f4 ( \U g2 \U f4 ) \U e4 ( \U d4
  \U e2 ) d1 \U d2 \U e4 ( \U f4 ) \U g2 \U g2 \U g4 ( \U e4 ) \U f4 ( \U g4 )
  \U a2 ( \U g2. \U f4 ) | \break % 8
  \U e2 ( \U f2 ) \U g2 ( \U a4 \U g4 \U f2 \U g2 \U f4 \U g4 a1 ) \U f4 ( \U g4
  ) a1 ( \U g4 \U a4 \U g2 ) \U f4 ( \U g4 ) | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 8/1 \U a2 g1 \U f4 ( \U e4 ) \U f4 ( \U
  g4 \U a2 ) \U g4 ( \U f4 ) \U g2 e1 \U a4 ( \U g4 ) \U a4 ( \D bes4 \D c2 ) \D
  bes2 a1 | \break % 10
  \U g4 ( \U f4 ) \U g4 ( \U a4 ) \D bes2 \U a4 ( \U g4 \U a2 ) \U g2 ( \U f2 )
  g1 \U f4 ( \U e4 ) \U f4 ( \U g4 ) a1 ( \D bes2 \U a2 \D bes4 \U a4 ) | \break % 11
  \U g4 ( \U f4 \U e4 \U f4 \U g2 \U f2 \U g2 ) \U f4 ( \U e4 \U f2 e1 \U f2 e1
  ) \U f4 ( \U g4 ) \U a2 ( \U g4 \U f4 \U g2 ) | \break % 12
  \U f4 ( \U e4 ) d1 \U f4 ( \U g4 a1 ) \U f4 ( \U g2 \U f4 ) \U g4 ( \U a4 ) \U
  g4 ( \U f4 ) \U e4 ( \U f4 \U g2 \U f4 \U e4 \U f2 ) e1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Све" __ \skip1 \skip1 \skip1 \skip1 "те" __ \skip1 "ти" __ \skip1 \skip1
  \skip1 "хий," __ \skip1 "свя" __ \skip1 "ты" -- "я" __ \skip1 "сла" __ \skip1
  "вы," "бе" __ \skip1 "зсме" -- "ртна" -- "го" "О" __ \skip1 "тца" __ \skip1
  "не" __ \skip1 "бе" __ \skip1 \skip1 "сна" __ \skip1 \skip1 "го," "свя" __
  \skip1 "та" __ \skip1 \skip1 \skip1 "го" "бла" __ \skip1 "же" -- "нна" --
  "го," "И" -- "и" __ \skip1 "су" __ \skip1 \skip1 "се" "Хри" -- "сте." __
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "При" __ \skip1 "ше" __
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "дше" __
  \skip1 "на" __ \skip1 "за" __ \skip1 \skip1 "пад" __ \skip1 "со" -- "лнца,"
  "ви" -- "де" -- "вше" __ \skip1 "свет" __ \skip1 \skip1 "ве" __ \skip1 "че" __
  \skip1 "рний," "по" -- "ем" __ \skip1 \skip1 "О" __ \skip1 "тца," __ \skip1
  \skip1 \skip1 "Сы" __ \skip1 \skip1 "на" "и" "Свя" __ \skip1 "та" -- "го" "Ду"
  __ \skip1 "ха," __ \skip1 "Бо" __ \skip1 \skip1 \skip1 \skip1 "га," __ \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "до" __ \skip1 "сто" __ \skip1
  \skip1 \skip1 "ин" __ \skip1 "е" -- "си" "во" __ \skip1 "вся" __ \skip1 \skip1
  "вре" __ \skip1 "ме" -- "на" "пет" __ \skip1 "бы" __ \skip1 \skip1 "ти" "гла"
  -- "сы" __ \skip1 "пре" __ \skip1 "по" -- "до" __ \skip1 \skip1 "бны" __
  \skip1 "ми," "Сы" __ \skip1 "не" __ \skip1 "Бо" __ \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "жий," __ \skip1 \skip1
  \skip1 \skip1 \skip1 "жи" __ \skip1 "вот" __ \skip1 \skip1 \skip1 "да" __
  \skip1 "яй:" "те" __ \skip1 \skip1 "мже" __ \skip1 \skip1 "мир" __ \skip1 "Тя"
  __ \skip1 "сла" __ \skip1 \skip1 \skip1 \skip1 \skip1 "вит."
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

