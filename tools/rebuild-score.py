#!/usr/bin/env python3
"""Rebuild the MusicXML, LilyPond source and PDF of church scores from their
.mscz, carrying the hand edits over from the current .ly (see README.md).

usage: tools/rebuild-score.py NAME [NAME ...]

NAME is a score name like heer_ik_roep_t3 (or heer_ik_roep_t3.mscz). The
outputs are NAME.musicxml, NAME.ly and NAME.pdf. Scores need time
signatures, hidden ones for free meter: a score without any is refused
(add them with tools/mscz-add-hidden-timesig.py).

Hand edits taken from the current .ly: the \\include of church_style.ily,
the hand-edit comment, the \\header title/subsubtitle, and the line-break
spacer (`{ s4*N \\bar "" }`). Any other "% hand edit:" line makes the
script stop before the .ly is replaced, so redo those by hand. A score
without a .ly yet gets its title and subsubtitle from the score's title
frame: the title text's first line, and its second line if any (like
"toon 1"), which church_style.ily prints to the right of the title.

A Subtitle text in the title frame (MuseScore's Subtitle style, centered
below the title) becomes the \\header subtitle, read from the .mscz on
every rebuild; church_style.ily centers it below the title. MuseScore doesn't
export it to MusicXML.

System breaks and page breaks in the score (MuseScore's layout breaks) become
\\break / \\pageBreak at the same measures. They are read from the .mscz
itself: MuseScore exports them to MusicXML only with a matching preference.

A repeat played three or more times without volta brackets gets its count
("3×") above the end repeat, as MuseScore prints it: MuseScore doesn't export
that text to MusicXML, and LilyPond doesn't print repeat counts. Not when
the count equals the number of verses (a strophic song: the numbered verses
already say how often it is sung).

Lyric syllables underlined in the score mark the stressed syllables; musicxml2ly
writes them as \\markup \\underline, which becomes \\markup \\stressed (a red
underline, see church_style.ily).

After LilyPond, tools/check-pdf-notes.py compares the PDF with the .mscz
(scores it can't read are skipped). If any heer_ik_roep_tN was rebuilt,
heer_ik_roep_alle_tonen.pdf is joined again.

Exit status: 0 done, 1 a note check found differences, 2 a step failed.
"""
import os, re, shutil, subprocess, sys, tempfile, zipfile
import xml.etree.ElementTree as ET

MSCORE = "/Applications/MuseScore 4.app/Contents/MacOS/mscore"
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(ROOT, "tools")
COMMENT = ("% hand edits after conversion: the \\include above and the \\header title/subtitle "
           "(replacing musicxml2ly's title and composer)")
SPACER = re.compile(r'( *% hand edit: allow a line break[^\n]*\n *\{ s4\*\d+ \\bar "" \}\n)')


class Failed(Exception):
    pass


def run(*cmd):
    return subprocess.run(cmd, capture_output=True, text=True)


def problems(stderr, tool):
    for line in stderr.splitlines():
        if re.search(r"warn|error", line, re.I):
            print(f"  {tool}: {line}")


def title_frame(mscz):
    """(title, subsubtitle or None) from the title text's lines, e.g. "<b>Heer ik roep<br/></b>toon 1"."""
    with zipfile.ZipFile(mscz) as z:
        root = ET.fromstring(z.read([n for n in z.namelist() if n.endswith(".mscx")][0]))
    for t in root.iter("Text"):
        if t.findtext("style") == "title":
            raw = ET.tostring(t.find("text"), encoding="unicode")
            raw = re.sub(r"^<text>|</text>\s*$", "", raw.strip())
            parts = [re.sub(r"<[^>]+>", "", p).strip() for p in re.split(r"<br\s*/>", raw)]
            parts = [p for p in parts if p]
            if parts:
                return parts[0], (parts[1] if len(parts) > 1 else None)
    raise Failed(f"no title frame in {mscz}")


def frame_subtitle(mscz):
    """The text of the title frame's Subtitle, or None."""
    with zipfile.ZipFile(mscz) as z:
        root = ET.fromstring(z.read([n for n in z.namelist() if n.endswith(".mscx")][0]))
    for t in root.iter("Text"):
        if t.findtext("style") == "subtitle":
            raw = ET.tostring(t.find("text"), encoding="unicode")
            text = " ".join(re.sub(r"<[^>]+>", " ", re.sub(r"<br\s*/>", " ", raw)).split())
            if text:
                return text
    return None


def splice(new, old, mscz):
    """Apply the hand edits to fresh musicxml2ly output: copied from the old .ly, or made from the title frame."""
    if old is not None:
        inc = re.search(r'\\include "church_style.ily"\n', old).group(0)
        com = re.search(r"% hand edits after conversion:.*\n", old).group(0)
        fields = dict(re.findall(r'^\s*(title|subsubtitle)\s*=\s*("[^"]*")', old, re.M))
    else:
        title, subsub = title_frame(mscz)
        print(f"  no .ly yet: title {title!r}" + (f", subsubtitle {subsub!r}" if subsub else ""))
        inc, com = '\\include "church_style.ily"\n', COMMENT + "\n"
        fields = {"title": f'"{title}"', **({"subsubtitle": f'"{subsub}"'} if subsub else {})}
    sub = frame_subtitle(mscz)
    if sub:
        fields["subtitle"] = '"' + sub.replace('"', '\\"') + '"'
    version = re.search(r'\\version "[^"]*"\n', new).group(0)
    new = new.replace(version, version + inc, 1)
    conv = re.search(r"% automatically converted by musicxml2ly from .*\n", new).group(0)
    new = new.replace(conv, conv + com, 1)
    # musicxml2ly's title ("Untitled score") and composer lines, in 2.24 or 2.26 layout
    generated = re.search(r'^([ \t]*)title\s*=\s*"[^"]*"\n(?:[ \t]*composer\s*=\s*"[^"]*"\n)?', new, re.M)
    if not generated:
        raise Failed("musicxml2ly output has no title/composer to replace")
    ind = generated.group(1)
    head = "".join(f"{ind}{k} = {v}\n" for k, v in fields.items())
    new = new.replace(generated.group(0), head, 1)
    if old is not None:
        m = SPACER.search(old)
        if m:  # line-break spacer just before the first voice
            anchor = '\\context Voice = "PartPOneVoiceOne"'
            i = new.rindex("\n", 0, new.index(anchor)) + 1
            new = new[:i] + m.group(1) + new[i:]
        missing = set(re.findall(r"% hand edit:[^\n]*", old)) - set(re.findall(r"% hand edit:[^\n]*", new))
        if missing:
            raise Failed("hand edits this script can't carry over; redo them by hand:\n    "
                         + "\n    ".join(sorted(missing)))
    return new


def repeat_counts(ly):
    """Add \\textEndMark "N×" at the end of each `\\repeat volta N { ... }` with N >= 3
    and no \\alternative, in the first music variable only (a mark is score-wide).
    Skipped when N is the number of verses of that voice."""
    first = re.search(r"^(\w+) =\s*\\relative [^{]*\{", ly, re.M)
    if not first:
        return ly
    verses = len(re.findall(rf"^{first.group(1)}Lyrics\w+ =", ly, re.M))
    start, depth = first.end(), 1
    i = start
    while depth:  # end of the first music variable
        c = ly[i]
        depth += c == "{"
        depth -= c == "}"
        i += 1
    body = ly[start:i]
    out, pos = [], 0
    for m in re.finditer(r"\\repeat volta (\d+) \{", body):
        if int(m.group(1)) < 3 or int(m.group(1)) == verses:
            continue
        j, depth = m.end(), 1
        while depth:
            depth += body[j] == "{"
            depth -= body[j] == "}"
            j += 1
        close = j - 1  # the repeat's closing brace
        if "\\alternative" in body[m.end():close] or re.match(r"\s*\\alternative", body[j:]):
            continue  # volta brackets show the count
        out += [body[pos:close], f'\\textEndMark "{m.group(1)}×" ']
        pos = close
    out.append(body[pos:])
    return ly[:start] + "".join(out) + ly[i:]


def layout_breaks(mscz):
    """{measure index (0-based): "\\break" or "\\pageBreak"} from the score's first staff."""
    with zipfile.ZipFile(mscz) as z:
        root = ET.fromstring(z.read([n for n in z.namelist() if n.endswith(".mscx")][0]))
    staff = root.find("Score").find("Staff")
    out = {}
    for i, m in enumerate(staff.findall("Measure")):
        for b in m.findall("LayoutBreak"):
            kind = b.findtext("subtype")
            if kind in ("line", "page"):
                out[i] = "\\break" if kind == "line" else "\\pageBreak"
    return out


def line_breaks(ly, mscz):
    """Put the score's layout breaks into the first music variable. musicxml2ly ends every
    measure but the last with a "% N" comment; the k-th such comment ends measure k."""
    breaks = layout_breaks(mscz)
    if not breaks:
        return ly
    first = re.search(r"^(\w+) =\s*\\relative [^{]*\{", ly, re.M)
    start, depth, i = first.end(), 1, first.end()
    while depth:
        depth += ly[i] == "{"
        depth -= ly[i] == "}"
        i += 1
    body = ly[start:i]
    ends = list(re.finditer(r"% \d+[ \t]*\n", body))
    for k in sorted(breaks, reverse=True):
        if k >= len(ends):
            continue  # a break after the last measure changes nothing
        at = ends[k].start()
        body = body[:at] + breaks[k] + " " + body[at:]
    return ly[:start] + body + ly[i:]


def stanza_numbers(ly):
    """Number the verses ("1.", "2.", ...) of each voice that has more than one;
    musicxml2ly 2.26 no longer writes \\set stanza (2.24 did, for every verse)."""
    if "\\set stanza" in ly:
        return ly
    lyrics = re.findall(r'\\new Lyrics \\lyricsto "(\w+)" \{\s*\\(\w+)', ly)
    per_voice = {}
    for voice, var in lyrics:
        per_voice.setdefault(voice, []).append(var)
    for voice, vars_ in per_voice.items():
        if len(vars_) < 2:
            continue
        for n, var in enumerate(vars_, 1):
            ly = re.sub(rf'(\\new Lyrics \\lyricsto "{voice}" \{{\s*)\\{var}\b',
                        rf'\g<1>\\set stanza = "{n}." \\{var}', ly, count=1)
    return ly


def stressed_syllables(ly):
    """Lyric syllables underlined in the score (stressed syllables) come out of
    musicxml2ly as \\markup \\underline; make them \\markup \\stressed, the red
    underline from church_style.ily."""
    def fix(m):
        return re.sub(r"\\markup(\s+)\\underline\b", r"\\markup\1\\stressed", m.group(0))
    return re.sub(r"^\w+ = \\lyricmode \{\n.*?\n\}", fix, ly, flags=re.M | re.S)


def has_timesig(mscz):
    with zipfile.ZipFile(mscz) as z:
        return any(b"<TimeSig>" in z.read(n) for n in z.namelist() if n.endswith(".mscx"))


def rebuild(name):
    name = re.sub(r"\.mscz$", "", name)
    mscz = name + ".mscz"
    if not os.path.exists(mscz):
        raise Failed(f"{mscz} not found")
    base = name
    print(f"== {mscz} -> {base}.*")
    # 1. time signatures: without them musicxml2ly rebars everything as 4/4
    if not has_timesig(mscz):
        raise Failed(f"{mscz} has no time signatures; for free meter add hidden ones with "
                     f"tools/mscz-add-hidden-timesig.py {mscz}")
    old = open(base + ".ly").read() if os.path.exists(base + ".ly") else None
    # 2. MusicXML; mscore may exit 134 after writing a complete file, so check the file
    run(MSCORE, "-o", base + ".musicxml", mscz)
    with open(base + ".musicxml") as f:
        if not f.read().rstrip().endswith("</score-partwise>"):
            raise Failed(f"{base}.musicxml is incomplete")
    # 3. musicxml2ly into a scratch directory, so a failure leaves the .ly alone
    with tempfile.TemporaryDirectory() as tmp:
        out = os.path.join(tmp, base + ".ly")
        r = run("musicxml2ly", "-o", out, base + ".musicxml")
        problems(r.stderr, "musicxml2ly")
        if r.returncode or not os.path.exists(out):
            raise Failed("musicxml2ly failed")
        # 4. hand edits
        ly = line_breaks(stanza_numbers(repeat_counts(splice(open(out).read(), old, mscz))), mscz)
        ly = stressed_syllables(ly)
    with open(base + ".ly", "w") as f:
        f.write(ly)
    # 5. PDF
    r = run("lilypond", base + ".ly")
    problems(r.stderr, "lilypond")
    if r.returncode:
        raise Failed("lilypond failed")
    # 6. note check
    r = run(sys.executable, os.path.join(TOOLS, "check-pdf-notes.py"), mscz, base + ".pdf")
    if r.returncode == 2:
        print("  note check skipped: " + r.stdout.strip().splitlines()[-1].strip())
        return True
    if r.returncode and "problem(s)" not in r.stdout:
        print("  note check crashed: " + (r.stderr.strip().splitlines() or ["?"])[-1])
        return False
    print("\n".join("  " + l.strip() for l in r.stdout.strip().splitlines()[1:] if "PROBLEM" in l or l.strip() == "OK"
                    or "problem(s)" in l))
    return r.returncode == 0


def main(args):
    if not args:
        sys.exit(__doc__.split("\n\n")[1])
    os.chdir(ROOT)
    status, tones = 0, False
    for name in args:
        try:
            if not rebuild(name):
                status = max(status, 1)
            tones |= bool(re.fullmatch(r"heer_ik_roep_t[1-8](\.mscz)?", name))
        except Failed as e:
            print(f"  FAILED: {e}")
            status = 2
    if tones:
        pdfs = [f"heer_ik_roep_t{n}.pdf" for n in range(1, 9)]
        r = run("qpdf", "--empty", "--pages", *pdfs, "--", "heer_ik_roep_alle_tonen.pdf")
        print("== heer_ik_roep_alle_tonen.pdf " + ("joined again" if r.returncode == 0 else "FAILED: " + r.stderr.strip()))
        status = status if r.returncode == 0 else 2
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
