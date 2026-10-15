"""Production of type byte 0xff (register X36): ChooseProduction(city, -1) leaves +0x2c = 0xff
and +0x2d = the first empty slot's time byte (ovl44:00ff); ovl43:0000's city loop has no
+0x2c test (asm 04c8..068b), so ovl43:0dd7 makes a unit with +4 = 0xff and the statistics of
the slot ovl44:0000(city, -1) returns.  Its readers get `model.army.NO_TYPE`.

Expected values are read off out/asm/ovl43.asm, ovl44.asm, ovl38.asm, res_0b62.asm.
"""
import glob
import os

import pytest

from warlords2.formats.gamedir import EXE_NAME, GameDir
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.army import NO_TYPE, NO_TYPE_FLAGS
from warlords2.model.city import Slot
from warlords2.model.ids import EMPTY_SLOT, MAP_ARMY, MAP_W, Terrain
from warlords2.rules import bonuses as B
from warlords2.rules import city as CT
from warlords2.rules import combat
from warlords2.rules import engine
from warlords2.rules import movement as M

from test_bonuses import army, atype, default_types, mk_state, put, set_terrain
from test_city import add_city, mk

LEFTOVER = (2, 6, 50, 6)          # time, strength, moves, cost of an emptied slot (cf. ERYTHEA)


def no_type_city(st, slot_bytes=LEFTOVER):
    """A city producing type 5 in slot 0 whose slot 1 is empty with the given bytes."""
    ci = add_city(st, 10, 10, 0, (5,))
    st.cities[ci].slots[1] = Slot(EMPTY_SLOT, *slot_bytes)
    return ci


def run_until_made(st, ci, turns=10):
    for _ in range(turns):
        ev = [e for e in CT.deliver(st) if isinstance(e, E.Produced)]
        if ev:
            return ev[0]
    return None


def test_empty_slot_with_time_0_makes_nothing():
    """+0x2d = 0 after ovl44:00ff: ovl43:04f3 skips a city whose +0x2d is not > 0."""
    st = mk()
    ci = no_type_city(st, (0, 0, 0, 0))
    engine.apply(st, C.ChooseProduction(ci, -1))
    c = st.cities[ci]
    assert (c.current, c.turns_left) == (0xFF, 0)
    n = len(st.armies)
    assert run_until_made(st, ci) is None and len(st.armies) == n


def test_empty_slot_with_time_makes_a_type_ff_unit_from_the_slot_bytes():
    """ovl43:0dd7: +4 = +0x2c (0e2e), +6 / +7 = slot moves (0e59 / 0e72), +8 = slot strength
    (0ee0), +9 = city, +0xb = cost / 2 (0f08..0f16), no type record read; placed on the room
    square (0f6a..0f85); ovl43:06bd restarts with the time of slot ovl44:0000(city, -1)."""
    st = mk()
    ci = no_type_city(st)
    engine.apply(st, C.ChooseProduction(ci, -1))
    c = st.cities[ci]
    assert c.turns_left == 2
    assert CT.deliver(st) == [] and c.turns_left == 1
    ev = CT.deliver(st)
    assert [type(e) for e in ev] == [E.Produced] and ev[0].info["type"] == -1
    a = army(st, ev[0].info["army"])
    assert a.type_id & 0xFF == 0xFF
    assert (a.owner, a.x, a.y, a.allowance, a.moves_left, a.strength) == (0, 10, 10, 50, 50, 6)
    assert (a.home_city, a.upkeep, a.transit) == (ci, 3, 0xFF)
    assert st.world.flags[10 * MAP_W + 10] & MAP_ARMY
    CT.restart_production(st, ev)
    assert c.turns_left == 2


def test_enhanced_bump_applies_to_the_slot_strength():
    """ovl43:0e8f..0ecd: min(slot strength + 2, 9) when SCN 0xf0[0x110] is set."""
    st = mk()
    st.players[0].enhanced = 1
    ci = no_type_city(st)
    engine.apply(st, C.ChooseProduction(ci, -1))
    a = army(st, run_until_made(st, ci).info["army"])
    assert a.strength == 8


def test_slot_filled_before_delivery_uses_slot_0():
    """ovl43:0dfa: slot = ovl44:0000(city, -1); with no empty slot left it returns 0 (0028..002d),
    so the unit (still type 0xff) gets slot 0's statistics."""
    st = mk()
    ci = no_type_city(st)
    engine.apply(st, C.ChooseProduction(ci, -1))
    c = st.cities[ci]
    for k in (1, 2, 3):
        c.slots[k] = Slot(k, 1, 1, 1, 1)
    a = army(st, run_until_made(st, ci).info["army"])
    s0 = c.slots[0]
    assert a.type_id & 0xFF == 0xFF
    assert (a.strength, a.allowance, a.upkeep) == (s0.strength, s0.moves, s0.cost // 2)


def test_vectored_type_ff_unit_starts_in_transit():
    """ovl43:0593..060d / 0f2b..0f63: a vectoring city sends it off-map with transit 0x65."""
    st = mk()
    ci = no_type_city(st)
    dest = add_city(st, 20, 20, 0, (1,))
    c = st.cities[ci]
    engine.apply(st, C.ChooseProduction(ci, -1))
    c.vectoring, c.vector_to = 1, (20, 20)
    a = army(st, run_until_made(st, ci).info["army"])
    assert (a.x, a.y, a.transit, a.vector_dest) == (-1, -1, 0x65, dest)


# ----------------------------------------------------------------------------- readers


def test_army_type_of_ff_is_the_no_type_record():
    st = mk()
    assert st.army_type(-1) is NO_TYPE and st.army_type(0xFF) is NO_TYPE
    with pytest.raises(KeyError):
        st.army_type(40)
    for w in ("flag16", "flag17", "flag18", "flag19", "special", "cancel_mode"):
        assert M.type_flag(st, -1, w) == 0


def test_type_ff_unit_moves_as_land_and_is_placed_by_terrain_cost():
    """0c8c:0529 reads DS:45be..45c3 (= 0): a land stack without forest / hills bits; ovl43:0d4f
    (transit arrivals) reads DS:45be: not a flyer, so the terrain-cost test decides."""
    st = mk()
    aid = put(st, -1, 0, 5, 5, strength=6)
    assert M.stack_mode(st, [aid]) == (1, 0)
    set_terrain(st, 7, 7, Terrain.MOUNTAINS)       # DS:1274 cost 0
    assert not CT.can_place(st, -1, 7, 7)
    assert CT.can_place(st, -1, 8, 8)


def test_battle_with_a_type_ff_unit_sets_up():
    st = mk()
    a = put(st, -1, 0, 5, 5, strength=6)
    put(st, 1, 1, 6, 5)
    s = combat.prepare(st, (a,), 6, 5)
    assert s.attackers == [a] and st.battle_work.a_types[0] == 0xFF


def test_fight_order_byte_reads_before_the_row_for_type_ff():
    """SCN 0x60b + row * 29 + cwde(type): -1 gives the previous row's type-28 byte, for row 0
    SCN 0x60a = hero slot 39's level/exp byte 2c04:05e3 + 39."""
    st = mk()
    st.fight_order = [[r * 29 + t for t in range(29)] for r in range(9)]
    assert st.fight_order_byte(3, 7) == 3 * 29 + 7
    assert st.fight_order_byte(3, -1) == st.fight_order_byte(3, 0xFF) == 2 * 29 + 28
    st.heroes[39].level, st.heroes[39].exp = 2, 13
    assert st.fight_order_byte(0, -1) == (13 << 2) | 2


def test_combat_fight_order_uses_the_byte_before_the_row():
    """ovl38:04c6..04d8 / 051a..0527: mov al,[+4]; cwde; + row * 29 -> SCN 0x60b + offset."""
    st = mk()
    st.fight_order = [[r * 29 + t for t in range(29)] for r in range(9)]
    a = put(st, -1, 2, 5, 5, strength=6)
    st.current = 2
    [(v, _)] = combat.fight_order(st, 2, [army(st, a)], int(Terrain.PLAIN))
    assert v == st.fight_order_byte(2, -1)


def test_selection_fight_order_uses_the_byte_before_the_row():
    """0b62:0b56..0b8f (sort 0a03) and ovl67:0834..085c (leader of 06eb) add cwde(+4) to the
    row: rules.selection._fo reads `fight_order_byte`."""
    from warlords2.rules import selection as S
    st = mk()
    st.fight_order = [[r * 29 + t for t in range(29)] for r in range(9)]
    a = put(st, -1, 2, 5, 5, strength=6)
    assert S._fo(st, 2, army(st, a)) == st.fight_order_byte(2, -1) == 1 * 29 + 28


def test_map_cell_rank_reads_type_31_after_a_type_ff_army():
    """ovl64:2b07..2ba6: the cell keeps +4 & 0x1f = 31 after a type 0xff army wins it; the next
    army compares against SCN 0x60b + row * 29 + 31 (row + 1's byte 2; past row 8 the
    SCN 0x710 terrain table)."""
    from warlords2.ui.mapview import _rank
    st = mk()
    st.fight_order = [[(r * 29 + t) & 0x7F for t in range(29)] for r in range(9)]
    assert _rank(st, 3, -1) == st.fight_order_byte(3, -1)
    assert _rank(st, 3, 31) == st.fight_order[4][2]
    st.world.terrain_of_tile[:3] = [5, 6, 0x90]
    assert [_rank(st, 8, t) for t in (29, 30, 31)] == [5, 6, 0x90 - 0x100]


# ----------------------------------------------------------------------------- record buffer


def _bonus_types():
    types = default_types()
    types[8] = atype(8, strength=2, str_bonus_open=2)
    types[9] = atype(9, strength=2, str_bonus_open=3)
    types[25] = atype(25, strength=2, stack_bonus_open=2, str_bonus_open=1)
    return types


def test_type_ff_after_a_real_unit_takes_its_strength_words():
    """ovl38:0a9d: 14ac(-1, [bp-0x70]) copies nothing, so the 0xff unit adds the previous
    unit's w6 (open class, 0b79..0b86).  Row 1: type 8 -> 8, type 0xff -> row 0's byte 28."""
    st = mk_state(_bonus_types(), current=1)
    a = put(st, 8, 1, 4, 5)
    f = put(st, -1, 1, 4, 5, strength=3)
    put(st, 1, 2, 5, 5)
    s = combat.prepare(st, (f, a), 5, 5)
    assert s.attackers == [a, f] and s.a_total == 0
    assert s.a_strength == [2 + 2, 3 + 2]


def test_fetch_before_the_aboard_test_still_advances_the_buffer():
    """ovl38:0a9d..0aad fetch, then 0abe aboard test: an aboard unit on Shore gets 4 but its
    record stays in the buffer for the next unit."""
    st = mk_state(_bonus_types(), current=1)
    set_terrain(st, 5, 5, Terrain.SHORE)
    a = put(st, 9, 1, 4, 5, flags=B.ABOARD_FLAG)
    f = put(st, -1, 1, 4, 5, strength=3)
    put(st, 1, 2, 5, 5)
    s = combat.prepare(st, (a, f), 5, 5)
    assert s.attackers == [a, f] and s.a_aboard == [True, False]
    assert s.a_strength == [4, 3 + s.a_total + 3]


def test_type_ff_first_on_side_b_takes_side_a_last_record():
    """0876 after 073b: the defender's 0xff unit reads side A's last record (type 25: stack
    bonus 2 in class 1, 0900..090d); in 0bdc it reads side A's last strength record (w6 = 1)."""
    st = mk_state(_bonus_types(), current=1)
    a = put(st, 25, 1, 4, 5)
    d = put(st, -1, 2, 5, 5, strength=3)
    s = combat.prepare(st, (a,), 5, 5)
    assert s.defenders == [d]
    assert s.d_bonus.stack_bonus == 2 and s.a_bonus.stack_bonus == 2
    assert s.d_total == 2 and s.d_strength == [3 + 2 + 1]


def test_type_ff_first_in_side_a_strengths_takes_side_b_last_record():
    """0a9d after 0876: side A's first strength fetch is a no-op for 0xff, so it keeps side
    B's last bonus-loop record (type 9: w6 = 3)."""
    st = mk_state(_bonus_types(), current=1)
    f = put(st, -1, 1, 4, 5, strength=3)
    put(st, 9, 2, 5, 5)
    s = combat.prepare(st, (f,), 5, 5)
    assert s.a_strength == [3 + s.a_total + 3]


def test_type_ff_before_any_fetch_uses_the_zero_stand_in():
    """Side A's first unit in fight order with type 0xff: [bp-0x70] holds the caller's stack
    contents (not determined); the stand-in is NO_TYPE (zeros, X36)."""
    st = mk_state(_bonus_types(), current=1)
    f = put(st, -1, 1, 4, 5, strength=3)
    s = combat.prepare(st, (f,), 5, 5)                 # unopposed: no defender fetch
    assert s.a_bonus.stack_bonus == 0 and s.a_strength == [3]
    buf = B.RecordBuffer()
    assert buf.fetch(st, -1) is NO_TYPE and buf.fetch(st, 0xFF) is NO_TYPE
    assert buf.fetch(st, 9) is st.army_type(9) and buf.fetch(st, -1) is st.army_type(9)


def test_copy_and_hash_keep_the_type_byte():
    st = mk()
    ci = no_type_city(st)
    engine.apply(st, C.ChooseProduction(ci, -1))
    run_until_made(st, ci)
    cp = st.copy()
    assert cp.hash() == st.hash()
    assert [a.type_id for a in cp.armies] == [a.type_id for a in st.armies]


# ----------------------------------------------------------------------------- EXE bytes


@pytest.mark.gamedata
def test_bytes_below_the_type_flag_table_are_static_zeros(game):
    """DS:45be..45c3 in the EXE image (file 0x33250 + DS) are 0.  The only code writing the
    array that holds them (DS:459a), res_077b:0079 / 00c1, has no caller: checked on the
    capstone listings out/asm/ (overlay call sites resolved through their fixups; the raw file
    is no evidence, its overlay far calls carry the segment only after the fixup)."""
    exe = GameDir(game).read(EXE_NAME)
    assert tuple(exe[0x33250 + 0x45BE:0x33250 + 0x45C4]) == NO_TYPE_FLAGS
    asm = os.path.join(os.path.dirname(__file__), "..", "..", "out", "asm")
    if not os.path.isdir(asm):
        pytest.skip("out/asm listings not generated")
    text = "".join(open(f).read() for f in glob.glob(os.path.join(asm, "*.asm")))
    assert text.count("-> 077b:0020") >= 5                  # control: callers are resolved
    assert "-> 077b:0079" not in text and "-> 077b:00c1" not in text
    near = open(os.path.join(asm, "res_077b.asm")).read()
    assert "call 0x79 " not in near and "call 0xc1 " not in near
