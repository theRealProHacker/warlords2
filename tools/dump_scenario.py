#!/usr/bin/env python3
"""Parse Warlords II (1993, DOS, not Deluxe) scenario files.

Usage:
    .venv/bin/python -I tools/dump_scenario.py [GAME_DIR] [OUT_DIR]

GAME_DIR defaults to original/game/Warlrd2, OUT_DIR to out/scenario.
Writes <name>.json and <name>_map.png per scenario plus _global.json for the
shared data files.  The byte-level spec lives in docs/formats/scenario.md.

The parsers live in warlords2.formats.scenario.  The shared-table readers below
keep the JSON shape this tool has always written to _global.json; the canonical
decoders for those files are in warlords2.formats.tables.
"""
from __future__ import annotations

import json
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))   # run without installing

from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.formats.scenario import (  # noqa: E402
    MAP_H, MAP_W, ROAD_SHAPES, SCENARIOS, cstr, load_scenario, parse_hst, parse_random_dat,
    parse_saved_map, parse_scenario_dat, parse_sgn, u16s)


# ------------------------------------------------------- _global.json legacy shapes
def parse_slot_info(d: bytes) -> list[dict]:
    """MAPINFO.DAT / SAVEINFO.DAT: '%1d%02d%s' + 2-byte line end per slot."""
    out, pos = [], 0
    while pos < len(d):
        used, ln = int(d[pos:pos + 1]), int(d[pos + 1:pos + 3])
        name = d[pos + 3:pos + 3 + ln - 1]
        eol = d[pos + 2 + ln:pos + 4 + ln]
        if sorted(eol) != [10, 13]:
            raise ValueError("slot info line end missing at %d" % pos)
        out.append({"used": used, "len_plus_1": ln,
                    "name": name.decode("cp437").replace("_", " ")})
        pos += 4 + ln
    return out


def parse_terrain_dat(d: bytes) -> list[dict]:
    (n,) = struct.unpack_from("<H", d)
    if len(d) != 2 + 52 * n:
        raise ValueError("TERRAIN.DAT size mismatch")
    return [{"w_0": struct.unpack_from("<H", d, 2 + 52 * i)[0],
             "label": cstr(d[4 + 52 * i:54 + 52 * i])} for i in range(n)]


def parse_udb(d: bytes) -> list[dict]:
    (n,) = struct.unpack_from("<H", d)
    if len(d) != 2 + 68 * n:
        raise ValueError("UDB.DAT size mismatch")
    out = []
    for i in range(n):
        r = d[2 + 68 * i:70 + 68 * i]
        out.append({"id": struct.unpack_from("<H", r)[0], "label": cstr(r[2:52]),
                    "words": u16s(r, 52, 8)})
    return out


def parse_armytype(d: bytes) -> list[dict]:
    if len(d) != 29 * 62:
        raise ValueError("ARMYTYPE size mismatch")
    out = []
    for i in range(29):
        r = d[i * 62:(i + 1) * 62]
        w = u16s(r, 22, 20)
        out.append({"index": i, "army_id": struct.unpack_from("<H", r)[0], "name": cstr(r[2:22]),
                    "strength": w[0], "turns": w[1], "cost": w[2], "moves": w[3],
                    "buy_price": struct.unpack_from("<h", r, 30)[0], "words_20_3d": w[5:]})
    return out


def parse_mapcolor(d: bytes) -> dict:
    if len(d) != 1200:
        raise ValueError("MAPCOLOR.DAT must be 1200 bytes")
    return {"tables": [list(d[k * 256:(k + 1) * 256]) for k in range(4)],
            "remap_words": [u16s(d, 0x400 + 32 * k, 16) for k in range(3)],
            "tail": list(d[0x460:0x4B0])}


# ---------------------------------------------------------------------------- PNG
TERRAIN_RGB = {
    0: (255, 0, 255), 1: (150, 110, 60), 2: (24, 60, 150), 3: (70, 130, 200),
    4: (20, 110, 40), 5: (150, 140, 70), 6: (120, 120, 125), 7: (95, 170, 70),
    8: (90, 130, 110), 9: (95, 170, 70), 10: (95, 170, 70), 11: (95, 170, 70),
}
PLAYER_RGB = [(255, 255, 255), (255, 230, 0), (255, 140, 0), (230, 30, 30),
              (0, 230, 0), (60, 60, 255), (0, 220, 230), (20, 20, 20)]
ROAD_RGB = (70, 45, 20)


def render_png(sc: dict, path: Path, scale: int = 4) -> None:
    from PIL import Image, ImageDraw
    raw = sc["_raw"]
    im = Image.new("RGB", (MAP_W, MAP_H))
    im.putdata([TERRAIN_RGB.get(t, (255, 0, 255)) for t in raw["terrain"]])
    im = im.resize((MAP_W * scale, MAP_H * scale), Image.NEAREST)
    dr = ImageDraw.Draw(im)
    s, h = scale, scale // 2
    for i, v in enumerate(raw["roads"]):
        if not v:
            continue
        x, y = (i % MAP_W) * s, (i // MAP_W) * s
        shape = ROAD_SHAPES.get(v, "NESW")
        dr.rectangle([x + h - 1, y + h - 1, x + h, y + h], fill=ROAD_RGB)
        for ch, box in (("N", [x + h - 1, y, x + h, y + h]), ("S", [x + h - 1, y + h, x + h, y + s - 1]),
                        ("W", [x, y + h - 1, x + h, y + h]), ("E", [x + h, y + h - 1, x + s - 1, y + h])):
            if ch in shape:
                dr.rectangle(box, fill=ROAD_RGB)
    for p in sc["ports"]:
        x, y = p["x"] * s, p["y"] * s
        dr.rectangle([x, y, x + s - 1, y + s - 1], outline=(255, 255, 255))
    for g in sc["signs"]:
        x, y = g["x"] * s, g["y"] * s
        dr.rectangle([x + 1, y + 1, x + s - 2, y + s - 2], fill=(250, 240, 150))
    for st in sc["scn"]["sites"]:
        x, y = st["x"] * s, st["y"] * s
        col = (255, 255, 255) if st["type"] == 1 else (40, 40, 40)
        dr.rectangle([x, y, x + s - 1, y + s - 1], fill=col, outline=(200, 0, 200))
    for c in sc["scn"]["cities"]:
        x, y = c["x"] * s, c["y"] * s
        owner = c["capital_of"]
        fill = PLAYER_RGB[owner] if owner is not None else (170, 170, 170)
        dr.rectangle([x, y, x + 2 * s - 1, y + 2 * s - 1], fill=fill, outline=(0, 0, 0))
    im.save(path)


# --------------------------------------------------------------------------- main
def load_globals(game: Path) -> dict:
    g: dict = {}

    def opt(key, rel, fn):
        p = game / rel
        if p.exists():
            g[key] = fn(p.read_bytes())

    opt("scenario_dat", "DATA/SCENARIO.DAT", parse_scenario_dat)
    opt("mapinfo", "DATA/MAPINFO.DAT", parse_slot_info)
    opt("saveinfo", "DATA/SAVEINFO.DAT", parse_slot_info)
    opt("terrain_dat", "DATA/TERRAIN.DAT", parse_terrain_dat)
    opt("area_dat_hex", "DATA/AREA.DAT", lambda b: b.hex())
    opt("mapcolor", "TERRAIN0/MAPCOLOR.DAT", parse_mapcolor)
    opt("armytype", "TERRAIN0/ARMYTYPE.DAT", parse_armytype)
    opt("armytyp2", "TERRAIN0/ARMYTYP2.DAT", parse_armytype)
    opt("udb", "UDB/UDB.DAT", parse_udb)
    opt("udb_cur", "UDB/UDB.CUR", lambda b: list(b))
    opt("current_hst", "CURRENT.HST", parse_hst)
    opt("current_sgn", "CURRENT.SGN", parse_sgn)
    opt("random_dat", "RANDOM/RANDOM.DAT", parse_random_dat)

    def saved(b):
        s = parse_saved_map(b)
        s.pop("map"); s.pop("rd")
        return s
    opt("rmaptemp", "SAVE/RMAPTEMP.DAT", saved)
    return g


def main(argv: list[str]) -> int:
    game = Path(argv[1]) if len(argv) > 1 else Path("original/game/Warlrd2")
    out = Path(argv[2]) if len(argv) > 2 else Path("out/scenario")
    if not game.is_dir():
        print("game dir not found: %s" % game, file=sys.stderr)
        return 1
    out.mkdir(parents=True, exist_ok=True)
    for name in SCENARIOS:
        if not (game / name / (name + ".SCN")).exists():
            continue
        sc = load_scenario(GameDir(game), name)
        render_png(sc, out / ("%s_map.png" % name.lower()))
        sc.pop("_raw")
        (out / ("%s.json" % name.lower())).write_text(json.dumps(sc, indent=1))
        scn = sc["scn"]
        print("%-8s map %dx%d  cities %3d  sites %2d (%d temples)  signs %3d  items %2d  ports %2d  players %d" % (
            name, MAP_W, MAP_H, scn["city_count"], scn["site_count"],
            sum(1 for s in scn["sites"] if s["type"] == 1), len(sc["signs"]), len(sc["items"]),
            len(sc["ports"]), sum(1 for p in scn["players"] if p["active"])))
    (out / "_global.json").write_text(json.dumps(load_globals(game), indent=1))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
