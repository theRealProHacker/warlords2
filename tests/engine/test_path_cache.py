"""The path cache of 0555:000a (slots 0555:1508 / 1595 / 165c / 16f0, cleared by 0555:0350) and the
in-place patch / restore of the cached cost map (0555:0bde)."""
import pytest

from warlords2.model.ids import Terrain
from warlords2.rules import pathfinding as P
from warlords2.rules.constants import movement as K

from movekit import add_city, flat_state, scenario_state

LAND = K.MODE_LAND.value
W = 112


def fresh(st, src, dst, mode=LAND, mask=0):
    """What a search without any cached path gives (on a copy)."""
    c = st.copy()
    P.clear_cache(c)
    return P.find_path(c, src, dst, mode, mask)


def test_flat_map_tail_versus_fresh_search(game):
    """(10,10) -> (30,10): distance 20 -> stored in slot 1.  A request from a square of that path
    returns the stored tail while its distance is >= 15 (slots 1..19 are looked at); nearer, only
    slot 0 is looked at, which misses, and the fresh search goes into slot 0."""
    st = flat_state(game)
    dst = (30, 10)
    codes = P.find_path(st, (10, 10), dst, LAND, 0)
    s1 = st.path_cache[1]
    assert (s1.valid, s1.src, s1.dst, s1.codes[:len(codes)]) == (2, (10, 10), dst, codes)
    assert st.path_cache[2].valid == 0                     # 16f0 copies 200 bytes (17b7..17e3)
    cells = P.cells((10, 10), codes)
    differs = 0
    for k in range(1, len(cells) - 1):
        src = cells[k - 1]
        expect_fresh = fresh(st, src, dst)
        got = P.find_path(st, src, dst, LAND, 0)
        if P.distance(src, dst) >= 15:
            assert got == codes[k:]
            differs += got != expect_fresh
        else:
            assert got == expect_fresh
            assert st.path_cache[0].src == src and st.path_cache[0].codes[:len(got)] == got
            break
    assert differs                                         # the reviewer's measured effect


def test_near_store_leaves_the_next_slot(game):
    """A near path goes into slot 0; 0555:16f0 copies 200 bytes (si = 199..0, asm 17b7..17e3)
    into +0x0e..+0xd5 of the 0xd6-byte slot, so slot 1 keeps its state word 0."""
    st = flat_state(game)
    codes = P.find_path(st, (10, 10), (14, 10), LAND, 0)
    s0, s1 = st.path_cache[0], st.path_cache[1]
    assert s0.valid == 2 and s0.codes == codes + [0xFF] * (200 - len(codes))
    assert (s1.valid, s1.codes, s1.src, s1.dst) == (0, [0] * 200, (0, 0), (0, 0))


def test_far_slot_choice_and_replacement(game):
    """16f0: the first slot 1..19 with state word 0 (1773..1746), so eleven far paths fill
    slots 1..11 in order."""
    st = flat_state(game)
    used = []
    for i in range(11):
        dst = (40 + i, 60 + 2 * i)
        P.find_path(st, (10, 10), dst, LAND, 0)
        used.append(next(k for k, s in enumerate(st.path_cache) if s.dst == dst))
    assert used == list(range(1, 12))
    assert all(s.valid == 0 for s in st.path_cache[12:])


def test_full_cache_replaces_the_shortest_stored_path(game):
    """All 19 far slots used: the slot with the smallest stored start-destination distance
    (strict < from 10000, first on ties, 175c..176e) is replaced when that distance is below
    the new one (178e..1799), else the path is not stored (179c..17a2)."""
    st = flat_state(game)
    far = [(10 + 2 * k, 40 + k) for k in range(19)]           # distances 30, 31, 32, ... (strictly growing)
    for dst in far:
        P.find_path(st, (10, 10), dst, LAND, 0)
    assert [s.dst for s in st.path_cache[1:]] == far
    shortest = min(range(1, 20), key=lambda k: (P.distance(st.path_cache[k].src,
                                                             st.path_cache[k].dst), k))
    assert shortest == 1
    new = (60, 60)                                             # distance 70 > 30: replaces slot 1
    P.find_path(st, (10, 10), new, LAND, 0)
    assert st.path_cache[1].dst == new and [s.dst for s in st.path_cache[2:]] == far[1:]
    before = [(s.src, s.dst) for s in st.path_cache]
    P.find_path(st, (10, 10), (10, 25), LAND, 0)               # distance 15 < 31: not stored
    assert [(s.src, s.dst) for s in st.path_cache] == before


def test_cleared_slot_is_a_path_of_zeros(game):
    """1595 does not read the validity word: a cleared slot answers a ship request (0,0) -> (0,0)
    with its 200 codes 0."""
    st = flat_state(game)
    assert P.find_path(st, (0, 0), (0, 0), K.MODE_SHIP.value, 0) == [0] * 200
    assert st.path_cache[0].valid == 2


def test_lookup_needs_same_mode_and_mask(game):
    st = flat_state(game)
    codes = P.find_path(st, (10, 10), (30, 10), LAND, 0)
    st.path_cache[1].codes[0:3] = [4, 4, 4]                # a marker only the cache can return
    assert P.find_path(st, (10, 10), (30, 10), LAND, 0)[:3] == [4, 4, 4]
    assert P.find_path(st, (10, 10), (30, 10), LAND, 1)[:3] != [4, 4, 4]
    assert P.find_path(st, (10, 10), (30, 10), K.MODE_FLY.value, 0)[:3] != [4, 4, 4]
    assert codes


def test_clear_cache(game):
    st = flat_state(game)
    P.find_path(st, (10, 10), (30, 10), LAND, 0)
    P.clear_cache(st)
    assert all(s.valid == 0 and s.codes == [0] * 200 and s.dst == (0, 0) for s in st.path_cache)
    assert len(st.path_cache) == 20


def test_dragon_re_search_returns_cached_tail(game):
    st = scenario_state(game, "DRAGON")
    src = st.players[st.current].capital
    n = 0
    for c in st.cities:
        dst = (c.x, c.y)
        codes = P.find_path(st, src, dst, LAND, 0)
        if not codes or len(codes) < 16:
            continue
        cl = P.cells(src, codes)
        s2 = cl[2]
        if P.distance(s2, dst) < 15:
            continue
        assert P.find_path(st, s2, dst, LAND, 0) == codes[3:]
        n += 1
        if n == 3:
            break
    assert n


def test_target_city_restore_drops_the_port_bit(game):
    """0bde(req, 1) patches the foreign target city to 0x81; 0bde(req, 0) rewrites it from the
    owner nibble (0 | 0x80 for a foreign city) without the port bit 0x10 of 0555:0d9e."""
    st = flat_state(game)
    add_city(st, 30, 10, 1)
    st.world.flags[10 * W + 30] |= 0x80                    # port bit on one city square
    P.rebuild_cost_map(st)
    assert st.cost_map[10 * W + 30] == 0x90
    assert P.find_path(st, (10, 10), (30, 10), LAND, 0)
    assert st.cost_map[10 * W + 30] == 0x80
    assert [st.cost_map[y * W + x] for x, y in ((31, 10), (30, 11), (31, 11))] == [0x80] * 3


def test_cost_map_must_be_built(game):
    st = flat_state(game)
    st.cost_map = []
    with pytest.raises(RuntimeError):
        P.find_path(st, (10, 10), (30, 10), LAND, 0)


def test_cached_cost_map_is_not_rebuilt_by_a_search(game):
    """Only the 0555:0d9e call sites rebuild it: painting a mountain wall changes nothing until
    rebuild_cost_map runs."""
    st = flat_state(game)
    for y in range(0, 156):
        st.world.tiles[y * W + 20] = int(Terrain.MOUNTAINS)
    assert P.find_path(st, (10, 10), (30, 10), LAND, 0)
    P.clear_cache(st)
    P.rebuild_cost_map(st)
    assert P.find_path(st, (10, 10), (30, 10), LAND, 0) is None
