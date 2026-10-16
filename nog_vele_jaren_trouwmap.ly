\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from nog_vele_jaren_trouwmap.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Nog vele jaren"
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
PartPOneVoiceOne = \relative c'' {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major \U c4 \U c8 [ \U
  c8 ] \U c4 \U b4 | % 1
  \U a4 \U a8 [ \U a8 ] \U a4 \U gis4 | % 2
  \U a8 [ \U gis8 \U a8 \U b8 ] \U c8 [ \U b8 \U c8 \U d8 ] | % 3
  \U c4 \U b4 \U c4 \U d4 | % 4
  c1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Nog ve -- le ja -- "ren," nog ve -- le ja -- "ren," nog __ \skip1 \skip1
  \skip1 \skip1 \skip1 ve -- le ja __ \skip1 \skip1 \skip1 "ren!"
}

PartPOneVoiceTwo = \relative g' {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major \D g4 \D g8 [ \D
  g8 ] \D g4 \D g4 | % 1
  \D e4 \D e8 [ \D e8 ] \D e4 \D e4 | % 2
  \D c4 \D f4 \D gis4 \D gis8 [ \D gis8 ] | % 3
  g1 | % 4
  g1 \bar "|."
}

PartPTwoVoiceOne = \relative e' {
  \clef "bass" \numericTimeSignature \time 4/4 \key c \major \U e4 \U e8 [ \U e8
  ] \U e4 \U d4 | % 1
  \U c4 \U c8 [ \U c8 ] \U c4 \U b4 | % 2
  \U a8 [ \U b8 \U c8 \U d8 ] \U e8 [ \U d8 \U e8 \U f8 ] | % 3
  \U e4 \U d4 \U e4 \U f4 | % 4
  e1 \bar "|."
}

PartPTwoVoiceTwo = \relative c' {
  \clef "bass" \numericTimeSignature \time 4/4 \key c \major \D c4 \D c,8 [ \D e8
  ] \D g4 \D g4 | % 1
  \D g4 \D a,8 [ \D c8 ] \D e4 \D e4 | % 2
  \D f2 ( \D e8 [ \D g8 ) \D e8 \D c8 ] | % 3
  g'1 | % 4
  c,1 \bar "|."
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

