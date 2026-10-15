"""rules.pathfinding.distance_map = 0555:1ab9(limit, x, y, mode, mask): 0555:000a with mask | 0x10
(ai.md §7a.3 / §7a.4): R = limit rings in both passes, r reset per pass, return at r == R, no
start stop, no cache, no backtrace; the signed field T.

Plain costs 2 (DS:1274[7]), so on a flat plain map a square at Chebyshev distance d from the
centre holds 1 + 2d: expanded (positive) for d < R, reached by ring R - 1 but not expanded
(negative) for d == R, 30000 beyond."""
from warlords2.model.ids import Terrain
from warlords2.rules import pathfinding as P
from warlords2.rules.constants import movement as K

from movekit import add_city, flat_state, paint

LAND = K.MODE_LAND.value
W = 112
UNSEEN = K.UNVISITED.value
BLOCKED = K.BLOCKED.value


def cheb(x, y, cx, cy):
    return max(abs(x - cx), abs(y - cy))


def test_rings_and_sign_encoding(game):
    st = flat_state(game)
    cache = [(s.valid, s.src, s.dst, list(s.codes)) for s in st.path_cache]
    cm = list(st.cost_map)
    dm = P.distance_map(st, 3, 30, 30, LAND, 0)
    assert dm.found == 1
    for x in range(24, 37):
        for y in range(24, 37):
            d = cheb(x, y, 30, 30)
            v = dm.value(x, y)
            if d < 3:
                assert v == 1 + 2 * d, (x, y, v)
            elif d == 3:
                assert v == -(1 + 2 * d), (x, y, v)
            else:
                assert v == UNSEEN, (x, y, v)
    # no cache lookup or store (0555:007f, 0190), cost map untouched (no city)
    assert [(s.valid, s.src, s.dst, list(s.codes)) for s in st.path_cache] == cache
    assert st.cost_map == cm


def test_limit_zero_returns_at_once(game):
    """r == R before the first round (asm 0555:04f6..04fe): the centre stays -1 (0168)."""
    st = flat_state(game)
    dm = P.distance_map(st, 0, 30, 30, LAND, 0)
    assert dm.found == 1 and dm.value(30, 30) == K.START_MARK.value
    assert dm.value(31, 30) == UNSEEN


def test_enclosed_centre_ends_without_progress(game):
    """Ring 1 makes no progress -> 0373 returns 0; pass 1 starts again at r = 0, finds the
    centre expanded and returns 0 at once (000a 015f..0186): result 0, the flood complete."""
    st = flat_state(game)
    for x in range(29, 32):
        for y in range(29, 32):
            if (x, y) != (30, 30):
                paint(st, x, y, Terrain.MOUNTAINS)
    dm = P.distance_map(st, 10, 30, 30, LAND, 0)
    assert dm.found == 0
    assert dm.value(30, 30) == 1
    assert dm.value(29, 29) == BLOCKED and dm.value(32, 30) == UNSEEN


def test_impassable_centre_is_no_flood(game):
    """Centre 0x7531 and not a city square: 000a returns 0 with T as 08bf left it (0132..015c)."""
    st = flat_state(game)
    paint(st, 30, 30, Terrain.MOUNTAINS)
    dm = P.distance_map(st, 5, 30, 30, LAND, 0)
    assert dm.found == 0 and dm.value(30, 30) == BLOCKED and dm.value(31, 30) == UNSEEN


def test_off_map_centre(game):
    """0555:000a 0034..0056: a centre off the map returns 0 before T (DS:3f86) is touched: the
    table is the previous search's (None only before any search)."""
    st = flat_state(game)
    st.dist_table = []
    assert P.distance_map(st, 5, -1, 30, LAND, 0) == (0, None)
    assert P.distance_map(st, 5, 112, 30, LAND, 0) == (0, None)
    on = P.distance_map(st, 5, 20, 30, LAND, 0)
    assert on.field is st.dist_table and on.value(20, 30) == 1
    before = list(st.dist_table)
    for x, y in ((-1, 30), (112, 30), (20, -1), (20, 156), (0x174, 0)):
        off = P.distance_map(st, 5, x, y, LAND, 0)
        assert off.found == 0 and off.field is on.field and st.dist_table == before
    # a path search that searches (not the direct step, not a cache hit) writes T as well
    P.find_path(st, (20, 30), (40, 30), LAND, 0)
    assert st.dist_table is not on.field
    t = st.dist_table
    P.find_path(st, (20, 30), (40, 30), LAND, 0)             # cache hit: T untouched
    P.find_path(st, (20, 30), (21, 30), LAND, 0)             # direct step: T untouched
    assert st.dist_table is t
    assert P.distance_map(st, 5, -1, 0, LAND, 0).field is t


def test_box_is_the_ring_count(game):
    """The box half-size is R too (0373 03ff..04e0 with [bp-0x20] = DS:3f70): limit 2 at the
    map edge clips the rings to the map."""
    st = flat_state(game)
    dm = P.distance_map(st, 2, 0, 0, LAND, 0)
    assert dm.found == 1
    assert [dm.value(x, 0) for x in range(4)] == [1, 3, -5, UNSEEN]


def test_foreign_city_centre_is_opened_and_restored(game):
    """08bf opens a foreign city square with cost 0 (0bde(rec, 1)); 0bde(rec, 0) writes the
    four squares back as 0 | 0x80 (foreign owner nibble)."""
    st = flat_state(game)
    add_city(st, 30, 30, 1)
    assert st.cost_map[30 * W + 30] == 0x80
    dm = P.distance_map(st, 2, 30, 30, LAND, 0)
    assert dm.found == 1
    assert dm.value(30, 30) == 1 and dm.value(31, 31) == 2      # patched city squares cost 1
    assert [st.cost_map[y * W + x] for x, y in ((30, 30), (31, 30), (30, 31), (31, 31))] == [0x80] * 4


def test_same_flood_as_a_path_search_from_the_target(game):
    """With R = 6 and the start at the target the first rings equal pass 0 of a path search
    toward a square 6 away (same relaxation, same box margin 6)."""
    st = flat_state(game)
    paint(st, 32, 31, Terrain.FOREST)
    paint(st, 33, 29, Terrain.HILLS)
    dm = P.distance_map(st, 6, 30, 30, LAND, 0)
    s = P._Search(st, (36, 30), (30, 30), LAND, 0)
    try:
        s.dist[30 * W + 30] = -1
        assert s.flood(0) == 1
    finally:
        s.restore()
    for x in range(27, 34):
        for y in range(27, 34):
            if cheb(x, y, 30, 30) < 3:
                assert abs(dm.value(x, y)) == abs(s.dist[y * W + x]), (x, y)
