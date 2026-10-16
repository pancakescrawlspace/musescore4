#!/usr/bin/env python3
"""Rebuild the MusicXML, LilyPond source and PDF of church scores from their
.mscz, carrying the hand edits over from the current .ly (see README.md).

usage: tools/rebuild-score.py NAME [NAME ...]

NAME is a score name like heer_ik_roep_t3 (or heer_ik_roep_t3.mscz). A
score with time signatures is exported directly, to NAME_styled.*; a
free-meter score first gets a NAME_timesig.mscz copy with hidden time
signatures, and the outputs are NAME_timesig.*.

Hand edits taken from the current .ly: the \\include of church_style.ily,
the hand-edit comment, the \\header title/subtitle, and the line-break
spacer (`{ s4*N \\bar "" }`). Any other "% hand edit:" line makes the
script stop before the .ly is replaced, so redo those by hand. A score
without a .ly yet gets its title and subtitle from the score's title frame.

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
    """(title, subtitle or None) from the score's title frame, e.g. "<b>Heer ik roep<br/></b>toon 1"."""
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


def splice(new, old, mscz):
    """Apply the hand edits to fresh musicxml2ly output: copied from the old .ly, or made from the title frame."""
    if old is not None:
        inc = re.search(r'\\include "church_style.ily"\n', old).group(0)
        com = re.search(r"% hand edits after conversion:.*\n", old).group(0)
        head = re.search(r"\\header \{\n((?:    (?:title|subtitle) = .*\n)+)", old).group(1)
    else:
        title, subtitle = title_frame(mscz)
        print(f"  no .ly yet: title {title!r}" + (f", subtitle {subtitle!r}" if subtitle else ""))
        inc, com = '\\include "church_style.ily"\n', COMMENT + "\n"
        head = f'    title = "{title}"\n' + (f'    subtitle = "{subtitle}"\n' if subtitle else "")
    new = new.replace('\\version "2.24.4"\n', '\\version "2.24.4"\n' + inc, 1)
    conv = re.search(r"% automatically converted by musicxml2ly from .*\n", new).group(0)
    new = new.replace(conv, conv + com, 1)
    generated = re.search(r'    title =  "[^"]*"\n    composer =  "[^"]*"\n', new)
    if not generated:
        raise Failed("musicxml2ly output has no title/composer to replace")
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


def has_timesig(mscz):
    with zipfile.ZipFile(mscz) as z:
        return any(b"<TimeSig>" in z.read(n) for n in z.namelist() if n.endswith(".mscx"))


def rebuild(name):
    name = re.sub(r"\.mscz$", "", name)
    mscz = name + ".mscz"
    if not os.path.exists(mscz):
        raise Failed(f"{mscz} not found")
    styled = has_timesig(mscz)
    base = name + ("_styled" if styled else "_timesig")
    print(f"== {mscz} -> {base}.*")
    old = open(base + ".ly").read() if os.path.exists(base + ".ly") else None
    # 1. hidden time signatures
    if styled:
        source = mscz
    else:
        r = run(os.path.join(TOOLS, "mscz-add-hidden-timesig.py"), mscz, base + ".mscz")
        if r.returncode:
            raise Failed(r.stderr.strip())
        source = base + ".mscz"
    # 2. MusicXML; mscore may exit 134 after writing a complete file, so check the file
    run(MSCORE, "-o", base + ".musicxml", source)
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
        ly = splice(open(out).read(), old, mscz)
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
        pdfs = [f"heer_ik_roep_t{n}_timesig.pdf" for n in range(1, 9)]
        r = run("qpdf", "--empty", "--pages", *pdfs, "--", "heer_ik_roep_alle_tonen.pdf")
        print("== heer_ik_roep_alle_tonen.pdf " + ("joined again" if r.returncode == 0 else "FAILED: " + r.stderr.strip()))
        status = status if r.returncode == 0 else 2
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
