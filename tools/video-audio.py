#!/usr/bin/env python3
"""Put the audio of one score into the video of another score of the same
music: the picture from the video score (two staves, the spotlighted voice
coloured by voice-color-mscz.py, laid out by score-reflow.py, exported by
score-video.py) and the sound from the audio score (a staff per voice from
voice-explode-mscz.py, with the spotlight in its mixer).

usage: tools/video-audio.py [--audio-dir DIR] [--audio-bitrate 320] video.mscz [...]
       video.mp4, next to each video score, gets the audio of DIR/video.mscz
       (default DIR: audio/ next to the video score)

MuseScore's video carries the video score's own audio (AAC, about 125 kbps),
which starts after the title card. Both scores are exported as WAV, and
cross-correlating the video's audio with the video score's WAV gives that
moment to the sample (3.0418 s at the defaults). Only the same rendering can
be matched like this: the audio score's sounds differ, and matching against
them was off by up to 0.17 s. The audio score's WAV goes in at that moment,
encoded as 48 kHz AAC at --audio-bitrate (default 320), with Apple's encoder
up to 320 kbps (its maximum) and ffmpeg's above that (which treats the
bitrate as a ceiling: 384 gave 261 kbps on a heer_ik_roep video). The
picture is copied unchanged.

The moment is written into the video's metadata (comment "video-audio.py
start=..."), so the script can run again, e.g. after a change in the audio
score's mixer, without exporting the video again. The two scores must have
the same timing (tempo, fermatas, repeats); a warning says if their WAVs
differ in length.
"""
import argparse, json, os, re, shutil, subprocess, sys, tempfile

import numpy as np

MSCORE = "/Applications/MuseScore 4.app/Contents/MacOS/mscore"
RATE = 44100  # MuseScore's WAV export
MATCH = 0.9   # normalised cross-correlation of a rendering with itself, after AAC


def samples(path, seconds=None):
    """Mono float samples of a file's audio at RATE."""
    cmd = ["ffmpeg", "-v", "error", "-i", path, "-vn", "-ac", "1", "-ar", str(RATE)]
    cmd += (["-t", str(seconds)] if seconds else []) + ["-f", "f32le", "-"]
    return np.frombuffer(subprocess.run(cmd, capture_output=True, check=True).stdout, np.float32)


def audio_start(video, wav, window=40):
    """(seconds into video where wav's audio starts, how well it matches there: 1 is
    the same signal)."""
    v, a = samples(video, window + 10), samples(wav, window)
    n = 1 << (len(v) + len(a)).bit_length()
    corr = np.fft.irfft(np.fft.rfft(v, n) * np.conj(np.fft.rfft(a, n)), n)[:len(v)]
    k = int(np.argmax(corr))
    seg = v[k:k + len(a)]
    norm = np.linalg.norm(seg) * np.linalg.norm(a[:len(seg)])
    return k / RATE, float(corr[k] / norm) if norm else 0.0


def recorded_start(mp4):
    """The start an earlier run wrote into mp4's metadata, or None."""
    r = subprocess.run(["ffprobe", "-v", "error", "-show_entries", "format_tags=comment",
                        "-of", "json", mp4], capture_output=True, text=True, check=True)
    comment = json.loads(r.stdout).get("format", {}).get("tags", {}).get("comment", "")
    m = re.fullmatch(r"video-audio\.py start=([0-9.]+)", comment)
    return float(m.group(1)) if m else None


def export_wav(score, wav):
    subprocess.run([MSCORE, "-o", wav, score], capture_output=True)
    if not os.path.exists(wav) or os.path.getsize(wav) == 0:
        sys.exit(f"{score}: WAV export FAILED")


def put_audio(mp4, wav, start, kbps, out):
    """mp4's picture with wav's audio from start (seconds), as AAC at kbps, into out."""
    codec = ["-c:a", "aac_at"] if kbps <= 320 else ["-c:a", "aac"]
    r = subprocess.run(["ffmpeg", "-v", "error", "-y", "-i", mp4, "-i", wav, "-filter_complex",
                        f"[1:a]adelay=delays={round(start * RATE)}S:all=1,"
                        "aresample=48000:resampler=soxr[a]",
                        "-map", "0:v", "-map", "[a]", "-c:v", "copy", *codec, "-b:a", f"{kbps}k",
                        "-metadata", f"comment=video-audio.py start={start:.6f}",
                        "-movflags", "+faststart", out], capture_output=True, text=True)
    if r.returncode:
        print(r.stderr[-2000:])
    return r.returncode == 0


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("scores", nargs="+", metavar="video.mscz")
    ap.add_argument("--audio-dir", metavar="DIR",
                    help="folder of the audio scores, by the video scores' names "
                         "(default: audio/ next to each video score)")
    ap.add_argument("--audio-bitrate", type=int, default=320, metavar="KBPS",
                    help="AAC bitrate (default 320, the most Apple's encoder gives)")
    args = ap.parse_args()
    status = 0
    for score in args.scores:
        base = os.path.splitext(score)[0]
        mp4 = base + ".mp4"
        audio = os.path.join(args.audio_dir or os.path.join(os.path.dirname(score), "audio"),
                             os.path.basename(score))
        missing = [f for f in (mp4, audio) if not os.path.exists(f)]
        if missing:
            print(f"{score}: {' and '.join(missing)} not found"
                  + (" (score-video.py writes the video)" if mp4 in missing else ""))
            status = 1
            continue
        with tempfile.TemporaryDirectory() as tmp:
            video_wav, audio_wav = os.path.join(tmp, "video.wav"), os.path.join(tmp, "audio.wav")
            export_wav(score, video_wav)
            same = os.path.samefile(score, audio)
            if same:
                audio_wav = video_wav
            else:
                export_wav(audio, audio_wav)
            start = recorded_start(mp4)
            if start is None:
                start, match = audio_start(mp4, video_wav)
                if match < MATCH:
                    print(f"{score}: the video's audio isn't this score's (best match "
                          f"{match:.2f}); export the video again with score-video.py")
                    status = 1
                    continue
            lengths = [len(samples(w)) / RATE for w in (video_wav, audio_wav)]
            if abs(lengths[0] - lengths[1]) > 0.5:
                print(f"{score}: warning: its audio lasts {lengths[0]:.1f} s, {audio}'s "
                      f"{lengths[1]:.1f} s; do they have the same timing?")
            out = os.path.join(tmp, "out.mp4")
            if not put_audio(mp4, audio_wav, start, args.audio_bitrate, out):
                print(f"{score}: audio replacement FAILED")
                status = 1
                continue
            shutil.move(out, mp4)
        print(f"{audio} -> {mp4} ({args.audio_bitrate} kbps from {start:.4f} s)")
    return status


if __name__ == "__main__":
    sys.exit(main())
