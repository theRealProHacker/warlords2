"""rules.heroes: offers, the new hero, allies, experience and levels, death, items, the standard,
medals (M7a).  Expected values are worked out from the listings named in each test
(out/asm/ovl47.asm, ovl36.asm, ovl34.asm); dice are scripted per die face."""
import collections

import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import (HERO_TYPE, MAP_ARMY, MAP_W, ROAD_STANDARD, Control, ItemState, ItemType,
                                 Terrain)
from warlords2.model.item import Item
from warlords2.rules import combat, engine
from warlords2.rules import heroes as H
from warlords2.rules import selection as S
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.engine import IllegalCommand
from warlords2.rules.rng import Rng

from test_bonuses import atype, default_types, mk_state, put, set_terrain
from test_city import add_city
from test_combat import Script

ALLY_TYPES = (19, 20, 22, 23, 24, 25, 26, 27)        # w13 != 0 in the shipped ARMYTYPE.DAT (EL §5.2)


def types():
    ts = [atype(i, special=1 if i in ALLY_TYPES else 0) for i in range(28)]
    return ts + [atype(HERO_TYPE, 5)]


def names():
    return [[[i % 2, "h%d_%d" % (p, i)] for i in range(100)] for p in range(8)]


def mk(**opts):
    st = mk_state(types(), **opts)
    st.items = [Item("s%d" % i, int(ItemType.STANDARD), 1, int(ItemState.NOT_IN_PLAY), 0, 0, 0)
                for i in range(8)]
    st.items += [Item("i%d" % i, int(ItemType.BATTLE), 1, int(ItemState.NOT_IN_PLAY), 0, 0, 0)
                 for i in range(8, 22)]
    st.hero_names = names()
    return st


def dice(st, values, cycle=False):
    st.rng.src = Script(values, cycle)
    return st.rng.src


def hero(st, owner=0, x=5, y=5, strength=5, slot=None):
    aid = put(st, HERO_TYPE, owner, x, y, strength=strength)
    s = slot if slot is not None else next(i for i, h in enumerate(st.heroes) if not h.used)
    st.heroes[s].used, st.heroes[s].name = 1, "hero%d" % s
    st.armies[aid].hero_slot = st.armies[aid].medals = s
    return st.armies[aid]


# ----------------------------------------------------------------------------- offers


def test_turn_one_hero_is_free_at_the_capital_with_the_standard():
    """ovl47:0000 turn 1 -> city at the capital, price 0; ovl47:031b strength 5, moves 14/14,
    +9 city, +0xa slot, item p carried; no allies, no gold change (ovl47:01fc not called)."""
    st = mk()
    st.current = 2
    st.players[2].capital = (11, 21)
    ci = add_city(st, 10, 20, 2)
    dice(st, [7])                                        # name roll 7 -> entry 6
    ev = H.human_offer(st)
    assert isinstance(ev[0], E.HeroOffered) and st.pending is ev[0]
    assert ev[0].info == {"player": 2, "city": ci, "price": 0, "name": "h2_6", "female": 0, "free": True}
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.AcceptHero(False))
    gold = st.players[2].gold
    out = engine.apply(st, C.AcceptHero(True))
    a = next(a for a in st.armies if a.type_id == HERO_TYPE)
    assert (a.x, a.y, a.owner, a.strength, a.allowance, a.moves_left, a.home_city, a.hero_slot,
            a.upkeep) == (10, 20, 2, 5, 14, 14, ci, 0, 0)
    assert st.heroes[0].used and st.heroes[0].name == "h2_6" and st.heroes[0].level == 0
    assert st.items[2].state == ItemState.CARRIED and st.items[2].holder == a.id
    assert st.players[2].gold == gold and not any(isinstance(e, E.AlliesJoined) for e in out)
    assert st.world.flags[20 * MAP_W + 10] & 0x1F == MAP_ARMY | 2
    assert st.news[2] == [[0, ci, 0, "h2_6"]]


def test_offer_blocked_by_the_surrender_flag():
    st = mk()
    st.flags[0x15D] = 1
    assert H.offer_check(st) is None


def _offer_state(own_heroes=0, cities=1, gold=1000):
    st = mk()
    st.turn = 5
    st.players[0].gold = gold
    for i in range(cities):
        add_city(st, 2 * (i % 40), 2 * (i // 40) + 30, 0)
    for _ in range(own_heroes):
        hero(st, 0, 1, 1)
    return st


@pytest.mark.parametrize("own,die,price", [(0, 1, 301), (0, 400, 700), (1, 1, 1001), (1, 600, 1600)])
def test_offer_price(own, die, price):
    """ovl47:00fd / 010f: rnd(1,600,1000) with own heroes, else rnd(1,400,300)."""
    st = _offer_state(own, gold=5000)
    src = dice(st, [die, 1, 1])
    assert H.offer_check(st) == {"city": 0, "price": price}
    assert src.sides == [600 if own else 400, 30, 1]


@pytest.mark.parametrize("roll,offered", [(1, True), (6, True), (7, False), (30, False)])
def test_offer_chance_six_in_thirty(roll, offered):
    st = _offer_state()
    dice(st, [1, roll, 1])
    assert (H.offer_check(st) is not None) == offered


def test_offer_needs_the_gold():
    st = _offer_state(gold=500)
    src = dice(st, [300])                                # price 600 > 500: no chance roll
    assert H.offer_check(st) is None and src.sides == [400]


def test_offer_cap_five_or_six_and_forty_heroes():
    """ovl47:0076..00f3: cap 5, 6 from 40 own cities; no offer with 40 heroes in the table."""
    st = _offer_state(own_heroes=5, cities=39)
    assert H.offer_check(st) is None
    st = _offer_state(own_heroes=5, cities=40, gold=5000)
    dice(st, [1, 1, 1])
    assert H.offer_check(st) is not None
    st = _offer_state(own_heroes=0)
    for _ in range(40):
        hero(st, 1, 3, 3, slot=0)
    assert H.offer_check(st) is None


def test_offer_city_is_the_kth_own_city():
    """ovl47:015a..01d3: k = rnd(1, cities, 0), the k-th city owned by the side in table order."""
    st = _offer_state(cities=0)
    add_city(st, 20, 20, 1)
    for x in (24, 28, 32):
        add_city(st, x, 20, 0)
    dice(st, [1, 1, 3])
    assert H.offer_check(st)["city"] == 3


def test_computer_offer_uses_the_ai_city_hook(monkeypatch):
    st = _offer_state(cities=2)
    st.current = 1
    for c in st.cities:
        c.owner = 1
    st.players[1].gold = 5000
    monkeypatch.setitem(H.HOOKS, "ai_hero_city", ("M8b1", "test_heroes:_ai_city", "f(state, city)", ""))
    dice(st, [1, 1, 1, 50, 1, 1])                        # price, chance, k, name 50, ally type, count
    ev = H.computer_offer(st)
    joined = next(e for e in ev if isinstance(e, E.HeroJoined))
    assert joined.info["city"] == 1 and joined.info["name"] == "h1_49" and joined.info["female"] == 1


def _ai_city(state, city):
    return len(state.cities) - 1


def test_name_hero_answers_with_name_and_sex():
    st = mk()
    add_city(st, 10, 20, 0)
    st.players[0].capital = (10, 20)
    dice(st, [1])
    H.human_offer(st)
    for bad in ("", "x" * 16):
        with pytest.raises(IllegalCommand):
            engine.apply(st, C.NameHero(bad, True))
    engine.apply(st, C.NameHero("Kim", True))
    assert st.heroes[0].name == "Kim" and st.heroes[0].female == 1 and st.pending is None


def test_parse_hero_names_follows_the_byte_scan():
    data = b"#0 Alpha\r\n#1 Beta\r\n#7 Gamma Delta\r\n"
    assert H.parse_hero_names(data) == [[0, "Alpha"], [1, "Beta"], [1, "Gamma Delta"]]


@pytest.mark.gamedata
def test_hero_name_files(game):
    from warlords2.formats.gamedir import GameDir
    lists = H.load_hero_names(GameDir(game))
    assert [len(l) for l in lists] == [100, 100, 100, 100, 101, 100, 100, 100]
    assert sum(f for f, _ in lists[0]) == 0 and all(0 < len(n) <= 15 for l in lists for _, n in l)


# ----------------------------------------------------------------------------- the hero's square


def test_full_city_places_the_hero_by_random_tries():
    """ovl43:0bff(city, 1): all four squares full -> 20 tries of rnd(1,3,-2) until the army bit
    is clear; the last try is used even if it fails."""
    st = mk()
    ci = add_city(st, 10, 20, 0)
    for dx in (0, 1):
        for dy in (0, 1):
            for _ in range(8):
                put(st, 1, 0, 10 + dx, 20 + dy)
    dice(st, [3, 2, 1, 1])                               # (11, 20) full, then (9, 19) free
    assert H.hero_square(st, ci) == (9, 19)
    dice(st, [2, 2], cycle=True)                         # always (10, 20): full, 20 tries
    src = st.rng.src
    assert H.hero_square(st, ci) == (10, 20) and len(src.sides) == 40


# ----------------------------------------------------------------------------- allies


@pytest.mark.parametrize("r,n", [(1, 1), (69, 1), (70, 2), (94, 2), (95, 3), (100, 3)])
def test_allies_count_69_25_6(r, n):
    """ovl47:024d..0270: r < 70 -> 1, r < 95 -> 2, else 3."""
    st = _offer_state()
    st.turn = 3
    h = hero(st, 0, 40, 40)
    dice(st, [1, r] + [1] * 20)
    ev = H.pay_and_allies(st, h, 0)
    assert ev[0].info["count"] == n and len(ev[0].info["armies"]) == n
    assert all(st.armies[a].type_id == ALLY_TYPES[0] for a in ev[0].info["armies"])


def test_ally_type_uniform_over_w13_types_and_fallback():
    """ovl47:1a9b: r = rnd(1, n, -1) over types 0..27 with w13; none -> 25."""
    st = mk()
    st.rng = Rng(3)
    counts = collections.Counter(H.ally_type(st) for _ in range(8000))
    assert set(counts) == set(ALLY_TYPES)
    assert max(counts.values()) - min(counts.values()) < 200
    st2 = mk_state(default_types())
    assert H.ally_type(st2) == 25


def test_ally_placement_steps_away_from_full_or_foreign_squares():
    """ovl34:12e6: < 8 armies and own nibble (or empty) takes the square; else rnd(1,3,-2) steps;
    10 squares at most."""
    st = mk()
    put(st, 2, 1, 5, 5)                                  # foreign stack at (5, 5)
    dice(st, [3, 2])                                     # -> (6, 5)
    a = H.place_ally(st, 23, 5, 5)
    assert (a.x, a.y, a.owner, a.type_id, a.strength, a.allowance) == (6, 5, 0, 23, 2, 12)
    dice(st, [2, 2], cycle=True)
    assert H.place_ally(st, 23, 5, 5) is None and len(st.rng.src.sides) == 20


# ----------------------------------------------------------------------------- experience


def test_add_exp_caps_at_sixty_and_ignores_non_heroes():
    st = mk()
    h = hero(st)
    other = put(st, 1, 0, 5, 5)
    assert H.add_exp(st, other, 5) == []
    H.add_exp(st, h.id, 58)
    H.add_exp(st, h.id, 3)
    assert st.heroes[h.hero_slot].exp == 60


@pytest.mark.parametrize("level,exp,promoted", [(0, 14, False), (0, 15, True), (1, 29, False),
                                                (1, 30, True), (2, 59, False), (2, 60, True),
                                                (3, 60, False)])
def test_level_thresholds(level, exp, promoted):
    """ovl47:0579: 15 / 30 / 60; ovl47:0672: level + 1, strength + 1, allowance + 2."""
    st = mk()
    h = hero(st)
    st.heroes[h.hero_slot].level, st.heroes[h.hero_slot].exp = level, exp
    ev = H.promote_all(st)
    assert bool(ev) == promoted
    if promoted:
        assert (st.heroes[h.hero_slot].level, h.strength, h.allowance) == (level + 1, 6, 14)


def test_one_level_per_turn_and_strength_cap():
    st = mk()
    h = hero(st, strength=9)
    st.heroes[h.hero_slot].exp = 60
    H.promote_all(st)
    assert st.heroes[h.hero_slot].level == 1 and h.strength == 9 and h.allowance == 14
    H.promote_all(st)
    assert st.heroes[h.hero_slot].level == 2


# ----------------------------------------------------------------------------- death and items


def test_hero_death_drops_items_and_cancels_standard_vectoring():
    """ovl36:16cd: slot freed; items state 1 at (x, y), holder 0; the current side's standard
    (item == SCN 0x110) cancels its vectoring to the standard (-2 targets)."""
    st = mk()
    h = hero(st)
    for i in (0, 9):
        st.items[i].state, st.items[i].holder = int(ItemState.CARRIED), h.id
    ci = add_city(st, 20, 20, 0)
    st.cities[ci].vectoring, st.cities[ci].vector_to = 1, (-2, -2)
    H.hero_died(st, h.id, 7, 8)
    assert not st.heroes[h.hero_slot].used
    assert [(st.items[i].state, st.items[i].holder, st.items[i].x, st.items[i].y) for i in (0, 9)] == \
        [(1, 0, 7, 8)] * 2
    assert st.cities[ci].vectoring == 0 and st.cities[ci].vector_to == (-1, -1)
    assert not st.world.roads[8 * MAP_W + 7] & ROAD_STANDARD


def test_hero_death_on_water_loses_the_items():
    st = mk()
    h = hero(st)
    set_terrain(st, 7, 8, Terrain.WATER)
    st.items[9].state, st.items[9].holder = int(ItemState.CARRIED), h.id
    H.hero_died(st, h.id, 7, 8)
    assert st.items[9].state == ItemState.NOT_IN_PLAY


def test_take_drop_and_plant_the_standard():
    """ovl47:08c7 (standards clear road bit 0x40), ovl47:0943 (Water destroys), ovl47:09f7."""
    st = mk()
    h = hero(st)
    st.items[0].state, st.items[0].holder = int(ItemState.CARRIED), h.id
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.TakeItem(h.id, 9))
    engine.apply(st, C.PlantFlag(h.id))
    assert st.items[0].state == ItemState.ON_MAP and st.world.roads[5 * MAP_W + 5] & ROAD_STANDARD
    from warlords2.rules.vectoring import standard_square
    assert standard_square(st, 0) == (5, 5)
    engine.apply(st, C.TakeItem(h.id, 0))
    assert st.items[0].holder == h.id and not st.world.roads[5 * MAP_W + 5] & ROAD_STANDARD
    engine.apply(st, C.DropItem(h.id, 0))
    assert st.items[0].state == ItemState.ON_MAP and standard_square(st, 0) is None
    set_terrain(st, 6, 6, Terrain.CITY)
    h.x, h.y = 6, 6
    st.items[0].state, st.items[0].holder = int(ItemState.CARRIED), h.id
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.PlantFlag(h.id))
    set_terrain(st, 6, 6, Terrain.WATER)
    engine.apply(st, C.DropItem(h.id, 0))
    assert st.items[0].state == ItemState.NOT_IN_PLAY


# ----------------------------------------------------------------------------- medals


def _battle(st, attackers, defenders, won=True, d_strength=5):
    s = combat.Setup(10, 10, st.current, 1, int(Terrain.PLAIN), 1, -1, [(10, 10)], False,
                     attackers, defenders, [], [], [5] * len(attackers), [d_strength] * len(defenders),
                     [], [], None, None, 0, 0, 0)
    return combat.Battle(s, won, False, [True] * len(attackers), [False] * len(defenders),
                         [], [], [])


def _medal_state(m=0):
    st = mk()
    st.turn = 30
    h = hero(st, 0, 10, 10)
    u = [put(st, 1, 0, 10, 10, strength=5) for _ in range(2)]
    for _ in range(m):
        veteran = put(st, 2, 0, 50, 50)
        st.armies[veteran].medals = 1
    S.select_army_stack(st, st.armies[u[0]])
    st.selection.moving = [h.id] + u
    st.selection.selected, st.selection.hero = h.id, h.id
    return st, h, u


@pytest.mark.parametrize("m,chance", [(0, 40), (2, 30), (5, 15), (6, 12), (9, 12)])
def test_medal_chance_max_12_40_minus_5m(m, chance):
    """ovl36:2274: rnd(1,100,0) < max(12, 40 - 5m)."""
    for roll, awarded in ((chance - 1, True), (chance, False)):
        st, h, u = _medal_state(m)
        dice(st, [roll, 1])
        ev = H.award_medal(st, _battle(st, [h.id] + u, [90, 91]))
        assert bool([e for e in ev if isinstance(e, E.MedalAwarded)]) == awarded


def test_medal_needs_win_real_battle_hero_and_no_ship():
    st, h, u = _medal_state()
    dice(st, [1, 1])
    assert H.award_medal(st, _battle(st, [h.id] + u, [90, 91], won=False)) == []
    assert st.rng.src.sides == []
    assert H.award_medal(st, _battle(st, [h.id] + u, [90])) == []      # 1 defender, turn 30
    st.turn = 19
    assert H.award_medal(st, _battle(st, [h.id] + u, [90], d_strength=3)) == []
    ev = H.award_medal(st, _battle(st, [h.id] + u, [90], d_strength=4))
    assert isinstance(ev[-1], E.MedalAwarded)
    st, h, u = _medal_state()
    st.armies[u[1]].flags |= 0x1000
    dice(st, [1, 1])
    assert H.award_medal(st, _battle(st, [h.id] + u, [90, 91])) == []
    st, h, u = _medal_state()
    st.selection.hero = -1
    src = dice(st, [1, 1])
    assert H.award_medal(st, _battle(st, [h.id] + u, [90, 91])) == [] and src.sides == [100]


def test_medal_gain_and_cap():
    """< 4 medals: +1 and strength + 1 (cap 9), or allowance + 1 from strength 15."""
    st, h, u = _medal_state()
    dice(st, [1, 2])                                     # second eligible
    H.award_medal(st, _battle(st, [h.id] + u, [90, 91]))
    a = st.armies[u[1]]
    assert (a.medals, a.strength) == (1, 6)
    a.medals = 4
    dice(st, [1, 2])
    assert not [e for e in H.award_medal(st, _battle(st, [h.id] + u, [90, 91]))
                if isinstance(e, E.MedalAwarded)]


# ----------------------------------------------------------------------------- strict paths


def test_combat_hooks_of_m7a_resolve_in_strict_mode(monkeypatch):
    """hero_died, add_exp, medals and quest_check exist with the documented signatures; an
    attack with only the M8b1/M9a steps stubbed runs without unverified values."""
    for name in ("hero_died", "add_exp", "medals", "quest_check"):
        assert combat._hook(name) is not None
    real = combat._hook
    stub = {"ai_memory": lambda *a: None, "history": lambda *a: []}
    monkeypatch.setattr(combat, "_hook", lambda n: stub.get(n) or real(n))
    st = mk()
    h = hero(st, 0, 4, 5, strength=9)
    a2 = put(st, 1, 0, 4, 5, strength=9)
    put(st, 2, 1, 5, 5, strength=1)
    hd = hero(st, 1, 5, 5, strength=1)
    st.items[9].state, st.items[9].holder = int(ItemState.CARRIED), hd.id
    dice(st, [20, 1], cycle=True)
    ev = engine.apply(st, C.Attack((h.id, a2), 5, 5))
    assert any(isinstance(e, E.HeroDied) for e in ev) and any(isinstance(e, E.HeroExp) for e in ev)
    assert st.items[9].state == ItemState.ON_MAP and (st.items[9].x, st.items[9].y) == (5, 5)


def test_disband_hero_in_strict_mode():
    st = mk()
    h = hero(st)
    engine.apply(st, C.Disband((h.id,)))
    ev = engine.apply(st, C.ConfirmDisband(True))
    assert isinstance(ev[0], E.HeroDied) and not st.heroes[h.hero_slot].used


def test_hook_signatures():
    import importlib
    import inspect
    import re
    from warlords2.rules import ruins
    for module in (H, ruins):
        for name, (milestone, target, doc, _) in module.HOOKS.items():
            params = [p.strip() for p in re.match(r"^f\(([^)]*)\)", doc).group(1).split(",")]
            assert params[0] == "state"
            mod, fn = target.split(":")
            try:
                f = getattr(importlib.import_module(mod), fn, None)
            except ModuleNotFoundError:
                f = None
            if f is not None:
                assert list(inspect.signature(f).parameters) == params


def test_news_keeps_the_two_most_important():
    """ovl41:1244: two slots; the slot with the larger kind is replaced by a smaller kind."""
    st = mk()
    H.news(st, 0, 6, 1, 0, "a")
    H.news(st, 0, 3, 2, 0, "b")
    H.news(st, 0, 6, 3, 0, "c")
    assert [e[1] for e in st.news[0]] == [1, 2]
    H.news(st, 0, 1, 4, 0, "d")
    assert [e[1] for e in st.news[0]] == [4, 2]


# ----------------------------------------------------------------------------- shipped scenarios


@pytest.mark.gamedata
@pytest.mark.parametrize("name", ["TUTORIA", "DRAGON", "SORCERY", "ERYTHEA", "HADESHA", "ISLADIA"])
def test_turn_one_heroes_on_shipped_scenarios(game, name):
    """Every live side gets its turn-1 hero at its capital city with its standard; the pending
    offer and the news survive a dump / load; the site pictures of ovl35:09f2 are Site terrain
    except the hidden one (0x09, SCN 0x710 maps it to a non-site terrain)."""
    from warlords2.formats.gamedir import GameDir
    from warlords2.model.serialize import dump, load
    from warlords2.rules import ruins
    from movekit import scenario_state
    st = scenario_state(game, name, seed=4)
    assert st.hero_names == H.load_hero_names(GameDir(game), st.flags.get(0x161, 0))   # new_game
    for t in (0x0A, 0x0B, 0x0C):
        assert st.world.terrain_of_tile[t] == Terrain.SITE
    assert st.world.terrain_of_tile[0x09] != Terrain.SITE    # a hidden special site cannot be searched
    for p in range(8):
        if not st.players[p].alive:
            continue
        st.current = p
        st.players[p].control = Control.HUMAN
        ev = H.human_offer(st)
        assert st.pending.info["price"] == 0 and st.pending.info["city"] == st.city_at(*st.players[p].capital)
        st2 = load(dump(st))
        assert st2.hash() == st.hash()
        engine.apply(st, C.AcceptHero(True))
        a = st.armies[st.items[p].holder]
        assert a.type_id == HERO_TYPE and a.owner == p and st.items[p].state == ItemState.CARRIED
    ruins.site_tiles(st, 0)
    assert all(st.world.terrain(s.x, s.y) == Terrain.SITE for s in st.sites)
    assert load(dump(st)).hash() == st.hash()
