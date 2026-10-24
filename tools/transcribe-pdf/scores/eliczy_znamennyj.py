"""«Елицы», Znamenny, with ison: azbyka.ru elici_krestu_trisvatoe_vl.pdf (LilyPond 2.24), first piece.
Notes read from the PDF's named Emmentaler glyphs; one measure per phrase between the source's bar lines.
Words are split after a melisma (house style)."""
TITLE = "Елицы"
COMPOSER = "Знаменный распев"
KEY = -1
NEWSYS = (2,)
# melody per measure: (pitch, quarters, syllable, syllabic, slur)
M = [
 [("A4",2,"Е","single","("),("B4",2,None,"",")"),("C5",4,"ли","begin",""),("B4",2,"цы","end",""),("A4",2,"во","single",""),
  ("A4",2,"Хри","begin",""),("B4",1,"ста","end","("),("C5",1,None,"",")"),("B4",1,"кре","single","("),("A4",1,None,"",")"),
  ("G4",2,"сти","begin",""),("A4",1,"сте","end","("),("B4",1,None,"",")"),("C5",4,"ся,","single","")],
 [("B4",1,"во","single","("),("A4",1,None,"",")"),("B4",1,"Хри","single","("),("C5",1,None,"",")"),("D5",2,"ста","single","")],
 [("D5",2,"об","begin",""),("C5",1,"ле","end","("),("B4",1,None,"",")"),("C5",2,"ко","begin",""),("B4",2,"сте","middle",""),("A4",4,"ся.","end","")],
 [("A4",2,"Ал","begin",""),("B4",2,"ли","middle",""),("C5",4,"лу","middle",""),("B4",4,"и","middle",""),("A4",4,"я.","end","")],
]
# ison: per measure, (start in quarters, [pitches], quarters)
# ison per measure: (start in quarters, pitches, quarters)
I = [[(0,["F4"],2)], [(4,["G4"],2)], [(4,["F4","A4"],2),(6,["G4"],2),(8,["F4"],4)], [(0,["F4"],2),(12,["F4"],4)]]
