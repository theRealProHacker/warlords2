"""rules.movement: stack mode 0c8c:0529, move 0a8b:07f9 / 04c8, refresh ovl68:05fb, sink 0b62:0ea0."""
import pytest

from movekit import W, add_army, add_city, corridor, flat_state, paint, type_with
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, Control, ItemState, ItemType, Terrain
from warlords2.model.item import Item
from warlords2.rules import engine
from warlords2.rules import movement as M
from warlords2.rules.engine import IllegalCommand

pytestmark = pytest.mark.gamedata
LAND, FLY, SHIP = 1, 2, 0


def give(st, army, item_type):
    st.items.append(Item("x", item_type, 1, ItemState.CARRIED, army.id, 0, 0))


@pytest.fixture
def st(game):
    return flat_state(game)


def test_stack_mode(st):
    foot, flyer = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0), type_with(st, flag16=1)
    woods, hills = type_with(st, flag17=1, flag18=0), type_with(st, flag18=1, flag17=0)
    ship = type_with(st, flag19=1)
    a = add_army(st, foot, 5, 5)
    f = add_army(st, flyer, 5, 5)
    h = add_army(st, HERO_TYPE, 5, 5)
    wd = add_army(st, woods, 5, 5)
    hl = add_army(st, hills, 5, 5)
    s = add_army(st, ship, 5, 5)
    assert M.stack_mode(st, [a.id]) == (LAND, 0)
    assert M.stack_mode(st, [a.id, wd.id]) == (LAND, 2)
    assert M.stack_mode(st, [hl.id, a.id]) == (LAND, 1)
    assert M.stack_mode(st, [hl.id, wd.id]) == (LAND, 3)
    assert M.stack_mode(st, [f.id]) == (FLY, 0)
    assert M.stack_mode(st, [f.id, h.id]) == (FLY, 0)               # hero carried
    assert M.stack_mode(st, [h.id]) == (LAND, 0)
    assert M.stack_mode(st, [f.id, a.id]) == (LAND, 0)
    assert M.stack_mode(st, [s.id, a.id]) == (SHIP, 0)
    give(st, h, ItemType.FLIGHT)
    assert M.stack_mode(st, [h.id, a.id]) == (FLY, 0)               # flight item lifts the stack
    a.flags |= 0x1000
    assert M.stack_mode(st, [a.id, f.id, s.id]) == (LAND, 8)        # aboard first


def test_step_cost_per_stack(st):
    woods, hills = type_with(st, flag17=1, flag18=0), type_with(st, flag18=1, flag17=0)
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    paint(st, 6, 5, Terrain.FOREST)
    paint(st, 6, 6, Terrain.HILLS)
    paint(st, 6, 4, Terrain.MARSH)
    a, w_, h_ = add_army(st, foot, 5, 5), add_army(st, woods, 5, 5), add_army(st, hills, 5, 5)
    stack = [a.id, w_.id]                                          # one w17 member is enough
    assert M.step_cost(st, stack, (5, 5), (6, 5)) == 2
    assert M.step_cost(st, stack, (5, 5), (6, 6)) == 6
    assert M.step_cost(st, [a.id, h_.id], (5, 5), (6, 6)) == 2
    assert M.step_cost(st, [a.id, w_.id, h_.id], (5, 5), (6, 4)) == 5
    with pytest.raises(ValueError):
        M.step_cost(st, stack, (5, 5), (8, 5))


def test_move_pays_cumulative_cost(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    a = add_army(st, foot, 10, 10, moves=7)
    corridor(st, 10, 10, 40)
    ev = engine.apply(st, C.Move((a.id,), (30, 10)))
    mv = ev[0]
    assert isinstance(mv, E.Moved) and mv.info["path"] == [(11, 10), (12, 10), (13, 10)]
    assert (a.x, a.y) == (13, 10) and a.moves_left == 1 and mv.info["cost"] == 6
    assert mv.info["status"] == 2                                   # fewer than 2 left
    assert a.goto == (30, 10)
    assert st.world.flags[10 * W + 13] & 0x1F == 0x10 and not st.world.flags[10 * W + 10] & 0x10


def test_group_uses_lowest_points_and_all_pay(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    a = add_army(st, foot, 10, 10, moves=10)
    b = add_army(st, foot, 10, 10, moves=4)
    corridor(st, 10, 10, 40)
    engine.apply(st, C.Move((a.id, b.id), (30, 10)))
    assert (a.x, b.x) == (12, 12) and (a.moves_left, b.moves_left) == (6, 0)


def test_eight_army_limit_and_allied_stacks(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    a = add_army(st, foot, 10, 10, moves=20)
    b = add_army(st, foot, 10, 10, moves=20)
    corridor(st, 10, 10, 40)
    for _ in range(7):
        add_army(st, foot, 12, 10)                                  # 2 + 7 > 8: cross, no stop
    ev = engine.apply(st, C.Move((a.id, b.id), (12, 10)))
    assert (a.x, a.y) == (11, 10) and ev[0].info["path"] == [(11, 10)]
    ev = engine.apply(st, C.Move((a.id, b.id), (14, 10)))
    assert (a.x, a.y) == (14, 10) and (12, 10) in ev[0].info["path"]
    # a stack of a side at peace (relation 0) is crossed; at war it stops the move (R11)
    st.relations[0][3] = 0
    c = add_army(st, foot, 20, 10, owner=3)
    d = add_army(st, foot, 16, 10, moves=20)
    ev = engine.apply(st, C.Move((d.id,), (24, 10)))
    assert (d.x, d.y) == (24, 10) and (20, 10) in ev[0].info["path"]
    st.relations[0][3] = 2
    e = add_army(st, foot, 16, 10, moves=20)
    ev = engine.apply(st, C.Move((e.id,), (24, 10)))
    assert (e.x, e.y) == (19, 10) and ev[0].info["status"] == 3 and ev[0].info["ahead"] == (20, 10)
    assert c.x == 20


def test_stops_before_foreign_city(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    corridor(st, 10, 10, 19)
    add_city(st, 20, 10, 3)
    a = add_army(st, foot, 15, 10, moves=20)
    ev = engine.apply(st, C.Move((a.id,), (20, 10)))
    assert (a.x, a.y) == (19, 10) and ev[0].info["status"] == 5 and ev[0].info["ahead"] == (20, 10)


def test_embark_at_port_and_land(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    for x in range(14, 30):
        paint(st, x, 10, Terrain.WATER)
    paint(st, 13, 10, Terrain.PLAIN, port=True)
    a = add_army(st, foot, 10, 10, moves=30)
    corridor(st, 10, 10, 32)
    ev = engine.apply(st, C.Move((a.id,), (20, 10)))
    assert (a.x, a.y) == (14, 10)                                   # land move ends on the first water
    assert a.flags & 0x1000 and any(isinstance(e, E.Embarked) for e in ev)
    a.moves_left = 30
    ev = engine.apply(st, C.Move((a.id,), (20, 10)))
    assert (a.x, a.y) == (20, 10) and M.stack_mode(st, [a.id]) == (LAND, 8)
    paint(st, 30, 10, Terrain.PLAIN, port=True)
    paint(st, 31, 10, Terrain.PLAIN)
    a.moves_left = 30
    ev = engine.apply(st, C.Move((a.id,), (31, 10)))
    assert (a.x, a.y) == (31, 10) and not a.flags & 0x1000 and any(isinstance(e, E.Landed) for e in ev)


def test_tie_break_follows_the_previously_tried_square(st):
    """0555:117b orders the neighbours by the octant from the square tried last (DI/CX); on
    the first step that is (1, CX) with CX = the last cost 0555:0373 computed (2 on plain),
    so on open ground the walk east from (10, 10) starts south-east."""
    from warlords2.rules import pathfinding as P
    codes = P.find_path(st, (10, 10), (30, 10), LAND, 0)
    cells = P.cells((10, 10), codes)
    assert cells[:4] == [(11, 11), (12, 12), (13, 12), (14, 11)] and cells[-1] == (30, 10)
    assert len(cells) == 20


def test_set_and_cancel_path(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    a, b = add_army(st, foot, 10, 10), add_army(st, foot, 10, 10)
    assert engine.apply(st, C.SetPath((a.id, b.id), ((11, 10), (12, 11)))) == []
    assert a.goto == b.goto == (12, 11) and (a.x, a.y) == (10, 10)
    engine.apply(st, C.CancelPath((a.id, b.id)))
    assert a.goto == b.goto == (-1, -1)


def test_illegal_groups(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    a = add_army(st, foot, 10, 10)
    b = add_army(st, foot, 11, 10)
    c = add_army(st, foot, 10, 10, owner=2)
    for g in ((), (a.id, b.id), (a.id, c.id), (a.id, a.id), (99,)):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.Move(g, (20, 10)))
    nine = tuple(add_army(st, foot, 40, 40).id for _ in range(9))
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Move(nine, (45, 40)))


def test_refresh_moves(st):
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    a = add_army(st, foot, 10, 10, moves=5)
    b = add_army(st, foot, 11, 10, moves=1)
    c = add_army(st, foot, 12, 10, moves=7, flags=0x1000)
    d = add_army(st, foot, 13, 10, moves=0, owner=4)
    a.goto, b.goto = (10, 10), (30, 30)
    M.refresh_moves(st, 0)
    assert a.moves_left == a.allowance + 2 and b.moves_left == b.allowance + 1
    assert c.moves_left == 22 and d.moves_left == 0
    assert a.goto == (-1, -1) and b.goto == (30, 30)
    h = add_army(st, HERO_TYPE, 20, 20, moves=0)
    f = add_army(st, foot, 20, 20, moves=0)
    give(st, h, ItemType.DOUBLE_MOVE)
    M.refresh_moves(st, 0)
    assert h.moves_left == 2 * h.allowance and f.moves_left == 2 * f.allowance
    f.allowance = 60
    f.moves_left = 2
    M.refresh_moves(st, 0)
    assert f.moves_left == 99                                       # 60 + 2 + 60, capped


def test_sink(st):
    foot, flyer = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0), type_with(st, flag16=1)
    paint(st, 20, 20, Terrain.WATER)
    paint(st, 21, 20, Terrain.SHORE)
    z = add_army(st, foot, 20, 20)                                  # index 0: skipped by the scan
    a = add_army(st, foot, 20, 20)
    b = add_army(st, foot, 20, 20, flags=0x1000)
    h = add_army(st, HERO_TYPE, 20, 20)
    s = add_army(st, foot, 21, 20)
    ev = M.sink(st)
    assert isinstance(ev[0], E.Sunk) and ev[0].info["armies"] == (a.id,)
    assert a.x == -1 and a.type_id == 0xFF and z.x == 20 and b.x == 20 and h.x == 20 and s.x == 21
    assert M.sink(st, 20, 20)[0].info["armies"] == (z.id,)
    paint(st, 22, 20, Terrain.WATER)                                # a flight item carries all
    h2 = add_army(st, HERO_TYPE, 22, 20)
    f = add_army(st, foot, 22, 20)
    give(st, h2, ItemType.FLIGHT)
    assert M.sink(st, 22, 20) == [] and f.x == 22
    assert M.sink(st, 21, 20) == []                                 # Shore is not checked
    g = add_army(st, flyer, 23, 20)
    paint(st, 23, 20, Terrain.WATER)
    assert M.sink(st, 23, 20) == [] and g.x == 23


def test_sink_clears_the_selection_when_anything_sank(st):
    """0b62:0ea0 11ef..1228: a count > 0 nulls DS:5e5e / 5e62 / 5e3e[0..7] and zeroes DS:2bda /
    5dfe; DS:5e00, 5dfc / 5dfa and the palette stay.  Nothing sunk: nothing changes."""
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    paint(st, 20, 20, Terrain.WATER)
    add_army(st, foot, 5, 5)                                        # index 0
    h = add_army(st, HERO_TYPE, 20, 20)
    a = add_army(st, foot, 20, 20)
    sel = st.selection
    sel.selected, sel.hero, sel.moving, sel.palette = h.id, h.id, [h.id, a.id], [h.id, a.id]
    sel.group, sel.count, sel.moves, sel.mode, sel.mask = 1, 2, 7, 1, 3
    paint(st, 21, 20, Terrain.WATER)
    assert M.sink(st, 21, 20) == [] and sel.selected == h.id and sel.count == 2
    assert M.sink(st, 20, 20)[0].info["armies"] == (a.id,)
    assert (sel.selected, sel.hero, sel.moving, sel.group, sel.count) == (-1, -1, [], 0, 0)
    assert (sel.moves, sel.mode, sel.mask, sel.palette) == (7, 1, 3, [h.id, a.id])


@pytest.mark.parametrize("one_square", [True, False])
def test_sink_refreshes_the_map_and_centres_on_the_square(st, one_square):
    """0b62:0ea0 with anything sunk: the clear (11fd..1228) in both forms, then ovl62:0000 (122b:
    the emptied square loses its army bit and owner), and only for x, y >= 0 (the select
    ovl67:0728; not the turn start's -1, -1) ovl64:0629(x, y) at 1288 (SCN 0x175..0x17f)."""
    from warlords2.model.ids import MAP_ARMY, MAP_W, NO_OWNER
    from warlords2.rules.constants import turn as KT
    from warlords2.rules.mapwords import refresh_map
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    paint(st, 40, 40, Terrain.WATER)
    add_army(st, foot, 5, 5)                                        # index 0
    a = add_army(st, foot, 40, 40)
    refresh_map(st)
    sel = st.selection
    sel.selected, sel.moving, sel.group, sel.count = a.id, [a.id], 0, 1
    i = 40 * MAP_W + 40
    assert st.world.flags[i] & MAP_ARMY
    view = {k: st.flags.get(k) for k in KT.SCN_VIEW.value}
    ev = M.sink(st, 40, 40) if one_square else M.sink(st)
    assert ev[0].info["armies"] == (a.id,) and (sel.selected, sel.moving, sel.count) == (-1, [], 0)
    assert not st.world.flags[i] & MAP_ARMY and st.world.flags[i] & 0x0F == NO_OWNER
    top, left, bottom, right, cx, cy = KT.SCN_VIEW.value
    if one_square:
        assert (st.flags[cx], st.flags[cy], st.flags[left], st.flags[top]) == (40, 40, 36, 36)
    else:
        assert {k: st.flags.get(k) for k in KT.SCN_VIEW.value} == view


def test_computer_hero_picks_up_items(game):
    st = flat_state(game, controls=(Control.COMPUTER,) * 8)
    st.players[0].control = Control.COMPUTER
    h = add_army(st, HERO_TYPE, 10, 10, moves=20)
    corridor(st, 10, 10, 20)
    st.items.append(Item("x", ItemType.BATTLE, 1, ItemState.ON_MAP, 0, 12, 10))
    ev = engine.apply(st, C.Move((h.id,), (14, 10)))
    it = st.items[-1]
    assert it.state == ItemState.CARRIED and it.holder == h.id
    assert any(isinstance(e, E.ItemTaken) for e in ev)
