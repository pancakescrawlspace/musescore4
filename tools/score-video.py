#!/usr/bin/env python3
"""Export scores to MP4 with MuseScore's command line, as they are.

The command line always uses the "page layout" view mode, so a score made
for video first goes through score-reflow.py, which sizes its page to the
video. Give both the same --resolution: a score whose page doesn't match the
video's size gets a warning (it is exported anyway).

MuseScore's video carries AAC audio at about 125 kbps. --audio-bitrate (e.g.
384, YouTube's recommendation for stereo) replaces it: the score's audio is
exported again as WAV, put at the moment the video's own audio starts (after
the title card; found by cross-correlating the two) and encoded as 48 kHz AAC
at that bitrate, with Apple's encoder up to 320 kbps (its maximum) and
ffmpeg's above that (which treats the bitrate as a ceiling: 384 gave 261 kbps
on a heer_ik_roep video, so 320 with Apple's encoder is the better choice).
The picture is copied unchanged.

usage: tools/score-video.py score.mscz [...]   writes score.mp4 next to each
       options: --out-dir DIR, --resolution 1080p (2160p 1440p 1080p 720p 480p 360p),
                --fps 24, --audio-bitrate KBPS
"""
import argparse, os, re, shutil, subprocess, sys, tempfile, zipfile

import numpy as np

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


def samples(path, rate, seconds=None):
    """Mono float samples of a file's audio at rate."""
    cmd = ["ffmpeg", "-v", "error", "-i", path, "-vn", "-ac", "1", "-ar", str(rate)]
    cmd += (["-t", str(seconds)] if seconds else []) + ["-f", "f32le", "-"]
    return np.frombuffer(subprocess.run(cmd, capture_output=True, check=True).stdout, np.float32)


def audio_start(video, wav, rate=44100, window=40):
    """Seconds into video where wav's audio starts: the best match of the two."""
    v, a = samples(video, rate, window + 10), samples(wav, rate, window)
    n = 1 << (len(v) + len(a)).bit_length()
    corr = np.fft.irfft(np.fft.rfft(v, n) * np.conj(np.fft.rfft(a, n)), n)
    return int(np.argmax(corr[:len(v)])) / rate


def replace_audio(mp4, score, kbps, tmp):
    """Put score's audio into mp4 again, as AAC at kbps."""
    wav = os.path.join(tmp, "audio.wav")
    subprocess.run([MSCORE, "-o", wav, score], capture_output=True)
    if not os.path.exists(wav):
        return None
    start = audio_start(mp4, wav)
    out = os.path.join(tmp, "audio.mp4")
    codec = ["-c:a", "aac_at"] if kbps <= 320 else ["-c:a", "aac"]
    r = subprocess.run(["ffmpeg", "-v", "error", "-y", "-i", mp4, "-i", wav, "-filter_complex",
                        f"[1:a]adelay=delays={round(start * 44100)}S:all=1,"
                        "aresample=48000:resampler=soxr[a]",
                        "-map", "0:v", "-map", "[a]", "-c:v", "copy", *codec, "-b:a", f"{kbps}k",
                        "-movflags", "+faststart", out], capture_output=True, text=True)
    if r.returncode:
        print(r.stderr[-2000:])
        return None
    shutil.move(out, mp4)
    return start


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("scores", nargs="+")
    ap.add_argument("--out-dir", metavar="DIR", help="folder for the videos (default: each score's)")
    ap.add_argument("--resolution", default="1080p", choices=HEIGHTS)
    ap.add_argument("--fps", default="24", choices=["24", "30", "60"])
    ap.add_argument("--audio-bitrate", type=int, metavar="KBPS",
                    help="replace the video's audio by AAC at this bitrate, e.g. 384")
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
            note = ""
            if args.audio_bitrate:
                start = replace_audio(tmp_mp4, src, args.audio_bitrate, tmp)
                if start is None:
                    print(f"{src}: audio replacement FAILED")
                    status = 1
                    continue
                note = f" (audio {args.audio_bitrate} kbps from {start:.3f} s)"
            shutil.move(tmp_mp4, dst)
        print(f"{src} -> {dst}{note}")
    return status


if __name__ == "__main__":
    sys.exit(main())
