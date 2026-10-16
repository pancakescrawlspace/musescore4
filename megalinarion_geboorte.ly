\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from megalinarion_geboorte.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Megalinarion van de Geboorte van de Moeder Gods"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 14/4 \key c \major \U a4
  ( \U b4 ) \U c2 \U b4 \U c4 \U a2 \U b4 ( \U c4 ) \U d4 \U b4 \U c2 | % 1
  \once \omit Staff.TimeSignature \time 13/4 \U a4 \U c2 \U b4 \U c4 \U d2 ( \U
  c4 ) \U b4 \U a4 ( \U gis4 ) \U a2 | % 2
  \once \omit Staff.TimeSignature \time 24/4 \U a4 \U b8 ( [ \U c8 ] \U d4 ) \U
  c4 \U b2 \U b2 \U b4 ( \U c4 ) \U d4 ( \U e4 \U d4 ) \U c4 \U b4 \U a4 \U c2
  \U b2 a1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Ver __ \skip1 hef o mijn ziel met __ \skip1 ju -- bel -- zang ver -- hef o
  mijn ziel __ \skip1 met ju -- bel -- zang de glo __ \skip1 \skip1 rie -- rij
  -- ke ge __ \skip1 boor __ \skip1 \skip1 te van de Moe -- der Gods
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 14/4 \key c \major \D e4
  ( \D g4 ) \D g2 \D g2 \D e2 \D g2 \D g4 \D g4 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 13/4 \D a4 \D a2 \D a2 \D a2. \D f4 \D e2
  \D e2 | % 2
  \once \omit Staff.TimeSignature \time 24/4 \D e4 \D g2 \D g4 \D g2 \D g2 \D g2
  \D g2 ( \D g2 ) \D e4 \D e4 \D e4 ( \D a4 ) \D e4 ( \D gis4 ) a1 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 14/4 \key c \major \U c4 (
  \U d4 ) \U e2 \U d4 \U e4 \U c2 \U d4 ( \U e4 ) \U f4 \U d4 \U e2 | % 1
  \once \omit Staff.TimeSignature \time 13/4 \U c4 \U e2 \U d4 \U e4 \U f2 ( \U
  e4 ) \U d4 \U c4 ( \U b4 ) \U c2 | % 2
  \once \omit Staff.TimeSignature \time 24/4 \U c4 \U d8 ( [ \U e8 ] \U f4 ) \U
  e4 \U d2 \U d2 \U d4 ( \U e4 ) \U f4 ( \U g4 \U f4 ) \U e4 \U d4 \U c4 \U e2
  \U d2 c1 \bar "|."
}

PartPTwoVoiceTwo = \relative a {
  \clef "bass" \once \omit Staff.TimeSignature \time 14/4 \key c \major \D a4 (
  \D g4 ) \D c,2 \D g'2 \D a2 \D g2 \D g4 \D g4 \D c,2 | % 1
  \once \omit Staff.TimeSignature \time 13/4 \D a'4 \D a2 \D a2 \D d,4 ( \D b4
  \D c4 ) \D d4 \D e2 \D a2 | % 2
  \once \omit Staff.TimeSignature \time 24/4 \D a4 \D g4 ( \D b4 ) \D c4 \D g2
  \D g2 \D g2 \D g2 ( \D g4 ) \D g4 \D gis4 \D a4 \D e2 \D e2 a1 \bar "|."
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

