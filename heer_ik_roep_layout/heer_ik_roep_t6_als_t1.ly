\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_layout/heer_ik_roep_t6_als_t1.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subsubtitle = "toon 6"
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
PartPOneVoiceOne = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key g \major \U g4
  \U g4 \U g4 \U g4 \U g4 \U g4 \U fis2 \U g2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \U a2 \U g4 \U g4 \U a2 | \break % 2
  \once \omit Staff.TimeSignature \time 11/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b4
  \U a2 ( \U g4 ) \U fis2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \U g4 \U g4 \U g4 \U g4 \U g4 \U g4
  \U g4 \bar "" \break \set Score.currentBarNumber = #4
  \once \omit Staff.TimeSignature \time 4/4 \U fis2 \U g2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \U a4 \U a4 \U a4 \U a2 \U g2 \U fis2
  | % 5
  \once \omit Staff.TimeSignature \time 14/4 \U g4 ( \U a4 ) \U b2. ( \U a4 ) \U
  g2 \U fis2 g1 \bar "||" \break % 6
  \once \omit Staff.TimeSignature \time 9/4 \U g4 \U g4 \U g4 \U g4 \U g4 \U fis2
  \U g2 | % 7
  \once \omit Staff.TimeSignature \time 3/4 \U a4 \U a4 \U a4 \bar "" \break \set Score.currentBarNumber = #8
  \once \omit Staff.TimeSignature \time 8/4 \U a4 \U a4 \U a2 \U g2 \U a2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b4
  \U a2 ( \U g4 ) \U fis2 | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 8/4 \U g4 \U g4 \U g4 \U g4 \U fis2 \U g2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \U g4 ( \U a4 ) \U b2. ( \U a4 ) \U
  g2 \U fis2 g1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Heer ik roep tot U ver -- hoor "mij," ver -- hoor mij o "Heer," Heer ik roep
  tot U ver -- hoor __ \skip1 "mij," sla acht op de stem van mijn sme -- "king,"
  wan -- neer ik tot U "roep:" ver __ \skip1 hoor __ \skip1 mij o "Heer!" Laat
  mijn ge -- bed als wie -- rook op -- stij -- gen voor Uw aan -- ge -- "zicht,"
  de op -- hef -- fing van mijn han __ \skip1 den zij een a -- vond -- of --
  "fer:" ver __ \skip1 hoor __ \skip1 mij o "Heer!"
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 10/4 \key g \major \D e4
  \D e4 \D e4 \D e4 \D e4 \D e4 \D dis2 \D e2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D fis4 \D fis2 \D e4 \D e4 \D fis2
  | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D fis2 ( \D e4 ) \D dis2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D e4
  \D e4 \bar ""
  \once \omit Staff.TimeSignature \time 4/4 \D dis2 \D e2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \D fis4 \D fis4 \D fis4 \D fis2 \D e2
  \D dis2 | % 5
  \once \omit Staff.TimeSignature \time 14/4 \D e4 ( \D fis4 ) \D g2. ( \D fis4
  ) \D e2 \D dis2 e1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D dis2
  \D e2 | % 7
  \once \omit Staff.TimeSignature \time 3/4 \D fis4 \D fis4 \D fis4 \bar ""
  \once \omit Staff.TimeSignature \time 8/4 \D fis4 \D fis4 \D fis2 \D e2 \D fis2
  | % 8
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D fis2 ( \D e4 ) \D dis2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 8/4 \D e4 \D e4 \D e4 \D e4 \D dis2 \D e2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \D e4 ( \D fis4 ) \D g2. ( \D fis4
  ) \D e2 \D dis2 e1 \bar "|."
}

PartPTwoVoiceOne = \relative b {
  \clef "bass" \once \omit Staff.TimeSignature \time 10/4 \key g \major \U b4 \U
  b4 \U b4 \U b4 \U b4 \U b4 \U b2 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U d4 \U d2 \U d4 \U d4 \U d2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4
  \U d2 ( \U b4 ) \U b2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b4
  \U b4 \bar ""
  \once \omit Staff.TimeSignature \time 4/4 \U b2 \U b2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \U d4 \U d4 \U d4 \U d2 \U b2 \U b2
  | % 5
  \once \omit Staff.TimeSignature \time 14/4 \U b4 ( \U d4 ) \U d2. ( \U c4 ) \U
  b2 \U b2 b1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b2
  \U b2 | % 7
  \once \omit Staff.TimeSignature \time 3/4 \U d4 \U d4 \U d4 \bar ""
  \once \omit Staff.TimeSignature \time 8/4 \U d4 \U d4 \U d2 \U d2 \U d2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4
  \U d2 ( \U b4 ) \U b2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 8/4 \U b4 \U b4 \U b4 \U b4 \U b2 \U b2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \U b4 ( \U d4 ) \U d2. ( \U c4 ) \U
  b2 \U b2 b1 \bar "|."
}

PartPTwoVoiceTwo = \relative e {
  \clef "bass" \once \omit Staff.TimeSignature \time 10/4 \key g \major \D e4 \D
  e4 \D e4 \D e4 \D e4 \D e4 \D b2 \D e2 | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D d4 \D d2 \D d4 \D d4 \D d2 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D d2 ( \D e4 ) \D b2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D e4
  \D e4 \bar ""
  \once \omit Staff.TimeSignature \time 4/4 \D b2 \D e2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \D d4 \D d4 \D d4 \D d2 \D e2 \D b2
  | % 5
  \once \omit Staff.TimeSignature \time 14/4 \D e4 ( \D d4 ) \D g2. ( \D a4 ) \D
  b2 \D b,2 e1 \bar "||" % 6
  \once \omit Staff.TimeSignature \time 9/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D b2
  \D e2 | % 7
  \once \omit Staff.TimeSignature \time 3/4 \D d4 \D d4 \D d4 \bar ""
  \once \omit Staff.TimeSignature \time 8/4 \D d4 \D d4 \D d2 \D d2 \D d2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D d2 ( \D e4 ) \D b2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 8/4 \D e4 \D e4 \D e4 \D e4 \D b2 \D e2
  | % 10
  \once \omit Staff.TimeSignature \time 14/4 \D e4 ( \D d4 ) \D g2. ( \D a4 ) \D
  b2 \D b,2 e1 \bar "|."
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

