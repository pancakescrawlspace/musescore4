\version "2.26.0"
% automatically converted by musicxml2ly from heer_ik_roep_t4_first_sys_timesig.musicxml
\pointAndClickOff
% build, in this directory, with LilyPond 2.26:
%   lilypond heer_ik_roep_t4_first_sys_timesig.ly

% LilyPond 2.24's side margins (2.26 has 15mm), as when this was first made
\paper { left-margin = 10\mm right-margin = 10\mm }

\header {
    title =  "Untitled score"
    composer =  "Composer / arranger"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \clef "treble" \time 10/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp g4 ^ "Toon 4" \stemUp g4 \stemUp g4 \stemUp g4 \stemUp g4
    \stemUp g4 \stemUp a2 \stemUp a2 | % 2
    \time 7/4 \omit Staff.TimeSignature \stemUp bes4 \stemUp bes2
    \stemUp bes4 \stemUp bes4 \stemUp a2 \bar "|."
    }

PartPOneVoiceTwo =  \relative e' {
    \clef "treble" \time 10/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown e4 \stemDown e4 \stemDown e4 \stemDown e4 \stemDown e4
    \stemDown e4 \stemDown f2 \stemDown f2 | % 2
    \time 7/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g2
    \stemDown g4 \stemDown g4 \stemDown f2 \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \clef "bass" \time 10/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp c2 \stemUp c2 | % 2
    \time 7/4 \omit Staff.TimeSignature \stemUp c4 \stemUp c2 \stemUp c4
    \stemUp c4 \stemUp c2 \bar "|."
    }

PartPTwoVoiceTwo =  \relative c {
    \clef "bass" \time 10/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown f2 \stemDown f2 | % 2
    \time 7/4 \omit Staff.TimeSignature \stemDown c4 \stemDown c2
    \stemDown c4 \stemDown c4 \stemDown f2 \bar "|."
    }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = "Women"
                
                \context Staff << 
                    \override Staff.BarLine.allow-span-bar = ##f % barlines not connected, as in MuseScore
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Men"
                
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

