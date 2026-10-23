#!/usr/bin/env python3
"""Choir print of a church score: NAME_koor.ly and NAME_koor.pdf, with larger lyrics
(church_style_koor.ily), leaving NAME.ly and NAME.pdf alone.

usage: tools/koor-variant.py [--size PT] [--free-breaks] [--out-dir DIR] NAME [NAME ...]

NAME is a score name relative to the repository root (heer_ik_roep_t3, or with
.ly/.mscz); its .ly must exist (tools/rebuild-score.py makes it). --size sets
the lyric size in points (default 16). Without --free-breaks the line breaks
stay those of NAME.ly, which come from the line breaks in NAME.mscz; to break
a line inside a measure, split the measure there in the .mscz
(tools/mscz-split-measures.py). The choir print gets as many pages as NAME.pdf
(page-count), so LilyPond tightens the spacing rather than add a page.
The choir print goes next to NAME.ly, or with --out-dir in DIR (relative to
the repository root; the Heer ik roep tones use heer_ik_roep_koor).

--free-breaks is for scores whose .mscz breaks don't suit the larger lyrics:
LilyPond chooses the line breaks, also within measures but only before a new
word, in two passes:

1. The \\break commands are removed, and \\noBreak goes before every soprano
   note that doesn't start a word (from the soprano's lyrics, one token per
   note, \\skip1 for melisma notes; a word split at a melisma, as listed in
   tools/split-words.txt, counts as one word). LilyPond lays the score out with
   the number of systems of NAME.ly on one page (system-count, page-count = 1),
   and reports where it broke the lines.
2. Those breaks are written into NAME_koor.ly as explicit \\break commands (so
   they can be moved by hand; see docs/lilypond_line_breaks.md), and
   system-count is dropped. After a break inside a measure LilyPond doesn't
   repeat an accidental printed earlier in that measure, so the first such
   note after the break gets a forced accidental (cis!4).

Needs lilypond.
"""
import os, re, subprocess, sys, tempfile
from fractions import Fraction

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
VOICES = {'P1': ('PartPOneVoiceOne', 'PartPOneVoiceTwo'), 'P2': ('PartPTwoVoiceOne', 'PartPTwoVoiceTwo')}
NOTE = re.compile(r"(\\[UD]\s+)?\b([a-g](?:is|es|s)*)([',]*)(\d*)(\.*)(?=[\s|)(~]|$)")
TIME = re.compile(r'\\time\s+(\d+)/(\d+)')
# the line breaks of the first pass, as moments (whole notes); the last one is the end
HOOK = r"""
\layout { \context { \Score
  \override NonMusicalPaperColumn.after-line-breaking =
    #(lambda (grob)
       (if (eqv? (ly:item-break-dir grob) LEFT)
           (ly:message "LINEBREAK ~a" (ly:moment-main (ly:grob-property grob 'when)))))
} }
"""
MAJOR_FLATS = ['f', 'bes', 'es', 'as', 'des', 'ges', 'ces']
MAJOR_SHARPS = ['g', 'd', 'a', 'e', 'b', 'fis', 'cis']


def split_pairs():
    """(end of the melisma syllable, start of the rest) for the words in tools/split-words.txt."""
    pairs = set()
    clean = lambda s: re.sub(r'[^\w]', '', s.lower())
    for line in open(os.path.join(ROOT, 'tools', 'split-words.txt')):
        line = line.split('#')[0].strip()
        if '|' not in line: continue
        left, right = line.split('|', 1)
        pairs.add((clean(left.split('-')[-1]), clean(right.split('-')[0])))
    return pairs


def word_starts(src):
    """'start'/'cont' per soprano note, from PartPOneVoiceOneLyricsOne."""
    pairs = split_pairs()
    clean = lambda s: re.sub(r'[^\w]', '', s.strip('"').lower())
    lm = re.search(r'PartPOneVoiceOneLyricsOne = \\lyricmode \{(.*?)\n\}', src, re.S).group(1)
    lm = re.sub(r'\\set \w+ = ##[tf]', '', lm)
    units, hyphen, prev = [], False, None
    for t in re.findall(r'"[^"]*"|\\skip1|--|__|\S+', lm):
        if t == '--': hyphen = True; continue
        if t == '__': continue
        if t == '\\skip1': units.append('cont'); continue
        split = prev is not None and (prev, clean(t)) in pairs
        units.append('cont' if hyphen or split else 'start')
        hyphen, prev = False, clean(t)
    return units


def voice_span(src, var):
    m = re.search(var + r" = \\relative [a-g][a-z]*[',]* \{(.*?)\n\}", src, re.S)
    return m.start(1), m.end(1)


def notes(body):
    """Notes of a voice body: dicts with start moment, span of the pitch name in body, name;
    and the moments at which measures start (each measure begins with \\time here)."""
    out, measures, t, dur = [], [], Fraction(0), Fraction(1, 4)
    events = sorted([(m.start(), 'time', m) for m in TIME.finditer(body)]
                    + [(m.start(), 'note', m) for m in NOTE.finditer(body)], key=lambda e: e[0])
    for pos, kind, m in events:
        if kind == 'time':
            measures.append(t); continue
        before = body[max(0, m.start() - 6):m.start()]
        if re.search(r'\\key\s+$', before):
            continue                       # "\key f \major" is not a note
        if m.group(4):
            dur = Fraction(1, int(m.group(4)))
            d = dur
            for k in range(len(m.group(5))): d += dur / 2 ** (k + 1)
            dur_full = d
        else:
            dur_full = dur if not m.group(5) else dur * Fraction(3, 2)
        out.append(dict(t=t, start=m.start(), pitch_end=m.end(3), name=m.group(2), full=m))
        t += dur_full
        dur = dur_full if not m.group(4) else dur_full
    return out, measures


def key_alterations(src):
    key = re.search(r'\\key ([a-g](?:is|es|s)?) \\major', src).group(1)
    alt = {}
    if key in MAJOR_FLATS:
        for n in 'beadgcf'[:MAJOR_FLATS.index(key) + 1]: alt[n] = -1
    elif key in MAJOR_SHARPS:
        for n in 'fcgdaeb'[:MAJOR_SHARPS.index(key) + 1]: alt[n] = 1
    return alt


def alteration(name):
    return name.count('is') - name.count('es') - (1 if name in ('as', 'es') else 0)


def mark_word_starts(src):
    systems = src.count('\\break') + 1
    src = src.replace('\\break', '')
    units = word_starts(src)
    a, b = voice_span(src, 'PartPOneVoiceOne')
    body, out, pos = src[a:b], [], 0
    ns, _ = notes(body)
    if len(ns) != len(units):
        raise SystemExit(f"soprano has {len(ns)} notes but its lyrics {len(units)} units")
    for k, n in enumerate(ns):
        m = n['full']
        out.append(body[pos:m.start()])
        if k > 0 and units[k] == 'cont':
            out.append('\\noBreak ')
        out.append(m.group(0)); pos = m.end()
    out.append(body[pos:])
    return src[:a] + ''.join(out) + src[b:], systems


def apply_breaks(src, breaks):
    """Explicit \\break before the soprano notes at the break moments; forced accidentals after
    breaks inside a measure."""
    keyalt = key_alterations(src)
    edits = {}                              # var -> list of (position, text)
    a, b = voice_span(src, 'PartPOneVoiceOne')
    sop, measures = notes(src[a:b])
    measures = sorted(set(measures))
    for t in breaks:
        n = next((n for n in sop if n['t'] == t), None)
        if n is None:
            raise SystemExit(f'no soprano note at the break moment {t}')
        edits.setdefault('PartPOneVoiceOne', []).append((n['full'].start(), '\\break '))
        if t in measures:
            continue                        # at a barline: accidentals start afresh anyway
        ms = max(m for m in measures if m < t)
        me = min([m for m in measures if m > t] + [Fraction(10 ** 6)])
        for staff, vars_ in VOICES.items():
            seen = set()                    # (letter, alteration) shown earlier in this measure
            vnotes = {}
            for var in vars_:
                va, vb = voice_span(src, var)
                vnotes[var] = notes(src[va:vb])[0]
                for n in vnotes[var]:
                    if ms <= n['t'] < t and alteration(n['name']) != keyalt.get(n['name'][0], 0):
                        seen.add((n['name'][0], alteration(n['name'])))
            done = set()
            after = sorted(((n['t'], var, n) for var in vars_ for n in vnotes[var] if t <= n['t'] < me),
                           key=lambda e: e[0])
            for _, var, n in after:
                key = (n['name'][0], alteration(n['name']))
                if key in seen and key not in done:
                    edits.setdefault(var, []).append((n['pitch_end'], '!'))
                    done.add(key)
    # apply, voice by voice, from the end so positions stay valid
    for var, ed in edits.items():
        va, vb = voice_span(src, var)
        body = src[va:vb]
        for pos, text in sorted(ed, reverse=True):
            body = body[:pos] + text + body[pos:]
        src = src[:va] + body + src[vb:]
    return src


def lilypond(out, src, workdir):
    path = os.path.join(workdir, os.path.basename(out))
    open(path + '.ly', 'w').write(src)
    return subprocess.run(['lilypond', '-I', ROOT, '-o', path, path + '.ly'], capture_output=True, text=True)


def main(args):
    size, free, out_dir, names = 16, False, None, []
    while args:
        a = args.pop(0)
        if a == '--size': size = int(args.pop(0))
        elif a == '--free-breaks': free = True
        elif a == '--out-dir': out_dir = args.pop(0)
        else: names.append(re.sub(r'\.(ly|mscz)$', '', a))
    if not names:
        sys.exit(__doc__.split('\n\n')[1])
    os.chdir(ROOT)
    status = 0
    for name in names:
        src = open(name + '.ly').read()
        inc = '\\include "church_style.ily"'
        if inc not in src:
            raise SystemExit(f'{name}.ly does not include church_style.ily')
        head = f'koorPt = {size}\n\\include "church_style_koor.ily"\n'
        out, note = name + '_koor', ''
        if out_dir:
            os.makedirs(out_dir, exist_ok=True)
            out = os.path.join(out_dir, os.path.basename(out))
        if free:
            marked, systems = mark_word_starts(src)
            layout = '\\layout { \\context { \\Score forbidBreakBetweenBarLines = ##f } }\n'
            first = marked.replace(inc, head + f'\\paper {{ system-count = {systems} page-count = 1 }}\n'
                                   + layout + HOOK, 1)
            with tempfile.TemporaryDirectory() as tmp:
                r = lilypond(out, first, tmp)
            ends = [Fraction(x) for x in re.findall(r'LINEBREAK (\S+)', r.stderr)]
            breaks = sorted(set(ends))[:-1]          # the last one is the end of the piece
            src = apply_breaks(marked, breaks).replace(inc, head + '\\paper { page-count = 1 }\n' + layout, 1)
            note = f', free breaks ({len(breaks)} breaks)'
        else:
            info = subprocess.run(['mutool', 'info', name + '.pdf'], capture_output=True, text=True).stdout
            pages = re.search(r'Pages: (\d+)', info)
            src = src.replace(inc, head + (f'\\paper {{ page-count = {pages.group(1)} }}\n' if pages else ''), 1)
        open(out + '.ly', 'w').write(src)
        r = subprocess.run(['lilypond', '-I', ROOT, '-o', out, out + '.ly'], capture_output=True, text=True)
        pages = subprocess.run(['mutool', 'info', out + '.pdf'], capture_output=True, text=True).stdout
        n = re.search(r'Pages: (\d+)', pages)
        warn = [l for l in r.stderr.splitlines() if 'warning' in l and 'too few pages' not in l]
        print(f"== {out}.pdf: {n.group(1) if n else '?'} page(s), lyrics {size}pt" + note
              + (f", {len(warn)} warning(s)" if warn else ''))
        for l in warn: print('  ' + l)
        if r.returncode: status = 2
    return status


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
