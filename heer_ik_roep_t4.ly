\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_t4.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subtitle = "toon 4"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key f \major \U g4
  \U g4 \U g4 \U g4 \U g4 \U g4 \U a2 \U a2 | \break % 1
  \once \omit Staff.TimeSignature \time 7/4 \U bes4 \U bes2 \U bes4 \U bes4 \U a2
  | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U c2 \U bes4 \U a4 \U a4 \U a4 \U
  a4 \U bes2 \U a2 | \break % 3
  \once \omit Staff.TimeSignature \time 13/4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4
  \U a4 \U g2 ( \U a2 ) \U bes2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \U bes4 \U a2 \U bes4 \U c4 \U bes2
  ( \U a2 ) \U g2 | \break % 5
  \once \omit Staff.TimeSignature \time 10/4 \U bes2 \U a2 \U g4 \U g4 f1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \U g4 \U g4 \U g4 \U g4 \U g4 \U a2
  \U a2 | \break % 7
  \once \omit Staff.TimeSignature \time 10/4 \U bes4 \U bes4 \U bes4 \U bes4 \U
  bes4 \U bes2 \U bes4 \U a2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \U bes4 \U c2 \U bes4 \U a4 \U a4
  \U a4 \U bes2 \U a2 | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 10/4 \U a4 \U a4 \U a4 \U a4 \U g2 ( \U
  a2 ) \U bes2 | % 10
  \U bes2 \U a2 \U g4 \U g4 f1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Heer ik roep tot U ver -- hoor mij ver -- hoor mij o Heer Heer ik roep tot U
  ver -- hoor mij sla acht op de stem van mijn sme __ \skip1 king wan -- neer ik
  tot U __ \skip1 roep ver -- hoor mij o "Heer!" Laat mijn ge -- bed als wie --
  rook op -- stij -- gen voor Uw aan -- ge -- zicht de op -- hef -- fing van
  mijn han -- den zij een a -- vond -- of __ \skip1 fer ver -- hoor mij o
  "Heer!"
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key f \major \D e4
  \D e4 \D e4 \D e4 \D e4 \D e4 \D f2 \D f2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D g4 \D g2 \D g4 \D g4 \D f2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D a2 \D g4 \D f4 \D f4 \D f4 \D f4
  \D g2 \D f2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f4 \D e2 ( \D f2 ) \D g2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D f2 \D g4 \D a4 \D g2 ( \D
  f2 ) \D e2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \D g2 \D f2 \D e4 \D e4 d1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D f2
  \D f2 | % 7
  \once \omit Staff.TimeSignature \time 10/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g2
  \D g4 \D f2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D a2 \D g4 \D f4 \D f4 \D f4
  \D g2 \D f2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 10/4 \D f4 \D f4 \D f4 \D f4 \D e2 ( \D
  f2 ) \D g2 | % 10
  \D g2 \D f2 \D e4 \D e4 d1 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 10/4 \key f \major \U c4 \U
  c4 \U c4 \U c4 \U c4 \U c4 \U c2 \U c2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U c4 \U c2 \U c4 \U c4 \U c2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U c2 \U c4 \U c4 \U c4 \U c4 \U c4
  \U c2 \U c2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4
  \U c4 \U c2 \U c2 \U c2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U c2 \U c4 \U c4 c1 \U c2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \U c2 \U c2 \U cis4 \U cis4 a1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c2
  \U c2 | % 7
  \once \omit Staff.TimeSignature \time 10/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c2
  \U c4 \U c2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U c2 \U c4 \U c4 \U c4 \U c4
  \U c2 \U c2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 10/4 \U c4 \U c4 \U c4 \U c4 c1 \U c2 | % 10
  \U c2 \U c2 \U cis4 \U cis4 a1 \bar "|."
}

PartPTwoVoiceTwo = \relative c {
  \clef "bass" \once \omit Staff.TimeSignature \time 10/4 \key f \major \D c4 \D
  c4 \D c4 \D c4 \D c4 \D c4 \D f2 \D f2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D c4 \D c2 \D c4 \D c4 \D f2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D f2 \D e4 \D f4 \D f4 \D f4 \D f4
  \D c2 \D f2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f4 c1 \D c2 | % 4
  \once \omit Staff.TimeSignature \time 11/4 \D c4 \D f2 \D f4 \D f4 \D e2 ( \D
  f2 ) \D c2 | % 5
  \once \omit Staff.TimeSignature \time 10/4 \D c2 \D f2 \D a4 \D a4 d,1 \bar
  "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \D c4 \D c4 \D c4 \D c4 \D c4 \D f2
  \D f2 | % 7
  \once \omit Staff.TimeSignature \time 10/4 \D c4 \D c4 \D c4 \D c4 \D c4 \D c2
  \D c4 \D f2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \D f4 \D f2 \D e4 \D f4 \D f4 \D f4
  \D c2 \D f2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 10/4 \D f4 \D f4 \D f4 \D f4 c1 \D c2 | % 10
  \D c2 \D f2 \D a4 \D a4 d,1 \bar "|."
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

