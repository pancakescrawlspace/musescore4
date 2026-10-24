\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/eliczy_znamennyj.musicxml
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
  title = "Елицы"
  composer = "Знаменный распев"
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
PartPOneVoiceOne = \relative a' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/2 \key f \major \U a2
  ( ^\markup \italic "исон" \oneVoice \U bes2 ) c1 \U bes2 \U a2 \U a2 \U bes4 (
  \U c4 ) \U bes4 ( \U a4 ) \U g2 \U a4 ( \U bes4 ) c1 | % 1
  \once \omit Staff.TimeSignature \time 3/2 \U bes4 ( \U a4 ) \U bes4 ( \U c4 )
  \voiceOne \U d2 | \break % 2
  \once \omit Staff.TimeSignature \time 3/1 \oneVoice \U d2 \U c4 ( \U bes4 )
  \voiceOne \U c2 \U bes2 a1 | % 3
  \once \omit Staff.TimeSignature \time 4/1 \U a2 \oneVoice \U bes2 c1 bes1
  \voiceOne a1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Е" __ \skip1 "ли" -- "цы" "во" "Хри" -- "ста" __ \skip1 "кре" __ \skip1 "сти"
  -- "сте" __ \skip1 "ся," "во" __ \skip1 "Хри" __ \skip1 "ста" "об" -- "ле" __
  \skip1 "ко" -- "сте" -- "ся." "Ал" -- "ли" -- "лу" -- "и" -- "я."
}

PartPOneVoiceTwo = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 13/2 \key f \major \D f2
  \hideNote r1 \hideNote r1 \hideNote r1 \hideNote r1 \hideNote r1 \hideNote r1
  | % 1
  \once \omit Staff.TimeSignature \time 3/2 \hideNote r1 \D g2 | % 2
  \once \omit Staff.TimeSignature \time 3/1 \hideNote r1 \D <f a>2 \D g2 f1 | % 3
  \once \omit Staff.TimeSignature \time 4/1 \D f2 \hideNote r1 \hideNote r1
  \hideNote r2 f1 \bar "|."
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

