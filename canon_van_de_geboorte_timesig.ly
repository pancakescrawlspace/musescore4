\version "2.24.4"
\include "church_style.ily"
% automatically converted by musicxml2ly from canon_van_de_geboorte_timesig.musicxml
% hand edits after conversion: the \include above and the \header title/subtitle (replacing musicxml2ly's title and composer)
\pointAndClickOff

\header {
    title = "Canon van de Geboorte van de Moeder Gods"
    encodingsoftware =  "MuseScore Studio 4.7.5"
    encodingdate =  "2026-10-10"
    }

\layout {
    \context { \Score
        skipBars = ##t
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \clef "treble" \time 20/4 \omit Staff.TimeSignature \key g \major
    \stopStaff \override Staff.StaffSymbol.line-count = #5 \startStaff | % 1
    R1*5 | % 2
    \time 16/4 \omit Staff.TimeSignature R1*4 | % 3
    \time 9/4 \omit Staff.TimeSignature R4*9 | % 4
    \time 16/4 \omit Staff.TimeSignature R1*4 \bar "|."
    }

PartPTwoVoiceOne =  \relative g' {
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

PartPTwoVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t Mijn
    mond zal ik o -- pe -- nen en ver vuld van de Hei -- li -- ge Geest
    wil ik U de ko -- nin -- klij -- ke Moe -- der be -- zin -- gen
    feest -- vie -- ren vol "blijd " __\skip1 schap en ver -- heugd Uw
    ge -- boor -- te be -- "zin " __\skip1 gen
    }

PartPTwoVoiceTwo =  \relative d' {
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

PartPThreeVoiceOne =  \relative b {
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

PartPThreeVoiceTwo =  \relative g {
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
        
        \new Staff
        <<
            \set Staff.instrumentName = "Voice"
            \set Staff.shortInstrumentName = "Vo."
            
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                >>
            >>
        \new Staff
        <<
            \set Staff.instrumentName = "Women"
            \set Staff.shortInstrumentName = "W."
            
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPTwoVoiceOne" {  \voiceOne \PartPTwoVoiceOne }
                \new Lyrics \lyricsto "PartPTwoVoiceOne" { \set stanza = "1." \PartPTwoVoiceOneLyricsOne }
                \context Voice = "PartPTwoVoiceTwo" {  \voiceTwo \PartPTwoVoiceTwo }
                >>
            >>
        \new Staff
        <<
            \set Staff.instrumentName = "Men"
            \set Staff.shortInstrumentName = "M."
            
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPThreeVoiceOne" {  \voiceOne \PartPThreeVoiceOne }
                \context Voice = "PartPThreeVoiceTwo" {  \voiceTwo \PartPThreeVoiceTwo }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

