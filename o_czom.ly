\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from o_czom.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "O czom skorbiet’"
  subtitle = "Bohohłasnik"
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
    doubleRepeatBarType = ":|.|:"
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative e' {
  \repeat volta 4 {
    \clef "treble" \numericTimeSignature \time 4/4 \key g \major \partial 4. \U
    <e g>8 [ \U <e g>8 \U <fis a>8 ] \U <g b>2 ( \U <g b>8 ) [ \U <fis a>8 \U g8
    \U <fis a>8 ] | % 1
    \U <g b>4 \U <e g>4. \U <e g>8 [ \U <d fis!>8 \U <e g>8 ] | % 2
    \time 2/4 \U <fis a>8 [ \U <d fis>8 ] \U <e g>8 [ \U <fis a>8 ] | % 3
    \numericTimeSignature \time 4/4 \U <g b>2 ( \U <g b>8 ) [ \U <g b>8 \U <fis
      a>8 \U <g b>8 ] | % 4
    \time 2/4 \U <a c>8 [ \U <a c>8 ] \U <g b>8 [ \U <fis a>8 ] | % 5
    \numericTimeSignature \time 4/4 \U <g b>4 \U g4. r8 \U <e g>4 | % 6
    \time 3/4 \U <c' e>2 \U <b d>8 [ \U <a c>8 ] | % 7
    \numericTimeSignature \time 4/4 \U <g b>4. \U <fis a>8 \U <e g>4 \U <fis a>4
    | % 8
    \U <g b>2 r4 \U <e g>4 | % 9

    \barNumberCheck #10
    \time 3/4 \U <c' e>2 \U <b d>8 [ \U <a c>8 ] | % 10
    \numericTimeSignature \time 4/4 \U <g b>4. \U <fis a>8 \U <e g>4 \U <fis a>4
    | % 11
    <e g>1 | % 12
    \oneVoice \U <g b>4 \voiceOne \U g4 \U <a c>8 [ \U <a c>8 \U <g b>8 \U <fis
      a>8 ] | % 13
    \U <g b>4 \U <e g>2 \U <dis fis>8 [ \U <e g>8 ] | % 14
    \time 2/4 \U <fis a>8 [ \U <dis fis>8 ] \U <e g>8 [ \U <fis a>8 ] | % 15
    \numericTimeSignature \time 4/4 \U <g b>2. \U <fis a>8 [ \U <g b>8 ] | % 16
    \time 2/4 \U <a c>8 [ \U <a c>8 ] \U <g b>8 [ \U <fis a>8 ] | % 17
    \time 3/4 \U <g b>4 \U <e g>2 | % 18
    \U <c' e>2 \U <b d>8 ( [ \U <a c>8 ) ] | % 19

    \barNumberCheck #20
    \numericTimeSignature \time 4/4 \U <g b>4. \U <fis a>8 \U <e g>4 \U <fis a>4
    | % 20
    \time 2/4 \U <g b>2 | % 21
    \time 3/4 \U <c e>2 \U <b d>8 ( [ \U <a c>8 ) ] | % 22
    \U <g b>8 [ \U <fis a>8 ] \U <e g>4 \U <dis fis>4 | % 23
    \numericTimeSignature \time 4/4 \U <e g>2 ( \U <e g>8 ) r8 r4 }
}

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "K cze" -- mu skor -- "biet’" __ \skip1 o czom kru -- szyt -- sia o czom mnie
  sle -- zy pro -- li -- "wat’" __ \skip1 A "nuż" -- no Bo -- hu lisz mo -- lit
  -- sia Je -- ho na __ \skip1 po -- moszcz pry -- zy -- "wat’" Je -- ho na __
  \skip1 po -- moszcz pry -- zy -- "wat’" Bo -- "że!" Ty mo -- ja na -- "dież"
  -- "da," mo -- ja ra -- "dost’" "w żyz" -- ni "siej," u -- spo -- koj "że" mie
  -- "nia," Bo -- "że," "w hor" -- koj __ \skip1 u -- czas -- ti mo -- "jej:"
  "w hor" -- koj __ \skip1 u -- czas -- ti mo -- jej __ \skip1
}

PartPOneVoiceOneLyricsTwo = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  "K Nie" -- mu du -- szoj __ \skip1 ja "budu woz" -- wy -- szat -- sia na nie
  -- bo um swoj woz -- wo -- "dit’" __ \skip1 Pred Nim lisz pro -- "doł" --
  "żat’" smi -- rat -- sia i "s czust" -- wom __ \skip1 skorb -- nym ho -- wo --
  "ryt’" i "s czust" -- wom __ \skip1 skorb -- nym ho -- wo -- "ryt’" \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
}

PartPOneVoiceOneLyricsThree = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Wie -- zdie bie -- dy __ \skip1 wie -- zdie na -- pas -- ti wie -- zdie i wsio
  mie -- nia stra -- szyt __ \skip1 Ku -- da "że" skro -- "juś" ot nie --
  "sczast’" -- ja i hdie naj __ \skip1 ti mnie twier -- dy szczyt i hdie naj __
  \skip1 ti mnie twier -- dy szczyt \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1
}

PartPOneVoiceOneLyricsFour = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  O Bo -- hie wsio __ \skip1 mo -- "jo upo" -- ko -- je -- "ńje" "s Nim" "moż"
  -- no "żyt’" mnie i "w bie" -- dach __ \skip1 "K Nie" -- mu pry -- bieh -- nu
  "s u" -- mi -- le -- "ńjem" wsia "żyzń" mo __ \skip1 ja "w Je" -- ho ru --
  kach wsia "żyzń" mo __ \skip1 ja "w Je" -- ho ru -- kach \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1 \skip1
}

PartPOneVoiceTwo = \relative b {
  \repeat volta 4 {
    \clef "treble" \numericTimeSignature \time 4/4 \key g \major \partial 4. \D
    b8 [ \D b8 \D b8 ] \D e2 ( \D e8 ) [ \D e8 \D e8 \D e8 ] | % 1
    \D e4 \D b4. \D b8 [ \D b8 \D b8 ] | % 2
    \time 2/4 \D b8 [ \D b8 ] \D b8 [ \D b8 ] | % 3
    \numericTimeSignature \time 4/4 \D b2 ( \D b8 ) [ \D e8 \D e8 \D e8 ] | % 4
    \time 2/4 \D e8 [ \D e8 ] \D e8 [ \D e8 ] | % 5
    \numericTimeSignature \time 4/4 \D e4 \D e4. r8 \D e4 | % 6
    \time 3/4 \D e2 \D e4 | % 7
    \numericTimeSignature \time 4/4 \D e4. \D e8 \D b4 \D dis4 | % 8
    \D e2 r4 \D e4 | % 9

    \barNumberCheck #10
    \time 3/4 \D e2 \D e4 | % 10
    \numericTimeSignature \time 4/4 \D e4. \D e8 \D b4 \D dis4 | % 11
    b1 s4 \D e4 \D e8 [ \D e8 \D e8 \D e8 ] | % 13
    \D e4 \D b2 \D b8 [ \D b8 ] | % 14
    \time 2/4 \D b8 [ \D b8 ] \D b8 [ \D b8 ] | % 15
    \numericTimeSignature \time 4/4 \D b2. \D b8 [ \D b8 ] | % 16
    \time 2/4 \D e8 [ \D e8 ] \D e8 [ \D e8 ] | % 17
    \time 3/4 \D e4 \D e2 | % 18
    \D e2 \D e4 | % 19

    \barNumberCheck #20
    \numericTimeSignature \time 4/4 \D e4. \D e8 \D b4 \D d4 | % 20
    \time 2/4 \D d2 | % 21
    \time 3/4 \D e2 \D e4 | % 22
    \D e8 [ \D e8 ] \D b4 \D b4 | % 23
    \numericTimeSignature \time 4/4 \D b2 ( \D b8 ) r8 r4 }
}

PartPTwoVoiceOne = \relative e {
  \repeat volta 4 {
    \clef "bass" \numericTimeSignature \time 4/4 \key g \major \partial 4. \D e8
    [ \D e8 \D e8 ] \D e2 ( \D e8 ) [ \D e8 \D e8 \D e8 ] | % 1
    \D e4 \D e4. \U e8 [ \U b8 \U b8 ] | % 2
    \time 2/4 \U b8 [ \U b8 ] \U b8 [ \U b8 ] | % 3
    \numericTimeSignature \time 4/4 \D e2 ( \D e8 ) [ \D e8 \D e8 \D e8 ] | % 4
    \time 2/4 \D a8 [ \D a8 ] \D e8 [ \D e8 ] | % 5
    \numericTimeSignature \time 4/4 \D e4 \D e4. r8 \D e4 | % 6
    \time 3/4 \U a,2 \U a4 | % 7
    \numericTimeSignature \time 4/4 \U b4. \U b8 \U b4 \U b4 | % 8
    \D e2 r4 \D e4 | % 9

    \barNumberCheck #10
    \time 3/4 \U a,2 \U a4 | % 10
    \numericTimeSignature \time 4/4 \U b4. \U b8 \U b4 \U b4 | % 11
    e1 | % 12
    \D e4 \D e4 \D a8 [ \D a8 \D b8 \D c8 ] | % 13
    \D b4 \D e,2 \U b8 [ \U b8 ] | % 14
    \time 2/4 \U b8 [ \U b8 ] \U b8 [ \U b8 ] | % 15
    \numericTimeSignature \time 4/4 \D e2. \D e8 [ \D e8 ] | % 16
    \time 2/4 \D a8 [ \D a8 ] \D b8 [ \D c8 ] | % 17
    \time 3/4 \D b4 \D e,2 | % 18
    \U a,2 \U a4 | % 19

    \barNumberCheck #20
    \numericTimeSignature \time 4/4 \U b4. \U b8 \D e4 \D d4 | % 20
    \time 2/4 \D g2 | % 21
    \time 3/4 \U a,2 \U a4 | % 22
    \U b8 [ \U b8 ] \U b4 \U b4 | % 23
    \numericTimeSignature \time 4/4 \D e2 ( \D e8 ) r8 r4 }
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
            \set stanza = "1." \PartPOneVoiceOneLyricsOne
          }
          \new Lyrics \lyricsto "PartPOneVoiceOne" {
            \set stanza = "2." \PartPOneVoiceOneLyricsTwo
          }
          \new Lyrics \lyricsto "PartPOneVoiceOne" {
            \set stanza = "3." \PartPOneVoiceOneLyricsThree
          }
          \new Lyrics \lyricsto "PartPOneVoiceOne" {
            \set stanza = "4." \PartPOneVoiceOneLyricsFour
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

