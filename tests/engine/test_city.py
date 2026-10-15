"""rules.city: slots, buying, choosing, delivery, capture outcomes, razing, renaming (EL §6.3, §6.5).

Expected values are worked out by hand from the listings (out/asm/ovl43.asm, ovl44.asm,
ovl31.asm, ovl32.asm, ovl36.asm 0d8d..10cb) and the decompiles of the same functions; the
address each case pins is named in the test.  States are built in memory (test_bonuses factory).
"""
from dataclasses import replace

import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.city import City, Slot
from warlords2.model.ids import EMPTY_SLOT, MAP_ARMY, MAP_W, NO_OWNER, Control, Terrain
from warlords2.rules import city as CT
from warlords2.rules import economy as EC
from warlords2.rules import engine
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.engine import IllegalCommand, NotImplementedCommand

from test_bonuses import army, atype, default_types, mk_state, put, set_terrain
from test_combat import Script


# ----------------------------------------------------------------------------- factory


def econ_types():
    """Types 0..27 with distinct stats; type t: strength 1 + t % 9, turns 1 + t % 4, cost t,
    moves 10 + t, buy price 100 * t (type 0: 0, type 3: -300); hero 28."""
    ts = []
    for t in range(28):
        price = -300 if t == 3 else 100 * t
        ts.append(replace(atype(t, strength=1 + t % 9, turns=1 + t % 4, cost=t, buy_price=price),
                          moves=10 + t))
    return ts + [atype(28, 5)]


def mk(types=None, **opts):
    return mk_state(types or econ_types(), **opts)


def add_city(st, x, y, owner, slots=(), income=0):
    """A 2x2 city with the given slot types (stats copied from ARMYTYPE as at new game)."""
    sl = []
    for t in list(slots) + [EMPTY_SLOT] * (4 - len(slots)):
        if t == EMPTY_SLOT:
            sl.append(Slot())
        else:
            a = st.army_type(t)
            sl.append(Slot(t, a.turns, a.strength, a.moves, a.cost))
    c = City(len(st.cities), x, y, "c", owner, owner, 1, sl, income, 0xFF, 0, 0, 0, (0, 0))
    c.defence = CT.defence_of(c)
    st.cities.append(c)
    for dx in (0, 1):
        for dy in (0, 1):
            set_terrain(st, x + dx, y + dy, Terrain.CITY)
            i = (y + dy) * MAP_W + x + dx
            st.world.flags[i] = (st.world.flags[i] & 0xF0) | (owner & 0x0F)
    return len(st.cities) - 1


def dice(st, values):
    st.rng.src = Script(values)
    return st.rng.src


# ----------------------------------------------------------------------------- slots, buying


def test_defence_by_filled_slots():
    """ovl44:0930: 1 with < 3 filled slot bytes (ovl44:094f counts any slot >= 0), else 2."""
    st = mk()
    assert st.cities == []
    for slots, d in [((), 1), ((1,), 1), ((1, 2), 1), ((1, 2, 5), 2), ((1, 2, 5, 6), 2)]:
        ci = add_city(st, 10, 10, 0, slots)
        assert CT.defence_of(st.cities[ci]) == d
    c = st.cities[add_city(st, 20, 20, 0, (1, 2))]
    c.slots[0].type = EMPTY_SLOT
    c.slots[3] = Slot(5, 1, 1, 1, 1)
    assert CT.filled_slots(c) == 2


def test_buy_fills_next_slot_copies_armytype_and_recomputes_defence():
    """ovl44:0978 picks the first empty slot after the filled run; ovl44:0ee3 copies w0/w1/w2/w3,
    gold -= w4, defence 1 -> 2 at the third slot."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2))
    c = st.cities[ci]
    assert c.defence == 1 and CT.buy_slot(c) == 2
    engine.apply(st, C.BuyProduction(ci, 6))
    s = c.slots[2]
    t = st.army_type(6)
    assert (s.type, s.time, s.strength, s.moves, s.cost) == (6, t.turns, t.strength, t.moves, t.cost)
    assert c.defence == 2
    assert st.players[0].gold == 1000 - 600


def test_buy_offer_and_refusals():
    """ovl44:0dae: offered when w4 >= 0 (0 included, negative not), records 0..27 only; disabled
    when already in a slot or gold < w4 (gold == w4 is allowed)."""
    st = mk()
    assert 3 not in CT.buy_offer(st) and 0 in CT.buy_offer(st) and 28 not in CT.buy_offer(st)
    ci = add_city(st, 10, 10, 0, (1,))
    for t in (3, 28, 1):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.BuyProduction(ci, t))
    st.players[0].gold = 799
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.BuyProduction(ci, 8))
    st.players[0].gold = 800
    engine.apply(st, C.BuyProduction(ci, 8))
    assert st.players[0].gold == 0
    other = add_city(st, 20, 20, 1, ())
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.BuyProduction(other, 2))


def test_buy_into_full_city_replaces_slot_0_and_stops_its_production():
    """ovl44:0978 gives 0 when all four slots are filled; ovl44:0ee3: the running type is gone ->
    +0x2d = 0, +0x31 = 0, target -1/-1, +0x2c = 0xff."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2, 5, 6))
    c = st.cities[ci]
    c.current, c.turns_left, c.vectoring, c.vector_to = 1, 2, 1, (30, 30)
    engine.apply(st, C.BuyProduction(ci, 7))
    assert [s.type for s in c.slots] == [7, 2, 5, 6]
    assert (c.current, c.turns_left, c.vectoring, c.vector_to) == (0xFF, 0, 0, (-1, -1))
    c.current, c.turns_left = 5, 2
    st.players[0].gold = 5000
    engine.apply(st, C.BuyProduction(ci, 9))                 # replaces 7, production 5 kept
    assert (c.current, c.turns_left) == (5, 2)


def test_set_and_stop_production():
    """ovl44:00c8/00ff: +0x2c = slot type, +0x2d = its time, vectoring kept; ovl44:0185 stops."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 6))
    c = st.cities[ci]
    c.vectoring = 1
    engine.apply(st, C.SetProduction(ci, 1))
    assert (c.current, c.turns_left, c.vectoring) == (6, st.army_type(6).turns, 1)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetProduction(ci, 2))             # empty slot
    engine.apply(st, C.SetProduction(ci, -1))
    assert (c.current, c.turns_left, c.vectoring, c.vector_to) == (0xFF, 0, 0, (-1, -1))


# ----------------------------------------------------------------------------- delivery


def producing(st, ci, slot=0):
    engine.apply(st, C.SetProduction(ci, slot))
    return st.cities[ci]


def test_delivery_counts_down_then_makes_the_unit():
    """ovl43:0000: +0x2d -= 1 per own turn; at 0 with gold > 0 ovl43:0dd7 places the unit on the
    first city square with < 8 armies: moves = slot moves, strength = slot strength, home = city,
    upkeep = cost / 2, transit 0xff, army bit set; ovl43:06bd restarts the timer."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (6,))                   # type 6: turns 3, cost 6
    c = producing(st, ci)
    assert c.turns_left == 3
    assert CT.deliver(st) == [] and c.turns_left == 2
    assert CT.deliver(st) == [] and c.turns_left == 1
    ev = CT.deliver(st)
    assert [type(e) for e in ev] == [E.Produced]
    a = army(st, ev[0].info["army"])
    t = st.army_type(6)
    assert (a.type_id, a.owner, a.x, a.y, a.allowance, a.moves_left, a.strength) == (
        6, 0, 10, 10, t.moves, t.moves, t.strength)
    assert (a.home_city, a.upkeep, a.transit, a.flags) == (ci, 3, 0xFF, 1)
    assert st.world.flags[10 * MAP_W + 10] & MAP_ARMY
    assert c.turns_left == 0
    CT.restart_production(st, ev)
    assert c.turns_left == 3


def test_delivery_needs_gold_and_stalls():
    """asm ovl43:0557: no unit unless gold > 0; the timer stays at 0, so nothing follows until a
    production is chosen again (+0x2d > 0 test at ovl43:04f3)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1,))                   # type 1: turns 2
    c = producing(st, ci)
    st.players[0].gold = 0
    CT.deliver(st)
    ev = CT.deliver(st)
    assert [type(e) for e in ev] == [E.ProductionStalled] and ev[0].info["reason"] == "gold"
    st.players[0].gold = 500
    assert CT.deliver(st) == [] and st.armies == [] and c.turns_left == 0


def test_delivery_needs_room():
    """ovl43:0bff with flag 0: the four city squares in DS:0e54/0e5c order, first one with < 8
    armies; none -> nothing made (no random fallback in delivery)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (4,))                   # type 4: turns 1
    for _ in range(8):
        put(st, 1, 0, 10, 10)
    c = producing(st, ci)
    ev = CT.deliver(st)
    assert army(st, ev[0].info["army"]).x == 11 and army(st, ev[0].info["army"]).y == 10
    for x, y in ((11, 10), (10, 11), (11, 11)):
        while len(CT.armies_at(st, x, y)) < 8:
            put(st, 1, 0, x, y)
    c.turns_left = 1
    n = len(st.armies)
    ev = CT.deliver(st)
    assert ev[0].info["reason"] == "room" and len(st.armies) == n


@pytest.mark.parametrize("strength,enhanced,expect", [(5, 0, 5), (5, 1, 7), (8, 1, 9), (9, 1, 9)])
def test_enhanced_produced_strength(strength, enhanced, expect):
    """asm ovl43:0e83..0ecd: Enhanced[SCN 0x110] -> min(slot strength + 2, 9)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (4,))
    st.cities[ci].slots[0].strength = strength
    st.players[0].enhanced = enhanced
    producing(st, ci)
    ev = CT.deliver(st)
    assert army(st, ev[0].info["army"]).strength == expect


@pytest.mark.parametrize("cost,upkeep", [(0, 0), (1, 0), (5, 2), (8, 4), (-3, -1)])
def test_upkeep_is_half_the_slot_cost(cost, upkeep):
    """asm ovl43:0f08..0f16: upkeep = signed slot cost / 2, truncated (cwd; sub; sar)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (4,))
    st.cities[ci].slots[0].cost = cost
    producing(st, ci)
    ev = CT.deliver(st)
    assert army(st, ev[0].info["army"]).upkeep == upkeep


def test_other_sides_cities_wait():
    """ovl43:04d3: only cities owned by SCN 0x110 count down."""
    st = mk()
    ci = add_city(st, 10, 10, 1, (1,))
    st.cities[ci].current, st.cities[ci].turns_left = 1, 1
    assert CT.deliver(st) == [] and st.cities[ci].turns_left == 1


# ----------------------------------------------------------------------------- capture


@pytest.fixture
def quests(monkeypatch):
    calls = []

    def check(state, words):
        calls.append(words)
        return 0, []
    real = CT._hook
    monkeypatch.setattr(CT, "_hook", lambda n: check if n == "quest_event" else
                        (lambda *a: calls.append(("ai_raze",) + a[1:])) if n == "ai_raze" else real(n))
    return calls


def captured(st, ci, attacker=0, owner=1):
    st.pending = E.CityCaptured({"city": ci, "attacker": attacker, "owner": owner})


def test_pillage_value_is_last_slot_half_abs_buy_price():
    """ovl31:0834: |w4| / 2 of slot (filled - 1); a negative buy price counts by its size."""
    st = mk()
    assert CT.pillage_value(st, add_city(st, 10, 10, 0, (2, 7))) == 350
    assert CT.pillage_value(st, add_city(st, 20, 20, 0, (2, 3))) == 150
    assert CT.pillage_value(st, add_city(st, 30, 30, 0, ())) == 0


def test_sack_value_is_all_but_the_first_slot():
    """ovl31:07d0: sum of |w4| / 2 over slots 1 .. filled-1, each halved; 0 with < 2 slots."""
    st = mk()
    assert CT.sack_value(st, add_city(st, 10, 10, 0, (9, 3, 5, 7))) == 150 + 250 + 350
    assert CT.sack_value(st, add_city(st, 20, 20, 0, (9,))) == 0


def test_human_pillage(quests):
    """ovl31:046b: gold += value, last slot emptied (ovl31:0886), defence recomputed, infamy +=
    rnd(1,5,0), quest call ovl01:1ded(1, 0, value, 0, 0)."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2, 6))
    c = st.cities[ci]
    captured(st, ci)
    src = dice(st, [4])
    ev = engine.apply(st, C.CaptureChoice("pillage"))
    assert src.sides == [5]
    assert st.players[0].gold == 1300 and st.players[0].infamy == 4
    assert [s.type for s in c.slots] == [1, 2, EMPTY_SLOT, EMPTY_SLOT] and c.defence == 1
    assert quests == [(1, 0, 300, 0, 0)]
    assert isinstance(ev[0], E.CityPillaged) and st.pending is None


def test_human_sack(quests):
    """ovl31:035e: slots 1.. emptied (ovl31:0941), gold += value, infamy += rnd(1,10,0) + 5."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2, 6))
    c = st.cities[ci]
    captured(st, ci)
    src = dice(st, [7])
    engine.apply(st, C.CaptureChoice("sack"))
    assert src.sides == [10]
    assert st.players[0].gold == 1000 + 100 + 300 and st.players[0].infamy == 12
    assert [s.type for s in c.slots] == [1, EMPTY_SLOT, EMPTY_SLOT, EMPTY_SLOT] and c.defence == 1
    assert quests == [(1, 0, 400, 0, 0)]


def test_treachery_news_written_after_the_answer(quests):
    """A capture made by treachery carries the kind-8 entry of ovl36:2257 (rules.diplomacy
    .treachery): written after the answer and its quest call, not on a refused answer."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (0,))
    captured(st, ci)
    st.pending.info["news_after"] = [0, 8, 0, 1, ""]
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.CaptureChoice("sack"))       # button disabled: nothing written
    assert st.news[0] == []
    engine.apply(st, C.CaptureChoice("occupy"))
    assert quests == [(4, 0, 0, 0x4D, 0x3005)] and st.news[0] == [[8, 0, 1, ""]]


def test_human_buttons_disabled_at_zero(quests):
    """ovl31:0000: pillage (0x11b) and sack (0x11e) disabled when their value is 0."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (0,))                   # w4 = 0
    captured(st, ci)
    for ch in ("pillage", "sack", "loot"):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.CaptureChoice(ch))
    assert st.pending is not None
    engine.apply(st, C.CaptureChoice("occupy"))
    assert quests == [(4, 0, 0, 0x4D, 0x3005)] and st.pending is None


def test_capture_waits_for_the_quest_hook():
    """The ovl01:1ded step belongs to M7a: missing -> NotImplementedCommand before any change."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1, 2))
    captured(st, ci)
    h = st.hash()
    if CT._hook("quest_event") is not None:
        pytest.skip("M7a delivered rules.quests.check; covered by tests/engine/test_quests.py")
    with pytest.raises(NotImplementedCommand):
        engine.apply(st, C.CaptureChoice("pillage"))
    assert st.hash() == h
    with allowing_unverified():
        engine.apply(st, C.CaptureChoice("pillage"))
    assert st.players[0].gold == 1100


def test_raze_cancels_incoming_vectors_and_draws_ruins(quests):
    """ovl31:029f -> ovl32:016b: owner and +0x2f = 0x0f, tiles 0xa0/0xa1/0xb0/0xb1 + 2*owner, every
    city vectoring to it loses vectoring and production; then infamy += rnd(1,15,0) + 10 and
    ovl01:1ded(2, 0, 0, 0, 0)."""
    st = mk()
    ci = add_city(st, 10, 10, 2, (1,))
    st.cities[ci].owner = 2                              # just taken by side 2
    st.current = 2
    st.players[2].control = Control.HUMAN
    src_city = add_city(st, 20, 20, 1, (1,))
    s = st.cities[src_city]
    s.current, s.turns_left, s.vectoring, s.vector_to = 1, 2, 1, (10, 10)
    keep = add_city(st, 30, 30, 1, (1,))
    st.cities[keep].current, st.cities[keep].turns_left = 1, 2
    st.cities[keep].vectoring, st.cities[keep].vector_to = 1, (20, 20)
    captured(st, ci, attacker=2, owner=1)
    dice(st, [15])
    ev = engine.apply(st, C.CaptureChoice("raze"))
    c = st.cities[ci]
    assert (c.owner, c.owner2) == (NO_OWNER, NO_OWNER)
    t = st.world.tiles
    assert [t[10 * MAP_W + 10], t[10 * MAP_W + 11], t[11 * MAP_W + 10], t[11 * MAP_W + 11]] == [
        0xA4, 0xA5, 0xB4, 0xB5]
    assert (s.vectoring, s.vector_to, s.turns_left, s.current) == (0, (0, 0), 0, 0xFF)
    assert st.cities[keep].vectoring == 1 and st.cities[keep].turns_left == 2
    assert st.players[2].infamy == 25
    assert quests == [(2, 0, 0, 0, 0)]
    assert isinstance(ev[0], E.CityRazed) and ev[0].info["infamy"] == 25


def test_computer_choices(quests):
    """ovl19:199c: sack with value 0 falls back to pillage (ovl19:1a2a); pillage with value 0
    does nothing and rolls nothing; raze rolls rnd(1,15,0)+10 and calls ovl29:1851; no quest call."""
    st = mk()
    st.current = 1
    ci = add_city(st, 10, 10, 1, (2,))
    captured(st, ci, attacker=1, owner=0)
    src = dice(st, [3])
    engine.apply(st, C.CaptureChoice("sack"))
    assert src.sides == [5] and st.players[1].gold == 1100 and st.players[1].infamy == 3
    captured(st, ci, attacker=1, owner=0)
    src = dice(st, [])
    engine.apply(st, C.CaptureChoice("pillage"))
    assert src.sides == [] and st.players[1].gold == 1100
    captured(st, ci, attacker=1, owner=0)
    dice(st, [1])
    engine.apply(st, C.CaptureChoice("raze"))
    assert st.players[1].infamy == 3 + 11
    assert quests == [("ai_raze", ci)]


# ----------------------------------------------------------------------------- take-over


@pytest.mark.parametrize("gold,cities,loot", [(1000, 3, 166), (1000, 1, 500), (101, 1, 50),
                                              (7, 2, 1), (0, 4, 0), (-50, 1, 0)])
def test_loot(gold, cities, loot):
    """asm ovl36:0d8d..0e62: loot = gold[d] (<= 1 city) or gold[d] / cities[d]; then
    max(trunc(loot / 2), 0); gold[attacker] += loot, gold[d] -= 2 * loot."""
    st = mk()
    ci = add_city(st, 10, 10, 1, (1,))
    for k in range(1, cities):
        add_city(st, 20 + 3 * k, 20, 1, ())
    st.players[1].gold = gold
    EC.refresh_cities(st)                        # ovl62:03f9 at ovl36:0cb5, before the loot
    ev = CT.take_city(st, ci, 0, 1)
    assert st.players[0].gold == 1000 + loot
    assert st.players[1].gold == gold - 2 * loot
    lo = next(e for e in ev if isinstance(e, E.Looted))
    assert lo.info["loot"] == loot
    assert any(isinstance(e, E.Msg) and (e.group, e.index, e.args) == (0x93, 0, (loot,))
               for e in ev) == (loot > 0)


def test_loot_divides_by_the_stored_city_count():
    """ovl36:0da0 / 0dc5 read DS:5dea[d] (written at 0cb5), not a fresh count; the take-over then
    recounts (10c1): the city has changed hands in the word too."""
    st = mk()
    ci = add_city(st, 10, 10, 1, (1,))
    for k in range(1, 4):
        add_city(st, 20 + 3 * k, 20, 1, ())
    st.players[1].gold = 1000
    EC.refresh_cities(st)
    add_city(st, 40, 40, 1, ())                  # a fifth city the word does not know
    CT.take_city(st, ci, 0, 1)
    assert st.players[1].gold == 1000 - 2 * (1000 // 4 // 2)
    assert st.city_counts[:2] == [1, 4]


def test_neutral_city_has_no_loot_and_computer_gets_no_message():
    st = mk()
    ci = add_city(st, 10, 10, NO_OWNER, (1,))
    ev = CT.take_city(st, ci, 0, NO_OWNER)
    assert st.players[0].gold == 1000 and not any(isinstance(e, E.Msg) for e in ev)
    st.players[0].control = Control.COMPUTER
    ci = add_city(st, 20, 20, 1, (1,))
    ev = CT.take_city(st, ci, 0, 1)
    assert st.players[0].gold == 1500 and not any(isinstance(e, E.Msg) for e in ev)


def test_take_over_city_fields_and_squares():
    """asm ovl36:0e67..0f75: +0x2f = 0x0f when it was the current player, else the old owner;
    +0x30 = 0, owner = attacker, +0x2d = 0, own vectoring off; the four squares lose the army bit
    and get the attacker's nibble and tiles (ovl39:0000)."""
    st = mk()
    ci = add_city(st, 10, 10, 1, (1,))
    c = st.cities[ci]
    c.owner2, c.attacked_by, c.turns_left, c.current, c.vectoring = 5, 1, 2, 1, 1
    for x, y in ((10, 10), (11, 11)):
        st.world.flags[y * MAP_W + x] |= MAP_ARMY
    CT.take_city(st, ci, 0, 1)
    assert (c.owner, c.owner2, c.attacked_by, c.turns_left, c.vectoring) == (0, 1, 0, 0, 0)
    for dx in (0, 1):
        for dy in (0, 1):
            f = st.world.flags[(10 + dy) * MAP_W + 10 + dx]
            assert f & 0x0F == 0 and not f & MAP_ARMY
            assert st.world.tiles[(10 + dy) * MAP_W + 10 + dx] == 0x62 + dx + 0x10 * dy
    d = st.cities[add_city(st, 20, 20, 1, ())]
    d.owner2 = 0
    CT.take_city(st, 1, 0, 1)
    assert d.owner2 == NO_OWNER


def test_take_over_cancels_vectors_to_the_city_but_keeps_units_in_transit():
    """asm ovl36:1011..10b1: cities vectoring to it lose vectoring and production; ovl36:0f99..100f
    deletes only old-owner units with +0xe low nibble 1 (AI-set), so a vectored unit stays in
    transit and is rerouted home on arrival (ovl43:0d4f refuses another side's city)."""
    st = mk()
    dest = add_city(st, 10, 10, 1, ())
    home = add_city(st, 20, 20, 1, (4,))
    h = st.cities[home]
    h.current, h.turns_left, h.vectoring, h.vector_to = 4, 1, 1, (10, 10)
    st.current = 1
    CT.deliver(st)
    unit = st.armies[0]
    assert (unit.x, unit.y, unit.transit, unit.vector_dest) == (-1, -1, 0x65, dest)
    h.turns_left = 1
    st.current = 0
    CT.take_city(st, dest, 0, 1)
    assert (h.vectoring, h.turns_left, h.current) == (0, 0, 0xFF)
    st.current = 1
    CT.deliver(st)
    ev = CT.deliver(st)
    assert unit.transit == 0x65 and unit.vector_dest == home
    assert any(isinstance(e, E.VectorRerouted) for e in ev)


# ----------------------------------------------------------------------------- raze own, rename


def test_raze_own_city():
    """ovl32:0061: infamy += rnd(1,25,0) + 25 first, then ovl32:016b."""
    st = mk()
    ci = add_city(st, 10, 10, 0, (1,))
    src = dice(st, [25])
    engine.apply(st, C.RazeOwnCity(ci))
    assert src.sides == [25] and st.players[0].infamy == 50
    assert st.cities[ci].owner == NO_OWNER and st.world.tiles[10 * MAP_W + 10] == 0xA0
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.RazeOwnCity(ci))


def test_rename():
    """ovl45:2013: own city, at most 15 characters."""
    st = mk()
    ci = add_city(st, 10, 10, 0, ())
    engine.apply(st, C.RenameCity(ci, "x" * 15))
    assert st.cities[ci].name == "x" * 15
    for bad in ("x" * 16, "a\0b", "€"):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.RenameCity(ci, bad))
    other = add_city(st, 20, 20, 1, ())
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.RenameCity(other, "y"))


def test_capture_follows_combat(monkeypatch, quests):
    """The take_city hook of rules/combat.py resolves to this module, and the CityCaptured
    question it leaves is answered by CaptureChoice."""
    from warlords2.rules import combat
    assert combat._hook("take_city") is CT.take_city
    st = mk(default_types())
    ci = add_city(st, 10, 10, 1, ())
    st.players[1].gold = 400
    a = put(st, 1, 0, 9, 11, strength=9)
    put(st, 2, 1, 10, 10, strength=1)
    real = combat._hook
    stub = {"ai_memory": lambda *a: None, "history": lambda *a: [], "medals": lambda *a: [],
            "quest_check": lambda *a: (0, []), "reveal": lambda *a: None,
            "hero_died": lambda *a: [], "add_exp": lambda *a: []}
    monkeypatch.setattr(combat, "_hook", lambda n: stub.get(n) or real(n))
    st.rng.src = Script([20, 1], cycle=True)            # defender misses, attacker hits
    engine.apply(st, C.Attack((a,), 10, 10))
    assert isinstance(st.pending, E.CityCaptured)
    assert st.cities[ci].owner == 0 and st.players[0].gold == 1000 + 200
    engine.apply(st, C.CaptureChoice("occupy"))
    assert st.pending is None


@pytest.mark.gamedata
@pytest.mark.parametrize("name", ["TUTORIA", "ISLADIA"])
def test_capital_production_on_a_shipped_scenario(game, name):
    """New game, then the capital builds its first slot: the unit appears after the slot time
    (ovl43:0000) with the slot's stats and upkeep cost / 2 (ovl43:0dd7), and the human report
    restarts the timer (ovl43:06bd)."""
    from movekit import scenario_state
    st = scenario_state(game, name)
    p = st.current
    ci = st.city_at(*st.players[p].capital)
    c = st.cities[ci]
    if c.slots[0].type < 0:
        engine.apply(st, C.BuyProduction(ci, CT.buy_offer(st)[0]))
    engine.apply(st, C.SetProduction(ci, 0))
    s = c.slots[0]
    st.players[p].gold = max(st.players[p].gold, 1)
    before = {a.id for a in st.armies}
    ev = []
    for _ in range(s.time):
        ev = CT.deliver(st)
    made = [a for a in st.armies if a.id not in before]
    assert len(made) == 1 and made[0].home_city == ci and made[0].upkeep == s.cost // 2
    assert (made[0].type_id, made[0].allowance) == (s.type, s.moves)
    CT.restart_production(st, ev)
    assert c.turns_left == s.time
