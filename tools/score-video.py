#!/usr/bin/env python3
"""Export a score to MP4 with MuseScore, laid out as with "Reflow to fit video
resolution" in the export dialog.

MuseScore's command line (--score-video) has no option for that: it always
uses the "page layout" view mode. This script makes a temporary copy of the
score with the style changes MuseScore applies for reflow (the Flexible
view mode in src/importexport/videoexport/internal/videowriter.cpp,
MuseScore 4.7.5), and exports that copy. Its page has the video's aspect
ratio, so page layout then fills the frame exactly as reflow does:

  page = video size / 300 dpi (6.4 x 3.6 in for 1080p), no top/bottom
  margins, one-sided, no header/footer, system distance 10 sp, staff
  borders 7/5 sp, no title frame and no instrument names.

Reflow only hides the title frame; the video's title card still reads the
title from it. The command line ignores showVerticalFrames in
viewsettings.json, so the frame is removed instead, and its title text goes
into the workTitle metadata, which the title card falls back to.
Checked against a video exported from the dialog: every frame identical.

usage: tools/score-video.py score.mscz [...]   writes score.mp4 next to each
       options: --resolution 1080p (2160p 1440p 1080p 720p 480p 360p), --fps 24
"""
import argparse, html, os, re, shutil, subprocess, sys, tempfile, zipfile

MSCORE = "/Applications/MuseScore 4.app/Contents/MacOS/mscore"
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



def reflow_copy(src, dst, width, height):
    with zipfile.ZipFile(src) as zin:
        files = [(i, zin.read(i)) for i in zin.infolist()]
    out = []
    for info, data in files:
        if info.filename == "score_style.mss":
            mss = data.decode("utf-8")
            pw, ph = width / CANVAS_DPI, height / CANVAS_DPI
            left = get_style(mss, "pageOddLeftMargin", 0.590551) + get_style(mss, "pageEvenLeftMargin", 0.590551)
            for key, value in (("pageWidth", pw), ("pageHeight", ph), ("pagePrintableWidth", round(pw - left, 6)),
                               ("pageEvenTopMargin", 0), ("pageEvenBottomMargin", 0),
                               ("pageOddTopMargin", 0), ("pageOddBottomMargin", 0),
                               ("pageTwosided", 0), ("showHeader", 0), ("showFooter", 0),
                               ("minSystemDistance", 10), ("maxSystemDistance", 10),
                               ("staffLowerBorder", 5), ("staffUpperBorder", 7)):
                mss = set_style(mss, key, value)
            data = mss.encode("utf-8")
        elif info.filename.endswith(".mscx"):
            # Reflow hides vertical frames from the layout. The command line can't (it
            # ignores showVerticalFrames in viewsettings.json), so the title frame is
            # removed. The video's title card falls back to the workTitle metadata,
            # so that gets the title frame's text.
            title = title_text(data)
            data = re.sub(rb"[ \t]*<VBox>.*?</VBox>\n", b"", data, flags=re.S)
            # reflow also hides instrument names ("Women", "W.")
            data = re.sub(rb"<(longName|shortName)>.*?</\1>", rb"<\1></\1>", data, flags=re.S)
            if title is not None:
                data = re.sub(rb'<metaTag name="workTitle">[^<]*</metaTag>',
                              b'<metaTag name="workTitle">' + html.escape(title, quote=False).encode("utf-8") + b"</metaTag>",
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
    ap.add_argument("--resolution", default="1080p", choices=HEIGHTS)
    ap.add_argument("--fps", default="24", choices=["24", "30", "60"])
    args = ap.parse_args()
    height = HEIGHTS[args.resolution]
    width = height * 16 // 9
    status = 0
    for src in args.scores:
        dst = os.path.splitext(src)[0] + ".mp4"
        with tempfile.TemporaryDirectory() as tmp:
            copy = os.path.join(tmp, os.path.basename(src))
            reflow_copy(src, copy, width, height)
            tmp_mp4 = os.path.join(tmp, "video.mp4")
            r = subprocess.run([MSCORE, "--score-video", "--resolution", args.resolution, "--fps", args.fps,
                                "-o", tmp_mp4, copy], capture_output=True, text=True)
            if not os.path.exists(tmp_mp4) or os.path.getsize(tmp_mp4) == 0:
                print(f"{src}: export FAILED (exit {r.returncode})\n{r.stderr[-2000:]}")
                status = 1
                continue
            shutil.move(tmp_mp4, dst)
        print(f"{src} -> {dst}")
    return status


if __name__ == "__main__":
    sys.exit(main())
