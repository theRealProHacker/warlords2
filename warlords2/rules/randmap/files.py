"""The first and the last stage of the random-map generator (ovl09).

* `template` ovl09:1001 (stage 0): the SCN image 2c04:0000 is read whole from a scenario file,
  `"%s\\%s.scn"` (DS:02ba) with the name DS:02b2 (Erythea), unless a SCENARIO.DAT record's word
  +0x52 equals the terrain set DS:28ca (never in 1.02: the word is 0 in every record and the
  loop does not run for DS:28ca == 0).  Everything of the SCN the later stages do not write
  (fight orders, the terrain table 0x710, items, monsters ...) stays Erythea's.
* `finish` ovl09:0014 (stage 90): road pieces (`tiles.road_tiles`), 92 the city table and the
  sides (ovl11:05e3, ovl10:0000, package R2), 94 the city texts (ovl11:0ce0, R2), 96 the signs
  (`signs.signs`, RANDOM.SGN), 98 RANDOM.MAP / .RD / .CTY / .SPC (ovl09:027c), RANDOM.SCN
  (ovl09:10cf).  The files go to `work.files` in the order the EXE writes them (K.FILES).

A failed create of the EXE (ERROR.DAT (1, 0) box for MAP .. SPC, printf for SCN) has no
counterpart: the files are memory here; where they are stored is the host's (U2).
"""
from __future__ import annotations

import logging

from ..constants import randmap as K
from . import sprintf
from .signs import signs
from .tiles import resolve, road_tiles

log = logging.getLogger(__name__)



def _scenario_record(read, i: int) -> bytes | None:
    """ovl60:06c8(i, buf): records 0..i of SCENARIO.DAT read in turn; a read of 0 bytes (end of
    file) gives None (the EXE returns 0)."""
    data = read(K.SCENARIO_DAT.value)
    n = K.SCENARIO_REC.value
    if i * n >= len(data):
        return None
    return data[i * n:(i + 1) * n]


def template(work) -> None:
    """ovl09:1001: name = DS:02b2; while no match and DS:28ca != 0: SCENARIO.DAT record i (end of
    file: keep the name), i += 1, word +0x52 == DS:28ca -> name = record +0x14; then the SCN
    image := the file "%s\\%s.scn" (name, name), 0x2ee1 bytes (a shorter file leaves the rest).
    A file that does not open: the EXE prints ERROR.DAT (0, 0) to the console and the SCN
    keeps what it held (its return value 0 / 1 is ignored by ovl02:0127; None here, the
    pipeline's "no percentages").
    Evidence: asm ovl09:1001..10ce."""
    name = work.exe_text.cstr(K.TEMPLATE_NAME.value)
    found, i = 0, 0
    while not found and work.run.terrain_set != 0:
        rec = _scenario_record(work.read, i)
        if rec is None:
            found = 1
            continue
        i += 1
        if int.from_bytes(rec[K.SCENARIO_SET.value:K.SCENARIO_SET.value + 2], "little", signed=True) \
                == work.run.terrain_set:
            found = 1
            name = rec[K.SCENARIO_DIR.value:].split(b"\0", 1)[0]
    path = sprintf(work.exe_text.cstr(K.TEMPLATE_PATH.value), name, name)
    rel = path.decode("latin-1").replace("\\", "/")
    try:
        data = work.read(rel)
    except FileNotFoundError:
        log.warning("random map template %s not found: the SCN keeps its contents", rel)
        return None
    data = data[:K.SCN_READ.value]
    work.scn.data[:len(data)] = data
    return None


def _call(work, module: str, func: str, addr: str):
    r = resolve(module, func, addr, "R2")(work)
    if r is not None:
        yield from r


def write_files(work) -> None:
    """ovl09:027c: RANDOM.MAP = the map words 1e1d:0000 (0x8880), RANDOM.RD = the road layer
    19d9:0000 (0x4440), RANDOM.CTY = buffer +0x1f56 for word +0x1064 bytes, RANDOM.SPC = buffer
    +0x3e96 for word +0x1066 bytes (lengths unsigned).
    Evidence: asm ovl09:027c..0463 (FILE.DAT (0x1e / 0x1f / 0x23 / 0x22, 0), mode 9; writes
    02dc, 034e, 03c0, 043d)."""
    buf = work.buf
    work.files["MAP"] = bytes(work.map.data)
    work.files["RD"] = bytes(work.roads.data)
    for key, text, length in (("CTY", K.CTY_TEXT.value, K.CTY_LEN.value),
                              ("SPC", K.SPC_TEXT.value, K.SPC_LEN.value)):
        n = buf.uword(length)
        work.files[key] = bytes(buf.byte(text + i) for i in range(n))


def write_scn(work) -> None:
    """ovl09:10cf: RANDOM.SCN = the SCN image 2c04:0000, 0x2ee1 bytes.
    Evidence: asm ovl09:10cf..113c (FILE.DAT (0x20, 0), mode 9, write 0x2ee1)."""
    work.files["SCN"] = bytes(work.scn.data[:K.SCN_SIZE.value])


def finish(work):
    """ovl09:0014 (stage 90, generator of its percentages): `tiles.road_tiles` (0a4b); 92, the
    city table ovl11:05e3 and the sides ovl10:0000 (R2: `cities.city_table`, `sides.sides`); 94,
    the city texts ovl11:0ce0 (R2: `cities.city_details`); 96, `signs.signs` (113d, RANDOM.SGN);
    98, `write_files` (027c), `write_scn` (10cf).
    Evidence: asm ovl09:0014..005b."""
    p92, p94, p96, p98 = K.FINISH_PROGRESS.value
    road_tiles(work)
    yield p92
    yield from _call(work, "cities", "city_table", "ovl11:05e3")
    yield from _call(work, "sides", "sides", "ovl10:0000")
    yield p94
    yield from _call(work, "cities", "city_details", "ovl11:0ce0")
    yield p96
    signs(work)
    yield p98
    write_files(work)
    write_scn(work)
