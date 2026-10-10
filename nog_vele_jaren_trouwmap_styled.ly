\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from nog_vele_jaren_trouwmap_styled.musicxml
\pointAndClickOff

\header {
    title = "Nog vele jaren"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \numericTimeSignature\time 4/4 \key c \major | % 1
    \stemUp c4 \stemUp c8 [ \stemUp c8 ] \stemUp c4 \stemUp b4 | % 2
    \stemUp a4 \stemUp a8 [ \stemUp a8 ] \stemUp a4 \stemUp gis4 | % 3
    \stemUp a8 [ \stemUp gis8 \stemUp a8 \stemUp b8 ] \stemUp c8 [
    \stemUp b8 \stemUp c8 \stemUp d8 ] | % 4
    \stemUp c4 \stemUp b4 \stemUp c4 \stemUp d4 | % 5
    c1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t Nog
    ve -- le ja -- "ren," nog ve -- le ja -- "ren," "nog " __\skip1
    \skip1 \skip1 \skip1 \skip1 ve -- le "ja " __\skip1 \skip1 \skip1
    "ren!"
    }

PartPOneVoiceTwo =  \relative g' {
    \clef "treble" \numericTimeSignature\time 4/4 \key c \major | % 1
    \stemDown g4 \stemDown g8 [ \stemDown g8 ] \stemDown g4 \stemDown g4
    | % 2
    \stemDown e4 \stemDown e8 [ \stemDown e8 ] \stemDown e4 \stemDown e4
    | % 3
    \stemDown c4 \stemDown f4 \stemDown gis4 \stemDown gis8 [ \stemDown
    gis8 ] | % 4
    g1 | % 5
    g1 \bar "|."
    }

PartPTwoVoiceOne =  \relative e' {
    \clef "bass" \numericTimeSignature\time 4/4 \key c \major | % 1
    \stemUp e4 \stemUp e8 [ \stemUp e8 ] \stemUp e4 \stemUp d4 | % 2
    \stemUp c4 \stemUp c8 [ \stemUp c8 ] \stemUp c4 \stemUp b4 | % 3
    \stemUp a8 [ \stemUp b8 \stemUp c8 \stemUp d8 ] \stemUp e8 [ \stemUp
    d8 \stemUp e8 \stemUp f8 ] | % 4
    \stemUp e4 \stemUp d4 \stemUp e4 \stemUp f4 | % 5
    e1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative c' {
    \clef "bass" \numericTimeSignature\time 4/4 \key c \major | % 1
    \stemDown c4 \stemDown c,8 [ \stemDown e8 ] \stemDown g4 \stemDown g4
    | % 2
    \stemDown g4 \stemDown a,8 [ \stemDown c8 ] \stemDown e4 \stemDown e4
    | % 3
    \stemDown f2 ( \stemDown e8 [ \stemDown g8 ) \stemDown e8 \stemDown
    c8 ] | % 4
    g'1 | % 5
    c,1 \bar "|."
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

