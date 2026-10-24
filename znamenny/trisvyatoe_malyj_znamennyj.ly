\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from znamenny/trisvyatoe_malyj_znamennyj.musicxml
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
  title = "Трисвятое"
  composer = "Малый знаменный распев"
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
PartPOneVoiceOne = \relative f' {
  \clef "treble" \once \omit Staff.TimeSignature \time 3/2 \key f \major \U f2
  ^\markup \italic "исон" g1 \bar "||" % 1
  \once \omit Staff.TimeSignature \time 5/1 \U f2 \oneVoice \U g4 ( \U a4 ) \U a2
  \U g2 \U f2 \U g4 ( \U a4 ) \U a2 \U g2 \U f2 \U g4 ( \U a4 ) | \break % 2
  \once \omit Staff.TimeSignature \time 6/1 \U a2 g1 \U f2 \U g2 a1 \U a2
  \voiceOne g1 \hideNote r1 _\markup \fontsize #-1.705 "(последний раз)" \bar
  "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "А" -- "минь." "Свя" -- "тый" __ \skip1 "Бо" -- "же," "Свя" -- "тый" __ \skip1
  "Креп" -- "кий," "Свя" -- "тый" __ \skip1 "Без" -- "смер" -- "тный," "по" --
  "ми" -- "луй" "нас."
}

PartPOneVoiceTwo = \relative d' {
  \clef "treble" \once \omit Staff.TimeSignature \time 3/2 \key f \major \D d2 c1
  \bar "||" % 1
  \once \omit Staff.TimeSignature \time 5/1 \D d2 \hideNote r1 \hideNote r1
  \hideNote r1 \hideNote r1 \hideNote r2 | % 2
  \once \omit Staff.TimeSignature \time 6/1 \hideNote r1 \hideNote r1 \hideNote
  r1 \hideNote r1 d1 \oneVoice \parenthesize c1 \bar "|."
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

