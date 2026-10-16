\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from vriendelijk_licht.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Vriendelijk licht"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 51/8 \key f \major \U a2.
  \U g4 \U f2 \U f4 \U f4 \U e2 \U f4 \U g4 \U f2 \U f4 \U g4 \U a2 \U bes4 \U a4
  \U g2 ( \U a4 ) \U bes4 \U a4. | % 1
  \once \omit Staff.TimeSignature \time 26/4 \U a4 \U a4 \U a4 \U a2 \U a4 \U a4
  \U a2 \U a4 \U a4 \U a4 ( \U bes4 ) \U c4 \U bes4 \U a2 \U bes4 \U a4 \U g2 (
  \U f2 ) \U e2. | % 2
  \once \omit Staff.TimeSignature \time 28/4 \U e4 \U f2 \U f2 \U e4 ( \U f4 )
  \U g4 ( \U f4 ) \U e4 \U e4 \U f2. \U g4 \U a2 \U a2 \U bes4 ( \U a4 ) \U g2 (
  \U a4 ) \U bes4 \U a2. | % 3
  \once \omit Staff.TimeSignature \time 8/4 \U g4 \U a4 ( \U g4 ) \U a4 ( \U bes4
  ) \U c2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \U a2 \U a4 \U bes2 ( \U a4 ) \U a4
  \U g2 \U a4 \U bes4 a1 | % 5
  \once \omit Staff.TimeSignature \time 32/4 \U a4 \U g4 \U f2 \U f2 \U e4 \U f4
  \U g2 ( \U f4 ) \U e4 \U f4 ( \U g4 ) \U a4 \U bes4 \U c2 \U a4 \U a4 \U bes2
  \U a4 \U a4 \U g2 ( \U a4 \U bes4 ) a1 | % 6
  \once \omit Staff.TimeSignature \time 16/4 \U a2 \U g2 \U f2 \U e4 \U f4 \U g2
  ( \U f4 ) \U e4 \U f2 ( \U g2 ) | % 7
  \once \omit Staff.TimeSignature \time 18/4 \U a2 \U a2 \U bes4 ( \U c4 ) \U d2
  \U c4 \U bes4 \U a2 \U g2 f1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Je -- zus Chris -- tus Gij vreug -- de -- vol licht van de hei -- li -- ge
  heer __ \skip1 lijk -- heid van de on -- sterf -- lij -- "ke," he -- mel --
  "se," hei __ \skip1 li -- "ge," za -- li -- ge Va __ \skip1 der Ge -- ko --
  men bij __ \skip1 zons __ \skip1 on -- der -- gang en schou -- wend het __
  \skip1 a __ \skip1 vond -- licht be -- zin __ \skip1 gen wij "God:" Va --
  "der," Zoon __ \skip1 en hei -- li -- ge Geest Het is waar -- dig U te al __
  \skip1 len tij __ \skip1 de met hei -- li -- ge stem -- men te lo __ \skip1
  \skip1 ven Zoon van God die het le __ \skip1 ven schenkt __ \skip1 daar -- om
  ver __ \skip1 heer -- lijkt de we -- reld "U!"
}

PartPOneVoiceTwo = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 51/8 \key f \major \D f2.
  \D e4 \D d2 \D d4 \D d4 \D cis2 \D d4 \D e4 \D d2 \D d4 \D e4 \D f2 \D g4 \D f4
  \D e2 ( \D f4 ) \D g4 \D f4. | % 1
  \once \omit Staff.TimeSignature \time 26/4 \D f4 \D f4 \D f4 \D f2 \D f4 \D f4
  \D fis2 \D fis4 \D fis4 \D fis4 ( \D g4 ) \D a4 \D g4 \D fis2 \D g4 \D f4 \D e2
  ( \D d2 ) \D c2. | % 2
  \once \omit Staff.TimeSignature \time 28/4 \D cis4 \D d2 \D d2 \D cis4 \D d4
  \D e4 \D d4 \D cis4 \D cis4 \D d2. \D e4 \D f2 \D f2 \D g4 \D f4 \D e2 \D f4
  \D g4 \D f2. | % 3
  \once \omit Staff.TimeSignature \time 8/4 \D e4 \D f4 \D e4 \D f4 \D g4 \D a2.
  | % 4
  \once \omit Staff.TimeSignature \time 15/4 \D f2 \D f4 \D g2 ( \D f4 ) \D f4
  \D e2 \D f4 \D g4 f1 | % 5
  \once \omit Staff.TimeSignature \time 32/4 \D cis4 \D e4 \D d2 \D d2 \D cis4
  \D d4 \D e2 ( \D d4 ) \D cis4 \D d4 ( \D e4 ) \D f4 \D g4 \D a2 \D f4 \D f4 \D
  g2 \D f4 \D f4 \D e2 ( \D f4 \D g4 ) f1 | % 6
  \once \omit Staff.TimeSignature \time 16/4 \D cis2 \D e2 \D d2 \D c4 \D d4 \D
  e2 ( \D d4 ) \D c4 \D d2 ( \D e2 ) | % 7
  \once \omit Staff.TimeSignature \time 18/4 \D f2 \D fis2 \D g4 ( \D a4 ) \D
  bes2 \D a4 \D g4 \D f2 \D e2 c1 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 51/8 \key f \major \U c2.
  \U c4 \U a2 \U a4 \U a4 \U a2 \U a4 \U a4 \U a2 \U a4 \U c4 \U c2 \U c4 \U c4
  \U c2. \U c4 \U c4. | % 1
  \once \omit Staff.TimeSignature \time 26/4 \U c4 \U c4 \U c4 \U c2 \U c4 \U c4
  \U d2 \U d4 \U d4 \U d2 \U d4 \U d4 \U d2 \U c4 \U c4 \U c2 ( \U b2 ) \U g2. | % 2
  \once \omit Staff.TimeSignature \time 28/4 \U a4 \U a2 \U a2 \U a2 \U a4 \U a4
  \U a4 \U a4 \U a2. \U c4 \U c2 \U c2 \U c4 \U c4 \U c2. \U c4 \U c2. | % 3
  \once \omit Staff.TimeSignature \time 8/4 \U c4 \U c2 \U a4 \U c4 \U c2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \U c2 \U c4 \U c2 ( \U c4 ) \U c4
  \U c2 \U c4 \U c4 c1 | % 5
  \once \omit Staff.TimeSignature \time 32/4 \U a4 \U a4 \U a2 \U a2 \U a4 \U a4
  \U a2. \U a4 \U a4 \U c4 \U c4 \U c4 \U c2 \U c4 \U c4 \U c2 \U c4 \U c4 c1 c1
  | % 6
  \once \omit Staff.TimeSignature \time 16/4 \U a2 \U a2 \U a2 \U a4 \U a4 \U a2.
  \U a4 \U a2 ( \U c2 ) | % 7
  \once \omit Staff.TimeSignature \time 18/4 \U c2 \U d2 \U d2 \U d2 \U d4 \U d4
  \U c2 \U bes2 a1 \bar "|."
}

PartPTwoVoiceTwo = \relative f {
  \clef "bass" \once \omit Staff.TimeSignature \time 51/8 \key f \major \D f2.
  \D c4 \D d2 \D d4 \D d4 \D a2 \D a4 \D a4 \D d2 \D d4 \D c4 \D f2 \D e4 \D f4
  \D c2. \D c4 \D f4. | % 1
  \once \omit Staff.TimeSignature \time 26/4 \D f4 \D f4 \D f4 \D f2 \D f4 \D f4
  \D d2 \D d4 \D d4 \D d4 ( \D g4 ) \D fis4 \D g4 \D d2 \D e4 \D f4 \D g2 ( \D
  g,2 ) \D c2. | % 2
  \once \omit Staff.TimeSignature \time 28/4 \D a4 \D d2 \D d2 \D a2 \D cis4 (
  \D d4 ) \D a4 \D a4 \D d2. \D c4 \D f2 \D f2 \D e4 ( \D f4 ) \D c2. \D c4 \D f2.
  | % 3
  \once \omit Staff.TimeSignature \time 8/4 \D c4 \D f4 ( \D c4 ) \D a4 ( \D c4
  ) \D f2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \D f2 \D f4 \D e2 ( \D f4 ) \D f4
  \D c2 \D c4 \D c4 <f, f'>1 | % 5
  \once \omit Staff.TimeSignature \time 32/4 \D a4 \D a4 \D d2 \D d2 \D a4 \D a4
  \D a2. \D a4 \D d4 \D c4 \D f4 \D f4 \D f2 \D f4 \D f4 \D e2 \D f4 \D f4 c1
  <f, f'>1 | % 6
  \once \omit Staff.TimeSignature \time 16/4 \D a2 \D cis2 \D d2 \D a4 \D a4 \D
  a2. \D a4 \D d2 ( \D cis2 ) | % 7
  \once \omit Staff.TimeSignature \time 18/4 \D f2 \D d4 ( \D c4 ) \D bes4 ( \D
  a4 ) \D g2 \D a4 \D bes4 \D c2 \D c2 <f, f'>1 \bar "|."
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

