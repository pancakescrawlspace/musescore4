\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from canon_van_de_geboorte_v23_timesig.musicxml
\pointAndClickOff

\header {
    title = "Canon van de Geboorte van de Moeder Gods"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \clef "treble" \time 20/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemUp g4 \stemUp g2 \stemUp g4 \stemUp fis4 \stemUp g4 \stemUp fis4
    \stemUp e2 \stemUp e4 \stemUp g4 \stemUp a4 \stemUp a4 \stemUp a4
    \stemUp g2 \stemUp fis4 \stemUp fis4 \stemUp g2 | % 2
    \time 16/4 \omit Staff.TimeSignature \stemUp a4 \stemUp a4 \stemUp a2
    \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4
    \stemUp g4 \stemUp a4 \stemUp b2 \stemUp g2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemUp g2 \stemUp g4 \stemUp g4
    \stemUp fis4 \stemUp g4 \stemUp fis4 \stemUp e2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemUp fis4 \stemUp fis4
    \stemUp g4 \stemUp g4 \stemUp g4 \stemUp g4 \stemUp g4 \stemUp g4
    \stemUp a2 \stemUp g2 fis1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t Mijn
    mond zal ik o -- pe -- nen en ver vuld van de Hei -- li -- ge Geest
    wil ik U de ko -- nin -- klij -- ke Moe -- der be -- zin -- gen
    feest -- vie -- ren vol "blijd " __\skip1 schap en ver -- heugd Uw
    ge -- boor -- te be -- "zin " __\skip1 gen
    }

PartPOneVoiceTwo =  \relative d' {
    \clef "treble" \time 20/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemDown d4 \stemDown d2 \stemDown d4 \stemDown d4 \stemDown d4
    \stemDown d4 \stemDown e2 \stemDown e4 \stemDown e4 \stemDown fis4
    \stemDown fis4 \stemDown fis4 \stemDown d2 \stemDown d4 \stemDown d4
    \stemDown d2 | % 2
    \time 16/4 \omit Staff.TimeSignature \stemDown fis4 \stemDown fis4
    \stemDown fis2 \stemDown fis4 \stemDown fis4 \stemDown fis4
    \stemDown fis4 \stemDown fis4 \stemDown fis4 \stemDown g4 \stemDown
    g4 \stemDown g2 \stemDown d2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemDown d2 \stemDown d4
    \stemDown d4 \stemDown d4 \stemDown d2 \stemDown e2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemDown d4 \stemDown d4
    \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4
    \stemDown d4 d1 d1 \bar "|."
    }

PartPTwoVoiceOne =  \relative b {
    \clef "bass" \time 20/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemUp b4 \stemUp b2 \stemUp b4 \stemUp a4 \stemUp b4 \stemUp a4
    \stemUp g2 \stemUp g4 \stemUp b4 \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp b2 \stemUp a4 \stemUp a4 \stemUp b2 | % 2
    \time 16/4 \omit Staff.TimeSignature \stemUp c4 \stemUp c4 \stemUp c2
    \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp b4 \stemUp c4 \stemUp d2 \stemUp b2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemUp b2 \stemUp b4 \stemUp b4
    \stemUp a4 \stemUp b4 \stemUp a4 \stemUp g2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemUp a4 \stemUp a4 \stemUp b4
    \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b4 \stemUp c2
    \stemUp b2 a1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative g {
    \clef "bass" \time 20/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemDown g4 \stemDown g2 \stemDown g4 \stemDown d4 \stemDown g4
    \stemDown d4 \stemDown e2 \stemDown e4 \stemDown e4 \stemDown d4
    \stemDown d4 \stemDown d4 \stemDown g2 \stemDown d4 \stemDown d4
    \stemDown g2 | % 2
    \time 16/4 \omit Staff.TimeSignature \stemDown d4 \stemDown d4
    \stemDown d2 \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4
    \stemDown d4 \stemDown d4 \stemDown g4 \stemDown g4 \stemDown g2
    \stemDown g2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemDown g2 \stemDown g4
    \stemDown g4 \stemDown d4 \stemDown g4 \stemDown d4 \stemDown e2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemDown d4 \stemDown d4
    \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown fis2 \stemDown g2 d1 \bar "|."
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
                    \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = "1." \PartPOneVoiceOneLyricsOne }
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

