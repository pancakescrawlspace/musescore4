\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from zegen_mijn_ziel_de_heer.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Zegen, mijn ziel, de Heer"
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
PartPOneVoiceOne = \relative fis' {
  \clef "treble" \once \omit Staff.TimeSignature \time 33/8 \key d \major \U fis4
  \U fis4 \U g4 \U a4 \U b8 [ \U a8 ] \U g4 \U fis8 [ \U g8 ] \U a4. \U b8 \U c4
  \U b4 \U a4 \U g8 [ \U fis8 ] \U g4 \U g4 \U fis4. | % 1
  \once \omit Staff.TimeSignature \time 4/4 \oneVoice R1 | % 2
  R1 | % 3
  R1 | % 4
  R1 | % 5
  R1 | % 6
  R1 | % 7
  R1 | % 8
  R1 | % 9

  \barNumberCheck #10
  R1 | % 10
  R1 | % 11
  R1 | % 12
  R1 | % 13
  R1 | % 14
  R1 | % 15
  R1 | % 16
  R1 | % 17
  R1 | % 18
  R1 | % 19

  \barNumberCheck #20
  R1 | % 20
  R1 | % 21
  R1 | % 22
  R1 | % 23
  R1 | % 24
  R1 | % 25
  R1 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29

  \barNumberCheck #30
  R1 | % 30
  R1 | % 31
  R1 \bar "|."
}

PartPOneVoiceTwo = \relative d' {
  \clef "treble" \once \omit Staff.TimeSignature \time 33/8 \key d \major \D d4
  \D d4 \D e4 \D fis4 \D g8 [ \D fis8 ] \D e4 \D d8 [ \D e8 ] \D fis4. \D g8 \D
  a4 \D g4 \D fis4 \D e8 [ \D d8 ] \D e4 \D e4 \D d4. | % 1
  \once \omit Staff.TimeSignature \time 4/4 s1*31 \bar "|."
}

PartPTwoVoiceOne = \relative c' {
  \clef "bass" \once \omit Staff.TimeSignature \time 33/8 \key d \major R8*33 | % 1
  \once \omit Staff.TimeSignature \time 4/4 R1 | % 2
  R1 | % 3
  R1 | % 4
  R1 | % 5
  R1 | % 6
  R1 | % 7
  R1 | % 8
  R1 | % 9

  \barNumberCheck #10
  R1 | % 10
  R1 | % 11
  R1 | % 12
  R1 | % 13
  R1 | % 14
  R1 | % 15
  R1 | % 16
  R1 | % 17
  R1 | % 18
  R1 | % 19

  \barNumberCheck #20
  R1 | % 20
  R1 | % 21
  R1 | % 22
  R1 | % 23
  R1 | % 24
  R1 | % 25
  R1 | % 26
  R1 | % 27
  R1 | % 28
  R1 | % 29

  \barNumberCheck #30
  R1 | % 30
  R1 | % 31
  R1 \bar "|."
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
            \PartPTwoVoiceOne
          }
        >>
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

