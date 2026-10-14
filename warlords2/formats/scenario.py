"""Scenario files: .SCN .MAP .RD .SGN .ITM .CTY .SPC, DATA/SCENARIO.DAT, saved random maps,
CURRENT.HST and RANDOM/RANDOM.DAT.

The byte-level spec lives in docs/formats/scenario.md.  Records are returned as plain
dicts (and lists) whose keys are the field names used there; tools/dump_scenario.py
writes them out as JSON unchanged.
"""
from __future__ import annotations

import re
import struct
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from .gamedir import GameDir

ScenarioHeader = dict    # one 84-byte SCENARIO.DAT record, see parse_scenario_header
ScenarioData = dict      # one loaded scenario, see load_scenario

MAP_W, MAP_H = 112, 156
N_TILES = MAP_W * MAP_H          # 17472
MAP_SIZE = N_TILES * 2           # 34944
RD_SIZE = N_TILES                # 17472
SCN_SIZE = 12001                 # 0x2EE1
SGN_REC = 104
SCENARIOS = ["TUTORIA", "DRAGON", "SORCERY", "ERYTHEA", "HADESHA", "ISLADIA", "RANDOM"]

TERRAIN_NAMES = {
    0: "road/unused", 1: "bridge", 2: "water", 3: "shore", 4: "forest",
    5: "hills", 6: "mountains", 7: "plain", 8: "marsh", 9: "tower/signpost",
    10: "city", 11: "ruin/temple",
}
SITE_TYPES = {1: "temple", 2: "ruin"}
ITEM_TYPES = {1: "battle", 2: "command", 5: "fly", 6: "move", 7: "gold", 8: "standard(command+1)"}
NEUTRAL = 15
# RD layer: value -> connections (N, E, S, W); derived statistically, see spec.
ROAD_SHAPES = {
    1: "EW", 2: "NS", 3: "NESW", 4: "ESW", 5: "NSW", 6: "NEW", 7: "NES",
    8: "SW", 9: "NW", 10: "NE", 11: "ES", 12: "W", 13: "S", 14: "E", 15: "N",
    16: "EW", 17: "NS",
}
# Neutral city is the 2x2 block 96,97 / 112,113; owner k uses 98+2k (k=0..5) and
# 128+2(k-6) (k=6,7) for the top-left tile, +1, +16, +17 for the rest.
CITY_TL_TILES = {96: NEUTRAL, 98: 0, 100: 1, 102: 2, 104: 3, 106: 4, 108: 5, 128: 6, 130: 7}


def cstr(b: bytes) -> str:
    """Fixed-size NUL-terminated string (bytes after the NUL are garbage)."""
    return b.split(b"\0", 1)[0].decode("cp437")


def u16s(d: bytes, off: int, n: int) -> list[int]:
    return list(struct.unpack_from("<%dH" % n, d, off))


# --------------------------------------------------------------------------- SCN
def parse_scn(d: bytes) -> dict:
    if len(d) != SCN_SIZE:
        raise ValueError("SCN must be %d bytes, got %d" % (SCN_SIZE, len(d)))
    out: dict = {}
    names = [cstr(d[i * 20:i * 20 + 20]) for i in range(8)]
    arr = {k: u16s(d, o, 8) for k, o in (
        ("w_a0", 0xA0), ("w_b0", 0xB0), ("control_c0", 0xC0), ("computer_d0", 0xD0),
        ("w_e0", 0xE0), ("w_f0", 0xF0), ("active", 0x137), ("w_147", 0x147),
        ("turn_order", 0x163))}
    b100, b108 = list(d[0x100:0x108]), list(d[0x108:0x110])
    players = []
    for p in range(8):
        o = 0x183 + 20 * p
        pid, gold, gold_hi, cx, cy = struct.unpack_from("<5H", d, o)
        players.append({
            "index": p, "name": names[p], "active": bool(arr["active"][p]),
            "id": pid, "gold": gold | gold_hi << 16,
            "capital_x": cx, "capital_y": cy,
            "rec_tail_hex": d[o + 10:o + 20].hex(),
            "w_a0": arr["w_a0"][p], "w_b0": arr["w_b0"][p],
            "control_c0": arr["control_c0"][p], "computer_d0": arr["computer_d0"][p],
            "w_e0": arr["w_e0"][p], "w_f0": arr["w_f0"][p],
            "b_100": b100[p], "b_108": b108[p], "w_147": arr["w_147"][p],
            "turn_order": arr["turn_order"][p],
            "fight_order": list(d[0x60B + 29 * p:0x60B + 29 * p + 29]),
        })
    out["players"] = players
    out["neutral_fight_order"] = list(d[0x6F3:0x710])
    out["globals"] = {
        "words_110_to_132": u16s(d, 0x110, 18),
        "tutorial_flag_12e": u16s(d, 0x12E, 1)[0],
        "byte_134": d[0x134], "word_135": u16s(d, 0x135, 1)[0],
        "words_157_to_161": u16s(d, 0x157, 6),
        "words_173_to_181": u16s(d, 0x173, 8),
    }
    out["tile_terrain"] = list(d[0x710:0x80F])          # 255 entries
    out["runtime_nonzero"] = {
        "223_60b": sum(1 for b in d[0x223:0x60B] if b),
        "101b_157b": sum(1 for b in d[0x101B:0x157B] if b),
    }

    n_sites = u16s(d, 0x80F, 1)[0]
    sites = []
    for i in range(40):
        r = d[0x811 + 31 * i:0x811 + 31 * i + 31]
        if i >= n_sites:
            continue
        x, y = struct.unpack_from("<HH", r)
        sites.append({
            "index": i, "x": x, "y": y, "name": cstr(r[4:24]),
            "type": r[24], "type_name": SITE_TYPES.get(r[24], "?"),
            "b_19": r[25], "b_1a": r[26],
            "w_1b": struct.unpack_from("<H", r, 27)[0],
            "w_1d": struct.unpack_from("<H", r, 29)[0],
        })
    out["site_count"] = n_sites
    out["sites"] = sites

    items = []
    for i in range(22):
        r = d[0xCE9 + 29 * i:0xCE9 + 29 * i + 29]
        items.append({
            "index": i, "name": cstr(r[:20]), "type": r[20],
            "type_name": ITEM_TYPES.get(r[20], "?"), "bonus": r[21], "b_16": r[22],
            "w_17": struct.unpack_from("<H", r, 23)[0],
            "w_19": struct.unpack_from("<H", r, 25)[0],
            "w_1b": struct.unpack_from("<H", r, 27)[0],
        })
    out["item_table"] = items
    strengths = u16s(d, 0x1007, 10)
    out["monsters"] = [
        {"index": i, "name": cstr(d[0xF67 + 16 * i:0xF67 + 16 * i + 16]), "strength": strengths[i]}
        for i in range(10)]

    n_cities = u16s(d, 0x157B, 1)[0]
    caps = {(p["capital_x"], p["capital_y"]): p["index"] for p in players if p["active"]}
    cities = []
    for i in range(min(n_cities, 100)):
        r = d[0x157D + 65 * i:0x157D + 65 * i + 65]
        x, y = struct.unpack_from("<HH", r)
        prod = []
        for s in range(4):
            t = r[22 + s]
            if t == 0xFF:
                continue
            prod.append({"slot": s, "army_id": t, "turns": r[26 + s],
                         "strength": r[30 + s], "moves": r[34 + s], "cost": r[38 + s]})
        cities.append({
            "index": i, "x": x, "y": y, "name": cstr(r[4:20]),
            "level_14": r[20], "owner": r[21],
            "income": struct.unpack_from("<H", r, 42)[0],
            "production": prod,
            "capital_of": caps.get((x, y)),
            "runtime_tail_hex": r[44:].hex(),
        })
    out["city_count"] = n_cities
    out["cities"] = cities
    return out


# ----------------------------------------------------------------------- MAP / RD
def parse_map(d: bytes) -> list[int]:
    if len(d) != MAP_SIZE:
        raise ValueError("MAP must be %d bytes" % MAP_SIZE)
    return list(struct.unpack("<%dH" % N_TILES, d))


def parse_rd(d: bytes) -> list[int]:
    if len(d) != RD_SIZE:
        raise ValueError("RD must be %d bytes" % RD_SIZE)
    return list(d)


# ---------------------------------------------------------------------------- SGN
def parse_sgn(d: bytes) -> list[dict]:
    (n,) = struct.unpack_from("<H", d)
    if len(d) != 2 + n * SGN_REC:
        raise ValueError("SGN size %d != 2 + %d*104" % (len(d), n))
    out = []
    for i in range(n):
        r = d[2 + i * SGN_REC:2 + (i + 1) * SGN_REC]
        x, y = struct.unpack_from("<HH", r)
        out.append({"index": i, "x": x, "y": y,
                    "line1": cstr(r[4:54]), "line2": cstr(r[54:104])})
    return out


# ---------------------------------------------------------------------------- ITM
def parse_itm(d: bytes) -> list[dict]:
    n = int(d[0:2])
    if d[2:4] != b"\r\n" or len(d) != 4 + n * 26:
        raise ValueError("ITM layout mismatch")
    out = []
    for i in range(n):
        r = d[4 + i * 26:4 + (i + 1) * 26]
        if r[24:26] != b"\r\n":
            raise ValueError("ITM line %d not CRLF terminated" % i)
        t, b = r[21] - 0x30, r[23] - 0x30
        out.append({"index": i, "name": r[:20].decode("cp437").rstrip().replace("_", " "),
                    "type": t, "type_name": ITEM_TYPES.get(t, "?"), "bonus": b})
    return out


# ---------------------------------------------------------------------- CTY / SPC
_DESC_RE = re.compile(rb"#(\d{3})\|([^\r\n]*)\r?\n")


def parse_desc(d: bytes) -> tuple[list[dict], int]:
    """'#NNN|line|line|...|CRLF' records.  Returns (records, bytes consumed)."""
    out, pos = [], 0
    while True:
        m = _DESC_RE.match(d, pos)
        if not m:
            break
        body = m.group(2).decode("cp437")
        lines = body.split("|")
        if lines and lines[-1] == "":
            lines.pop()
        out.append({"index": int(m.group(1)), "lines": lines})
        pos = m.end()
    return out, pos


# ----------------------------------------------------------- SCENARIO.DAT, saves
def parse_scenario_header(r: bytes) -> ScenarioHeader:
    """84-byte record used by DATA/SCENARIO.DAT and at the start of saved maps."""
    w0, = struct.unpack_from("<H", r, 58)
    c, s, p, z = struct.unpack_from("<4H", r, 76)
    return {"title": cstr(r[0:20]), "dir": cstr(r[20:28]), "description": cstr(r[28:58]),
            "w_3a": w0, "str_3c": cstr(r[60:68]), "str_44": cstr(r[68:76]),
            "cities": c, "sites": s, "players": p, "w_52": z}


def parse_scenario_dat(d: bytes) -> list[ScenarioHeader]:
    if len(d) % 84:
        raise ValueError("SCENARIO.DAT not a multiple of 84")
    return [parse_scenario_header(d[i:i + 84]) for i in range(0, len(d), 84)]


def parse_hst(d: bytes) -> dict:
    (size,) = struct.unpack_from("<I", d)
    return {"size_field": size, "size_matches_file": size == len(d),
            "payload_len_word": struct.unpack_from("<H", d, 4)[0],
            "strings": [{"offset": m.start(), "text": m.group().decode("cp437")}
                        for m in re.finditer(rb"[A-Za-z][ -~]{3,}", d)],
            "hex": d.hex()}


def parse_random_dat(d: bytes) -> dict:
    return {"size": len(d), "nonzero_bytes": sum(1 for b in d if b),
            "last_nonzero_offset": max(i for i, b in enumerate(d) if b),
            "head_words": u16s(d, 0, 0x764 // 2),
            "side_names_0x764": [cstr(d[0x764 + 20 * i:0x764 + 20 * i + 20]) for i in range(39)],
            "strings": [{"offset": m.start(), "text": m.group().decode("cp437")}
                        for m in re.finditer(rb"[ -~]{3,}", d)]}


def parse_saved_map(d: bytes) -> dict:
    """SAVE/RMAP*.DAT (saved random map)."""
    out = {"header": parse_scenario_header(d[:84])}
    o = 84
    out["scn"] = parse_scn(d[o:o + SCN_SIZE]); o += SCN_SIZE
    out["map"] = parse_map(d[o:o + MAP_SIZE])
    extra = d[o + MAP_SIZE:o + 0xDE70]
    out["map_segment_tail_len"] = len(extra)
    out["map_segment_tail_nonzero"] = sum(1 for b in extra if b)
    o += 0xDE70
    out["rd"] = parse_rd(d[o:o + RD_SIZE]); o += RD_SIZE
    layer2 = d[o:o + RD_SIZE]; o += RD_SIZE
    out["layer2_nonzero"] = sum(1 for b in layer2 if b)
    blocks = []
    while o < len(d):
        (n,) = struct.unpack_from("<I", d, o)
        blocks.append({"offset": o, "length": n})
        o += 4 + n
    out["blocks"] = blocks
    out["consumed"] = o
    if blocks:
        b = blocks[0]
        try:
            out["signs"] = parse_sgn(d[b["offset"] + 4:b["offset"] + 4 + b["length"]])
        except (ValueError, struct.error):
            out["signs"] = None
    return out


# ----------------------------------------------------------------------- scenario
def load_scenario(gd: GameDir, name: str) -> ScenarioData:
    """Scenario directory `name` (e.g. 'ERYTHEA') of the GameDir `gd`.  The '_raw' entry
    holds the flat per-tile lists (tiles, terrain, roads) for callers that need them."""
    def rd(ext: str) -> bytes:
        return gd.read("%s/%s.%s" % (name, name, ext))

    scn = parse_scn(rd("SCN"))
    tiles = parse_map(rd("MAP"))
    roads = parse_rd(rd("RD"))
    tt = scn["tile_terrain"]
    terrain = [tt[t & 0xFF] for t in tiles]
    cty_raw, spc_raw = rd("CTY"), rd("SPC")
    cty, cty_used = parse_desc(cty_raw)
    spc, spc_used = parse_desc(spc_raw)
    ports = [{"x": i % MAP_W, "y": i // MAP_W, "tile": t & 0xFF}
             for i, t in enumerate(tiles) if t & 0x8000]
    for c in scn["cities"]:
        d = next((e for e in cty if e["index"] == c["index"]), None)
        c["description"] = d["lines"] if d else None
        tl = tiles[c["y"] * MAP_W + c["x"]] & 0xFF
        c["map_tile_owner"] = CITY_TL_TILES.get(tl)
    for s in scn["sites"]:
        d = next((e for e in spc if e["index"] == s["index"]), None)
        s["description"] = d["lines"] if d else None
        s["map_tile"] = tiles[s["y"] * MAP_W + s["x"]] & 0xFF
    return {
        "name": name,
        "map": {
            "width": MAP_W, "height": MAP_H,
            "tiles": [[t & 0xFF for t in tiles[y * MAP_W:(y + 1) * MAP_W]] for y in range(MAP_H)],
            "flags": [[t >> 8 for t in tiles[y * MAP_W:(y + 1) * MAP_W]] for y in range(MAP_H)],
            "terrain": ["".join("%x" % v for v in terrain[y * MAP_W:(y + 1) * MAP_W])
                        for y in range(MAP_H)],
            "roads": [roads[y * MAP_W:(y + 1) * MAP_W] for y in range(MAP_H)],
            "terrain_names": TERRAIN_NAMES, "road_shapes": ROAD_SHAPES,
        },
        "ports": ports,
        "scn": scn,
        "signs": parse_sgn(rd("SGN")),
        "items": parse_itm(rd("ITM")),
        "city_descriptions": cty, "site_descriptions": spc,
        "consumed": {"CTY": [cty_used, len(cty_raw)], "SPC": [spc_used, len(spc_raw)]},
        "_raw": {"tiles": tiles, "terrain": terrain, "roads": roads},
    }
