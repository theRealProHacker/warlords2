"""rules.economy: income, upkeep, settlement (EL §6.3; asm ovl62:02bf/0372/03f9, ovl35:07cf,
ovl68:0827).  In-memory states, plus one check on every shipped scenario."""
import pytest

from warlords2.formats.scenario import SCENARIOS
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, NO_OWNER, ItemType
from warlords2.rules import economy as EC
from warlords2.rules.bonuses import ABOARD_FLAG

from test_bonuses import army, give, put
from test_city import add_city, mk


def test_income_cities_plus_gold_items_per_city():
    """ovl62:0372: sum of +0x2a over own cities, + cities[p] * sum of type-7 item values carried
    by p's heroes (ovl35:07cf; other item types and other sides' heroes do not count)."""
    st = mk()
    add_city(st, 10, 10, 0, (), income=20)
    add_city(st, 20, 10, 0, (), income=30)
    add_city(st, 30, 10, NO_OWNER, (), income=50)
    add_city(st, 40, 10, 1, (), income=40)
    h1, h2 = put(st, HERO_TYPE, 0, 5, 5), put(st, HERO_TYPE, 0, -1, -1)
    e = put(st, HERO_TYPE, 1, 6, 6)
    give(st, h1, ItemType.GOLD, 3)
    give(st, h2, ItemType.GOLD, 2)
    give(st, h1, ItemType.BATTLE, 9)
    give(st, e, ItemType.GOLD, 7)
    assert EC.city_count(st, 0) == 2 and EC.gold_items(st, 0) == 5
    assert EC.income(st, 0) == 50 + 2 * 5
    assert EC.income(st, 1) == 40 + 1 * 7
    assert EC.income(st, 2) == 0


def test_upkeep_on_map_only_aboard_at_least_4():
    """ovl62:02bf: army +0xb over own armies with x, y >= 0; aboard (0x1000) -> 4 when <= 4."""
    st = mk()
    for u, fl, x in ((3, 0, 5), (6, 0, 5), (1, ABOARD_FLAG, 5), (0, ABOARD_FLAG, 5),
                     (6, ABOARD_FLAG, 5), (9, 0, -1)):
        army(st, put(st, 1, 0, x, 5 if x >= 0 else -1, flags=fl)).upkeep = u
    army(st, put(st, 1, 1, 7, 7)).upkeep = 50
    assert EC.upkeep(st, 0) == 3 + 6 + 4 + 4 + 6
    assert EC.upkeep(st, 1) == 50


@pytest.mark.parametrize("gold,inc,upk,after", [(100, 30, 50, 80), (5, 10, 30, 0), (0, 0, 7, 0),
                                                (32760, 20, 0, 0)])
def test_settle_clamps_at_zero(gold, inc, upk, after):
    """ovl68:0827: gold[0x110] += income - upkeep (signed word, so 32760 + 20 wraps negative)
    and becomes 0 when negative; nothing is disbanded."""
    st = mk()
    add_city(st, 10, 10, 0, (), income=inc)
    a = put(st, 1, 0, 5, 5)
    army(st, a).upkeep = upk
    st.players[0].gold = gold
    ev = EC.settle(st)
    assert st.players[0].gold == after
    assert [x.id for x in st.armies] == [a]
    assert isinstance(ev[0], E.IncomeSettled) and ev[0].info["income"] == inc
    assert ev[0].info["upkeep"] == upk


def test_settle_only_the_current_side():
    st = mk(current=0)
    add_city(st, 10, 10, 1, (), income=40)
    st.current = 1
    EC.settle(st)
    assert st.players[1].gold == 1040 and st.players[0].gold == 1000


@pytest.mark.gamedata
@pytest.mark.parametrize("name", SCENARIOS)
def test_scenario_income_is_the_city_file_sum(game, name):
    """At the start no hero carries a gold item, so income = sum of the cities' +0x2a."""
    from movekit import scenario_state
    st = scenario_state(game, name)
    for p in range(8):
        assert EC.income(st, p) == sum(c.income for c in st.cities if c.owner == p)
    assert sum(EC.city_count(st, p) for p in range(8)) == sum(1 for c in st.cities if c.owner < 8)
