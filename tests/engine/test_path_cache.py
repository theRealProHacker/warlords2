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
    assert st.path_cache[2].valid == 0xFF                  # 201st byte of the store (16f0)
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


def test_near_store_marks_next_slot(game):
    """A near path goes into slot 0; its 201st byte (0xff) lands in slot 1's validity word."""
    st = flat_state(game)
    P.find_path(st, (10, 10), (14, 10), LAND, 0)
    assert st.path_cache[0].valid == 2 and st.path_cache[1].valid == 0xFF


def test_far_slot_choice_and_replacement(game):
    """16f0: the first empty slot 1..19 (every store marks the next one), then the slot with the
    smallest stored distance (the phantom slots: (0,0) -> (0,0)) when below the new distance."""
    st = flat_state(game)
    used = []
    for i in range(11):
        dst = (40 + i, 60 + 2 * i)
        P.find_path(st, (10, 10), dst, LAND, 0)
        used.append(next(k for k, s in enumerate(st.path_cache) if s.dst == dst))
    assert used == [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 2]


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
