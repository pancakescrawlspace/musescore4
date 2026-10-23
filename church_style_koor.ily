% Choir prints (tools/koor-variant.py): church_style.ily with larger lyrics.
% The size in points comes from koorPt, set in the .ly before this include
% (default 16).
\include "church_style.ily"

#(define koor-pt (if (defined? 'koorPt) koorPt 16))

\layout {
  \context {
    \Score
    \override TextMark.font-size = #(* 6 (/ (log (/ koor-pt 11)) (log 2)))
  }
  \context {
    \Lyrics
    \override LyricText.font-size = #(* 6 (/ (log (/ koor-pt 11)) (log 2)))
  }
}

% Title and subtitle grow with the lyrics, in the proportions of
% church_style.ily (title about 17.5pt and subtitle 12pt with 14pt lyrics):
% with 18pt lyrics the title is about 22.4pt and the subtitle 15.4pt, so
% the subtitle stays smaller than the lyrics, as before. The subsubtitle
% (e.g. "toon 1") and the composer keep their size.
#(define (koor-steps pt) (* 6 (/ (log (/ pt 11)) (log 2))))
#(define koor-title-steps (koor-steps (* 11 (expt 2 (/ 4 6)) (/ koor-pt 14))))
#(define koor-subtitle-steps (koor-steps (min koor-pt (* 12 (/ koor-pt 14)))))

\paper {
  bookTitleMarkup = \markup \column {
    \if #has-subsubtitle? \fill-line {
      \fontsize #koor-title-steps \bold \fromproperty #'header:title
      \fromproperty #'header:subsubtitle
    }
    \unless #has-subsubtitle? \fill-line {
      \fontsize #koor-title-steps \bold \fromproperty #'header:title
    }
    \if #has-subtitle? \column {
      \vspace #0.3
      \fill-line {
        \fontsize #koor-subtitle-steps \bold \fromproperty #'header:subtitle
      }
      \vspace #0.8
    }
    \if #has-composer? \column {
      \vspace #0.3
      \fill-line { \null \override #'(font-name . "C059 Italic") \fromproperty #'header:composer }
      \vspace #0.5
    }
  }
}
