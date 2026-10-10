\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from uw_heilig_kruis_timesig.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

\header {
    title = "Uw Heilig Kruis"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative fis' {
    \clef "treble" \time 21/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemUp fis4 \stemUp g2 \stemUp fis2 \stemUp g2 \stemUp a4 ( \stemUp
    b4 ) \stemUp c4 \stemUp b4 \stemUp c4 \stemUp a4 \stemUp b2 (
    \stemUp a2 ) g1 | % 2
    \time 22/4 \omit Staff.TimeSignature \stemUp b4 \stemUp b4 \stemUp a2
    \stemUp g2 \stemUp fis4 \stemUp g4 \stemUp a4. ( \stemUp b8 \stemUp
    a4 ) \stemUp g4 \stemUp fis2 \stemUp g2 \stemUp fis2 g1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t Uw
    hei -- lig kruis "ver " __\skip1 e -- ren wij Ge -- "bie " __\skip1
    der en Uw hei -- li -- ge ver -- "rij " __\skip1 \skip1 ze -- nis lo
    -- ven wij
    }

PartPOneVoiceTwo =  \relative dis' {
    \clef "treble" \time 21/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemDown dis4 \stemDown e2 \stemDown dis2 \stemDown e2 \stemDown
    fis4 ( \stemDown g4 ) \stemDown a4 \stemDown g4 \stemDown a4
    \stemDown fis4 \stemDown g2 ( \stemDown fis2 ) e1 | % 2
    \time 22/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g4
    \stemDown fis2 \stemDown e2 \stemDown dis4 \stemDown e4 \stemDown
    fis4. ( \stemDown g8 \stemDown fis4 ) \stemDown e4 \stemDown dis2
    \stemDown e2 \stemDown dis2 e1 \bar "|."
    }

PartPTwoVoiceOne =  \relative b {
    \clef "bass" \time 21/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemUp b4 \stemUp b2 \stemUp b2 \stemUp b2 \stemUp d2 \stemUp d4
    \stemUp d4 \stemUp d4 \stemUp d4 \stemUp d2 ( \stemUp dis2 ) b1 | % 2
    \time 22/4 \omit Staff.TimeSignature \stemUp d4 \stemUp d4 \stemUp
    dis2 \stemUp b2 \stemUp b4 \stemUp b4 \stemUp d2. \stemUp b4 \stemUp
    b2 \stemUp b2 \stemUp b2 b1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative b, {
    \clef "bass" \time 21/4 \omit Staff.TimeSignature \key g \major | % 1
    \stemDown b4 \stemDown e2 \stemDown b2 \stemDown e2 \stemDown d2
    \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4 \stemDown <g,
        g'>2 ( \stemDown b2 ) e1 | % 2
    \time 22/4 \omit Staff.TimeSignature \stemDown g4 \stemDown g4
    \stemDown b,2 \stemDown e2 \stemDown b4 \stemDown e4 \stemDown d4. (
    \stemDown g8 \stemDown d4 ) \stemDown e4 \stemDown b2 \stemDown e2
    \stemDown b2 <e, e'>1 \bar "|."
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

