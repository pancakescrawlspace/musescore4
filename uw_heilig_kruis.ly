\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from uw_heilig_kruis.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Uw Heilig Kruis"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 21/4 \key g \major \U fis4
  \U g2 \U fis2 \U g2 \U a4 ( \U b4 ) \U c4 \U b4 \U c4 \U a4 \U b2 ( \U a2 ) g1
  | % 1
  \once \omit Staff.TimeSignature \time 22/4 \U b4 \U b4 \U a2 \U g2 \U fis4 \U
  g4 \U a4. ( \U b8 \U a4 ) \U g4 \U fis2 \U g2 \U fis2 g1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Uw hei -- lig kruis ver __ \skip1 e -- ren wij Ge -- bie __ \skip1 der en Uw
  hei -- li -- ge ver -- rij __ \skip1 \skip1 ze -- nis lo -- ven wij
}

PartPOneVoiceTwo = \relative dis' {
  \clef "treble" \once \omit Staff.TimeSignature \time 21/4 \key g \major \D dis4
  \D e2 \D dis2 \D e2 \D fis4 ( \D g4 ) \D a4 \D g4 \D a4 \D fis4 \D g2 ( \D fis2
  ) e1 | % 1
  \once \omit Staff.TimeSignature \time 22/4 \D g4 \D g4 \D fis2 \D e2 \D dis4
  \D e4 \D fis4. ( \D g8 \D fis4 ) \D e4 \D dis2 \D e2 \D dis2 e1 \bar "|."
}

PartPTwoVoiceOne = \relative b {
  \clef "bass" \once \omit Staff.TimeSignature \time 21/4 \key g \major \U b4 \U
  b2 \U b2 \U b2 \U d2 \U d4 \U d4 \U d4 \U d4 \U d2 ( \U dis2 ) b1 | % 1
  \once \omit Staff.TimeSignature \time 22/4 \U d4 \U d4 \U dis2 \U b2 \U b4 \U
  b4 \U d2. \U b4 \U b2 \U b2 \U b2 b1 \bar "|."
}

PartPTwoVoiceTwo = \relative b, {
  \clef "bass" \once \omit Staff.TimeSignature \time 21/4 \key g \major \D b4 \D
  e2 \D b2 \D e2 \D d2 \D d4 \D d4 \D d4 \D d4 \D <g, g'>2 ( \D b2 ) e1 | % 1
  \once \omit Staff.TimeSignature \time 22/4 \D g4 \D g4 \D b,2 \D e2 \D b4 \D e4
  \D d4. ( \D g8 \D d4 ) \D e4 \D b2 \D e2 \D b2 <e, e'>1 \bar "|."
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

