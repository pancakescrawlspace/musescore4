\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_t3.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subtitle = "toon 3"
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-17"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 13/4 \key f \major \U g2
  \U a4 \U a4 \U a4 \U a4 \U bes4 \U a2 ( \U g4 \U f4 ) \U g2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \U g4 \U g2. ( \U a4 ) \U g2 \U f4
  \U e2 | \break % 2
  \once \omit Staff.TimeSignature \time 13/4 \U g2 \U a4 \U a4 \U a4 \U a4 \U
  bes4 \U a2 ( \U g4 \U f4 ) \U g2 | % 3
  \U g4 \U g2 \U a4 \U a4 \U a4 \U a4 \U a4 \U g2 ( \U f4 ) \U e2 | \break % 4
  \once \omit Staff.TimeSignature \time 11/4 \U g4 \U g2 \U a4 \U bes4 \U a2 (
  \U g4 \U f4 ) \U g2 | % 5
  \once \omit Staff.TimeSignature \time 14/4 \U a2 \U g2 ( \U e4 \U f4 ) \U g4 (
  \U a4 ) \U f2 e1 \bar "||" \break % 6
  \once \omit Staff.TimeSignature \time 12/4 \U g2 \U a4 \U a4 \U a4 \U bes4 \U
  a2 ( \U g4 \U f4 ) \U g2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \U g2 \U a4 \U a4 \U a4 \U a4 \U g2
  \U f4 \U e2 | \break % 8
  \once \omit Staff.TimeSignature \time 13/4 \U g4 \U g2 \U a4 \U a4 \U a4 \U
  bes4 \U a2 ( \U g4 \U f4 ) \U g2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 11/4 \U g4 \U g4 \U g2. \U a4 \U g2 ( \U
  f4 ) \U e2 | \break % 10
  \once \omit Staff.TimeSignature \time 14/4 \U a2 \U g2 ( \U e4 \U f4 ) \U g4 (
  \U a4 ) \U f2 e1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Heer ik roep tot "U," ver -- hoor __ \skip1 \skip1 "mij," ver -- hoor __
  \skip1 mij o "Heer," Heer ik roep tot "U," ver -- hoor __ \skip1 \skip1 mij
  sla acht op de stem van mijn sme __ \skip1 "king," wan -- neer ik tot U __
  \skip1 \skip1 "roep," ver -- hoor __ \skip1 \skip1 mij __ \skip1 o "Heer!"
  Laat mijn ge -- bed als wie __ \skip1 \skip1 rook op -- stij -- gen voor Uw
  aan -- ge -- zicht de op -- hef -- fing van mijn han __ \skip1 \skip1 den zij
  een a -- vond -- of __ \skip1 "fer:" ver -- hoor __ \skip1 \skip1 mij __
  \skip1 o "Heer!"
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/4 \key f \major \D e2
  \D f4 \D f4 \D f4 \D f4 \D g4 \D f2 ( \D e4 \D d4 ) \D e2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \D e4 \D e2. ( \D f4 ) \D e2 \D d4
  \D c2 | % 2
  \once \omit Staff.TimeSignature \time 13/4 \D e2 \D f4 \D f4 \D f4 \D f4 \D g4
  \D f2 ( \D e4 \D d4 ) \D e2 | % 3
  \D e4 \D e2 \D f4 \D f4 \D f4 \D f4 \D f4 \D e2 ( \D d4 ) \D c2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \D e4 \D e2 \D f4 \D g4 \D f2 ( \D
  e4 \D d4 ) \D e2 | % 5
  \once \omit Staff.TimeSignature \time 14/4 \D f2 \D e2 ( \D c4 \D d4 ) \D e4 (
  \D f4 ) \D d2 c1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \D e2 \D f4 \D f4 \D f4 \D g4 \D f2
  ( \D e4 \D d4 ) \D e2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \D e2 \D f4 \D f4 \D f4 \D f4 \D e2
  \D d4 \D c2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \D e4 \D e2 \D f4 \D f4 \D f4 \D g4
  \D f2 \D e4 \D d4 \D e2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 11/4 \D e4 \D e4 \D e2. \D f4 \D e2 ( \D
  d4 ) \D c2 | % 10
  \once \omit Staff.TimeSignature \time 14/4 \D f2 \D e2 ( \D c4 \D d4 ) \D e4 (
  \D f4 ) \D d2 c1 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 13/4 \key f \major \U c2 \U
  c4 \U c4 \U c4 \U c4 \U c4 c1 \U c2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \U c4 c1 \U c2 \U b4 \U g2 | % 2
  \once \omit Staff.TimeSignature \time 13/4 \U c2 \U c4 \U c4 \U c4 \U c4 \U c4
  c1 \U c2 | % 3
  \U c4 \U c2 \U c4 \U c4 \U c4 \U c4 \U c4 \U c2 ( \U b4 ) \U g2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U c2 \U c4 \U c4 \U c2 \U c4
  \U c4 \U c2 | % 5
  \once \omit Staff.TimeSignature \time 14/4 \U c2 c1 \U c2 \U b2 g1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \U c2 \U c4 \U c4 \U c4 \U c4 c1 \U
  c2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \U c2 \U c4 \U c4 \U c4 \U c4 \U c2
  \U b4 \U g2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \U c4 \U c2 \U c4 \U c4 \U c4 \U c4
  c1 \U c2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U c4 \U c2. \U c4 \U c2 ( \U
  b4 ) \U g2 | % 10
  \once \omit Staff.TimeSignature \time 14/4 \U c2 c1 \U c2 \U b2 g1 \bar "|."
}

PartPTwoVoiceTwo = \relative c {
  \clef "bass" \once \omit Staff.TimeSignature \time 13/4 \key f \major \D c2 \D
  f4 \D f4 \D f4 \D f4 \D f4 \D f2 ( \D c2 ) \D c2 | % 1
  \once \omit Staff.TimeSignature \time 10/4 \D c4 \D c2. ( \D f4 ) \D g2 \D g,4
  \D c2 | % 2
  \once \omit Staff.TimeSignature \time 13/4 \D c2 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f2 ( \D c2 ) \D c2 | % 3
  \D c4 \D c2 \D f4 \D f4 \D f4 \D f4 \D f4 \D g2 ( \D g,4 ) \D c2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \D c4 \D c2 \D f4 \D f4 \D f2 ( \D
  c4 ) \D c4 \D c2 | % 5
  \once \omit Staff.TimeSignature \time 14/4 \D f2 c1 \D c4 ( \D f4 ) \D g2 c,1
  \bar "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \D c2 \D f4 \D f4 \D f4 \D f4 \D f2
  ( \D c2 ) \D c2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \D c2 \D f4 \D f4 \D f4 \D f4 \D g2
  \D g,4 \D c2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \D c4 \D c2 \D f4 \D f4 \D f4 \D f4
  \D f2 ( \D c2 ) \D c2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 11/4 \D c4 \D c4 \D c2. \D f4 \D g2 ( \D
  g,4 ) \D c2 | % 10
  \once \omit Staff.TimeSignature \time 14/4 \D f2 c1 \D c4 ( \D f4 ) \D g2 c,1
  \bar "|."
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

