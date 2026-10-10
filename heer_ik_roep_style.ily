% House style for the heer_ik_roep_*_timesig.ly files (musicxml2ly output);
% each of them does \include "heer_ik_roep_style.ily" after \version.

\paper {
  % LilyPond 2.24 syntax; 2.25+ uses property-defaults.fonts.serif instead
  #(define fonts
     (set-global-fonts #:roman "Helvetica" #:sans "Helvetica"
                       #:factor (/ staff-height pt 20)))
  % title on the left, subtitle ("toon N") on the right, on one line
  bookTitleMarkup = \markup \fill-line {
    \fontsize #4 \bold \fromproperty #'header:title
    \fromproperty #'header:subtitle
  }
}

\layout {
  \context {
    % no staff names ("Women"/"Men" set by musicxml2ly)
    \Staff
    \remove "Instrument_name_engraver"
  }
  \context {
    \Lyrics
    % no verse number ("1." set by musicxml2ly)
    \remove "Stanza_number_engraver"
    % 14pt: text is 11pt at the default staff size 20, and each
    % font-size step scales by 2^(1/6)
    \override LyricText.font-size = #(* 6 (/ (log (/ 14 11)) (log 2)))
    % more room between syllables and around hyphens for the larger text
    \override LyricSpace.minimum-distance = #1.6
    \override LyricHyphen.minimum-distance = #1.4
  }
}
