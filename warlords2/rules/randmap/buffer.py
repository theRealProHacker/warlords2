"""The memory images the random-map generator works on, as flat byte arrays.

* `Buffer`: the RANDOM.DAT work buffer (far ptr DS:3f8a, 0xa560 bytes, ovl02:0000): header
  words, tables, scratch records, and the 112 x 156 terrain-class grid at +0x6120 (byte
  y * 0x70 + x).  One bytearray, so the EXE's flat-index neighbour reads around the grid alias
  exactly: x = -1 is the previous row's last byte, row -1 is RANDOM.DAT scratch (+0x60b0 ..).
* `MapWords` (1e1d:0000, 0x8880), `Roads` (19d9:0000, 0x4440), `Region` (the SCN 2c04:0000).

Out-of-range stand-in (plan register X61, [unverified]): an access outside an image (past
0xa560 is heap memory of the original machine, before offset 0 the allocation's header)
reads 0 and drops writes.  Every such access is counted (`oob_reads`, `oob_writes`), and a
`strict` image raises `OutOfImage` instead, so a test can show which routine reaches it.
"""
from __future__ import annotations

from ..constants import randmap as K


class OutOfImage(IndexError):
    """An access outside the image while `strict` is set (tests)."""


def s16(v: int) -> int:
    """`v` as a signed 16-bit word.
    Evidence: 16-bit registers / words of the EXE (ovl02 adds, ovl03 compares); no game rule."""
    v &= 0xFFFF
    return v - 0x10000 if v & 0x8000 else v


class Region:
    """A flat image of `size` bytes of the original's memory, little-endian words."""

    def __init__(self, size: int, data: bytes | None = None, name: str = ""):
        self.size = size
        self.name = name
        self.data = bytearray(size)
        if data is not None:
            data = bytes(data[:size])
            self.data[:len(data)] = data
        self.oob_reads = 0
        self.oob_writes = 0
        self.strict = False

    def _out(self, off: int, write: bool) -> None:
        if self.strict:
            raise OutOfImage("%s %s at %#x outside 0..%#x" % (self.name or "image",
                                                               "write" if write else "read",
                                                               off, self.size - 1))
        if write:
            self.oob_writes += 1
        else:
            self.oob_reads += 1

    def byte(self, off: int) -> int:
        """Unsigned byte at `off`; outside the image 0 (register X61).
        Evidence: `byte ptr es:[bx + off]` reads of the generator (ovl02..ovl12); stand-in X61."""
        if 0 <= off < self.size:
            return self.data[off]
        self._out(off, False)
        return 0

    def sbyte(self, off: int) -> int:
        """Signed byte at `off` (the `cbw` reads, e.g. ovl03:1259).
        Evidence: asm ovl03:1254..1259 (mov al, byte; cbw); stand-in X61."""
        v = self.byte(off)
        return v - 0x100 if v & 0x80 else v

    def set_byte(self, off: int, v: int) -> None:
        """Byte write (low 8 bits of `v`); outside the image dropped (register X61).
        Evidence: `mov byte ptr es:[bx + off], v` writes of the generator; stand-in X61."""
        if 0 <= off < self.size:
            self.data[off] = v & 0xFF
        else:
            self._out(off, True)

    def uword(self, off: int) -> int:
        """Unsigned little-endian word at `off` (each byte by the stand-in rule).
        Evidence: 16-bit `word ptr es:[bx + off]` reads; stand-in X61."""
        if 0 <= off and off + 2 <= self.size:
            return self.data[off] | self.data[off + 1] << 8
        return self.byte(off) | self.byte(off + 1) << 8

    def word(self, off: int) -> int:
        """Signed little-endian word at `off` (the generator compares words signed: jl / jg).
        Evidence: 16-bit `word ptr es:[bx + off]` reads with signed jumps (ovl02, ovl03); X61."""
        return s16(self.uword(off))

    def set_word(self, off: int, v: int) -> None:
        """Word write, `v` taken mod 0x10000.
        Evidence: 16-bit stores / adds (ovl02:0095 `add word ptr es:[bx + 0x2a], ax`); X61."""
        v &= 0xFFFF
        if 0 <= off and off + 2 <= self.size:
            self.data[off] = v & 0xFF
            self.data[off + 1] = v >> 8
        else:
            self.set_byte(off, v & 0xFF)
            self.set_byte(off + 1, v >> 8)

    def point(self, off: int) -> tuple[int, int]:
        """A point: the dword pair (x word, y word) at `off`.
        Evidence: M11 A1 (ovl03 points are dword pairs, x then y); no further rule."""
        return self.word(off), self.word(off + 2)

    def set_point(self, off: int, x: int, y: int) -> None:
        """Write a point (x word, y word) at `off`.
        Evidence: M11 A1 (ovl03 points are dword pairs, x then y); no further rule."""
        self.set_word(off, x)
        self.set_word(off + 2, y)

    def cstr(self, off: int, limit: int | None = None) -> bytes:
        """The NUL-ended string at `off` (without the NUL), at most `limit` bytes.
        Evidence: C strings of the RTL (0000:4a70 strcpy, 4a99 strlen); no game rule."""
        out = bytearray()
        while limit is None or len(out) < limit:
            b = self.byte(off + len(out))
            if b == 0:
                break
            out.append(b)
        return bytes(out)

    def set_cstr(self, off: int, s: bytes) -> None:
        """strcpy(image + off, s): the bytes of `s` then a NUL.
        Evidence: 0000:4a70 strcpy (M11 A5); no game rule."""
        for i, b in enumerate(bytes(s) + b"\0"):
            self.set_byte(off + i, b)


class Buffer(Region):
    """The RANDOM.DAT work buffer DS:3f8a (ovl02:0000) with its grid at +0x6120."""

    def __init__(self, data: bytes | None = None):
        super().__init__(K.DAT_SIZE.value, data, "RANDOM.DAT")

    @staticmethod
    def cell(x: int, y: int) -> int:
        """Buffer offset of grid square (x, y): +0x6120 + y * 0x70 + x, unclamped (flat).
        Evidence: asm ovl02:0376..0383, ovl03:11c1..11dc (imul 0x70, add x, [bx + 0x6120])."""
        return K.GRID.value + y * K.GRID_W.value + x

    def grid(self, x: int, y: int) -> int:
        """Grid byte (terrain class) at (x, y), unsigned, flat index (x = -1 / 0x70 wrap rows).
        Evidence: asm ovl03:11dc `cmp byte ptr es:[bx + 0x6120], 7`; stand-in X61."""
        return self.byte(self.cell(x, y))

    def sgrid(self, x: int, y: int) -> int:
        """Grid byte at (x, y) sign-extended (cbw), as ovl03:11f5 compares it.
        Evidence: asm ovl03:1254..125a; stand-in X61."""
        return self.sbyte(self.cell(x, y))

    def set_grid(self, x: int, y: int, v: int) -> None:
        """Write the grid byte at (x, y), flat index.
        Evidence: asm ovl02:0383, ovl03:0d29 (mov byte ptr es:[bx + 0x6120], v); stand-in X61."""
        self.set_byte(self.cell(x, y), v)

    @staticmethod
    def in_map(x: int, y: int) -> bool:
        """0 <= x <= 0x6f and 0 <= y <= 0x9b (signed), the bounds test of ovl03:11f5.
        Evidence: asm ovl03:120f..1237 (jl after the add, cmp 0x6f / 0x9b jg)."""
        return 0 <= x <= K.GRID_W.value - 1 and 0 <= y <= K.GRID_H.value - 1

    def dir8(self, k: int) -> tuple[int, int]:
        """Neighbour offset k (0..7) from the buffer's table at +0xbc (read live, as the EXE).
        Evidence: asm ovl03:1204..121a (shl cx, 2; es:[bx + 0xbc] / [bx + 0xbe])."""
        return self.point(K.DIR8.value + 4 * k)

    def nb8(self, x: int, y: int, v: int) -> int:
        """ovl03:11f5(x, y, v): 1 when some neighbour (x, y) + dir8(k), k = 0..7 in order, lies on
        the map and its grid byte (cbw) equals the word v; else 0.  ovl03:117d(x, y) is the same
        test with v = 7 (`cmp byte, 7`).
        Evidence: asm ovl03:11f5..126f; 117d..11f4."""
        v = s16(v)
        for k in range(K.N_DIRS.value):
            dx, dy = self.dir8(k)
            nx, ny = x + dx, y + dy
            if self.in_map(nx, ny) and self.sgrid(nx, ny) == v:
                return 1
        return 0


class MapWords(Region):
    """The map words 1e1d:0000 (112 x 156 words, index y * 0x70 + x)."""

    def __init__(self, data: bytes | None = None):
        super().__init__(K.MAP_WORDS_SIZE.value, data, "map words")

    @staticmethod
    def offset(x: int, y: int) -> int:
        """Byte offset of the word of (x, y): (y * 0x70 + x) * 2, unclamped.
        Evidence: EL §4.1 (1e1d:0000, y * 0xe0 + x * 2)."""
        return (y * K.GRID_W.value + x) * 2

    def at(self, x: int, y: int) -> int:
        """The unsigned map word of (x, y).
        Evidence: EL §4.1; stand-in X61."""
        return self.uword(self.offset(x, y))

    def set_at(self, x: int, y: int, v: int) -> None:
        """Write the map word of (x, y).
        Evidence: EL §4.1; stand-in X61."""
        self.set_word(self.offset(x, y), v)

    def lo(self, x: int, y: int) -> int:
        """Low byte (tile id) of the map word of (x, y).
        Evidence: EL §4.1; M11 A4 (ovl09 writes the low byte only); stand-in X61."""
        return self.byte(self.offset(x, y))

    def set_lo(self, x: int, y: int, v: int) -> None:
        """Write the low byte of (x, y), high byte untouched.
        Evidence: M11 A4 §2 ("Mlo := v"); stand-in X61."""
        self.set_byte(self.offset(x, y), v)

    def hi(self, x: int, y: int) -> int:
        """High byte of the map word of (x, y).
        Evidence: EL §4.1; stand-in X61."""
        return self.byte(self.offset(x, y) + 1)

    def set_hi(self, x: int, y: int, v: int) -> None:
        """Write the high byte of (x, y), low byte untouched.
        Evidence: M11 A6 (ovl12 `and` / `or` on the high byte); stand-in X61."""
        self.set_byte(self.offset(x, y) + 1, v)


class Roads(Region):
    """The road / feature byte layer 19d9:0000 (index y * 0x70 + x)."""

    def __init__(self, data: bytes | None = None):
        super().__init__(K.ROADS_SIZE.value, data, "road layer")

    @staticmethod
    def offset(x: int, y: int) -> int:
        """y * 0x70 + x, unclamped.
        Evidence: asm ovl02:0389..0395 (imul 0x70, add x; es = 0x19d9)."""
        return y * K.GRID_W.value + x

    def at(self, x: int, y: int) -> int:
        """The road byte of (x, y).
        Evidence: asm ovl02:0395; stand-in X61."""
        return self.byte(self.offset(x, y))

    def set_at(self, x: int, y: int, v: int) -> None:
        """Write the road byte of (x, y).
        Evidence: M11 A4 / A6 road writes; stand-in X61."""
        self.set_byte(self.offset(x, y), v)
