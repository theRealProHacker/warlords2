"""Data of WARLORD2.EXE's data segment (DGROUP) as the program reads it.

DGROUP is load segment 0x3125 (docs/research/parts/00_image.md, EL §1): DS:OOOO is load image
offset 0x3125 * 16 + OOOO, so its file offset is the MZ header size (paragraphs, header word
+8) times 16 plus that (0x33250 + OOOO in v1.02).  Every table, string and far pointer the
presentation reads from the user's EXE goes through these helpers.
"""
from __future__ import annotations

import struct

DGROUP = 0x3125
ENC = "cp437"


def ds_base(exe: bytes) -> int:
    """File offset of DS:0000."""
    return struct.unpack_from("<H", exe, 8)[0] * 16 + DGROUP * 16


def ds_str(exe: bytes, off: int) -> str:
    """The NUL-terminated string at DS:off."""
    p = ds_base(exe) + off
    return exe[p:exe.index(b"\0", p)].decode(ENC)


def ds_words(exe: bytes, off: int, n: int, signed: bool = True) -> tuple[int, ...]:
    return struct.unpack_from(f"<{n}{'h' if signed else 'H'}", exe, ds_base(exe) + off)


def ds_word(exe: bytes, off: int, signed: bool = True) -> int:
    return ds_words(exe, off, 1, signed)[0]


def ds_bytes(exe: bytes, off: int, n: int) -> bytes:
    p = ds_base(exe) + off
    return exe[p:p + n]


def ds_far(exe: bytes, off: int) -> int | None:
    """The far pointer at DS:off as a DS offset; None for a null pointer.  A pointer into
    another segment raises (the tables read here all point into DGROUP)."""
    o, seg = ds_words(exe, off, 2, signed=False)
    if (o, seg) == (0, 0):
        return None
    if seg != DGROUP:
        raise ValueError(f"far pointer at DS:{off:04x} leaves DGROUP ({seg:04x}:{o:04x})")
    return o
