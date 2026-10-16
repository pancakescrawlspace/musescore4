\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from gij_heilige_martelaren.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Gij heilige Martelaren"
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
PartPOneVoiceOne = \relative a' {
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key g \major \U a4
  \U b4 \U b4 \U a4 \U g4 \U g4 \U g4 \U a4 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 11/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b4
  \U b4 \U b2 \U a2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \U a4 \U b4 \U a4 \U g4 \U g4 \U g4
  \U a4 \U b2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U a2
  \U g4 \U fis4 \U g4 \U g2 fis1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Gij hei -- li -- ge mar -- te -- la __ \skip1 ren die de goe -- de strijd hebt
  ge -- stre -- den en die uw kroon ont -- van -- gen hebt bidt de Heer om de
  red -- ding on -- zer zie -- "len!"
}

PartPOneVoiceTwo = \relative fis' {
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key g \major \D fis4
  \D g4 \D g4 \D fis4 \D e4 \D e4 \D e4 \D fis4 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g2 \D fis2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \D fis4 \D g4 \D fis4 \D e4 \D e4 \D
  e4 \D fis4 \D g2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D
  fis2 \D e4 \D d4 \D e4 \D e2 d1 \bar "|."
}

PartPTwoVoiceOne = \relative d' {
  \clef "bass" \once \omit Staff.TimeSignature \time 10/4 \key g \major \U d4 \U
  d4 \U d4 \U d4 \U b4 \U b4 \U b4 \U d4 \U d2 | % 1
  \once \omit Staff.TimeSignature \time 11/4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4
  \U d4 \U d2 \U d2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \U d4 \U d4 \U d4 \U b4 \U b4 \U b4
  \U d4 \U d2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d2
  \U a4 \U a4 \U a4 \U a2 a1 \bar "|."
}

PartPTwoVoiceTwo = \relative d {
  \clef "bass" \once \omit Staff.TimeSignature \time 10/4 \key g \major \D d4 \D
  g4 \D g4 \D d4 \D e4 \D e4 \D e4 \D d4 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g2 \D d2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \D d4 \D g4 \D d4 \D e4 \D e4 \D e4
  \D d4 \D g2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D d2
  \D cis4 \D d4 \D a4 \D a2 d1 \bar "|."
}


% The score definition
\score {
  <<
    \new StaffGroup <<
      \new Staff = "P1" <<
        \set Staff.instrumentName = "Women"
        \set Staff.shortInstrumentName = "W."
        \context Staff <<
          \override Staff.BarLine.allow-span-bar = ##f
          \mergeDifferentlyDottedOn
          \mergeDifferentlyHeadedOn
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
        \set Staff.shortInstrumentName = "M."
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

