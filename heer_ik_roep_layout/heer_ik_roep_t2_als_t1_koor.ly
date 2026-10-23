\version "2.26.0"
koorPt = 16
\include "church_style_koor.ily"
\paper { page-count = 1 }

% automatically converted by musicxml2ly from heer_ik_roep_layout/heer_ik_roep_t2_als_t1.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subsubtitle = "toon 2"
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
PartPOneVoiceOne = \relative bes' {
  \clef "treble" \once \omit Staff.TimeSignature \time 14/4 \key f \major \U bes2
  ( \U c2 ) \U bes4 \U bes4 \U bes4 \U bes4 \U a4 \U bes4 ( \U c4 ) \U c4 ( \U
  bes2 ) | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \U a2 \U bes4 \U bes4 \U bes2
  | \break % 2
  \once \omit Staff.TimeSignature \time 12/4 \U d2. \U c4 \U bes4 \U bes4 \U bes4
  \U bes4 \U bes2 \U a2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4
  \U a4 \bar "" \break \set Score.currentBarNumber = #4
  \once \omit Staff.TimeSignature \time 5/4 \U a2 ( \U bes4 ) \U bes2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \U c4 \U d2 \U c4 \U bes4 \U bes2 \U
  a2 | % 5
  \once \omit Staff.TimeSignature \time 18/4 \U c4 ( \U d4 ) \U c2 \U bes4 \U
  bes4 a1 ( \U bes2 \U a2 g1 ) \bar "||" \break % 6
  \once \omit Staff.TimeSignature \time 13/4 \U bes2 ( \U c2 ) \U bes4 \U bes4
  \U bes4 \U a4 \U bes4 ( \U c4 ) \U c4 ( \U bes2 ) | % 7
  \once \omit Staff.TimeSignature \time 3/4 \U a4 \U a4 \U a4 \bar "" \break \set Score.currentBarNumber = #8
  \once \omit Staff.TimeSignature \time 7/4 \U a4 \U a4 \U a2 \U bes4 \U bes2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U d2 \U c4 \U bes4 \U bes4
  \U bes4 \U bes2 \U a2 | \break % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \U a4 \U a4 \U a4 \U a4 \U a2 ( \U
  bes4 ) \U bes2 | % 10
  \once \omit Staff.TimeSignature \time 18/4 \U c4 ( \U d4 ) \U c2 \U bes4 \U
  bes4 a1 ( \U bes2 \U a2 g1 ) \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Heer __ \skip1 ik roep tot U ver -- hoor __ \skip1 mij __ \skip1 ver -- hoor
  mij o "Heer," Heer ik roep tot U ver -- hoor "mij," sla acht op de stem van
  mijn sme __ \skip1 "king," wan -- neer ik tot U "roep:" ver __ \skip1 hoor mij
  o Heer __ \skip1 \skip1 \skip1 Laat __ \skip1 mijn ge -- bed als wie __ \skip1
  rook __ \skip1 op -- stij -- gen voor Uw aan -- ge -- "zicht," de op -- hef --
  fing van mijn han -- den zij een a -- vond -- of __ \skip1 "fer:" ver __
  \skip1 hoor mij o Heer __ \skip1 \skip1 \skip1
}

PartPOneVoiceTwo = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 14/4 \key f \major \D g2
  ( \D a2 ) \D g4 \D g4 \D g4 \D g4 \D f4 \D g4 ( \D a4 ) \D a4 ( \D g2 ) | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f2 \D g4 \D g4 \D g2 | % 2
  \once \omit Staff.TimeSignature \time 12/4 \D bes2. \D a4 \D g4 \D g4 \D g4 \D
  g4 \D g2 \D f2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f4 \bar ""
  \once \omit Staff.TimeSignature \time 5/4 \D f2 ( \D g4 ) \D g2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \D a4 \D bes2 \D a4 \D g4 \D g2 \D f2
  | % 5
  \once \omit Staff.TimeSignature \time 18/4 \D a4 ( \D bes4 ) \D a2 \D g4 \D g4
  f1 ( \D g2 \D f2 e1 ) \bar "||" % 6
  \once \omit Staff.TimeSignature \time 13/4 \D g2 ( \D a2 ) \D g4 \D g4 \D g4
  \D f4 \D g4 ( \D a4 ) \D a4 ( \D g2 ) | % 7
  \once \omit Staff.TimeSignature \time 3/4 \D f4 \D f4 \D f4 \bar ""
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f4 \D f2 \D g4 \D g2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \D a4 \D bes2 \D a4 \D g4 \D g4 \D
  g4 \D g2 \D f2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \D f4 \D f4 \D f4 \D f4 \D f2 ( \D g4
  ) \D g2 | % 10
  \once \omit Staff.TimeSignature \time 18/4 \D a4 ( \D bes4 ) \D a2 \D g4 \D g4
  f1 ( \D g2 \D f2 e1 ) \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 14/4 \key f \major c1 \U c4
  \U c4 \U c4 \U c4 \U c4 \U c2 \U c2. | % 1
  \once \omit Staff.TimeSignature \time 7/4 \U c4 \U c2 \U c4 \U c4 \U c2 | % 2
  \once \omit Staff.TimeSignature \time 12/4 \U f2. \U c4 \U c4 \U c4 \U c4 \U c4
  \U c2 \U c2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4
  \U c4 \bar ""
  \once \omit Staff.TimeSignature \time 5/4 \U c2. \U c2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \U c4 \U f2 \U c4 \U c4 \U c2 \U c2
  | % 5
  \once \omit Staff.TimeSignature \time 18/4 \U f2 \U f2 \U e4 \U e4 c1 ( c1 c1
  ) \bar "||" % 6
  \once \omit Staff.TimeSignature \time 13/4 c1 \U c4 \U c4 \U c4 \U c4 \U c2 \U
  c2. | % 7
  \once \omit Staff.TimeSignature \time 3/4 \U c4 \U c4 \U c4 \bar ""
  \once \omit Staff.TimeSignature \time 7/4 \U c4 \U c4 \U c2 \U c4 \U c2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \U c4 \U f2 \U c4 \U c4 \U c4 \U c4
  \U c2 \U c2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \U c4 \U c4 \U c4 \U c4 \U c2 ( \U c4
  ) \U c2 | % 10
  \once \omit Staff.TimeSignature \time 18/4 \U f2 \U f2 \U e4 \U e4 c1 ( c1 c1
  ) \bar "|."
}

PartPTwoVoiceTwo = \relative c {
  \clef "bass" \once \omit Staff.TimeSignature \time 14/4 \key f \major \D c2 (
  \D f2 ) \D c4 \D c4 \D c4 \D c4 \D c4 \D c4 ( \D f4 ) \D f4 ( \D c2 ) | % 1
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f2 \D c4 \D c4 \D c2 | % 2
  \once \omit Staff.TimeSignature \time 12/4 \D bes2. \D c4 \D c4 \D c4 \D c4 \D
  c4 \D c2 \D f2 | % 3
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f4 \bar ""
  \once \omit Staff.TimeSignature \time 5/4 \D f2 ( \D c4 ) \D c2 | % 4
  \once \omit Staff.TimeSignature \time 9/4 \D f4 \D bes,2 \D c4 \D c4 \D c2 \D
  f2 | % 5
  \once \omit Staff.TimeSignature \time 18/4 \D f2 \D f2 \D c4 \D c4 f1 ( \D e2
  \D f2 c1 ) \bar "||" % 6
  \once \omit Staff.TimeSignature \time 13/4 \D c2 ( \D f2 ) \D c4 \D c4 \D c4
  \D c4 \D c4 ( \D f4 ) \D f4 ( \D c2 ) | % 7
  \once \omit Staff.TimeSignature \time 3/4 \D f4 \D f4 \D f4 \bar ""
  \once \omit Staff.TimeSignature \time 7/4 \D f4 \D f4 \D f2 \D c4 \D c2 | % 8
  \once \omit Staff.TimeSignature \time 11/4 \D f4 \D bes,2 \D c4 \D c4 \D c4 \D
  c4 \D c2 \D f2 | % 9

  \barNumberCheck #10
  \once \omit Staff.TimeSignature \time 9/4 \D f4 \D f4 \D f4 \D f4 \D f2 ( \D c4
  ) \D c2 | % 10
  \once \omit Staff.TimeSignature \time 18/4 \D f2 \D f2 \D c4 \D c4 f1 ( \D e2
  \D f2 c1 ) \bar "|."
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

