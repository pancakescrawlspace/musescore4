\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from prokimen_t8_huwelijkskroning.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Prokimen van de huwelijkskroning"
  subtitle = "toon 8"
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
PartPOneVoiceOne = \relative bes' {
  \clef "treble" \once \omit Staff.TimeSignature \time 8/4 \key f \major \U bes2
  \U a2 \U f2 \U g2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \U a4 \U a4 \U a4 \U a4 \U a4 \U a4
  \U a4 \U bes2 \U bes4 \U bes4 a1 \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Op __ \skip1 hun hoofd hebt Gij een kroon van e -- del -- ste -- nen ge --
  plaatst
}

PartPOneVoiceTwo = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 8/4 \key f \major \D g2 f1
  \D e2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f4 \D d2 \D d4 \D d4 e1 \bar "|."
}

PartPTwoVoiceOne = \relative d' {
  \clef "bass" \once \omit Staff.TimeSignature \time 8/4 \key f \major \U d2 c1
  \U c2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \U c4 \U c4 \U c4 \U c4 \U c4 \U c4
  \U c4 \U bes2 \U bes4 \U d4 cis1 \bar "|."
}

PartPTwoVoiceTwo = \relative g {
  \clef "bass" \once \omit Staff.TimeSignature \time 8/4 \key f \major \D g2 \D
  f2 \D d2 \D c2 | % 1
  \once \omit Staff.TimeSignature \time 15/4 \D f4 \D f4 \D f4 \D f4 \D f4 \D f4
  \D f4 \D g2 \D g4 \D g4 <a, a'>1 \bar "|."
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

