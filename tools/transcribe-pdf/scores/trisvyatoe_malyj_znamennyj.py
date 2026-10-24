"""The Trisagion, Small Znamenny chant, with ison: azbyka.ru elici_krestu_trisvatoe_vl.pdf (LilyPond 2.24), third piece.
Notes read from the PDF's named Emmentaler glyphs; the source's double bar after «Аминь.» and its line break.
The last ison note, a C in parentheses, is marked «(последний раз)» (the last time).
Words are split after a melisma (house style)."""
TITLE = "Трисвятое"
COMPOSER = "Малый знаменный распев"
KEY = -1
NEWSYS = (2,)
BARS = {0: "light-light"}
# melody per measure: (pitch, quarters, syllable, syllabic, slur); "r": a hidden rest
M = [
 [("F4",2,"А","begin",""),("G4",4,"минь.","end","")],
 [("F4",2,"Свя","begin",""),("G4",1,"тый","end","("),("A4",1,None,"",")"),("A4",2,"Бо","begin",""),("G4",2,"же,","end",""),
  ("F4",2,"Свя","begin",""),("G4",1,"тый","end","("),("A4",1,None,"",")"),("A4",2,"Креп","begin",""),("G4",2,"кий,","end",""),
  ("F4",2,"Свя","begin",""),("G4",1,"тый","end","("),("A4",1,None,"",")")],
 [("A4",2,"Без","begin",""),("G4",4,"смер","middle",""),("F4",2,"тный,","end",""),("G4",2,"по","begin",""),("A4",4,"ми","middle",""),
  ("A4",2,"луй","end",""),("G4",4,"нас.","single",""),("r",4,None,"","")],
]
# ison per measure: (start in quarters, pitches, quarters[, options])
I = [[(0,["D4"],2),(2,["C4"],4)], [(0,["D4"],2)], [(16,["D4"],4),(20,["C4"],4,{"paren": True, "words": "(последний раз)"})]]
