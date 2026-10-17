\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_t8.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subtitle = "toon 8"
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
PartPOneVoiceOne = \relative a' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/4 \key f \major \U a2
  \U g4 \U g4 \U g4 \U g4 \U g4 \U a2. ( \U g4 ) \U f2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \U a2 \U bes4 \U a4 \U g2 | \break % 2
  \once \omit Staff.TimeSignature \time 14/4 \U a4 \U a4 \U a4 \U a4 \U g2 \U f4
  ( \U a4 ) \U g2 ( \U f2 ) \U e2 | \break % 3
  \once \omit Staff.TimeSignature \time 12/4 \U g4 \U g4 \U g4 \U g4 \U g4 \U g4
  \U g4 \U a2 ( \U g4 ) \U f2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \U a4 \U a4 \U a2 \U bes4 \U a4 \U g2
  | \break % 5
  \once \omit Staff.TimeSignature \time 10/4 \U bes2 \U a2 \U g4 \U g4 f1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \U a2 \U g4 \U g4 \U g4 \U g4 \U a2.
  ( \U g4 ) \U f2 | \break % 7
  \once \omit Staff.TimeSignature \time 11/4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a2
  ( \U bes4 ) \U a4 \U g2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \U a4 \U g2 \U f4 \U f4 \U f4 \U a4
  \U g2 ( \U f2 ) \U e2 | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \U g4 \U g4 \U g4 \U g4 \U a2 ( \U g4
  ) \U f2 | % 10
  \once \omit Staff.TimeSignature \time 10/4 \U bes2 \U a2 \U g4 \U g4 f1 \bar
  "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Heer," ik roep tot U ver -- hoor __ \skip1 "mij," ver -- hoor mij o Heer Heer
  ik roep tot U ver __ \skip1 hoor __ \skip1 mij sla acht op de stem van mijn
  sme __ \skip1 king wan -- neer ik tot U "roep:" ver -- hoor mij o "Heer!" Laat
  mijn ge -- bed als wie __ \skip1 rook op -- stij -- gen voor Uw aan __ \skip1
  ge -- zicht de op -- hef -- fing van mijn han __ \skip1 den zij een a -- vond
  -- of __ \skip1 "fer:" ver -- hoor mij o "Heer!"
}

PartPOneVoiceTwo = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/4 \key f \major \D f2
  \D e4 \D e4 \D e4 \D e4 \D e4 \D f2. ( \D e4 ) \D d2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f2 \D g4 \D f4 \D e2 | % 2
  \once \omit Staff.TimeSignature \time 14/4 \D f4 \D f4 \D f4 \D f4 \D e2 \D d4
  ( \D f4 ) \D e2 ( \D d2 ) \D c2 | % 3
  \once \omit Staff.TimeSignature \time 12/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D e4
  \D e4 \D f2 ( \D e4 ) \D d2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \D f4 \D f4 \D f2 \D g4 \D f4 \D e2
  | % 5
  \once \omit Staff.TimeSignature \time 10/4 \D g2 \D f2 \D e4 \D e4 d1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \D f2 \D e4 \D e4 \D e4 \D e4 \D f2.
  ( \D e4 ) \D d2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f2
  ( \D g4 ) \D f4 \D e2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \D f4 \D e2 \D d4 \D d4 \D d4 \D f4
  \D e2 ( \D d2 ) \D c2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \D e4 \D e4 \D e4 \D e4 \D f2 ( \D e4
  ) \D d2 | % 10
  \once \omit Staff.TimeSignature \time 10/4 \D g2 \D f2 \D e4 \D e4 d1 \bar
  "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 13/4 \key f \major \U c2 \U
  c4 \U c4 \U c4 \U c4 \U c4 c1 \U a2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U c4 \U c2 \U c4 \U c4 \U c2 | % 2
  \once \omit Staff.TimeSignature \time 14/4 \U c4 \U c4 \U c4 \U c4 \U c2 \U c2
  \U c2 \U b2 \U g2 | % 3
  \once \omit Staff.TimeSignature \time 12/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4
  \U c4 \U c2. \U a2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \U c4 \U c4 \U c2 \U c4 \U c4 \U c2
  | % 5
  \once \omit Staff.TimeSignature \time 10/4 \U d2 \U d2 \U cis4 \U cis4 a1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \U c2 \U c4 \U c4 \U c4 \U c4 c1 \U
  a2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c2.
  \U c4 \U c2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \U c4 \U c2 \U c4 \U c4 \U c4 \U c4
  \U c2 ( \U b2 ) \U g2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \U c4 \U c4 \U c4 \U c4 \U c2. \U a2
  | % 10
  \once \omit Staff.TimeSignature \time 10/4 \U d2 \U d2 \U cis4 \U cis4 a1 \bar
  "|."
}

PartPTwoVoiceTwo = \relative f {
  \clef "bass" \once \omit Staff.TimeSignature \time 13/4 \key f \major \D f2 \D
  c4 \D c4 \D c4 \D c4 \D c4 \D f2. ( \D c4 ) \D d2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f2 \D e4 \D f4 \D c2 | % 2
  \once \omit Staff.TimeSignature \time 14/4 \D f4 \D f4 \D f4 \D f4 \D c2 \D c4
  ( \D f4 ) \D g2 ( \D g,2 ) \D c2 | % 3
  \once \omit Staff.TimeSignature \time 12/4 \D c4 \D c4 \D c4 \D c4 \D c4 \D c4
  \D c4 \D f2 ( \D c4 ) \D d2 | % 4
  \once \omit Staff.TimeSignature \time 8/4 \D f4 \D f4 \D f2 \D e4 \D f4 \D c2
  | % 5
  \once \omit Staff.TimeSignature \time 10/4 \D g'2 \D a2 \D a,4 \D a4 d1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 12/4 \D f2 \D c4 \D c4 \D c4 \D c4 \D f2.
  ( \D c4 ) \D d2 | % 7
  \once \omit Staff.TimeSignature \time 11/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f2
  ( \D e4 ) \D f4 \D c2 | % 8
  \once \omit Staff.TimeSignature \time 13/4 \D f4 \D c2 \D c4 \D c4 \D c4 \D f4
  \D g2 ( \D g,2 ) \D c2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \D c4 \D c4 \D c4 \D c4 \D f2 ( \D c4
  ) \D d2 | % 10
  \once \omit Staff.TimeSignature \time 10/4 \D g2 \D a2 \D a,4 \D a4 d1 \bar
  "|."
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

