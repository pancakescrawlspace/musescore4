\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from canon_kruisverheffing.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer), plus the changes marked with "hand edit" comments below
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Canon van Kruisverheffing"
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-16"
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
PartPOneVoiceOne = \relative fis' {
  \clef "treble" \once \omit Staff.TimeSignature \time 23/4 \key g \major \U fis4
  \U g4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4
  \U a4 \U a4 ( \U g4 ) \U a4 \U b4 \U b4 \U a4 \U g2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \U g4 \U g4 \U a4 \U b4 \U c4 \U d4
  \U c4 \U b4 \U a2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U fis4 ( \U g4 ) \U a4 \U a4 \U g4
  ( \U a4 ) \U b4 \U b4 ( \U a4 ) \U g2 | % 3
  \once \omit Staff.TimeSignature \time 15/4 \U g4 \U g4 \U g4 \U g4 \U g4 \U g4
  \U g4 \U a4 ( \U b4 ) \U c4 ( \U d4 ) \U c4 ( \U b4 ) \U a2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \U fis4 ( \U a4 ) \U a4 \U a4 \U a4
  \U g4 \U a4 \U b4 \U b4 \U b4 \U a2 \U g2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \U g4 \U g4 \U a4 \U b4 \U c4 \U d4
  \U c4 \U b4 \U a2 | % 6
  \once \omit Staff.TimeSignature \time 12/4 \U fis4 \U a4 \U a4 \U a4 \U a4 (
  \U g4 ) \U a4 ( \U b4 ) \U b4 \U a4 \U g2 | % 7
  \once \omit Staff.TimeSignature \time 18/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4
  \U b2 \U a4 ( \U g4 ) a1 g1 ^\fermata \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Toen __ \skip1 Mo -- zes met zijn staf het te -- ken des krui -- zes maak --
  te o __ \skip1 ver de Ro -- de Zee wer -- den voor het volk van Is -- ra -- el
  de __ \skip1 wa -- te -- ren __ \skip1 ge -- o __ \skip1 pend maar o -- ver de
  le -- ger -- macht van __ \skip1 Pha __ \skip1 ra __ \skip1 o wer __ \skip1
  den de wa -- te -- ren we -- der ge -- slo -- ten daar -- om zin -- gen wij
  tot Chris -- tus God want Hij is be -- dekt __ \skip1 met __ \skip1 heer --
  lijk -- "heid:" E -- re zij Uw kost -- baar Kruis o __ \skip1 He -- "re!"
}

PartPOneVoiceTwo = \relative d' {
  \clef "treble" \once \omit Staff.TimeSignature \time 23/4 \key g \major \D d2
  \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4
  \D fis4 \D fis4 \D fis4 \D fis4 ( \D g4 ) \D g4 \D g4 \D g4 \D e8 ( [ \D fis8
  ) ] \D g2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D e2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D d2 \D fis4 \D fis4 \D g2 \D g4
  \D g4 ( \D d8 [ \D e8 ) ] \D g2 | % 3
  \once \omit Staff.TimeSignature \time 15/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g2 \D g2 \D g2 \D e2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \D d4 ( \D fis4 ) \D fis4 \D fis4
  \D fis4 \D g4 \D g4 \D g4 \D g4 \D g4 \D e4 ( \D fis4 ) \D g2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D e2 | % 6
  \once \omit Staff.TimeSignature \time 12/4 \D d4 \D fis4 \D fis4 \D fis4 \D
  fis4 ( \D g4 ) \D g2 \D g4 \D e8 ( [ \D fis8 ) ] \D g2 | % 7
  \once \omit Staff.TimeSignature \time 18/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g2 \D d2 \D e2 ( \D fis2 ) d1 \bar "|."
}

PartPTwoVoiceOne = \relative a {
  \clef "bass" \once \omit Staff.TimeSignature \time 23/4 \key g \major \U a4 \U
  b4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4 \U
  c4 \U c4 ( \U b4 ) \U c4 \U d4 \U d4 \U c4 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \U b4 \U b4 \U c4 \U d4 \U e4 \U f4
  \U e4 \U d4 \U c2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U a4 ( \U b4 ) \U c4 \U c4 \U b4 (
  \U c4 ) \U d4 \U d2 \U b2 | % 3
  \once \omit Staff.TimeSignature \time 15/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b4
  \U b4 \U c4 ( \U d4 ) \U e4 ( \U f4 ) \U e4 ( \U d4 ) \U c2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \U a4 ( \U c4 ) \U c4 \U c4 \U c4
  \U b4 \U c4 \U d4 \U d4 \U d4 \U c2 \U b2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \U b4 \U b4 \U c4 \U d4 \U e4 \U f4
  \U e4 \U d4 \U c2 | % 6
  \once \omit Staff.TimeSignature \time 12/4 \U a4 \U c4 \U c4 \U c4 \U c4 ( \U
  b4 ) \U c4 ( \U d4 ) \U d4 \U c8 ( [ \U d8 ) ] \U b2 | % 7
  \once \omit Staff.TimeSignature \time 18/4 \U e4 \U e4 \U e4 \U e4 \U e4 \U e4
  \U d2 \U c4 ( \U b4 ) c1 b1 \bar "|."
}

PartPTwoVoiceTwo = \relative d {
  \clef "bass" \once \omit Staff.TimeSignature \time 23/4 \key g \major \D d2 \D
  d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D
  d4 ( \D g4 ) \D g4 \D g4 \D g4 \D g4 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \D g4 \D g4 \D g4 \D g4 \D c,4 \D b4
  \D c4 \D g'4 \D a2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D d,2 \D d4 \D d4 \D g2 \D g4 \D g2
  \D g2 | % 3
  \once \omit Staff.TimeSignature \time 15/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g2 \D c,4 ( \D b4 ) \D c4 ( \D g'4 ) \D a2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \D d,2 \D d4 \D d4 \D d4 \D g4 \D g4
  \D g4 \D g4 \D g4 \D g2 \D g2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \D g4 \D g4 \D g4 \D g4 \D c,4 \D b4
  \D c4 \D g'4 \D a2 | % 6
  \once \omit Staff.TimeSignature \time 12/4 \D d,4 \D d4 \D d4 \D d4 \D d4 ( \D
  g4 ) \D g2 \D g4 \D g4 \D g2 | % 7
  \once \omit Staff.TimeSignature \time 18/4 \D c,4 \D e4 \D e4 \D e4 \D e4 \D e4
  \D g2 \D fis4 \D g4 \D c,2 ( \D d2 ) <g, g'>1 _\fermata \bar "|."
}


% The score definition
\score {
  <<
    \new StaffGroup <<
      \new Staff = "P1" <<
        \set Staff.instrumentName = "Women"
        \context Staff <<
          \override Staff.BarLine.allow-span-bar = ##f
          \mergeDifferentlyDottedOn
          \mergeDifferentlyHeadedOn
                    % hand edit: allow a line break in the long first measure, after "maakte"
                    { s4*15 \bar "" }
          \context Voice = "PartPOneVoiceOne" {
            \voiceOne \PartPOneVoiceOne
          }
          \new Lyrics \lyricsto "PartPOneVoiceOne" {
            \PartPOneVoiceOneLyricsOne
          }
          \context Voice = "PartPOneVoiceTwo" {
            \voiceTwo \PartPOneVoiceTwo
          }
        >>
      >>
      \new Staff = "P2" <<
        \set Staff.instrumentName = "Men"
        \context Staff <<
          \override Staff.BarLine.allow-span-bar = ##f
          \mergeDifferentlyDottedOn
          \mergeDifferentlyHeadedOn
          \context Voice = "PartPTwoVoiceOne" {
            \voiceOne \PartPTwoVoiceOne
          }
          \context Voice = "PartPTwoVoiceTwo" {
            \voiceTwo \PartPTwoVoiceTwo
          }
        >>
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

