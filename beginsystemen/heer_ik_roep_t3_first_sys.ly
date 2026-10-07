\version "2.24.4"
% automatically converted by musicxml2ly from heer_ik_roep_t3_first_sys.musicxml
\pointAndClickOff

\layout {
    indent = 0 %rene
    ragged-last = ##f %rene
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \omit Staff.TimeSignature %rene
    \clef "treble" \key f \major | % 1
    \time 13/4
    \stemUp g2 ^ "Toon 3" \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4
    \stemUp bes4 \stemUp a2 ( \stemUp g4 \stemUp f4 ) \stemDown g2 | % 2
    \time 10/4
    \stemUp g4 \stemUp g2. ( \stemUp a4 ) \stemUp g2 \stemUp f4 \stemUp
    e2 \bar "|."
    }

PartPOneVoiceTwo =  \relative e' {
    \clef "treble" \key f \major | % 1
    \stemDown e2 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4
    \stemDown g4 \stemDown f2 ( \stemDown e4 \stemDown d4 ) \stemDown e2
    | % 2
    \stemDown e4 \stemDown e2. ( \stemDown f4 ) \stemDown e2 \stemDown d4
    \stemDown c2 \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \omit Staff.TimeSignature %rene
    \clef "bass" \key f \major | % 1
    \stemUp c2 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 c1
    \stemUp c2 | % 2
    \stemUp c4 c1 \stemUp c2 \stemUp b4 \stemUp g2 \bar "|."
    }

PartPTwoVoiceTwo =  \relative c {
    \clef "bass" \key f \major | % 1
    \stemDown c2 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4
    \stemDown f4 \stemDown f2 ( \stemDown c2 ) \stemDown c2 | % 2
    \stemDown c4 \stemDown c2. ( \stemDown f4 ) \stemDown g2 \stemDown
    g,4 \stemDown c2 \bar "|."
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
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = ""
                
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

