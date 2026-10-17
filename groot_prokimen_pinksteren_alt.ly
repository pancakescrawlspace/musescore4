\version "2.26.0"
\include "church_style.ily"
% Alternative layout of groot_prokimen_pinksteren.ly, made by hand from it (not generated, not
% rebuilt by tools/rebuild-score.py): no voltas, but mm1-18 as the piece, followed by a caption
% and the last-time ending (mm19-21) as a separate score.
\pointAndClickOff

\header {
    title = "Groot Prokimen van Pinksteren"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }

% the caption's size: 12pt, a bit smaller than the lyrics (14pt, see church_style.ily)
captionSize = #(* 6 (/ (log (/ 12 11)) (log 2)))

PartPOneVoiceOne =  \relative a' {
    \clef "treble" \time 3/4 \key d \major | % 1
    \stemUp a4 \stemUp a4 \stemUp a4 | % 2
    \stemUp a2. | % 3
    \stemUp a2 \stemUp a4 | % 4
    \stemUp a8. [ \stemUp a16 ] \stemUp a4 r4 | % 5
    \stemUp a4 \stemUp fis4 \stemUp g4 | % 6
    \stemUp a2 \stemUp b8 [ \stemUp a8 ] | % 7
    \stemUp g4. \stemUp fis8 \stemUp e8 [ \stemUp fis8 ] | % 8
    \stemUp g2. | % 9
    \stemUp g4 \stemUp e4 \stemUp fis4 | \barNumberCheck #10
    \stemUp g2 \stemUp g4 | % 11
    \stemUp a2 \stemUp g8 [ \stemUp g8 ] | % 12
    \stemUp fis2 \stemUp cis'4 | % 13
    \stemUp d2 \stemUp cis4 | % 14
    \stemUp d2 \stemUp e4 | % 15
    \stemUp fis2 \stemUp e8 [ \stemUp e8 ] | % 16
    \stemUp d2 \stemUp b8 [ \stemUp e8 ] | % 17
    \stemUp d4. \stemUp cis8 \stemUp b8 [ \stemUp cis8 ] | % 18
    \stemUp d2. \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t Wie
    is een God "groot " __ als on -- ze "God?" Gij zijt de God "die "
    __\skip1 "won " __\skip1 de -- ren "doet," Gij zijt de God die won
    -- de -- ren "doet," Gij zijt de God die won -- de -- ren "doet,"
    "die " __\skip1 "won " __\skip1 de -- ren "doet!"
    }

PartPOneVoiceTwo =  \relative fis' {
    \clef "treble" \time 3/4 \key d \major | % 1
    \stemDown fis4 \stemDown fis4 \stemDown d4 | % 2
    \stemDown e2. | % 3
    \stemDown a4 \stemDown g4 \stemDown fis4 | % 4
    \stemDown fis8. [ \stemDown e16 ] \stemDown e4 r4 | % 5
    \stemDown fis4 \stemDown d4 \stemDown e4 | % 6
    \stemDown fis2 \stemDown g8 [ \stemDown fis8 ] | % 7
    \stemDown e4. \stemDown d8 \stemDown cis8 [ \stemDown d8 ] | % 8
    \stemDown e2. | % 9
    \stemDown e4 \stemDown cis4 \stemDown d4 | \barNumberCheck #10
    \stemDown e2 \stemDown e4 | % 11
    \stemDown fis2 \stemDown e8 [ \stemDown e8 ] | % 12
    \stemDown d2 \stemDown e4 | % 13
    \stemDown fis2 \stemDown a4 | % 14
    \stemDown a2 \stemDown b4 | % 15
    \stemDown a2 \stemDown g8 [ \stemDown g8 ] | % 16
    \stemDown fis2 \stemDown g4 | % 17
    \stemDown fis2 \stemDown g8 [ \stemDown g8 ] | % 18
    \stemDown fis2.
    }

PartPTwoVoiceOne =  \relative d' {
    \clef "bass" \time 3/4 \key d \major | % 1
    \stemUp d4 \stemUp d4 \stemUp d4 | % 2
    \stemUp cis2. | % 3
    \stemUp d4 \stemUp cis4 \stemUp d4 | % 4
    \stemUp d8. [ \stemUp cis16 ] \stemUp cis4 r4 | % 5
    \stemUp a4 \stemUp a4 \stemUp a4 | % 6
    \stemUp a2 \stemUp a4 | % 7
    \stemUp a2 \stemUp a8 [ \stemUp a8 ] | % 8
    \stemUp a2. | % 9
    \stemUp a4 \stemUp a4 \stemUp a4 | \barNumberCheck #10
    \stemUp a2 \stemUp a4 | % 11
    \stemUp a2 \stemUp a8 [ \stemUp a8 ] | % 12
    \stemUp a2 \stemUp a4 | % 13
    \stemUp a2 \stemUp a4 | % 14
    \stemUp d2 \stemUp d4 | % 15
    \stemUp d2 \stemUp cis8 [ \stemUp cis8 ] | % 16
    \stemUp a2 \stemUp b4 | % 17
    \stemUp a2 \stemUp a8 [ \stemUp a8 ] | % 18
    \stemUp a2.
    }

PartPTwoVoiceTwo =  \relative d {
    \clef "bass" \time 3/4 \key d \major | % 1
    \stemDown d4 \stemDown d4 \stemDown fis4 | % 2
    \stemDown a2 \stemDown g4 | % 3
    \stemDown fis4 \stemDown e4 \stemDown d4 | % 4
    \stemDown a'8. [ \stemDown a,16 ] \stemDown a4 r4 | % 5
    \stemDown d4 \stemDown d4 \stemDown d4 | % 6
    \stemDown d2 \stemDown d4 | % 7
    \stemDown a2 \stemDown a8 [ \stemDown a8 ] | % 8
    \stemDown a2. | % 9
    \stemDown a4 \stemDown a4 \stemDown a4 | \barNumberCheck #10
    \stemDown a2 \stemDown a4 | % 11
    \stemDown d2 \stemDown d8 [ \stemDown d8 ] | % 12
    \stemDown d2 \stemDown a4 | % 13
    \stemDown d2 \stemDown e4 | % 14
    \stemDown fis2 \stemDown g4 | % 15
    \stemDown a2 \stemDown a,8 [ \stemDown a8 ] | % 16
    \stemDown d2 \stemDown g4 | % 17
    \stemDown a2 \stemDown a,8 [ \stemDown a8 ] | % 18
    \stemDown d2.
    }

% the last-time ending, mm19-21 of the original (no time signature: it continues the piece)
SlotPOneVoiceOne =  \relative d'' {
    \clef "treble" \time 3/4 \omit Staff.TimeSignature \key d \major | % 19
    \stemUp d2 \stemUp b8 [ \stemUp e8 ] | % 20
    \stemUp d4. \stemUp cis8 \stemUp b8 [ \stemUp cis8 ] | % 21
    \stemUp d2. \bar "|."
    }

SlotPOneVoiceOneLyricsOne =  \lyricmode {\set ignoreMelismata = ##t
    "doet," "die " __\skip1 "won " __\skip1 de -- ren "doet!"
    }

SlotPOneVoiceTwo =  \relative e' {
    \clef "treble" \time 3/4 \omit Staff.TimeSignature \key d \major | % 19
    \stemDown e2 \stemDown g4 | % 20
    \stemDown fis4. \stemDown e8 \stemDown d8 [ \stemDown e8 ] | % 21
    \stemDown fis2.
    }

SlotPTwoVoiceOne =  \relative a {
    \clef "bass" \time 3/4 \omit Staff.TimeSignature \key d \major | % 19
    \stemUp a2 \stemUp b4 | % 20
    \stemUp a2 \stemUp a8 [ \stemUp a8 ] | % 21
    \stemUp a2.
    }

SlotPTwoVoiceTwo =  \relative d {
    \clef "bass" \time 3/4 \omit Staff.TimeSignature \key d \major | % 19
    \stemDown d2 \stemDown g4 | % 20
    \stemDown a2 \stemDown a,8 [ \stemDown a8 ] | % 21
    \stemDown d2.
    }

choir =
#(define-music-function (s1 l1 a1 t1 b1) (ly:music? ly:music? ly:music? ly:music? ly:music?)
   #{
    <<
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = "Women"
                \context Staff <<
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \voiceOne #s1 }
                    \new Lyrics \lyricsto "PartPOneVoiceOne" { #l1 }
                    \context Voice = "PartPOneVoiceTwo" {  \voiceTwo #a1 }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Men"
                \context Staff <<
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPTwoVoiceOne" {  \voiceOne #t1 }
                    \context Voice = "PartPTwoVoiceTwo" {  \voiceTwo #b1 }
                    >>
                >>
            >>
        >>
   #})

\score {
    \choir \PartPOneVoiceOne \PartPOneVoiceOneLyricsOne \PartPOneVoiceTwo
           \PartPTwoVoiceOne \PartPTwoVoiceTwo
    \layout {}
    }

% the \vspace adds room between the caption and the ending below it
\markup \column {
    \fontsize #captionSize \line { De \bold { laatste keer } worden de drie slotmaten als volgt gezongen: }
    \vspace #1
    }

\score {
    \choir \SlotPOneVoiceOne \SlotPOneVoiceOneLyricsOne \SlotPOneVoiceTwo
           \SlotPTwoVoiceOne \SlotPTwoVoiceTwo
    % about as wide as mm16-18 in the last system above
    \layout { line-width = 100\mm ragged-right = ##f ragged-last = ##f }
    }
