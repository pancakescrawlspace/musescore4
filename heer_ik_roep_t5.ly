\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_t5.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subsubtitle = "toon 5"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 11/4 \key f \major \U g2
  \U g4 \U g4 \U g4 \U f4 \U g4 \U a2 \U f2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \U a2 \U g4 \U f4 \U g2 | \break % 2
  \once \omit Staff.TimeSignature \time 12/4 \U g2 \U g4 \U g4 \U g4 \U g4 \U e4
  \U f2 ( \U e4 ) \U d2 | \break % 3
  \U g4 \U g2 \U g4 \U g4 \U g4 \U f4 \U g4 \U a2 \U f2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \U a4 \U a4 \U a2 \U g4 \U f4 \U g2
  | \break % 5
  \once \omit Staff.TimeSignature \time 14/4 \U a2 \U g2 ( \U f2 ) \U e2 \U f4 (
  \U e4 ) d1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 10/4 \U g2 \U g4 \U g4 \U f4 \U g4 \U a2
  \U f2 | \break % 7
  \once \omit Staff.TimeSignature \time 11/4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a2
  ( \U g4 ) \U f4 \U g2 | % 8
  \once \omit Staff.TimeSignature \time 12/4 \U g4 \U g2 \U g4 \U g4 \U g4 \U e4
  \U f2 ( \U e4 ) \U d2 | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \U g2 \U g4 \U f4 \U g4 \U a2 \U f2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \U a2 \U g2 ( \U f2 ) \U e2 \U f4 (
  \U e4 ) d1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Heer ik roep tot U ver -- hoor "mij," ver -- hoor mij o "Heer," Heer ik roep
  tot U ver -- hoor __ \skip1 "mij," sla acht op de stem van mijn sme -- "king,"
  wan -- neer ik tot U "roep:" ver -- hoor __ \skip1 mij o __ \skip1 "Heer!"
  Laat mijn ge -- bed als wie -- rook op -- stij -- gen voor Uw aan __ \skip1 ge
  -- "zicht," de op -- hef -- fing van mijn han __ \skip1 den zij een a -- vond
  -- of -- "fer:" ver -- hoor __ \skip1 mij o __ \skip1 "Heer!"
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 11/4 \key f \major \D e2
  \D e4 \D e4 \D e4 \D d4 \D e4 \D f2 \D f2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f2 \D e4 \D d4 \D e2 | % 2
  \once \omit Staff.TimeSignature \time 12/4 \D e2 \D e4 \D e4 \D e4 \D e4 \D c4
  \D d2. \D d2 | % 3
  \D e4 \D e2 \D e4 \D e4 \D e4 \D d4 \D e4 \D f2 \D f2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \D f4 \D f4 \D f2 \D e4 \D d4 \D e2
  | % 5
  \once \omit Staff.TimeSignature \time 14/4 \D f2 \D e2 ( \D d2 ) \D cis2 \D d4
  ( \D cis4 ) d1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 10/4 \D e2 \D e4 \D e4 \D d4 \D e4 \D f2
  \D f2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f2
  ( \D e4 ) \D d4 \D e2 | % 8
  \once \omit Staff.TimeSignature \time 12/4 \D e4 \D e2 \D e4 \D e4 \D e4 \D c4
  \D d2. \D d2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \D e2 \D e4 \D d4 \D e4 \D f2 \D f2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \D f2 \D e2 ( \D d2 ) \D c2 \D d4 (
  \D c4 ) d1 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 11/4 \key f \major \U c2 \U
  c4 \U c4 \U c4 \U c4 \U c4 \U c2 \U a2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U c4 \U c2 \U c4 \U c4 \U c2 | % 2
  \once \omit Staff.TimeSignature \time 12/4 \U bes2 \U bes4 \U bes4 \U bes4 \U
  bes4 \U bes4 \U a2 ( \U g4 ) \U f2 | % 3
  \U c'4 \U c2 \U c4 \U c4 \U c4 \U c4 \U c4 \U c2 \U a2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \U c4 \U c4 \U c2 \U c4 \U c4 \U c2
  | % 5
  \once \omit Staff.TimeSignature \time 14/4 \U c2 \U c2 ( \U a2 ) \U a2 \U a4 (
  \U g4 ) f1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 10/4 \U c'2 \U c4 \U c4 \U c4 \U c4 \U c2
  \U a2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c2.
  \U c4 \U c2 | % 8
  \once \omit Staff.TimeSignature \time 12/4 \U bes4 \U bes2 \U bes4 \U bes4 \U
  bes4 \U bes4 \U a2 ( \U g4 ) \U f2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \U c'2 \U c4 \U c4 \U c4 \U c2 \U a2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \U c2 \U c2 ( \U a2 ) \U a2 \U a4 (
  \U g4 ) f1 \bar "|."
}

PartPTwoVoiceTwo = \relative c {
  \clef "bass" \once \omit Staff.TimeSignature \time 11/4 \key f \major \D c2 \D
  c4 \D c4 \D c4 \D c4 \D c4 \D f2 \D f2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f2 \D c4 \D c4 \D c2 | % 2
  \once \omit Staff.TimeSignature \time 12/4 \D c2 \D c4 \D c4 \D c4 \D c4 \D c4
  \D d2. \D d2 | % 3
  \D c4 \D c2 \D c4 \D c4 \D c4 \D c4 \D c4 \D f2 \D f2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \D f4 \D f4 \D f2 \D c4 \D c4 \D c2
  | % 5
  \once \omit Staff.TimeSignature \time 14/4 \D f2 \D c2 ( \D d2 ) \D a2 \D a2 d1
  \bar "||" % 6
  \once \omit Staff.TimeSignature \time 10/4 \D c2 \D c4 \D c4 \D c4 \D c4 \D f2
  \D f2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f2
  ( \D c4 ) \D c4 \D c2 | % 8
  \once \omit Staff.TimeSignature \time 12/4 \D c4 \D c2 \D c4 \D c4 \D c4 \D c4
  \D d2. \D d2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \D c2 \D c4 \D c4 \D c4 \D f2 \D f2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \D f2 \D c2 ( \D d2 ) \D a2 \D a2 d1
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

