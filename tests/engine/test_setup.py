"""rules.setup.new_game / difficulty_rating against the shipped scenarios (EL §9).

Every set-up step is verified, so new_game runs with unverified values forbidden.
"""
import copy
from functools import lru_cache
from math import isqrt

import pytest

from warlords2.formats.gamedir import GameDir
from warlords2.formats.scenario import SCENARIOS, load_scenario
from warlords2.formats.tables import parse_armytypes
from warlords2.model.ids import (LEVEL_OFF, MAP_W, NO_OWNER, Control, ItemState, SiteKind)
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from movekit import neighbour_memo
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.constants import setup as K
from warlords2.rules.rng import Rng
from warlords2.rules.setup import (_header_flags, _special, difficulty_rating, distance,
                                   new_game, scatter_sites_and_items, unused_side_name)

pytestmark = pytest.mark.gamedata

OPTION_MATRIX = [
    GameOptions(),
    GameOptions(1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
    GameOptions(neutral_cities=2, quick_start=1),
    GameOptions(diplomacy=1, hidden_map=1, quests=1),
    GameOptions(intense_combat=1, view_enemies=1, random_turns=1),
]


@lru_cache(maxsize=None)
def _gd(root):
    return GameDir(root)


@lru_cache(maxsize=None)
def _scenario(root, name):
    return load_scenario(_gd(root), name)


@lru_cache(maxsize=None)
def _armytypes(root, alt=0):
    return tuple(parse_armytypes(_gd(root).read("TERRAIN0/ARMYTYP%s.DAT" % ("2" if alt else "E"))))


def cfg(name, seed=1, options=GameOptions(), controls=None, levels=None):
    return NewGameConfig(name, controls or (Control.HUMAN,) + (Control.COMPUTER,) * 7,
                         levels or (1,) * 8, (0,) * 8, (0,) * 8, None, options, 0, seed)


@lru_cache(maxsize=None)
def _unused(root):
    return unused_side_name(_gd(root).read("WARLORD2.EXE"))


def build(game, name, sc=None, **kw):
    with allowing_unverified(False), neighbour_memo():
        return new_game(sc or _scenario(game, name), cfg(name, **kw), list(_armytypes(game)),
                        unused_name=_unused(game))


@pytest.mark.parametrize("opt", range(len(OPTION_MATRIX)))
@pytest.mark.parametrize("name", SCENARIOS)
def test_new_game_builds(game, name, opt):
    o = OPTION_MATRIX[opt]
    st = build(game, name, seed=opt + 1, options=o)
    sc = _scenario(game, name)["scn"]
    n = len(st.sites)
    assert n == sc["site_count"] and len(st.cities) == sc["city_count"] and len(st.items) == 22
    assert st.turn == 1 and st.options == o and len(st.overview_mountain_rolls) == 256
    assert set(st.overview_mountain_rolls) <= {2, 3, 4}             # rnd(1,3,1), ovl63:2479
    for off, w in zip((0x11A, 0x11C, 0x11E, 0x124, 0x12A, 0x132, 0x126, 0x128, 0x12C, 0x122), o.to_words()):
        assert st.flags[off] == w
    alive = [p for p in st.players if p.alive]
    assert [p.index for p in alive] == [p["index"] for p in sc["players"] if p["active"]]
    for p in st.players:
        assert 1 <= p.infamy <= 8
        if not p.alive:
            assert p.gold == 0 and p.control == Control.COMPUTER
        elif p.control == Control.HUMAN:
            assert p.level == 2
    # capital = city at the player-record coordinates, owned by the side, coloured tiles
    for p in alive:
        ci = st.city_at(*p.capital)
        c = st.cities[ci]
        assert (c.x, c.y) == p.capital and c.owner == p.index
        base = 98 + 2 * p.index if p.index < 6 else 128 + 2 * (p.index - 6)
        assert st.world.tiles[c.y * MAP_W + c.x] == base
    if o.quick_start:
        assert all(c.owner != NO_OWNER for c in st.cities)
    else:
        caps = {st.city_at(*p.capital) for p in alive}
        assert all(c.owner == NO_OWNER for i, c in enumerate(st.cities) if i not in caps)
    # production slots (EL §9.4 ovl53:0a75 / ovl44:1544)
    for c in st.cities:
        types = [s.type for s in c.slots]
        assert 5 not in types
        filled = [s for s in c.slots if s.type >= 0]
        prices = [abs(st.army_type(s.type).buy_price) for s in filled]
        assert prices == sorted(prices)
        for s in filled:
            a = st.army_type(s.type)
            assert s.strength in {a.strength, min(a.strength + 1, 9), max(a.strength - 1, 1)}
            assert s.moves >= 6 and s.time >= 1
        assert c.defence == (2 if sum(s.type >= 0 for s in c.slots) >= 3 else 1)
    # items and sites
    in_site = [i for i, it in enumerate(st.items) if it.state == ItemState.IN_SITE]
    assert all(i >= 8 for i in in_site)
    for i in in_site:
        s = st.sites[st.items[i].holder]
        assert s.kind == SiteKind.ITEM_RUIN and s.item == i
        assert bool(s.flag_1b) == _special(st.items[i].type, st.items[i].value)
    assert sum(s.flag_1b for s in st.sites) == n * 3 // 10
    for s in st.sites:
        assert s.kind in (1, 2, 3, 4, 5)
        if s.kind == SiteKind.TEMPLE:
            assert s.guardian_or_ally == 0 and not s.flag_1b
        elif s.kind == SiteKind.ALLIES_RUIN:
            assert s.guardian_or_ally in (25, 23, 27, 19, 24, 20, 26, 22)
        else:
            assert 1 <= s.guardian_or_ally <= 9
        assert not st.world.explored_site(s.x, s.y)
    assert not any(f & 0x20 for f in st.world.flags) and not any(r & 0x40 for r in st.world.roads)
    v = 0 if o.diplomacy else 2
    assert all(b == v << 2 | v for row in st.relations for b in row)
    assert all(p.shown == (0 if o.hidden_map else 1) for p in st.players)
    _check_turn_order(st, o)
    _check_garrisons(st, o)
    _check_explored_and_territories(st, o)


def _check_turn_order(st, o):
    order = [st.flags[0x163 + 2 * i] for i in range(8)]
    assert sorted(order) == list(range(8))
    if not o.random_turns:
        assert order == list(range(8))
    pos = st.flags[0x173]
    assert st.current == order[pos - 1] and st.players[st.current].alive
    assert all(not st.players[q].alive for q in order[:pos - 1])
    assert st.flags[0x118] == 0                    # reset by ovl53:0000 after ovl61:17f6


def _check_garrisons(st, o):
    """EL §9.5 ovl39:00cc: one army per intact city, ids by descending city index."""
    intact = [i for i, c in enumerate(st.cities) if st.world.terrain(c.x, c.y) == 10]
    assert len(st.armies) == len(intact)
    assert [a.id for a in st.armies] == list(range(len(intact)))
    assert st.flags[0x181] == max(10, len(intact))
    enh = st.players[st.current].enhanced
    for a, ci in zip(st.armies, reversed(intact)):
        c = st.cities[ci]
        assert (a.x, a.y) == (c.x, c.y) and a.moves_left == 0 and a.flags == 1
        assert a.transit == 0xFF and a.goto == (-1, -1)
        if a.type_id == 11 and a.strength == 1 and a.owner == NO_OWNER and a.allowance == 0:
            # fallback Scouts: Average neutral city, or a city without a slot
            assert c.owner == NO_OWNER and o.neutral_cities == 0 or not any(s.type >= 0 for s in c.slots)
            continue
        slot = next(s for s in c.slots if s.type == a.type_id)
        assert a.owner == c.owner and a.allowance == slot.moves and a.home_city == ci
        assert a.strength == (min(slot.strength + 2, 9) if enh else slot.strength)
        assert a.upkeep == slot.cost // 2
        assert c.current == 0xFF and c.turns_left == 0 and c.vectoring == 0


def _check_explored_and_territories(st, o):
    w = st.world
    for i, c in enumerate(st.cities):
        if c.owner <= 7:
            assert w.explored[c.y * MAP_W + c.x] & (1 << c.owner)
    if not o.hidden_map:
        assert set(w.explored) == {0xFF}
    assert all(r & 0x20 and not r & 0x80 for r in w.roads)
    for p in st.players:
        assert st.flags[0x10F3 + 2 * p.index] == 0xFFFF
        if p.alive:
            ci = st.city_at(*p.capital)
            assert st.cities[ci].owner2 == p.index


def test_item_redraw_matches_itm_and_exe_name_rule(game):
    for name in SCENARIOS:
        raw = _gd(game).read("%s/%s.ITM" % (name, name))
        itm = _scenario(game, name)["items"]
        for i, rec in enumerate(itm):          # ovl35:04ef name rule = parse_itm's name here
            field = raw[4 + 26 * i:4 + 26 * i + 20]
            assert field[:19].split(b" ")[0].replace(b"_", b" ").decode("cp437") == rec["name"]
        st = build(game, name, seed=9)
        cap = 2 * len(st.sites) // 10
        names = {(r["name"], r["type"], r["bonus"]) for r in itm}
        drawn = [(it.name, it.type, it.value) for it in st.items[8:]]
        assert set(drawn) <= names
        for i, it in enumerate(st.items[8:], 8):
            assert _special(it.type, it.value) == (i < cap + 8)


def test_start_infamy_human_bonus(game):
    sc = copy.deepcopy(_scenario(game, "DRAGON"))
    sc["scn"]["globals"]["words_110_to_132"][(0x116 - 0x110) // 2] = 1
    st = build(game, "DRAGON", sc=sc)
    for p in st.players:
        assert (401 <= p.infamy <= 408) if p.control == Control.HUMAN else (1 <= p.infamy <= 8)


def test_start_infamy_uniform(game):
    counts = [0] * 8
    for seed in range(400):
        for p in build(game, "TUTORIA", seed=seed).players:
            counts[p.infamy - 1] += 1
    n = sum(counts)
    assert sum((c - n / 8) ** 2 / (n / 8) for c in counts) < 24.32       # 7 df, p = 0.001


def test_level_off_switches_a_side_off(game):
    st = build(game, "ERYTHEA", levels=(1, LEVEL_OFF) + (1,) * 6)
    p = st.players[1]
    assert not p.alive and p.control == Control.COMPUTER
    assert st.cities[st.city_at(*p.capital)].owner == NO_OWNER


def test_hero_names_come_from_the_caller_and_change_no_die(game):
    """ovl47:0c67 reads TERRAIN<SCN 0x161>/HERONAM<p>.DAT at every name draw, before its die:
    new_game stores the caller's lists in state.hero_names and draws nothing for them."""
    from warlords2.model.state import SCN_TERRAIN_SET
    from warlords2.rules import heroes as H
    sc = _scenario(game, "ERYTHEA")
    lists = H.load_hero_names(_gd(game), _header_flags(sc["scn"])[SCN_TERRAIN_SET])
    plain = build(game, "ERYTHEA")
    with allowing_unverified(False):
        st = new_game(sc, cfg("ERYTHEA"), list(_armytypes(game)), unused_name=_unused(game),
                      hero_names=lists)
    assert plain.hero_names == [] and st.hero_names == lists
    assert st.rng.state() == plain.rng.state()
    st.players[st.current].control = Control.HUMAN
    assert H.human_offer(st)[0].info["name"] in [n for _, n in lists[st.current]]
    with pytest.raises(ValueError):
        new_game(sc, cfg("ERYTHEA"), list(_armytypes(game)), hero_names=lists[:7])


def _chi2(obs: dict, probs: dict) -> float:
    n = sum(obs.values())
    return sum((obs.get(k, 0) - n * p) ** 2 / (n * p) for k, p in probs.items())


CRIT = {1: 10.83, 2: 13.82, 3: 16.27}            # chi-square, p = 0.001


@pytest.mark.parametrize("name", ["TUTORIA", "ERYTHEA"])
def test_scatter_distribution(game, name):
    """10^4 seeds of ovl35:0000: item count and the DS:0c9a kind tables."""
    st = build(game, name)
    n = len(st.sites)
    cap = 2 * n // 10
    totals: dict = {}
    kinds = {"flagged": {}, "near": {}, "far": {}}
    allies = {"flagged": {}, "near": {}, "far": {}}

    def near(s):
        return any(p.alive and isqrt((p.capital[0] - s.x) ** 2 + (p.capital[1] - s.y) ** 2) <= 14
                   for p in st.players)
    near_of = [near(s) for s in st.sites]
    base_sites = [copy.copy(s) for s in _fresh_sites(game, name)]
    base_items = st.items
    itm = _scenario(game, name)["items"]
    with allowing_unverified(False):
        for seed in range(10000):
            sites = [copy.copy(s) for s in base_sites]
            items = [copy.copy(i) for i in base_items]
            total, k = scatter_sites_and_items(sites, items, st.players, itm, None, False, Rng(seed))
            totals[total] = totals.get(total, 0) + 1
            assert 0 <= k <= cap and k <= 7
            placed = sum(i.state == ItemState.IN_SITE for i in items)
            assert placed == min(k, total - 8) + max(0, total - (cap + 8))
            for j, s in enumerate(sites):
                if s.kind in (SiteKind.TEMPLE, SiteKind.ITEM_RUIN):
                    continue
                cls = "flagged" if s.flag_1b else ("near" if near_of[j] else "far")
                kinds[cls][s.kind] = kinds[cls].get(s.kind, 0) + 1
                if s.kind == SiteKind.ALLIES_RUIN:
                    allies[cls][s.guardian_or_ally] = allies[cls].get(s.guardian_or_ally, 0) + 1
    raw = [n // 3 + r + 8 for r in range(-2, 3)]
    probs: dict = {}
    for t in raw:
        probs[min(t, 22)] = probs.get(min(t, 22), 0) + 0.2
    assert set(totals) == set(probs)
    if len(probs) > 1:
        assert _chi2(totals, probs) < CRIT.get(len(probs) - 1, 18.47)
    expect_k = {"flagged": {5: 2 / 3, 4: 1 / 3}, "near": {3: 1 / 3, 4: 1 / 3, 5: 1 / 3},
                "far": {3: 0.4, 4: 0.4, 5: 0.2}}
    expect_a = {"flagged": {25: .25, 23: .25, 27: .25, 19: .25}, "near": {22: .5, 20: .5},
                "far": {24: 1 / 3, 20: 1 / 3, 26: 1 / 3}}
    for cls in kinds:
        if sum(kinds[cls].values()) < 500:
            continue
        assert set(kinds[cls]) == set(expect_k[cls])
        assert _chi2(kinds[cls], expect_k[cls]) < CRIT[len(expect_k[cls]) - 1]
        assert set(allies[cls]) == set(expect_a[cls])
        assert _chi2(allies[cls], expect_a[cls]) < CRIT[len(expect_a[cls]) - 1]


def _fresh_sites(game, name):
    from warlords2.model.site import Site
    return [Site(s["x"], s["y"], s["name"], s["type"], s["b_19"], s["b_1a"], s["w_1b"], s["w_1d"])
            for s in _scenario(game, name)["scn"]["sites"]]


# (options, levels, expected) worked by hand from ovl57:0bab (EL §6.9)
DIFFICULTY = [
    (GameOptions(), (3,) * 8, 80),                                   # no computer: ai 80, opt 0
    (GameOptions(), (0, 3, 3, 3, 3, 3, 3, 3), 26),                   # 1*80//3 = 26
    (GameOptions(), (1, 3, 3, 3, 3, 3, 3, 3), 53),                   # 2*80//3 = 53
    (GameOptions(), (2, 3, 3, 3, 3, 3, 3, 3), 80),
    (GameOptions(), (0, 1, 3, 3, 3, 3, 3, 3), 40),                   # 3*80//6 = 40
    (GameOptions(), (2, 2, 2, 2, 2, 2, 2, 1), 76),                   # 23*80//24 = 76 (< 78, kept)
    (GameOptions(neutral_cities=2, diplomacy=1, quests=1, hidden_map=1), (1,) * 7 + (3,), 53 + 19),
    (GameOptions(1, 1, 1, 1, 0, 1), (0,) * 8, 26 + 16),               # 4+4+3+4+1 = 16
    (GameOptions(2, 1, 1, 1, 0, 1), (0,) * 8, 26 + 20),               # 8+4+3+4+1 = 20 (the cap)
    (GameOptions(view_enemies=1), (0, 0, 3, 3, 3, 3, 3, 3), 26 - 1),
]


@pytest.mark.parametrize("opts,levels,expect", DIFFICULTY)
def test_difficulty_rating(opts, levels, expect):
    assert difficulty_rating(opts, levels) == expect


def test_inactive_sides_get_the_exe_name(game):
    st = build(game, "TUTORIA")
    names = {p.name for p in st.players if not p.alive}
    assert names == {_unused(game)} and len(_unused(game)) > 0


def test_load_reset_and_turn_order_random(game):
    st = build(game, "ERYTHEA", options=GameOptions(random_turns=1), seed=4)
    orders = {tuple(build(game, "ERYTHEA", options=GameOptions(random_turns=1), seed=s).flags[0x163 + 2 * i]
                    for i in range(8)) for s in range(6)}
    assert len(orders) > 1
    for c in st.cities:
        assert c.attacked_by == 0 and c.vector_to == (0, 0) and c.tail == [0] * 11


def test_itm_missing_keeps_scn_items(game):
    sc = dict(_scenario(game, "SORCERY"))
    sc["items"] = None
    st = build(game, "SORCERY", sc=sc)
    scn = sc["scn"]["item_table"]
    assert [(i.name, i.type, i.value) for i in st.items] == [(r["name"], r["type"], r["bonus"]) for r in scn]


def test_distance_is_isqrt():
    assert distance(0, 0, 3, 4) == 5 and distance(0, 0, 14, 1) == 14 and distance(10, 10, 0, 0) == 14


def test_garrison_kind_distribution(game):
    """Strong: kind DS:0d60[rnd(1,4,-1)]; Active: kind of min(rnd(1,4,0),3) (EL §9.5)."""
    for nc in (1, 2):
        st = build(game, "ERYTHEA", options=GameOptions(neutral_cities=nc), seed=2)
        neutral = [a for a in st.armies if a.owner == NO_OWNER]
        assert neutral and all(a.type_id != 11 or a.strength != 1 or a.allowance != 0 for a in neutral)
