\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from prokimen_t8_huwelijkskroning_timesig.musicxml
\pointAndClickOff

\header {
    title = "Prokimen van de huwelijkskroning"
    subtitle = "toon 8"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative bes' {
    \clef "treble" \time 8/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp bes2 \stemUp a2 \stemUp f2 \stemUp g2 | % 2
    \time 15/4 \omit Staff.TimeSignature \stemUp a4 \stemUp a4 \stemUp a4
    \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4 \stemUp bes2 \stemUp bes4
    \stemUp bes4 a1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t
    "Op " __\skip1 hun hoofd hebt Gij een kroon van e -- del -- ste --
    nen ge -- plaatst
    }

PartPOneVoiceTwo =  \relative g' {
    \clef "treble" \time 8/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown g2 f1 \stemDown e2 | % 2
    \time 15/4 \omit Staff.TimeSignature \stemDown f4 \stemDown f4
    \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4
    \stemDown d2 \stemDown d4 \stemDown d4 e1 \bar "|."
    }

PartPTwoVoiceOne =  \relative d' {
    \clef "bass" \time 8/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemUp d2 c1 \stemUp c2 | % 2
    \time 15/4 \omit Staff.TimeSignature \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp bes2 \stemUp bes4
    \stemUp d4 cis1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative g {
    \clef "bass" \time 8/4 \omit Staff.TimeSignature \key f \major | % 1
    \stemDown g2 \stemDown f2 \stemDown d2 \stemDown c2 | % 2
    \time 15/4 \omit Staff.TimeSignature \stemDown f4 \stemDown f4
    \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4
    \stemDown g2 \stemDown g4 \stemDown g4 <a, a'>1 \bar "|."
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

