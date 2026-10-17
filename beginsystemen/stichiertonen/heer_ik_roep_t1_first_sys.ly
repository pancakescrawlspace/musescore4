\version "2.26.0"
% automatically converted by musicxml2ly from heer_ik_roep_t1_first_sys.musicxml
\pointAndClickOff
% build, in this directory, with LilyPond 2.26:
%   lilypond heer_ik_roep_t1_first_sys.ly
%   lilypond -dbackend=svg -dcrop heer_ik_roep_t1_first_sys.ly
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
PartPOneVoiceOne =  \relative bes' {
    \omit Staff.TimeSignature %rene
    \clef "treble" \key f \major | % 1
    \time 14/4 %rene
    \stemUp bes2 ( ^ "Toon 1" \stemUp c2 ) \stemUp bes4 \stemUp bes4
    \stemUp bes4 \stemUp bes4 \stemUp g4 \stemUp a2 ( \stemUp g4 )
    \stemUp f2 | % 2
    \time 7/4 %rene
    \stemUp a4 \stemUp a2 \stemUp bes4 \stemUp bes4 \stemUp g2 \bar "|."
    }

PartPOneVoiceTwo =  \relative g' {
    \clef "treble" \key f \major | % 1
    \stemDown g2 ( \stemDown a2 ) \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown e4 \stemDown f2 ( \stemDown e4 ) \stemDown d2
    | % 2
    \stemDown f4 \stemDown f2 \stemDown g4 \stemDown g4 \stemDown e2
    \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \omit Staff.TimeSignature %rene
    \clef "bass" \key f \major | % 1
    c1 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c2.
    \stemUp a2 | % 2
    \stemUp c4 \stemUp c2 \stemUp c4 \stemUp c4 \stemUp c2 \bar "|."
    }

PartPTwoVoiceTwo =  \relative c {
    \clef "bass" \key f \major | % 1
    \stemDown c2 ( \stemDown f2 ) \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown c4 \stemDown f2 ( \stemDown c4 ) \stemDown d2
    | % 2
    \stemDown f4 \stemDown f2 \stemDown c4 \stemDown c4 \stemDown c2
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

