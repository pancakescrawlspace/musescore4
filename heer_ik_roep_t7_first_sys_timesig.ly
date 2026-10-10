\version "2.24.4"
\include "heer_ik_roep_style.ily"
% automatically converted by musicxml2ly from heer_ik_roep_t7_first_sys_timesig.musicxml
\pointAndClickOff

\header {
    title = "Heer ik roep"
    subtitle = "toon 7"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
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
                \set Staff.instrumentName = "Women"
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Men"
                
                \context Staff << 
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

