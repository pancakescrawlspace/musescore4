\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/bogoroditse_devo_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Богородице Дево"
  subsubtitle = "глас 4"
  composer = \markup \right-column { "Знаменный распев" "из рукописи Кирилло-Белозерского монастыря (632/889)" }
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
PartPOneVoiceOne = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 7/1 \key f \major \U g2
  \U g4 ( \U a4 ) bes1 \D bes2 \D bes4 ( \U a4 ) \D bes4 ( \D c4 \D bes4 \U a4 )
  g1 \D bes4 ( \U a4 ) \D bes4 ( \D c4 \D d2 ) \D c2 | \break % 1
  \once \omit Staff.TimeSignature \time 15/2 \D bes2 \D bes4 ( \U a4 ) \D bes4 (
  \D c4 \D bes4 \U a4 ) \U g2 ( \U f2 ) \U g2 \U a2 bes1 \D c4 \D bes4 \U a2 \D
  bes2 c1 | \break % 2
  \once \omit Staff.TimeSignature \time 8/1 \D bes4 \U a4 bes1 a1 \U g2. \U f4
  \U g4 \U a4 \D bes2 a1 \D c2 \U a2 ( \D c2 ) bes1 | \break % 3
  \once \omit Staff.TimeSignature \time 7/1 \D c2 \D bes2 ( \D c4 \D bes4 ) \U a4
  ( \U g4 \U a2 ) g1 f1 \U f2 \U g4 ( \U f4 ) \U g4 ( \U a4 ) \D bes2 \U a4 ( \U
  f4 ) | \break % 4
  \once \omit Staff.TimeSignature \time 6/1 \U g4 ( \U a4 \U g4 \U f4 ) \U e4 (
  \U f4 \U g4 \U a4 ) \U a2 ( \U g2 ) \U a4 ( \D bes4 ) \D c2 \D bes4 ( \U a4 )
  \D bes4 ( \D c4 ) d1 | \break % 5
  \once \omit Staff.TimeSignature \time 19/2 \U a2 \D bes2 c1 \D d2 \D c2 \D d4
  \D c4 \D bes4 \U a4 \U g4 \U a4 \D bes2 \U a2 \D bes2 \U a4 \U g4 \U a2 g1 \U
  a2 g1 | \break % 6
  \once \omit Staff.TimeSignature \time 7/1 \U a2 \D bes4 ( \U a4 ) \U g4 ( \U a4
  \D bes2 ) a1 g1 \D bes2 \U g2 \D bes4 ( \U a4 \D bes4 \D c4 \D d2 ) \D c2 | \break % 7
  \once \omit Staff.TimeSignature \time 9/1 \D bes2 ( \U a4 ) \U a4 \U g2 \U f2
  \U g2 \U a2 bes1 \D c4 \D bes4 \U a2 \D bes2 c1 \D bes4 \U a4 bes1 a1 | \break % 8
  \once \omit Staff.TimeSignature \time 8/1 \U g2. ( \U f4 \U g4 \U a4 \D bes2 a1
  ) \U g4 ( \U f4 \U e2 \U a2 \D bes4 \U a4 ) \U g4 ( \U a4 \D bes2 a1 ) g1 \bar
  "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Бо" -- "го" __ \skip1 "ро" -- "ди" -- "це" __ \skip1 "Де" __ \skip1 \skip1
  \skip1 "во," "ра" __ \skip1 "ду" __ \skip1 \skip1 "йся," "Бла" -- "го" __
  \skip1 "да" __ \skip1 \skip1 \skip1 "тна" __ \skip1 "я" __ \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 "Ма" -- "ри" __ \skip1 "е," "Го" -- "сподь" __
  \skip1 \skip1 "с" "То" __ \skip1 "бо" -- "ю:" "бла" -- "го" __ \skip1 "сло" __
  \skip1 "ве" -- "нна" __ \skip1 "Ты" __ \skip1 \skip1 \skip1 "в" "же" __ \skip1
  \skip1 "нах," __ \skip1 "и" __ \skip1 "бла" -- "го" __ \skip1 "сло" __ \skip1
  "вен" "Плод" __ \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "чре" --
  "ва" __ \skip1 "Тво" __ \skip1 \skip1 "е" -- "го," "я" -- "ко" "Спа" __ \skip1
  \skip1 \skip1 \skip1 "са" "ро" __ \skip1 "ди" -- "ла" "е" -- "си" __ \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 "душ" __ \skip1 \skip1 \skip1 \skip1 \skip1
  "на" __ \skip1 \skip1 \skip1 "ших."
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

