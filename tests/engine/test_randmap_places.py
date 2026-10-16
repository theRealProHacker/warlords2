"""M11 R2: the random map's places, rules/randmap/cities.py (ovl11) and sides.py (ovl10).

Per routine: scripted dice derived from the asm (every call's (dice, sides, add) in order, the
data-dependent loop counts) on hand-built grids and buffers, with the exact bytes the routine
writes.  Then the shipped RANDOM.CTY / .SPC / .SCN / .MAP as format oracles and structural
checks of real runs (game data).  Text formats and the army file are synthetic in the scripted
tests (`work.exe_text`, `work.army_file`); the real ones are read from the user's copy."""
import re
import struct

import pytest

from randmapkit import DiceMismatch, ScriptedRng, blank_work
from warlords2.rules import randmap as RM
from warlords2.rules.constants import Const
from warlords2.rules.constants import randmap as K
from warlords2.rules.randmap import cities as C
from warlords2.rules.randmap import sides as S
from warlords2.rules.rng import Rng

W, H = 0x70, 0x9C

# synthetic formats in the shapes of DS:02e0 .. 0381 (not the game's texts)
TEXT = {0x2E0: b"%s%s", 0x2E5: b"#%03d|%s|R|\n", 0x31F: b"%s T", 0x329: b"#%03d|%s|T|\n",
        0x361: b"#%03d|%s|%s|%s|%s|%s|%s|\n", 0x381: b""}


def army_file(over=None, n=29):
    """29 ARMYTYPE records: id t, strength 3, turns 1, cost 4, moves 10, flies / ally bytes 0,
    overridden per type by `over` {t: {field: value}}."""
    out = bytearray()
    for t in range(n):
        r = bytearray(0x3E)
        f = dict(strength=3, turns=1, cost=4, moves=10, flies=0, ally=0, id=t)
        f.update((over or {}).get(t, {}))
        struct.pack_into("<H", r, 0, f["id"])
        struct.pack_into("<hhhh", r, 0x16, f["strength"], f["turns"], f["cost"], f["moves"])
        r[0x36] = f["flies"]
        r[0x30] = f["ally"]
        out += r
    return bytes(out)


DIRS = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1)]   # RANDOM.DAT +0xbc


def mk(script, run=None, army=None, grid=None):
    w = blank_work(ScriptedRng(script), run=run)
    for k, (dx, dy) in enumerate(DIRS):
        w.buf.set_point(K.DIR8.value + 4 * k, dx, dy)
    w.exe_text.strings.update(TEXT)
    w.army_file = army_file(army)
    if grid is not None:
        fill(w, grid)
    return w


def fill(w, v):
    for x in range(W):
        for y in range(H):
            w.buf.set_grid(x, y, v)


def put(buf, off, slot, items):
    for i, s in enumerate(items):
        buf.set_cstr(off + slot * i, s)


def set_city(w, c, x, y, owner=15, slots=(0xFF, 0xFF, 0xFF, 0xFF)):
    r = 0x157D + 0x41 * c
    w.scn.set_word(r, x)
    w.scn.set_word(r + 2, y)
    w.scn.set_byte(r + 0x15, owner)
    for k, t in enumerate(slots):
        w.scn.set_byte(r + 0x16 + k, t)
    w.scn.set_word(0x157B, max(w.scn.word(0x157B), c + 1))


def rec(c):
    return 0x157D + 0x41 * c


def player(p):
    return 0x183 + 0x14 * p


def slot(w, c, k):
    """(id, turns, strength, moves, cost) bytes of slot k."""
    r = rec(c) + k
    return tuple(w.scn.byte(r + o) for o in (0x16, 0x1A, 0x1E, 0x22, 0x26))


def city_name(w, c):
    return w.scn.cstr(rec(c) + 4)


# --------------------------------------------------------------------------- 0331 place_city


def test_place_city_rejects_water_then_waits_for_shore():
    w = mk([(102, 5, 10), (146, 5, 10),          # square (11, 10) is water: invalid, not counted
            (102, 5, 20), (146, 5, 20),          # valid, no shore beside: near 1
            (102, 5, 30), (146, 5, 30)],         # shore (29, 30) beside (30, 30): placed
           grid=7)
    w.buf.set_grid(11, 10, 2)
    w.buf.set_grid(29, 30, 3)
    assert C.place_city(w) == (30, 30)
    w.rng.assert_done()
    assert w.scn.word(0x157B) == 1 and C.city_xy(w, 0) == (30, 30)
    assert [w.buf.grid(x, y) for x, y in ((30, 30), (31, 30), (30, 31), (31, 31))] == [10] * 4
    assert w.buf.grid(32, 30) == 7 and w.buf.grid(29, 30) == 3


@pytest.mark.parametrize("bad", [3, 2, 10, 6, 5])
def test_place_city_invalid_square_classes(bad):
    w = mk([(102, 5, 40), (146, 5, 40), (102, 5, 60), (146, 5, 60)], grid=7)
    w.buf.set_grid(41, 41, bad)                  # the city's fourth square (DS:02c4 / 02cc)
    w.buf.set_grid(59, 60, 3)
    assert C.place_city(w) == (60, 60)
    w.rng.assert_done()


def test_place_city_fifth_valid_candidate_needs_no_shore():
    w = mk([(102, 5, 10), (146, 5, 10), (102, 5, 20), (146, 5, 20), (102, 5, 30), (146, 5, 30),
            (102, 5, 50), (146, 5, 50),          # on a mountain: invalid, does not count
            (102, 5, 40), (146, 5, 40), (102, 5, 60), (146, 5, 60)], grid=7)
    w.buf.set_grid(50, 50, 6)
    assert C.place_city(w) == (60, 60)           # the 5th valid one
    w.rng.assert_done()


@pytest.mark.parametrize("off,taken", [((-2, -2), False), ((3, 3), False), ((4, 4), True),
                                       ((-3, -3), True), ((2, 0), False), ((3, 0), False),
                                       ((4, 0), True)])
def test_place_city_keeps_clear_of_other_cities(off, taken):
    # nb8(square, 10), nb8(square + (1, 1), 10) and nb8(square - (1, 1), 10): a city square at
    # (x - 2, y - 2) or (x + 3, y + 3) is caught only by the shifted tests.
    script = [(102, 5, 20), (146, 5, 20)]
    if not taken:
        script += [(102, 5, 70), (146, 5, 70)]
    w = mk(script, grid=7)
    w.buf.set_grid(20 + off[0], 20 + off[1], 10)
    w.buf.set_grid(19, 21, 3)
    w.buf.set_grid(69, 70, 3)
    assert C.place_city(w) == ((20, 20) if taken else (70, 70))
    w.rng.assert_done()


def test_place_city_without_a_square_hangs(monkeypatch):
    monkeypatch.setattr(K, "HANG_TRIES", Const(3, "test"))
    w = mk([(102, 5, 10), (146, 5, 10)] * 3, grid=2)
    with pytest.raises(RM.GeneratorHang) as e:
        C.place_city(w)
    assert e.value.site == "ovl11:0331"
    w.rng.assert_done()


# --------------------------------------------------------------------------- 0000 / 028c


def test_place_cities_counts_the_grid_cities_first_x_outer():
    w = mk([(102, 5, 80), (146, 5, 100)], grid=7)
    for x0, y0 in ((40, 5), (5, 40)):
        for dx in (0, 1):
            for dy in (0, 1):
                w.buf.set_grid(x0 + dx, y0 + dy, 10)
    w.buf.set_grid(79, 100, 3)
    w.buf.set_word(0x2A, 3)
    w.scn.set_word(0x157B, 9)                    # reset to 0 by 0000
    C.place_cities(w)
    w.rng.assert_done()
    assert w.buf.word(0xA84) == 2
    assert [C.city_xy(w, c) for c in range(w.scn.word(0x157B))] == [(5, 40), (40, 5), (80, 100)]


def test_existing_cities_flat_neighbours_alias_the_previous_row():
    w = mk([], grid=7)
    w.buf.set_grid(W - 1, 59, 10)                # the byte before (0, 60) in the flat grid
    w.buf.set_grid(0, 60, 10)
    w.buf.set_grid(7, 0, 10)                     # row -1 is RANDOM.DAT scratch (zeros)
    w.buf.set_word(0x2A, 0)
    C.place_cities(w)
    assert [C.city_xy(w, c) for c in range(w.scn.word(0x157B))] == [(7, 0), (W - 1, 59)]
    assert w.buf.word(0xA84) == 2


def test_place_cities_bound_is_signed_and_preset_counts():
    w = mk([], grid=7)
    w.buf.set_word(0xA84, 5)
    w.buf.set_word(0x2A, 5)
    C.place_cities(w)                            # 5 > 5 is false: no placement
    assert w.scn.word(0x157B) == 0 and w.buf.word(0xA84) == 5      # not reset by 0000


# --------------------------------------------------------------------------- 0a77 site_square


def test_site_square_rolls_the_rotor_once_and_draws_in_its_zone():
    run = RM.RandomRun()
    w = mk([(16, -1, 5), (20, 31, 40), (31, 42, 50)], run=run, grid=7)   # q 5: x 32.., y 43..
    assert C.site_square(w, 7) == (40, 50)
    assert run.rotor == 6
    w.rng.assert_done()


def test_site_square_rotor_wraps_without_a_roll():
    run = RM.RandomRun(rotor=15)                 # q 15: x from 88, y from 121
    w = mk([(20, 87, 100), (31, 120, 140)], run=run, grid=7)
    assert C.site_square(w, 7) == (100, 140)
    assert run.rotor == 0
    w.rng.assert_done()


@pytest.mark.parametrize("at,v", [((44, 50), 11), ((36, 50), 11), ((40, 54), 11), ((40, 46), 11),
                                  ((41, 51), 10), ((39, 49), 11), ((40, 50), 4)])
def test_site_square_phase_one_rejections(at, v):
    run = RM.RandomRun(rotor=5)
    w = mk([(20, 31, 40), (31, 42, 50), (20, 31, 34), (31, 42, 70)], run=run, grid=7)
    w.buf.set_grid(*at, v)
    assert C.site_square(w, 7) == (34, 70)
    w.rng.assert_done()


def test_site_square_phase_one_allows_eleven_four_away():
    run = RM.RandomRun(rotor=5)
    w = mk([(20, 31, 40), (31, 42, 50)], run=run, grid=7)
    w.buf.set_grid(45, 50, 11)
    w.buf.set_grid(40, 55, 11)
    assert C.site_square(w, 7) == (40, 50)


def test_site_square_phase_two_anywhere():
    run = RM.RandomRun(rotor=0)
    script = [(20, 3, 10), (31, 3, 10)] * 50 + [(102, 5, 8), (146, 5, 8), (102, 5, 60), (146, 5, 60)]
    w = mk(script, run=run, grid=2)
    w.buf.set_grid(60, 60, 7)
    w.buf.set_grid(8, 8, 7)
    w.buf.set_grid(9, 9, 11)                     # phase 2 tests only nb8 10 / 11 of the square
    assert C.site_square(w, 7) == (60, 60)
    w.rng.assert_done()


def test_site_square_phase_three_takes_the_last_pair():
    run = RM.RandomRun(rotor=0)
    script = ([(20, 3, 10), (31, 3, 10)] * 50 + [(102, 5, 6), (146, 5, 6)] * 50
              + [(102, 5, 70), (146, 5, 70)]                       # drawn and overwritten
              + [(102, 5, 30), (146, 5, 30)] * 49 + [(102, 5, 31), (146, 5, 32)])
    w = mk(script, run=run, grid=10)
    assert C.site_square(w, 7) == (31, 32)
    w.rng.assert_done()
    assert run.rotor == 1


def test_site_square_phase_three_accepts_any_class_but_city_and_site():
    run = RM.RandomRun(rotor=0)
    script = ([(20, 3, 10), (31, 3, 10)] * 50 + [(102, 5, 6), (146, 5, 6)] * 50
              + [(102, 5, 70), (146, 5, 70)] + [(102, 5, 30), (146, 5, 30), (102, 5, 33), (146, 5, 34)])
    w = mk(script, run=run, grid=11)
    w.buf.set_grid(33, 34, 2)
    assert C.site_square(w, 7) == (33, 34)
    w.rng.assert_done()


# --------------------------------------------------------------------------- 003a place_sites


def _site_buffer(w):
    w.buf.set_word(0xED2, 2)
    put(w.buf, 0xED4, 20, [b"T0<%s>", b"T1[%s]"])
    put(w.buf, 0xF38, 10, [b"a%d" % i for i in range(10)])
    put(w.buf, 0xF9C, 10, [b"b%d" % i for i in range(10)])
    put(w.buf, 0x1000, 10, [b"t%d" % i for i in range(10)])


def test_place_sites_all_forty():
    temples = {0, 17, 39}
    script, want, text, calls_at = [], [], b"", {}
    for s in range(40):
        q, j = s % 16, s // 16
        xlo, ylo = (q % 4) * 28 + 4, (q // 4) * 39 + 4
        x, y = xlo + 6 * j, ylo + 6 * j
        script += [(20, xlo - 1, x), (31, ylo - 1, y)]
        if s in temples:
            c = s % 10
            script.append((10, -1, c))
            name = b"t%d T" % c
            text += b"#%03d|%s|T|\n" % (s, name)
        else:
            n, a, b = s % 2, s % 10, (s * 3) % 10
            script += [(2, -1, n), (10, -1, a), (10, -1, b)]
            name = (b"T0<%s>", b"T1[%s]")[n] % (b"a%d" % b + b"b%d" % a)
            text += b"#%03d|%s|R|\n" % (s, name)
        want.append((x, y, name))
    w = mk(script, run=RM.RandomRun(rotor=0), grid=7)
    _site_buffer(w)
    w.buf.set_word(0x1066, 3)                    # appended after the text already there
    for s in range(40):
        w.scn.set_byte(0x811 + 0x1F * s + 0x18, 1 if s in temples else 2)
    yields = []
    for pct in C.place_sites(w):
        yields.append((pct, len(w.rng.calls)))
    w.rng.assert_done()
    # the bar moves before site 4, 8, ...: by then 4 * k sites' dice are made
    per_site = [2 + (1 if s in temples else 3) for s in range(40)]
    assert yields == [(70 + k, sum(per_site[:4 * k])) for k in range(1, 10)]
    assert w.scn.word(0x80F) == 40 and w.run.rotor == 40 % 16
    for s, (x, y, name) in enumerate(want):
        r = 0x811 + 0x1F * s
        assert (w.scn.word(r), w.scn.word(r + 2), w.scn.cstr(r + 4)) == (x, y, name)
        assert w.buf.grid(x, y) == 11
    assert w.buf.word(0x1066) == 3 + len(text)
    assert bytes(w.buf.data[0x3E96 + 3:0x3E96 + 3 + len(text) + 1]) == text + b"\0"


def test_place_sites_pipeline_entry_is_a_generator():
    call = dict((f.addr, f) for _, fs in RM.PIPELINE for f in fs if hasattr(f, "addr"))["ovl11:003a"]
    w = mk([], run=RM.RandomRun(rotor=0), grid=7)
    r = call(w)
    assert hasattr(r, "__next__")


# --------------------------------------------------------------------------- 05e3


def test_rebuild_city_table_row_major_from_map_low_bytes():
    w = mk([(3, 2, 3), (3, 2, 5), (3, 2, 4)])
    w.map.set_at(5, 9, 0x60)
    w.map.set_at(100, 2, 0x1260)                 # high byte ignored
    w.map.set_at(3, 2, 0x60)
    w.map.set_at(4, 2, 0x61)
    w.scn.set_word(0x157B, 50)
    C.city_table(w)
    w.rng.assert_done()
    assert w.scn.word(0x157B) == 3
    assert [C.city_xy(w, c) for c in range(3)] == [(3, 2), (100, 2), (5, 9)]
    assert [(w.scn.byte(rec(c) + 0x15), w.scn.byte(rec(c) + 0x14)) for c in range(3)] == [(15, 3), (15, 5), (15, 4)]


# --------------------------------------------------------------------------- 08f0 / 044a / 09b3


def test_quadrant_city_bounds():
    # quadrant 5: x 28..55, y 78..155
    w = mk([(4, -1, 0), (4, -1, 1), (4, -1, 2), (4, -1, 3)])
    for c, xy in enumerate([(56, 78), (55, 77), (27, 78), (28, 78)]):
        set_city(w, c, *xy)
    assert C.quadrant_city(w, 5) == 3
    w.rng.assert_done()
    w = mk([(4, -1, 0)])
    for c, xy in enumerate([(55, 155), (0, 0), (0, 0), (0, 0)]):
        set_city(w, c, *xy)
    assert C.quadrant_city(w, 5) == 0
    w.rng.assert_done()


def test_quadrant_city_gives_up_after_202_draws():
    w = mk([(1, -1, 0)] * 202)
    set_city(w, 0, 100, 100)
    assert C.quadrant_city(w, 0) == 0
    w.rng.assert_done()


def test_city_at_matches_the_square_and_its_upper_left():
    w = mk([])
    set_city(w, 0, 10, 10)
    set_city(w, 1, 20, 20)
    assert C.city_at(w, 11, 11) == 0 and C.city_at(w, 10, 11) == 0
    assert C.city_at(w, 12, 10) == -1 and C.city_at(w, 9, 10) == -1
    assert C.city_at(w, 21, 20) == 1


@pytest.mark.parametrize("p,base", [(0, 0x62), (5, 0x6C), (6, 0x80), (7, 0x82)])
def test_paint_capital_tiles(p, base):
    w = mk([])
    set_city(w, 0, 30, 40)
    for x, y in ((30, 40), (31, 40), (30, 41), (31, 41)):
        w.map.set_at(x, y, 0x5A00 | 0x60)
    C.paint_capital(w, 0, p)
    assert [w.map.at(x, y) for x, y in ((30, 40), (31, 40), (30, 41), (31, 41))] == \
        [0x5A00 | base, 0x5A00 | base + 1, 0x5A00 | base + 0x10, 0x5A00 | base + 0x11]


# --------------------------------------------------------------------------- 0689 choose_capitals

QUAD_CITIES = [(14 + 28 * (k % 4), 14 + 78 * (k // 4)) for k in range(8)] + [(50, 40)]


def test_choose_capitals_ten_passes():
    s = []
    # pass 1: quadrant 0 taken at once; p1's first quadrant roll hits the used 0; then 99 misses
    # and a fit on the 100th try - still a restart (n >= 100)
    s += [(8, -1, 0), (9, -1, 0), (8, -1, 0), (8, -1, 1)] + [(9, -1, 1)] * 99 + [(9, -1, 8)]
    for _ in range(8):                           # passes 2..9: p1 misses 100 times
        s += [(8, -1, 0), (9, -1, 0), (8, -1, 1)] + [(9, -1, 1)] * 100
    # pass 10: p0 -> quadrant 1 (42, 14) at once; every later side misses 100 times and keeps
    # the last city tried
    s += [(8, -1, 1), (9, -1, 1)]
    order = [1, 0, 2, 3, 4, 5, 6, 7]
    for p in range(1, 8):
        s += [(8, -1, order[p])] + [(9, -1, order[p])] * 100
    w = mk(s)
    for c, xy in enumerate(QUAD_CITIES):
        set_city(w, c, *xy)
    for p in range(8):
        w.buf.set_word(0x1D62 + 2 * p, 11 + p)
    C.choose_capitals(w)
    w.rng.assert_done()
    caps = [(w.scn.word(player(p) + 6), w.scn.word(player(p) + 8)) for p in range(8)]
    assert caps == [QUAD_CITIES[k] for k in order]
    assert [w.buf.word(0x1D72 + 2 * k) for k in range(8)] == [12, 11, 13, 14, 15, 16, 17, 18]
    assert [w.scn.byte(rec(c) + 0x15) for c in range(9)] == [1, 0, 2, 3, 4, 5, 6, 7, 15]
    assert w.map.lo(14, 14) == 0x64 and w.map.lo(15, 15) == 0x75     # city 0 owned by side 1
    assert w.map.lo(98, 92) == 0x82                                   # side 7


def test_choose_capitals_found_early_in_last_pass_counts_one_try():
    s = [(8, -1, 0), (9, -1, 0), (8, -1, 1)] + [(9, -1, 1)] * 100
    s *= 9
    s += [(8, -1, 0), (9, -1, 0), (8, -1, 1), (9, -1, 8)]       # (50, 40) fits p1 at once
    for k in range(2, 8):
        s += [(8, -1, k)] + [(9, -1, k)] * 100
    w = mk(s)
    for c, xy in enumerate(QUAD_CITIES):
        set_city(w, c, *xy)
    C.choose_capitals(w)
    w.rng.assert_done()
    assert (w.scn.word(player(1) + 6), w.scn.word(player(1) + 8)) == (50, 40)
    assert w.scn.byte(rec(8) + 0x15) == 1 and w.scn.byte(rec(1) + 0x15) == 15


def _cities(w, pts):
    for c, xy in enumerate(pts):
        set_city(w, c, *xy)


def test_choose_capitals_twenty_apart_on_both_axes_fits():
    # p1's city (34, 34) is exactly 20 from p0's (14, 14) on both axes: taken at once, so the
    # next die is p2's quadrant roll (the script ends there)
    w = mk([(8, -1, 0), (9, -1, 0), (8, -1, 1), (9, -1, 8)])
    _cities(w, QUAD_CITIES[:8] + [(34, 34)])
    with pytest.raises(DiceMismatch, match=r"call 4: rnd\(1, 8, -1\) after"):
        C.choose_capitals(w)


def test_choose_capitals_y_bound_144():
    # quadrant 4's only city lies at y 145: rejected 100 times, then the pass restarts
    w = mk([(8, -1, 4)] + [(9, -1, 4)] * 100 + [(8, -1, 0)])
    _cities(w, QUAD_CITIES[:4] + [(14, 145)] + QUAD_CITIES[5:])
    with pytest.raises(DiceMismatch, match=r"call 102: rnd\(1, 9, -1\) after"):
        C.choose_capitals(w)
    assert [w.scn.word(player(p) + 6) for p in range(8)] == [-100] * 8      # reset by the restart


# --------------------------------------------------------------------------- 0ce0 flags, 1104


def test_terrain_flags():
    w = mk([], grid=7)
    set_city(w, 0, 50, 50)
    for x, y in ((50, 50), (51, 50), (50, 51), (51, 51)):
        w.buf.set_grid(x, y, 10)
    w.buf.set_grid(49, 50, 3)       # beside (50, 50)
    w.buf.set_grid(52, 52, 4)       # beside (51, 51) only
    w.buf.set_grid(51, 49, 0)
    w.buf.set_grid(53, 53, 8)       # two away: not beside
    w.buf.set_grid(53, 50, 5)
    w.buf.set_grid(48, 51, 5)
    w.buf.set_grid(50, 53, 5)
    assert C.terrain_flags(w, 0) == C.Flags(1, 1, 1, 0, 0)
    w.buf.set_grid(52, 49, 5)       # beside (51, 50)
    w.buf.set_grid(49, 52, 8)       # beside (50, 51)
    assert C.terrain_flags(w, 0) == C.Flags(1, 1, 1, 1, 1)


@pytest.mark.parametrize("flags,d,q", [(C.Flags(n3=1), 3, 7), (C.Flags(n3=1, n0=1), 3, 9),
                                       (C.Flags(n3=1, n0=1, n4=1), 3, 8),
                                       (C.Flags(n4=1, n8=1), 2, 0), (C.Flags(n0=1, n8=1), 1, 1),
                                       (C.Flags(), 0, 0)])
def test_city_quality(flags, d, q):
    w = mk([(4, -1, d)])
    set_city(w, 0, 10, 10)
    assert C.city_quality(w, 0, flags) == q
    w.rng.assert_done()


def test_city_quality_owned_city_is_nine_without_a_die():
    w = mk([])
    set_city(w, 0, 10, 10, owner=3)
    assert C.city_quality(w, 0, C.Flags(n8=1)) == 9


# --------------------------------------------------------------------------- 1468 city_name


def _name_tables(buf):
    for off, n, tag in ((0xA86, 20, b"A"), (0xB4E, 20, b"B"), (0xC16, 20, b"G"), (0xDA6, 10, b"M"),
                        (0xCDE, 10, b"F"), (0xD42, 10, b"W"), (0xE0A, 10, b"H"), (0xE6E, 10, b"N")):
        put(buf, off, 10, [tag + b"%d" % i for i in range(n)])


@pytest.mark.parametrize("flags,script,name", [
    (C.Flags(n8=1, n4=1), [(10, 0, 6), (20, -1, 4), (20, -1, 7), (10, 0, 6), (10, -1, 2)], b"A4B7M2"),
    (C.Flags(n8=1), [(10, 0, 7), (20, -1, 0), (10, 0, 9), (20, -1, 19)], b"A0G19"),
    (C.Flags(), [(10, 0, 1), (20, -1, 1), (20, -1, 2), (10, 0, 1), (10, 0, 4), (10, -1, 9)], b"A1B2N9"),
    (C.Flags(), [(10, 0, 7), (20, -1, 1), (10, 0, 6), (10, 0, 5), (20, -1, 3)], b"A1G3"),
    (C.Flags(n4=1, n3=1, n5=1), [(10, 0, 7), (20, -1, 1), (10, 0, 1), (10, -1, 5)], b"A1F5"),
    (C.Flags(n3=1, n5=1, n0=1), [(10, 0, 7), (20, -1, 1), (10, 0, 1), (10, -1, 5)], b"A1W5"),
    (C.Flags(n5=1), [(10, 0, 7), (20, -1, 1), (10, 0, 1), (10, -1, 5)], b"A1H5"),
])
def test_city_name(flags, script, name):
    w = mk(script)
    _name_tables(w.buf)
    set_city(w, 2, 10, 10)
    assert C.city_name(w, 2, flags) == name
    assert city_name(w, 2) == name
    w.rng.assert_done()


# --------------------------------------------------------------------------- 1171 city_text


def _text_tables(buf):
    _name_tables(buf)
    for a in range(10):
        for m in range(3):
            buf.set_cstr(0x1068 + 0x30 * a + 16 * m, b"D%d%d" % (a, m))
    put(buf, 0x1248, 16, [b"E%d" % i for i in range(10)])
    for tables, tag in (((0x12E8, 0x1388, 0x1428), b"P"), ((0x16A8, 0x1748, 0x17E8), b"L"),
                        ((0x14C8, 0x1568, 0x1608), b"Q")):
        for j, off in enumerate(tables):
            put(buf, off, 16, [tag + b"%d%d" % (j, i) for i in range(10)])


NAME2 = [(10, 0, 7), (20, -1, 0), (10, 0, 7), (20, -1, 0)]       # "A0G0"


@pytest.mark.parametrize("q,flags,script,parts,income", [
    # forest beside, first 100-roll < 80: k = rnd(1, 4, -1), set A
    (5, C.Flags(n4=1), [(8, 0, 3), (3, 3, 6), (3, 3, 4), (100, 0, 79), (4, -1, 2), (10, -1, 1),
                        (10, -1, 9), (3, -1, 2)], (b"D62", b"E4", b"P01", b"P19", b"P22"), 27),
    # marsh: k = rnd(1, 2, 7)
    (4, C.Flags(n8=1, n5=1), [(8, 0, 1), (3, 2, 3), (3, 2, 5), (100, 0, 1), (2, 7, 9), (10, -1, 0),
                              (10, -1, 0), (3, -1, 0)], (b"D30", b"E5", b"P00", b"P10", b"P29"), 23),
    # hills: k = rnd(1, 4, 3)
    (4, C.Flags(n5=1), [(8, 0, 1), (3, 2, 3), (3, 2, 5), (100, 0, 1), (4, 3, 7), (10, -1, 0),
                        (10, -1, 0), (3, -1, 1)], (b"D31", b"E5", b"P00", b"P10", b"P27"), 23),
    # a flag but the first roll >= 80: a second 100-roll, < 50 -> set C
    (5, C.Flags(n4=1), [(8, 0, 3), (3, 3, 6), (3, 3, 4), (100, 0, 80), (100, 0, 49), (10, -1, 1),
                        (10, -1, 2), (10, -1, 3), (3, -1, 0)], (b"D60", b"E4", b"L01", b"L12", b"L23"), 27),
    # no flag (shore does not count here): one 100-roll, >= 50 -> set B; a, b clamped to 0
    (0, C.Flags(n3=1, n0=1), [(8, 0, 8), (3, -2, -1), (3, -2, 0), (100, 0, 50), (10, -1, 7),
                              (10, -1, 8), (10, -1, 9), (3, -1, 2)], (b"D02", b"E0", b"Q07", b"Q18", b"Q29"), 22),
    # q 9: rnd(1, 3, 7) up to 10 clamped to 9
    (9, C.Flags(), [(8, 0, 1), (3, 7, 10), (3, 7, 8), (100, 0, 99), (10, -1, 0), (10, -1, 0),
                    (10, -1, 0), (3, -1, 2)], (b"D92", b"E8", b"Q00", b"Q10", b"Q20"), 33),
])
def test_city_text(q, flags, script, parts, income):
    w = mk(NAME2 + script)
    _text_tables(w.buf)
    set_city(w, 3, 10, 10)
    w.buf.set_word(0x1064, 5)
    txt = C.city_text(w, 3, q, flags)
    w.rng.assert_done()
    want = b"#003|A0G0|%s|%s|%s|%s|%s|\n" % parts
    assert txt == want
    assert w.scn.word(rec(3) + 0x2A) == income
    assert w.buf.word(0x1064) == 5 + len(want)
    assert bytes(w.buf.data[0x1F56 + 5:0x1F56 + 5 + len(want) + 1]) == want + b"\0"


# --------------------------------------------------------------------------- 161d production


def _entries(buf, rows):
    """rows: (id, chance, region, kind) for entries 0..; the rest id 0, chance 0."""
    for i in range(29):
        r = rows[i] if i < len(rows) else (0, 0, 0, 0)
        for k, v in enumerate(r):
            buf.set_word(0x1D82 + 16 * i + 2 * k, v)
        for k in range(4, 8):
            buf.set_word(0x1D82 + 16 * i + 2 * k, 99)        # replaced from the army file


ARMY = {3: dict(strength=4, turns=2, cost=7, moves=12), 10: dict(strength=6, turns=3, cost=9, moves=14),
        20: dict(ally=1), 22: dict(ally=1), 8: dict(flies=1, strength=5, turns=4, cost=11, moves=16),
        9: dict(flies=1), 25: dict(flies=1, ally=1)}


def test_production_first_loop():
    rows = [(20, 10, 0, 7),     # ally type, allies off: skipped without a die
            (3, 5, 0, 7),       # 4 < 5, kind 7: slot 0
            (5, 10, 0, 7),      # type 5 without shore: never
            (7, 3, 2, 1),       # 3 >= 3: no
            (8, 10, 9, 1),      # wrong region, kind 1: no
            (9, 10, 0, 3),      # kind 3 needs shore: no
            (10, 10, 2, 1)]     # region == word +0x1d72 [quadrant]: slot 1, n == ns
    w = mk([(4, -1, 1), (10, -1, 4), (10, -1, 0), (10, -1, 3), (10, -1, 0), (10, -1, 0), (10, -1, 9)],
           army=ARMY)
    _entries(w.buf, rows)
    set_city(w, 0, 60, 100, slots=(1, 2, 3, 4))      # quadrant 60 * 4 / 112 + (200 / 156) * 4 = 6
    w.buf.set_word(0x1D72 + 2 * 6, 2)
    assert C.production(w, 0, 2, C.Flags()) == 2      # ns = 1 + 2 / 2
    w.rng.assert_done()
    assert slot(w, 0, 0) == (3, 2, 4, 12, 7)
    assert slot(w, 0, 1) == (10, 3, 6, 14, 9)
    assert [slot(w, 0, k)[0] for k in (2, 3)] == [0xFF, 0xFF]
    e1 = 0x1D82 + 16
    assert [w.buf.word(e1 + o) for o in (8, 0xA, 0xC, 0xE)] == [4, 2, 7, 12]   # 142c wrote them


@pytest.mark.parametrize("flags,kind,taken", [(C.Flags(n4=1), 4, True), (C.Flags(), 4, False),
                                              (C.Flags(n5=1), 5, True), (C.Flags(n3=1), 3, True),
                                              (C.Flags(n0=1), 3, False)])
def test_production_kinds(flags, kind, taken):
    ns_die = 0 if flags.n4 or flags.n5 else 1         # ns = 1 either way (q = 0)
    script = [(4, -1, ns_die), (10, -1, 0)]
    if not taken:
        script += [(10, -1, 9)] * 28                   # the others: chance 0, every die fails
    w = mk(script, army=ARMY)
    _entries(w.buf, [(3, 10, 7, kind)])
    set_city(w, 0, 10, 10)
    C.production(w, 0, 0, flags)
    w.rng.assert_done()
    assert slot(w, 0, 0)[0] == 3                       # taken, or the entry-0 fallback


def test_production_type_five_needs_shore():
    w = mk([(4, -1, 0), (10, -1, 0)], army=ARMY)
    _entries(w.buf, [(5, 10, 0, 7)])
    set_city(w, 0, 10, 10)
    assert C.production(w, 0, 2, C.Flags(n3=1)) == 1   # ns = 0 + 1


def test_production_zero_slots_falls_back_to_entry_zero():
    w = mk([(4, -1, 0)], army=ARMY)
    _entries(w.buf, [(3, 10, 0, 7)])
    set_city(w, 0, 10, 10, slots=(1, 1, 1, 1))
    assert C.production(w, 0, 1, C.Flags()) == 1       # ns = 0: no entry rolls
    w.rng.assert_done()
    assert slot(w, 0, 0) == (3, 2, 4, 12, 7)
    assert [slot(w, 0, k)[0] for k in (1, 2, 3)] == [0xFF] * 3


def test_production_type_not_in_the_army_file_keeps_the_entry_words():
    # ovl44:142c writes the entry's strength / turns / cost / moves only on a match
    # (1437..14a4): type 3 missing from the file keeps the buffer's 99s, type 10 is rewritten
    w = mk([(4, -1, 1), (10, -1, 0)], army={**ARMY, 3: dict(id=99)})
    _entries(w.buf, [(3, 10, 0, 7), (10, 0, 0, 7)])
    set_city(w, 0, 10, 10)
    assert C.production(w, 0, 0, C.Flags()) == 1       # ns = 1 + 0 / 2
    w.rng.assert_done()
    e0, e1 = 0x1D82, 0x1D82 + 16
    assert [w.buf.word(e0 + o) for o in (8, 0xA, 0xC, 0xE)] == [99] * 4
    assert [w.buf.word(e1 + o) for o in (8, 0xA, 0xC, 0xE)] == [6, 3, 9, 14]
    assert slot(w, 0, 0) == (3, 99, 99, 99, 99)


def test_production_allies_on_rolls_for_ally_types():
    w = mk([(4, -1, 0), (10, -1, 0)], run=RM.RandomRun(allies=1), army=ARMY)
    _entries(w.buf, [(20, 10, 0, 7)])
    set_city(w, 0, 10, 10)
    assert C.production(w, 0, 2, C.Flags()) == 1
    assert slot(w, 0, 0)[0] == 20


def _flier_case(slot0_type, flier_roll):
    rows = [(slot0_type, 10, 0, 7)] + [(25, 0, 0, 7), (9, 0, 5, 1), (8, 0, 0, 4)]
    # entry 1 (type 25) is an ally type: skipped without a die, so 27 failing dice follow
    script = [(4, -1, 0), (10, -1, 0)] + [(10, -1, 0)] * 27 + [(10, -1, flier_roll)]
    w = mk(script, army=ARMY)
    _entries(w.buf, rows)
    set_city(w, 0, 10, 10)
    n = C.production(w, 0, 8, C.Flags(n4=1))           # ns = 0 + 4 + 1 -> 4
    w.rng.assert_done()
    return w, n


def test_production_adds_one_flier():
    # 25 flies but is an ally type; 9 flies, wrong region, kind 1; 8 flies, kind 4 + forest
    w, n = _flier_case(3, 4)
    assert n == 2 and slot(w, 0, 1) == (8, 4, 5, 16, 11)
    assert [slot(w, 0, k)[0] for k in (2, 3)] == [0xFF, 0xFF]


def test_production_no_flier_when_one_sits_or_roll_fails():
    w, n = _flier_case(9, 4)
    assert n == 1 and slot(w, 0, 1)[0] == 0xFF
    w, n = _flier_case(3, 5)
    assert n == 1


# --------------------------------------------------------------------------- 1b3f / ovl47:1a9b


def test_allies_skip_full_cities_and_fill_the_next_slot():
    w = mk([(2, 3, 0, 2), (3, -1, 0), (3, -1, 1), (3, -1, 1), (3, -1, 1), (3, -1, 0)], army=ARMY)
    set_city(w, 0, 10, 10, slots=(1, 2, 3, 4))
    set_city(w, 1, 20, 20, slots=(1, 0xFF, 0xFF, 0xFF))
    set_city(w, 2, 30, 30)
    C.allies(w)
    w.rng.assert_done()
    assert slot(w, 1, 1) == (22, 1, 3, 10, 4) and slot(w, 1, 2) == (20, 1, 3, 10, 4)


def test_allies_three_used_slots_take_the_fourth():
    w = mk([(2, 3, 0, 2), (1, -1, 0), (3, -1, 2)] + [(1, -1, 0)] * 99, army=ARMY)
    set_city(w, 0, 10, 10, slots=(1, 2, 3, 0xFF))
    C.allies(w)
    w.rng.assert_done()
    assert slot(w, 0, 3)[0] == 25


def test_allies_hundred_tries():
    w = mk([(2, 3, 0, 6)] + [(1, -1, 0)] * 100, army=ARMY)
    set_city(w, 0, 10, 10, slots=(1, 2, 3, 4))
    C.allies(w)
    w.rng.assert_done()


def test_random_ally_scans_types_0_to_27():
    t = C.ArmyTable(army_file({28: dict(ally=1)}))
    rng = ScriptedRng([(0, -1, -1)])                  # n = 0: rnd(1, 0, -1) returns -1 undrawn
    assert t.random_ally(rng) == 0x19
    t = C.ArmyTable(army_file({4: dict(ally=1), 27: dict(ally=1)}))
    assert t.random_ally(ScriptedRng([(2, -1, 1)])) == 27


def test_army_table_flags_of_a_missing_type_repeat_the_previous_record():
    data = bytearray(army_file({6: dict(ally=1, flies=1)}))
    struct.pack_into("<H", data, 7 * 0x3E, 99)        # no record with id 7
    t = C.ArmyTable(bytes(data))
    assert (t.is_ally(7), t.is_flier(7)) == (1, 1) and t.is_ally(8) == 0


# --------------------------------------------------------------------------- 1c1d capital_units


def _capital_work(script, slots, army=None):
    w = mk(script, army=army or ARMY)
    set_city(w, 0, 40, 40, owner=0, slots=slots)
    for p in range(8):
        w.scn.set_word(player(p) + 6, 40 if p == 0 else -100)
        w.scn.set_word(player(p) + 8, 40 if p == 0 else -100)
    return w


def test_capital_units():
    army = dict(ARMY)
    army[4] = dict(strength=2)
    army[6] = dict(strength=6)
    w = _capital_work([(28, -1, 5), (28, -1, 20), (28, -1, 3), (28, -1, 4), (28, -1, 6)],
                      (3, 0xFF, 7, 0xFF), army)
    C.capital_units(w)
    w.rng.assert_done()
    assert [slot(w, 0, k)[0] for k in range(4)] == [3, 0xFF, 7, 6]
    assert slot(w, 0, 3)[1:] == (0, 0, 0, 0)          # only the id byte


@pytest.mark.parametrize("slots,s", [((1, 2, 3, 0), 3), ((0xFF, 1, 2, 3), 0), ((0xFF, 0xFF, 1, 2), 1)])
def test_capital_units_slot_choice(slots, s):
    w = _capital_work([(28, -1, 6)], slots, {6: dict(strength=6)})
    C.capital_units(w)
    assert slot(w, 0, s)[0] == 6


def test_capital_units_type_five_is_not_counted():
    w = _capital_work([(28, -1, 5)] + [(28, -1, 1)] * 38 + [(28, -1, 6)], (0xFF,) * 4, {6: dict(strength=6)})
    C.capital_units(w)
    w.rng.assert_done()
    assert slot(w, 0, 3)[0] == 6


def test_capital_units_strong_type_on_the_40th_count_is_dropped():
    w = _capital_work([(28, -1, 1)] * 39 + [(28, -1, 6)], (0xFF,) * 4, {6: dict(strength=6)})
    C.capital_units(w)
    w.rng.assert_done()
    assert slot(w, 0, 3)[0] == 0xFF
    w = _capital_work([(28, -1, 1)] * 38 + [(28, -1, 6)], (0xFF,) * 4, {6: dict(strength=6)})
    C.capital_units(w)
    assert slot(w, 0, 3)[0] == 6


# --------------------------------------------------------------------------- 0ce0 order


def test_city_details_order(monkeypatch):
    log = []
    w = mk([])
    set_city(w, 0, 10, 10)
    set_city(w, 1, 20, 20)
    monkeypatch.setattr(C, "terrain_flags", lambda w, c: log.append(("flags", c)) or C.Flags())
    monkeypatch.setattr(C, "city_quality", lambda w, c, f: log.append(("q", c)) or 4)
    monkeypatch.setattr(C, "city_text", lambda w, c, q, f: log.append(("text", c, q)))
    monkeypatch.setattr(C, "production", lambda w, c, q, f: log.append(("prod", c, q)))
    monkeypatch.setattr(C, "allies", lambda w: log.append("allies"))
    monkeypatch.setattr(C, "capital_units", lambda w: log.append("units"))
    C.city_details(w)
    per = lambda c: [("flags", c), ("q", c), ("text", c, 4), ("prod", c, 4)]
    assert log == per(0) + per(1) + ["units"]
    log.clear()
    w.run.allies = 1
    C.city_details(w)
    assert log == per(0) + per(1) + ["allies", "units"]


# --------------------------------------------------------------------------- ovl10


def test_side_names_and_gold():
    w = mk([(5, -1, k) for k in (3, 4, 1, 0, 2, 0, 3, 0)] + [(3, 50, 20, 23 + p) for p in range(8)])
    for p in range(8):
        for k in range(5):
            w.buf.set_cstr(0x764 + 0x64 * p + 0x14 * k, b"S%d%d" % (p, k))
    S.side_names(w)
    S.starting_gold(w)
    w.rng.assert_done()
    assert [w.scn.cstr(0x14 * p) for p in range(8)] == [b"S%d%d" % (p, k) for p, k in
                                                       enumerate((3, 4, 1, 0, 2, 0, 3, 0))]
    assert [w.scn.word(0x185 + 0x14 * p) for p in range(8)] == [23 + p for p in range(8)]


def test_side_setup_runs_the_capitals_first(monkeypatch):
    w = mk([(5, -1, 0)] * 8 + [(3, 50, 20, 70)] * 8)
    seen = []
    monkeypatch.setattr(C, "choose_capitals", lambda w: seen.append(len(w.rng.calls)))
    S.sides(w)
    assert seen == [0]
    w.rng.assert_done()


def test_sprintf_conversions():
    assert RM.sprintf(b"#%03d|%s|%%", 7, b"ab") == b"#007|ab|%"
    assert RM.sprintf(b"%-4s.%5d", b"x", -3) == b"x   .   -3"
    assert RM.sprintf(b"%d|%u|%d", 0xFFFF, -1, 0x18000) == b"-1|65535|-32768"   # 16-bit ints
    assert RM.sprintf(b"%ld|%lu|%.2s", 70000, -1, b"abc") == b"70000|4294967295|ab"


# --------------------------------------------------------------------------- game data


def _gd(game):
    from warlords2.formats.gamedir import GameDir
    return GameDir(game)


def _real_work(game, seed=1, run=None, source="python"):
    gd = _gd(game)
    w = RM.Work(RM.load_buffer(gd.read), Rng(seed, source), run or RM.RandomRun(), gd.read)
    w.scn.data[:] = gd.read("ERYTHEA/ERYTHEA.SCN")
    return w


@pytest.mark.gamedata
def test_ds_tables_and_formats_are_the_exe_image(game):
    from warlords2.assets.exe import ds_str, ds_words
    from warlords2.formats.gamedir import EXE_NAME
    exe = _gd(game).read(EXE_NAME)
    assert ds_words(exe, 0x02C4, 4) == K.CITY_DX.value
    assert ds_words(exe, 0x02CC, 4) == K.CITY_DY.value
    w = _real_work(game)
    for c in K.TEXT_DS:
        assert C._text(w, c) == ds_str(exe, c.value).encode("cp437")
    assert C._text(w, K.FMT_RUIN_BASE) == b"%s%s" and C._text(w, K.EMPTY) == b""
    for c in (K.FMT_RUIN_TEXT, K.FMT_TEMPLE_TEXT):
        assert re.findall(rb"%\d*[ds]", C._text(w, c)) == [b"%03d", b"%s"]
    assert re.findall(rb"%\d*[ds]", C._text(w, K.FMT_CITY_TEXT)) == [b"%03d"] + [b"%s"] * 6


@pytest.mark.gamedata
def test_army_file_choice_is_harmless(game):
    gd = _gd(game)
    a, b = gd.read("TERRAIN0/ARMYTYPE.DAT"), gd.read("TERRAIN0/ARMYTYP2.DAT")
    for i in range(29):
        ra, rb = a[i * 0x3E:(i + 1) * 0x3E], b[i * 0x3E:(i + 1) * 0x3E]
        assert ra[:2] == rb[:2] and ra[0x16:] == rb[0x16:]     # only the names differ
    w = _real_work(game)
    assert C.army_table(w).data == a and w.army_file == a
    w = _real_work(game)
    w.army_set = 1                                     # DS:26c4, the `s` switch
    assert C.army_table(w).data == b


def _tables(buf, off, slot, n):
    return [buf.cstr(off + slot * i) for i in range(n)]


def _alt(items):
    return b"(?:" + b"|".join(re.escape(s) for s in sorted(set(items), key=len, reverse=True)) + b")"


def _line_regex(fmt, args):
    """The format with %03d -> (\\d{3}) and each %s -> the alternation of its candidates."""
    out, it = b"", iter(args)
    for part in re.split(rb"(%03d|%s)", fmt):
        if part == b"%03d":
            out += rb"(\d{3})"
        elif part == b"%s":
            out += b"(" + _alt(next(it)) + b")"
        else:
            out += re.escape(part)
    return re.compile(out)


@pytest.mark.gamedata
def test_shipped_random_cty_lines_have_the_format(game):
    """A format check of the shipped RANDOM.CTY, line by line: DS:0361 with the city's index
    and name, any word1 / word2 entry and any one of the three phrase sets.  It does not tie
    a / b to the city's quality, the set to the terrain flags or k to its range, and pins no
    dice (the seed of the shipped file is unknown); the dice order is pinned by the scripted
    tests above."""
    from warlords2.formats.scenario import parse_scn
    gd = _gd(game)
    w = _real_work(game)
    buf = w.buf
    scn = parse_scn(gd.read("RANDOM/RANDOM.SCN"))
    word1 = [buf.cstr(0x1068 + 0x30 * a + 16 * m) for a in range(10) for m in range(3)]
    word2 = _tables(buf, 0x1248, 16, 10)
    sets = [[_tables(buf, o, 16, 10) for o in offs] for offs in
            (K.PHRASES_FLAG.value, K.PHRASES_LOW.value, K.PHRASES_HIGH.value)]
    lines = gd.read("RANDOM/RANDOM.CTY").split(b"\n")
    lines = [ln + b"\n" for ln in lines if ln]
    assert len(lines) == scn["city_count"] == 80
    fmt = C._text(w, K.FMT_CITY_TEXT)
    for c, line in enumerate(lines):
        name = scn["cities"][c]["name"].encode("cp437")
        ok = [_line_regex(fmt, [[name], word1, word2, *s]).fullmatch(line) for s in sets]
        assert any(m and int(m.group(1)) == c for m in ok), line


@pytest.mark.gamedata
def test_shipped_random_names_come_from_the_tables(game):
    from warlords2.formats.scenario import parse_scn
    gd = _gd(game)
    w = _real_work(game)
    buf = w.buf
    scn = parse_scn(gd.read("RANDOM/RANDOM.SCN"))
    first = _tables(buf, 0xA86, 10, 20)
    second = [b""] + _tables(buf, 0xB4E, 10, 20)
    sufs = _tables(buf, 0xC16, 10, 20) + [s for o in (0xDA6, 0xCDE, 0xD42, 0xE0A, 0xE6E)
                                          for s in _tables(buf, o, 10, 10)]
    rx = re.compile(_alt(first) + _alt(second) + _alt(sufs))
    for city in scn["cities"]:
        assert rx.fullmatch(city["name"].encode("cp437")), city["name"]
    # sites: temples sprintf(DS:031f, name), ruins template % (A + B); the SPC lines
    temples = [RM.sprintf(C._text(w, K.FMT_TEMPLE_NAME), t) for t in _tables(buf, 0x1000, 10, 10)]
    bases = [a + b for a in _tables(buf, 0xF38, 10, 10) for b in _tables(buf, 0xF9C, 10, 10)]
    ruins = [RM.sprintf(t, b) for t in _tables(buf, 0xED4, 20, buf.word(0xED2)) for b in bases]
    spc = gd.read("RANDOM/RANDOM.SPC")
    want = b""
    assert scn["site_count"] == 40
    for s in scn["sites"]:
        name = s["name"].encode("cp437")
        temple = s["type"] == 1
        assert name in (temples if temple else ruins), name
        want += RM.sprintf(C._text(w, K.FMT_TEMPLE_TEXT if temple else K.FMT_RUIN_TEXT), s["index"], name)
    assert spc == want
    # sides: one of their five names; gold rnd(3, 50, 20)
    for p in scn["players"]:
        cands = [buf.cstr(0x764 + 0x64 * p["index"] + 0x14 * k) for k in range(5)]
        assert p["name"].encode("cp437") in cands and 23 <= p["gold"] <= 170


@pytest.mark.gamedata
def test_shipped_random_capitals(game):
    from warlords2.formats.scenario import parse_map, parse_scn
    gd = _gd(game)
    scn = parse_scn(gd.read("RANDOM/RANDOM.SCN"))
    words = parse_map(gd.read("RANDOM/RANDOM.MAP"))
    quads = set()
    for p in scn["players"]:
        x, y = p["capital_x"], p["capital_y"]
        q = p["index"]
        base = 0x80 + 2 * (q - 6) if q >= 6 else 0x62 + 2 * q
        assert [words[(y + dy) * W + x + dx] & 0xFF for dy in (0, 1) for dx in (0, 1)] == \
            [base, base + 1, base + 0x10, base + 0x11]
        quads.add((x // 28, y // 78))
        city = next(c for c in scn["cities"] if (c["x"], c["y"]) == (x, y))
        assert city["owner"] == q
    assert len(quads) == 8
    assert all(c["level_14"] in (3, 4, 5) and 15 <= c["income"] <= 40 for c in scn["cities"])


def _island(w):
    for x in range(W):
        for y in range(H):
            edge = min(x, y, W - 1 - x, H - 1 - y)
            w.buf.set_grid(x, y, 2 if edge < 3 else 3 if edge < 4 else 7)


def _run_places(game, seed, cities=None, allies=0, source="python"):
    w = _real_work(game, seed, RM.RandomRun(allies=allies), source)
    _island(w)
    if cities is not None:
        w.buf.set_word(0x2A, cities)
    C.place_cities(w)
    pcts = list(C.place_sites(w))
    for c in range(C.city_count(w)):            # stand-in for ovl09:005c's city tiles (R3)
        w.map.set_lo(*C.city_xy(w, c), 0x60)
    C.city_table(w)
    S.sides(w)
    C.city_details(w)
    return w, pcts


@pytest.mark.gamedata
@pytest.mark.parametrize("seed,cities,allies,source", [(1, None, 0, "python"), (2, 70, 1, "python"),
                                                       (3, 100, 0, "borland"), (4, 100, 1, "borland")])
def test_real_run_structure(game, seed, cities, allies, source):
    from warlords2.formats.scenario import parse_scn
    w, pcts = _run_places(game, seed, cities, allies, source)
    n = cities or 80
    assert pcts == list(range(71, 80))
    d = parse_scn(bytes(w.scn.data))
    assert d["city_count"] == n == len(d["cities"])
    xs = [(c["x"], c["y"]) for c in d["cities"]]
    assert xs == sorted(xs, key=lambda p: (p[1], p[0]))        # row-major after 05e3
    for x, y in xs:
        assert 6 <= x <= 107 and 6 <= y <= 151
        assert all(w.buf.grid(x + dx, y + dy) == 10 for dx in (0, 1) for dy in (0, 1))
    for i, a in enumerate(xs):                                  # no city touches another
        for b in xs[i + 1:]:
            assert abs(a[0] - b[0]) > 2 or abs(a[1] - b[1]) > 2
    assert d["site_count"] == 40
    for s in d["sites"]:
        assert w.buf.grid(s["x"], s["y"]) == 11
    owners = sorted(c["owner"] for c in d["cities"] if c["owner"] != 15)
    assert owners == list(range(8))
    assert sorted(w.buf.word(0x1D72 + 2 * k) for k in range(8)) == \
        sorted(w.buf.word(0x1D62 + 2 * p) for p in range(8))
    for c in d["cities"]:
        assert c["level_14"] in (3, 4, 5) and 15 <= c["income"] <= 40
        ids = [b[0] for b in c["slot_bytes"]]
        k = next((i for i, t in enumerate(ids) if t == 0xFF), 4)
        assert k >= 1 and all(t != 0xFF and t < 29 for t in ids[:k])
    cty = bytes(w.buf.data[0x1F56:0x1F56 + w.buf.uword(0x1064)])
    spc = bytes(w.buf.data[0x3E96:0x3E96 + w.buf.uword(0x1066)])
    assert cty.count(b"\n") == n and spc.count(b"\n") == 40
    assert [ln[:5] for ln in spc.split(b"\n")[:3]] == [b"#000|", b"#001|", b"#002|"]
    assert w.run.rotor >= 0
    assert all(23 <= w.scn.word(0x185 + 0x14 * p) <= 170 for p in range(8))


@pytest.mark.gamedata
def test_real_run_is_deterministic_and_the_rotor_carries(game):
    a, _ = _run_places(game, 9)
    b, _ = _run_places(game, 9)
    assert bytes(a.scn.data) == bytes(b.scn.data) and bytes(a.buf.data) == bytes(b.buf.data)
    assert bytes(a.map.data) == bytes(b.map.data)
    # a second generation in the same run starts from the rotor left by the first: no roll
    run = a.run
    r0 = run.rotor
    w = _real_work(game, 10, run)
    _island(w)
    calls = []

    class Spy:
        def rnd(self, d, s, add):
            calls.append((d, s, add))
            return w.rng_real.rnd(d, s, add)

    w.rng_real, w.rng = w.rng, Spy()
    C.site_square(w, 7)
    assert (1, 16, -1) not in calls and run.rotor == (r0 + 1) % 16


@pytest.mark.gamedata
@pytest.mark.parametrize("seed,sliders,allies", [(1, [3, 3, 0, 3], 0), (2, [3, 3, 6, 3], 1)])
def test_full_generation_places(game, seed, sliders, allies):
    """The whole pipeline (packages R1-R3 as far as they exist): R2's facts on the files."""
    from warlords2.formats.scenario import parse_map, parse_scn
    run = RM.RandomRun(allies=allies, sliders=sliders)
    try:
        g = RM.finish(RM.random_begin(_gd(game).read, Rng(seed), run))
    except NotImplementedError as e:
        pytest.skip(str(e))
    d = parse_scn(g.files["SCN"])
    words = parse_map(g.files["MAP"])
    n = (70, 80, 100)[sliders[2] // 3]
    assert d["city_count"] == n == g.work.buf.word(0x2A)
    tl = {(x, y) for y in range(H) for x in range(W) if words[y * W + x] & 0xFF == 0x60}
    caps = {(p["capital_x"], p["capital_y"]) for p in d["players"]}
    assert tl | caps == {(c["x"], c["y"]) for c in d["cities"]} and len(caps) == 8
    assert g.files["CTY"].count(b"\n") == n and g.files["SPC"].count(b"\n") == 40
    assert len(g.files["CTY"]) == g.work.buf.uword(0x1064)
