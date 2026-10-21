#!/usr/bin/env python3
"""Export scores to MP4 with MuseScore's command line, as they are.

The command line always uses the "page layout" view mode, so a score made
for video first goes through score-reflow.py, which sizes its page to the
video. Give both the same --resolution: a score whose page doesn't match the
video's size gets a warning (it is exported anyway).

MuseScore's video carries AAC audio at about 125 kbps, of the score itself;
video-audio.py replaces it, by the same audio at a higher bitrate or by that
of another score of the same music.

usage: tools/score-video.py score.mscz [...]   writes score.mp4 next to each
       options: --out-dir DIR, --resolution 1080p (2160p 1440p 1080p 720p 480p 360p),
                --fps 24
"""
import argparse, os, re, shutil, subprocess, sys, tempfile, zipfile

MSCORE = "/Applications/MuseScore 4.app/Contents/MacOS/mscore"
HEIGHTS = {"2160p": 2160, "1440p": 1440, "1080p": 1080, "720p": 720, "480p": 480, "360p": 360}
CANVAS_DPI = 300.0  # VideoWriter::Config::canvasDpi


def page_size(score):
    """(width, height) of the score's page in inches, None if not in its style."""
    with zipfile.ZipFile(score) as z:
        if "score_style.mss" not in z.namelist():
            return None
        mss = z.read("score_style.mss").decode("utf-8")
    size = [re.search(rf"<{k}>([^<]*)</{k}>", mss) for k in ("pageWidth", "pageHeight")]
    return tuple(float(m.group(1)) for m in size) if all(size) else None


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("scores", nargs="+")
    ap.add_argument("--out-dir", metavar="DIR", help="folder for the videos (default: each score's)")
    ap.add_argument("--resolution", default="1080p", choices=HEIGHTS)
    ap.add_argument("--fps", default="24", choices=["24", "30", "60"])
    args = ap.parse_args()
    height = HEIGHTS[args.resolution]
    video = (height * 16 // 9 / CANVAS_DPI, height / CANVAS_DPI)
    if args.out_dir:
        os.makedirs(args.out_dir, exist_ok=True)
    status = 0
    for src in args.scores:
        page = page_size(src)
        if page is None or any(abs(p - v) > 0.01 for p, v in zip(page, video)):
            print(f"{src}: warning: the page isn't {video[0]:g} x {video[1]:g} in, the "
                  f"{args.resolution} video's; run score-reflow.py --resolution "
                  f"{args.resolution} first")
        name = os.path.splitext(os.path.basename(src))[0] + ".mp4"
        dst = os.path.join(args.out_dir or os.path.dirname(src), name)
        with tempfile.TemporaryDirectory() as tmp:
            tmp_mp4 = os.path.join(tmp, "video.mp4")
            r = subprocess.run([MSCORE, "--score-video", "--resolution", args.resolution,
                                "--fps", args.fps, "-o", tmp_mp4, src],
                               capture_output=True, text=True)
            if not os.path.exists(tmp_mp4) or os.path.getsize(tmp_mp4) == 0:
                print(f"{src}: export FAILED (exit {r.returncode})\n{r.stderr[-2000:]}")
                status = 1
                continue
            shutil.move(tmp_mp4, dst)
        print(f"{src} -> {dst}")
    return status


if __name__ == "__main__":
    sys.exit(main())
