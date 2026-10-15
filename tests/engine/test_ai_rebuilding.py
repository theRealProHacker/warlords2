"""ovl25:0af2 / 0c83 / 0bd1 rebuilding (ai.md §6.17) as warlords2.ai.phases.rebuilding, pinned
to the listing: the quota gate, the 500 / 2000 gold tests, the role switch of 0c83 (table
ovl25:0daf), ties, the strict purchase test and the slot write; no rnd."""
import pytest

from warlords2.ai.phases import rebuilding as RB
from warlords2.model.city import Slot

from movekit import add_city, flat_state

pytestmark = pytest.mark.gamedata

PEGASI, LINF, GIANTS = 8, 2, 0


class NoDice:
    def rnd(self, *a):
        raise AssertionError("rebuilding draws no rnd: %r" % (a,))


@pytest.fixture
def st(game):
    s = flat_state(game)
    s.ai.allocated = 1
    s.rng = NoDice()
    return s


def cities(st, owners):
    return [add_city(st, 10 + 4 * i, 10, o) for i, o in enumerate(owners)]


@pytest.fixture
def decent(monkeypatch):
    """1a4d stand-in: cities in `ok` can build a decent unit."""
    ok = set()
    monkeypatch.setattr(RB, "can_build_decent", lambda s, c: (int(c in ok), 0))
    return ok


# ------------------------------------------------------------------------------- 0af2

@pytest.mark.parametrize("quota, count, heroes, own, gold, go", [
    (30, 10, 5, 99, 500, True),        # heroes >= 5
    (30, 10, 1, 5, 500, True),         # n = max(5, 30*10/80 = 3) = 5; 5 * 1 >= 5
    (30, 10, 1, 6, 500, False),        # 5 < 6
    (80, 10, 1, 10, 500, True),        # n = 10
    (30, 10, 0, 0, 500, True),         # 0 >= 0
    (30, 10, 5, 0, 499, False),        # gold < 500
])
def test_gate(st, monkeypatch, quota, count, heroes, own, gold, go):
    cities(st, [0] * count)
    blk = st.ai[0]
    blk.rebuild_quota, blk.hero_count, blk.own_cities = quota, heroes, own
    st.players[0].gold = gold
    seen = []
    monkeypatch.setattr(RB, "rebuild_city", lambda s, t: seen.append(t) or -1)
    RB.rebuilding(st)
    assert bool(seen) is go


@pytest.mark.parametrize("gold, t", [(2000, 3), (2001, 7)])
def test_type_by_gold(st, monkeypatch, gold, t):
    """t = AI[+0x12] when gold > 2000 (jle), else AI[+0x10]; c != -1 and gold >= 500 -> 0bd1."""
    cities(st, [0])
    blk = st.ai[0]
    blk.buy_low, blk.buy_high, blk.hero_count = 3, 7, 5
    st.players[0].gold = gold
    seen = []
    monkeypatch.setattr(RB, "rebuild_city", lambda s, tt: 0)
    monkeypatch.setattr(RB, "buy_slot", lambda s, tt, c: seen.append((tt, c)))
    RB.rebuilding(st)
    assert seen == [(t, 0)]


# ------------------------------------------------------------------------------- 0c83

def test_rebuild_city_roles(st, decent):
    """2 / 3 need age >= 4 (unsigned) and score age - 4; 4 / 5 score age when 1a4d == 0; 8 with
    1a4d == 0 -> 14 and a candidate; 14 with 1a4d != 0 -> 8; other roles skipped; strict > from
    -1, scanned count-1..0."""
    cs = cities(st, [0] * 8)
    blk = st.ai[0]
    for c, role, age in zip(cs, (2, 3, 4, 5, 8, 14, 7, 14), (3, 9, 1, 2, 4, 6, 50, 4)):
        blk.role[c], blk.age[c] = role, age
    decent.add(7)
    assert RB.rebuild_city(st, 3) == 5                          # 14 (age 6) beats 3 (9 - 4) and 8 -> 14 (4)
    assert blk.role[4] == 14 and blk.role[7] == 8


def test_rebuild_city_scores(st, decent):
    cs = cities(st, [0, 0, 1, 0])
    blk = st.ai[0]
    for c, role, age in zip(cs, (4, 4, 4, 3), (7, 7, 99, 11)):
        blk.role[c], blk.age[c] = role, age
    assert RB.rebuild_city(st, 3) == 3                          # 11 - 4 = 7 ties 7 / 7: the highest index
    blk.age[3] = 10
    assert RB.rebuild_city(st, 3) == 1                          # 6 < 7; 7 / 7: city 1 before 0
    decent.update({0, 1, 3})
    assert RB.rebuild_city(st, 3) == -1


# ------------------------------------------------------------------------------- 0bd1

def test_buy_slot_strict_gold_and_writes(st):
    """gold > price + 30 (strict): slot 1ae9(c) = the type's record, gold -= price, AI[+0x16]
    += 1, +0x2d = 0, +0x31 = 0, role 5; else nothing."""
    c = cities(st, [0])[0]
    city = st.cities[c]
    city.slots = [Slot(LINF, 1, 2, 12, 3), Slot(GIANTS, 2, 5, 16, 10)] + [Slot() for _ in range(2)]
    city.turns_left, city.vectoring = 1, 1
    price = st.army_type(PEGASI).buy_price
    st.players[0].gold = price + 30
    assert RB.buy_slot(st, PEGASI, c) == 0
    assert city.slots[2] == Slot() and st.players[0].gold == price + 30 and city.turns_left == 1
    st.players[0].gold = price + 31
    assert RB.buy_slot(st, PEGASI, c) == 1
    assert city.slots[2].type == PEGASI and st.players[0].gold == 31
    assert (city.turns_left, city.vectoring, st.ai[0].role[c], st.ai[0].slots_bought) == (0, 0, 5, 1)


def test_buy_slot_replaces_the_weakest(st):
    c = cities(st, [0])[0]
    city = st.cities[c]
    city.slots = [Slot(GIANTS, 2, 5, 16, 10), Slot(LINF, 1, 2, 12, 3),
                  Slot(LINF, 1, 2, 12, 3), Slot(GIANTS, 2, 5, 16, 10)]
    st.players[0].gold = 5000
    RB.buy_slot(st, PEGASI, c)
    assert [s.type for s in city.slots] == [GIANTS, PEGASI, LINF, GIANTS]
    city.slots = [Slot(GIANTS, 2, 10, 16, 10) for _ in range(4)]
    with pytest.raises(RuntimeError):
        RB.buy_slot(st, PEGASI, c)


def test_quota_product_is_16_bit(st, monkeypatch):
    """0afd: AI[+0x0a] * count is a 16-bit imul: 3277 * 10 = 32770 wraps to -32766, idiv 80 =
    -409 -> n = 5 (the minimum); 5 * 1 hero < 100 own cities: no purchase.  Without the wrap n
    would be 409 >= 100."""
    cities(st, [0] * 10)
    blk = st.ai[0]
    blk.rebuild_quota, blk.hero_count, blk.own_cities = 3277, 1, 100
    st.players[0].gold = 5000
    seen = []
    monkeypatch.setattr(RB, "rebuild_city", lambda s, t: seen.append(t) or -1)
    RB.rebuilding(st)
    assert seen == []
    blk.rebuild_quota = 3276                   # 32760: n = 409 >= 100
    RB.rebuilding(st)
    assert len(seen) == 1


def test_rebuild_city_age_4_is_old_enough(st, decent):
    """0c83 0d4e: roles 2 / 3 skip only age < 4 (jb): age 4 is a candidate with 4 - 4 = 0 > -1."""
    c = cities(st, [0])[0]
    blk = st.ai[0]
    blk.role[c], blk.age[c] = 2, 4
    assert RB.rebuild_city(st, 3) == c
    blk.age[c] = 3
    assert RB.rebuild_city(st, 3) == -1
