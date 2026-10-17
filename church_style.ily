\version "2.26.0"
% House style for the generated .ly files (musicxml2ly output);
% each of them does \include "church_style.ily" after \version.

% true when the score's \header sets a subtitle
#(define (has-subtitle? layout props)
   (chain-assoc-get 'header:subtitle props #f))

\paper {
  % Helvetica for all text (LilyPond 2.26 syntax; 2.24 used set-global-fonts)
  property-defaults.fonts.serif = "Helvetica"
  property-defaults.fonts.sans = "Helvetica"
  % first system starts at the margin like the others
  indent = 0
  % no footer ("Music engraving by LilyPond ..." tagline)
  oddFooterMarkup = ##f
  evenFooterMarkup = ##f
  % with a subtitle (e.g. "toon N"): title on the left, subtitle on the
  % right, on one line; without one: title centered
  bookTitleMarkup = \markup \column {
    \if #has-subtitle? \fill-line {
      \fontsize #4 \bold \fromproperty #'header:title
      \fromproperty #'header:subtitle
    }
    \unless #has-subtitle? \fill-line {
      \fontsize #4 \bold \fromproperty #'header:title
    }
  }
}

% Engraver for the Score context: drops the verse numbers if they are all
% "1.", i.e. if the score has a single verse.
#(define (only-several-stanza-numbers context)
   (let ((numbers '()))
     (make-engraver
      (acknowledgers
       ((stanza-number-interface engraver grob source-engraver)
        (set! numbers (cons grob numbers))))
      ((finalize engraver)
       (if (every (lambda (g) (equal? (ly:grob-property g 'text) "1.")) numbers)
           (for-each ly:grob-suicide! numbers))))))

\layout {
  \context {
    % no staff names ("Women"/"Men" set by musicxml2ly)
    \Staff
    \remove "Instrument_name_engraver"
  }
  \context {
    % verse numbers ("1.", "2.", ... set by musicxml2ly) only when there
    % is more than one verse
    \Score
    \consists #only-several-stanza-numbers
    % text at a barline (repeat counts like "3×" from \textEndMark) at
    % the lyrics' size; LilyPond's default is smaller
    \override TextMark.font-size = #(* 6 (/ (log (/ 14 11)) (log 2)))
  }
  \context {
    \Lyrics
    % 14pt: text is 11pt at the default staff size 20, and each
    % font-size step scales by 2^(1/6)
    \override LyricText.font-size = #(* 6 (/ (log (/ 14 11)) (log 2)))
    % more room between syllables and around hyphens for the larger text
    % (with 2.26 this needed 1.4 while the Heer ik roep tones ended with a
    % measure alone; since the densest odd measure stands alone, 1.6 fits)
    \override LyricSpace.minimum-distance = #1.6
    \override LyricHyphen.minimum-distance = #1.6
  }
}
