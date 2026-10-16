\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from onder_uwe_hoede.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Onder Uwe hoede"
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
    doubleRepeatBarType = ":|.|:"
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 15/4 \key g \major \U g4
  \U g4 \U fis4 \U g4 \U a2 ( \U b8 [ \U c8 ) ] \U b2 \U b4 \U a4 \U g2 \U fis2
  | % 1
  \once \omit Staff.TimeSignature \time 18/4 \U g4 \U a4 \U b2. \U b4 \U a2 \U g4
  \U g4 \U fis2. \U fis4 g1 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U g2 \U fis4 \U g4 \U a2 \U b8 ( [
  \U c8 ) ] b1 | % 3
  \once \omit Staff.TimeSignature \time 8/4 \U b2 \U a4 \U g4 \U fis2 \U g2 | % 4
  \once \omit Staff.TimeSignature \time 15/4 \U a2 \U a4 \U a4 \U b2 \U a4 \U g4
  \U fis2 \U fis4 \U fis4 \U g2. | % 5
  \once \omit Staff.TimeSignature \time 19/4 \U a4 \U b2 \U a4 \U c4 \U b4 ( \U
  a4 \U g4 ) \U b4 \U a4 \U g4 \U fis2. \U fis4 g1 \repeat volta 3 {
    | % 6
    \once \omit Staff.TimeSignature \time 18/4 \U g4 \U g4 \U g4 \U g4 \U g4 \U
    a4 \U b2 ( \U a2 ) \U g2 ( \U fis2 ) g1 \textEndMark "3×" }
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  On -- der U -- we hoe __ \skip1 \skip1 de en er -- bar -- men vluch -- ten wij
  al -- hei -- li -- ge Moe -- der Gods Zie on -- ze gro -- te __ \skip1 nood
  hoor on -- ze be -- de wees on -- ze red -- ding o wees ons be -- houd Gij e
  -- nig al -- rei __ \skip1 \skip1 ne en ge -- ze -- gen -- de Al -- hei -- li
  -- ge Moe -- der Gods __ \skip1 red __ \skip1 ons
}

PartPOneVoiceTwo = \relative e' {
  \clef "treble" \once \omit Staff.TimeSignature \time 15/4 \key g \major \D e4
  \D e4 \D dis4 \D e4 \D fis2 ( \D g8 [ \D a8 ) ] \D g2 \D g4 \D fis4 \D e2 \D
  dis!2 | % 1
  \once \omit Staff.TimeSignature \time 18/4 \D e4 \D fis4 \D g2. \D g4 \D fis2
  \D e4 \D e4 \D dis2. \D dis4 e1 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D e2 \D dis4 \D e4 \D fis2 \D g8 (
  [ \D a8 ) ] g1 | % 3
  \once \omit Staff.TimeSignature \time 8/4 \D g2 \D fis4 \D e4 \D dis2 \D e2 | % 4
  \once \omit Staff.TimeSignature \time 15/4 \D fis2 \D fis4 \D fis4 \D g2 \D
  fis4 \D e4 \D dis2 \D dis4 \D dis4 \D e2. | % 5
  \once \omit Staff.TimeSignature \time 19/4 \D fis4 \D g2 \D fis4 \D a4 \D g4 (
  \D fis4 \D e4 ) \D g4 \D fis4 \D e4 \D dis2. \D dis4 e1 \repeat volta 3 {
    | % 6
    \once \omit Staff.TimeSignature \time 18/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D
    fis4 \D g2 ( \D fis2 ) \D e2 ( \D dis2 ) e1 }
}

PartPTwoVoiceOne = \relative b {
  \clef "bass" \once \omit Staff.TimeSignature \time 15/4 \key g \major \U b4 \U
  b4 \U b4 \U b4 \U d2. \U d2 \U d4 \U d4 \U b2 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 18/4 \U b4 \U d4 \U d2. \U d4 \U d2 \U b4
  \U b4 \U b2. \U b4 b1 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \U b2 \U b4 \U b4 \U d2 \U d4 d1 | % 3
  \once \omit Staff.TimeSignature \time 8/4 \U d2 \U d4 \U b4 \U b2 \U b2 | % 4
  \once \omit Staff.TimeSignature \time 15/4 \U d2 \U d4 \U d4 \U d2 \U d4 \U b4
  \U b2 \U b4 \U b4 \U b2. | % 5
  \once \omit Staff.TimeSignature \time 19/4 \U d4 \U d2 \U d4 \U d4 \U d4 ( \U
  b2 ) \U b4 \U b4 \U b4 \U b2. \U b4 b1 \repeat volta 3 {
    | % 6
    \once \omit Staff.TimeSignature \time 18/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U
    d4 d1 b1 b1 }
}

PartPTwoVoiceTwo = \relative e {
  \clef "bass" \once \omit Staff.TimeSignature \time 15/4 \key g \major \D e4 \D
  e4 \D b4 \D e4 \D d2. \D g2 \D g4 \D d4 \D e2 \D b2 | % 1
  \once \omit Staff.TimeSignature \time 18/4 \D e4 \D d4 \D g2. \D g4 \D d2 \D e4
  \D e4 \D b2. \D b4 e1 | % 2
  \once \omit Staff.TimeSignature \time 11/4 \D e2 \D b4 \D e4 \D d2 \D d4 g1 | % 3
  \once \omit Staff.TimeSignature \time 8/4 \D g2 \D d4 \D e4 \D b2 \D e2 | % 4
  \once \omit Staff.TimeSignature \time 15/4 \D d2 \D d4 \D d4 \D g2 \D d4 \D e4
  \D b2 \D b4 \D b4 \D e2. | % 5
  \once \omit Staff.TimeSignature \time 19/4 \D d4 \D g2 \D d4 \D d4 \D d4 ( \D
  dis4 \D e4 ) \D e4 \D dis4 \D e4 \D b2. \D b4 e1 \repeat volta 3 {
    | % 6
    \once \omit Staff.TimeSignature \time 18/4 \D e4 \D e4 \D e4 \D e4 \D e4 \D
    d4 \D g2 ( \D d2 ) \D e2 ( \D b2 ) e1 }
}


% The score definition
\score {
  <<
    \new StaffGroup <<
      \new Staff = "P1" <<
        \set Staff.instrumentName = "Women"
        \set Staff.shortInstrumentName = "W."
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
        \set Staff.shortInstrumentName = "M."
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

