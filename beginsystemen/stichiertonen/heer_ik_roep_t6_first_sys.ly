\version "2.26.0"
% automatically converted by musicxml2ly from heer_ik_roep_t6_first_sys.musicxml
\pointAndClickOff
% build, in this directory, with LilyPond 2.26:
%   lilypond heer_ik_roep_t6_first_sys.ly
%   lilypond -dbackend=svg -dcrop heer_ik_roep_t6_first_sys.ly
% The first makes the .pdf, the second the .svg and the .cropped.svg that beginsystemen.typ includes.

% LilyPond 2.24's side margins (2.26 has 15mm), so the systems keep their size in beginsystemen.typ
\paper { left-margin = 10\mm right-margin = 10\mm }

\layout {
    indent = 0 %rene
    ragged-last = ##f %rene
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \omit Staff.TimeSignature %rene
    \clef "treble" \key g \major | % 1
    \time 10/4 %rene
    \stemUp g4 ^ "Toon 6" \stemUp g4 \stemUp g4 \stemUp g4 \stemUp g4
    \stemUp g4 \stemUp fis2 \stemUp g2 | % 2
    \time 7/4 %rene
    \stemUp a4 \stemUp a2 \stemUp g4 \stemUp g4 \stemUp a2 \bar "|."
    }

PartPOneVoiceTwo =  \relative e' {
    \clef "treble" \key g \major | % 1
    \stemDown e4 \stemDown e4 \stemDown e4 \stemDown e4 \stemDown e4
    \stemDown e4 \stemDown dis2 \stemDown e2 | % 2
    \stemDown fis4 \stemDown fis2 \stemDown e4 \stemDown e4 \stemDown
    fis2 \bar "|."
    }

PartPTwoVoiceOne =  \relative b {
    \omit Staff.TimeSignature %rene
    \clef "bass" \key g \major | % 1
    \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b4
    \stemUp b2 \stemUp b2 | % 2
    \stemUp d4 \stemUp d2 \stemUp d4 \stemUp d4 \stemUp d2 \bar "|."
    }

PartPTwoVoiceTwo =  \relative e {
    \clef "bass" \key g \major | % 1
    \stemDown e4 \stemDown e4 \stemDown e4 \stemDown e4 \stemDown e4
    \stemDown e4 \stemDown b2 \stemDown e2 | % 2
    \stemDown d4 \stemDown d2 \stemDown d4 \stemDown d4 \stemDown d2
    \bar "|."
    }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = ""
                
                \context Staff << 
                    \override Staff.BarLine.allow-span-bar = ##f % barlines not connected, as in MuseScore
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = ""
                
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

