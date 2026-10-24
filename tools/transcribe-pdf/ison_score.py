"""MusicXML for a short score entered by hand from a reading of the PDF (the
LilyPond-engraved pieces: pitches and values from their named glyphs, see
pdf_notes.py): a melody with lyrics in voice 1, and an ison in voice 2,
printed only where the source prints it, with hidden rests in between.

A score is a module in scores/ with
  TITLE, COMPOSER, KEY (fifths), NEWSYS (measure indices starting a system),
  M: per measure, melody notes (pitch, quarters, syllable or None, syllabic, slur)
     with slur "(" (start), ")" (stop) or ""; pitch "r" is a hidden rest;
  I: per measure, ison notes (start in quarters, [pitches], quarters[, options])
     with options {"paren": True} (parenthesized heads) and {"words": text}
     (a text below the note);
  ISON_LABEL: the text above the first ison note (default «исон»);
  BARS: {measure index: MusicXML bar-style} for bar lines other than plain
     (the last measure always gets the final bar).
"""
TYPE = {1: "quarter", 2: "half", 3: "half", 4: "whole"}


def _pitch(p, key):
    step, octave = p[0], p[1]
    alter = "<alter>-1</alter>" if (step == "B" and key <= -1) or (step == "E" and key <= -2) else ""
    return f"<pitch><step>{step}</step>{alter}<octave>{octave}</octave></pitch>"


def _rests(q, voice):
    out = []
    for d in (4, 2, 1):
        while q >= d:
            out.append(f'<note print-object="no"><rest/><duration>{d * 2}</duration><voice>{voice}</voice>'
                       f'<type>{TYPE[d]}</type></note>')
            q -= d
    return out


def musicxml(sc):
    M, I, key = sc.M, sc.I, sc.KEY
    flat = [n for meas in M for n in meas]
    X = ['<?xml version="1.0" encoding="UTF-8"?>',
         '<!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 4.0 Partwise//EN" "http://www.musicxml.org/dtds/partwise.dtd">',
         f'<score-partwise version="4.0"><work><work-title>{sc.TITLE}</work-title></work>',
         f'<identification><creator type="composer">{sc.COMPOSER}</creator></identification>',
         '<part-list><score-part id="P1"><part-name print-object="no">Voice</part-name></score-part></part-list><part id="P1">']
    pos = 0
    for k, meas in enumerate(M):
        total = sum(n[1] for n in meas)
        X.append(f'<measure number="{k + 1}">' + ('<print new-system="yes"/>' if k in sc.NEWSYS else ''))
        if k == 0:
            X.append(f'<attributes><divisions>2</divisions><key><fifths>{key}</fifths></key>'
                     '<clef><sign>G</sign><line>2</line></clef></attributes>')
            X.append('<direction placement="above"><direction-type><words font-style="italic">'
                     f'{getattr(sc, "ISON_LABEL", "исон")}</words></direction-type><voice>2</voice></direction>')
        for p, q, syl, sy, sl in meas:
            nxt = flat[pos + 1] if pos + 1 < len(flat) else None
            pos += 1
            if p == "r":
                X += _rests(q, 1)
                continue
            s = (f'<note>{_pitch(p, key)}<duration>{q * 2}</duration><voice>1</voice><type>{TYPE[q]}</type>'
                 + ('<dot/>' if q == 3 else '') + '<stem>up</stem>')
            if sl:
                s += f'<notations><slur type="{"start" if sl == "(" else "stop"}" number="1"/></notations>'
            mel_next = nxt is not None and nxt[2] is None and nxt[0] != "r"
            if syl:
                s += (f'<lyric number="1"><syllabic>{sy}</syllabic><text>{syl}</text>'
                      + ('<extend type="start"/>' if mel_next else '') + '</lyric>')
            elif not mel_next:
                s += '<lyric number="1"><extend type="stop"/></lyric>'
            X.append(s + '</note>')
        X.append(f'<backup><duration>{total * 2}</duration></backup>')
        t = 0
        for start, ps, q, *opt in I[k]:
            opt = opt[0] if opt else {}
            X += _rests(start - t, 2)
            if opt.get("words"):
                X.append('<direction placement="below"><direction-type><words font-size="9">'
                         f'{opt["words"]}</words></direction-type><voice>2</voice></direction>')
            for i, p in enumerate(ps):
                head = '<notehead parentheses="yes">normal</notehead>' if opt.get("paren") else ''
                X.append(f'<note>{"<chord/>" if i else ""}{_pitch(p, key)}<duration>{q * 2}</duration>'
                         f'<voice>2</voice><type>{TYPE[q]}</type>' + ('<dot/>' if q == 3 else '')
                         + f'<stem>down</stem>{head}</note>')
            t = start + q
        X += _rests(total - t, 2)
        style = "light-heavy" if k == len(M) - 1 else getattr(sc, "BARS", {}).get(k)
        if style:
            X.append(f'<barline location="right"><bar-style>{style}</bar-style></barline>')
        X.append('</measure>')
    X.append('</part></score-partwise>')
    return '\n'.join(X)
