\version "2.26.0"
\include "church_style.ily"
% automatically converted by musicxml2ly from canon_van_de_geboorte.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

%% additional definitions required by the score:
% Change the number of staff lines to `num-lines`.
%
% The argument `clef` makes the function emit a clef with the given
% name.  If `clef` contains the substring `"percussion"` or `"tab"`,
% use both even and odd staff line positions.  If set to `""`, do the
% same but don't set `Staff.clefPosition` (which means that no clef
% gets triggered).  If `clef` is set to any other value, use even
% staff line positions only and set `Staff.clefPosition`, which
% triggers a clef if its value changes.
%
% The optional argument `properties` is an alist of properties to
% control the appearance of both the staff and the clef:
%
% * `details` is a list of staff line numbers that should be
%   displayed.  An empty list suppresses any display of staff lines;
%   omitting the argument means to display all lines.
% * `staff-color` holds the color of the staff.
% * `clef-font-size` holds the font size of the clef
% * `clef-color` holds the color of the clef.
%
% \staffLines [<properties>] <clef> <num-lines>

staffLines =
#(define-music-function (properties clef num-lines)
                        ((alist? '()) string? index?)
   (let* ((details (assoc-get 'details properties #f))
          (staff-color (assoc-get 'staff-color properties #f))
          (clef-color (assoc-get 'clef-color properties #f))
          (clef-font-size (assoc-get 'clef-font-size properties #f))
          (lines (or details (iota num-lines 1)))
          (only-even-pos (not (or (equal? clef "")
                                  (string-contains clef "percussion")
                                  (string-contains clef "tab"))))
          (offset (if only-even-pos
                      (if (even? num-lines) 1 0)
                      0))
          ;; MusicXML counts staff lines from the bottom.
          (delta (- -1 num-lines offset))
          (positions (filter (lambda (x) (<= x num-lines))
                             lines))
          (positions (map (lambda (x) (+ delta (* x 2)))
                      positions)))
     #{
       \stopStaff

       #(if staff-color
            #{
              \once \override Staff.StaffSymbol.color = #staff-color
            #})
       #(if clef-color
            #{
              \once \override Staff.Clef.color = #clef-color
            #})
       #(if clef-font-size
            #{
              \once \override Staff.Clef.font-size = #clef-font-size
            #})

       #(if (equal? clef "")
            #{
              \unset Staff.middleCPosition
              \unset Staff.middleCClefPosition
              % To suppress the clef inserted by default by LilyPond at the
              % beginning of a piece.
              \once \omit Staff.Clef
            #}
            #{ \clef #clef #})

       \override Staff.StaffSymbol.line-positions = #positions

       \applyContext
       #(lambda (ctx)
          (let* ((c (ly:context-find ctx 'Staff))
                 (clef-p (ly:context-property c 'clefPosition))
                 (middle-c-p (ly:context-property c 'middleCPosition))
                 (middle-c-clef-p (ly:context-property c 'middleCClefPosition))
                 (use-offset (not (string-contains clef "percussion")))
                 (delta (+ delta (if use-offset 6 0))))
            (when only-even-pos
              (ly:context-set-property! c 'clefPosition (+ clef-p delta))
              (ly:context-set-property! c 'forceClef #t))
            (ly:context-set-property! c 'middleCPosition (+ middle-c-p delta))
            (ly:context-set-property! c 'middleCClefPosition
                                      (+ middle-c-clef-p delta))))
       \startStaff
     #}))

D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc


\header {
  title = "Canon van de Geboorte van de Moeder Gods"
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
PartPOneVoiceOne = \relative c' {
  \staffLines "treble" 5 \once \omit Staff.TimeSignature \time 20/4 \key g
  \major R1*5 | % 1
  \once \omit Staff.TimeSignature \time 16/4 R1*4 | % 2
  \once \omit Staff.TimeSignature \time 9/4 R4*9 | % 3
  \once \omit Staff.TimeSignature \time 16/4 R1*4 \bar "|."
}

PartPTwoVoiceOne = \relative g' {
  \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key g \major \U g4
  \U g2 \U g4 \U fis4 \U g4 \U fis4 \U e2 \U e4 \U g4 \U a4 \U a4 \U a4 \U g2 \U
  fis4 \U fis4 \U g2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \U a4 \U a2 \U a4 \U a4 \U a4
  \U a4 \U a4 \U a4 \U g4 \U a4 \U b2 \U g2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \U g2 \U g4 \U g4 \U fis4 \U g4 \U
  fis4 \U e2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U fis4 \U fis4 \U g4 \U g4 \U g4
  \U g4 \U g4 \U g4 \U a2 \U g2 fis1 \bar "|."
}

PartPTwoVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  Mijn mond zal ik o -- pe -- nen en ver -- vuld van de Hei -- li -- ge Geest
  wil ik U de ko -- nin -- klij -- ke Moe -- der be -- zin -- gen feest -- vie
  -- ren vol blijd __ \skip1 schap en ver -- heugd Uw ge -- boor -- te be -- zin
  __ \skip1 gen
}

PartPTwoVoiceTwo = \relative d' {
  \clef "treble" \once \omit Staff.TimeSignature \time 20/4 \key g \major \D d4
  \D d2 \D d4 \D d4 \D d4 \D d4 \D e2 \D e4 \D e4 \D fis4 \D fis4 \D fis4 \D d2
  \D d4 \D d4 \D d2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \D fis4 \D fis4 \D fis2 \D fis4 \D
  fis4 \D fis4 \D fis4 \D fis4 \D fis4 \D g4 \D g4 \D g2 \D d2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \D d2 \D d4 \D d4 \D d4 \D d2 \D e2
  | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D d4 \D d4 \D d4 \D d4 \D d4 \D d4
  \D d4 \D d4 d1 d1 \bar "|."
}

PartPThreeVoiceOne = \relative b {
  \clef "bass" \once \omit Staff.TimeSignature \time 20/4 \key g \major \U b4 \U
  b2 \U b4 \U a4 \U b4 \U a4 \U g2 \U g4 \U b4 \U c4 \U c4 \U c4 \U b2 \U a4 \U
  a4 \U b2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \U c4 \U c4 \U c2 \U c4 \U c4 \U c4
  \U c4 \U c4 \U c4 \U b4 \U c4 \U d2 \U b2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \U b2 \U b4 \U b4 \U a4 \U b4 \U a4
  \U g2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \U a4 \U a4 \U b4 \U b4 \U b4 \U b4
  \U b4 \U b4 \U c2 \U b2 a1 \bar "|."
}

PartPThreeVoiceTwo = \relative g {
  \clef "bass" \once \omit Staff.TimeSignature \time 20/4 \key g \major \D g4 \D
  g2 \D g4 \D d4 \D g4 \D d4 \D e2 \D e4 \D e4 \D d4 \D d4 \D d4 \D g2 \D d4 \D
  d4 \D g2 | % 1
  \once \omit Staff.TimeSignature \time 16/4 \D d4 \D d4 \D d2 \D d4 \D d4 \D d4
  \D d4 \D d4 \D d4 \D g4 \D g4 \D g2 \D g2 | % 2
  \once \omit Staff.TimeSignature \time 9/4 \D g2 \D g4 \D g4 \D d4 \D g4 \D d4
  \D e2 | % 3
  \once \omit Staff.TimeSignature \time 16/4 \D d4 \D d4 \D g4 \D g4 \D g4 \D g4
  \D g4 \D g4 \D fis2 \D g2 d1 \bar "|."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
      \set Staff.instrumentName = "Voice"
      \set Staff.shortInstrumentName = "Vo."
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \PartPOneVoiceOne
        }
      >>
    >>
    \new Staff = "P2" <<
      \set Staff.instrumentName = "Women"
      \set Staff.shortInstrumentName = "W."
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPTwoVoiceOne" {
          \voiceOne \PartPTwoVoiceOne
        }
        \new Lyrics \lyricsto "PartPTwoVoiceOne" {
          \PartPTwoVoiceOneLyricsOne
        }
        \context Voice = "PartPTwoVoiceTwo" {
          \voiceTwo \PartPTwoVoiceTwo
        }
      >>
    >>
    \new Staff = "P3" <<
      \set Staff.instrumentName = "Men"
      \set Staff.shortInstrumentName = "M."
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPThreeVoiceOne" {
          \voiceOne \PartPThreeVoiceOne
        }
        \context Voice = "PartPThreeVoiceTwo" {
          \voiceTwo \PartPThreeVoiceTwo
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

