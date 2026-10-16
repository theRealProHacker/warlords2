"""Render the XMIDI music of Warlords II to the WAV cache (out/music/).

A thin wrapper of `python -m warlords2.audio.music_render`; the arguments are the same:

    python -I tools/render_music.py [<game_dir>] [<out_dir>] [--variant opl|gm|all]
                                    [--tracks NAME ...] [--force] [--soundfont PATH]
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from warlords2.audio.music_render import main  # noqa: E402

if __name__ == "__main__":
    sys.exit(main())
