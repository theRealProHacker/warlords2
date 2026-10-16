"""ovl11 of WARLORD2.EXE: the random map's cities, sites, capitals and city details (M11 R2).

Entries and their callers (asm `out/asm/ovl11.asm`, M11 A5):

* `place_cities` = ovl11:0000, pipeline stage 60 (ovl02:017f): the cities already in the grid
  (028c), the army flag table (ovl48:0000), then one `place_city` (0331) per city up to the
  slider-adjusted RANDOM.DAT word +0x2a (70..100).
* `place_sites` = ovl11:003a, stage 70 (ovl02:018c): 40 sites on plain squares found by
  `site_square` (0a77, the zone rotor DS:02d4 = `RandomRun.rotor`), their names and the
  RANDOM.SPC text; a generator yielding the progress percentages 71..79 it draws itself.
* Stage 90, called from ovl09:0014 (package R3's `files.finish`), in this order:
  `city_table` = ovl11:05e3 (ovl09:0024), then `sides.sides` = ovl10:0000
  (ovl09:0029; it runs `choose_capitals` = ovl11:0689 first), then `city_details` =
  ovl11:0ce0 (ovl09:0036): per city the terrain flags, quality (1104), name (1468), income and
  RANDOM.CTY text (1171), production (161d); the allies (1b3f, only with DS:28cc =
  `RandomRun.allies`) and the capitals' strong unit (1c1d).

Data the routines take from outside the RANDOM.DAT buffer, both read lazily through
`Work.read` and kept on the `Work` (a host or a test may set them first):

* `work.exe_text`: the EXE's format strings DS:02e0, 02e5, 031f, 0329, 0361, 0381
  (`K.TEXT_DS`, read from WARLORD2.EXE's DGROUP, never held in this source).
* `work.army_file`: the ARMYTYPE file bytes (29 records of 0x3e), FILE.DAT (21, DS:26c4 =
  `work.army_set`) with SCN 0x161, read by ovl44:1128 (cached by the EXE for the run, DS:0e88).
  The two shipped files differ only in the names, which ovl11 never reads.  The per-type flag
  table DS:45c4 of ovl48:0000 (stage 60) is computed from the same file when stage 90 needs it
  (no dice, same data), as `work.army`.

Screen-only work not modelled: the preview pixels ovl02:03aa (0331), the progress bar
ovl02:01ff (its percentages are yielded by `place_sites`).
"""
from __future__ import annotations

import re
from collections.abc import Iterator
from dataclasses import dataclass

from ...formats.tables import StringTable
from ..constants import randmap as K
from . import sprintf, tries
from .buffer import s16

# ---------------------------------------------------------------- small helpers


def _div(a: int, b: int) -> int:
    """C (idiv) division, truncating toward zero."""
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q


def _mod(a: int, b: int) -> int:
    return a - b * _div(a, b)


def _text(work, ds) -> bytes:
    """The EXE format string DS:`ds.value` (`Work.exe_text`)."""
    return work.exe_text.cstr(ds.value)


def _rec(c: int) -> int:
    return K.SCN_CITY.value + K.CITY_LEN.value * s16(c)


def _player(p: int) -> int:
    return K.SCN_PLAYER.value + K.PLAYER_LEN.value * p


def city_count(work) -> int:
    """SCN word 0x157b, the city count the routines read live.
    Evidence: asm ovl11:0930 / 1b69 / 10e5 (word 2c04:157b)."""
    return work.scn.word(K.SCN_CITY_COUNT.value)


def city_xy(work, c: int) -> tuple[int, int]:
    """(x, y) words of city record `c` (flat: c = -1 reads the bytes before the table).
    Evidence: asm ovl11:094b..095a (2c04:157d / 157f + 0x41 c)."""
    return work.scn.word(_rec(c) + K.C_X.value), work.scn.word(_rec(c) + K.C_Y.value)


def _add_city(work, x: int, y: int) -> None:
    scn = work.scn
    n = city_count(work)
    scn.set_word(_rec(n) + K.C_X.value, x)
    scn.set_word(_rec(n) + K.C_Y.value, y)
    scn.set_word(K.SCN_CITY_COUNT.value, n + 1)


# ---------------------------------------------------------------- the army type file (ovl44 / 48 / 47)


class ArmyTable:
    """The ARMYTYPE records as ovl44's cache holds them, and the per-type flag bytes ovl48:0000
    puts in DS:45c4 (+0 flies = record +0x36, +4 = record +0x30, read as "may be an ally")."""

    def __init__(self, data: bytes):
        self.data = bytes(data)
        self.flies: dict[int, int] = {}
        self.ally: dict[int, int] = {}
        last = bytes(K.ARMY_REC.value)            # [unverified] stack bytes before the first copy
        for t in range(K.ARMY_N.value):           # ovl48:0000: 14ac copies only a found record
            r = self.find(t)
            last = r if r is not None else last
            self.flies[t] = last[K.A_FLIES.value]
            self.ally[t] = last[K.A_ALLY.value]

    def find(self, t: int) -> bytes | None:
        """ovl44:14ac(t, dst): the first record whose id word equals t, or None (dst untouched).
        Evidence: asm ovl44:14b3..14ec (word es:[bx] == [bp + 6], 0x1d records)."""
        for i in range(K.ARMY_N.value):
            r = self.data[i * K.ARMY_REC.value:(i + 1) * K.ARMY_REC.value]
            if len(r) == K.ARMY_REC.value and int.from_bytes(r[:2], "little") == t & 0xFFFF:
                return r
        return None

    @staticmethod
    def word(rec: bytes, off: int) -> int:
        """Signed word of a record.
        Evidence: asm ovl44:1455..1494 (word reads of the record)."""
        return s16(int.from_bytes(rec[off:off + 2], "little"))

    def is_ally(self, t: int) -> int:
        """DS:45c8 + 6 t (ovl48:0000); types outside 0..28 read 0 [unverified: DGROUP bytes past
        the table].
        Evidence: asm ovl48:004e..005d; ovl11:1759, 1cb4, ovl47:1aac."""
        return self.ally.get(t, 0)

    def is_flier(self, t: int) -> int:
        """DS:45c4 + 6 t (ovl48:0000); outside 0..28 0 [unverified, as `is_ally`].
        Evidence: asm ovl48:001e..0021; ovl11:19b4, 19e3."""
        return self.flies.get(t, 0)

    def random_ally(self, rng) -> int:
        """ovl47:1a9b: n = the ally types among 0..27, r = rnd(1, n, -1), the r-th ally type in
        order; none found or not an ally: 0x19.
        Evidence: asm ovl47:1aa1..1b02 (die ovl47:1abf)."""
        n = sum(1 for t in range(K.ALLY_SCAN.value) if self.is_ally(t))
        r = rng.rnd(1, n, -1)
        cnt, t = 0, 0
        while t < K.ALLY_SCAN.value:
            if self.is_ally(t):
                if cnt == r:
                    break
                cnt += 1
            t += 1
        if t < K.ALLY_SCAN.value and self.is_ally(t):
            return t
        return K.ALLY_NONE.value


def army_table(work) -> ArmyTable:
    """The run's army types: `work.army` made from `work.army_file`, which is read first when
    None: FILE.DAT (21, `work.army_set`) % SCN 0x161 through `work.read`.
    Evidence: asm ovl44:1128..11c8 (name sprintf of FILE.DAT (0x15, DS:26c4), open mode 2, read
    whole); ovl48:0000."""
    if work.army is None:
        if work.army_file is None:
            name = StringTable(work.read("DATA/FILE.DAT")).get(K.ARMY_FILE.value, work.army_set)
            rel = re.sub(r"\\+", "/", name) % work.scn.word(K.SCN_TERRAIN_SET.value)
            work.army_file = work.read(rel)
        work.army = ArmyTable(work.army_file)
    return work.army


# ---------------------------------------------------------------- stage 60: cities


def place_cities(work) -> None:
    """ovl11:0000 (stage 60): city count := 0; `existing_cities` (028c); ovl48:0000 (the flag
    table, no dice: computed from the same file by `army_table` when stage 90 reads it); then
    `place_city` for si = word +0xa84 while word +0x2a > si (signed).
    Evidence: asm ovl11:0000..0039."""
    buf = work.buf
    work.scn.set_word(K.SCN_CITY_COUNT.value, 0)
    existing_cities(work)
    si = buf.word(K.PRESET.value)
    while buf.word(K.CITY_COUNT.value) > si:
        place_city(work)
        si = s16(si + 1)


def existing_cities(work) -> None:
    """ovl11:028c: x outer 0..0x6f, y inner 0..0x9b: a grid 10 whose flat neighbours (x, y - 1)
    and (x - 1, y) are not 10 is a city's top-left: word +0xa84 += 1, the city appended.  No
    bounds test (row -1 is RANDOM.DAT scratch, x - 1 the previous row's last byte).
    Evidence: asm ovl11:028c..0330."""
    buf = work.buf
    for x in range(K.GRID_W.value):
        for y in range(K.GRID_H.value):
            if (buf.grid(x, y) == 10 and buf.grid(x, y - 1) != 10 and buf.grid(x - 1, y) != 10):
                buf.set_word(K.PRESET.value, buf.word(K.PRESET.value) + 1)
                _add_city(work, x, y)


def place_city(work) -> tuple[int, int]:
    """ovl11:0331: draw (x, y) = (rnd(1, 102, 5), rnd(1, 146, 5)) until placed.  A candidate is
    valid when none of its 2 x 2 squares (DS:02c4 / 02cc) is grid 3, 2, 10, 6 or 5 and none of
    nb8(square, 10), nb8(square + (1, 1), 10), nb8(square - (1, 1), 10) holds.  The first four
    valid candidates are taken only beside shore (nb8(., 3) of a square) and each counts; from the
    fifth any valid one is taken.  The city is appended and its squares set to grid 10.  No bound
    in the EXE: `tries("ovl11:0331")` (X59).
    Evidence: asm ovl11:0331..05e2 (dice 034e, 0360)."""
    buf, rng = work.buf, work.rng
    near = 0
    for _ in tries("ovl11:0331"):
        x = rng.rnd(1, 102, 5)
        y = rng.rnd(1, 146, 5)
        ok = True
        for dx, dy in zip(K.CITY_DX.value, K.CITY_DY.value):
            tx, ty = x + dx, y + dy
            if buf.grid(tx, ty) in (3, 2, 10, 6, 5):
                ok = False
            if buf.nb8(tx, ty, 10):
                ok = False
            if buf.nb8(tx + 1, ty + 1, 10):
                ok = False
            if buf.nb8(tx - 1, ty - 1, 10):
                ok = False
        if not ok:
            continue
        if near < 4:
            placed = (buf.nb8(x, y, 3) | buf.nb8(x + 1, y, 3) | buf.nb8(x, y + 1, 3)
                      | buf.nb8(x + 1, y + 1, 3))
            near += 1
            if placed:
                break
        else:
            break
    _add_city(work, x, y)
    for dx, dy in zip(K.CITY_DX.value, K.CITY_DY.value):
        buf.set_grid(x + dx, y + dy, 10)
    return x, y


# ---------------------------------------------------------------- stage 70: sites


def site_square(work, g: int) -> tuple[int, int]:
    """ovl11:0a77(g, &x, &y): the zone of the rotor q = DS:02d4 (rolled rnd(1, 16, -1) only while
    it is -1): x from (q % 4) * 28 + 4, 20 wide, y from (q / 4) * 39 + 4, 31 high.  Phase 1: up to
    50 draws in the zone of a square with grid (cbw) == g and no 10 / 11 beside it and no 11
    beside the squares 3 to the left, right, above, below.  Phase 2: up to 50 draws anywhere
    (rnd(1, 102, 5), rnd(1, 146, 5)) with grid == g and no 10 / 11 beside.  Phase 3: one pair
    drawn and dropped, then up to 50 draws until grid is neither 10 nor 11 (the last pair stays).
    Then rotor := (rotor + 1) % 16.
    Evidence: asm ovl11:0a77..0cdf (dice 0a93, 0aea, 0b02, 0bc4, 0bd6, 0c3d, 0c4f, 0c68, 0c7a)."""
    buf, rng, run = work.buf, work.rng, work.run
    if run.rotor == -1:
        run.rotor = rng.rnd(1, 16, -1)
    q = run.rotor
    xlo = _div(_mod(q, 4) * K.GRID_W.value, 4) + 4
    xhi = xlo + 20
    ylo = _div(_div(q, 4) * K.GRID_H.value, 4) + 4
    yhi = ylo + 31
    found = False
    for _ in range(50):
        x = rng.rnd(1, xhi - xlo, xlo - 1)
        y = rng.rnd(1, yhi - ylo, ylo - 1)
        if (buf.sgrid(x, y) == g and not buf.nb8(x, y, 10) and not buf.nb8(x, y, 11)
                and not buf.nb8(x - 3, y, 11) and not buf.nb8(x + 3, y, 11)
                and not buf.nb8(x, y - 3, 11) and not buf.nb8(x, y + 3, 11)):
            found = True
            break
    if not found:
        for _ in range(50):
            x = rng.rnd(1, 102, 5)
            y = rng.rnd(1, 146, 5)
            if buf.sgrid(x, y) == g and not buf.nb8(x, y, 10) and not buf.nb8(x, y, 11):
                found = True
                break
    if not found:
        x = rng.rnd(1, 102, 5)
        y = rng.rnd(1, 146, 5)
        for _ in range(50):
            x = rng.rnd(1, 102, 5)
            y = rng.rnd(1, 146, 5)
            if buf.grid(x, y) != 10 and buf.grid(x, y) != 11:
                break
    run.rotor = _mod(s16(run.rotor + 1), 16)
    return x, y


def place_sites(work) -> Iterator[int]:
    """ovl11:003a (stage 70, generator): site count := 40, every site's x = y = -1; then per site
    s (while count > s): the progress 70 + s * 10 / count when it changed (screen only, yielded);
    (x, y) = `site_square(7)`, the record's x / y, grid 11; a temple (kind byte +0x18 == 1, from
    the template SCN) is named sprintf(DS:031f, temple name [rnd(1, 10, -1)]), a ruin
    sprintf(template [rnd(1, w +0xed2, -1)], sprintf(DS:02e0, A [b], B [a])) with a, b the next two
    rnd(1, 10, -1) (B's die first); the name strcpy'd to +4; its text sprintf(DS:0329 / 02e5, s,
    name) appended at +0x3e96 + word +0x1066, which grows by its length.
    Evidence: asm ovl11:003a..028b (dice 01d3; 0116, 0129, 014b)."""
    buf, scn, rng = work.buf, work.scn, work.rng
    last = 0
    scn.set_word(K.SCN_SITE_COUNT.value, K.N_SITES.value)
    for s in range(K.N_SITES.value):
        r = K.SCN_SITE.value + K.SITE_LEN.value * s
        scn.set_word(r + 2, -1)
        scn.set_word(r, -1)
    s = 0
    while scn.word(K.SCN_SITE_COUNT.value) > s:
        pct = _div(s16(s * 10), scn.word(K.SCN_SITE_COUNT.value))
        if pct != last:
            last = pct
            yield pct + 70
        x, y = site_square(work, 7)
        r = K.SCN_SITE.value + K.SITE_LEN.value * s
        scn.set_word(r, x)
        scn.set_word(r + 2, y)
        buf.set_grid(x, y, 11)
        if scn.byte(r + K.S_KIND.value) == K.TEMPLE.value:
            c = rng.rnd(1, 10, -1)
            name = sprintf(_text(work, K.FMT_TEMPLE_NAME),
                           buf.cstr(K.TEMPLE_NAMES.value + K.NAME_SLOT.value * c))
            scn.set_cstr(r + K.S_NAME.value, name)
            txt = sprintf(_text(work, K.FMT_TEMPLE_TEXT), s, scn.cstr(r + K.S_NAME.value))
        else:
            n = rng.rnd(1, buf.word(K.RUIN_TEMPLATES_N.value), -1)
            a = rng.rnd(1, 10, -1)
            b = rng.rnd(1, 10, -1)
            base = sprintf(_text(work, K.FMT_RUIN_BASE), buf.cstr(K.RUIN_A.value + K.NAME_SLOT.value * b),
                           buf.cstr(K.RUIN_B.value + K.NAME_SLOT.value * a))
            off, size = K.RUIN_TEMPLATES.value
            name = sprintf(buf.cstr(off + size * n), base)
            scn.set_cstr(r + K.S_NAME.value, name)
            txt = sprintf(_text(work, K.FMT_RUIN_TEXT), s, scn.cstr(r + K.S_NAME.value))
        _append(buf, K.SPC_TEXT.value, K.SPC_LEN.value, txt)
        s += 1


def _append(buf, text: int, length: int, txt: bytes) -> None:
    """strcpy(buffer + text + word length, txt); word length += strlen(txt) (16-bit)."""
    buf.set_cstr(text + buf.uword(length), txt)
    buf.set_word(length, buf.word(length) + len(txt))


# ---------------------------------------------------------------- stage 90: city table, capitals


def city_table(work) -> None:
    """ovl11:05e3 (stage 90, from ovl09:0024): y outer 0..0x9b, x inner 0..0x6f: a map word whose
    low byte is 0x60 starts city n: x, y, owner 0xf, byte +0x14 = rnd(1, 3, 2); count := n.
    Evidence: asm ovl11:05e3..0688 (die 0650)."""
    scn, rng = work.scn, work.rng
    n = 0
    for y in range(K.GRID_H.value):
        for x in range(K.GRID_W.value):
            if work.map.lo(x, y) == K.CITY_TILE_ID.value:
                r = _rec(n)
                scn.set_word(r + K.C_X.value, x)
                scn.set_word(r + K.C_Y.value, y)
                scn.set_byte(r + K.C_OWNER.value, K.NEUTRAL.value)
                scn.set_byte(r + K.C_B20.value, rng.rnd(1, 3, 2))
                n += 1
    scn.set_word(K.SCN_CITY_COUNT.value, n)


def quadrant_city(work, k: int) -> int:
    """ovl11:08f0(k): c = rnd(1, count, -1) until the city lies in quadrant k (x in
    (k % 4) * 28 .. + 27, y in (k / 4) * 78 .. + 77) or 202 draws were made; the last c.
    Evidence: asm ovl11:08f0..09b2 (die 0937; cmp counter 0xc8 jg after the post-increment)."""
    qx = _mod(k, 4) * 0x1C
    qy = _div(k, 4) * 0x4E
    cnt = 0
    while True:
        c = work.rng.rnd(1, city_count(work), -1)
        x, y = city_xy(work, c)
        inside = x >= qx and qx + 0x1C > x and y >= qy and qy + 0x4E > y
        old, cnt = cnt, cnt + 1
        if old > 200 or inside:
            return c


def city_at(work, x: int, y: int) -> int:
    """ovl62:044a(x, y): the first city c < count with x word in (x, x - 1) and y word in (y, y - 1),
    else -1.
    Evidence: asm ovl62:044a..04b4."""
    for c in range(max(city_count(work), 0)):
        cx, cy = city_xy(work, c)
        if (cx == x or cx == s16(x - 1)) and (cy == y or cy == s16(y - 1)):
            return c
    return -1


def paint_capital(work, c: int, p: int) -> None:
    """ovl11:09b3(&city c, p): the low bytes of the 2 x 2 map words at the city's (x, y) := base,
    base + 1, base + 0x10, base + 0x11 with base = 0x80 + 2 (p - 6) for p >= 6, else 0x62 + 2 p
    (high bytes kept; 16-bit offset y * 0xe0 + 2 x).
    Evidence: asm ovl11:09b3..0a76."""
    (lim, hi_base, lo_base), (dx1, dy1, dxy) = K.CAPITAL_TILES.value
    x, y = city_xy(work, c)
    base = hi_base + (p - lim) * 2 if p >= lim else lo_base + p * 2
    off = (y * 0xE0 + x * 2) & 0xFFFF
    m = work.map
    m.set_byte(off, base)
    m.set_byte((off + 2) & 0xFFFF, base + dx1)
    m.set_byte((off + 0xE0) & 0xFFFF, base + dy1)
    m.set_byte((off + 0xE2) & 0xFFFF, base + dxy)


def choose_capitals(work) -> None:
    """ovl11:0689 (from ovl10:0003): up to 10 passes.  Each pass: every capital := (-100, -100),
    quadrants unused; per side p: k = rnd(1, 8, -1) until an unused quadrant; then up to 100 tries
    of c = `quadrant_city(k)` until 12 <= x <= 100, 12 <= y <= 144 and |x - capx[j]| >= 20 and
    |y - capy[j]| >= 20 for all j.  After 100 tries (even when the 100th fits) the pass restarts
    while fewer than 10 passes ran; else word +0x1d72 [k] := word +0x1d62 [p] and the capital :=
    the last c.  Then per p: c = `city_at(capital)` (unchecked), owner := p, `paint_capital`.
    Evidence: asm ovl11:0689..08ef (die 06f3)."""
    buf, scn, rng = work.buf, work.scn, work.rng
    passes = 0
    restart = True
    while restart:
        restart = False
        passes += 1
        used = [0] * K.N_SIDES.value
        for i in range(K.N_SIDES.value):
            scn.set_word(_player(i) + K.P_CAPX.value, -100)
            scn.set_word(_player(i) + K.P_CAPY.value, -100)
        for p in range(K.N_SIDES.value):
            while True:
                k = rng.rnd(1, 8, -1)
                if used[k] == 0:
                    used[k] = 1
                    break
            found, n = False, 0
            while not found and n < 100:
                c = quadrant_city(work, k)
                cx, cy = city_xy(work, c)
                if 12 <= cx <= 100 and 12 <= cy <= 0x90:
                    ok = True
                    for j in range(K.N_SIDES.value):
                        if (abs(s16(cx - scn.word(_player(j) + K.P_CAPX.value))) < 20
                                or abs(s16(cy - scn.word(_player(j) + K.P_CAPY.value))) < 20):
                            ok = False
                            break
                    found = ok
                n += 1
            if n >= 100 and passes < 10:
                restart = True
                break
            buf.set_word(K.QUAD_REGION.value + 2 * k, buf.word(K.HOME_REGION.value + 2 * p))
            scn.set_word(_player(p) + K.P_CAPX.value, cx)
            scn.set_word(_player(p) + K.P_CAPY.value, cy)
    for p in range(K.N_SIDES.value):
        c = city_at(work, scn.word(_player(p) + K.P_CAPX.value), scn.word(_player(p) + K.P_CAPY.value))
        scn.set_byte(_rec(c) + K.C_OWNER.value, p)
        paint_capital(work, c, p)


# ---------------------------------------------------------------- stage 90: per-city details


@dataclass
class Flags:
    """The words DS:02d6, 02d8, 02da, 02dc, 02de of ovl11:0ce0: grid 3, 4, 0, 5, 8 beside one of
    the city's four squares (named by that grid value)."""
    n3: int = 0
    n4: int = 0
    n0: int = 0
    n5: int = 0
    n8: int = 0


def terrain_flags(work, c: int) -> Flags:
    """ovl11:0ce0's flags of city c: for v in 3, 4, 0, 5, 8: nb8 of (x, y), (x + 1, y),
    (x, y + 1) or (x + 1, y + 1) with v.
    Evidence: asm ovl11:0cea..10bc."""
    buf = work.buf
    x, y = city_xy(work, c)

    def near(v):
        return int(bool(buf.nb8(x, y, v) or buf.nb8(x + 1, y, v) or buf.nb8(x, y + 1, v)
                        or buf.nb8(x + 1, y + 1, v)))

    return Flags(near(3), near(4), near(0), near(5), near(8))


def city_quality(work, c: int, f: Flags) -> int:
    """ovl11:1104(c): 9 for an owned city (no die); else rnd(1, 4, -1) + 4 (n3) + 2 (n0) - 1 (n4)
    - 2 (n8), then at most 9, at least 0.
    Evidence: asm ovl11:1104..1170 (die 1127)."""
    if work.scn.byte(_rec(c) + K.C_OWNER.value) != K.NEUTRAL.value:
        return 9
    d = work.rng.rnd(1, 4, -1)
    d += 4 if f.n3 else 0
    d += 2 if f.n0 else 0
    d -= 1 if f.n4 else 0
    d -= 2 if f.n8 else 0
    d = min(d, 9)
    return d if d > 0 else 0


def city_name(work, c: int, f: Flags) -> bytes:
    """ovl11:1468(c): parts = 3 if rnd(1, 10, 0) < 7 else 2; part 1 [rnd(1, 20, -1)], with 3 parts
    part 2 [rnd(1, 20, -1)]; then rnd(1, 10, 0) >= 7 -> the generic suffix [rnd(1, 20, -1)]; else
    the suffix list of the first flag of n8, n4, n3, n5 [rnd(1, 10, -1)]; no flag: rnd(1, 10, 0)
    < 5 -> the plain list [rnd(1, 10, -1)], else the generic suffix.  strcpy'd to the city's +4.
    Evidence: asm ovl11:1468..161c (dice 147b, 14a9, 14db, 1507, 1523, 1547, 156b, 158e, 15aa,
    15bc, 15d8)."""
    buf, rng = work.buf, work.rng
    slot = K.NAME_SLOT.value
    parts = 3 if rng.rnd(1, 10, 0) < 7 else 2
    # 1493..149c strcpy(name, DS:0381 = "") is overwritten by the next strcpy (14c8)
    name = buf.cstr(K.NAME1.value + slot * rng.rnd(1, 20, -1))
    if parts == 3:
        name += buf.cstr(K.NAME2.value + slot * rng.rnd(1, 20, -1))
    table = None
    if rng.rnd(1, 10, 0) < 7:
        for flag, t in ((f.n8, K.SUF_N8), (f.n4, K.SUF_N4), (f.n3, K.SUF_N3), (f.n5, K.SUF_N5)):
            if flag:
                table = t
                break
        else:
            if rng.rnd(1, 10, 0) < 5:
                table = K.SUF_NONE
    if table is not None:
        suf = buf.cstr(table.value + slot * rng.rnd(1, 10, -1))
    else:
        suf = buf.cstr(K.NAME_GENERIC.value + slot * rng.rnd(1, 20, -1))
    name += suf
    work.scn.set_cstr(_rec(c) + K.C_NAME.value, name)
    return name


def city_text(work, c: int, q: int, f: Flags) -> bytes:
    """ovl11:1171(c, q): `city_name`; income word := 2 q + rnd(1, 8, 0) + 14; a, b =
    rnd(1, 3, q - 2) twice, each clamped to 0..9; with n4, n8 or n5 and rnd(1, 100, 0) < 80: k =
    rnd(1, 2, 7) (n8) / rnd(1, 4, 3) (n5) / rnd(1, 4, -1), phrases set A [rnd(1, 10, -1)],
    [rnd(1, 10, -1)], [k]; else rnd(1, 100, 0) < 50 -> set C, else set B, three rnd(1, 10, -1)
    each; then m = rnd(1, 3, -1); the line sprintf(DS:0361, c, name, word1 [a][m], word2 [b],
    p1, p2, p3) appended at +0x1f56 + word +0x1064 (which grows by its length).
    Evidence: asm ovl11:1171..1467 (dice 118b, 11b8, 11ce, 1225, 1255, 1268, 128f, 12c6, 12db,
    1302, 1329, 134c, 1373, 139a, 13e1)."""
    buf, scn, rng = work.buf, work.scn, work.rng
    city_name(work, c, f)
    r = _rec(c)
    scn.set_word(r + K.C_INCOME.value, 2 * q + rng.rnd(1, 8, 0) + 14)
    a = min(max(rng.rnd(1, 3, q - 2), 0), 9)
    b = min(max(rng.rnd(1, 3, q - 2), 0), 9)
    ps = K.PHRASE_SLOT.value
    phrases = None
    if f.n4 or f.n8 or f.n5:
        if rng.rnd(1, 100, 0) < 80:
            if f.n8:
                k = rng.rnd(1, 2, 7)
            elif f.n5:
                k = rng.rnd(1, 4, 3)
            else:
                k = rng.rnd(1, 4, -1)
            t1, t2, t3 = K.PHRASES_FLAG.value
            p1 = t1 + ps * rng.rnd(1, 10, -1)
            p2 = t2 + ps * rng.rnd(1, 10, -1)
            phrases = (p1, p2, t3 + ps * k)
    if phrases is None:
        tables = K.PHRASES_LOW.value if rng.rnd(1, 100, 0) < 50 else K.PHRASES_HIGH.value
        phrases = tuple(t + ps * rng.rnd(1, 10, -1) for t in tables)
    w1, row = K.DESC_WORD1.value
    word1 = w1 + row * a + ps * rng.rnd(1, 3, -1)
    word2 = K.DESC_WORD2.value + ps * b
    txt = sprintf(_text(work, K.FMT_CITY_TEXT), c, scn.cstr(r + K.C_NAME.value), buf.cstr(word1),
                  buf.cstr(word2), *(buf.cstr(p) for p in phrases))
    _append(buf, K.CTY_TEXT.value, K.CTY_LEN.value, txt)
    return txt


def _set_slot(scn, c: int, k: int, t: int, turns: int, strength: int, moves: int, cost: int) -> None:
    r = _rec(c) + k
    scn.set_byte(r + K.C_SLOT_ID.value, t)
    scn.set_byte(r + K.C_SLOT_TURNS.value, turns)
    scn.set_byte(r + K.C_SLOT_COST.value, cost)
    scn.set_byte(r + K.C_SLOT_STR.value, strength)
    scn.set_byte(r + K.C_SLOT_MOVES.value, moves)


def _entry(buf, i: int) -> int:
    return K.PROD.value + K.PROD_LEN.value * i


def _set_entry_slot(work, c: int, k: int, e: int) -> None:
    b = work.buf
    _set_slot(work.scn, c, k, b.word(e), b.word(e + 0xA), b.word(e + 8), b.word(e + 0xE), b.word(e + 0xC))


def quadrant(work, c: int) -> int:
    """161d's quadrant of city c: x * 4 / 112 + (y * 2 / 156) * 4 (idiv).
    Evidence: asm ovl11:1627..165f."""
    x, y = city_xy(work, c)
    return _div(s16(x * 4), K.GRID_W.value) + _div(s16(y * 2), K.GRID_H.value) * 4


def production(work, c: int, q: int, f: Flags) -> int:
    """ovl11:161d(c, q): ns = rnd(1, 4, -1) + q / 2 + n4 + n5, clamped to 0..4; the 29 entries'
    strength / turns / cost / moves := the army type's (ovl44:142c, a type not found keeps the
    buffer's); then entries i while i < 29 and n < ns: an ally type is skipped without a die
    when DS:28cc is off; rnd(1, 10, -1) < chance; kind 7, kind 4 with n4, kind 5 with n5, kind 3
    with n3 or region == word +0x1d72 [quadrant] takes it, type 5 without n3 never.  None:
    entry 0.  q > 6 and rnd(1, 10, -1) < 5 and n <= 3: unless a flier already sits in the slots,
    the first flying non-ally entry with the region, kind 7, kind 4 + n4 or kind 5 + n5 is added.
    Slots n..3 get id 0xff.  Returns n.
    Evidence: asm ovl11:161d..1b3e (dice 166a, 176b, 1980)."""
    buf, scn, rng = work.buf, work.scn, work.rng
    quad = quadrant(work, c)
    ns = rng.rnd(1, 4, -1) + _div(q, 2)
    ns += 1 if f.n4 else 0
    ns += 1 if f.n5 else 0
    ns = min(ns, 4)
    ns = ns if ns > 0 else 0
    army = army_table(work)
    for i in range(K.PROD_N.value):
        e = _entry(buf, i)
        rec = army.find(buf.word(e))
        if rec is not None:
            buf.set_word(e + 0xA, army.word(rec, K.A_TURNS.value))
            buf.set_word(e + 8, army.word(rec, K.A_STR.value))
            buf.set_word(e + 0xC, army.word(rec, K.A_COST.value))
            buf.set_word(e + 0xE, army.word(rec, K.A_MOVES.value))
    region = buf.word(K.QUAD_REGION.value + 2 * quad)
    n, i = 0, 0
    while i < K.PROD_N.value and n < ns:
        e = _entry(buf, i)
        t = buf.word(e)
        i += 1
        if not work.run.allies and army.is_ally(t):
            continue
        if rng.rnd(1, 10, -1) >= buf.word(e + 2):
            continue
        kind = buf.word(e + 6)
        ok = (kind == 7 or (kind == 4 and f.n4) or (kind == 5 and f.n5) or (kind == 3 and f.n3)
              or buf.word(e + 4) == region)
        if t == 5 and not f.n3:
            ok = False
        if ok:
            _set_entry_slot(work, c, n, e)
            n += 1
    if n == 0:
        _set_entry_slot(work, c, 0, _entry(buf, 0))
        n = 1
    if q > 6 and rng.rnd(1, 10, -1) < 5 and n <= 3:
        lim = ns
        for k in range(n):
            if army.is_flier(scn.sbyte(_rec(c) + K.C_SLOT_ID.value + k)):
                lim = n
                break
        i = 0
        while i < K.PROD_N.value and n < lim:
            e = _entry(buf, i)
            t = buf.word(e)
            kind = buf.word(e + 6)
            if (army.is_flier(t) and not army.is_ally(t)
                    and (buf.word(e + 4) == region or kind == 7 or (kind == 4 and f.n4)
                         or (kind == 5 and f.n5))):
                _set_entry_slot(work, c, n, e)
                n += 1
                break
            i += 1
    for k in range(n, K.N_PROD_SLOTS.value):
        scn.set_byte(_rec(c) + K.C_SLOT_ID.value + k, 0xFF)
    return n


def slots_used(work, c: int) -> int:
    """ovl44:094f(c): the slots k in 0..3 whose id byte is >= 0 (signed).
    Evidence: asm ovl44:094f..0977."""
    return sum(1 for k in range(K.N_PROD_SLOTS.value) if work.scn.sbyte(_rec(c) + K.C_SLOT_ID.value + k) >= 0)


def _army_rec(army: ArmyTable, t: int) -> bytes:
    rec = army.find(t)
    if rec is None:      # ovl44:14ac leaves the caller's stack buffer as it was: unknowable
        raise ValueError("army type %d not in the army file (the EXE reads stack bytes) "
                         "[unverified]" % t)
    return rec


def allies(work) -> None:
    """ovl11:1b3f (only with DS:28cc): left = rnd(2, 3, 0); up to 100 tries while left > 0: c =
    rnd(1, count, -1); k = `slots_used(c)`; k < 4: t = ovl47:1a9b (`ArmyTable.random_ally`, one
    die), slot k of c := t with the type's turns / cost / strength / moves, left -= 1.
    Evidence: asm ovl11:1b3f..1c1c (dice 1b4c, 1b70; ovl47:1abf)."""
    rng = work.rng
    army = army_table(work)
    left = rng.rnd(2, 3, 0)
    n = 0
    while left > 0 and n < 100:
        n += 1
        c = rng.rnd(1, city_count(work), -1)
        k = slots_used(work, c)
        if k >= 4:
            continue
        t = army.random_ally(rng)
        rec = _army_rec(army, t)
        w = army.word
        _set_slot(work.scn, c, k, t, w(rec, K.A_TURNS.value), w(rec, K.A_STR.value),
                  w(rec, K.A_MOVES.value), w(rec, K.A_COST.value))
        left -= 1


def capital_units(work) -> None:
    """ovl11:1c1d: per side p, the city at its capital (`city_at`, none: skip); s = the highest
    slot 3..0 with id < 0, else 3; up to 40 counted tries of t = rnd(1, 28, -1) (t == 5 or an ally
    type: drawn again, not counted) until t is in no slot and its strength >= 5; found before the
    40th count: slot s's id byte := t (only the id).
    Evidence: asm ovl11:1c1d..1d28 (die 1c9d)."""
    scn, rng = work.scn, work.rng
    army = army_table(work)
    for p in range(K.N_SIDES.value):
        c = city_at(work, scn.word(_player(p) + K.P_CAPX.value), scn.word(_player(p) + K.P_CAPY.value))
        if c < 0:
            continue
        ids = _rec(c) + K.C_SLOT_ID.value
        s = -1
        for k in range(K.N_PROD_SLOTS.value - 1, -1, -1):
            if scn.sbyte(ids + k) < 0:
                s = k
                break
        if s < 0:
            s = 3
        n = 0
        while n < 40:
            t = rng.rnd(1, 28, -1)
            if t == 5 or army.is_ally(t):
                continue
            n += 1
            if any(scn.sbyte(ids + k) == t for k in range(K.N_PROD_SLOTS.value)):
                continue
            if army.word(_army_rec(army, t), K.A_STR.value) >= 5:
                break
        if n < 40:
            scn.set_byte(ids + s, t)


def city_details(work) -> None:
    """ovl11:0ce0 (stage 90, from ovl09:0036): per city c < count: `terrain_flags`,
    q = `city_quality`, `city_text` (name, income, CTY line), `production`; then `allies` when
    DS:28cc (`RandomRun.allies`); then `capital_units`.
    Evidence: asm ovl11:0ce0..1103."""
    c = 0
    while city_count(work) > c:
        f = terrain_flags(work, c)
        q = city_quality(work, c, f)
        city_text(work, c, q, f)
        production(work, c, q, f)
        c += 1
    if work.run.allies:
        allies(work)
    capital_units(work)
