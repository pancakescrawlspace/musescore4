\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/krestu_tvoemu_valaamskij.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
hideNote =
  \tweak Dots.transparent ##t
  \tweak NoteHead.transparent ##t
  \tweak NoteHead.no-ledgers ##t
  \tweak Stem.transparent ##t
  \tweak Accidental.transparent ##t
  \tweak Rest.transparent ##t
  \tweak TabNoteHead.transparent ##t \etc

D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Кресту Твоему"
  composer = "Валаамский напев"
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-24"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 13/2 \key f \major \U g4
  ( ^\markup \italic "исон" \oneVoice \U a4 ) bes1 \voiceOne \U a2 \oneVoice \U
  bes4 ( \U a4 ) \voiceOne g1 \U a2 \oneVoice \U bes2 \U c2 ( \U d2 ) \U c2 \U c2
  | \break % 1
  \once \omit Staff.TimeSignature \time 7/2 \U a2 bes1 ( a1 ) \voiceOne \U g2 (
  \oneVoice \U a2 ) | % 2
  \once \omit Staff.TimeSignature \time 6/1 bes1 \U bes2 \voiceOne a1 g1 \U f2
  \U g2 \U a2. \oneVoice \U bes4 \U a2 | \break % 3
  \once \omit Staff.TimeSignature \time 9/2 \U g2 \U f4 ( \U g4 \U a2 ) g1 ( f1
  ) \voiceOne g1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Крес" __ \skip1 "ту" "Тво" -- "е" __ \skip1 "му" "по" -- "кла" -- "ня" __
  \skip1 "ем" -- "ся," "Вла" -- "ды" __ \skip1 "ко," __ \skip1 "и" "свя" -- "то"
  -- "е" "Вос" -- "кре" -- "се" -- "ни" -- "е" "Тво" -- "е" __ \skip1 \skip1
  "сла" __ \skip1 "вим."
}

PartPOneVoiceTwo = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/2 \key f \major \D g4
  \hideNote r1 \hideNote r4 \D f2 \hideNote r2 g1 \D f2 \hideNote r1 \hideNote r1
  \hideNote r2 | % 1
  \once \omit Staff.TimeSignature \time 7/2 \hideNote r1 \hideNote r1 \hideNote
  r2 \D g2 \hideNote r2 | % 2
  \once \omit Staff.TimeSignature \time 6/1 \hideNote r1 \hideNote r2 f1 g1 \D f2
  \D e2 \D d2. \hideNote r2 \hideNote r4 | % 3
  \once \omit Staff.TimeSignature \time 9/2 \hideNote r1 \hideNote r1 \hideNote
  r1 \hideNote r2 c1 \bar "|."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
      \set Staff.instrumentName = "Voice"
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
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

