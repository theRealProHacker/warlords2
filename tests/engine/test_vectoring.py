"""rules.vectoring: set, count, transit, arrival, reroute, standard (EL §6.4; asm ovl44:028b,
ovl44:0410, ovl43:0029..04b8, ovl47:0b47/0bd9)."""
import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import MAP_W, ROAD_STANDARD, ItemState
from warlords2.model.item import Item
from warlords2.rules import city as CT
from warlords2.rules import engine
from warlords2.rules import vectoring as V
from warlords2.rules.engine import IllegalCommand

from test_bonuses import put
from test_city import add_city, mk


def running(st, ci, slot=0):
    engine.apply(st, C.SetProduction(ci, slot))
    return st.cities[ci]


def test_set_vector_needs_running_production_and_own_destination():
    """ovl44:028b returns unless +0x2d >= 1; ovl62:0651 only yields own cities (or p + 100)."""
    st = mk()
    a, b = add_city(st, 10, 10, 0, (4,)), add_city(st, 20, 20, 0, ())
    enemy = add_city(st, 30, 30, 1, ())
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetVector(a, b))
    running(st, a)
    for bad in (enemy, 99, 101, -1):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.SetVector(a, bad))
    engine.apply(st, C.SetVector(a, b))
    c = st.cities[a]
    assert (c.vectoring, c.vector_to) == (1, (20, 20))
    engine.apply(st, C.SetVector(a, a))
    assert (c.vectoring, c.vector_to) == (0, (-1, -1))


def test_fifth_source_refused():
    """ovl44:0410 counts cities with +0x31 and target == the destination; > 3 -> refused, so at
    most four cities vector to one destination."""
    st = mk()
    dest = add_city(st, 50, 50, 0, ())
    src = [add_city(st, 10 + 4 * i, 10, 0, (4,)) for i in range(5)]
    for ci in src:
        running(st, ci)
    for ci in src[:4]:
        engine.apply(st, C.SetVector(ci, dest))
    assert V.vector_count(st, dest) == 4
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetVector(src[4], dest))
    assert st.cities[src[4]].vectoring == 0


def test_vectored_unit_arrives_two_turns_later():
    """ovl43:0dd7 with a destination: x = -1, y = -1, +0xf = dest, 0x65; next own turn 0x66; the
    turn after it is placed in the destination's first square with room (ovl43:0bff, 0d4f)."""
    st = mk()
    home, dest = add_city(st, 10, 10, 0, (4,)), add_city(st, 30, 30, 0, ())
    running(st, home)
    engine.apply(st, C.SetVector(home, dest))
    ev = CT.deliver(st)
    a = st.armies[0]
    assert ev[0].info["dest"] == dest
    assert (a.x, a.y, a.transit, a.vector_dest, a.home_city) == (-1, -1, 0x65, dest, home)
    CT.restart_production(st, ev)
    ev = CT.deliver(st)
    assert a.transit == 0x66 and not any(isinstance(e, E.VectorArrived) for e in ev)
    ev = CT.deliver(st)
    arrived = [e for e in ev if isinstance(e, E.VectorArrived)]
    assert [e.info["army"] for e in arrived] == [a.id]
    assert (a.x, a.y, a.transit, a.vector_dest) == (30, 30, 0xFF, 0)


def test_unplaceable_unit_goes_home_then_is_deleted():
    """ovl43:0119..01eb: no room or ovl43:0d4f refuses -> rerouted home (+0xf = home, 0x65) unless
    the destination already is home, then deleted (0b62:03be)."""
    st = mk()
    home, dest = add_city(st, 10, 10, 0, (4,)), add_city(st, 30, 30, 0, ())
    running(st, home)
    engine.apply(st, C.SetVector(home, dest))
    CT.deliver(st)
    a = st.armies[0]
    st.cities[dest].owner = 1                       # destination lost
    CT.deliver(st)
    ev = CT.deliver(st)
    assert (a.x, a.y, a.transit, a.vector_dest) == (-1, -1, 0x65, home)
    assert [e.info["deleted"] for e in ev if isinstance(e, E.VectorRerouted)] == [False]
    st.cities[home].owner = 1                       # home lost too
    st.current = 0
    V.advance_transit(st)
    ev = V.advance_transit(st)
    assert st.armies[0] is a and (a.owner, a.type_id, a.x, a.y) == (0xFF, 0xFF, -1, -1)  # freed
    assert [e.info["deleted"] for e in ev if isinstance(e, E.VectorRerouted)] == [True]


def test_rerouted_unit_arrives_home():
    st = mk()
    home, dest = add_city(st, 10, 10, 0, (4,)), add_city(st, 30, 30, 0, ())
    running(st, home)
    engine.apply(st, C.SetVector(home, dest))
    CT.deliver(st)
    a = st.armies[0]
    for x, y in ((30, 30), (31, 30), (30, 31), (31, 31)):
        while len(CT.armies_at(st, x, y)) < 8:
            put(st, 1, 0, x, y)
    V.advance_transit(st)
    V.advance_transit(st)
    assert a.vector_dest == home
    V.advance_transit(st)
    V.advance_transit(st)
    assert (a.x, a.y, a.transit) == (10, 10, 0xFF)


def standard(st, p, x, y, on_map=True):
    while len(st.items) <= p:
        st.items.append(Item("i", 8, 0, int(ItemState.NOT_IN_PLAY), 0, 0, 0))
    st.items[p] = Item("s", 8, 0, int(ItemState.ON_MAP if on_map else ItemState.CARRIED), 0, x, y)
    st.world.roads[y * MAP_W + x] |= ROAD_STANDARD


def test_vector_to_standard():
    """ovl62:0651 yields p + 100 when the standard (ovl47:0b47: item p on the map with road bit
    0x40) is there; target (-2, -2); the unit travels at x = -2 and is placed on the standard."""
    st = mk()
    home = add_city(st, 10, 10, 0, (4,))
    running(st, home)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetVector(home, 100))
    standard(st, 0, 40, 40)
    engine.apply(st, C.SetVector(home, 100))
    assert st.cities[home].vector_to == (-2, -2)
    ev = CT.deliver(st)
    a = st.armies[0]
    assert ev[0].info["dest"] == 100 and (a.x, a.y, a.vector_dest) == (-2, -1, 100)
    V.advance_transit(st)
    V.advance_transit(st)
    assert (a.x, a.y, a.transit) == (40, 40, 0xFF)


def test_lost_standard_switches_vectoring_off_and_reroutes():
    """ovl47:0bd9: standard not on the map -> +0x31 = 0 for own cities with target x == -2;
    a unit already on its way gets x = -1 and goes home (asm ovl43:0355..03a7)."""
    st = mk()
    home = add_city(st, 10, 10, 0, (4,))
    running(st, home)
    standard(st, 0, 40, 40)
    engine.apply(st, C.SetVector(home, 100))
    CT.deliver(st)
    a = st.armies[0]
    st.items[0].state = int(ItemState.CARRIED)
    st.cities[home].turns_left = 3
    CT.deliver(st)
    assert st.cities[home].vectoring == 0 and st.cities[home].vector_to == (-2, -2)
    CT.deliver(st)
    assert (a.x, a.y, a.transit, a.vector_dest) == (-1, -1, 0x65, home)
