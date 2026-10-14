"""Checks docs/formats/graphics.md (warlords2.formats pal/pck/font/gfxscript and the
tools/dump_gfx.py CLI) against the user's local copy of Warlords II.

Needs the game data (`gamedata` marker, tests/conftest.py).
"""
import sys
from collections import Counter
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

pytestmark = pytest.mark.gamedata

import dump_gfx  # noqa: E402

from warlords2.formats import font, gfxscript, pal, pck  # noqa: E402
from warlords2.formats.gamedir import default_root  # noqa: E402

DATA = default_root()                          # only to list the parametrize ids at collection

# relative path -> (width, height, frame count) as documented
EXPECTED = {
    "CHANCE17.FNT": (416, 102, 96), "CHANCE36.FNT": (560, 148, 96), "TEXT.FNT": (320, 135, 96),
    "STAND.PCK": (192, 20, 12),
    "PICS/ABITS.PCK": (480, 40, 1), "PICS/ADVISOR.PCK": (128, 130, 1),
    "PICS/BIGARMY.PCK": (128, 128, 1), "PICS/BSCROLL.PCK": (336, 347, 1),
    "PICS/BUTTON.PCK": (544, 197, 1), "PICS/CITY.PCK": (320, 312, 1),
    "PICS/CITYBU.PCK": (416, 120, 1), "PICS/CURS.PCK": (240, 80, 4),
    "PICS/DBUTTON.PCK": (400, 134, 1), "PICS/DIPLOM.PCK": (416, 85, 1),
    "PICS/FHERO.PCK": (224, 170, 1), "PICS/FORDER.PCK": (192, 68, 1),
    "PICS/HELPGFX.PCK": (512, 110, 1), "PICS/HIDDEN.PCK": (336, 82, 1),
    "PICS/LEVEL2.PCK": (320, 200, 1), "PICS/LEVEL3.PCK": (320, 200, 1),
    "PICS/LEVEL4.PCK": (320, 200, 1), "PICS/MARBLE.PCK": (480, 360, 1),
    "PICS/MEDAL0.PCK": (320, 200, 1), "PICS/MEDAL1.PCK": (320, 200, 1),
    "PICS/MEDAL2.PCK": (320, 200, 1), "PICS/MEDAL3.PCK": (320, 200, 1),
    "PICS/MENUBUTT.PCK": (320, 197, 1), "PICS/MHERO.PCK": (224, 170, 1),
    "PICS/NEWSCEN.PCK": (480, 360, 1), "PICS/NEWSCNBU.PCK": (128, 133, 1),
    "PICS/POPUP.PCK": (256, 75, 1), "PICS/POPUP2.PCK": (256, 75, 1),
    "PICS/POPUP3.PCK": (256, 128, 1), "PICS/RESIGN.PCK": (368, 390, 1),
    "PICS/RESIGNBU.PCK": (192, 138, 1), "PICS/RESIGNNO.PCK": (368, 390, 1),
    "PICS/RESIGNYE.PCK": (368, 390, 1), "PICS/RMAPBAR.PCK": (192, 21, 1),
    "PICS/SCREEN0.PCK": (320, 240, 1), "PICS/SCREEN1.PCK": (320, 240, 1),
    "PICS/SCREEN2.PCK": (320, 240, 1), "PICS/SCREEN3.PCK": (320, 240, 1),
    "PICS/SCROLL.PCK": (256, 252, 1), "PICS/SEARCH.PCK": (320, 200, 1),
    "PICS/SETUPBU.PCK": (480, 318, 1), "PICS/SPECBITS.PCK": (320, 126, 1),
    "PICS/SSG.PCK": (144, 64, 1), "PICS/STACK.PCK": (400, 112, 1),
    "PICS/STARTBU.PCK": (640, 265, 1), "PICS/STARTUP0.PCK": (320, 240, 1),
    "PICS/STARTUP1.PCK": (320, 240, 1), "PICS/STARTUP2.PCK": (320, 240, 1),
    "PICS/STARTUP3.PCK": (320, 240, 1), "PICS/STRAT.PCK": (224, 312, 1),
    "PICS/TEMPLE.PCK": (320, 280, 1), "PICS/VICTORY.PCK": (320, 200, 1),
    "PICS/VOICE.PCK": (352, 442, 1), "PICS/VOICEBIT.PCK": (160, 141, 1),
    "PICS/WAR.PCK": (240, 180, 1),
    "START/BLACK.PCK": (640, 480, 1), "START/SPARKLE.PCK": (128, 41, 4),
    "START/SSG.PCK": (640, 480, 1), "START/START.PCK": (640, 480, 1),
    "START/STEXT.PCK": (480, 210, 1),
    "TERRAIN0/ASHADOW.PCK": (512, 64, 32), "TERRAIN0/ATRANS2.PCK": (144, 246, 1),
    "TERRAIN0/BSHIELD.PCK": (288, 59, 9), "TERRAIN0/CITYBACK.PCK": (240, 86, 1),
    "TERRAIN0/ROAD.PCK": (640, 80, 32), "TERRAIN0/SCENERY0.PCK": (640, 240, 96),
    "TERRAIN0/SCENERY1.PCK": (640, 240, 96), "TERRAIN0/SHIELDS.PCK": (368, 64, 34),
}
EXPECTED.update({f"TERRAIN0/A{i}.PCK": (512, 64, 32) for i in range(9)})
EXPECTED.update({f"TERRAIN0/MOVEBAR{i}.PCK": (320, 18, 1) for i in range(8)})
EXPECTED.update({f"{s}/PICS/SCENARIO.PCK": (272, 230, 1)
                 for s in ("DRAGON", "ERYTHEA", "HADESHA", "ISLADIA", "SORCERY", "TUTORIA")})

RELS = [p.relative_to(DATA).as_posix() for p in dump_gfx.find_files(DATA)] if DATA.is_dir() else []


@pytest.fixture(scope="module")
def root(game):
    return Path(game)


def _frames(root, rel, width, height):
    if rel.endswith(".FNT"):
        return font.glyph_rects(font.parse_fin((root / rel).with_suffix(".FIN").read_bytes()))
    return pck.sheet_info(rel).frames(width, height)


def test_file_set_is_the_documented_one(root):
    assert sorted(p.relative_to(root).as_posix() for p in dump_gfx.find_files(root)) == sorted(EXPECTED)


@pytest.mark.parametrize("rel", RELS)
def test_pck_decodes_with_documented_size_and_frames(root, rel):
    bm = pck.decode_pck((root / rel).read_bytes())  # raises on any stream error
    width, height, rows = bm
    assert (bm.width, bm.height, bm.rows) == (width, height, rows)
    assert len(rows) == height and all(len(r) == width for r in rows)
    assert max(map(max, rows)) <= 15
    frames = _frames(root, rel, width, height)
    assert (width, height, len(frames)) == EXPECTED[rel]
    assert width % 16 == 0
    for x, y, w, h in frames:
        assert 0 <= x and 0 <= y and x + w <= width and y + h <= height


def test_decoder_rejects_corruption(root):
    data = (root / "STAND.PCK").read_bytes()
    with pytest.raises((ValueError, IndexError)):
        pck.decode_pck(data[:-1])
    with pytest.raises(ValueError):
        pck.decode_pck(data + b"\0")
    with pytest.raises(ValueError):
        pck.decode_pck(b"\x02\x00" + data[2:])


@pytest.mark.parametrize("rel", sorted(p.relative_to(DATA).as_posix()
                                       for p in DATA.rglob("*.PAL")) if DATA.is_dir() else [])
def test_pal(root, rel):
    colours = pal.parse_pal((root / rel).read_bytes())
    assert len(colours) == 16 and colours[0] == (0, 0, 0)


def test_pal_scale_and_values(root):
    assert sorted(p.relative_to(root).as_posix() for p in root.rglob("*.PAL")) == [
        "BLACK.PAL", "STANDARD.PAL", "START/LOGO.PAL", "START/SCREEN0.PAL", "TERRAIN0/WAR2.PAL"]
    assert [pal.pal_to_dac(v) for v in (0, 44, 56, 73, 99)] == [0, 28, 36, 47, 63]
    std = pal.parse_pal((root / "STANDARD.PAL").read_bytes())
    assert std[3] == (113, 113, 113) and std[15] == (255, 255, 255) and std[9] == (199, 28, 0)
    assert (root / "STANDARD.PAL").read_bytes() == (root / "TERRAIN0/WAR2.PAL").read_bytes()
    assert set(pal.parse_pal((root / "BLACK.PAL").read_bytes())) == {(0, 0, 0)}


@pytest.mark.parametrize("name,line_h,rows,blocks,nvar", [
    ("TEXT", 15, 3, 3, 3), ("CHANCE17", 17, 3, 2, 2), ("CHANCE36", 37, 4, 1, 2)])
def test_font(root, name, line_h, rows, blocks, nvar):
    fi = font.parse_fin((root / f"{name}.FIN").read_bytes())
    width, height, px = pck.decode_pck((root / f"{name}.FNT").read_bytes())
    assert (fi.n_chars, fi.first_char, fi.sheet_width) == (96, 32, width)
    assert (fi.line_height, fi.rows, len(fi.variants)) == (line_h, rows, nvar)
    assert height == blocks * fi.block_height
    assert fi.variants[0] == (15, 0, 3)
    assert fi.widths[0] == 0 and fi.advances[0] > 0          # space: no bitmap, only advance
    rects = font.glyph_rects(fi)
    assert rects[-1][1] == (rows - 1) * line_h               # packing rule reproduces the row count
    assert all(x % 8 == 0 for x, _, _, _ in rects)
    # every colour block uses exactly its (ink, shadow, background) colours
    for b in range(blocks):
        used = Counter(b"".join(px[b * fi.block_height:(b + 1) * fi.block_height]))
        assert set(used) == set(fi.variants[b])
    # (almost) all ink of block 0 lies inside the glyph rectangles
    covered = [bytearray(width) for _ in range(fi.block_height)]
    for x, y, w, h in rects:
        for yy in range(y, y + h):
            covered[yy][x:x + w] = b"\1" * w
    stray = sum(1 for y in range(fi.block_height) for x in range(width)
                if px[y][x] != 3 and not covered[y][x])
    assert stray <= (6 if name == "CHANCE17" else 0)


def test_gfx_scripts_parse(root):
    files = sorted(root.rglob("*.GFX"))
    assert len(files) == 21
    seen = Counter()
    for f in files:
        cmds = gfxscript.parse_gfx(f.read_bytes())
        assert cmds[-1] == ("E",)
        seen.update(c[0] for c in cmds)
        for c in cmds:
            if c[0] == "G":
                assert c[5] in (4, 8, 16, 26, 62)            # FILE.DAT picture ids used by scripts
            if c[0] == "F":
                assert 0 <= c[1] <= 15
    assert set(seen) == {"C", "D", "E", "F", "G", "H", "L", "T"}
    # the tutorial scripts cut 32x30 army cells out of picture 16 (a0.pck)
    tmove = gfxscript.parse_gfx((root / "TUTORIA/TMOVE.GFX").read_bytes())
    assert ("G", 384, 30, 32, 30, 16, 24, 53) in tmove


def test_army_sheet_background_is_the_key_colour(root):
    for i in range(9):
        rel = f"TERRAIN0/A{i}.PCK"
        info = pck.sheet_info(rel)
        assert info.key == (11 if i == 4 else 10)
        _, _, rows = pck.decode_pck((root / rel).read_bytes())
        assert rows[0][0] == info.key
        assert Counter(b"".join(rows)).most_common(1)[0][0] == info.key


def test_dump_writes_pngs(root, tmp_path):
    r = dump_gfx.dump_file(root, root / "TERRAIN0" / "A0.PCK", tmp_path)
    assert r["frames"] == 32
    d = tmp_path / "TERRAIN0" / "A0.PCK"
    assert (d / "sheet.png").is_file() and (d / "contact.png").is_file()
    assert len(list((d / "frames").glob("*.png"))) == 32
