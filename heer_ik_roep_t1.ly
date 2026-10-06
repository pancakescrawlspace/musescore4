\version "2.24.4"
% automatically converted by musicxml2ly from heer_ik_roep_t1.musicxml
\pointAndClickOff

\header {
%Rene: deleted stuff here
    }

#(set-global-staff-size 20.0)
\paper {
  ragged-bottom = ##t
  ragged-last-bottom = ##t    
    paper-width = 21.01\cm
    paper-height = 29.69\cm
    top-margin = 1.5\cm
    bottom-margin = 1.5\cm
    left-margin = 1.5\cm
    right-margin = 1.5\cm
    indent = 0 % Rene
    short-indent = 0 % Rene
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative bes' {
  \omit Staff.TimeSignature % Rene
    \clef "treble" \key f \major | % 1
    \cadenzaOn % Rene
    \stemUp bes2 ( \stemUp c2 ) \stemUp bes4 \stemUp bes4 \stemUp bes4
    \stemUp bes4 \stemUp g4 \stemUp a2 ( \stemUp g4 ) \stemUp f2 \bar "|" | % 2
    \stemUp a4 \stemUp a2 \stemUp bes4 \stemUp bes4 \stemUp g2 \break | % 3
    \stemUp bes2 \stemUp bes4 \stemUp bes4 \stemUp bes4 \stemUp bes4
    \stemUp bes4 \stemUp a2 \stemUp g2 | % 4
    \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4 \stemUp g2 \stemUp g4
    \stemUp a4 \stemUp bes2 ( \stemUp a2 ) \stemUp g2 \break | % 5
    \stemUp bes4 \stemUp bes2 ( \stemUp c2 ) \stemUp bes4 \stemUp g4
    \stemUp a2 ( \stemUp g4 ) \stemUp f2 | % 6
    \stemUp bes2 \stemUp a2 \stemUp g4 \stemUp g4 f1 \break | % 7
    \stemUp bes2 ( \stemUp c2 ) \stemUp bes4 \stemUp bes4 \stemUp bes4
    \stemUp g4 \stemUp a2 ( \stemUp g4 ) \stemUp f2 | % 8
    \stemUp a4 \stemUp a4 \stemUp a4 \stemUp a4 \stemUp g4 \stemUp a2
    \stemUp bes2 \stemUp g2 \break | % 9
    \stemUp bes4 \stemUp bes4 \stemUp bes4 \stemUp bes4 \stemUp bes4
    \stemUp bes4 \stemUp a2 \stemUp g2 | \barNumberCheck #10
    \stemUp a4 \stemUp a4 \stemUp g2 \stemUp a2 \stemUp bes2 ( \stemUp a2
    ) \stemUp g2 | % 11
    \stemUp bes2 \stemUp a2 \stemUp g4 \stemUp g4 f1 \bar "|."
    }

PartPOneVoiceTwo =  \relative g' {
  \omit Staff.TimeSignature
    \clef "treble" \key f \major | % 1
    \cadenzaOn
    \stemDown g2 ( \stemDown a2 ) \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown e4 \stemDown f2 ( \stemDown e4 ) \stemDown d2
    | % 2
    \stemDown f4 \stemDown f2 \stemDown g4 \stemDown g4 \stemDown e2
    \break | % 3
    \stemDown g2 \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown f2 \stemDown e2 | % 4
    \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown e2
    \stemDown e4 \stemDown f4 \stemDown g2 ( \stemDown f2 ) \stemDown e2
    \break | % 5
    \stemDown g4 \stemDown g2 ( \stemDown a2 ) \stemDown g4 \stemDown e4
    \stemDown f2 ( \stemDown e4 ) \stemDown d2 | % 6
    \stemDown g2 \stemDown f2 \stemDown e4 \stemDown e4 d1 \break | % 7
    \stemDown g2 ( \stemDown a2 ) \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown e4 \stemDown f2 ( \stemDown e4 ) \stemDown d2 | % 8
    \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown e4
    \stemDown f2 \stemDown g2 \stemDown e2 \break | % 9
    \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4 \stemDown g4
    \stemDown g4 \stemDown f2 \stemDown e2 | \barNumberCheck #10
    \stemDown f4 \stemDown f4 \stemDown e2 \stemDown f2 \stemDown g2 (
    \stemDown f2 ) \stemDown e2 | % 11
    \stemDown g2 \stemDown f2 \stemDown e4 \stemDown e4 d1 \bar "|."
    }

PartPTwoVoiceOne =  \relative c' {
  \omit Staff.TimeSignature
    \clef "bass" \key f \major | % 1
    \cadenzaOn
    c1 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c2.
    \stemUp a2 | % 2
    \stemUp c4 \stemUp c2 \stemUp c4 \stemUp c4 \stemUp c2 \break | % 3
    \stemUp c2 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp c2 \stemUp c2 | % 4
    \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c2 \stemUp c4
    \stemUp c4 c1 \stemUp c2 \break | % 5
    \stemUp c4 c1 \stemUp c4 \stemUp c4 \stemUp c2. \stemUp a2 | % 6
    \stemUp d2 \stemUp d2 \stemUp cis4 \stemUp cis4 a1 \break | % 7
    c1 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c2. \stemUp a2
    | % 8
    \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c2
    \stemUp c2 \stemUp c2 \break | % 9
    \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4 \stemUp c4
    \stemUp c2 \stemUp c2 | \barNumberCheck #10
    \stemUp c4 \stemUp c4 \stemUp c2 \stemUp c2 c1 \stemUp c2
    | % 11
    \stemUp d2 \stemUp d2 \stemUp cis4 \stemUp cis4 a1 \bar "|."
    }

PartPTwoVoiceTwo =  \relative c {
  \omit Staff.TimeSignature
    \cadenzaOn
    \clef "bass" \key f \major | % 1
    \stemDown c2 ( \stemDown f2 ) \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown c4 \stemDown f2 ( \stemDown c4 ) \stemDown d2
    | % 2
    \stemDown f4 \stemDown f2 \stemDown c4 \stemDown c4 \stemDown c2
    \break | % 3
    \stemDown c2 \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown f2 \stemDown c2 | % 4
    \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown c2
    \stemDown c4 \stemDown f4 \stemDown e2 ( \stemDown f2 ) \stemDown c2
    \break | % 5
    \stemDown c4 \stemDown c2 ( \stemDown f2 ) \stemDown c4 \stemDown c4
    \stemDown f2 ( \stemDown c4 ) \stemDown d2 | % 6
    \stemDown g2 \stemDown a2 \stemDown a,4 \stemDown a4 d1 \break | % 7
    \stemDown c2 ( \stemDown f2 ) \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown f2 ( \stemDown c4 ) \stemDown d2 | % 8
    \stemDown f4 \stemDown f4 \stemDown f4 \stemDown f4 \stemDown c4
    \stemDown f2 \stemDown c2 \stemDown c2 \break | % 9
    \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4
    \stemDown c4 \stemDown f2 \stemDown c2 | \barNumberCheck #10
    \stemDown f4 \stemDown f4 \stemDown c2 \stemDown f2 \stemDown e2 (
    \stemDown f2 ) \stemDown c2 | % 11
    \stemDown g'2 \stemDown a2 \stemDown a,4 \stemDown a4 d1 \bar "|."
    }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = ""
                \set Staff.shortInstrumentName = ""
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo \PartPOneVoiceTwo }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = ""
                \set Staff.shortInstrumentName = ""
                
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

