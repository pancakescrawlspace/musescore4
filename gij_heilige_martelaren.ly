\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from gij_heilige_martelaren.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

\header {
    title = "Gij heilige Martelaren"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-16"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative a' {
    \clef "treble" \time 10/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemUp a4 \stemUp b4 \stemUp b4 \stemUp a4 \stemUp g4 \stemUp g4
    \stemUp g4 \stemUp a4 \stemUp b2 | % 2
    \time 11/4 \omit Staff.TimeSignature \stemUp b4 \stemUp b4 \stemUp b4
    \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b4 \stemUp b2 \stemUp a2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemUp a4 \stemUp b4 \stemUp a4
    \stemUp g4 \stemUp g4 \stemUp g4 \stemUp a4 \stemUp b2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemUp b4 \stemUp b4 \stemUp b4
    \stemUp b4 \stemUp b4 \stemUp a2 \stemUp g4 \stemUp fis4 \stemUp g4
    \stemUp g2 fis1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t Gij
    hei -- li -- ge mar -- te -- "la " __\skip1 ren die de goe -- de
    strijd hebt ge -- stre -- den en die uw kroon ont -- van -- gen hebt
    bidt de Heer om de red -- ding on -- zer zie -- "len!"
    }

PartPOneVoiceTwo =  \relative fis' {
    \clef "treble" \time 10/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemDown fis4 \stemDown g4 \stemDown g4 \stemDown fis4 \stemDown e4
    \stemDown e4 \stemDown e4 \stemDown fis4 \stemDown g2 | % 2
    \time 11/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g2 \stemDown fis2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemDown fis4 \stemDown g4
    \stemDown fis4 \stemDown e4 \stemDown e4 \stemDown e4 \stemDown fis4
    \stemDown g2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown g4 \stemDown g4 \stemDown fis2 \stemDown e4
    \stemDown d4 \stemDown e4 \stemDown e2 d1 \bar "|."
    }

PartPTwoVoiceOne =  \relative d' {
    \clef "bass" \time 10/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemUp d4 \stemUp d4 \stemUp d4 \stemUp d4 \stemUp b4 \stemUp b4
    \stemUp b4 \stemUp d4 \stemUp d2 | % 2
    \time 11/4 \omit Staff.TimeSignature \stemUp d4 \stemUp d4 \stemUp d4
    \stemUp d4 \stemUp d4 \stemUp d4 \stemUp d4 \stemUp d2 \stemUp d2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemUp d4 \stemUp d4 \stemUp d4
    \stemUp b4 \stemUp b4 \stemUp b4 \stemUp d4 \stemUp d2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemUp d4 \stemUp d4 \stemUp d4
    \stemUp d4 \stemUp d4 \stemUp d2 \stemUp a4 \stemUp a4 \stemUp a4
    \stemUp a2 a1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative d {
    \clef "bass" \time 10/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemDown d4 \stemDown g4 \stemDown g4 \stemDown d4 \stemDown e4
    \stemDown e4 \stemDown e4 \stemDown d4 \stemDown g2 | % 2
    \time 11/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g2 \stemDown d2 | % 3
    \time 9/4 \omit Staff.TimeSignature \stemDown d4 \stemDown g4
    \stemDown d4 \stemDown e4 \stemDown e4 \stemDown e4 \stemDown d4
    \stemDown g2 | % 4
    \time 16/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown g4 \stemDown g4 \stemDown d2 \stemDown cis4
    \stemDown d4 \stemDown a4 \stemDown a2 d1 \bar "|."
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
                    \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = "1." \PartPOneVoiceOneLyricsOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Men"
                \set Staff.shortInstrumentName = "M."
                
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

