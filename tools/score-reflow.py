#!/usr/bin/env python3
"""Lay a score out for video as with "Reflow to fit video resolution" in
MuseScore's export dialog, so that score-video.py can export it.

MuseScore's command line (--score-video) has no option for reflow: it always
uses the "page layout" view mode. This script writes a copy of the score with
the style changes MuseScore applies for reflow (the Flexible view mode in
src/importexport/videoexport/internal/videowriter.cpp, MuseScore 4.7.5). Its
page has the video's aspect ratio, so page layout then fills the frame
exactly as reflow does:

  page = video size / 300 dpi (6.4 x 3.6 in for 1080p), no top/bottom
  margins, one-sided, no header/footer, system distance 10 sp, staff
  borders 7/5 sp, no title frame and no instrument names.

Reflow renders a score with more than three staves at a lower dpi, so that
the original page's height fits the video (about 91 dpi for A4 at 1080p);
that makes a short four-staff score one tiny line, so it isn't copied.
Instead --staff-scale (e.g. 0.75) makes the staves smaller where a system
is taller than the frame (four staves with two lines of text), or larger
where it fills only part of it. --top-margin and --side-margin (inches)
replace reflow's margins (none at the top, the score's own at the sides):
two staves with lyrics at --staff-scale 1.4 --side-margin 0.2 --top-margin
0.18 fill the frame, centred, and the longest lines still fit.

Reflow only hides the title frame; the video's title card still reads the
title from it. The command line ignores showVerticalFrames in
viewsettings.json, so the frame is removed instead, and its title text goes
into the workTitle metadata, which the title card falls back to.
Checked against a video exported from the dialog: every frame identical.

The copy keeps the score's name, in another folder (--out-dir), so its video
gets the same name too, also when exported from MuseScore's dialog (with
reflow off: the copy is reflowed already).

usage: tools/score-reflow.py --out-dir DIR score.mscz [...]   writes DIR/score.mscz
       options: --resolution 1080p (2160p 1440p 1080p 720p 480p 360p),
                --staff-scale 1.0, --top-margin 0, --side-margin IN
"""
import argparse, html, os, re, sys, zipfile

HEIGHTS = {"2160p": 2160, "1440p": 1440, "1080p": 1080, "720p": 720, "480p": 480, "360p": 360}
CANVAS_DPI = 300.0  # VideoWriter::Config::canvasDpi


def set_style(mss, key, value):
    tag = re.compile(rf"<{key}>[^<]*</{key}>")
    new = f"<{key}>{value}</{key}>"
    if tag.search(mss):
        return tag.sub(new, mss, count=1)
    return mss.replace("</Style>", f"    {new}\n  </Style>", 1)


def get_style(mss, key, default):
    m = re.search(rf"<{key}>([^<]*)</{key}>", mss)
    return float(m.group(1)) if m else default


def title_text(mscx):
    """Plain text of the title frame's title, as MuseScore's Text::plainText() gives it."""
    m = re.search(rb"<VBox>.*?<style>title</style>.*?<text>(.*?)</text>", mscx, flags=re.S)
    if not m:
        return None
    t = re.sub(r"<br\s*/>", "\n", m.group(1).decode("utf-8"))
    t = html.unescape(re.sub(r"<[^>]+>", "", t))
    return t


def card_title(title):
    """The title on one line: the title card shows only the first ("Heer ik roep",
    without "toon 1")."""
    return " – ".join(line.strip() for line in title.splitlines() if line.strip())


def reflow_copy(src, dst, width, height, staff_scale=1.0, top_margin=0.0, side_margin=None):
    with zipfile.ZipFile(src) as zin:
        files = [(i, zin.read(i)) for i in zin.infolist()]
    out = []
    for info, data in files:
        if info.filename == "score_style.mss":
            mss = data.decode("utf-8")
            pw, ph = width / CANVAS_DPI, height / CANVAS_DPI
            if staff_scale != 1.0:  # not reflow's: smaller staves, so a tall system fits the frame
                mss = set_style(mss, "spatium", round(get_style(mss, "spatium", 1.75) * staff_scale, 4))
            if side_margin is not None:  # not reflow's either
                for key in ("pageOddLeftMargin", "pageEvenLeftMargin"):
                    mss = set_style(mss, key, side_margin)
            left = get_style(mss, "pageOddLeftMargin", 0.590551) + get_style(mss, "pageEvenLeftMargin", 0.590551)
            for key, value in (("pageWidth", pw), ("pageHeight", ph), ("pagePrintableWidth", round(pw - left, 6)),
                               ("pageEvenTopMargin", top_margin), ("pageEvenBottomMargin", 0),
                               ("pageOddTopMargin", top_margin), ("pageOddBottomMargin", 0),
                               ("pageTwosided", 0), ("showHeader", 0), ("showFooter", 0),
                               ("minSystemDistance", 10), ("maxSystemDistance", 10),
                               ("staffLowerBorder", 5), ("staffUpperBorder", 7)):
                mss = set_style(mss, key, value)
            data = mss.encode("utf-8")
        elif info.filename.endswith(".mscx"):
            # Reflow hides vertical frames from the layout. The command line can't (it
            # ignores showVerticalFrames in viewsettings.json), so the title frame is
            # removed. The video's title card falls back to the workTitle metadata,
            # so that gets the title frame's text, on one line.
            title = title_text(data)
            data = re.sub(rb"[ \t]*<VBox>.*?</VBox>\n?", b"", data, flags=re.S)
            # reflow also hides instrument names ("Women", "W.")
            data = re.sub(rb"<(longName|shortName)>.*?</\1>", rb"<\1></\1>", data, flags=re.S)
            if title is not None:
                data = re.sub(rb'<metaTag name="workTitle">[^<]*</metaTag>',
                              b'<metaTag name="workTitle">' + html.escape(card_title(title), quote=False).encode("utf-8") + b"</metaTag>",
                              data, count=1)
        out.append((info, data))
    if not any(i.filename == "score_style.mss" for i, _ in files):
        sys.exit(f"{src}: no score_style.mss in the .mscz")
    with zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED) as zout:
        for info, data in out:
            zout.writestr(info, data)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("scores", nargs="+")
    ap.add_argument("--out-dir", metavar="DIR", required=True,
                    help="folder for the reflowed copies, which keep the scores' names")
    ap.add_argument("--resolution", default="1080p", choices=HEIGHTS,
                    help="the video's size; give score-video.py the same")
    ap.add_argument("--staff-scale", type=float, default=1.0,
                    help="staff size factor, e.g. 0.75 when a system is taller than the frame")
    ap.add_argument("--top-margin", type=float, default=0.0, metavar="IN",
                    help="page top margin in inches (default 0, as reflow), e.g. 0.18")
    ap.add_argument("--side-margin", type=float, metavar="IN",
                    help="left and right page margins in inches (default: the score's), e.g. 0.2")
    args = ap.parse_args()
    height = HEIGHTS[args.resolution]
    width = height * 16 // 9
    os.makedirs(args.out_dir, exist_ok=True)
    for src in args.scores:
        dst = os.path.join(args.out_dir, os.path.basename(src))
        if os.path.exists(dst) and os.path.samefile(dst, src):
            sys.exit(f"{src}: --out-dir is the score's own folder; it would be overwritten")
        reflow_copy(src, dst, width, height, args.staff_scale, args.top_margin, args.side_margin)
        print(f"{src} -> {dst}")


if __name__ == "__main__":
    main()
