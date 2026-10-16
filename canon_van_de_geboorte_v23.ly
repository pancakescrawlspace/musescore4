\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from canon_van_de_geboorte_v23.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Canon van de Geboorte van de Moeder Gods"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key g \major \U g4
  \U g2 \U g4 \U fis4 \U g4 \U fis4 \U e2 \U e4 \U g4 \U a4 \U a4 \U a4 \U g2 \U
  fis4 \U fis4 \U g2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \U a4 \U a2 \U a4 \U a4 \U a4
  \U a4 \U a4 \U a4 \U g4 \U a4 \U b2 \U g2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \U g2 \U g4 \U g4 \U fis4 \U g4 \U
  fis4 \U e2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U fis4 \U fis4 \U g4 \U g4 \U g4
  \U g4 \U g4 \U g4 \U a2 \U g2 fis1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Mijn mond zal ik o -- pe -- nen en ver -- vuld van de Hei -- li -- ge Geest
  wil ik U de ko -- nin -- klij -- ke Moe -- der be -- zin -- gen feest -- vie
  -- ren vol blijd __ \skip1 schap en ver -- heugd Uw ge -- boor -- te be -- zin
  __ \skip1 gen
}

PartPOneVoiceTwo = \relative d' {
  \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key g \major \D d4
  \D d2 \D d4 \D d4 \D d4 \D d4 \D e2 \D e4 \D e4 \D fis4 \D fis4 \D fis4 \D d2
  \D d4 \D d4 \D d2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \D fis4 \D fis4 \D fis2 \D fis4 \D
  fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D g4 \D g4 \D g2 \D d2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \D d2 \D d4 \D d4 \D d4 \D d2 \D e2
  | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4
  \D d4 \D d4 d1 d1 \bar "|."
}

PartPTwoVoiceOne = \relative b {
  \clef "bass" \once \omit Staff.TimeSignature \time 20/4 \key g \major \U b4 \U
  b2 \U b4 \U a4 \U b4 \U a4 \U g2 \U g4 \U b4 \U c4 \U c4 \U c4 \U b2 \U a4 \U
  a4 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \U c4 \U c4 \U c2 \U c4 \U c4 \U c4
  \U c4 \U c4 \U c4 \U b4 \U c4 \U d2 \U b2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \U b2 \U b4 \U b4 \U a4 \U b4 \U a4
  \U g2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \U a4 \U b4 \U b4 \U b4 \U b4
  \U b4 \U b4 \U c2 \U b2 a1 \bar "|."
}

PartPTwoVoiceTwo = \relative g {
  \clef "bass" \once \omit Staff.TimeSignature \time 20/4 \key g \major \D g4 \D
  g2 \D g4 \D d4 \D g4 \D d4 \D e2 \D e4 \D e4 \D d4 \D d4 \D d4 \D g2 \D d4 \D
  d4 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \D d4 \D d4 \D d2 \D d4 \D d4 \D d4
  \D d4 \D d4 \D d4 \D g4 \D g4 \D g2 \D g2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \D g2 \D g4 \D g4 \D d4 \D g4 \D d4
  \D e2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D d4 \D d4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D fis2 \D g2 d1 \bar "|."
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

