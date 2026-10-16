\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from zegen_mijn_ziel_de_heer.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

\header {
    title = "Zegen, mijn ziel, de Heer"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-16"
    }

\layout {
    \context { \Score
        skipBars = ##t
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative fis' {
    \clef "treble" \time 33/8 \omit Staff.TimeSignature \key d \major | % 1
    \stemUp fis4 \stemUp fis4 \stemUp g4 \stemUp a4 \stemUp b8 [ \stemUp
    a8 ] \stemUp g4 \stemUp fis8 [ \stemUp g8 ] \stemUp a4. \stemUp b8
    \stemUp c4 \stemUp b4 \stemUp a4 \stemUp g8 [ \stemUp fis8 ] \stemUp
    g4 \stemUp g4 \stemUp fis4. | % 2
    \time 4/4 \omit Staff.TimeSignature R1*31 \bar "|."
    }

PartPOneVoiceTwo =  \relative d' {
    \clef "treble" \time 33/8 \omit Staff.TimeSignature \key d \major | % 1
    \stemDown d4 \stemDown d4 \stemDown e4 \stemDown fis4 \stemDown g8 [
    \stemDown fis8 ] \stemDown e4 \stemDown d8 [ \stemDown e8 ]
    \stemDown fis4. \stemDown g8 \stemDown a4 \stemDown g4 \stemDown fis4
    \stemDown e8 [ \stemDown d8 ] \stemDown e4 \stemDown e4 \stemDown d4.
    | % 2
    \time 4/4 \omit Staff.TimeSignature s1*31 \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \clef "bass" \time 33/8 \omit Staff.TimeSignature \key d \major | % 1
    R8*33 | % 2
    \time 4/4 \omit Staff.TimeSignature R1*31 \bar "|."
    }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = "Women"
                \set Staff.shortInstrumentName = "W."
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Men"
                \set Staff.shortInstrumentName = "M."
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPTwoVoiceOne" {  \PartPTwoVoiceOne }
                    >>
                >>
            
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

