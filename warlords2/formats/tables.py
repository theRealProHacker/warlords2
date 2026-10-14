"""Data tables and text resources: ARMYTYPE, STRING/FILE/ERROR.DAT, AREA/BUTTON/JOIN,
UDB, HLP, OPTIONS, slot lists, QUOTES, CARDS, HERONAM, MAPCOLOR, TERRAIN.DAT, sound
configuration and voice captions.

Layouts are documented in docs/formats/tables.md.  Records are plain dicts whose keys
are the field names used there; tools/dump_tables.py writes them out as JSON unchanged.
"""
from __future__ import annotations

import struct

ENC = "cp437"

ArmyTypeRec = dict    # one ARMYTYPE.DAT record, see parse_armytypes

# --------------------------------------------------------------------------- helpers


def _cstr(b):
    return b.split(b"\0", 1)[0].decode(ENC)


def _u16s(b, off, n):
    return list(struct.unpack_from("<%dH" % n, b, off))


def _i16s(b, off, n):
    return list(struct.unpack_from("<%dh" % n, b, off))


# --------------------------------------------------------------------------- army types

ARMY_REC = 62
ARMY_COUNT = 29
# names for the 20 words that follow the 20-byte name (see docs/formats/tables.md)
ARMY_WORDS = [
    "strength", "turns", "cost", "moves", "buy_price",
    "str_bonus_city", "str_bonus_open", "str_bonus_woods", "str_bonus_hills",
    "stack_bonus_city", "stack_bonus_open", "stack_bonus_woods", "stack_bonus_hills",
    "special", "enemy_stack_mod", "cancel_mode", "flag16", "flag17", "flag18", "flag19",
]


def parse_armytypes(data: bytes) -> list[ArmyTypeRec]:
    assert len(data) == ARMY_REC * ARMY_COUNT, len(data)
    out = []
    for i in range(ARMY_COUNT):
        r = data[i * ARMY_REC:(i + 1) * ARMY_REC]
        words = _i16s(r, 22, 20)
        rec = {"file_index": i, "type_id": struct.unpack_from("<H", r, 0)[0],
               "name": _cstr(r[2:22]), "raw_words": words}
        rec.update(dict(zip(ARMY_WORDS, words)))
        out.append(rec)
    return out


# --------------------------------------------------------------------------- string tables


def parse_strtab(data):
    """STRING.DAT / FILE.DAT / ERROR.DAT -> list of groups, each a list of strings."""
    ngroups = struct.unpack_from("<H", data, 0)[0] // 4
    groups = []
    for g in range(ngroups):
        off, cnt = struct.unpack_from("<HH", data, 4 * g)
        ptrs = _u16s(data, off, cnt)
        groups.append([data[p:data.index(b"\0", p)].decode(ENC) for p in ptrs])
    return groups


class StringTable:
    """STRING.DAT / FILE.DAT / ERROR.DAT addressed as (group, index)."""

    def __init__(self, data: bytes):
        self.groups = parse_strtab(data)

    def get(self, group: int, index: int) -> str:
        return self.groups[group][index]


# --------------------------------------------------------------------------- UI layout tables

GROUP_MARK = 32000


def parse_area(data):
    groups, p = [], 0
    while p < len(data):
        mark, gid, mask, cnt = struct.unpack_from("<4H", data, p)
        assert mark == GROUP_MARK
        tail = _u16s(data, p + 8, 3)
        p += 14
        recs = []
        for _ in range(cnt):
            aid, w1, x, y, w, h, w6 = struct.unpack_from("<7h", data, p)
            recs.append({"id": aid, "unk1": w1, "x": x, "y": y, "w": w, "h": h, "unk6": w6})
            p += 14
        groups.append({"id": gid, "mask": mask, "header_tail": tail, "areas": recs})
    return groups


def parse_button(data):
    groups, p = [], 0
    while p < len(data):
        mark, gid, cnt = struct.unpack_from("<HHB", data, p)
        assert mark == GROUP_MARK
        p += 33
        recs = []
        for _ in range(cnt):
            r = data[p:p + 33]
            bid, x, y, w, h = struct.unpack_from("<H4xHHBB", r, 0)
            recs.append({"id": bid, "unk2": r[2:6].hex(), "x": x, "y": y, "w": w, "h": h,
                         "unk12": r[12:19].hex(), "src_xy": _u16s(r, 19, 6),
                         "pck_index": struct.unpack_from("<H", r, 31)[0]})
            p += 33
        groups.append({"id": gid, "buttons": recs})
    return groups


def parse_join(data):
    return [dict(zip(("screen", "button_group", "area_group"), struct.unpack_from("<3H", data, o)))
            for o in range(0, len(data), 6)]


def parse_udb(data):
    n = struct.unpack_from("<H", data, 0)[0]
    assert len(data) == 2 + 68 * n
    out = []
    for i in range(n):
        r = data[2 + 68 * i:2 + 68 * (i + 1)]
        out.append({"button_id": struct.unpack_from("<H", r, 0)[0], "name": _cstr(r[2:52]),
                    "rect_large": _u16s(r, 52, 4), "rect_small": _u16s(r, 60, 4)})
    return out


def parse_help(data):
    n = struct.unpack_from("<H", data, 0)[0]
    assert len(data) == 2 + 104 * n
    out = []
    for i in range(n):
        r = data[2 + 104 * i:2 + 104 * (i + 1)]
        bid, w2 = struct.unpack_from("<HH", r, 0)
        out.append({"id": bid, "word2": w2, "title": _cstr(r[4:54]), "text": _cstr(r[54:104])})
    return out


# --------------------------------------------------------------------------- misc tables


def parse_terrain(data):
    n = struct.unpack_from("<H", data, 0)[0]
    assert len(data) == 2 + 52 * n
    return [{"word0": struct.unpack_from("<H", data, 2 + 52 * i)[0],
             "label": _cstr(data[4 + 52 * i:2 + 52 * (i + 1)])} for i in range(n)]


def parse_mapcolor(data):
    assert len(data) == 1200
    return {"tile_tables": [list(data[i * 256:(i + 1) * 256]) for i in range(4)],
            "word_tables": [_u16s(data, 1024 + 32 * i, 16) for i in range(3)],
            "byte_tables": [list(data[1120 + 20 * i:1140 + 20 * i]) for i in range(4)]}


def parse_card(crd, dsc):
    assert len(crd) == 103
    lines = dsc.decode(ENC).split("\r\n")
    return {"words0": _u16s(crd, 0, 7), "army_order": list(crd[14:43]), "words43": _u16s(crd, 43, 30),
            "name": lines[0], "description": [l for l in lines[1:] if l]}


def parse_heronames(data):
    out = []
    for line in data.decode(ENC).split("\r\n"):
        if line:
            assert line[0] == "#" and line[2] == " ", line
            out.append({"flag": int(line[1]), "name": line[3:]})
    return out


def parse_quotes(data):
    lines = data.decode(ENC).split("\r\n")
    out = []
    for l in lines[1:]:
        if l:
            out.append({"length_field": int(l[:3]), "lines": l[3:].split("|")})
    return {"count_field": int(lines[0]), "quotes": out}


def parse_options(data):
    """DATA/OPTIONS.DAT: the ten option words."""
    return _u16s(data, 0, 10)


def parse_slots(data, sep):
    """SAVEINFO.DAT / MAPINFO.DAT: one line per slot: used digit, 2-digit length, name."""
    out = []
    for l in data.decode(ENC).split(sep):
        if l:
            out.append({"used": int(l[0]), "length_field": int(l[1:3]), "name": l[3:]})
    return out


def parse_sounddat(data):
    t = data.decode(ENC).split()
    return {"digital_driver": t[0], "music_driver": t[1], "number": int(t[2])}


def parse_voice_text(data):
    """SOUND/*.TXT advisor caption: lines separated by '|', terminated by '~'."""
    raw = data.decode(ENC)
    return {"lines": raw.split("~")[0].split("|"), "raw": raw}

