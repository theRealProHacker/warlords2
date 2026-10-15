"""ovl29 utilities (ai.md §5) as warlords2.ai.util, pinned to the listing: scan orders, signed
compares, ties, and the record writes."""
import pytest

from warlords2.ai import util as U
from warlords2.model.city import Slot
from warlords2.model.ids import Control, Relation, Terrain
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import diplomacy as D
from warlords2.rules import movement as M

from movekit import add_army, add_city, flat_state, type_with

pytestmark = pytest.mark.gamedata


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)


def high(st):
    st.flags[SCN_ARMY_HIGH] = len(st.armies)


@pytest.fixture
def st(game):
    s = flat_state(game)
    s.ai.allocated = 1
    s.ai[0].simulations = 10
    return s


def test_order_stack_leader_order_bits_and_flags(st):
    """0ae7: leader = first entry with the highest signed fight-order byte of the side on
    turn; +0xe low nibble = kind (bit 4-7 kept), +0xf bits 1-7 = idx, +0x11 = group id from
    0b62:0cde when > 1 entry; +0xc &= ~0xa0 then |= flags; goto by 0c7e; 0c8c:0529."""
    t1, t2 = type_with(st, flag16=0), type_with(st, flag16=1)
    a = add_army(st, t1, 5, 5, flags=0xA1)
    b = add_army(st, t2, 5, 5)
    c = add_army(st, t2, 5, 5)
    a.order = 0x75
    st.fight_order[0][t1], st.fight_order[0][t2] = 3, 9
    city = add_city(st, 20, 20, 0)
    high(st)
    assert U.order_stack(st, [a.id, b.id, c.id] + [-1] * 5, 1, city, 0x100) == 1
    assert st.selection.selected == b.id and st.selection.moving == [a.id, b.id, c.id]
    assert a.order == 0x71 and a.vector_dest == city and a.flags == 0x101
    assert a.group == b.group == c.group != 0
    assert a.goto == b.goto == (21, 21)                           # own city: corner + 1, 0529 copies
    assert U.order_stack(st, [-1] * 8, 1, 0, 0) == 0
    # holes (0b59..0b64: DS:5e3e[i] null in place, also before live entries)
    assert U.order_stack(st, [-1, c.id, -1, a.id] + [-1] * 4, 1, city, 0) == 1
    assert st.selection.moving == [-1, c.id, -1, a.id] and st.selection.selected == c.id
    assert a.group == c.group != 0 and (st.selection.count, st.selection.group) == (2, 1)
    # no fight-order byte beats -1: DS:5e62 keeps its value, null after 14d3 with slot 0 empty
    st.fight_order[0][t1] = st.fight_order[0][t2] = 0x80
    M.select_list(st, [-1, a.id, b.id] + [-1] * 5)
    assert U.order_stack(st, [-1, a.id, b.id] + [-1] * 5, 1, city, 0) == 1
    assert st.selection.selected == -1 and st.selection.moving == [-1, a.id, b.id]


def test_order_stack_kind_minus_one_keeps_orders_and_single_group_zero(st):
    """kind == -1: no order bytes, no goto; one entry: group id 0 is not even written."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 5, 5, flags=0x80)
    a.order, a.vector_dest, a.group = 0x13, 9, 4
    high(st)
    U.order_stack(st, [a.id] + [-1] * 7, -1, 7, 0)
    assert (a.order, a.vector_dest, a.group, a.flags) == (0x13, 9, 4, 0)


def test_order_stack_signed_fight_order(st):
    """0b9d: signed byte compare: a value >= 0x80 never beats -1."""
    t1, t2 = type_with(st, flag16=0), type_with(st, flag16=1)
    a = add_army(st, t1, 5, 5)
    b = add_army(st, t2, 5, 5)
    st.fight_order[0][t1], st.fight_order[0][t2] = 0x90, 0
    high(st)
    U.order_stack(st, [a.id, b.id] + [-1] * 6, -1, 0, 0)
    assert st.selection.selected == b.id


def test_goto_for_order_kinds(st):
    """0c7e / 0d88."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 15, 15)
    own = add_city(st, 30, 30, 0)
    far = add_city(st, 10, 40, 3)
    low = add_city(st, 20, 2, 3)
    U.goto_for_order(st, a, 1, own)
    assert a.goto == (31, 31)
    U.goto_for_order(st, a, 1, far)
    assert a.goto == (11, 40)                    # x 10 < 15 -> 11; y 40 not below 15
    U.goto_for_order(st, a, 1, low)
    assert a.goto == (20, 3)
    a.goto = (1, 2)
    U.goto_for_order(st, a, 4, 0)
    assert a.goto == (1, 2)
    U.goto_for_order(st, a, 0, 0)
    assert a.goto == (15, 15)
    st.items[3].x, st.items[3].y = 40, -1
    U.goto_for_order(st, a, 2, 3)
    assert a.goto == (40, 15)
    st.sites[0].x, st.sites[0].y = 7, 8
    U.goto_for_order(st, a, 3, 0)
    assert a.goto == (7, 8)


def _city_with_slots(st, slots, owner=0):
    c = add_city(st, 30, 30, owner)
    st.cities[c].slots = [Slot(*s) for s in slots] + [Slot() for _ in range(4 - len(slots))]
    return c


def test_set_production_refusal_is_signed_and_waits_for_turn_6(st):
    """0e5a: refuse when cost (signed byte) + 30 > gold (signed) and max(turn, 1) > 5."""
    t = type_with(st, flag16=0)
    c = _city_with_slots(st, [(t, 3, 2, 10, 20)])
    st.players[0].gold = 49
    st.turn = 6
    assert U.set_production(st, c, t, 0, 0) == 0
    st.turn = 5
    assert U.set_production(st, c, t, 0, 0) == 1
    assert (st.cities[c].current, st.cities[c].turns_left, st.cities[c].vectoring) == (t, 3, 0)
    st.turn = 6
    st.players[0].gold = 50
    assert U.set_production(st, c, t, 0, 0) == 1
    st.cities[c].slots[0].cost = 0xC8                # -56 as a signed byte
    st.players[0].gold = 0
    assert U.set_production(st, c, t, 0, 0) == 1
    st.players[0].gold = 0xFFF0                      # -16
    st.cities[c].slots[0].cost = 0
    assert U.set_production(st, c, t, 0, 0) == 0


def test_set_vector_only_for_production_under_way(st):
    """0f10 with 0fd5: +0x2d == 0 or == the slot time -> off and (-1, -1); else on, dest corner."""
    t = type_with(st, flag16=0)
    c = _city_with_slots(st, [(t, 3, 2, 10, 20)])
    d = add_city(st, 50, 60, 0)
    city = st.cities[c]
    city.current, city.turns_left, city.vectoring = t, 3, 1
    assert U.production_in_progress(st, c) == 0
    U.set_vector(st, c, d)
    assert (city.vectoring, city.vector_to) == (0, (-1, -1))
    city.turns_left = 2
    assert U.production_in_progress(st, c) == 1
    U.set_vector(st, c, d)
    assert (city.vectoring, city.vector_to) == (1, (50, 60))
    city.turns_left = 0
    assert U.production_in_progress(st, c) == 0


def test_choose_production_dry_and_set(st):
    """103d: dry -> the pick, nothing set; else 0e5a with vec != -1 and 1 (0 without a pick)."""
    t = type_with(st, flag16=0)
    c = _city_with_slots(st, [(t, 3, 5, 10, 1)])
    st.players[0].gold = 1000
    assert U.choose_production(st, c, 3, -1, 1) == t and st.cities[c].turns_left == 0
    assert U.choose_production(st, c, 3, -1, 0) == 1 and st.cities[c].turns_left == 3
    e = _city_with_slots(st, [])
    assert U.choose_production(st, e, 3, -1, 0) == 0
    assert U.choose_production(st, e, 3, -1, 1) == -1


def test_weakest_slot(st):
    """1ae9: first empty slot at once; else the lowest strength (+2 for w15 == 1), strict <
    from 10 (first wins ties); -1 when all >= 10."""
    plain = next(x.type_id for x in st.army_types if x.cancel_mode != 1 and x.type_id != 28)
    c = _city_with_slots(st, [(plain, 1, 4, 1, 1), (plain, 1, 3, 1, 1), (plain, 1, 3, 1, 1), (plain, 1, 7, 1, 1)])
    assert U.weakest_slot(st, c) == 1
    st.cities[c].slots[2] = Slot()
    assert U.weakest_slot(st, c) == 2
    st.cities[c].slots = [Slot(plain, 1, 10, 1, 1)] * 4
    assert U.weakest_slot(st, c) == -1
    w15 = [x.type_id for x in st.army_types if x.cancel_mode == 1]
    if w15:
        st.cities[c].slots = [Slot(w15[0], 1, 2, 1, 1), Slot(plain, 1, 3, 1, 1)] + [Slot(plain, 1, 9, 1, 1)] * 2
        assert U.weakest_slot(st, c) == 1           # 2 + 2 = 4 > 3


def test_buy_flying_slot(st):
    """11d5: the first type t = 0..28 that flies, has w13 == 0 and is affordable (gold >= price
    + 30, signed) goes into 1ae9's slot; gold -= price; flag bit 2; +0x2d = 0; +0x31 = 0."""
    plain = type_with(st, flag16=0)
    flyers = [x for x in sorted(st.army_types, key=lambda x: x.type_id)
              if x.flag16 & 0xFF and not x.special & 0xFF]
    cheapest = min(x.buy_price for x in flyers)
    c = _city_with_slots(st, [(plain, 1, 4, 1, 1), (plain, 1, 2, 1, 1)])
    city = st.cities[c]
    city.turns_left, city.vectoring = 2, 1
    st.players[0].gold = cheapest + 29
    U.buy_flying_slot(st, c)
    assert city.slots[2].type == -1 and st.players[0].gold == cheapest + 29 and city.turns_left == 2
    gold = flyers[0].buy_price + 30
    st.players[0].gold = gold
    want = next(x for x in flyers if x.buy_price + 30 <= gold)
    U.buy_flying_slot(st, c)
    assert city.slots[2] == Slot(want.type_id, want.turns, want.strength, want.moves, want.cost)
    assert st.players[0].gold == gold - want.buy_price and st.ai[0].city_flags[c] & 2
    assert (city.turns_left, city.vectoring) == (0, 0)
    st.players[0].gold = 30000
    U.buy_flying_slot(st, c)                         # slot 3 is the first empty one
    assert city.slots[3].type == flyers[0].type_id
    U.buy_flying_slot(st, c)                         # full: the weakest, slot 1 (strength 2)
    assert city.slots[1].type == flyers[0].type_id


def test_fill_slot_is_the_one_ovl44_1299(st, monkeypatch):
    """ovl44:1299(c, s, r): the record's five bytes into slot s, defence 0930, gold -= w4 (word);
    both AI purchases (ovl29:11d5 at 1280, ovl25:0bd1 at 0c3c) go through it."""
    from warlords2.ai.phases import rebuilding as RB
    from warlords2.rules.city import defence_of
    plain = type_with(st, flag16=0)
    c = _city_with_slots(st, [(plain, 1, 4, 1, 1)])
    city, rec = st.cities[c], st.army_type(plain)
    st.players[0].gold = 5
    U.fill_slot(st, c, 1, rec)
    assert city.slots[1] == Slot(rec.type_id, rec.turns, rec.strength, rec.moves, rec.cost)
    assert city.defence == defence_of(city) and st.players[0].gold == 5 - rec.buy_price
    seen = []
    monkeypatch.setattr(U, "fill_slot", lambda s, cc, k, r: seen.append(("11d5", cc, k)))
    monkeypatch.setattr(RB, "fill_slot", lambda s, cc, k, r: seen.append(("0bd1", cc, k)))
    st.players[0].gold = 30000
    U.buy_flying_slot(st, c)
    RB.buy_slot(st, plain, c)
    assert seen == [("11d5", c, U.weakest_slot(st, c)), ("0bd1", c, U.weakest_slot(st, c))]


def test_select_square_scan_and_filters(st):
    """12c9: own armies on (x, y) from SCN 0x181 - 1 down, at most 8, moves >= minmoves
    (signed) when minmoves != 0; 14d3 selects them.  13b2: sub / kind order bits, allowance."""
    t = type_with(st, flag16=0)
    arm = [add_army(st, t, 7, 7, moves=m) for m in (5, 1, 0xFF, 3)]
    add_army(st, t, 7, 7, owner=2)
    add_army(st, t, 8, 7)
    high(st)
    n, out = U.select_square(st, 7, 7)
    assert n == 4 and out == [arm[3].id, arm[2].id, arm[1].id, arm[0].id] + [-1] * 4
    assert st.selection.selected == arm[3].id and st.selection.moving == out[:4]
    n, out = U.select_square(st, 7, 7, 3)
    assert out[:n] == [arm[3].id, arm[0].id]               # 0xff = -1 < 3
    arm[0].order, arm[3].order = 0x21, 0x21
    arm[1].order = 0x11
    arm[3].allowance = 4
    arm[0].allowance = 9
    n, out = U.select_square_order(st, 7, 7, 2, 1)
    assert out[:n] == [arm[3].id, arm[0].id]
    n, out = U.select_square_order(st, 7, 7, 2, 1, 5)
    assert out[:n] == [arm[0].id]
    for _ in range(10):
        add_army(st, t, 9, 9)
    high(st)
    assert U.select_square(st, 9, 9)[0] == 8


def test_win_odds_counts_defender_wipes(st, monkeypatch):
    """15c5: n = AI[+0x20] (>= 1 signed, else 1) simulations; wins = no defender left;
    wins * 100 idiv n."""
    res = iter([0, 1, 0, 2, 0, 0, 3])
    monkeypatch.setattr(U, "simulate_selection", lambda s, x, y: (3, next(res), 1, 1))
    st.ai[0].simulations = 7
    assert U.win_odds(st, 1, 1) == 57
    monkeypatch.setattr(U, "simulate_selection", lambda s, x, y: (3, 0, 1, 1))
    st.ai[0].simulations = 0xFFFF
    assert U.win_odds(st, 1, 1) == 100


def test_count_square_any_owner(st):
    """1626: every record on the square, signed strength sum, heroes (type 0x1c)."""
    t = type_with(st, flag16=0)
    add_army(st, t, 4, 4).strength = 3
    add_army(st, t, 4, 4, owner=5).strength = 0xFE
    add_army(st, 28, 4, 4)
    high(st)
    n, s, h = U.count_square(st, 4, 4)
    assert (n, h) == (3, 1) and s == 3 - 2 + st.army_type(28).strength


class DM:
    def __init__(self, v):
        self.v = v

    def value(self, x, y):
        return self.v.get((x, y), 30000)


def test_best_target_scoring_and_skips(st, monkeypatch):
    """1885: skips (own with flag, not intact, quest city, unseen, foreign side not at war,
    unreachable); own city p = 15, d + 20; scores 400 - d + 10p (p > 50 and d < DS:5e00),
    100 - d + 5p (p > 10), -2; strict > from -1, highest index wins ties."""
    odds = {}
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: odds[(x, y)])
    cs = [add_city(st, 10 + 10 * i, 10, o) for i, o in enumerate((0x0F, 3, 3, 0, 0x0F, 0x0F, 0x0F))]
    D.set_current(st, 3, 0, Relation.WAR)
    st.selection.moves = 20
    dm = DM({(st.cities[c].x, st.cities[c].y - 1): d for c, d in zip(cs, (5, 6, 7, 8, 9, 10, 11))})
    odds.update({(st.cities[c].x, st.cities[c].y): p for c, p in zip(cs, (60, 60, 20, 0, 5, 60, 60))})
    st.ai[0].quest_city = cs[6]
    st.ai[0].city_flags[cs[5]] = 1
    # c0: 400 - 5 + 600 = 995; c1 (war): 994; c2: 100 - 7 + 100 = 193; c3 own: p 15 d 28 -> 100-28+75 = 147
    assert U.best_target(st, 0, dm) == cs[0]
    odds[(st.cities[cs[0]].x, 10)] = 60
    dm.v[(st.cities[cs[1]].x, 9)] = 5                # c1 = c0 = 995: the higher index wins
    assert U.best_target(st, 0, dm) == cs[1]
    D.set_current(st, 3, 0, Relation.NEUTRAL)
    assert U.best_target(st, 0, dm) == cs[0]
    st.selection.moves = 5                           # d < DS:5e00 fails: 100 - 5 + 300 = 395
    assert U.best_target(st, 0, dm) == cs[0]
    for c in (cs[0], cs[1], cs[2]):
        st.world.tiles[st.cities[c].y * 112 + st.cities[c].x] = int(Terrain.PLAIN)
    assert U.best_target(st, 0, dm) == cs[3]         # own city 147 beats -2 (c4: p 5)
    assert U.best_target(st, 1, dm) == -1            # flag: own skipped, c4 scores -2


def test_retarget_draws_the_human_roll_also_when_at_war(st, monkeypatch):
    """1771: 15c5 first; for a human owner rnd(1,4,-1) even when at war (ok already 1); ok and
    p > 50 -> the city; else 1885 on the 15-ring distance map from the leader."""
    t = type_with(st, flag16=0)
    lead = add_army(st, t, 30, 30)
    high(st)
    st.selection.selected, st.selection.moving = lead.id, [lead.id]
    st.selection.mode, st.selection.mask = 1, 0
    c = add_city(st, 40, 40, 3)
    st.players[3].control = Control.HUMAN
    D.set_current(st, 3, 0, Relation.WAR)
    odds = iter([60])
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: next(odds))
    st.rng = Rec(st.rng, [2])
    assert U.retarget(st, c, 40, 40) == c and st.rng.calls == [(1, 4, -1)]
    D.set_current(st, 3, 0, Relation.PEACE)
    seen = []
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: 90)
    monkeypatch.setattr(U, "best_target", lambda s, flag, dm: seen.append(flag) or -1)
    st.rng = Rec(st.rng, [1])
    assert U.retarget(st, c, 40, 40) == c and seen == [0]
    st.rng = Rec(st.rng, [0])
    st.players[3].control = Control.COMPUTER
    assert U.retarget(st, c, 40, 40) == c and st.rng.calls == [] and seen == [0, 0]


def test_can_build_decent(st):
    """1a4d: 103d(c, 3, -1, dry); 0 when AI[+0x02] > 11 and strength < 3 or > 7 and < 2."""
    plain = next(x.type_id for x in st.army_types if x.cancel_mode != 1 and x.flag16 == 0 and x.type_id != 28)
    c = _city_with_slots(st, [(plain, 2, 2, 10, 1)])
    st.ai[0].own_cities = 12
    assert U.can_build_decent(st, c) == (0, 0)
    st.ai[0].own_cities = 11
    assert U.can_build_decent(st, c) == (1, 0)
    st.cities[c].slots[0].strength = 1
    assert U.can_build_decent(st, c) == (0, 0)
    st.ai[0].own_cities = 7
    assert U.can_build_decent(st, c) == (1, 0)
    e = _city_with_slots(st, [])
    assert U.can_build_decent(st, e) == (0, None)


def test_nearest_claimed_city(st):
    """0a27: intact, claim byte == claim, strict < from 1000 over count-1..0."""
    a = add_city(st, 10, 10, 0)
    b = add_city(st, 30, 10, 0)
    for c in (a, b):
        st.cities[c].owner2 = 0x0F
    assert U.nearest_claimed_city(st, 20, 10, 0x0F) == b      # equal distance: higher index
    st.cities[b].owner2 = 2
    assert U.nearest_claimed_city(st, 20, 10, 0x0F) == a
    assert U.nearest_claimed_city(st, 20, 10, 5) == -1
