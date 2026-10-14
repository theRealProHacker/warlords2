"""Shared set-up for the M4b engine tests: shipped scenarios and a synthetic flat map.

The synthetic map uses tile graphic t = terrain t (SCN 0x710 replaced by the identity for
0..11), so a test can paint terrain directly.  Built from a real new game, so every other
part of the state is genuine.  `scenario_state` ends like the top of a main-loop pass
(ovl62:0000 at ovl61:2183, cost map at ovl61:2194); the painting helpers rebuild the cached
cost map after each change, standing in for that rebuild.  A test that edits the map by hand
calls `ready(st)`.
"""
from functools import lru_cache

from warlords2.formats.gamedir import EXE_NAME, GameDir
from warlords2.formats.scenario import load_scenario
from warlords2.formats.tables import parse_armytypes
from warlords2.model.army import Army
from warlords2.model.city import City
from warlords2.model.ids import MAP_H, MAP_W, Control, Terrain
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_TERRAIN_SET
from warlords2.rules.constants import allowing_unverified
from warlords2.rules import heroes as H
from warlords2.rules import pathfinding as P
from warlords2.rules import setup as S
from warlords2.rules.mapwords import refresh_map

W = MAP_W


@lru_cache(maxsize=None)
def _inputs(root, name):
    gd = GameDir(root)
    sc = load_scenario(gd, name)
    terrain_set = sc["scn"]["globals"]["words_157_to_161"][(SCN_TERRAIN_SET - 0x157) // 2]
    kw = {"unused_name": S.unused_side_name(gd.read(EXE_NAME)),
          "hero_names": H.load_hero_names(gd, terrain_set)}
    return sc, tuple(parse_armytypes(gd.read("TERRAIN0/ARMYTYPE.DAT"))), kw


def scenario_state(root, name, seed=1, options=GameOptions(), controls=None):
    sc, at, kw = _inputs(root, name)
    cfg = NewGameConfig(name, controls or (Control.HUMAN,) + (Control.COMPUTER,) * 7, (1,) * 8,
                        (0,) * 8, (0,) * 8, None, options, 0, seed)
    with allowing_unverified():
        st = S.new_game(sc, cfg, list(at), **kw)
    refresh_map(st)
    P.rebuild_cost_map(st)
    return st


def ready(st):
    """The cost-map rebuild of a main-loop pass after a hand edit (ovl61:2194)."""
    P.rebuild_cost_map(st)
    return st


def flat_state(root, terrain=Terrain.PLAIN, options=GameOptions(), controls=None):
    st = scenario_state(root, "TUTORIA", options=options, controls=controls)
    w = st.world
    w.terrain_of_tile = list(range(12)) + [int(Terrain.PLAIN)] * 244
    w.tiles = [int(terrain)] * (MAP_W * MAP_H)
    w.flags = [0] * (MAP_W * MAP_H)
    w.roads = [0] * (MAP_W * MAP_H)
    st.cities = []
    st.armies = []
    st.current = 0
    return ready(st)


def paint(st, x, y, terrain, road=False, port=False):
    i = y * W + x
    st.world.tiles[i] = int(terrain)
    if road:
        st.world.roads[i] |= 1
    if port:
        st.world.flags[i] |= 0x80
    ready(st)


def add_city(st, x, y, owner):
    for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1)):
        i = (y + dy) * W + x + dx
        st.world.tiles[i] = int(Terrain.CITY)
        st.world.flags[i] = (st.world.flags[i] & 0xF0) | owner
    st.cities.append(City(len(st.cities), x, y, "c", owner, owner, 1))
    ready(st)
    return len(st.cities) - 1


def add_army(st, type_id, x, y, owner=0, moves=None, flags=0):
    t = st.army_type(type_id)
    m = t.moves if moves is None else moves
    a = Army(id=len(st.armies), type_id=type_id, owner=owner, x=x, y=y, allowance=t.moves,
             moves_left=m, strength=t.strength, home_city=0, hero_slot=0, medals=0, upkeep=0,
             flags=flags, vector_dest=0, transit=0, group=0, goto=(-1, -1))
    st.armies.append(a)
    i = y * W + x
    st.world.flags[i] = (st.world.flags[i] & 0xE0) | 0x10 | owner
    return a


def type_with(st, **want):
    """First non-hero army type whose flag words match `want` (e.g. flag16=1)."""
    for t in st.army_types:
        if t.type_id != 28 and all(bool(getattr(t, k)) == bool(v) for k, v in want.items()):
            return t.type_id
    raise LookupError(want)


def corridor(st, y, x0, x1):
    """Mountains above and below row y from x0-1 to x1+1, so land paths keep to the row."""
    for x in range(x0 - 1, x1 + 2):
        paint(st, x, y - 1, Terrain.MOUNTAINS)
        paint(st, x, y + 1, Terrain.MOUNTAINS)
