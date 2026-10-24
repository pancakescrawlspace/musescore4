"""«Кресту Твоему», Valaam chant, with ison: azbyka.ru elici_krestu_trisvatoe_vl.pdf (LilyPond 2.24), second piece.
Notes read from the PDF's named Emmentaler glyphs; one measure per phrase between the source's bar lines.
Words are split after a melisma (house style)."""
TITLE = "Кресту Твоему"
COMPOSER = "Валаамский напев"
KEY = -1
NEWSYS = (1, 3)
# melody per measure: (pitch, quarters, syllable, syllabic, slur)
M = [
 [("G4",1,"Крес","single","("),("A4",1,None,"",")"),("B4",4,"ту","single",""),("A4",2,"Тво","begin",""),("B4",1,"е","end","("),("A4",1,None,"",")"),
  ("G4",4,"му","single",""),("A4",2,"по","begin",""),("B4",2,"кла","middle",""),("C5",2,"ня","end","("),("D5",2,None,"",")"),
  ("C5",2,"ем","begin",""),("C5",2,"ся,","end","")],
 [("A4",2,"Вла","begin",""),("B4",4,"ды","end","("),("A4",4,None,"",")"),("G4",2,"ко,","single","("),("A4",2,None,"",")")],
 [("B4",4,"и","single",""),("B4",2,"свя","begin",""),("A4",4,"то","middle",""),("G4",4,"е","end",""),("F4",2,"Вос","begin",""),
  ("G4",2,"кре","middle",""),("A4",3,"се","middle",""),("B4",1,"ни","middle",""),("A4",2,"е","end","")],
 [("G4",2,"Тво","begin",""),("F4",1,"е","end","("),("G4",1,None,"",""),("A4",2,None,"",")"),("G4",4,"сла","single","("),("F4",4,None,"",")"),
  ("G4",4,"вим.","single","")],
]
# ison per measure: (start in quarters, pitches, quarters)
I = [[(0,["G4"],1),(6,["F4"],2),(10,["G4"],4),(14,["F4"],2)], [(10,["G4"],2)],
     [(6,["F4"],4),(10,["G4"],4),(14,["F4"],2),(16,["E4"],2),(18,["D4"],3)], [(14,["C4"],4)]]
