#!/usr/bin/env python3
"""Decode the Warlords II (1993, DOS, non-Deluxe) graphics and font files to PNG.

usage:  .venv/bin/python -I tools/dump_gfx.py [GAME_DIR] [OUT_DIR]
        (defaults: original/game/Warlrd2  ->  out/gfx)

Formats are specified in docs/formats/graphics.md.  The decoders live in
warlords2.formats (pal, pck, font, gfxscript); this script only writes PNGs.

For every *.PCK / *.FNT below GAME_DIR this writes to OUT_DIR/<relative path>/ :
    sheet.png     the whole bitmap, opaque, in the palette the game uses for it
    contact.png   the bitmap x2 with the frame grid and frame numbers drawn in
    frames/NNN.png (only when the file holds several images) one RGBA PNG per
                  frame, colour-keyed where the game builds a mask for the file
"""
from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))   # run without installing

from warlords2.formats.font import glyph_rects, parse_fin  # noqa: E402
from warlords2.formats.pal import parse_pal  # noqa: E402
from warlords2.formats.pck import decode_pck, sheet_info  # noqa: E402

# --------------------------------------------------------------------------- dumping (needs Pillow)

def _indexed_image(width, height, rows, palette):
    from PIL import Image
    im = Image.frombytes("P", (width, height), b"".join(rows))
    im.putpalette([c for rgb in palette for c in rgb])
    return im


def _rgba(im, key):
    out = im.convert("RGBA")
    if key is not None:
        px = im.tobytes()
        alpha = bytes(0 if p == key else 255 for p in px)
        from PIL import Image
        out.putalpha(Image.frombytes("L", im.size, alpha))
    return out


def _contact(im, frames, scale=2):
    from PIL import ImageDraw
    big = im.convert("RGB").resize((im.width * scale, im.height * scale), 0)
    if len(frames) > 1:
        d = ImageDraw.Draw(big)
        for i, (x, y, w, h) in enumerate(frames):
            d.rectangle([x * scale, y * scale, (x + w) * scale - 1, (y + h) * scale - 1],
                        outline=(255, 0, 255))
            if w * scale >= 24:
                d.text((x * scale + 2, y * scale + 1), str(i), fill=(255, 255, 0))
    return big


def dump_file(game: Path, path: Path, out: Path) -> dict:
    rel = path.relative_to(game).as_posix()
    info = sheet_info(rel)
    width, height, rows = decode_pck(path.read_bytes())
    palette = parse_pal((game / info.palette).read_bytes())
    im = _indexed_image(width, height, rows, palette)
    if path.suffix.upper() == ".FNT":
        fi = parse_fin(path.with_suffix(".FIN").read_bytes())
        if fi.sheet_width != width or height % fi.block_height:
            raise ValueError(f"FIN does not fit FNT ({fi.sheet_width}x{fi.block_height} vs {width}x{height})")
        frames = glyph_rects(fi)
        key = fi.variants[0][2]
    else:
        frames = info.frames(width, height)
        key = info.key
    d = out / rel
    d.mkdir(parents=True, exist_ok=True)
    im.save(d / "sheet.png")
    _contact(im, [f for f in frames if f[2]]).save(d / "contact.png")
    if len(frames) > 1:
        (d / "frames").mkdir(exist_ok=True)
        for i, (x, y, w, h) in enumerate(frames):
            if w and h:
                _rgba(im.crop((x, y, x + w, y + h)), key).save(d / "frames" / f"{i:03d}.png")
    return {"file": rel, "width": width, "height": height, "frames": len(frames), "key": key,
            "palette": info.palette, "what": info.what}


def find_files(game: Path) -> list[Path]:
    return sorted(p for p in game.rglob("*") if p.suffix.upper() in (".PCK", ".FNT"))


def main(argv) -> int:
    root = Path(__file__).resolve().parent.parent
    game = Path(argv[1]) if len(argv) > 1 else root / "original/game/Warlrd2"
    out = Path(argv[2]) if len(argv) > 2 else root / "out/gfx"
    failed = []
    files = find_files(game)
    for p in files:
        try:
            r = dump_file(game, p, out)
            print(f"{r['file']:<28} {r['width']:>3}x{r['height']:<3} frames={r['frames']:<3} "
                  f"key={r['key']!s:<4} {r['palette']}")
        except Exception as e:  # report precisely, keep going
            failed.append((p, e))
            print(f"{p.relative_to(game).as_posix():<28} FAILED: {type(e).__name__}: {e}")
    print(f"{len(files) - len(failed)} of {len(files)} files decoded -> {out}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
