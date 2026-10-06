\version "2.24.4"

\layout {
  indent = 0
}

\paper {
  ragged-bottom = ##t
  ragged-last-bottom = ##t

  % 1. Reduce space between systems (Default basic-distance is usually around 12)
  system-system-spacing.basic-distance = #0
  system-system-spacing.minimum-distance = #0
  system-system-spacing.padding = #-5
  system-system-spacing.stretchability = #0

  % 2. Reduce space between the top/bottom titles and the first/last systems
  markup-system-spacing.basic-distance = #0
  top-system-spacing.basic-distance = #0
  bottom-system-spacing.basic-distance = #0

  % 3. Tighten the margins to maximize printable area
  top-margin = 10\mm
  bottom-margin = 10\mm
}

% 4. Shrink the overall global notation size slightly if systems still overflow
#(set-global-staff-size 18) 

\include "heer_ik_roep_t1_first_sys.ly"
\include "heer_ik_roep_t2_first_sys.ly"
\include "heer_ik_roep_t3_first_sys.ly"
\include "heer_ik_roep_t4_first_sys.ly"
\include "heer_ik_roep_t5_first_sys.ly"
\include "heer_ik_roep_t6_first_sys.ly"
\include "heer_ik_roep_t7_first_sys.ly"
\include "heer_ik_roep_t8_first_sys.ly"

