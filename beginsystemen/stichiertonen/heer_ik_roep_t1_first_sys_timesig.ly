\version "2.24.4"
% automatically converted by musicxml2ly from heer_ik_roep_t1_first_sys_timesig.musicxml
\pointAndClickOff

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
PartPOneVoiceOne =  \relative bes' {
    \clef "treble" \time 14/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp bes2 ( ^ "Toon 1" \stemUp c2 ) \stemUp bes4 \stemUp bes4
    \stemUp bes4 \stemUp bes4 \stemUp g4 \stemUp a2 ( \stemUp g4 )
    \stemUp f2 | % 2
    \time 7/4 \omit Staff.TimeSignature \stemUp a4 \stemUp a2 \stemUp
    bes4 \stemUp bes4 \stemUp g2 \bar "|."
    }

PartPOneVoiceTwo =  \relative g' {
    \clef "treble" \time 14/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown g2 ( \stemDown a2 ) \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown e4 \stemDown f2 ( \stemDown e4 ) \stemDown d2
    | % 2
    \time 7/4 \omit Staff.TimeSignature \stemDown f4 \stemDown f2
    \stemDown g4 \stemDown g4 \stemDown e2 \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \clef "bass" \time 14/4 \omit Staff.TimeSignature \key f \major | % 1
    c1 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c2.
    \stemUp a2 | % 2
    \time 7/4 \omit Staff.TimeSignature \stemUp c4 \stemUp c2 \stemUp c4
    \stemUp c4 \stemUp c2 \bar "|."
    }

PartPTwoVoiceTwo =  \relative c {
    \clef "bass" \time 14/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown c2 ( \stemDown f2 ) \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown c4 \stemDown f2 ( \stemDown c4 ) \stemDown d2
    | % 2
    \time 7/4 \omit Staff.TimeSignature \stemDown f4 \stemDown f2
    \stemDown c4 \stemDown c4 \stemDown c2 \bar "|."
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

