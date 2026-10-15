"""The army table convention (0b62:0309 allocator, 0b62:03be free): records are never removed,
index == id, a free record has owner 0xff, and every scan passes over free records without
looking up their type."""
import pytest

from warlords2.model import commands as C
from warlords2.model.ids import HERO_TYPE, Terrain
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import combat, economy, engine
from warlords2.rules import movement as M
from warlords2.rules.mapwords import refresh_map

from test_bonuses import mk_state, put, set_terrain
from test_combat import Script

FREE = 0xFF


def _stub_hooks(monkeypatch):
    stub = {"ai_memory": lambda *a: None, "history": lambda *a: [], "medals": lambda *a: [],
            "quest_check": lambda *a: (0, []), "hero_died": lambda *a: [], "add_exp": lambda *a: []}
    real = combat._hook
    monkeypatch.setattr(combat, "_hook", lambda n: stub.get(n) or real(n))


def _kill_army_0(monkeypatch):
    """Army 0 attacks and dies (ovl36:0bcb frees it); army 1 of the same side is on Water."""
    st = mk_state()
    a0 = put(st, 1, 0, 4, 5, strength=1)
    put(st, 2, 1, 5, 5, strength=9)
    set_terrain(st, 20, 20, Terrain.WATER)
    put(st, 3, 0, 20, 20)
    st.flags[SCN_ARMY_HIGH] = 10
    _stub_hooks(monkeypatch)
    st.rng.src = Script([1, 20], cycle=True)            # defender hits, attacker misses
    engine.apply(st, C.Attack((a0,), 5, 5))
    return st


def test_freed_record_stays_and_is_never_typed(monkeypatch):
    st = _kill_army_0(monkeypatch)
    a = st.armies[0]
    assert (a.id, a.type_id, a.owner, a.x, a.y, a.moves_left, a.transit) == (0, FREE, FREE, -1, -1, 0, FREE)
    assert [b.id for b in st.armies] == list(range(len(st.armies)))
    # army_type(0xff) answers model.army.NO_TYPE (the EXE's reads for type byte 0xff, X36), so
    # make a lookup of a freed record's 0xff fail here: no scan may reach it.  (A live unit of
    # type byte 0xff, rules.city.create_unit, stores -1 and is not caught.)
    real = type(st).army_type

    def strict(self, type_id):
        if type_id == FREE:
            raise KeyError(type_id)
        return real(self, type_id)
    monkeypatch.setattr(type(st), "army_type", strict)
    with pytest.raises(KeyError):
        st.army_type(a.type_id)
    # every scan of the table passes the free record
    refresh_map(st)
    M.refresh_moves(st, 0)
    assert M.sink(st)                                    # army 1 (not id 0) sinks on Water
    economy.settle(st)
    assert economy.gold_items(st, 0) == 0
    assert [b.owner for b in st.armies] == [FREE, 1, FREE]


def test_allocator_reuses_the_first_free_record(monkeypatch):
    """0b62:0309: first owner 0xff; owner = SCN 0x110, +0xc = 1, +0x10 = 0xff, +0x11 = 0, goto
    -1; other bytes kept (type 0xff, x = y = -1 from the free); 0x181 raised only past it."""
    st = _kill_army_0(monkeypatch)
    old = st.armies[0]
    old.group, old.strength, old.goto = 5, 7, (3, 3)
    assert M.sink(st)                                    # frees record 2
    st.current = 2
    a = M.alloc_army(st)
    assert a is old and a.id == 0
    assert (a.owner, a.flags, a.transit, a.group, a.goto) == (2, 1, 0xFF, 0, (-1, -1))
    assert (a.type_id, a.x, a.y, a.strength) == (FREE, -1, -1, 7)
    assert st.flags[SCN_ARMY_HIGH] == 10
    b = M.alloc_army(st)                                 # record 2 (the sunk army) is next
    assert b.id == 2
    c = M.alloc_army(st)                                 # none free: appended
    assert c.id == 3 == len(st.armies) - 1 and (c.type_id, c.x, c.y) == (0, -1, -1)


def test_allocator_raises_the_high_water_mark():
    st = mk_state()
    st.flags[SCN_ARMY_HIGH] = 2
    for i in range(4):
        assert M.alloc_army(st).id == i
    assert st.flags[SCN_ARMY_HIGH] == 4


def test_free_keeps_group_byte():
    """asm 0b62:03be..0404 writes +4, +5, +0, +2, +0xe, +0xf, +0x10 and +7 only."""
    st = mk_state()
    a = st.armies[put(st, 1, 0, 3, 3)]
    a.group = 4
    M.remove_army(st, a)
    assert a.group == 4 and a.owner == FREE


def test_sink_skips_army_id_0():
    """asm 0b62:1169 / 11e7: dec / jne, so the all-squares scan never looks at id 0."""
    st = mk_state()
    set_terrain(st, 8, 8, Terrain.WATER)
    put(st, 1, 0, 8, 8)
    assert M.sink(st) == []
    put(st, 1, 0, 8, 8)
    ev = M.sink(st)
    assert ev and ev[0].info["armies"] == (1,) and st.armies[0].owner == 0


def test_selecting_a_freed_army_is_refused(monkeypatch):
    st = _kill_army_0(monkeypatch)
    with pytest.raises(engine.IllegalCommand):
        M.stack_mode(st, (0,))
    with pytest.raises(engine.IllegalCommand):
        engine.apply(st, C.Move((0,), (10, 10)))


def test_hero_type_flag_bytes():
    """ovl48:0000: the table holds low bytes; a word 0x100 reads as 0."""
    from dataclasses import replace
    st = mk_state()
    st.army_types[1] = replace(st.army_types[1], flag16=0x100)
    assert M.type_flag(st, 1, "flag16") == 0
    assert M.type_flag(st, HERO_TYPE, "flag19") == 0
