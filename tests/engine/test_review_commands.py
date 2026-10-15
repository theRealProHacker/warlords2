"""Commands added after the M5b / M6b / M7b dialog reviews: BuyProduction.slot, SortSlots,
ChooseProduction, RedirectVectors (X35), ScreenTutorial (X09), Advise (X34), TakeAll,
QuestPage and the quest page's army bits, plus the delivery map refresh (ovl43:0760) and the
+0xe low nibble of arrivals / captures.

Expected values are read off the listings named in each test (out/asm/ovl44.asm, ovl45.asm,
ovl36.asm, ovl34.asm, ovl01.asm, ovl63.asm, ovl43.asm).  States are built in memory.
"""
import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.state import ReportEntry
from warlords2.model.city import Slot
from warlords2.model.ids import EMPTY_SLOT, HERO_TYPE, MAP_ARMY, MAP_W, ROAD_STANDARD, Control, ItemState, Terrain
from warlords2.model.item import Item
from warlords2.rules import economy as EC
from warlords2.rules import city as CT
from warlords2.rules import combat
from warlords2.rules import engine
from warlords2.rules import quests as Q
from warlords2.rules import vectoring as V
from warlords2.rules.engine import IllegalCommand
from warlords2.rules.mapwords import army_bits

from test_bonuses import put, set_terrain
from test_city import add_city, dice, mk

TUT, BYTE = 0x12E, 0x134


def flags_at(st, x, y):
    return st.world.flags[y * MAP_W + x]


# ----------------------------------------------------------------------------- BuyProduction.slot


def test_buy_into_the_default_slot_without_slot_argument():
    """slot None = buy_slot (DS:0e86 from ovl44:0978); existing callers unchanged."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1,))
    engine.apply(st, C.BuyProduction(ci, 2))
    assert [s.type for s in st.cities[ci].slots] == [1, 2, EMPTY_SLOT, EMPTY_SLOT]


def test_buy_slot_must_be_dS0e86_unless_slot_3_is_filled():
    """ovl44:0dae 0dd5..0e11: 397-400 enabled only when slot 3 holds a type; before that the
    only reachable DS:0e86 is ovl44:0978's (and its +1 steps, which equal buy_slot again)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1,))
    st.players[0].gold = 5000
    for bad in (0, 2, 3, 4, -1):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.BuyProduction(ci, 2, bad))
    engine.apply(st, C.BuyProduction(ci, 2, 1))
    engine.apply(st, C.BuyProduction(ci, 4, 2))              # 10c8..10e7: DS:0e86 -> 2
    engine.apply(st, C.BuyProduction(ci, 5, 3))
    assert [s.type for s in st.cities[ci].slots] == [1, 2, 4, 5]


def test_buy_into_any_slot_of_a_full_city_writes_the_five_fields():
    """ovl44:1112 sets DS:0e86 to 0..3; 0ee3 writes type, w1 time, w2 cost, w0 strength,
    w3 moves into that slot (0f4c..0fdc), defence (0fe6), gold -= w4 (101c)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2, 4, 5))
    st.players[0].gold = 1000
    engine.apply(st, C.BuyProduction(ci, 6, 2))
    t = st.army_type(6)
    s = st.cities[ci].slots[2]
    assert (s.type, s.time, s.strength, s.moves, s.cost) == (6, t.turns, t.strength, t.moves, t.cost)
    assert [x.type for x in st.cities[ci].slots] == [1, 2, 6, 5]
    assert st.players[0].gold == 1000 - t.buy_price and st.cities[ci].defence == 2


def test_buy_replacing_the_running_type_stops_production_and_vectoring():
    """1026..10c2: +0x2d > 0 and the old +0x2c in no slot -> +0x2d 0, +0x31 0, target -1/-1,
    +0x2c 0xff."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2, 4, 5))
    c = st.cities[ci]
    c.current, c.turns_left, c.vectoring, c.vector_to = 4, 2, 1, (20, 20)
    engine.apply(st, C.BuyProduction(ci, 6, 2))
    assert (c.turns_left, c.vectoring, c.vector_to, c.current) == (0, 0, (-1, -1), 0xFF)


# ----------------------------------------------------------------------------- SortSlots


def test_sort_slots_leading_run_by_abs_price_strict_and_stable():
    """ovl44:1544: keys |w4| (type 3 has w4 = -300 -> 300); strict < keeps equal keys in order;
    only the leading filled run; all five bytes move together."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (5, 3, 2))
    c = st.cities[ci]
    c.slots[0].time = 77
    c.slots[2], c.slots[3] = Slot(EMPTY_SLOT, 4, 4, 4, 4), Slot(1, 9, 9, 9, 9)   # run = slots 0, 1
    c.current = 5
    engine.apply(st, C.SortSlots(ci))
    assert [s.type for s in c.slots] == [3, 5, EMPTY_SLOT, 1]
    assert c.slots[1].time == 77 and c.slots[2].time == 4 and c.current == 5


def test_sort_slots_equal_keys_keep_their_order():
    from dataclasses import replace
    st = mk()
    st.army_types[7] = replace(st.army_types[7], buy_price=-200)    # |w4| 200 == type 2's
    ci = add_city(st, 10, 10, 0, (7, 2, 1))
    engine.apply(st, C.SortSlots(ci))
    assert [s.type for s in st.cities[ci].slots][:3] == [1, 7, 2]


def test_sort_slots_does_nothing_when_slot_0_is_empty():
    st = mk()
    ci = add_city(st, 10, 10, 0, ())
    c = st.cities[ci]
    c.slots[1], c.slots[2] = Slot(5, 1, 1, 1, 1), Slot(1, 2, 2, 2, 2)
    engine.apply(st, C.SortSlots(ci))
    assert [s.type for s in c.slots] == [EMPTY_SLOT, 5, 1, EMPTY_SLOT]


# ----------------------------------------------------------------------------- ChooseProduction


def test_choose_minus_one_takes_the_first_empty_slots_time_byte():
    """ovl44:00ff with DS:0e9e = -1: ovl44:0000 finds the first slot of type byte 0xff; +0x2c =
    0xff, +0x2d = that slot's time byte (the scenario file's, EL §9.4); vectoring kept."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1,))
    c = st.cities[ci]
    c.slots[1].time, c.slots[2].time = 5, 6
    c.vectoring, c.vector_to = 1, (3, 3)
    engine.apply(st, C.ChooseProduction(ci, -1))
    assert (c.current, c.turns_left, c.vectoring, c.vector_to) == (0xFF, 5, 1, (3, 3))


def test_choose_minus_one_in_a_full_city_uses_slot_0():
    """ovl44:0000: no match -> index 0."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2, 4, 5))
    engine.apply(st, C.ChooseProduction(ci, -1))
    assert st.cities[ci].turns_left == st.cities[ci].slots[0].time


def test_choose_a_slot_type_and_refuse_others():
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2))
    engine.apply(st, C.ChooseProduction(ci, 2))
    assert (st.cities[ci].current, st.cities[ci].turns_left) == (2, st.army_type(2).turns)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.ChooseProduction(ci, 4))


@pytest.mark.gamedata
def test_new_game_keeps_the_file_bytes_of_empty_slots(game):
    """ovl53:0a75 rewrites the statistics of filled slots only; the empty slots keep the
    record's bytes (+0x1a + s etc.), which ovl44:00ff reads."""
    from pathlib import Path
    import struct
    from movekit import scenario_state
    d = (Path(game) / "TUTORIA" / "TUTORIA.SCN").read_bytes()
    st = scenario_state(game, "TUTORIA")
    seen = 0
    for i, c in enumerate(st.cities):
        r = d[0x157D + 65 * i:0x157D + 65 * i + 65]
        for s, slot in enumerate(c.slots):
            if slot.type == EMPTY_SLOT and r[22 + s] == 0xFF:
                assert (slot.time, slot.strength, slot.moves, slot.cost) == \
                    (r[26 + s], r[30 + s], r[34 + s], r[38 + s])
                seen += 1
    assert seen and struct.unpack_from("<H", d, 0x157B)[0] == len(st.cities)


# ----------------------------------------------------------------------------- RedirectVectors


def running(st, ci, to):
    c = st.cities[ci]
    c.current, c.turns_left, c.vectoring = c.slots[0].type, 1, 1
    c.vector_to = (st.cities[to].x, st.cities[to].y)


def test_redirect_writes_only_the_targets_of_every_source():
    """ovl44:072e 07d8..086b: each source of DS:0e98 gets +0x33 / +0x35 = the new city's x, y;
    +0x31 and +0x2d are not read or written (a stalled source keeps vectoring)."""
    st = mk()
    a, b, s1, s2 = (add_city(st, 10 * k, 10, 0, (1,)) for k in range(1, 5))
    running(st, s1, a)
    running(st, s2, a)
    st.cities[s2].turns_left = 0                 # stalled source
    engine.apply(st, C.RedirectVectors(a, b))
    for s in (s1, s2):
        c = st.cities[s]
        assert c.vector_to == (st.cities[b].x, st.cities[b].y) and c.vectoring == 1
    assert st.cities[s2].turns_left == 0


def test_redirect_to_the_standard_writes_minus_two():
    st = mk()
    a, s1 = add_city(st, 10, 10, 0, (1,)), add_city(st, 20, 10, 0, (1,))
    running(st, s1, a)
    st.items = [Item("std", 8, 0, int(ItemState.ON_MAP), 0, 30, 30)]
    st.world.roads[30 * MAP_W + 30] |= ROAD_STANDARD
    engine.apply(st, C.RedirectVectors(a, 100))
    assert st.cities[s1].vector_to == (-2, -2)


def test_redirect_guards():
    """0797..07d3: n > 0, n + m <= 4 (m = sources already at the destination, ovl44:0410), the
    destination not among the sources; otherwise nothing is written (refused here)."""
    st = mk()
    cs = [add_city(st, 6 * k, 10, 0, (1,)) for k in range(1, 9)]
    a, b = cs[0], cs[1]
    with pytest.raises(IllegalCommand):                       # no source
        engine.apply(st, C.RedirectVectors(a, b))
    running(st, cs[2], a)
    running(st, cs[3], a)
    with pytest.raises(IllegalCommand):                       # destination is a source
        engine.apply(st, C.RedirectVectors(a, cs[2]))
    running(st, cs[4], b)
    running(st, cs[5], b)
    running(st, cs[6], b)
    h = st.hash()
    with pytest.raises(IllegalCommand):                       # 2 + 3 > 4
        engine.apply(st, C.RedirectVectors(a, b))
    assert st.hash() == h
    st.cities[cs[6]].vectoring = 0
    engine.apply(st, C.RedirectVectors(a, b))                 # 2 + 2 == 4
    assert V.vector_count(st, b) == 4


# ----------------------------------------------------------------------------- ScreenTutorial


def pages(ev):
    return [e.info["file"] for e in ev if isinstance(e, E.TurnCue) and e.info["kind"] == "tutorial"]


def test_screen_tutorial_open_pages_in_order_and_once():
    """ovl45:025d..02da: bit 0x02 -> (25, 1), then bit 0x20 with >= 2 own cities -> (25, 6)."""
    st = mk()
    st.flags[TUT], st.flags[BYTE] = 1, 0
    add_city(st, 10, 10, 0, (1,))
    EC.refresh_cities(st)                        # DS:5dea, the word ovl45:02b6 reads
    assert pages(engine.apply(st, C.ScreenTutorial(False))) == [(25, 1)]
    assert st.flags[BYTE] == 0x02
    add_city(st, 20, 10, 0, (1,))
    assert pages(engine.apply(st, C.ScreenTutorial(False))) == []          # the word says 1
    EC.refresh_cities(st)
    assert pages(engine.apply(st, C.ScreenTutorial(False))) == [(25, 6)]
    assert pages(engine.apply(st, C.ScreenTutorial(False))) == []
    assert st.flags[BYTE] == 0x22


def test_screen_tutorial_both_open_pages_at_once_then_close():
    st = mk()
    st.flags[TUT], st.flags[BYTE] = 1, 0x40
    add_city(st, 10, 10, 0, (1,))
    add_city(st, 20, 10, 0, (1,))
    EC.refresh_cities(st)
    assert pages(engine.apply(st, C.ScreenTutorial(False))) == [(25, 1), (25, 6)]
    assert pages(engine.apply(st, C.ScreenTutorial(True))) == [(25, 2)]
    assert pages(engine.apply(st, C.ScreenTutorial(True))) == []
    assert st.flags[BYTE] == 0x66


def test_screen_tutorial_off_without_scn_12e():
    st = mk()
    st.flags[TUT], st.flags[BYTE] = 0, 0
    assert engine.apply(st, C.ScreenTutorial(False)) == [] and st.flags[BYTE] == 0


# ----------------------------------------------------------------------------- delivery


def test_restart_after_an_arrival_rebuilds_the_army_bits():
    """ovl43:06bd ends with ovl62:0000 (ovl43:0760); the human turn runs it when ovl43:0000
    counted a report entry (an arrival, inc at 04ac)."""
    st = mk()
    a = put(st, 1, 0, 30, 30)
    st.armies[a].x, st.armies[a].y = 40, 40                    # placed without its bit
    assert not flags_at(st, 40, 40) & MAP_ARMY
    CT.restart_production(st)                                  # count 0: no 06bd
    assert not flags_at(st, 40, 40) & MAP_ARMY
    st.production_report.append(ReportEntry(0, 1, 0, 0, a))    # an arrival (kind 0)
    CT.restart_production(st)
    assert flags_at(st, 40, 40) & MAP_ARMY and not flags_at(st, 30, 30) & MAP_ARMY


def test_arrival_clears_the_order_nibble():
    """ovl43:048f..0495: +0xe &= 0xf0 on arrival."""
    st = mk()
    a = st.armies[put(st, 1, 0, 0, 0)]
    a.order = 0x91
    V._place(a, 5, 5)
    assert a.order == 0x90


def test_capture_frees_the_old_owners_ai_vectored_armies():
    """ovl36:0fca..0fd5: x == -1, +0xe & 0xf == 1, +0xf >> 1 == the city -> 0b62:03be."""
    st = mk()
    ci = add_city(st, 10, 10, 1, (1,))
    keep, gone = st.armies[put(st, 1, 1, 0, 0)], st.armies[put(st, 1, 1, 0, 0)]
    for a, order in ((keep, 0x02), (gone, 0x31)):
        a.x, a.y, a.vector_dest, a.order = -1, -1, ci, order
    put(st, 2, 0, 10, 10)
    CT.take_city(st, ci, 0, 1)
    assert gone.owner == 0xFF and keep.owner == 1


# ----------------------------------------------------------------------------- quest page


def quest_state(qtype, hero_ok=True):
    st = mk()
    h = put(st, HERO_TYPE, 0, 10, 10)
    q = st.players[0].quest
    q.active, q.type, q.hero = 1, qtype, h
    if not hero_ok:
        st.armies[h].x = -1
    return st, h


def test_quest_page_types_2_and_3_rebuild_the_army_bits():
    """ovl01:0320 cases 06fe / 0788 -> ovl63:158d: bit 0x10 cleared on the whole map, set for
    every army with x, y >= 0; other types and the owner nibbles untouched; no dice."""
    for qtype, rebuilt in ((2, True), (3, True), (0, False), (4, False)):
        st, h = quest_state(qtype)
        i = 5 * MAP_W + 5
        st.world.flags[i] = (st.world.flags[i] & 0xF0) | MAP_ARMY | 0x03     # stale bit
        src = dice(st, [])
        assert engine.apply(st, C.QuestPage()) == []
        assert bool(flags_at(st, 5, 5) & MAP_ARMY) is not rebuilt
        assert flags_at(st, 5, 5) & 0x0F == 0x03 and flags_at(st, 10, 10) & MAP_ARMY
        assert src.sides == []


def test_no_quest_line_draws_from_group_20():
    """ovl01:0167: no active quest, or the hero record off the map / not a hero -> STRING
    (20, -1) at 0244: rnd(1, 4, -1)."""
    st = mk()
    src = dice(st, [3])
    assert engine.apply(st, C.QuestPage()) == [E.Msg(group=20, index=2)] and src.sides == [4]
    st, h = quest_state(2, hero_ok=False)
    src = dice(st, [1])
    assert engine.apply(st, C.QuestPage()) == [E.Msg(group=20, index=0)]


def test_army_bits_skip_for_a_computer_side_on_a_hidden_map():
    """ovl63:159a..15c5: SCN 0x124 set, SCN 0xd0[p] != 0 and SCN 0x159 == 0 -> nothing."""
    st = mk(hidden_map=1)
    st.players[0].control = Control.COMPUTER
    st.world.flags[5 * MAP_W + 5] |= MAP_ARMY
    army_bits(st)
    assert flags_at(st, 5, 5) & MAP_ARMY
    st.flags[0x159] = 1
    army_bits(st)
    assert not flags_at(st, 5, 5) & MAP_ARMY


def test_quest_page_refused_for_a_computer_side():
    st = mk()
    st.players[0].control = Control.COMPUTER
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.QuestPage())


@pytest.mark.gamedata
def test_new_text_roll_counts_are_string_dat_groups(game):
    from pathlib import Path
    from warlords2.formats.tables import StringTable
    from warlords2.rules.constants import combat as KC, heroes as KH
    t = StringTable((Path(game) / "DATA" / "STRING.DAT").read_bytes())
    assert (len(t.groups[0x7C]), len(t.groups[0x7D])) == KC.ADVISOR_TEXT_COUNTS.value
    assert (len(t.groups[158]), len(t.groups[160])) == KH.MEDAL_TEXT_COUNTS.value
    assert len(t.groups[20]) == KH.NO_QUEST_COUNT.value


# ----------------------------------------------------------------------------- Advise


def test_advise_runs_the_trials_then_the_two_text_rolls(monkeypatch):
    """ovl36:1fd3 2065 (odds on the selection), then (0x7c, -1) at 1ff0 and (0x7d, -1) at 200e."""
    st = mk(military_advisor=1)
    a = put(st, 1, 0, 10, 10)
    put(st, 2, 1, 11, 10)
    st.selection.selected, st.selection.moving = a, [a]
    calls = []

    def odds(state, group, x, y):
        calls.append((list(group), x, y, list(state.rng.src.sides)))
        return 7
    monkeypatch.setattr(combat, "odds", odds)
    src = dice(st, [2, 5])
    ev = engine.apply(st, C.Advise(11, 10))
    assert calls == [([a], 11, 10, [])] and src.sides == [5, 5]
    assert ev == [E.Advised({"x": 11, "y": 10, "verdict": 7, "texts": (1, 4)})]


def test_advise_with_the_option_off_does_nothing():
    """ovl36:1f24..1f2c: SCN 0x12c == 0 -> return before any roll."""
    st = mk(military_advisor=0)
    a = put(st, 1, 0, 10, 10)
    st.selection.selected, st.selection.moving = a, [a]
    h = st.hash()
    assert engine.apply(st, C.Advise(11, 10)) == [] and st.hash() == h


# ----------------------------------------------------------------------------- TakeAll


def take_state():
    st = mk()
    st.items = [Item("s%d" % i, 8, 1, int(ItemState.NOT_IN_PLAY), 0, 0, 0) for i in range(8)]
    st.items += [Item("i%d" % i, 1, 1, int(ItemState.NOT_IN_PLAY), 0, 0, 0) for i in range(8, 22)]
    h = put(st, HERO_TYPE, 0, 10, 10)
    other = put(st, 1, 0, 10, 10)
    st.selection.selected, st.selection.moving, st.selection.hero = h, [h, other], h
    for i, at in ((3, (10, 10)), (12, (10, 10)), (9, (10, 10)), (15, (11, 10))):
        st.items[i].state, st.items[i].x, st.items[i].y = int(ItemState.ON_MAP), *at
    st.world.roads[10 * MAP_W + 10] |= ROAD_STANDARD
    return st, h


def test_take_all_in_table_order_without_the_road_bit():
    """ovl34:186e: ovl51:03d9 mode 3 (items 0..21 lying on the hero's square, table order);
    holder and state 3 only - road bit 0x40 kept (take ovl47:08c7 would clear it)."""
    st, h = take_state()
    ev = engine.apply(st, C.TakeAll(h))
    assert [e.info["item"] for e in ev if isinstance(e, E.ItemTaken)] == [3, 9, 12]
    for i in (3, 9, 12):
        assert (st.items[i].state, st.items[i].holder) == (int(ItemState.CARRIED), h)
    assert st.items[15].state == int(ItemState.ON_MAP)
    assert st.world.roads[10 * MAP_W + 10] & ROAD_STANDARD


def test_take_all_runs_the_item_quest_check_once(monkeypatch):
    st, h = take_state()
    calls = []
    monkeypatch.setattr(Q, "check", lambda state, words: calls.append(tuple(words)) or (0, []))
    engine.apply(st, C.TakeAll(h))
    assert calls == [(3, 0, 0, 0, 0)]


def test_take_all_needs_the_selected_hero():
    st, h = take_state()
    st.selection.hero = -1
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.TakeAll(h))
