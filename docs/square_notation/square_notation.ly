\version "2.26.0"
% The pictures in ../square_notation.md, Kievan (Synodal) square notation
% next to modern notation. Build (one PNG per \book):
%   lilypond -dcrop --png -dresolution=200 square_notation.ly
% and keep the *.cropped.png files under their book names.

\paper { indent = 0 tagline = ##f }
\layout { \context { \Lyrics \override LyricText.font-size = #-1 } }

% 1. The scale (gamut): the clef marks C on the middle line.
\book {
  \bookOutputName "gamut"
  \score {
    <<
      \new KievanStaff \with { instrumentName = "" } \new KievanVoice = "k" \relative c' {
        \clef "kievan-do" \cadenzaOn
        g4 a b c d e f g a bes c d \bar "kievan"
      }
      \new Lyrics \lyricsto "k" { "G3" "A3" "B3" "C4" "D4" "E4" "F4" "G4" "A4" "B♭4" "C5" "D5" }
      \new Lyrics \lyricsto "k" { sol la si do re mi fa sol la si♭ do re }
      \new Staff \new Voice = "a" \relative c' {
        \clef alto \cadenzaOn \omit Staff.TimeSignature
        g4 a b c d e f g a bes c d \bar "|."
      }
      \new Staff \new Voice = "t" \relative c' {
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
        c4 d e f g a bes c d ees f g \bar "|."
      }
      \new Lyrics \lyricsto "t" { "C4" "D4" "E4" "F4" "G4" "A4" "B♭4" "C5" "D5" "E♭5" "F5" "G5" }
    >>
  }
}

% 2. The note values, square note above its modern equivalent (4 and 5:
% the quarter with its stem down and up). The
% recitative mark and the final note are scaled to a whole note's length
% so the two staves line up; their shapes stay the same.
\book {
  \bookOutputName "values"
  \score {
    <<
      \new KievanStaff \new KievanVoice = "k" \relative c' {
        \clef "kievan-do" \cadenzaOn
        c1 \bar "|" c2 \bar "|" d2 \bar "|" e4 \bar "|" a,4 \bar "|" c8[ d] \bar "|"
        c2. \bar "|" c4. \bar "|"
        \scaleDurations 1/2 { c\breve } \bar "|" \scaleDurations 1/4 { c\longa } \bar "kievan"
      }
      \new Lyrics \lyricsto "k" { "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" }
      \new Staff \relative c' {
        \clef alto \cadenzaOn \omit Staff.TimeSignature
        c1 \bar "|" c2 \bar "|" d2 \bar "|" e4 \bar "|" a,4 \bar "|" c8[ d] \bar "|"
        c2. \bar "|" c4. \bar "|"
        c1^\markup \small "c c c …" \bar "|" c1\fermata \bar "|."
      }
    >>
  }
}

% 3. «Царю Небесный», Pentecostarion (1899) p. 311, first phrase: square
% notation as there (do = C on the middle line), and as in
% ../../znamenny/tsaryu_nebesnyj_znamennyj.mscz, a fourth higher (do = F).
\book {
  \bookOutputName "tsaryu"
  \score {
    <<
      \new KievanStaff \new KievanVoice = "k" \relative c' {
        \clef "kievan-do" \cadenzaOn
        c4 d e2 d c4 b a b c d c2 b4 c d1 \bar "|"
      }
      \new Lyrics \lyricsto "k" { Ца __ _ рю __ _ Не __ _ бе __ _ _ _ _ _ _ сный }
      \new Staff \new Voice = "m" \relative c' {
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
        f4( g) a2( g) f4( e) d( e f g f2 e4 f) g1 \bar "|"
      }
      \new Lyrics \lyricsto "m" { Ца рю Не бе сный, }
    >>
  }
}
