"""Signposts of the random map, ovl09:113d (stage 90, after the city names): 41..70 signs on
free plain squares, each with either one of the RANDOM.DAT phrase pairs or the name of the
nearest city and its distance and direction; written as RANDOM\\RANDOM.SGN.

The texts are game data, read at run time: the phrases and the two formats from the RANDOM.DAT
buffer (+0x1888, +0x189c, +0x18b0..), the city names from the SCN, the direction words from
WARLORD2.EXE's data segment (DS:2b7c, 8 far pointers).  The SGN buffer is farmalloc memory the
EXE does not clear: the bytes after each string's NUL are unknown (zeros here, [unverified],
irrelevant to the loader).  The C helpers the routine uses are the core's (`sprintf`, the
DGROUP strings `Work.exe_text`).
"""
from __future__ import annotations

import struct

from ..constants import randmap as K
from ..pathfinding import distance
from . import sprintf, tries




def direction(x1: int, y1: int, x2: int, y2: int) -> int:
    """ovl62:0b51(x1, y1, x2, y2): 0 north .. 7 northwest from (x1, y1) towards (x2, y2): same x:
    4 when y1 < y2 else 0; same y: 2 when x1 < x2 else 6; then 7, 5, 1, 3 by quadrant.
    Evidence: asm ovl62:0b51..0bbc."""
    if x1 == x2:
        return 4 if y1 < y2 else 0
    if y1 == y2:
        return 2 if x1 < x2 else 6
    if x1 > x2 and y1 > y2:
        return 7
    if x1 > x2 and y1 < y2:
        return 5
    if x1 < x2 and y1 > y2:
        return 1
    if x1 < x2 and y1 < y2:
        return 3
    return 0


def nearest_city(scn, x: int, y: int) -> int:
    """ovl62:04fa(x, y, 0xe, 0): the first city 0..n-1 (SCN 0x157b) strictly nearest to (x, y)
    (start 1000), any owner, no visibility test; -1 when none.
    Evidence: asm ovl62:04fa..0650 (0514..052a: the visibility test only with the hidden arg;
    061b: owner 0xe passes)."""
    best, found = K.NEAREST_START.value, -1
    for c in range(scn.word(K.SCN_CITY_COUNT.value)):
        o = K.CITY_LEN.value * c
        d = distance((x, y), (scn.word(K.SCN_CITY_X.value + o), scn.word(K.SCN_CITY_Y.value + o)))
        if d < best:
            best, found = d, c
    return found


def _put(out: bytearray, off: int, s: bytes) -> None:
    """strcpy / sprintf into the farmalloc block: the string and its NUL, cut at the block end."""
    for i, b in enumerate(s + b"\0"):
        if off + i < len(out):
            out[off + i] = b


def signs(work) -> None:
    """ovl09:113d: n = rnd(1, 30, 40); for each sign: x = rnd(1, 0x70, -1), y = rnd(1, 0x9c, -1)
    until the tile's terrain (SCN 0x710) is 7, no neighbour has grid 10, none grid 9 and the
    square has no road piece (`tries`, the EXE retries without end); the tile := 0; x, y; then
    r = rnd(1, 10, 0): r <= 3 and phrases left (word +0x18b0 > k): phrase pair k (k += 1); else
    the nearest city c: line 1 sprintf(+0x1888, name of c), line 2 sprintf(+0x189c,
    2 * dist(sign, c), direction word DS:2b7c[ovl62:0b51(sign, c)]).  The block (word n, n
    records of 0x68) is RANDOM.SGN (`work.files["SGN"]`).
    Evidence: asm ovl09:113d..1415 (dice 1152, 11a2, 11b4, 126d; 0a8b:0acc at 1320, shl 1328;
    13c8..1405 the file FILE.DAT (33, 0), mode 9)."""
    rng, buf, m, r, scn = work.rng, work.buf, work.map, work.roads, work.scn
    n = rng.rnd(*K.N_SIGNS.value)
    rec = K.SGN_REC.value
    out = bytearray(2 + rec * n) if n >= 0 else bytearray(2)
    out[0:2] = struct.pack("<H", n & 0xFFFF)
    k = 0
    for i in range(n):
        for _ in tries("ovl09:113d"):
            x = rng.rnd(*K.SIGN_ROLL_X.value)
            y = rng.rnd(*K.SIGN_ROLL_Y.value)
            if (scn.byte(K.TERRAIN_TABLE.value + m.lo(x, y)) == K.SIGN_TERRAIN.value
                    and not buf.nb8(x, y, K.NEAR_CITY.value) and not buf.nb8(x, y, K.NEAR_SIGN.value)
                    and not r.at(x, y) & K.ROAD_BITS.value):
                break
        m.set_lo(x, y, K.SIGN_TILE.value)
        base = 2 + rec * i
        out[base:base + 4] = struct.pack("<hh", x, y)
        if rng.rnd(*K.PHRASE_ROLL.value) <= K.PHRASE_MAX.value and buf.word(K.N_PHRASES.value) > k:
            (p1, step1), (p2, step2) = K.PHRASE1.value, K.PHRASE2.value
            _put(out, base + K.LINE1.value, buf.cstr(p1 + step1 * k))
            _put(out, base + K.LINE2.value, buf.cstr(p2 + step2 * k))
            k += 1
        else:
            c = nearest_city(scn, x, y)
            o = K.CITY_LEN.value * c
            cx, cy = scn.word(K.SCN_CITY_X.value + o), scn.word(K.SCN_CITY_Y.value + o)
            d = 2 * distance((x, y), (cx, cy))
            way = work.exe_text.far_cstr(K.DIRECTION_WORDS.value + 4 * direction(x, y, cx, cy))
            _put(out, base + K.LINE1.value, sprintf(buf.cstr(K.CITY_FORMAT.value),
                                              scn.cstr(K.SCN_CITY_NAME.value + K.CITY_LEN.value * c)))
            _put(out, base + K.LINE2.value, sprintf(buf.cstr(K.WAY_FORMAT.value), d, way))
    work.files["SGN"] = bytes(out)
