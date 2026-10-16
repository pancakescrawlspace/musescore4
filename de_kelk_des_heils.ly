\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from de_kelk_des_heils.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "De kelk des heils"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 26/4 \key f \major \U a4
  \U a2. \U a4 \U bes2 \U a2. \U g4 \U f4 \U g4 \U a2 \U bes2 \U a4 \U a4 g1 \U
  a2 \oneVoice r4 | % 1
  \once \omit Staff.TimeSignature \time 27/4 \voiceOne \U g4 \U g2. \U g4 \U a2
  g1 g1 \U g2 \U g4 \U g4 g1 \U g2. r4 | % 2
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \U a2 \U a4 \U bes2 \U a4 \U
  a4 g1 \U a2. r4 | % 3
  \once \omit Staff.TimeSignature \time 10/4 \U a4 \U a4 \U a4 \U a4 \U g4 \U a4
  \U bes2 \U bes2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \U a4 \U a4 \U bes4 \U bes4 \U a4
  \U a4 g1 \U a2. r4 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  De kelk des heils __ \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 wil ik ne --
  men de kelk des heils __ \skip1 \skip1 \skip1 wil ik ne -- men de kelk des
  heils wil ik ne -- men aan -- roe -- pen de Naam des He -- ren aan -- roe --
  pen de Naam des He -- "ren!"
}

PartPOneVoiceTwo = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 26/4 \key f \major \D f4
  \D f2. \D f4 \D f2 \D f2. \D e4 \D f4 \D e4 \D f2 \D e2 \D f4 \D f4 e1 \D f2
  s4 | % 1
  \once \omit Staff.TimeSignature \time 27/4 \D e4 \D e2. \D e4 \D f2 \D g2. \D
  f4 \D e4 \D f4 \D g4 \D e4 \D f2 \D e4 \D e4 f1 \D e2. r4 | % 2
  \once \omit Staff.TimeSignature \time 16/4 \D f4 \D f2 \D f4 \D g2 \D f4 \D f4
  e1 \D f2. r4 | % 3
  \once \omit Staff.TimeSignature \time 10/4 \D fis4 \D fis4 \D fis4 \D fis4 \D
  d4 \D f4 \D f2 \D f2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \D f4 \D f4 \D e4 \D e4 \D f4 \D f4
  e1 \D f2. r4 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 26/4 \key f \major \U c4 \U
  c2. \U c4 \U d2 \U c2. \U bes4 \U a4 \U c4 \U c2 \U c2 \U c4 \U c4 c1 \U c2 r4
  | % 1
  \once \omit Staff.TimeSignature \time 27/4 \U c4 \U c2. \U c4 \U c2 \U c2. \U
  b4 \U c4 \U b4 \U c2 \U b2 \U c4 \U c4 b1 \U c2. r4 | % 2
  \once \omit Staff.TimeSignature \time 16/4 \U c4 \U c2 \U c4 \U c2 \U c4 \U c4
  c1 \U c2. r4 | % 3
  \once \omit Staff.TimeSignature \time 10/4 \U d4 \U d4 \U d4 \U d4 \U bes4 \U
  c4 \U d2 \U d2 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4
  c1 \U c2. r4 \bar "|."
}

PartPTwoVoiceTwo = \relative f {
  \clef "bass" \once \omit Staff.TimeSignature \time 26/4 \key f \major \D f4 \D
  f2. \D f4 \D bes,2 \D f'2. \D c4 \D d4 \D c4 \D <f, f'>2 \D <g g'>2 \D <f f'>4
  \D <a f'>4 c1 \D <f, f'>2 r4 | % 1
  \once \omit Staff.TimeSignature \time 27/4 \D c'4 \D c2. \D c4 \D f2 \D e2. \D
  d4 \D c4 \D d4 \D e4 \D c4 \D d2 \D c4 \D e4 g1 \D c,2. r4 | % 2
  \once \omit Staff.TimeSignature \time 16/4 \D <f, f'>4 \D <f f'>2 \D <f f'>4
  \D <e e'>2 \D <f f'>4 \D <a f'>4 c1 \D <f, f'>2. r4 | % 3
  \once \omit Staff.TimeSignature \time 10/4 \D d'4 \D d4 \D d4 \D d4 \D g4 \D f4
  \D bes,2 \D bes4 \D d4 | % 4
  \once \omit Staff.TimeSignature \time 14/4 \D f4 \D f4 \D g4 \D g4 \D f4 \D f4
  c1 \D <f, f'>2. r4 \bar "|."
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

