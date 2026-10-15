"""rules.economy: income, upkeep, settlement (EL §6.3; asm ovl62:02bf/0372/03f9, ovl35:07cf,
ovl68:0827).  In-memory states, plus one check on every shipped scenario."""
import pytest

from warlords2.formats.scenario import SCENARIOS
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, NO_OWNER, ItemType
from warlords2.rules import economy as EC
from warlords2.rules.bonuses import ABOARD_FLAG

from warlords2.model import commands as C
from warlords2.model.city import Slot
from warlords2.rules import city as CT
from warlords2.rules import engine

from test_bonuses import army, give, put
from test_city import add_city, mk, producing
from test_combat import hooks  # noqa: F401  (fixture)
from test_turn import stubs  # noqa: F401  (fixture)


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
    EC.refresh_cities(st)                                     # ovl62:03f9 before 0372 reads it
    assert EC.income(st, 0) == 50 + 2 * 5
    assert EC.income(st, 1) == 40 + 1 * 7
    assert EC.income(st, 2) == 0


def test_income_reads_the_stored_city_count():
    """ovl62:03e1 multiplies the gold items by DS:5dea[p], the word ovl62:03f9 last wrote, not
    by a fresh count; 03f9 rewrites all eight words (0404 / 0437) and nothing else does."""
    st = mk()
    add_city(st, 10, 10, 0, (), income=20)
    h = put(st, HERO_TYPE, 0, 5, 5)
    give(st, h, ItemType.GOLD, 3)
    assert st.city_counts == [0] * 8                          # DGROUP start: no 03f9 yet
    assert EC.income(st, 0) == 20
    EC.refresh_cities(st)
    assert st.city_counts == [1, 0, 0, 0, 0, 0, 0, 0] and EC.income(st, 0) == 20 + 3
    add_city(st, 20, 10, 0, (), income=5)
    add_city(st, 30, 10, 1, (), income=5)
    assert EC.cached_cities(st, 0) == 1 and EC.income(st, 0) == 25 + 3    # stale count
    EC.refresh_cities(st)
    assert st.city_counts[:2] == [2, 1] and EC.income(st, 0) == 25 + 2 * 3


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


# ------------------------------------------------------------------- the caches DS:5dca / 5dda


def _cached(st, p=0):
    return EC.cached_income(st, p), EC.cached_upkeep(st, p)


def _econ(st):
    """Side 0 with a city of income 20 and one army of upkeep 3; caches refreshed."""
    add_city(st, 10, 10, 0, (), income=20)
    a = put(st, 1, 0, 5, 5)
    army(st, a).upkeep = 3
    EC.refresh_cities(st)
    EC.refresh_income(st)
    EC.refresh_upkeep(st)
    return a


def test_refresh_writes_all_eight_sides():
    """ovl62:0372 / 02bf zero and refill the words of all eight sides, not only SCN 0x110's;
    signed owner < 8 only (a neutral 8 does not count)."""
    st = mk(current=0)
    add_city(st, 10, 10, 3, (), income=40)
    add_city(st, 20, 10, 8, (), income=50)
    army(st, put(st, 1, 5, 5, 5)).upkeep = 7
    army(st, put(st, 1, 8, 6, 5)).upkeep = 9
    st.income_cache[:] = st.upkeep_cache[:] = [99] * 8
    EC.refresh(st)
    assert st.income_cache == [0, 0, 0, 40, 0, 0, 0, 0]
    assert st.upkeep_cache == [0, 0, 0, 0, 0, 7, 0, 0]


def test_settle_refreshes_and_reads_the_caches():
    """ovl68:0827: 0372 and 02bf, then the cache words of SCN 0x110."""
    st = mk(current=0)
    _econ(st)
    st.income_cache[0], st.upkeep_cache[0] = 500, 500                 # stale
    gold = st.players[0].gold
    EC.settle(st)
    assert _cached(st) == (20, 3) and st.players[0].gold == gold + 17


def test_cache_stale_after_new_unit_ai_disband_and_purchase():
    """No refresh after ovl43:0000's new units (they come after the settlement), an AI disband
    (ovl24:015e -> 0b62:03be) or a purchase (ovl44:0ee3): the live values move, the caches not."""
    from warlords2.rules.movement import remove_army
    st = mk(current=0)
    a = _econ(st)
    st.cities[0].slots[0] = Slot(6, 1, 1, 1, 6)
    c = producing(st, 0)
    EC.settle(st)
    while not any(isinstance(e, E.Produced) for e in CT.deliver(st)):
        pass
    assert EC.upkeep(st, 0) == 3 + 3 and _cached(st) == (20, 3)
    remove_army(st, army(st, a))
    assert EC.upkeep(st, 0) == 3 and _cached(st) == (20, 3)
    gold = st.players[0].gold
    t = next(t for t in CT.buy_offer(st) if st.army_type(t).buy_price > 0 and t != 6)
    engine.apply(st, C.BuyProduction(0, t))
    assert st.players[0].gold < gold and _cached(st) == (20, 3)
    c.income = 35
    assert EC.income(st, 0) == 35 and _cached(st) == (20, 3)


def test_confirm_disband_refreshes_upkeep_only():
    """0b62:089a: ovl62:02bf after Disband (yes), no 0372; Disband (no) refreshes nothing."""
    from warlords2.rules import engine
    st = mk(current=0)
    a = _econ(st)
    b = put(st, 1, 0, 5, 5)
    army(st, b).upkeep = 2
    st.cities[0].income = 70
    engine.apply(st, C.Disband((a,)))
    engine.apply(st, C.ConfirmDisband(False))
    assert _cached(st) == (20, 3)
    engine.apply(st, C.Disband((a,)))
    engine.apply(st, C.ConfirmDisband(True))
    assert _cached(st) == (20, 2)


def test_own_raze_and_take_over_refresh_both():
    """ovl32:009c..00a6 after an own raze; ovl36:10c1..10cb at the end of the take-over."""
    from warlords2.rules import engine
    from warlords2.rules.constants import allowing_unverified
    st = mk(current=0)
    _econ(st)
    add_city(st, 30, 10, 0, (), income=15)
    EC.refresh(st)
    army(st, put(st, 1, 0, 6, 5)).upkeep = 4
    with allowing_unverified():
        engine.apply(st, C.RazeOwnCity(1))
    assert _cached(st) == (20, 7)
    add_city(st, 40, 10, 1, (), income=25)
    army(st, put(st, 1, 0, 7, 5)).upkeep = 1
    CT.take_city(st, 2, 0, 1)
    assert _cached(st) == (45, 8) and _cached(st, 1) == (0, 0)


def test_battle_refreshes_after_the_casualties(hooks):
    """ovl36:0a6b: 03f9 / 02bf / 0372 at 0cb5..0cbf, after the dead are removed."""
    from test_combat import WIN, script
    from warlords2.rules import engine
    from warlords2.rules.constants import allowing_unverified
    from test_bonuses import mk_state, set_terrain
    from warlords2.model.ids import Terrain
    st = mk_state()
    set_terrain(st, 5, 5, Terrain.PLAIN)
    a = put(st, 1, 0, 4, 5, moves=10)
    d = put(st, 2, 1, 5, 5)
    army(st, a).upkeep, army(st, d).upkeep = 3, 6
    EC.refresh(st)
    army(st, put(st, 1, 0, 8, 8)).upkeep = 2                          # after the last refresh
    assert _cached(st, 1) == (0, 6) and _cached(st, 0) == (0, 3)
    hooks(st)
    script(st, WIN, cycle=True)
    with allowing_unverified():
        ev = engine.apply(st, C.Attack((a,), 5, 5))
    assert ev[-1].info["attacker_won"]
    assert _cached(st, 1) == (0, 0) and _cached(st, 0) == (0, 5)


def test_item_dialog_refreshes_income_only():
    """ovl40:0b2d (close of the item dialog): ovl62:0372 at 0b30, no 02bf (the hero's upkeep
    is not in the cache)."""
    from warlords2.model.item import Item
    from warlords2.model.ids import ItemState
    from warlords2.rules import engine
    st = mk(current=0)
    _econ(st)
    h = put(st, HERO_TYPE, 0, 5, 5)
    army(st, h).upkeep = 1
    st.items.append(Item("g", int(ItemType.GOLD), 4, int(ItemState.ON_MAP), 0, 5, 5))
    gi = len(st.items) - 1
    engine.apply(st, C.TakeItem(h, gi))
    assert _cached(st) == (20 + 4, 3)
    st.cities[0].income = 30
    engine.apply(st, C.DropItem(h, gi))
    assert _cached(st) == (30, 3)


def test_reports_refresh_and_read_the_caches():
    """ovl42:04c2 / 04c7 before the score reads DS:5dca / 5dda (0529 / 0536); the Gold report's
    page (ovl42:01d4 / 01d9) refreshes too."""
    from warlords2.rules import reports
    from warlords2.rules.constants import history as KH
    st = mk(current=0)
    _econ(st)
    st.income_cache[0] = st.upkeep_cache[0] = 0
    reports.scores(st)
    assert _cached(st) == (20, 3)
    st.cities[0].income = 50
    reports.report(st, KH.REPORT_GOLD.value)
    assert _cached(st) == (50, 3)


def test_ai_readers_see_the_cache():
    """ovl25:0781 / 0791 and ovl24:0680 / 0686 read the words, not a recount."""
    from warlords2.ai.phases import clean_city, production
    st = mk(current=0)
    _econ(st)
    put(st, 1, 0, 6, 6)
    st.cities[0].income = 90
    for mod in (production, clean_city):
        assert (mod._income(st), mod._upkeep(st)) == (20, 3)


def test_human_turn_start_refreshes(game, stubs, monkeypatch):
    """ovl68:0259: 0372 / 02bf at 0303 / 0308, after ovl64:0d39 and before 0b62:0d85; then
    again in the settlement ovl68:0827."""
    from test_turn import HUMAN_STEPS, CALLS, trace, two_humans
    from warlords2.rules import turn as T
    st = two_humans(game)
    st.turn = 2
    st.players[0].gold = 0
    trace(monkeypatch, *HUMAN_STEPS, (EC, "refresh_income", "0372"), (EC, "refresh_upkeep", "02bf"))
    T.human_turn(st)
    assert CALLS[:8] == ["ovl00:0db3", "ovl64:0d39", "0372", "02bf", "0b62:0d85", "ovl68:05fb",
                         "ovl67:0000", "ovl68:0827"]
