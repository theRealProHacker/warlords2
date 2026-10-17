#!/usr/bin/env python3
"""Build the bundle's file icons from the user's game files (the title "W", the window icon).

usage:  .venv/bin/python -I tools/make_icons.py [GAME_DIR] [OUT_DIR]
        (defaults: original/game/Warlrd2 or WL2_DATA  ->  packaging)

Writes OUT_DIR/icon.png (256), icon.ico (16/24/32/48/64/128/256) and icon.icns (16..512 and
their @2x).  Every size is `assets.sprites.window_icon(store, size)` (nearest-neighbour), so no
size is resampled by a writer.  The .icns is written here; the .ico needs Pillow (tools only,
not a dependency of the game).  The files are committed under packaging/ (user decision
2026-10-17), since the CI build has no game files.
"""
from __future__ import annotations

import io
import os
import struct
import sys
from pathlib import Path

os.environ.setdefault("SDL_VIDEODRIVER", "dummy")
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))   # run without installing

import pygame  # noqa: E402

from warlords2.assets.sprites import window_icon  # noqa: E402
from warlords2.assets.store import AssetStore  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.paths import default_data  # noqa: E402

ICO_SIZES = [16, 24, 32, 48, 64, 128, 256]
# icns element type -> pixel size (PNG payloads; the @2x types hold twice the point size)
ICNS_TYPES = [(b"icp4", 16), (b"icp5", 32), (b"icp6", 64), (b"ic07", 128), (b"ic08", 256),
              (b"ic09", 512), (b"ic11", 32), (b"ic12", 64), (b"ic13", 512), (b"ic14", 1024)]
PNG_SIZE = 256


def png_bytes(surf: pygame.Surface) -> bytes:
    buf = io.BytesIO()
    pygame.image.save(surf, buf, "icon.png")
    return buf.getvalue()


def icns_bytes(pngs: dict[int, bytes]) -> bytes:
    """An .icns file: b"icns", total length, then (type, length, PNG) elements."""
    body = b"".join(t + struct.pack(">I", 8 + len(pngs[n])) + pngs[n] for t, n in ICNS_TYPES)
    return b"icns" + struct.pack(">I", 8 + len(body)) + body


def write_ico(path: Path, surfs: dict[int, pygame.Surface]) -> None:
    from PIL import Image
    imgs = [Image.frombytes("RGBA", s.get_size(), pygame.image.tobytes(s, "RGBA"))
            for _, s in sorted(surfs.items(), reverse=True)]
    imgs[0].save(path, format="ICO", sizes=[i.size for i in imgs], append_images=imgs[1:])


def main(argv: list[str]) -> None:
    root = Path(argv[0]) if argv else default_data()
    out = Path(argv[1]) if len(argv) > 1 else Path(__file__).resolve().parent.parent / "packaging"
    pygame.display.init()
    store = AssetStore(GameDir(root))
    sizes = sorted(set(ICO_SIZES) | {n for _, n in ICNS_TYPES} | {PNG_SIZE})
    surfs = {n: window_icon(store, n) for n in sizes}
    pngs = {n: png_bytes(s) for n, s in surfs.items()}
    out.mkdir(parents=True, exist_ok=True)
    (out / "icon.png").write_bytes(pngs[PNG_SIZE])
    (out / "icon.icns").write_bytes(icns_bytes(pngs))
    write_ico(out / "icon.ico", {n: surfs[n] for n in ICO_SIZES})
    for name in ("icon.png", "icon.ico", "icon.icns"):
        print(out / name, (out / name).stat().st_size)


if __name__ == "__main__":
    main(sys.argv[1:])
