#!/usr/bin/env python3
"""Split a LilyPond score's two-voice staves into one staff per voice, as
~/dev/pitchmarks/tools/voice-explode.py does for MusicXML: Women (soprano +
alto) and Men (tenor + bass) become four staves, Soprano, Alto, Tenor, Bass.

usage: tools/voice-explode-ly.py [--single-lyrics] [--names A,B,...] [--tenor-treble8]
                                 IN.ly OUT.ly

Written for the musicxml2ly output in this repo: music in variables, and a
\\score whose staves hold `\\context Voice = "..." { ... }` and
`\\new Lyrics \\lyricsto "..." { ... }` blocks. Each staff with several voices
is copied once per voice, without the other voices; everything else in the
staff (overrides, the line-break spacer) goes into every copy. Staff "P1"
becomes "P1-1", "P1-2". Single-voice staves stay as they are.

In the music of every voice, the two-voice layout goes: \\voiceOne etc.,
\\oneVoice, \\stemUp/\\stemDown (and ties, slurs, dots), the stem macros
\\U and \\D (any `X = \\tweak Stem.direction ... \\etc`), and forced
directions on articulations and slurs (`^\\fermata` becomes `-\\fermata`).
Spacer rests become rests, since a voice alone on a staff has nobody to share
its rests with: `s4` becomes `r4`, `s1*31` becomes `R1*31`.

Names: a staff name that splits on "/" or "," into one name per voice
("Alto, Tenor") is split. Otherwise two staves of two voices become Soprano,
Alto, Tenor, Bass, and anything else "Women 1", "Women 2". Short names follow
(S., A., ...) when the staff had one. --names sets all staff names in order.

Lyrics: the lyrics usually sit only under the soprano. A voice without lyrics
of its own gets copies of the lyrics of the first voice that has them,
attached to that voice (\\lyricsto), so the syllables keep the soprano's
rhythm. A voice with nothing but rests gets none. --single-lyrics leaves the
lyrics where they are.

--tenor-treble8 gives the tenor (the upper voice of a bass-clef staff with
several voices) the octave treble clef: its \\clef "bass" becomes
\\clef "treble_8".

Relative \\include paths are adjusted when OUT.ly is in another directory.
"""
import argparse, os, re, sys

LAYOUT = (r"voice(?:One|Two|Three|Four)|oneVoice"
          r"|(?:stem|tie|slur|phrasingSlur|dots|tuplet)(?:Up|Down|Neutral)")


def mask(text, strings=True):
    """Text with comments (and strings) blanked out, same length."""
    def blank(m):
        if m.group().startswith('"') and not strings:
            return m.group()
        return re.sub(r"[^\n]", " ", m.group())
    return re.sub(r'"(?:\\.|[^"\\])*"|%\{.*?%\}|%[^\n]*', blank, text, flags=re.S)


def close(masked, start):
    """Position after the }/>> closing the {/<< at start."""
    opener = "<<" if masked.startswith("<<", start) else "{"
    pairs = {"{": "}", "<<": ">>"}
    depth = 0
    for m in re.compile(r"<<|>>|\{|\}").finditer(masked, start):
        tok = m.group()
        if tok == opener:
            depth += 1
        elif tok == pairs[opener]:
            depth -= 1
            if depth == 0:
                return m.end()
    sys.exit(f"unbalanced {opener} at offset {start}")


def whole_lines(text, start, end):
    """Widen [start, end) to whole lines when nothing else is on them."""
    s = text.rfind("\n", 0, start) + 1
    if text[s:start].strip():
        s = start
    e = text.find("\n", end)
    e = len(text) if e < 0 else e + 1
    if text[end:e].strip():
        e = end
    return s, e


def blocks(text, pattern):
    """(name, start, end) of each `pattern` block, pattern ending at its { or <<."""
    masked = mask(text)
    found = []
    for m in re.finditer(pattern, mask(text, strings=False)):
        end = close(masked, m.end() - len(re.search(r"(<<|\{)$", m.group()).group()))
        found.append((m.group(1) if m.groups() else None, m.start(), end))
    return found


VOICE = r'\\(?:context|new)\s+Voice\s*=\s*"([^"]+)"\s*(?:\\with\s*\{[^{}]*\}\s*)?(?:\{|<<)'
LYRICS = r'\\(?:context|new)\s+Lyrics\b[^{}"]*\\lyricsto\s*"([^"]+)"\s*\{'
STAFF = r'\\new\s+Staff\b\s*(?:=\s*"([^"]*)"\s*)?(?:\\with\s*\{[^{}]*\}\s*)?<<'


def strip_layout(music, stem_macros):
    """Remove the two-voice layout from a stretch of music."""
    masked = mask(music)
    macros = "|".join(map(re.escape, stem_macros))
    names = LAYOUT + (f"|{macros}" if macros else "")
    cuts = [(m.start(), m.end(), "") for m in
            re.finditer(rf"(?:\\once\s+)?\\(?:{names})(?![A-Za-z])[ \t]*", masked)]
    # ^\fermata -> -\fermata; ^( and _~ -> ( and ~
    cuts += [(m.start(), m.end(), "-") for m in
             re.finditer(r"[_^](?=\s*\\(?!markup\b)[A-Za-z])", masked)]
    cuts += [(m.start(), m.end(), "") for m in re.finditer(r"[_^](?=\s*[(~])", masked)]
    for m in re.finditer(r"(?<![\\\w#'-])s(?=\d|\s|\*|$)(\d*\.*)((?:\*[\d/]+)*)", masked):
        cuts.append((m.start(), m.start() + 1, "R" if m.group(2) else "r"))
    for start, end, new in sorted(cuts, reverse=True):
        music = music[:start] + new + music[end:]
    return re.sub(r"[ \t]+\n", "\n", music)


def definitions(text):
    """name -> (start, end) of the { } or << >> of each top-level music variable."""
    masked = mask(text)
    defs = {}
    for m in re.finditer(r"^([A-Za-z]+)\s*=\s*((?:\\(?:relative|fixed)\s+[a-g][a-z]*[',]*\s*"
                         r"|\\transpose\s+\S+\s+\S+\s*)?)(\{|<<)", masked, re.M):
        defs[m.group(1)] = (m.start(3), close(masked, m.start(3)))
    return defs


def has_notes(music):
    music = mask(music)
    music = re.sub(r"\\(?:key|relative|fixed)\s+[a-g][a-z]*[',]*|\\transpose\s+\S+\s+\S+"
                   r"|\\[A-Za-z]+|#\S+", " ", music)
    return re.search(r"(?<![\w-])[a-g](?:isis|eses|is|es|s)?[',!?]*(?![A-Za-z])", music)


def staff_names(staves, override):
    """New (long, short) names, one per voice, staff by staff."""
    splits = []
    for staff in staves:
        n = len(staff["voices"])
        parts = re.split(r"\s*[/,]\s*", staff["name"]) if staff["name"] else []
        splits.append(parts if len(parts) == n and n > 1 else None)
    counts = [len(s["voices"]) for s in staves]
    satb = counts == [2, 2] and splits == [None, None]
    names = []
    for i, staff in enumerate(staves):
        n = len(staff["voices"])
        if n == 1:
            names.append((staff["name"], staff["short"]))
            continue
        for j in range(n):
            if satb:
                long = ["Soprano", "Alto", "Tenor", "Bass"][2 * i + j]
            elif splits[i]:
                long = splits[i][j]
            else:
                long = f"{staff['name']} {j + 1}" if staff["name"] else ""
            short = f"{long[0]}." if staff["short"] is not None and long else staff["short"]
            names.append((long, short))
    if override:
        if len(override) != len(names):
            sys.exit(f"--names: {len(names)} staves, {len(override)} names given")
        names = [(n, f"{n[0]}." if s is not None and n else s) for n, (_, s) in zip(override, names)]
    return names


def set_name(text, prop, value):
    pattern = rf'(\\set\s+Staff\.{prop}\s*=\s*)"(?:\\.|[^"\\])*"'
    if value is None:
        return text
    return re.sub(pattern, lambda m: m.group(1) + '"' + value.replace('"', '\\"') + '"', text, count=1)


BASS_CLEF = r'\\clef\s*(?:"bass"|bass|"F"|F)(?![\w"])'


def treble8(music):
    """music with its bass clefs replaced by the octave treble clef."""
    masked = mask(music, strings=False)
    for m in reversed(list(re.finditer(BASS_CLEF, masked))):
        music = music[:m.start()] + '\\clef "treble_8"' + music[m.end():]
    return music


def edit(text, edits):
    """Apply (start, end, new) edits; an insertion at the start of a removal stays."""
    for start, end, new in sorted(edits, key=lambda e: (e[0], e[1]), reverse=True):
        text = text[:start] + new + text[end:]
    return text


def explode(text, single_lyrics, override, tenor_treble8=False):
    masked = mask(text)
    score = re.search(r"\\score\s*\{", masked)
    if not score:
        sys.exit("no \\score block")
    score_end = close(masked, score.end() - 1)

    staves = []
    for sid, start, end in blocks(text[:score_end], STAFF):
        if start < score.start():
            continue
        body = text[start:end]
        prop = lambda p: (re.search(rf'\\set\s+Staff\.{p}\s*=\s*"((?:\\.|[^"\\])*)"', body) or [None, None])[1]
        voices = blocks(body, VOICE)
        if any(v[1] < w[2] and w[1] < v[2] for v in voices for w in voices if v is not w):
            sys.exit(f"staff {sid}: nested voices are not supported")
        staves.append({"id": sid, "start": start, "end": end, "body": body, "voices": voices,
                       "lyrics": blocks(body, LYRICS),
                       "name": prop("instrumentName") or "", "short": prop("shortInstrumentName")})
    if not any(len(s["voices"]) > 1 for s in staves):
        sys.exit("no staff with more than one voice")

    # variables used by the voices, directly or through other variables
    stem_macros = re.findall(r"^([A-Za-z]+)\s*=\s*\\tweak\s+Stem\.direction\b[^\n]*\\etc", text, re.M)
    defs = definitions(text)
    uses = lambda music: [n for n in re.findall(r"\\([A-Za-z]+)", mask(music)) if n in defs]
    music = {}  # voice -> its music with the variables it uses, to look for notes
    stripped = set()
    for staff in staves:
        for vname, vs, ve in staff["voices"]:
            body = staff["body"][vs:ve]
            music[vname] = body + "".join(text[slice(*defs[n])] for n in uses(body))
    def used_by(music):
        found, todo = set(), uses(music)
        while todo:
            n = todo.pop()
            if n not in found:
                found.add(n)
                todo += uses(text[slice(*defs[n])])
        return found
    for staff in staves:
        for _, vs, ve in staff["voices"]:
            stripped |= used_by(staff["body"][vs:ve])

    # the tenors: the upper voice of every bass-clef staff with several voices
    tenors, tenor_vars = set(), set()
    for staff in staves if tenor_treble8 else []:
        vname, vs, ve = staff["voices"][0]
        if len(staff["voices"]) > 1 and re.search(BASS_CLEF, mask(music[vname], strings=False)):
            tenors.add(vname)
            tenor_vars |= used_by(staff["body"][vs:ve])
    if tenor_treble8 and not tenors:
        print("--tenor-treble8: no bass-clef staff with several voices, no tenor to change",
              file=sys.stderr)

    # the lyrics of the first voice that has any
    lyric_source = []
    for staff in staves:
        for vname, _, _ in staff["voices"]:
            if not lyric_source:
                lyric_source = [staff["body"][slice(*whole_lines(staff["body"], s, e))]
                                for l, s, e in staff["lyrics"] if l == vname]

    names = iter(staff_names(staves, override))
    replaced = []
    for staff in staves:
        body, voices = staff["body"], staff["voices"]
        mine = {v for v, _, _ in voices}
        copies = []
        for i, (vname, vs, ve) in enumerate(voices):
            long, short = next(names)
            edits = [(*whole_lines(body, s, e), "") for v, s, e in voices if v != vname]
            edits += [(*whole_lines(body, s, e), "") for l, s, e in staff["lyrics"]
                      if l != vname and (l in mine or i > 0)]
            voice = strip_layout(body[vs:ve], stem_macros)
            edits.append((vs, ve, treble8(voice) if vname in tenors else voice))
            own = any(l == vname for l, _, _ in staff["lyrics"])
            if not single_lyrics and not own and has_notes(music[vname]):
                vend = whole_lines(body, vs, ve)[1]
                edits.append((vend, vend, "".join(lyric_source)))
            new = edit(body, edits)
            if len(voices) > 1:
                if staff["id"] is not None:
                    new = re.sub(r'(\\new\s+Staff\s*=\s*)"[^"]*"',
                                 lambda m: f'{m.group(1)}"{staff["id"]}-{i + 1}"', new, count=1)
                new = set_name(new, "instrumentName", long)
                new = set_name(new, "shortInstrumentName", short)
            copies.append(new)
        indent = text[text.rfind("\n", 0, staff["start"]) + 1:staff["start"]]
        replaced.append((staff["start"], staff["end"], ("\n" + indent).join(copies)))

    # the variables lie before the \\score, so their offsets hold until the staves change
    edits = []
    for n in stripped:
        body = strip_layout(text[slice(*defs[n])], stem_macros)
        edits.append((*defs[n], treble8(body) if n in tenor_vars else body))
    return edit(text, edits + replaced)


def include_paths(text, src, dst):
    """Make relative \\include paths relative to dst's directory instead of src's."""
    src_dir, dst_dir = os.path.dirname(os.path.abspath(src)), os.path.dirname(os.path.abspath(dst))
    if src_dir == dst_dir:
        return text
    def fix(m):
        path = m.group(2)
        if os.path.isabs(path) or not os.path.exists(os.path.join(src_dir, path)):
            return m.group()  # absolute, or found through LilyPond's include path
        return m.group(1) + '"' + os.path.relpath(os.path.join(src_dir, path), dst_dir) + '"'
    return re.sub(r'(\\include\s*)"([^"]+)"', fix, text)


def main():
    ap = argparse.ArgumentParser(description="Split two-voice staves into one staff per voice.")
    ap.add_argument("input")
    ap.add_argument("output")
    ap.add_argument("--single-lyrics", action="store_true",
                    help="leave the lyrics under the voices that have them")
    ap.add_argument("--names", help="comma-separated names for all staves, top to bottom")
    ap.add_argument("--tenor-treble8", action="store_true",
                    help='the tenor in the octave treble clef (\\clef "treble_8")')
    args = ap.parse_args()
    text = open(args.input, encoding="utf-8").read()
    override = [n.strip() for n in args.names.split(",")] if args.names else None
    text = explode(text, args.single_lyrics, override, args.tenor_treble8)
    text = include_paths(text, args.input, args.output)
    note = f"% one staff per voice: made by tools/voice-explode-ly.py from {os.path.basename(args.input)}\n"
    version = re.search(r"^\\version[^\n]*\n", text, re.M)
    at = version.end() if version else 0
    text = text[:at] + note + text[at:]
    with open(args.output, "w", encoding="utf-8") as f:
        f.write(text)


if __name__ == "__main__":
    main()
