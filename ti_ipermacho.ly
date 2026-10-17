\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from ti_ipermacho.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Τῇ ὑπερμάχῳ"
  subtitle = "vrouwentrio"
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-18"
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
PartPOneVoiceOne = \relative f' {
  \repeat volta 2 {
    \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key f \major \U f2
    \U f4 \U f4 \U a2 \U g2 \U g8 [ \U a8 ] \D bes4 \U a8 [ \U g8 ] \U f4 \U g4
    \U a4 \D bes4 ( \D c4 ) \U bes8 [ \U a8 \U g8 \U bes8 ] \U a2 ^\fermata }
  | \break % 1
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \D bes4 \D c4 \D c4 \D c4 \D
  d4 \D c2 \U g8 [ \U a8 ] \D bes4 \U a8 [ \U g8 ] \U f4 \U g4 ( \U a8 [ \U g8 )
  ] \U f2 | \break % 2
  \once \omit Staff.TimeSignature \time 18/4 \U f4 \U f4 \U g2 \U g2 \U g8 [ \U
  a8 ] \D bes4 \U a8 [ \U g8 ] \U f4 \U g4 \U a4 \D bes4 ( \D c4 ) \U bes8 [ \U
  a8 \U g8 \U bes8 ] \U a2 | \break % 3
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \D bes4 \D c4 \D c4 \D c4 \D
  d4 \D c4 \U g4 \U a4 \D bes4 \U a2 \U g2 \U f2 ^\fermata | \break % 4
  \once \omit Staff.TimeSignature \time 20/4 \D c'4 \D c4 \D f2 \D e4 ( \D d4 )
  \D c2 \D es4 \D d4 \D c4 ( \D bes4 ) \U a4 \U g4 \D bes4 ( \U a4 ) \U g4 ( \U
  a8 [ \U g8 ) ] \U f2 ^\fermata \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Ti i -- per -- \markup \stressed ma -- cho stra __ \skip1 ti -- \markup
  \stressed go __ \skip1 ta ni -- ki -- \markup \stressed ti __ \skip1 ri __
  \skip1 \skip1 \skip1 "a," a -- na -- \markup \stressed gra -- fo si i \markup
  \stressed Po -- lis __ \skip1 sou The __ \skip1 o -- \markup \stressed to __
  \skip1 \skip1 "kè." "All’" os \markup \stressed e -- chou -- sa __ \skip1 to
  \markup \stressed kra __ \skip1 tos a -- pros -- \markup \stressed ma __
  \skip1 chi __ \skip1 \skip1 \skip1 "ton," ek pan -- \markup \stressed di --
  on "mè" kin -- \markup \stressed di -- non e -- lef -- \markup \stressed the
  -- ro -- "son," \markup \stressed i -- na \markup \stressed kra -- zo __
  \skip1 "si:" \markup \stressed "Chè" -- "rè," \markup \stressed Nim __
  \skip1 fi a -- \markup \stressed nim __ \skip1 fef __ \skip1 \skip1 "tè."
}

PartPOneVoiceOneLyricsTwo = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Os li -- tro -- \markup \stressed thi -- sa ton __ \skip1 di -- \markup
  \stressed non __ \skip1 ef -- cha -- ri -- \markup \stressed sti __ \skip1
  ri __ \skip1 \skip1 \skip1 "a," \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
}

PartPTwoVoiceOne = \relative f' {
  \repeat volta 2 {
    \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key f \major \U f2
    \U f4 \U f4 \U e2 \U e2 \U e8 [ \U f8 ] \U g4 \U f8 [ \U e8 ] \U f4 \U e4 \U
    f4 \U g4 ( \U a4 ) \U g8 [ \U f8 \U e8 \U g8 ] \U f2 }
  | % 1
  \once \omit Staff.TimeSignature \time 16/4 \U f4 \U g4 \U a4 \U a4 \U a4 \U
  bes4 \U a2 \U e8 [ \U f8 ] \U g4 \U f8 [ \U e8 ] \U f4 \U e4 ( \U f8 [ \U e8 )
  ] \U f2 | % 2
  \once \omit Staff.TimeSignature \time 18/4 \U f4 \U e4 \U e2 \U e2 \U e8 [ \U
  f8 ] \U g4 \U f8 [ \U e8 ] \U f4 \U e4 \U f4 \U g4 ( \U a4 ) \U g8 [ \U f8 \U
  e8 \U g8 ] \U f2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U f4 \U g4 \U a4 \U a4 \U a4 \U
  bes4 \U a4 \U e4 \U f4 \U g4 \U f2 \U e2 \U f2 | % 4
  \once \omit Staff.TimeSignature \time 20/4 \U a4 \U a4 \U c2 \U c4 ( \U bes4 )
  \U a2 \U c4 \U bes4 \U a4 ( \U g4 ) \U f4 \U e4 \U g4 ( \U f4 ) \U e4 ( \U f8
  [ \U e8 ) ] \U f2 \bar "|."
}

PartPTwoVoiceTwo = \relative f' {
  \repeat volta 2 {
    \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key f \major \D f2
    \D e4 \D d4 \D c2 \D c2 \D c4 \D c4 \D c4 \D c4 \D c4 \D c4 \D c2 \D c2 \D c2
  }
  | % 1
  \once \omit Staff.TimeSignature \time 16/4 \D c4 \D c4 \D f4 \D f4 \D f4 \D f4
  \D f2 \D c4 \D c4 \D c4 \D c4 \D c2 \D c2 | % 2
  \once \omit Staff.TimeSignature \time 18/4 \D c4 \D c4 \D c2 \D c2 \D c4 \D c4
  \D c4 \D c4 \D c4 \D c4 \D c2 \D c2 \D c2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D c4 \D c4 \D f4 \D f4 \D f4 \D f4
  \D f4 \D c4 \D c4 \D c4 \D c2 \D c2 \D c2 | % 4
  \once \omit Staff.TimeSignature \time 20/4 \D f4 \D f4 \D f2 \D f2 \D f2 \D f4
  \D f4 \D f2 \D f4 \D c4 \D c2 \D c4 \D c4 \D c2 \bar "|."
}


% The score definition
\score {
  <<
    \new StaffGroup <<
      \new Staff = "P1" <<
        \set Staff.instrumentName = "Soprano"
        \context Staff <<
          \override Staff.BarLine.allow-span-bar = ##f
          \mergeDifferentlyDottedOn
          \mergeDifferentlyHeadedOn
          \context Voice = "PartPOneVoiceOne" {
            \PartPOneVoiceOne
          }
          \new Lyrics \lyricsto "PartPOneVoiceOne" {
            \set stanza = "1." \PartPOneVoiceOneLyricsOne
          }
          \new Lyrics \lyricsto "PartPOneVoiceOne" {
            \set stanza = "2." \PartPOneVoiceOneLyricsTwo
          }
        >>
      >>
      \new Staff = "P2" <<
        \set Staff.instrumentName = "Alto, Tenor"
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

