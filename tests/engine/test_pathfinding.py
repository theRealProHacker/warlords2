"""rules.pathfinding: cost map 0555:0d9e, step cost 0555:19e4, search 0555:000a, reach 18be.

The DS tables of rules/constants/movement.py are re-read from WARLORD2.EXE here, so the
constants cannot drift from the binary.
"""
import struct

import pytest

from movekit import W, add_city, flat_state, paint, scenario_state
from warlords2.formats.gamedir import EXE_NAME, GameDir
from warlords2.formats.scenario import SCENARIOS
from warlords2.model.ids import MAP_H, MAP_W, Control, Terrain
from warlords2.model.options import GameOptions
from warlords2.rules import pathfinding as P
from warlords2.rules.constants import movement as K

pytestmark = pytest.mark.gamedata
DS = 0x33250
LAND, FLY, SHIP = 1, 2, 0


def _exe(game):
    return GameDir(game).read(EXE_NAME)


@pytest.mark.parametrize("addr,n,const,signed", [
    (0x1274, 12, K.TERRAIN_COST, True), (0x01E0, 12, K.ALT_TERRAIN_COST, True),
    (0x00E2, 10, K.NEIGHBOUR_START, True), (0x00F6, 54, K.NEIGHBOUR_DX, True),
    (0x0162, 54, K.NEIGHBOUR_DY, True), (0x0212, 8, K.BACKTRACE_ORDER, True),
    (0x2B16, 8, K.DIR_DX, True), (0x2B04, 8, K.DIR_DY, True), (0x01F8, 12, K.COAST_WALK, True),
    (0x2EDA, 8, K.HOLE_DX, True), (0x2EEA, 8, K.HOLE_DY, True)])
def test_tables_are_the_exe_words(game, addr, n, const, signed):
    exe = _exe(game)
    assert struct.unpack_from("<%dh" % n, exe, DS + addr) == tuple(const.value)


def test_byte_tables_and_jump_table(game):
    exe = _exe(game)
    assert tuple(exe[DS + 0x2D56:DS + 0x2D56 + 256]) == K.HOLE_PATTERN.value
    assert exe[DS + 0x1288] == K.ENEMY_CITY_PATCH_COST.value
    assert struct.unpack_from("<h", exe, DS + 0x01F8 + 24)[0] == -1          # end of the ring walk
    jt = struct.unpack_from("<10H", exe, 0x2000 + 0x5550 + 0x1089)           # 0555:1089
    assert jt == (0x0EFF, 0x0F0B, 0x0F0B, 0x0F19, 0x0F27, 0x0F33, 0x0F33, 0x0F33, 0x0F33, 0x0EB2)
    assert struct.unpack_from("<8h", exe, DS + 0x0222) == K.DIR_DX.value
    assert struct.unpack_from("<8h", exe, DS + 0x0232) == K.DIR_DY.value


def test_direction_octants():
    assert P.direction(5, 5, 5, 5) == 0xFF
    assert [P.direction(5, 5, *p) for p in ((5, 1), (9, 1), (9, 5), (9, 9), (5, 9), (1, 9), (1, 5), (1, 1))] \
        == list(range(8))


@pytest.mark.parametrize("name", SCENARIOS)
def test_cost_map_is_the_table(game, name):
    st = scenario_state(game, name)
    cm = P.cost_map(st)
    w = st.world
    for i in range(MAP_W * MAP_H):
        t = w.terrain_of_tile[w.tiles[i]]
        c = cm[i] & 7
        if t == Terrain.CITY:
            assert c == (0 if w.flags[i] & 0x0F != st.current else 1 if w.roads[i] & 0x1F else K.TERRAIN_COST.value[10])
            assert cm[i] & 0x80
        else:
            assert c == (1 if w.roads[i] & 0x1F else K.TERRAIN_COST.value[t])
            assert bool(cm[i] & 0x08) == (t in (1, 2, 3))
            assert bool(cm[i] & 0x40) == (t == 4) and bool(cm[i] & 0x20) == (t == 5)
        if w.flags[i] & 0x80:
            assert cm[i] & 0x10


def test_step_cost_rules(game):
    st = flat_state(game)
    paint(st, 10, 10, Terrain.FOREST)
    paint(st, 11, 10, Terrain.HILLS)
    paint(st, 12, 10, Terrain.MARSH)
    paint(st, 13, 10, Terrain.MOUNTAINS)
    paint(st, 14, 10, Terrain.WATER)
    paint(st, 15, 10, Terrain.BRIDGE)
    paint(st, 16, 10, Terrain.PLAIN, road=True)
    cm = P.cost_map(st)

    def cost(x, mode, mask):
        return P.entry_cost(cm, x, 10, mode, mask, False)[0]
    # DS:1274 on foot without bonus
    assert [cost(x, LAND, 0) for x in range(10, 17)] == [4, 6, 5, 0, 1, 1, 1]
    assert cost(10, LAND, 2) == 2 and cost(11, LAND, 2) == 6          # w17 -> forest only
    assert cost(11, LAND, 1) == 2 and cost(10, LAND, 1) == 4          # w18 -> hills only
    assert cost(12, LAND, 3) == 5                                     # marsh: no bonus flag
    # flying: 1 on road / bridge / city, else 2 (water and mountains included)
    assert [cost(x, FLY, 0) for x in range(10, 17)] == [2, 2, 2, 2, 2, 1, 1]
    add_city(st, 20, 20, 0)
    assert P.entry_cost(P.cost_map(st), 20, 20, FLY, 0, False)[0] == 1
    assert P.entry_cost(cm, 9, 10, FLY, 0, False)[0] == 2             # plain


def test_land_step_onto_water_ends_the_path(game):
    st = flat_state(game)
    for x in range(12, 20):
        paint(st, x, 10, Terrain.WATER)
    cm = P.cost_map(st)
    c, stop = P.entry_cost(cm, 12, 10, LAND, 0, False)
    assert (c, stop) == (1, True)                                     # its own cost still counts
    assert P.entry_cost(cm, 13, 10, LAND, 0, True) == (0x80, True)
    paint(st, 12, 10, Terrain.BRIDGE)
    assert P.entry_cost(P.cost_map(st), 12, 10, LAND, 0, False) == (1, False)
    # aboard (mask 8): the first land square without crossing ends it
    assert P.entry_cost(cm, 11, 10, LAND, 8, False) == (2, True)
    codes = [2] * 6                                                   # east from (10, 10)
    # plain 2, bridge 1, water 1 (stop), then 0x80 each
    assert P.path_costs(st, (10, 10), codes, LAND, 0) == [2, 3, 4, 0x84, 0xFF, 0xFF]
    assert P.reach_this_turn(st, (10, 10), codes, LAND, 0, 50) == 3


def test_straight_line_on_open_ground(game):
    st = flat_state(game)
    codes = P.find_path(st, (10, 10), (30, 10), LAND, 0)
    cells = P.cells((10, 10), codes)
    assert cells[-1] == (30, 10) and len(cells) == 20
    assert P.path_costs(st, (10, 10), codes, LAND, 0)[-1] == 40


def test_mountains_and_foreign_city(game):
    st = flat_state(game)
    for y in range(0, MAP_H):
        if y != 40:
            paint(st, 20, y, Terrain.MOUNTAINS)
    codes = P.find_path(st, (10, 10), (30, 10), LAND, 0)
    assert (20, 40) in P.cells((10, 10), codes)                       # only gap
    assert P.find_path(st, (10, 10), (20, 10), LAND, 0) is None       # destination blocked
    assert P.find_path(st, (10, 10), (20, 10), FLY, 0) is not None
    ci = add_city(st, 40, 10, 3)                                      # foreign city: target only
    codes = P.find_path(st, (36, 10), (40, 10), LAND, 0)
    assert P.cells((36, 10), codes)[-1] == (40, 10)
    assert P.find_path(st, (36, 11), (44, 11), LAND, 0) is not None   # goes round it
    assert all(st.city_at(*c) != ci for c in P.cells((36, 11), P.find_path(st, (36, 11), (44, 11), LAND, 0)))


def test_ship_stays_on_water(game):
    st = flat_state(game, terrain=Terrain.WATER)
    for y in range(0, 30):
        paint(st, 20, y, Terrain.PLAIN)
    codes = P.find_path(st, (10, 10), (30, 10), SHIP, 0)
    cells = P.cells((10, 10), codes)
    assert cells[-1] == (30, 10)
    assert all(st.world.terrain(*c) == Terrain.WATER for c in cells)
    assert min(y for _, y in cells) >= 0 and max(y for x, y in cells if x == 20) >= 30


def test_hidden_map_blocks_unexplored_for_humans_only(game):
    opts = GameOptions(hidden_map=1)
    st = flat_state(game, options=opts)
    for i in range(MAP_W * MAP_H):
        st.world.roads[i] = 0x20
    for y in range(0, 60):
        st.world.roads[y * W + 20] = 0                                # unexplored wall x = 20
    codes = P.find_path(st, (10, 10), (30, 10), LAND, 0)
    assert all(y >= 60 for x, y in P.cells((10, 10), codes) if x == 20)
    st.players[0].control = Control.COMPUTER
    assert P.find_path(st, (10, 10), (30, 10), LAND, 0) == codes          # cache slot 1 hit
    P.clear_cache(st)
    codes = P.find_path(st, (10, 10), (30, 10), LAND, 0)
    assert len(P.cells((10, 10), codes)) == 20


@pytest.mark.parametrize("name", SCENARIOS)
def test_path_cost_is_sum_of_step_costs(game, name):
    """Every path found from the capital to the first cities is a chain of neighbouring
    squares whose cumulative cost (18be) is the sum of the 19e4 step costs (the ten nearest
    cities: with the map words rebuilt, neutral cities block land paths between islands)."""
    st = scenario_state(game, name)
    cm = P.cost_map(st)
    src = st.players[st.current].capital
    found = 0
    for c in sorted(st.cities, key=lambda c: P.distance(src, (c.x, c.y)))[:10]:
        codes = P.find_path(st, src, (c.x, c.y), LAND, 0)
        if codes is None:
            continue
        found += 1
        cells = P.cells(src, codes)
        assert len(cells) == len(codes) <= K.PATH_MAX.value
        prev, total, stop, cums = src, 0, False, []
        for cell in cells:
            assert max(abs(cell[0] - prev[0]), abs(cell[1] - prev[1])) == 1
            assert cm[cell[1] * W + cell[0]] & 7 or cm[cell[1] * W + cell[0]] & 0x80
            step, stop = P.entry_cost(cm, cell[0], cell[1], LAND, 0, stop)
            total += step
            cums.append(min(total, 255))
            prev = cell
        assert P.path_costs(st, src, codes, LAND, 0) == cums[:100]
        if cells:
            assert cells[-1] == (c.x, c.y)
    assert found
