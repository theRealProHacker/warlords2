"""ovl29:0398 / 0749, ovl21:0a85 and ovl25:0656 (ai.md §4.2, §6.8) as warlords2.ai.tables /
ai.util.nearest_ring: the neighbour table built at new game."""
import pytest

from warlords2.ai import tables as AT
from warlords2.ai.util import nearest_ring
from warlords2.model.ids import MAP_W

from movekit import add_city, flat_state, scenario_state

pytestmark = pytest.mark.gamedata


class FakeMap:
    """A distance table: |T| = given values, 30000 (not reached) elsewhere."""

    def __init__(self, values=None):
        self.v = dict(values or {})

    def value(self, x, y):
        return self.v.get((x, y), 30000)


RING = [(0, -1), (1, -1), (2, -1), (2, 0), (2, 1), (2, 2), (1, 2), (0, 2), (-1, 2), (-1, 1), (-1, 0), (-1, -1)]


def test_ring_walk_order_ties_sign_and_cap(game):
    """0a85: clockwise from the square above the corner; |T| (negative = reached, not
    expanded); strict <: the first square in walk order wins a tie; cap 100, 1000 with flag."""
    st = flat_state(game)
    c = add_city(st, 10, 10, 0)
    dm = FakeMap({(12, 9): 7, (9, 9): 7, (10, 12): -8})
    assert nearest_ring(st, c, dm) == (7, 12, 9)
    assert nearest_ring(st, c, FakeMap({(9, 10): -40})) == (40, 9, 10)
    assert nearest_ring(st, c, FakeMap({(11, 12): 500})) == (100, -1, -1)
    assert nearest_ring(st, c, FakeMap({(11, 12): 500}), 1) == (500, 11, 12)
    order = []
    for i, (dx, dy) in enumerate(RING):
        dm = FakeMap({(10 + dx, 10 + dy): 50 - i})
        order.append(nearest_ring(st, c, dm)[1:])
    assert order == [(10 + dx, 10 + dy) for dx, dy in RING]


def test_ring_walk_stops_at_the_map_edge(game):
    """0a8b:0b4d returns 0 for x < 0, y < 0, x == 0x70, y == 0x9c, and 0a85 then ends the whole
    walk: a city on the top row sees nothing, one on the left edge stops after (0, 2)."""
    st = flat_state(game)
    top = add_city(st, 20, 0, 0)
    left = add_city(st, 0, 20, 0)
    assert nearest_ring(st, top, FakeMap({(22, 1): 3})) == (100, -1, -1)
    assert nearest_ring(st, left, FakeMap({(0, 22): 9, (-1, 21): 1})) == (9, 0, 22)
    assert nearest_ring(st, left, FakeMap({(1, 22): 9})) == (9, 1, 22)


def _row_of_cities(st, n, y=40, x0=4):
    return [add_city(st, x0 + 3 * i, y, 0) for i in range(n)]


def test_nearest_six_direction_penalty_and_ties(game):
    """0749 picks: smallest distance, + 50 for a direction already holding more than 2 picks,
    strict < over slots 49..0 (the highest slot wins ties); n = every reachable city."""
    st = flat_state(game)
    me = add_city(st, 50, 50, 0)
    east = [add_city(st, 60 + 3 * i, 50, 0) for i in range(5)]     # x >, same y
    west = add_city(st, 30, 50, 0)
    north = add_city(st, 50, 30, 0)
    unreachable = add_city(st, 50, 80, 0)
    dist = {east[0]: 10, east[1]: 11, east[2]: 12, east[3]: 13, east[4]: 14, west: 60, north: 70}
    dm = FakeMap({(st.cities[c].x, st.cities[c].y - 1): d for c, d in dist.items()})
    n = AT.nearest_six(st, me, dm)
    assert n == 7
    ids = st.ai.neighbours.ids[me * 6:me * 6 + 6]
    ds = st.ai.neighbours.dists[me * 6:me * 6 + 6]
    # three east picks (10, 11, 12), then east costs 13 + 50 = 63 > west 60; then north 70 < 63? no:
    # 63 < 70, so east[3]; then 64 vs 70 -> east[4]
    assert ids == [east[0], east[1], east[2], west, east[3], east[4]]
    assert ds == [10, 11, 12, 60, 13, 14]
    assert unreachable not in ids


def test_nearest_six_tie_takes_the_highest_slot(game):
    """Candidates enter slots in scan order count-1..0 (slot 0 = the highest index); equal
    distances: the pick scan from slot 49 down meets the lowest city index first (strict <)."""
    st = flat_state(game)
    me = add_city(st, 50, 50, 0)
    a = add_city(st, 60, 50, 0)
    b = add_city(st, 50, 60, 0)
    dm = FakeMap({(60, 49): 5, (50, 59): 5})
    st.ai.neighbours.ids[:6] = [0xEE] * 6
    AT.nearest_six(st, me, dm)
    assert st.ai.neighbours.ids[me * 6:me * 6 + 3] == [a, b, 0xEE]     # 0749 writes the picks only


def test_nearest_six_keeps_50_candidates(game):
    """With more than 50 reachable cities a candidate replaces the slot with the largest
    distance (strict >; the first such slot unless an empty one comes later) when its own is
    smaller, so the six picks are the overall nearest."""
    st = flat_state(game)
    me = add_city(st, 2, 2, 0)
    cs = [add_city(st, 6 + 3 * (i % 30), 10 + 4 * (i // 30), 0) for i in range(55)]
    dist = {c: 36 + i for i, c in enumerate(cs)}        # scanned 54..0: the nearest come last
    dm = FakeMap({(st.cities[c].x, st.cities[c].y - 1): d for c, d in dist.items()})
    assert AT.nearest_six(st, me, dm) == 55
    ds = st.ai.neighbours.dists[me * 6:me * 6 + 6]
    assert sorted(ds) == [36, 37, 38, 39, 40, 41]


def test_is_neighbour_compares_bytes_with_a_word(game):
    """0656: NB id byte (zero-extended) == d: an empty entry 0xff matches d = 255, not -1."""
    st = flat_state(game)
    add_city(st, 10, 10, 0)
    nb = st.ai.neighbours
    nb.ids[0:6] = [3, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]
    nb.dists[0:6] = [9, 0, 0, 0, 0, 0]
    assert AT.is_neighbour(st, 0, 3) == (1, nb.ids[0:6], nb.dists[0:6])
    assert AT.is_neighbour(st, 0, -1)[0] == 0
    assert AT.is_neighbour(st, 0, 255)[0] == 1


def test_build_restores_side_and_owner_nibbles(game):
    """0398: SCN 0x110 is 0 during the build and restored; the city owner bytes come back; the
    owner nibble of each city square becomes owner & 0xf; NB ids 0xff / distances 0 where a
    city has fewer than six neighbours."""
    st = scenario_state(game, "TUTORIA")
    st.current = 3
    c0 = st.cities[0]
    i = c0.y * MAP_W + c0.x
    st.world.flags[i] = (st.world.flags[i] & 0xF0) | 0x9
    owners = [c.owner for c in st.cities]
    AT.build_neighbours(st)
    assert st.current == 3 and [c.owner for c in st.cities] == owners
    assert st.world.flags[i] & 0xF == c0.owner & 0xF
    n = len(st.cities)
    assert st.ai.neighbours.ids[6 * n:] == [0xFF] * (600 - 6 * n)
    assert st.ai.neighbours.dists[6 * n:] == [0] * (600 - 6 * n)
    assert all(st.ai.neighbours.ids[6 * c + k] != c for c in range(n) for k in range(6))


def test_new_game_builds_the_table(game):
    """ovl30:0000 -> 010b -> 0398 at new game: every TUTORIA city has neighbours."""
    st = scenario_state(game, "TUTORIA")
    n = len(st.cities)
    assert all(st.ai.neighbours.ids[6 * c] != 0xFF for c in range(n))


def test_the_test_kits_neighbour_memo_equals_a_full_build(game):
    """movekit.neighbour_memo (test kit only): a hit leaves what the full build leaves."""
    from movekit import neighbour_memo
    st = scenario_state(game, "TUTORIA")
    a, b, c = st.copy(), st.copy(), st.copy()
    a.world.flags[100] ^= 0x40                         # a bit 0398 never reads
    AT.build_neighbours(a)
    with neighbour_memo():
        AT.build_neighbours(b)
        AT.build_neighbours(c)                         # a hit
    for s in (b, c):
        assert (s.ai.neighbours, s.cost_map) == (a.ai.neighbours, a.cost_map)
        assert [f & ~0x40 for f in s.world.flags] == [f & ~0x40 for f in a.world.flags]
