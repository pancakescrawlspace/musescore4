\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/tsaryu_nebesnyj_znamennyj.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
#(define-markup-command (square layout props arg)
   (markup?)
   (let* ((stil (interpret-markup layout props arg))
          (x-size (interval-length (ly:stencil-extent stil X)))
          (y-size (interval-length (ly:stencil-extent stil Y)))
          (axis (if (> x-size y-size) Y X)))
     (interpret-markup
      layout props
      #{
        \markup \box \with-dimension-from #axis \rotate #90 #arg #arg
      #})))

D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Царю Небесный"
  subtitle = "Глас 6-й"
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
PartPOneVoiceOne = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 40/8 \key f \major \tweak
  direction #UP \mark \markup \square \fontsize #2.120 \bold "1" \U f4 ( \U g4 )
  \U a2 ( \U g2 ) \U f4 ( \U e4 ) \U d4 ( \U e4 \U f4 \U g4 \U f2 \U e4 \U f4 )
  g1 | \break % 1
  \once \omit Staff.TimeSignature \time 28/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "2" \U g4 ( \U a4 ) \D bes2. ( \U a4 ) \U g4 (
  \U a4 ) \D bes2 \U a2 ( \U g2 ) | % 2
  \once \omit Staff.TimeSignature \time 36/8 \D c4 ( \D bes4 \U a4 \D bes4 ) \D
  c2 \D bes2 ( \U a2 ) g1 f1 | \break % 3
  \once \omit Staff.TimeSignature \time 48/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "3" \U a4 \D bes4 ( \D c2 ) \U a2 ( \U g2 ) \U
  g4 ( \U a4 ) \D bes2 ( \U g4 \U f4 \U g2 \U f4 -- \U f4 -- \U g4 \U a4 ) g1 | % 4
  \once \omit Staff.TimeSignature \time 44/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "4" \U a4 ( \D bes4 ) \D c2. ( \D bes4 ) \U a4
  ( \D bes4 ) \D c2 \D bes2 ( \U a2 ) g1 f1 | \break % 5
  \once \omit Staff.TimeSignature \time 84/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "5" \U g4 ( \U f4 ) \U a2 \U g2 \U g4 ( \U f4 )
  \U g4 ( \D bes4 ) \U a2 ( \U g2 \U a4 \U g4 \U f2 \U g2. \U f4 -- \U f4 -- \U
  g4 -- \U g4 -- \U f4 -- \U g2 -- \U f4 \U e4 \U f2 -- e1 \U f2 -- e1 ) | \break % 6
  \once \omit Staff.TimeSignature \time 40/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "6" \U a4 ( \D bes4 ) \D c4 ( \D bes4 ) \U a4 (
  \D bes4 ) \D c2 \D bes2 ( \U a2 ) g1 f1 | \break % 7
  \once \omit Staff.TimeSignature \time 56/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "7" \U a4 ( \U g4 ) \U a4 ( \D bes4 ) \D c2 (
  \U a2 \U g2 ) \U g4 ( \U f4 ) \U g4 ( \U a4 ) \D bes2 ( \U g4 \U f4 \U g2 \U f4
  ) -- \U f4 ( \U g4 \U a4 ) g1 | \break % 8
  \once \omit Staff.TimeSignature \time 40/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "8" \D bes4 ( \U g4 ) \U a4 ( \D bes4 ) \D c2 (
  \D c8 -- [ \D bes8 ] \U a4 bes1 ) \U f2 ( \U g4 \U a4 ) g1 | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 76/8 \U f4 ( \U a4 ) \U g2 \U a4 ( \D
  bes4 c1 ) \D bes4 ( \U g4 ) \U a4 ( \D bes4 ) \D c2 ( \U g2 \U a4 \U g4 \U f2
  ) \U g2 ( \U a2 \U g2. \D bes4 a1 g1 ) | \break % 10
  \once \omit Staff.TimeSignature \time 60/8 \tweak direction #UP \mark \markup
  \square \fontsize #2.120 \bold "9" \U g4 ( \U f4 ) \U g4 ( \U a4 ) \D bes2 \U
  g4 ( \U a4 \U g2 ) \U f2 \U g4 ( \U a4 \D bes2 ) \D bes2 \D bes4 ( -- \U a2 \D
  bes4 \U g2 -- \U f2 ) g1 ^\fermata \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Ца" __ \skip1 "рю" __ \skip1 "Не" __ \skip1 "бе" __ \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 "сный," "У" __ \skip1 "те" __ \skip1 "ши" __ \skip1 "те"
  -- "лю," __ \skip1 "Ду" __ \skip1 \skip1 \skip1 "ше" "ис" __ \skip1 "ти" --
  "ны," "И" __ \skip1 \skip1 "же" __ \skip1 "ве" __ \skip1 "зде" __ \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 "Сый," "и" __ \skip1 "вся" __ \skip1
  "ис" __ \skip1 "пол" -- "ня" __ \skip1 \skip1 "яй," "Со" __ \skip1 "кро" --
  "ви" -- "ще" __ \skip1 "бла" __ \skip1 "гих" __ \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 "(х)" "и" __ \skip1 "жи" __ \skip1 "зни" __ \skip1 "По" -- "да" __
  \skip1 "те" -- "лю," "при" __ \skip1 "и" __ \skip1 "ди" __ \skip1 \skip1 "и"
  __ \skip1 "все" __ \skip1 "ли" __ \skip1 \skip1 \skip1 \skip1 "ся" __ \skip1
  \skip1 "в ны," "и" __ \skip1 "о" __ \skip1 "чи" __ \skip1 \skip1 \skip1 \skip1
  "сти" __ \skip1 \skip1 "ны" "от" __ \skip1 "вся" __ \skip1 \skip1 \skip1 "ки"
  __ \skip1 "я" __ \skip1 "сквер" __ \skip1 \skip1 \skip1 \skip1 "ны" __ \skip1
  \skip1 \skip1 \skip1 \skip1 "и" __ \skip1 "спа" __ \skip1 "си," "Бла" __
  \skip1 \skip1 "же," "ду" __ \skip1 \skip1 "ши" "на" __ \skip1 \skip1 \skip1
  \skip1 "ша."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
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

