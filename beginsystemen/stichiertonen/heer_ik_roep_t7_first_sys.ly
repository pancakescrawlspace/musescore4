\version "2.26.0"
% automatically converted by musicxml2ly from heer_ik_roep_t7_first_sys.musicxml
\pointAndClickOff
% build, in this directory, with LilyPond 2.26:
%   lilypond heer_ik_roep_t7_first_sys.ly
%   lilypond -dbackend=svg -dcrop heer_ik_roep_t7_first_sys.ly
% The first makes the .pdf, the second the .svg and the .cropped.svg that beginsystemen.typ includes.

% LilyPond 2.24's side margins (2.26 has 15mm), so the systems keep their size in beginsystemen.typ
\paper {
    left-margin = 10\mm
    right-margin = 10\mm
    % Helvetica for the "Toon N" label, as for the page heading in beginsystemen.typ
    property-defaults.fonts.serif = "Helvetica"
    property-defaults.fonts.sans = "Helvetica"
    }

% room above the "Toon N" label: the crop (-dcrop) fits LilyPond's own box for the text,
% but the SVG text is drawn by the viewer (Typst), whose letters can reach just past it
\layout {
    \context { \Voice
        \override TextScript.stencil =
            #(lambda (grob)
               (let* ((s (ly:text-interface::print grob))
                      (y (ly:stencil-extent s Y)))
                 (ly:make-stencil (ly:stencil-expr s) (ly:stencil-extent s X)
                                  (cons (car y) (+ (cdr y) 0.25)))))
        }
    }

\layout {
    indent = 0 %rene
    ragged-last = ##f %rene
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \clef "treble" \time 13/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp g2. ^ "Toon 7" \stemUp g4 \stemUp g4 \stemUp g4 \stemUp f4
    \stemUp g4 \stemUp a2 ( \stemUp f4 ) \stemUp g2 | % 2
    \time 9/4 \omit Staff.TimeSignature \stemUp a4 \stemUp bes2 \stemUp
    a4 \stemUp g4 \stemUp f2 ( \stemUp e2 ) \bar "|."
    }

PartPOneVoiceTwo =  \relative e' {
    \clef "treble" \time 13/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown e2. \stemDown e4 \stemDown e4 \stemDown e4 \stemDown d4
    \stemDown e4 \stemDown f2 ( \stemDown d4 ) \stemDown e2 | % 2
    \time 9/4 \omit Staff.TimeSignature \stemDown f4 \stemDown g2
    \stemDown f4 \stemDown e4 \stemDown d2 ( \stemDown c2 ) \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \clef "bass" \time 13/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp c2. \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp c2. \stemUp c2 | % 2
    \time 9/4 \omit Staff.TimeSignature \stemUp c4 \stemUp c2 \stemUp c4
    \stemUp c4 \stemUp b2 ( \stemUp g2 ) \bar "|."
    }

PartPTwoVoiceTwo =  \relative c {
    \clef "bass" \time 13/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown c2. \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown f2. \stemDown c2 | % 2
    \time 9/4 \omit Staff.TimeSignature \stemDown f4 \stemDown e2
    \stemDown f4 \stemDown c4 \stemDown g'2 ( \stemDown c,2 ) \bar "|."
    }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = "" % hand edit: no staff names
                
                \context Staff << 
                    \override Staff.BarLine.allow-span-bar = ##f % barlines not connected, as in MuseScore
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "" % hand edit: no staff names
                
                \context Staff << 
                    \override Staff.BarLine.allow-span-bar = ##f % barlines not connected, as in MuseScore
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPTwoVoiceOne" {  \voiceOne \PartPTwoVoiceOne }
                    \context Voice = "PartPTwoVoiceTwo" {  \voiceTwo \PartPTwoVoiceTwo }
                    >>
                >>
            
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

