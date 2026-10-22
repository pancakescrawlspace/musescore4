\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from bogoroditse_dievo_arkhangelsky.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Богородице Дево"
  composer = \markup \right-column { "Греческий распев" "в перел. А. А. Архангельского" }
  "id: software" = "MuseScore Studio 4.7.5"
  "id: encoding-date" = "2026-10-23"
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
  \clef "treble" \once \omit Staff.TimeSignature \time 11/4 \key g \major \U g8
  [ ^\p \U a8 ] \U b4 \U b4 \U a8 ( [ \U b8 ) ] \U c4 ( \U b4 ) \U b2 \U d4 \U c4
  \U b4 | % 1
  \once \omit Staff.TimeSignature \time 31/8 \U b4 \U a4 \U b4 \U b4 \U b4 \U a8
  ( [ \U b8 ) ] \U c4 \U b4 \U a4 \U b4 \U a8 ( [ \U g8 ) \U a8 ( ] \U b4 \U a8
  ) \U g2 ( \U g8 ) | % 2
  \once \omit Staff.TimeSignature \time 15/8 \U g8 [ \U g8 \U a8 ] \U b4 \U a8 (
  [ \U b8 ) ] \U c4 \U b4 \U b2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \U g8 [ \U g8 \U g8 \U a8 ] \U b2
  \U c4 ( \U b4 ) \U c4 \U d4 \U d4 \U c4 \U b2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \U g8 [ \U a8 ] \U b4 \U b4 \U b4
  \U a8 ( [ \U b8 ) ] \U c4 \U b4 \U b4 \U a8 ( [ \U g8 ) \U a8 ( ] \U b4 \U a8
  ) g1 ^\fermata \bar "|."
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "Бо" -- "го" -- "ро" -- "ди" -- "це" __ \skip1 "Де" __ \skip1 "во," "ра" --
  "дуй" -- "ся," "Бла" -- "го" -- "дат" -- "на" -- "я" "Ма" __ \skip1 "ри" --
  "е," "Гос" -- "подь" "с То" __ \skip1 "бо" __ \skip1 \skip1 "ю:" __ \skip1
  "Бла" -- "го" -- "сло" -- "вен" -- "на" __ \skip1 "Ты" "в же" -- "нах," "и"
  "бла" -- "го" -- "сло" -- "вен" "Плод" __ \skip1 "чре" -- "ва" "Тво" -- "е" --
  "го," "я" -- "ко" "Спа" -- "са" "ро" -- "ди" __ \skip1 "ла" "е" -- "си" "душ"
  __ \skip1 "на" __ \skip1 \skip1 "ших."
}

PartPOneVoiceTwo = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 11/4 \key g \major \D g8
  [ \D g8 ] \D g4 \D g4 \D g4 \D g2 \D g2 \D g4 \D g4 \D g4 | % 1
  \once \omit Staff.TimeSignature \time 31/8 \D g4 \D g4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D fis4 \D g4 \D e4 \D fis2 \D d2 ( \D d8 ) | % 2
  \once \omit Staff.TimeSignature \time 15/8 \D e8 [ \D e8 \D fis8 ] \D g4 \D g4
  \D g4 \D g4 \D g2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \D e8 [ \D e8 \D e8 \D fis8 ] \D g2
  \D g2 \D g4 \D g4 \D g4 \D g4 \D g2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \D g8 [ \D g8 ] \D g4 \D g4 \D g4
  \D g4 \D g4 \D g4 \D g4 \D e4 \D fis2 d1 \bar "|."
}

PartPTwoVoiceOne = \relative b {
  \clef "bass" \once \omit Staff.TimeSignature \time 11/4 \key g \major \U b8 [
  \U c8 ] \U d4 \U d4 \U c8 ( [ \U d8 ) ] \U e4 ( \U d4 ) \U d2 \U b4 \U e4 \U d4
  | % 1
  \once \omit Staff.TimeSignature \time 31/8 \U d4 \U c4 \U d4 \U d4 \U d4 \U c8
  ( [ \U d8 ) ] \U e4 \U d4 \U d4 \U d4 \U b4 \U d2 \U b2 ( \U b8 ) | % 2
  \once \omit Staff.TimeSignature \time 15/8 \U b8 [ \U b8 \U d8 ] \U d4 \U c8 (
  [ \U d8 ) ] \U e4 \U e4 \U e2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \U b8 [ \U b8 \U b8 \U d8 ] \U d2
  \U c4 ( \U d4 ) \U e4 \U d4 \U d4 \U e4 \U d2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \U b8 [ \U c8 ] \U d4 \U d4 \U d4
  \U c8 ( [ \U d8 ) ] \U e4 \U d4 \U d4 \U b4 \U d2 b1 \bar "|."
}

PartPTwoVoiceTwo = \relative g {
  \clef "bass" \once \omit Staff.TimeSignature \time 11/4 \key g \major \D g8 [
  \D g8 ] \D g4 \D g4 \D g4 \D c,8 ( [ \D e8 ] \D g4 ) \D g2 \D g4 \D g4 \D g4 | % 1
  \once \omit Staff.TimeSignature \time 31/8 \D g4 \D g4 \D g4 \D g4 \D g4 \D e8
  ( [ \D d8 ) ] \D c4 \D g4 \D d'4 \D b4 \D e4 \D d2 \D g2 ( \D g8 ) | % 2
  \once \omit Staff.TimeSignature \time 15/8 \D e8 [ \D e8 \D d8 ] \D g4 \D g4
  \D c,4 \D e4 \D e2 | % 3
  \once \omit Staff.TimeSignature \time 13/4 \D e8 [ \D e8 \D e8 \D d8 ] \D g2
  \D e4 ( \D d4 ) \D c4 \D b4 \D b4 \D c4 \D g'2. | % 4
  \once \omit Staff.TimeSignature \time 15/4 \D g8 [ \D g8 ] \D g4 \D g4 \D g4
  \D e8 ( [ \D d8 ) ] \D c4 \D g4 \D b4 \D e4 \D d2 <g, g'>1 _\fermata \bar "|."
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

