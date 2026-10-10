\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from megalinarion_geboorte_timesig.musicxml
\pointAndClickOff

\header {
    title = "Megalinarion van de Geboorte van de Moeder Gods"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative a' {
    \clef "treble" \time 14/4 \omit Staff.TimeSignature \key c \major | % 1
    \stemUp a4 ( \stemUp b4 ) \stemUp c2 \stemUp b4 \stemUp c4 \stemUp a2
    \stemUp b4 ( \stemUp c4 ) \stemUp d4 \stemUp b4 \stemUp c2 | % 2
    \time 13/4 \omit Staff.TimeSignature \stemUp a4 \stemUp c2 \stemUp b4
    \stemUp c4 \stemUp d2 ( \stemUp c4 ) \stemUp b4 \stemUp a4 ( \stemUp
    gis4 ) \stemUp a2 | % 3
    \time 24/4 \omit Staff.TimeSignature \stemUp a4 \stemUp b8 ( [
    \stemUp c8 ] \stemUp d4 ) \stemUp c4 \stemUp b2 \stemUp b2 \stemUp b4
    ( \stemUp c4 ) \stemUp d4 ( \stemUp e4 \stemUp d4 ) \stemUp c4
    \stemUp b4 \stemUp a4 \stemUp c2 \stemUp b2 a1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t
    "Ver " __\skip1 hef o mijn ziel "met " __\skip1 ju -- bel -- zang
    ver -- hef o mijn "ziel " __\skip1 met ju -- bel -- zang de "glo "
    __\skip1 \skip1 rie -- rij -- ke "ge " __\skip1 "boor " __\skip1
    \skip1 te van de Moe -- der Gods
    }

PartPOneVoiceTwo =  \relative e' {
    \clef "treble" \time 14/4 \omit Staff.TimeSignature \key c \major | % 1
    \stemDown e4 ( \stemDown g4 ) \stemDown g2 \stemDown g2 \stemDown e2
    \stemDown g2 \stemDown g4 \stemDown g4 \stemDown g2 | % 2
    \time 13/4 \omit Staff.TimeSignature \stemDown a4 \stemDown a2
    \stemDown a2 \stemDown a2. \stemDown f4 \stemDown e2 \stemDown e2 | % 3
    \time 24/4 \omit Staff.TimeSignature \stemDown e4 \stemDown g2
    \stemDown g4 \stemDown g2 \stemDown g2 \stemDown g2 \stemDown g2 (
    \stemDown g2 ) \stemDown e4 \stemDown e4 \stemDown e4 ( \stemDown a4
    ) \stemDown e4 ( \stemDown gis4 ) a1 \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
    \clef "bass" \time 14/4 \omit Staff.TimeSignature \key c \major | % 1
    \stemUp c4 ( \stemUp d4 ) \stemUp e2 \stemUp d4 \stemUp e4 \stemUp c2
    \stemUp d4 ( \stemUp e4 ) \stemUp f4 \stemUp d4 \stemUp e2 | % 2
    \time 13/4 \omit Staff.TimeSignature \stemUp c4 \stemUp e2 \stemUp d4
    \stemUp e4 \stemUp f2 ( \stemUp e4 ) \stemUp d4 \stemUp c4 ( \stemUp
    b4 ) \stemUp c2 | % 3
    \time 24/4 \omit Staff.TimeSignature \stemUp c4 \stemUp d8 ( [
    \stemUp e8 ] \stemUp f4 ) \stemUp e4 \stemUp d2 \stemUp d2 \stemUp d4
    ( \stemUp e4 ) \stemUp f4 ( \stemUp g4 \stemUp f4 ) \stemUp e4
    \stemUp d4 \stemUp c4 \stemUp e2 \stemUp d2 c1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative a {
    \clef "bass" \time 14/4 \omit Staff.TimeSignature \key c \major | % 1
    \stemDown a4 ( \stemDown g4 ) \stemDown c,2 \stemDown g'2 \stemDown
    a2 \stemDown g2 \stemDown g4 \stemDown g4 \stemDown c,2 | % 2
    \time 13/4 \omit Staff.TimeSignature \stemDown a'4 \stemDown a2
    \stemDown a2 \stemDown d,4 ( \stemDown b4 \stemDown c4 ) \stemDown d4
    \stemDown e2 \stemDown a2 | % 3
    \time 24/4 \omit Staff.TimeSignature \stemDown a4 \stemDown g4 (
    \stemDown b4 ) \stemDown c4 \stemDown g2 \stemDown g2 \stemDown g2
    \stemDown g2 ( \stemDown g4 ) \stemDown g4 \stemDown gis4 \stemDown
    a4 \stemDown e2 \stemDown e2 a1 \bar "|."
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

