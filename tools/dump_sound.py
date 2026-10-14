"""Convert the digital sounds of Warlords II (1993, DOS) to WAV.

usage: python -I tools/dump_sound.py <gamedir> <outdir>

SOUND/*.8SN and START/DING0.SND are headerless unsigned 8-bit mono PCM.  WARLORD2.EXE
hands the whole file to the DIGPAK driver (INT 66h, AX=068Ah/068Bh) with the frequency
field of the sound structure set to 11000 (resident 155e:05d0 and 155e:06a9), so the
WAV files are written as 11000 Hz / 8-bit unsigned / mono with the samples unchanged.
See docs/formats/sound.md.
"""
# The decoder is warlords2.formats.sound; this script only writes WAV files.
from __future__ import annotations

import os
import sys
import wave

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))  # run without installing

from warlords2.formats.sound import RATE, load_8sn  # noqa: E402


def pcm_files(game):
    snd = os.path.join(game, "SOUND")
    for f in sorted(os.listdir(snd)):
        if f.upper().endswith(".8SN"):
            yield os.path.join(snd, f), f[:-4] + ".wav"
    ding = os.path.join(game, "START", "DING0.SND")
    if os.path.exists(ding):
        yield ding, "START_DING0.wav"


def convert(src, dst, rate=RATE):
    pcm = load_8sn(open(src, "rb").read())
    with wave.open(dst, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(pcm.width)  # 8-bit WAV is unsigned, like the source
        w.setframerate(rate)
        w.writeframes(pcm.samples)
    return len(pcm.samples)


def main(argv):
    if len(argv) != 3:
        print(__doc__)
        return 2
    game, outdir = argv[1], argv[2]
    os.makedirs(outdir, exist_ok=True)
    n = 0
    for src, name in pcm_files(game):
        convert(src, os.path.join(outdir, name))
        n += 1
    print("wrote %d wav files to %s" % (n, outdir))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
