\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from jesaja_wees_verheugd.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Jesaja wees verheugd"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 16/4 \key g \major \U a4
  \U a2 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4 \U g4 \U a4 \U b2 \U g2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \U b4 \U b4 \U b4 \U b4 \U b4 \U b4
  \U b4 \U b4 \U b4 \U b2 \U a4 \U g4 \U a2 | % 2
  \once \omit Staff.TimeSignature \time 8/4 \U a2 \U fis4 \U g2 \U fis4 \U e2 | % 3
  \U a4 \U g4 \U a4 \U b2 \U g4 \U g2 | % 4
  \U b4 \U b4 \U b2 \U a4 \U g4 \U a2 | % 5
  \once \omit Staff.TimeSignature \time 15/4 \U b4 \U b4 \U b4 \U a2 \U g4 \U g4
  \U fis2 \U g4 \U fis4 e1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Je -- sa -- ja wees ver -- heugd want de Maagd heeft ont -- van -- gen ge --
  bo -- ren is uit haar een Zoon Em -- ma -- nu __ \skip1 el Hij is God en
  "Mens," Zijn naam is Da -- ge -- raad Hem ver -- heer -- lij -- ken wij en de
  Maagd prij -- zen wij za __ \skip1 \skip1 "lig."
}

PartPOneVoiceTwo = \relative fis' {
  \clef "treble" \once \omit Staff.TimeSignature \time 16/4 \key g \major \D fis4
  \D fis2 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D e4 \D fis4
  \D g2 \D d2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D g4 \D g2 \D fis4 \D e4 \D fis2 | % 2
  \once \omit Staff.TimeSignature \time 8/4 \D fis2 \D d4 \D d2 \D d4 \D b2 | % 3
  \D fis'4 \D e4 \D fis4 \D g2 \D d4 \D d2 | % 4
  \D g4 \D g4 \D g2 \D fis4 \D e4 \D fis2 | % 5
  \once \omit Staff.TimeSignature \time 15/4 \D g4 \D g4 \D g4 \D d2 \D d4 \D d4
  d1 b1 \bar "|."
}

PartPTwoVoiceOne = \relative d' {
  \clef "bass" \once \omit Staff.TimeSignature \time 16/4 \key g \major \U d4 \U
  d2 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d2 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \U d4 \U d4 \U d4 \U d4 \U d4 \U d4
  \U d4 \U d4 \U d4 \U d2 \U d2 \U d2 | % 2
  \once \omit Staff.TimeSignature \time 8/4 \U c2 \U a4 \U b2 \U a4 \U g2 | % 3
  \U d'4 \U d4 \U d4 \U d2 \U b4 \U b2 | % 4
  \U d4 \U d4 \U d2 \U d4 \U d4 \U d2 | % 5
  \once \omit Staff.TimeSignature \time 15/4 \U d4 \U d4 \U d4 \U c2 \U b4 \U b4
  \U a2 \U b4 \U a4 g1 \bar "|."
}

PartPTwoVoiceTwo = \relative d {
  \clef "bass" \once \omit Staff.TimeSignature \time 16/4 \key g \major \D d4 \D
  d2 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4 \D g2 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D g4 \D g2 \D g2 \D d2 | % 2
  \once \omit Staff.TimeSignature \time 8/4 \D d2 \D d4 \D g2 \D d4 \D e2 | % 3
  \D d4 \D d4 \D d4 \D g2 \D g4 \D g2 | % 4
  \D g4 \D g4 \D g2 \D g4 \D g4 \D d2 | % 5
  \once \omit Staff.TimeSignature \time 15/4 \D g4 \D g4 \D g4 \D fis2 \D g4 \D
  g4 \D d2. \D d4 e1 \bar "|."
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

