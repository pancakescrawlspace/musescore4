"""From a reading (pdf_notes.read) to MusicXML in the house style: one
measure per printed system, the source's slurs, a melisma line on every
syllable of more than one note, a word split after a melisma, lyrics in
modern civil script."""
import re
import sys

# Church Slavonic in the UCS fonts (Irmologion, Staro Uspenskaya): Latin
# letters and some Cyrillic ones stand for letters with accents or old
# letters; digits are accents and titlos.
UCS = {"ў": "у", "Ў": "У", "t": "от", "њ": "о", "H": "о", "ѓ": "а", "ћ": "я", "±": "я", "$": "",
       "Z": "я", "A": "а", "E": "е", "S": "я", "a": "а", "e": "е", "h": "ы", "i": "и", "j": "и",
       "n": "о", "s": "я", "w": "о", "y": "у", "z": "я", "ё": "е", "э": "е", "є": "е", "ѕ": "з",
       "і": "и", "ї": "и", "0": "о", "‰": "я", "c": "с"}
VOWELS = set("аеёиоуыэюяѣѡѧіїєꙋ") | set("AESZaehijnswyzё0‰эєіtњHѓћ±ўЎ")
STEP = "CDEFGAB"


def civil(t):
    out = "".join(UCS.get(ch, ch) for ch in t if ch not in "123456789")
    return re.sub(r"ъ(?=[,.:;!?]*(\s|$))", "", out)   # a word-final hard sign


def has_vowel(t):
    return any(ch in VOWELS or ch.lower() in VOWELS for ch in t)


def lyrics(systems, cfg, log=sys.stderr):
    """(notes, syllables) over the whole piece, with the score's editorial
    choices (cfg: fix, insert, pin, caps, caps_next) applied."""
    notes, syls, slurs = [], [], []
    for k, sy in enumerate(systems):
        base = len(notes)
        for n in sy["notes"]:
            notes.append(dict(n, sys=k, slur=""))
        for a, b in sy["slurs"]:
            notes[base + a]["slur"] += "("; notes[base + b]["slur"] += ")"
            slurs.append((base + a, base + b))
        syls += [dict(t=t["t"], hyph=t["hyph"], n=base + t["note"]) for t in sy["syl"]]
    # a syllable on an inner note of a slur whose first note has none moves to that first note
    at = {s["n"] for s in syls}
    for s in syls:
        if s["t"] in cfg.get("pin", []): continue
        for a, b in slurs:
            if a < s["n"] <= b and a not in at and not any(a < o["n"] < s["n"] for o in syls if o is not s):
                print(f"«{s['t']}» moved to the first note of its slur", file=log)
                at.discard(s["n"]); s["n"] = a; at.add(a)
                break
    # "fix": [source text, occurrence, new text]; "insert": [system, note (1-based), text, hyphen after]
    for orig, occ, txt in cfg.get("fix", []):
        [s for s in syls if s["t"] == orig][occ - 1]["t"] = txt
    for k, j, txt, hy in cfg.get("insert", []):
        n = sum(len(sy["notes"]) for sy in systems[:k - 1]) + j - 1
        assert n not in {s["n"] for s in syls}, f"insert {txt!r}: note {n} has a syllable"
        syls.append(dict(t=txt, hyph=hy, n=n))
    syls.sort(key=lambda s: s["n"])
    # a closing consonant printed under the end of a melisma («свѣ́ — тъ») joins its syllable
    merged = []
    for s in syls:
        if merged and merged[-1]["hyph"] and not has_vowel(s["t"]):
            merged[-1]["t"] += s["t"]; merged[-1]["hyph"] = s["hyph"]
        else:
            merged.append(s)
    syls = merged
    for s in syls:
        s["t"] = civil(s["t"])
    # capitals: sentence starts, the words in caps, and a word in caps_next before the given word
    words, cur = [], []
    for s in syls:
        cur.append(s)
        if not s["hyph"]: words.append(cur); cur = []
    if cur: words.append(cur)
    caps = set(cfg.get("caps", []))
    plain = ["".join(re.sub(r"[,.:;!?]", "", s["t"]) for s in w).lower() for w in words]
    sentence = True
    for i, w in enumerate(words):
        nxt = plain[i + 1] if i + 1 < len(words) else ""
        if sentence or plain[i] in caps or cfg.get("caps_next", {}).get(plain[i]) == nxt:
            w[0]["t"] = w[0]["t"][0].upper() + w[0]["t"][1:]
        sentence = w[-1]["t"].rstrip()[-1:] == "."
    # melismas, and syllabic with the word split after a melisma
    for i, s in enumerate(syls):
        s["last"] = (syls[i + 1]["n"] if i + 1 < len(syls) else len(notes)) - 1
        s["mel"] = s["last"] > s["n"]
    for i, s in enumerate(syls):
        s["conn"] = s["hyph"] and not s["mel"] and i + 1 < len(syls)
    for i, s in enumerate(syls):
        before = i > 0 and syls[i - 1]["conn"]
        s["syllabic"] = {(False, False): "single", (False, True): "begin",
                         (True, True): "middle", (True, False): "end"}[(before, s["conn"])]
    return notes, syls


def text_view(syls):
    return "".join(s["t"] + (" ___" if s["mel"] else "") + ("-" if s["conn"] else " ") for s in syls)


def musicxml(systems, notes, syls, title, composer):
    by = {s["n"]: s for s in syls}
    ends = {s["last"] for s in syls if s["mel"]}
    typ = {.5: "eighth", .75: "eighth", 1: "quarter", 1.5: "quarter", 2: "half", 3: "half", 4: "whole", 6: "whole"}
    X = ['<?xml version="1.0" encoding="UTF-8"?>',
         '<!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 4.0 Partwise//EN" '
         '"http://www.musicxml.org/dtds/partwise.dtd">',
         '<score-partwise version="4.0">', f"<work><work-title>{title}</work-title></work>",
         f'<identification><creator type="composer">{composer}</creator></identification>',
         '<part-list><score-part id="P1"><part-name print-object="no">Voice</part-name></score-part></part-list>',
         '<part id="P1">']
    for k, sy in enumerate(systems):
        X.append(f'<measure number="{k + 1}">')
        if k:
            X.append('<print new-system="yes"/>')
        else:
            X.append(f'<attributes><divisions>4</divisions><key><fifths>{sy["key"]}</fifths></key>'
                     '<clef><sign>G</sign><line>2</line></clef></attributes>')
        idx = [i for i, n in enumerate(notes) if n["sys"] == k]
        for i in idx:
            n = notes[i]
            step, octave = STEP[n["d"] % 7], n["d"] // 7
            alter = -1 if (step == "B" and sy["key"] <= -1) or (step == "E" and sy["key"] <= -2) else 0
            X.append("<note>")
            X.append(f"<pitch><step>{step}</step>" + (f"<alter>{alter}</alter>" if alter else "")
                     + f"<octave>{octave}</octave></pitch>")
            X.append(f'<duration>{int(n["dur"] * 4)}</duration><voice>1</voice><type>{typ[n["dur"]]}</type>'
                     + ("<dot/>" if n["dot"] else ""))
            if n["dur"] < 1:   # beamed eighths: a run of them within the system
                prev8 = i > idx[0] and notes[i - 1]["dur"] < 1
                next8 = i < idx[-1] and notes[i + 1]["dur"] < 1
                if prev8 or next8:
                    X.append('<beam number="1">' + ("continue" if prev8 and next8 else "end" if prev8 else "begin")
                             + "</beam>")
            slur = "".join('<slur type="start" number="1"/>' if c == "(" else '<slur type="stop" number="1"/>'
                           for c in n["slur"])
            if slur:
                X.append(f"<notations>{slur}</notations>")
            if i in by:
                s = by[i]
                X.append(f'<lyric number="1"><syllabic>{s["syllabic"]}</syllabic><text>{s["t"]}</text>'
                         + ('<extend type="start"/>' if s["mel"] else "") + "</lyric>")
            elif i in ends:
                X.append('<lyric number="1"><extend type="stop"/></lyric>')
            X.append("</note>")
        if k == len(systems) - 1:
            X.append('<barline location="right"><bar-style>light-heavy</bar-style></barline>')
        X.append("</measure>")
    X += ["</part>", "</score-partwise>"]
    return "\n".join(X)
