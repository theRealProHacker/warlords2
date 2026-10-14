"""rules.visibility: reveal ovl64:1298, per-side view ovl64:113b / 0d39 / 0e68 / 1558."""
import pytest

from movekit import W, add_army, add_city, corridor, flat_state, scenario_state, type_with
from warlords2.model import commands as C
from warlords2.model.ids import MAP_H, MAP_W
from warlords2.model.options import GameOptions
from warlords2.rules import engine
from warlords2.rules import visibility as V

pytestmark = pytest.mark.gamedata
HIDDEN = GameOptions(hidden_map=1)


def dark(st):
    for i in range(MAP_W * MAP_H):
        st.world.roads[i] &= ~0x20


def explored(st):
    return {(i % W, i // W) for i in range(MAP_W * MAP_H) if st.world.roads[i] & 0x20}


def test_without_hidden_map_everything_is_visible(game):
    st = flat_state(game)
    dark(st)
    assert V.visible(st, 3, 3) and not V.reveal(st, 3, 3, False) and not explored(st)


def test_reveal_radius(game):
    st = flat_state(game, options=HIDDEN)
    dark(st)
    assert not V.visible(st, 10, 10)
    assert V.reveal(st, 10, 10, False)
    assert explored(st) == {(x, y) for x in range(9, 12) for y in range(9, 12)}
    assert not V.reveal(st, 10, 10, False)                          # nothing new in the box
    V.reveal(st, 30, 30, True)                                      # flying: radius 2
    assert {(x, y) for x in range(28, 33) for y in range(28, 33)} <= explored(st)
    add_city(st, 50, 50, 0)
    V.reveal(st, 50, 50, False)                                     # on a city: radius 2
    assert (48, 48) in explored(st) and (47, 48) not in explored(st)
    V.reveal(st, 0, 0, False)                                       # clipped at the edge
    assert (0, 0) in explored(st) and (1, 1) in explored(st)


def test_moving_reveals(game):
    st = flat_state(game, options=HIDDEN)
    for i in range(MAP_W * MAP_H):
        st.world.roads[i] |= 0x20
    for x in range(16, 40):
        for y in range(0, 30):
            st.world.roads[y * W + x] &= ~0x20
    a = add_army(st, type_with(st, flag16=0, flag17=0, flag18=0, flag19=0), 10, 10, moves=12)
    corridor(st, 10, 10, 30)
    engine.apply(st, C.Move((a.id,), (15, 10)))
    assert (a.x, a.y) == (15, 10)
    assert {(16, 9), (16, 10), (16, 11)} <= explored(st) and (17, 10) not in explored(st)
    # a human side cannot path through unexplored squares (0555:08bf); the destination may be
    a.moves_left = 12
    engine.apply(st, C.Move((a.id,), (18, 10)))
    assert (a.x, a.y) == (15, 10)


def test_view_per_side(game):
    """The setup buffer World.explored (ovl64:113b, built by rules.setup) is loaded into and
    stored from road bit 5 per side (ovl64:0d39 + 1558, ovl64:0e68)."""
    st = scenario_state(game, "ERYTHEA", options=HIDDEN)
    masks = st.world.explored
    p = st.current

    def deep_dark(side):                     # 5x5 block without the side's bit
        for y in range(2, MAP_H - 2):
            for x in range(2, MAP_W - 2):
                if all(not masks[(y + j) * W + x + i] >> side & 1
                       for i in range(-2, 3) for j in range(-2, 3)):
                    return x, y
    V.load_view(st, p)
    assert all(st.world.roads[i] & 0x20 for i in range(MAP_W * MAP_H) if masks[i] >> p & 1)
    assert V.visible(st, *st.players[p].capital)
    x, y = deep_dark(p)
    assert not V.visible(st, x, y)
    V.reveal(st, x, y, False)
    V.store_view(st, p)
    assert masks[y * W + x] >> p & 1
    q = next(o.index for o in st.players if o.index != p and not masks[y * W + x] >> o.index & 1)
    V.load_view(st, q)
    assert not V.visible(st, x, y)


def test_no_hidden_map_masks_full(game):
    st = scenario_state(game, "ERYTHEA")
    assert set(st.world.explored) == {0xFF}


def test_fill_holes_opens_single_holes(game):
    st = flat_state(game, options=HIDDEN)
    for i in range(MAP_W * MAP_H):
        st.world.roads[i] |= 0x20
    st.world.roads[30 * W + 30] &= ~0x20                            # an isolated hole
    for x in range(60, 70):
        for y in range(60, 70):
            st.world.roads[y * W + x] &= ~0x20                      # a 10x10 dark area stays
    V.fill_holes(st)
    seen = explored(st)
    assert (30, 30) in seen and (65, 65) not in seen
