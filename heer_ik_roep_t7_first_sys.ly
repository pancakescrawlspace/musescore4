\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_t7_first_sys.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Heer ik roep"
  subtitle = "toon 7"
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
PartPOneVoiceOne = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/4 \key f \major \U g2.
  ^\markup "Toon 7" \U g4 \U g4 \U g4 \U f4 \U g4 \U a2 ( \U f4 ) \U g2 | % 1
  \once \omit Staff.TimeSignature \time 9/4 \U a4 \U bes2 \U a4 \U g4 \U f2 ( \U
  e2 ) \bar "|."
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/4 \key f \major \D e2.
  \D e4 \D e4 \D e4 \D d4 \D e4 \D f2 ( \D d4 ) \D e2 | % 1
  \once \omit Staff.TimeSignature \time 9/4 \D f4 \D g2 \D f4 \D e4 \D d2 ( \D c2
  ) \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 13/4 \key f \major \U c2.
  \U c4 \U c4 \U c4 \U c4 \U c4 \U c2. \U c2 | % 1
  \once \omit Staff.TimeSignature \time 9/4 \U c4 \U c2 \U c4 \U c4 \U b2 ( \U g2
  ) \bar "|."
}

PartPTwoVoiceTwo = \relative c {
  \clef "bass" \once \omit Staff.TimeSignature \time 13/4 \key f \major \D c2.
  \D c4 \D c4 \D c4 \D c4 \D c4 \D f2. \D c2 | % 1
  \once \omit Staff.TimeSignature \time 9/4 \D f4 \D e2 \D f4 \D c4 \D g'2 ( \D
  c,2 ) \bar "|."
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

