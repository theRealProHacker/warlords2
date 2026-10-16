"""M11 R3: tiles (ovl09:005c / 0464 / 0a4b), roads (ovl12), signs (ovl09:113d), files (ovl09:1001,
0014, 027c, 10cf) and the road-builder mode of the path search (0555, DS:00e0).

Scripted-dice tests per routine on hand-built buffers (no game data), then structural checks
on a real stage 80 + 90 run over the shipped RANDOM map's terrain (game data)."""
import struct
from types import SimpleNamespace

import pytest

from randmapkit import RecordingRng, ScriptedRng, blank_work
from warlords2.formats import scenario as FS
from warlords2.model.state import GameState, PathSlot
from warlords2.rules import pathfinding as P
from warlords2.rules import randmap as RM
from warlords2.rules.constants import movement as MK
from warlords2.rules.constants import randmap as K
from warlords2.rules.randmap import files as F
from warlords2.rules.randmap import marsh as M
from warlords2.rules.randmap import roads as R
from warlords2.rules.randmap import signs as S
from warlords2.rules.randmap import tiles as T
from warlords2.rules.rng import Rng

W, H = 0x70, 0x9C
D1 = ((0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1))     # +0xbc (S .. SW)
D2 = ((0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0), (-1, -1))     # +0xdc (N .. NW)
DGROUP = 0x3125


def mkwork(script=(), read=None, rng=None):
    w = blank_work(rng if rng is not None else ScriptedRng(script),
                   read=read or (lambda rel: (_ for _ in ()).throw(FileNotFoundError(rel))))
    for k, (dx, dy) in enumerate(D1):
        w.buf.set_point(0xBC + 4 * k, dx, dy)
    for k, (dx, dy) in enumerate(D2):
        w.buf.set_point(0xDC + 4 * k, dx, dy)
    return w


def ten(v):
    return (10, 0, v)


def fake_exe(strings: dict[int, bytes], far: dict[int, int] | None = None) -> bytes:
    """An image whose DGROUP (header 0 paragraphs, DS = 0x3125) holds `strings` at their DS
    offsets and far pointers DS:off -> DS:target."""
    base = DGROUP * 16
    img = bytearray(base + 0x4000)
    for off, s in strings.items():
        img[base + off:base + off + len(s) + 1] = s + b"\0"
    for off, target in (far or {}).items():
        img[base + off:base + off + 4] = struct.pack("<HH", target, DGROUP)
    return bytes(img)


# =========================================================================== tiles (ovl09)


def test_chk_is_the_checkerboard_word():
    assert [T.chk(x, y) for x, y in ((0, 0), (1, 0), (0, 1), (1, 1), (2, 3), (3, 3), (5, 0))] \
        == [1, 0, 0, 1, 0, 1, 0]


def _tile_tables(w):
    """Distinct table words: block g word i = 0x700 + 0x10 g + i (the low byte is stored)."""
    for g in range(12):
        for i in range(32):
            w.buf.set_word(0x464 + 0x40 * g + 2 * i, 0x100 * 7 + 0x10 * g + i)   # hi byte 7 dropped


def test_base_tiles_city_blocks_sites_classes_and_first_sites():
    w = mkwork()
    _tile_tables(w)
    w.buf.set_word(0x6E4, 0x0760)                     # city base 0x60 (hi byte dropped)
    w.buf.set_word(0x724, 0x0A)
    w.buf.set_word(0x726, 0x0C)
    w.buf.set_word(0x728, 0x0B)
    for x in range(W):
        for y in range(H):
            w.map.set_at(x, y, 0xAB55)
            w.buf.set_grid(x, y, 7)
    for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1)):
        w.buf.set_grid(5 + dx, 5 + dy, 10)
    w.buf.set_grid(0, 7, 10)                          # x == 0: no block, nothing written
    w.buf.set_grid(0, 8, 10)
    w.buf.set_grid(10, 11, 11)                        # site, chk(10, 11) = 0
    w.buf.set_grid(3, 3, 4)
    for s, (x, y) in enumerate(((20, 20), (21, 21), (22, 22), (23, 23), (24, 24), (25, 25),
                                (26, 26), (27, 27), (28, 28))):
        w.scn.set_word(0x811 + 0x1F * s, x)
        w.scn.set_word(0x813 + 0x1F * s, y)
    T.base_tiles(w)
    assert [w.map.at(x, y) for x, y in ((5, 5), (6, 5), (5, 6), (6, 6))] == [0xAB60, 0xAB61, 0xAB70, 0xAB71]
    assert w.map.at(0, 7) == 0xAB55 and w.map.at(0, 8) == 0xAB55
    assert w.map.lo(10, 11) == 0x0A
    assert w.map.lo(3, 3) == 0x40 + T.chk(3, 3)       # block 4, word chk (byte 2 chk)
    assert w.map.lo(4, 3) == 0x70 + T.chk(4, 3)       # block 7
    assert [w.map.lo(20 + s, 20 + s) for s in range(9)] == [0x0B] * 8 + [0x70 + T.chk(28, 28)]
    assert all(w.map.hi(x, y) == 0xAB for x in range(W) for y in range(H))
    w.rng.assert_done()


def test_masks_bounds_classes_and_directions():
    w = mkwork()
    w.buf.set_grid(0, 1, 2)                           # S of (0, 0)
    assert T.water_mask(w, 0, 0) == 0b11111001        # off the map: NE, N, NW, W, SW
    w.buf.set_grid(1, 1, 1)
    w.buf.set_grid(1, 0, 3)
    assert T.water_mask(w, 0, 0) == 0b11111111
    w.buf.set_grid(30, 31, 4)
    w.buf.set_grid(31, 30, 6)
    w.buf.set_grid(29, 30, 5)
    assert T.forest_mask(w, 30, 30) == 0b00000001
    assert T.mountain_mask(w, 30, 30) == 0b00000100
    assert T.hill_mask(w, 30, 30) == 0b01000100
    w.roads.set_at(50, 49, 0xE0)                      # N, no piece
    w.roads.set_at(51, 50, 0x03)                      # E
    w.map.set_lo(49, 51, 0x85)                        # SW tile of terrain 1
    w.scn.set_byte(0x710 + 0x85, 1)
    assert T.road_mask(w, 50, 50) == (1 << 2) | (1 << 5)
    w.roads.set_at(1, 0, 1)
    assert T.road_mask(w, 0, 0) == 1 << 2             # off the map: no bit


def test_retile_sweeps_dice_tiles_and_spray(monkeypatch):
    sprays = []
    monkeypatch.setattr(T, "resolve", lambda m, f, a, p: (lambda w, x, y: sprays.append((x, y))))
    w = mkwork([ten(5), ten(6), ten(6), ten(5), ten(6), ten(7), (4, 0, 3), ten(1)])
    _tile_tables(w)
    for m in range(256):
        w.buf.set_byte(0x264 + m, 0xFF)               # every mask: -1 (lone)
    w.buf.set_byte(0x264 + 0x04, 5)                   # water with water to the E
    w.buf.set_byte(0x264 + 0x40, 1)                   # water with water to the W
    for (x, y), g in {(10, 10): 4, (20, 10): 4, (30, 10): 6, (40, 10): 5, (50, 10): 8,
                      (60, 10): 8, (70, 10): 2, (80, 20): 2, (81, 20): 3}.items():
        w.buf.set_grid(x, y, g)
    w.map.set_at(70, 10, 0xFF00)
    w.map.set_at(80, 20, 0xFF00)
    T.retile(w)
    w.rng.assert_done()
    v = T.chk
    assert (w.buf.grid(10, 10), w.map.lo(10, 10)) == (7, 0x70 + v(10, 10))
    assert (w.buf.grid(20, 10), w.map.lo(20, 10)) == (4, 0x40 + 26 + v(20, 10))          # +0x598
    assert (w.buf.grid(30, 10), w.map.lo(30, 10)) == (5, 0x50 + 26 + v(30, 10))          # +0x5d8
    assert (w.buf.grid(40, 10), w.map.lo(40, 10)) == (7, 0x70 + v(40, 10))
    assert (w.buf.grid(50, 10), w.map.lo(50, 10)) == (8, 0x80 + v(50, 10))
    assert (w.buf.grid(60, 10), w.map.lo(60, 10)) == (8, 0x80 + 6)                      # 4 * 3 bytes
    assert (w.buf.grid(70, 10), w.map.lo(70, 10), w.map.hi(70, 10)) == (8, 0x80 + v(70, 10), 0x7F)
    assert sprays == [(70, 10)]
    assert (w.buf.grid(80, 20), w.map.lo(80, 20), w.map.hi(80, 20)) == (2, 0x20 + 10 + v(80, 20), 0xFF)
    assert (w.buf.grid(81, 20), w.map.lo(81, 20)) == (2, 0x20 + 2 + v(81, 20))


def test_retile_sees_its_own_rewrites_in_the_sweep():
    """A forest square turned plain is no forest for its right neighbour in the same sweep."""
    w = mkwork([ten(2), ten(9)])
    for m in range(256):
        w.buf.set_byte(0x264 + m, 0xFF)
    w.buf.set_byte(0x264 + 0x40, 0)                   # forest to the W: not lone
    w.buf.set_grid(10, 10, 4)                         # mask 0x04 -> lone: plain on 2
    w.buf.set_grid(11, 10, 4)                         # its W is plain now: mask 0 -> lone, rolls
    T.retile(w)
    w.rng.assert_done()
    assert w.buf.grid(10, 10) == 7 and w.buf.grid(11, 10) == 4


def test_tiling_runs_base_then_retile_twice(monkeypatch):
    calls = []
    monkeypatch.setattr(T, "base_tiles", lambda w: calls.append("005c"))
    monkeypatch.setattr(T, "retile", lambda w: calls.append("0464"))
    T.tiling(None)
    assert calls == ["005c", "0464", "0464"]


def _road_work(script):
    w = mkwork(script)
    for m in range(256):
        w.buf.set_byte(0x364 + m, 0xFF)
    w.buf.set_byte(0x364 + 0x04, 0)                   # road to the E only -> piece 1
    w.buf.set_byte(0x364 + 0x44, 1)                   # E and W -> piece 2
    w.buf.set_byte(0x364 + 0x40, 2)                   # W only -> piece 3
    w.buf.set_word(0x624, 0x09)
    w.buf.set_word(0x626, 0x1F)
    w.buf.set_word(0x5D8, 0x4D)
    w.buf.set_word(0x5DA, 0x4E)
    return w


def test_road_tiles_pieces_lone_squares_and_markers():
    script = [ten(4), ten(8)]                         # (5, 5) lone -> plain; (7, 7) lone -> 0x5d8
    script += [(10, 10, 11), (0x70, -1, 0), (0x9C, -1, 0)]          # first marker: one miss
    script += [x for k in range(11) for x in ((0x70, -1, 11 + k), (0x9C, -1, 8))]
    script += [(10, 10, 11), (0x70, -1, 10), (0x9C, -1, 8)]         # piece 1 at (10, 8)
    script += [(0x70, -1, 0), (0x9C, -1, 0)] * (10 * 10000)          # 10 markers find none
    w = _road_work(script)
    w.roads.set_at(5, 5, 0xE7)
    w.roads.set_at(7, 7, 0x01)
    for x in range(10, 31):
        w.roads.set_at(x, 8, 0xA1)
    w.roads.set_at(40, 8, 0x01)                       # road next to a bridge tile
    w.map.set_lo(41, 8, 0x85)
    w.scn.set_byte(0x710 + 0x85, 1)
    T.road_tiles(w)
    w.rng.assert_done()
    assert (w.map.lo(5, 5), w.buf.grid(5, 5), w.roads.at(5, 5)) == (0x09 if T.chk(5, 5) == 0 else 0x1F, 7, 0xE7)
    assert (w.map.lo(7, 7), w.roads.at(7, 7)) == (0x4D + 0 if T.chk(7, 7) == 0 else 0x4E, 0x01)
    assert w.roads.at(10, 8) == 0xA0 | 0x10           # piece 1, then the 0x10 marker
    assert [w.roads.at(x, 8) for x in range(11, 22)] == [0xB1] * 11                     # markers 0x11
    assert [w.roads.at(x, 8) for x in range(22, 30)] == [0xA2] * 8
    assert w.roads.at(30, 8) == 0xA3
    assert w.roads.at(40, 8) == 0x01                  # bridge tile to the E -> piece 1


# =========================================================================== roads (ovl12)


def _cities(w, pts):
    w.scn.set_word(0x157B, len(pts))
    for c, (x, y) in enumerate(pts):
        w.scn.set_word(0x157D + 0x41 * c, x)
        w.scn.set_word(0x157F + 0x41 * c, y)


def _slots_clear(b):
    for s in range(50):
        for arr in (K.SLOT_X.value, K.SLOT_Y.value, K.SLOT_Z.value, K.SLOT_A.value, K.SLOT_B.value):
            b.put(arr, s, -1)
        b.put(K.SLOT_U.value, s, 0)


def test_bridges_only_horizontal_tile_0x26_builds():
    w = mkwork([(15, 1, 5), (15, 1, 9), (15, 1, 2)])
    _cities(w, [(10, 40)])
    w.map.set_lo(10, 10, 0x26); w.map.set_lo(11, 10, 0x28)
    w.buf.set_grid(9, 10, 7); w.buf.set_grid(12, 10, 4)
    w.map.set_lo(30, 10, 0x16); w.map.set_lo(31, 10, 0x18)     # h = 0: dropped
    w.buf.set_grid(29, 10, 7); w.buf.set_grid(32, 10, 7)
    w.map.set_lo(50, 10, 0x21); w.map.set_lo(50, 11, 0x24)     # vertical: dropped
    w.buf.set_grid(50, 9, 7); w.buf.set_grid(50, 12, 7)
    w.map.set_lo(70, 10, 0x26); w.map.set_lo(71, 10, 0x18)
    w.buf.set_grid(69, 10, 5); w.buf.set_grid(72, 10, 7)
    w.map.set_lo(90, 10, 0x26); w.map.set_lo(91, 10, 0x28)     # no land to the E
    w.buf.set_grid(89, 10, 7)
    w.roads.set_at(9, 10, 0xE5); w.roads.set_at(12, 10, 0x40)
    b = R.Slots()
    _slots_clear(b)
    R.bridges(w, b)
    w.rng.assert_done()
    assert [(b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s), b.get(K.SLOT_Z.value, s), b.get(K.SLOT_U.value, s))
            for s in range(3)] == [(10, 10, 1, 1), (70, 10, 1, 1), (-1, -1, -1, 0)]
    assert [b.get(K.SLOT_A.value, s) for s in range(2)] == [30, 67]
    for x in (10, 70):
        assert (w.map.lo(x, 10), w.map.lo(x + 1, 10)) == (0x85, 0x86)
        assert (w.buf.grid(x, 10), w.buf.grid(x + 1, 10)) == (1, 1)
    assert (w.roads.at(9, 10), w.roads.at(12, 10)) == (0xE1, 0x41)
    assert w.map.lo(30, 10) == 0x16 and w.map.lo(50, 10) == 0x21


def test_pick_bridge_ties_spacing_and_city_bonus():
    w = mkwork([(15, 1, 4), (15, 1, 4), (15, 1, 4)])
    _cities(w, [(5, 10)])
    b = R.Slots()
    _slots_clear(b)
    for s, x in enumerate((10, 15, 60)):              # slot 0 is 5 from the city: +25
        b.put(K.SLOT_X.value, s, x); b.put(K.SLOT_Y.value, s, 10)
    assert R.pick_bridge(w, b, 3) == 0                 # 4 + 20 beats 4, 4 (rolled s = 2, 1, 0)
    assert [b.get(K.SLOT_A.value, s) for s in range(3)] == [5, 10, 55]
    b.put(K.SLOT_U.value, 0, 1)
    w.rng = ScriptedRng([(15, 1, 7)])
    assert R.pick_bridge(w, b, 3) == 2                 # slot 1 is 5 from slot 0: not rolled
    assert b.get(K.SLOT_B.value, 1) == 5
    w.rng = ScriptedRng([(15, 1, 3), (15, 1, 3)])
    b.put(K.SLOT_U.value, 0, 0)
    b.put(K.SLOT_A.value, 0, 40)
    b.put(K.SLOT_A.value, 1, 40)
    assert R.pick_bridge(w, b, 2) == 1                 # equal: the first rolled (highest) wins
    w.rng = ScriptedRng([(15, 1, 2)])
    b.put(K.SLOT_U.value, 0, 1)
    b.put(K.SLOT_X.value, 2, 20)                            # exactly 10 from the taken slot 0: rolled
    assert R.pick_bridge(w, b, 3) == 2
    w.rng.assert_done()


def _port_script(zeros):
    out = []
    for y in range(1, 0x9A):
        for x in range(1, 0x6E):
            out.append((2, -1, 0 if (x, y) in zeros else 1))
    return out


def test_ports_rolls_every_square_then_picks():
    zeros = {(10, 10), (40, 20), (30, 60), (12, 12), (40, 40), (60, 60)}
    w = mkwork(_port_script(zeros) + [(15, 1, 2), (15, 1, 8), (15, 1, 5)])
    _cities(w, [(100, 150)])
    w.map.set_lo(10, 10, 0x20)                        # west: x - 3 .. x - 1 water
    for x in (7, 8, 9):
        w.buf.set_grid(x, 10, 2)
    w.map.set_lo(40, 20, 0x24)                        # south
    for y in (21, 22, 23):
        w.buf.set_grid(40, y, 2)
    w.map.set_lo(30, 60, 0x22)                        # east, the third square not water
    w.buf.set_grid(31, 60, 2); w.buf.set_grid(32, 60, 2)
    w.map.set_lo(12, 12, 0x21)                        # north, but 2 from the first slot
    for y in (9, 10, 11):
        w.buf.set_grid(12, y, 2)
    w.map.set_lo(40, 40, 0x26)                        # not a coast tile
    w.map.set_lo(61, 60, 0x20)                        # a coast tile whose roll is 1
    for x in (58, 59, 60):
        w.buf.set_grid(x, 60, 2)
    b = R.Slots()
    _slots_clear(b)
    b.put(K.SLOT_X.value, 0, 100); b.put(K.SLOT_Y.value, 0, 100); b.put(K.SLOT_U.value, 0, 1)   # a bridge
    b.put(K.SLOT_A.value, 0, 77)
    R.ports(w, b)
    w.rng.assert_done()
    assert [(b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s)) for s in range(4)] == \
        [(100, 100), (10, 10), (40, 20), (-1, -1)]
    assert w.map.hi(10, 10) == 0x80 and w.map.hi(40, 20) == 0x80
    assert [b.get(K.SLOT_U.value, s) for s in range(4)] == [1, 1, 1, 0]
    assert b.get(K.SLOT_A.value, 0) == 50                   # recomputed (was 77) for every filled slot
    assert w.map.hi(12, 12) == 0 and w.map.hi(61, 60) == 0


def test_ports_eleventh_pick_still_rolls():
    pts = [(10, 5 + 15 * i) for i in range(10)] + [(40, 5), (40, 25)]
    w = mkwork(_port_script(set(pts)) + [(15, 1, 2)] * (12 + 11 + 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2))
    _cities(w, [(111, 155)])
    for x, y in pts:
        w.map.set_lo(x, y, 0x20)
        for d in (1, 2, 3):
            w.buf.set_grid(x - d, y, 2)
    b = R.Slots()
    _slots_clear(b)
    R.ports(w, b)
    w.rng.assert_done()
    flagged = sorted(s for s in range(12) if b.get(K.SLOT_U.value, s))
    assert flagged == list(range(2, 12))               # ties: the highest slot first
    assert sum(1 for x in range(W) for y in range(H) if w.map.hi(x, y) & 0x80) == 10


def test_choose_pair_dice_restart_and_exhaustion():
    script = [(3, -1, 0), (1000, 0, 500)]
    script += [(3, -1, 0), (3, -1, 1), (3, -1, 2)]    # c2: no partner 30..70 -> restart (60 from c1, used)
    script += [(3, -1, 1)] * 80
    w = mkwork(script)
    _cities(w, [(10, 10), (10, 40), (10, 100)])          # 30 apart: a partner
    b = R.Slots()
    assert R.choose_pair(w, b) == (0, 1)
    assert R.choose_pair(w, b) is None
    w.rng.assert_done()
    assert [b.used(c) for c in range(3)] == [1, 1, 1]


def test_ring_square_tries_and_flat_reads():
    w = mkwork([(12, -1, 0), (12, -1, 6)] + [(12, -1, 3)] * 8)
    w.buf.set_grid(12, 12, 5)
    assert R.ring_square(w, 10, 10) == (True, (12, 12))
    assert R.ring_square(w, 30, 30) == (False, (32, 29))
    w.rng.assert_done()


def test_lay_road_marks_land_skips_water_and_marks_cities(monkeypatch):
    w = mkwork()
    _cities(w, [(16, 19), (60, 60)])
    for x in range(W):
        for y in range(H):
            w.buf.set_grid(x, y, 7)
    w.buf.set_grid(13, 10, 2)                         # water, terrain of its tile 2
    w.map.set_lo(13, 10, 0x30); w.scn.set_byte(0x710 + 0x30, 2)
    w.buf.set_grid(14, 10, 1)                         # grid 1 whose tile is plain: debug branch
    w.roads.set_at(12, 10, 0xE0)
    codes = [2] * 8 + [4, 4]
    monkeypatch.setattr(R, "search", lambda work, run, src, dst: list(codes))
    b = R.Slots()
    assert R.lay_road(w, b, R.PathRun(), 10, 10, 18, 11, 0) == 1
    assert w.roads.at(10, 10) == 0                    # the start gets no road
    assert [w.roads.at(x, 10) & 0xFF for x in range(11, 19)] == [1, 0xE1, 0, 0, 1, 1, 1, 1]
    assert w.roads.at(18, 11) == 1 and w.roads.at(18, 12) == 0      # stops at the target
    assert (w.scn.word(0x17D), w.scn.word(0x17F)) == (14, 10)
    assert [b.used(c) for c in range(2)] == [1, 0]    # after 6 steps, at (16, 10)
    monkeypatch.setattr(R, "search", lambda work, run, src, dst: None)
    assert R.lay_road(w, b, R.PathRun(), 10, 10, 18, 11, 0) == 0


def test_lay_road_mark_every_sixth_step(monkeypatch):
    w = mkwork()
    _cities(w, [(16, 19), (11, 1)])                   # 9 from (16, 10); 10 from it, 9 from (11, 10)
    for x in range(W):
        for y in range(H):
            w.buf.set_grid(x, y, 7)
    monkeypatch.setattr(R, "search", lambda work, run, src, dst: [2] * 12)
    b = R.Slots()
    R.lay_road(w, b, R.PathRun(), 10, 10, 30, 30, 0)
    assert [b.used(c) for c in range(2)] == [1, 0]    # checked at (16, 10) and (22, 10) only


def test_roads_stage_progress_dice_clears_and_order(monkeypatch):
    pairs = [(0, 1)] * 8
    log = []
    monkeypatch.setattr(R.T, "tiling", lambda w: log.append("tiling"))
    monkeypatch.setattr(R, "bridges_and_ports", lambda w, b: log.append("0165"))
    monkeypatch.setattr(R, "choose_pair", lambda w, b: pairs.pop() if pairs else None)
    monkeypatch.setattr(R, "rebuild_cost_map", lambda w, run: log.append("0d9e"))
    def connect(w, b, run, a, c):
        log.append("0b86")
        w.roads.set_at(5, 5, 0xE1)                    # roads laid on a site and a city square
        w.roads.set_at(6, 6, 0xE1)
    monkeypatch.setattr(R, "connect", connect)
    w = mkwork([(3, -1, 0), (3, -1, 1), (3, -1, 0), (3, -1, 0), (3, -1, 0), (3, -1, 0), (3, -1, 0)])
    w.map.set_at(3, 3, 0xFF12); w.roads.set_at(3, 3, 0xFF)
    w.buf.set_grid(5, 5, 0x0B); w.roads.set_at(5, 5, 0xE3)
    w.buf.set_grid(6, 6, 0x0A)
    assert list(R.roads(w)) == [81, 82, 83, 84, 85, 86, 87, 88, 89]
    w.rng.assert_done()
    assert log == ["tiling", "0165"] + ["0d9e", "0b86"] * 8
    assert w.map.at(3, 3) == 0x7F12 and w.roads.at(3, 3) == 0xE0 and w.roads.at(5, 5) == 0xE0
    assert w.roads.at(6, 6) == 0xE1
    assert isinstance(w.pathfinder, R.PathRun)


# =========================================================================== path search, DS:00e0


def _search_work(tiles_terrain, fill=0):
    w = mkwork()
    for t, ter in tiles_terrain.items():
        w.scn.set_byte(0x710 + t, ter)
    for x in range(W):
        for y in range(H):
            w.map.set_lo(x, y, fill)
    return w


def _game_view(w):
    """The same memory as a game search sees it (DS:00e0 = 0, the side-0 cost map)."""
    run = R.PathRun()
    v = R.SearchView(w, run)
    run.cost_map = P.cost_map(v, 0)
    return run


def test_road_mode_flag_only_from_the_road_builder():
    assert P.road_mode(GameState.__new__(GameState)) is False
    assert P.road_mode(SimpleNamespace(road_mode=True)) is True
    assert list(P._neighbours(50, 50, P.ROAD_INTERIOR_LIST)) == [(50, 49), (51, 50), (50, 51), (49, 50)]
    assert list(P._neighbours(0, 50, P.ROAD_INTERIOR_LIST)) == list(P._neighbours(0, 50))


def test_road_search_is_four_neighbour_and_uses_the_road_costs():
    w = _search_work({0: 7})
    run = R.PathRun()
    R.rebuild_cost_map(w, run)
    assert (run.side, run.road_mode) == (0x0E, True)
    assert run.cost_map[0] == 2                       # DS:01e0 plain
    codes = R.search(w, run, (10, 10), (14, 14))
    assert len(codes) == 8 and all(c % 2 == 0 for c in codes)
    game = _game_view(w)
    codes = P.find_path(R.SearchView(w, game), (10, 10), (14, 14), 1, 0)
    assert codes == [3, 3, 3, 3]
    assert run.path_cache[0].valid == 2 and run.path_cache[0].dst == (14, 14)   # near: slot 0
    assert len(run.dist_table) == W * H


def test_road_search_has_no_second_pass():
    w = _search_work({0: 7, 1: 10})
    for y in range(0, 41):
        w.map.set_lo(12, y, 1)                        # city tiles, owner 0 != 0xE: blocked
    run = R.PathRun()
    R.rebuild_cost_map(w, run)
    assert R.search(w, run, (10, 10), (14, 10)) is None
    game = _game_view(w)
    assert P.find_path(R.SearchView(w, game), (10, 10), (14, 10), 1, 0) is not None


def _backtrace(w, road, src, dst, field, water=(), bridge=()):
    run = R.PathRun()
    if road:
        R.rebuild_cost_map(w, run)
    else:
        run = _game_view(w)
    for x, y in water:
        run.cost_map[y * W + x] |= 8
    v = R.SearchView(w, run)
    s = P._Search(v, src, dst, 1, 0)
    s.dist = [MK.UNVISITED.value] * (W * H)
    for (x, y), val in field.items():
        s.dist[y * W + x] = val
    return s.backtrace(), s.dst


def test_backtrace_diagonal_only_into_non_bridge_water():
    w = _search_work({0: 7, 5: 1})
    f = {(10, 10): -5, (11, 9): -1}
    assert _backtrace(w, False, (10, 10), (11, 9), f) == ([1], (11, 9))
    assert _backtrace(w, True, (10, 10), (11, 9), f) == ([], (10, 10))
    sea = [(10, 10), (11, 9)]                         # water to water (no land-water change)
    assert _backtrace(w, True, (10, 10), (11, 9), f, water=sea) == ([1], (11, 9))
    w.map.set_lo(11, 9, 5)                            # bridge terrain
    assert _backtrace(w, True, (10, 10), (11, 9), f, water=sea) == ([], (10, 10))


def test_backtrace_takes_an_equal_neighbour_only_in_road_mode():
    w = _search_work({0: 7})
    f = {(10, 10): -3, (11, 10): 3}
    assert _backtrace(w, False, (10, 10), (11, 10), f) == ([], (10, 10))
    assert _backtrace(w, True, (10, 10), (11, 10), f) == ([2], (11, 10))


# =========================================================================== signs (ovl09:113d)


def _sign_work(script):
    words = {k: b"w%d" % k for k in range(8)}
    exe = fake_exe({0x3000 + 8 * k: s for k, s in words.items()},
                   {0x2B7C + 4 * k: 0x3000 + 8 * k for k in range(8)})
    w = mkwork(script, read=lambda rel: exe if rel == "WARLORD2.EXE" else (_ for _ in ()).throw(FileNotFoundError(rel)))
    w.buf.set_cstr(0x1888, b"<%s>")
    w.buf.set_cstr(0x189C, b"%d/%s")
    w.buf.set_word(0x18B0, 1)
    w.buf.set_cstr(0x18B2, b"pa")
    w.buf.set_cstr(0x18D0, b"pb")
    w.scn.set_byte(0x710 + 5, 7)
    w.scn.set_byte(0x710 + 0, 9)
    for x in range(W):
        for y in range(H):
            w.map.set_lo(x, y, 6)
    for x in range(W):
        w.map.set_lo(x, 50, 5)
    _cities(w, [(30, 60), (90, 40)])
    w.scn.set_cstr(0x1581, b"Aa")
    w.scn.set_cstr(0x1581 + 0x41, b"Bb")
    return w


def test_signs_retries_phrases_city_lines_and_layout():
    script = [(30, 40, 41)]
    script += [(0x70, -1, 0), (0x9C, -1, 0)]          # terrain 2-ish (tile 6): no
    script += [(0x70, -1, 5), (0x9C, -1, 50)]         # grid 10 to the S
    script += [(0x70, -1, 7), (0x9C, -1, 50)]         # grid 9 to the NE
    script += [(0x70, -1, 9), (0x9C, -1, 50)]         # a road piece
    script += [(0x70, -1, 20), (0x9C, -1, 50), ten(3)]                # phrase 0
    script += [(0x70, -1, 20), (0x9C, -1, 50)]        # the sign square is taken now
    script += [(0x70, -1, 22), (0x9C, -1, 50), ten(1)]                # phrases used up
    for i in range(39):
        script += [(0x70, -1, 24 + 2 * i), (0x9C, -1, 50), ten(9)]
    w = _sign_work(script)
    w.buf.set_grid(5, 51, 10)
    w.buf.set_grid(8, 49, 9)
    w.roads.set_at(9, 50, 0xE2)
    S.signs(w)
    w.rng.assert_done()
    d = w.files["SGN"]
    assert len(d) == 2 + 0x68 * 41 and struct.unpack_from("<H", d)[0] == 41
    recs = FS.parse_sgn(d)
    assert (recs[0]["x"], recs[0]["y"], recs[0]["line1"], recs[0]["line2"]) == (20, 50, "pa", "pb")
    assert d[2 + 4:2 + 4 + 3] == b"pa\0" and d[2 + 4 + 3:2 + 0x36] == bytes(0x36 - 4 - 3)
    # (22, 50): nearest (30, 60) at 12 -> "24", direction SE (3)
    assert (recs[1]["line1"], recs[1]["line2"]) == ("<Aa>", "24/w3")
    last = recs[40]                                   # (100, 50): (90, 40) at 14, NW
    assert (last["x"], last["line1"], last["line2"]) == (100, "<Bb>", "28/w7")
    assert all(w.map.lo(r["x"], r["y"]) == 0 for r in recs)


def test_exe_text_reads_dgroup_strings_and_far_pointers():
    exe = fake_exe({0x2B2: b"Tmpl", 0x3000: b"far"}, {0x2B7C: 0x3000})
    reads = []
    w = mkwork(read=lambda rel: reads.append(rel) or exe)
    assert w.exe_text.cstr(0x2B2) == b"Tmpl" and w.exe_text.far_cstr(0x2B7C) == b"far"
    assert w.exe_text.cstr(0x2B2) == b"Tmpl" and reads == ["WARLORD2.EXE"]   # read once
    hdr = bytearray(0x200) + exe                       # an MZ header of 0x20 paragraphs
    hdr[8:10] = (0x20).to_bytes(2, "little")
    t = RM.ExeText(lambda rel: bytes(hdr))
    assert t.cstr(0x2B2) == b"Tmpl" and t.far_cstr(0x2B7C) == b"far"
    t = RM.ExeText(lambda rel: (_ for _ in ()).throw(FileNotFoundError(rel)), {0x2B2: b"set"})
    assert t.cstr(0x2B2) == b"set"                     # filled first: the EXE is not read


def test_sign_helpers():
    assert RM.sprintf(b"%d %s %%|%-3s|%4d", 7, b"ab", b"c", 12) == b"7 ab %|c  |  12"
    assert [S.direction(5, 5, *p) for p in ((5, 1), (6, 1), (9, 5), (6, 6), (5, 9), (4, 6),
                                             (1, 5), (4, 4), (5, 5))] == [0, 1, 2, 3, 4, 5, 6, 7, 0]
    w = mkwork()
    _cities(w, [(10, 10), (14, 10), (6, 10)])
    assert S.nearest_city(w.scn, 10, 10) == 0 and S.nearest_city(w.scn, 12, 10) == 0
    assert S.nearest_city(w.scn, 13, 10) == 1


# =========================================================================== files (ovl09)


def _template_read(files):
    exe = fake_exe({0x2B2: b"Tmpl", 0x2BA: b"%s\\%s.scn"})

    def read(rel):
        if rel == "WARLORD2.EXE":
            return exe
        if rel in files:
            return files[rel]
        raise FileNotFoundError(rel)
    return read


def _scenario_dat(sets):
    out = b""
    for name, s in sets:
        r = bytearray(0x54)
        r[0x14:0x14 + len(name)] = name
        r[0x52:0x54] = struct.pack("<h", s)
        out += bytes(r)
    return out


def test_template_reads_the_scn_whole():
    scn = bytes((i * 7) & 0xFF for i in range(0x2EE1))
    w = mkwork(read=_template_read({"Tmpl/Tmpl.scn": scn + b"extra"}))
    assert F.template(w) is None
    assert bytes(w.scn.data) == scn
    w = mkwork(read=_template_read({"Tmpl/Tmpl.scn": b"\x01\x02"}))
    w.scn.data[:] = b"\x09" * 0x2EE1
    F.template(w)
    assert w.scn.data[:3] == b"\x01\x02\x09"         # a short file leaves the rest


def test_template_terrain_set_picks_a_scenario_record():
    dat = _scenario_dat([(b"Aaa", 0), (b"Bbb", 2)])
    w = mkwork(read=_template_read({"DATA/SCENARIO.DAT": dat, "Bbb/Bbb.scn": b"B" * 0x2EE1,
                                    "Tmpl/Tmpl.scn": b"T" * 0x2EE1}))
    w.run.terrain_set = 2
    F.template(w)
    assert w.scn.data[0] == ord("B")
    w.run.terrain_set = 5                             # no match: end of file keeps the name
    F.template(w)
    assert w.scn.data[0] == ord("T")
    w = mkwork(read=_template_read({}))
    w.scn.data[0] = 0x33
    F.template(w)                                     # missing file: SCN kept
    assert w.scn.data[0] == 0x33


def test_write_files_layouts():
    w = mkwork()
    for i in range(0, 0x8880, 7):
        w.map.data[i] = i & 0xFF
    for i in range(0, 0x4440, 5):
        w.roads.data[i] = (i >> 3) & 0xFF
    w.buf.set_word(0x1064, 5)
    w.buf.data[0x1F56:0x1F5C] = b"ABCDEF"
    w.buf.set_word(0x1066, 3)
    w.buf.data[0x3E96:0x3E9A] = b"xyzw"
    w.scn.data[0x2EE0] = 0x77
    F.write_files(w)
    F.write_scn(w)
    assert w.files["MAP"] == bytes(w.map.data) and len(w.files["MAP"]) == 0x8880
    assert w.files["RD"] == bytes(w.roads.data) and len(w.files["RD"]) == 0x4440
    assert (w.files["CTY"], w.files["SPC"]) == (b"ABCDE", b"xyz")
    assert len(w.files["SCN"]) == 0x2EE1 and w.files["SCN"][-1] == 0x77
    assert FS.parse_map(w.files["MAP"])[0] == w.map.at(0, 0)


def test_finish_order_percentages_and_file_order(monkeypatch):
    log = []

    def stub(name):
        def f(work):
            log.append(name)
            if name == "0ce0":
                return iter([])
        return f
    names = {("cities", "city_table"): "05e3", ("sides", "sides"): "ovl10",
             ("cities", "city_details"): "0ce0"}
    monkeypatch.setattr(F, "resolve", lambda m, f, a, p: stub(names[(m, f)]))
    monkeypatch.setattr(F, "road_tiles", lambda w: log.append("0a4b"))
    monkeypatch.setattr(F, "signs", lambda w: (log.append("113d"), w.files.__setitem__("SGN", b"\0\0")))
    w = mkwork()
    out = []
    for pct in F.finish(w):
        out.append(pct)
        log.append(pct)
    assert out == [92, 94, 96, 98]
    assert log == ["0a4b", 92, "05e3", "ovl10", 94, "0ce0", 96, "113d", 98]
    assert tuple(w.files) == tuple(k for k, _ in K.FILES.value)


def test_pipeline_resolves_the_r3_stages():
    names = {c.__name__: c for _, calls in RM.PIPELINE for c in calls}
    w = mkwork(read=_template_read({"Tmpl/Tmpl.scn": b"Z" * 0x2EE1}))
    assert names["template"](w) is None and w.scn.data[0] == ord("Z")
    assert hasattr(names["roads"](w), "__next__") and hasattr(names["finish"](w), "__next__")


def test_missing_r1_r2_functions_name_their_address(monkeypatch):
    with pytest.raises(NotImplementedError, match="ovl11:05e3"):
        T.resolve("no_such_module", "f", "ovl11:05e3", "R2")


# =========================================================================== a real stage 80 + 90 run


def _shipped_work(game, seed, pathfinder=None):
    from warlords2.formats.gamedir import GameDir
    gd = GameDir(game)
    w = RM.Work(RM.load_buffer(gd.read), RecordingRng(Rng(seed)), RM.RandomRun(), gd.read,
                pathfinder=pathfinder)
    scn = gd.read("RANDOM/RANDOM.SCN")
    w.scn.data[:] = scn
    tt = scn[0x710:0x810]
    for i, t in enumerate(FS.parse_map(gd.read("RANDOM/RANDOM.MAP"))):
        g = tt[t & 0xFF]
        w.buf.set_grid(i % W, i // W, {1: 2, 9: 7}.get(g, g))
    return w


def _real_run(game, seed, monkeypatch, pathfinder=None):
    stubs = {("marsh", "spray"): M.spray}                     # R1's ovl08:0029
    res = lambda m, f, a, p: stubs.get((m, f), lambda w: None)      # R2: SCN as shipped
    monkeypatch.setattr(T, "resolve", res)
    monkeypatch.setattr(F, "resolve", res)
    w = _shipped_work(game, seed, pathfinder)
    pcts = list(R.roads(w)) + list(F.finish(w))
    return w, pcts


@pytest.mark.gamedata
def test_real_run_files_parse_and_hold_the_invariants(game, monkeypatch):
    w, pcts = _real_run(game, 11, monkeypatch)
    assert pcts[:3] == [81, 82, 83] and pcts[-4:] == [92, 94, 96, 98]
    assert tuple(w.files) == tuple(k for k, _ in K.FILES.value)
    scn = FS.parse_scn(w.files["SCN"])
    tiles = FS.parse_map(w.files["MAP"])
    rd = FS.parse_rd(w.files["RD"])
    sg = FS.parse_sgn(w.files["SGN"])
    assert scn["globals"] is not None and 41 <= len(sg) <= 70
    ports = [i for i, t in enumerate(tiles) if t & 0x8000]
    assert 1 <= len(ports) <= 10 and all(0x20 <= tiles[i] & 0xFF <= 0x25 for i in ports)
    left = [i for i, t in enumerate(tiles) if t & 0xFF == 0x85]
    assert left and all(tiles[i + 1] & 0xFF == 0x86 for i in left)
    assert not any(t & 0xFF in (0x84, 0x94) for t in tiles)
    assert all(tiles[s["y"] * W + s["x"]] & 0xFF == 0 for s in sg)
    assert all(r & 0x1F <= 0x11 for r in rd) and sum(1 for r in rd if r & 0x1F) > 100
    assert sum(1 for r in rd if r & 0x1F == 0x11) <= 20 and sum(1 for r in rd if r & 0x1F == 0x10) <= 20
    sites = [i for i in range(W * H) if w.buf.grid(i % W, i // W) == 0x0B]
    assert sites and not any(rd[i] & 0x1F for i in sites)
    pf = w.pathfinder
    assert (pf.side, pf.road_mode) == (0x0E, True) and len(pf.cost_map) == W * H
    assert any(s.valid and (s.mode, s.mask) == (1, 0) for s in pf.path_cache)


@pytest.mark.gamedata
def test_real_run_is_deterministic_and_carries_the_path_cache(game, monkeypatch):
    a, _ = _real_run(game, 5, monkeypatch)
    b, _ = _real_run(game, 5, monkeypatch)
    assert a.files == b.files and a.rng.calls == b.rng.calls
    assert [(s.valid, s.src, s.dst, s.codes) for s in a.pathfinder.path_cache] == \
        [(s.valid, s.src, s.dst, s.codes) for s in b.pathfinder.path_cache]
    c, _ = _real_run(game, 6, monkeypatch)
    assert c.files["MAP"] != a.files["MAP"]
    run = R.PathRun(path_cache=[PathSlot(**vars(s)) for s in a.pathfinder.path_cache])
    for s in run.path_cache:
        s.codes = list(s.codes)
    d, _ = _real_run(game, 5, monkeypatch, pathfinder=run)
    assert d.pathfinder is run                        # the run's cache is the one searched


# =========================================================================== the whole generator


def _generated_scenario(game, tmp_path, seed, sliders):
    from warlords2.formats.gamedir import GameDir
    gd = GameDir(game)
    run = RM.RandomRun(sliders=list(sliders))
    g = RM.finish(RM.random_begin(gd.read, Rng(seed), run))
    d = tmp_path / ("s%d_%s" % (seed, "".join(map(str, sliders)))) / "RANDOM"
    d.mkdir(parents=True)
    for ext, data in g.files.items():
        (d / ("RANDOM." + ext)).write_bytes(data)
    (d / "RANDOM.ITM").write_bytes(gd.read("RANDOM/RANDOM.ITM"))   # never written (static)
    return g, FS.load_scenario(GameDir(d.parent), "RANDOM")


@pytest.mark.gamedata
@pytest.mark.parametrize("seed, sliders", [(3, (3, 3, 2, 3)), (4, (0, 0, 0, 0)), (5, (6, 6, 6, 6))])
def test_generated_files_satisfy_the_scenario_checks(game, tmp_path, seed, sliders):
    """The generated RANDOM.* load with formats.scenario and pass the checks the shipped
    scenarios pass (tests/test_formats_scenario.py), in K.FILES order, ITM not written."""
    import importlib.util
    from pathlib import Path
    spec = importlib.util.spec_from_file_location(
        "fmt_checks", Path(__file__).resolve().parents[1] / "test_formats_scenario.py")
    chk = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(chk)
    g, sc = _generated_scenario(game, tmp_path, seed, sliders)
    assert tuple(g.files) == tuple(k for k, _ in K.FILES.value)
    one = {"RANDOM": sc}
    chk.test_text_files_consumed_exactly("RANDOM", one)
    chk.test_cities_match_map("RANDOM", one)
    chk.test_sites_signs_ports_match_map("RANDOM", one)
    chk.test_map_tiles_and_roads("RANDOM", one)
    chk.test_players_and_capitals("RANDOM", one)
    assert 41 <= len(sc["signs"]) <= 70 and len(sc["ports"]) <= 10
    pf = g.work.pathfinder
    assert (pf.side, pf.road_mode) == (0x0E, True)
