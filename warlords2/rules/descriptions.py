"""The description texts of cities and sites, ovl45:1de4 / 1e02 / 1f06 (M11 package E, register
X64): one 8000-byte heap buffer DS:4484 that holds the last .CTY or .SPC file read, keyed only
by its kind DS:0fc0 (1 = "%s\\%s.CTY", 2 = "%s\\%s.SPC" of DS:5da0, FILE.DAT (22, kind - 1)).

The buffer is memory of the program run: a read happens only when the kind asked differs from
DS:0fc0 (ovl45:1e0c..1e12), whatever DS:5da0 is now, and it is dropped only by ovl45:1de4,
whose callers are New Game (ovl49:0207) and the load of a random-map game (ovl49:0915).  So
after Load Game of another scenario, Load Map or a Begin, a city's description can come from
the file of an earlier scenario (the same "%03d" entry).  `DescCache` holds those words; the
host keeps one per run (`persist.saves.RunCarry.descriptions`) and the city / site dialogs read
through `lines`.
"""
from __future__ import annotations

from collections.abc import Callable
from dataclasses import dataclass

from .constants import Const

SIZE = Const(0x1F40, "asm ovl45:1e2a (alloc 0x1f40), 1ebe (read 0x1f40), 1ef1 / 1ff0 (loops)")
SEPARATOR = Const(0x7C, "asm ovl45:1ee0..1eec: every '|' of the 8000 bytes becomes 0")
MARK = Const(0x23, "asm ovl45:1f4b: an entry starts with '#'")
NUMBER_FMT = Const("%03d", "asm ovl45:1f30: DS:0ffe \"%03d\" of the entry number")
LINES = Const(3, "asm ovl45:1f76..1fea: three strcpy targets (bp+0xa, 0xe, 0x12)")
CTY, SPC = 1, 2                        # ovl45:0ca1 (city info) / 0eba (site info)
KINDS = (CTY, SPC)
OPEN_ERROR = Const((1, 0), "asm ovl45:1e97: ovl59:051a(1, 0), ERROR.DAT (1, 0) with the file name")


class FatalOpen(Exception):
    """The open of the description file failed (ovl45:1e8e): ovl52:0000 ends the program with
    ERROR.DAT `error` (formatted with the file name, the host's) as its message.  `kind`: 1 CTY,
    2 SPC (FILE.DAT (22, kind - 1)).
    Evidence: asm ovl45:1e8e..1eb6, ovl52:0000..0048."""

    def __init__(self, kind: int):
        super().__init__("description file of kind %d cannot be opened (ovl52:0000 ends the run)" % kind)
        self.kind, self.error = kind, OPEN_ERROR.value


@dataclass
class DescCache:
    """DS:0fc0 `kind` (0: none read since the last drop), DS:0fc2 `allocated` (the buffer
    DS:4484 exists) and the buffer's bytes `buffer` (None while not allocated).  EXE image
    values: 0, 0, no buffer."""
    kind: int = 0
    allocated: int = 0
    buffer: bytearray | None = None

    def copy(self) -> DescCache:
        """An independent copy of the words and bytes (for snapshots of the run).
        Evidence: no game rule (bookkeeping)."""
        return DescCache(self.kind, self.allocated, None if self.buffer is None else bytearray(self.buffer))


def drop(cache: DescCache | None) -> None:
    """ovl45:1de4: DS:0fc0 = DS:0fc2 = 0, the buffer freed (0d28:048e).  None: not modelled by
    the caller (tests).
    Evidence: asm ovl45:1de4..1e01; callers ovl49:0207 (New Game), 0915 (load, SCN 0x120)."""
    if cache is None:
        return
    cache.kind, cache.allocated, cache.buffer = 0, 0, None


def load(cache: DescCache, kind: int, read: Callable[[], bytes | None]) -> bool:
    """ovl45:1e02(kind): nothing when DS:0fc0 == kind; else the buffer is allocated if needed
    (0d28:011f; its first contents zero [unverified]), DS:0fc0 = kind, the file read with
    `read()` (the host's open of FILE.DAT (22, kind - 1) with DS:5da0 twice through its store,
    the RANDOM overlay first) into the start of the buffer (at most 8000 bytes; the rest keeps
    what the last read left), then every '|' of the 8000 bytes becomes 0.  Returns True.
    `read()` returns None when the open fails: the EXE formats ERROR.DAT (1, 0) with the file
    name and calls ovl52:0000, the fatal-error routine, which ends the program (0a4c:02b5:
    the banner, exit(0)), so nothing after the open runs.  Here: `FatalOpen(kind)` is raised
    with DS:0fc0 already set (1e53 comes before the open; no one reads it afterwards); the
    host ends the run as ovl52:0000 does.  Only reachable with a game copy lacking the file.
    Evidence: asm ovl45:1e02..1f05 (1e0c..1e12 kind test, 1e15..1e3c allocation, 1e53
    DS:0fc0 = kind, 1e5f..1e84 sprintf + open mode 2, 1e8e..1eb6 ovl59:051a(1, 0) + sprintf +
    ovl52:0000, 1ebe..1ecc read 0x1f40, 1ed6..1ef4 '|' -> 0); ovl52:0000..0048 (0048 lcall
    0a4c:02b5)."""
    if kind not in KINDS:
        raise ValueError("description kind %r" % (kind,))
    if cache.kind == kind:
        return True
    n = SIZE.value
    if not cache.allocated:
        cache.allocated, cache.buffer = 1, bytearray(n)
    cache.kind = kind
    data = read()
    if data is None:
        raise FatalOpen(kind)
    data = bytes(data[:n])
    cache.buffer[:len(data)] = data
    sep = SEPARATOR.value
    cache.buffer[:] = bytes(0 if b == sep else b for b in cache.buffer)
    return True


def _cstr(buf: bytearray, i: int) -> bytes:
    end = buf.find(b"\0", i)
    return bytes(buf[i:] if end < 0 else buf[i:end])


def lines(cache: DescCache, kind: int, index: int, read: Callable[[], bytes | None],
          enc: str = "cp437") -> list[str] | None:
    """ovl45:1f06(kind, index, ...): `load`, then the entry "#%03d" of `index`: the scan for a
    '#' whose string after it equals the number, then the three strings after the next three
    NULs from that '#' on.  Returns the three lines; a line not found is None (the caller's
    buffer keeps what it held: the city dialog's stack buffers), None for all three when no
    entry matches.  The scan stays inside the 8000 bytes (a string running to the end stops
    there [unverified: strcmp / strcpy read on past the buffer]).
    Evidence: asm ovl45:1f06..2012 (1f2c..1f38 sprintf "%03d", 1f45..1f74 the '#' scan with
    strcmp, 1f76..1fea the three strcpy at NULs, di = 0 / 1 / 2)."""
    load(cache, kind, read)
    buf = cache.buffer
    n = SIZE.value
    key = (NUMBER_FMT.value % index).encode(enc)
    for si in range(n):
        if buf[si] != MARK.value or _cstr(buf, si + 1) != key:
            continue
        out: list = [None] * LINES.value
        di = 0
        for j in range(si, n):
            if buf[j] == 0:
                out[di] = _cstr(buf, j + 1).decode(enc)
                di += 1
                if di == LINES.value:
                    break
        return out
    return None
