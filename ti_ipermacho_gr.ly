\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from ti_ipermacho_gr.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Τῇ ὑπερμάχῳ"
  subtitle = "vrouwentrio"
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-17"
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
  "Τῇ" "ὑ" -- "περ" -- "μά" -- "χῳ" "στρα" __ \skip1 "τη" -- "γῷ" __ \skip1 "τὰ"
  "νι" -- "κη" -- "τή" __ \skip1 "ρι" __ \skip1 \skip1 \skip1 "α," "ἀ" -- "να"
  -- "γρά" -- "φω" "σοι" "ἡ" "Πό" -- "λις" __ \skip1 "σου" "Θε" __ \skip1 "ο" --
  "τό" __ \skip1 \skip1 "κε." "Ἀλλ’" "ὡς" "ἔ" -- "χου" -- "σα" __ \skip1 "τὸ"
  "κρά" __ \skip1 "τος" "ἀ" -- "προσ" -- "μά" __ \skip1 "χη" __ \skip1 \skip1
  \skip1 "τον," "ἐκ" "παν" -- "τοί" -- "ων" "με" "κιν" -- "δύ" -- "νων" "ἐ" --
  "λευ" -- "θέ" -- "ρω" -- "σον," "ἵ" -- "να" "κρά" -- "ζω" __ \skip1 "σοι·"
  "Χαῖ" -- "ρε," "Νύμ" __ \skip1 "φη" "ἀ" -- "νύμ" __ \skip1 "φευ" __ \skip1
  \skip1 "τε."
}

PartPOneVoiceOneLyricsTwo = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "ὡς" "λυ" -- "τρω" -- "θεῖ" -- "σα" "τῶν" __ \skip1 "δει" -- "νῶν" __ \skip1
  "εὐ" -- "χα" -- "ρι" -- "στή" __ \skip1 "ρι" __ \skip1 \skip1 \skip1 "α,"
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1
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

