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
