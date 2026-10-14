"""rules.bonuses: battle class and strength pipeline of ovl38:008b (EL §3.3), exact cases.

Expected values are worked out by hand from the decompiled set-up (out/rea/decomp/06a6ab.c,
out/asm/ovl38.asm); the address of the step each case pins is named in the test.  States are
built in memory, so no game data is needed except where marked.
"""
import pytest

from warlords2.formats.gamedir import GameDir
from warlords2.formats.tables import parse_armytypes
from warlords2.model.army import Army, ArmyType, WORDS
from warlords2.model.city import City
from warlords2.model.hero import HeroSlot
from warlords2.model.ids import (HERO_TYPE, MAP_FORTIFIED, MAP_H, MAP_W, NO_OWNER, Control,
                                 ItemState, ItemType, Terrain)
from warlords2.model.item import Item
from warlords2.model.options import GameOptions
from warlords2.model.player import Player
from warlords2.model.state import SCN_BONUS_CAP, SCN_TUTORIAL, GameState
from warlords2.model.world import World
from warlords2.rules import bonuses as B
from warlords2.rules import combat
from warlords2.rules.constants import combat as K
from warlords2.rules.rng import Rng

# ----------------------------------------------------------------------------- factory

PLAIN, FOREST, HILLS, WATER = Terrain.PLAIN, Terrain.FOREST, Terrain.HILLS, Terrain.WATER


def atype(type_id, strength=2, **kw):
    """A synthetic ARMYTYPE record; unnamed words are 0."""
    d = {w: 0 for w in WORDS}
    d.update(strength=strength, moves=12, **kw)
    return ArmyType(type_id, "t%d" % type_id, *(d[w] for w in WORDS))


def default_types():
    return [atype(i) for i in range(28)] + [atype(HERO_TYPE, 5)]


def mk_state(types=None, cap=5, current=0, **opts):
    n = MAP_W * MAP_H
    world = World([int(PLAIN)] * n, [NO_OWNER] * n, [0] * n, list(range(12)) + [7] * 244)
    players = [Player(p, "p%d" % p, Control.HUMAN if p == 0 else Control.COMPUTER, 0, 0, 0, 1,
                      1000, (0, 0)) for p in range(8)]
    return GameState(world=world, players=players, cities=[], sites=[], items=[], armies=[],
                     heroes=[HeroSlot() for _ in range(40)], monsters=[],
                     army_types=types or default_types(),
                     fight_order=[list(range(29)) for _ in range(9)],
                     options=GameOptions(**opts), turn=1, current=current,
                     relations=[[2] * 8 for _ in range(8)], rng=Rng(1),
                     flags={SCN_BONUS_CAP: cap, SCN_TUTORIAL: 0})


def set_terrain(st, x, y, t):
    st.world.tiles[y * MAP_W + x] = int(t)


def put(st, type_id, owner, x, y, strength=None, moves=10, flags=0):
    aid = max((a.id for a in st.armies), default=-1) + 1
    s = st.army_type(type_id).strength if strength is None else strength
    st.armies.append(Army(aid, type_id, owner, x, y, 12, moves, s, -1, 0, 0, 0, flags, 0, 0, 0,
                          (-1, -1)))
    combat.refresh_map(st)
    return aid


def give(st, aid, itype, value):
    st.items.append(Item("i", int(itype), value, int(ItemState.CARRIED), aid, 0, 0))


def army(st, aid):
    return next(a for a in st.armies if a.id == aid)


def city(st, x, y, owner, defence):
    st.cities.append(City(len(st.cities), x, y, "c", owner, owner, defence))
    for dx in (0, 1):
        for dy in (0, 1):
            set_terrain(st, x + dx, y + dy, Terrain.CITY)
    combat.refresh_map(st)
    return len(st.cities) - 1


# ----------------------------------------------------------------------------- battle class


@pytest.mark.parametrize("t,c", [(0, 1), (1, 1), (2, 1), (3, 1), (4, 2), (5, 3), (6, 3), (7, 1),
                                 (8, 1), (9, 1), (10, 0), (11, 0)])
def test_battle_class_jump_table(t, c):
    """ovl38:005b..007b: Forest 2, Hills/Mountains 3, City/Site 0, others (incl. Tower) 1."""
    st = mk_state()
    set_terrain(st, 5, 5, t)
    assert B.battle_class(st, 5, 5) == c


def test_battle_class_fortified_square_is_city():
    """ovl38:0045..0056: map bit 0x2000 -> class 0 on any terrain."""
    st = mk_state()
    set_terrain(st, 5, 5, HILLS)
    st.world.flags[5 * MAP_W + 5] |= MAP_FORTIFIED
    assert B.battle_class(st, 5, 5) == 0


# ----------------------------------------------------------------------------- items


def test_battle_and_command_items():
    """ovl38:0d1a sums type-1 values; ovl38:0d71 sums type-2 values + 1 per type-8 item; only
    items carried (state 3) by that army index count (ovl51:0531)."""
    st = mk_state()
    h = put(st, HERO_TYPE, 0, 1, 1)
    give(st, h, ItemType.BATTLE, 2)
    give(st, h, ItemType.BATTLE, 1)
    give(st, h, ItemType.COMMAND, 3)
    give(st, h, ItemType.STANDARD, 7)
    give(st, h + 1, ItemType.BATTLE, 5)                       # someone else's
    st.items.append(Item("i", int(ItemType.BATTLE), 4, int(ItemState.ON_MAP), h, 0, 0))
    a = army(st, h)
    assert B.battle_items(st, a) == 3
    assert B.command_items(st, a) == 4


# ----------------------------------------------------------------------------- hero bonus


@pytest.mark.parametrize("s,item,bonus", [(3, 0, 0), (4, 0, 1), (6, 0, 1), (7, 0, 2), (8, 0, 2),
                                          (9, 0, 3), (7, 2, 3), (9, 5, 3), (0, 0, 0)])
def test_hero_table(s, item, bonus):
    """HEROTAB DS:0ce4 = 0,0,0,0,1,1,1,2,2,3 indexed by min(9, strength + battle items)
    (asm ovl38:074e..078b, 085c)."""
    st = mk_state()
    h = put(st, HERO_TYPE, 0, 1, 1, strength=s)
    if item:
        give(st, h, ItemType.BATTLE, item)
    assert B.side_bonus(st, [army(st, h)], 1).hero_bonus == bonus


def test_hero_bonus_best_hero_plus_all_command_items():
    """Only the best hero indexes HEROTAB; command items of every hero add (asm ovl38:0834)."""
    st = mk_state()
    h1 = put(st, HERO_TYPE, 0, 1, 1, strength=9)
    h2 = put(st, HERO_TYPE, 0, 1, 1, strength=7)
    give(st, h1, ItemType.COMMAND, 1)
    give(st, h2, ItemType.COMMAND, 2)
    assert B.side_bonus(st, [army(st, h1), army(st, h2)], 1).hero_bonus == 3 + 3


# ----------------------------------------------------------------------------- stack bonus, cap


def test_highest_stack_bonus_only():
    """Stack bonus = max of nonzero w[9+c] (asm ovl38:07c4..0831): 1 and 2 give 2, not 3."""
    types = default_types()
    types[1] = atype(1, stack_bonus_open=1)
    types[2] = atype(2, stack_bonus_open=2, stack_bonus_woods=1)
    st = mk_state(types)
    ids = [put(st, 1, 0, 1, 1), put(st, 2, 0, 1, 1)]
    sb = B.side_bonus(st, [army(st, i) for i in ids], 1)
    assert sb.stack_bonus == 2
    assert B.side_bonus(st, [army(st, i) for i in ids], 2).stack_bonus == 1
    assert B.side_bonus(st, [army(st, i) for i in ids], 0).stack_bonus == 0


def test_cap_includes_city_bonus_and_enemy_modifier_after_cap():
    """B_total = min(SCN 0x112, hero + stack + city) + A.enemy_mod (decomp 06a6ab)."""
    types = default_types()
    types[3] = atype(3, stack_bonus_city=2)
    types[4] = atype(4, enemy_stack_mod=-1)
    st = mk_state(types, cap=5)
    ci = city(st, 10, 10, 1, 2)
    d = [put(st, HERO_TYPE, 1, 10, 10, strength=9), put(st, 3, 1, 10, 10)]
    a = put(st, 4, 0, 9, 10)
    s = combat.prepare(st, (a,), 10, 10)
    assert (s.d_bonus.hero_bonus, s.d_bonus.stack_bonus, s.city_bonus) == (3, 2, 2)
    assert s.d_total == 5 - 1                       # 7 capped at 5, then Elephants-like -1
    assert s.a_total == 0                           # nothing of its own; defender mod is 0
    st.flags[SCN_BONUS_CAP] = 9
    assert combat.prepare(st, (a,), 10, 10).d_total == 7 - 1
    assert ci == 0


def test_positive_enemy_modifier_never_counts():
    """The enemy modifier is min(0, nonzero w14) (asm ovl38:07ae..07c1: starts at 0, jge)."""
    types = default_types()
    types[4] = atype(4, enemy_stack_mod=2)
    st = mk_state(types)
    assert B.side_bonus(st, [army(st, put(st, 4, 0, 1, 1))], 1).enemy_mod == 0


# ----------------------------------------------------------------------------- cancel modes


def _cancel_state(att_mode, def_mode):
    types = default_types()
    types[5] = atype(5, cancel_mode=att_mode)
    types[6] = atype(6, cancel_mode=def_mode, stack_bonus_city=1)
    types[7] = atype(7, stack_bonus_city=2)
    st = mk_state(types, cap=9)
    city(st, 10, 10, 1, 2)
    put(st, HERO_TYPE, 1, 10, 10, strength=9)                    # defender hero bonus 3
    put(st, 6, 1, 10, 10)                                         # defender stack bonus 1
    a_ids = (put(st, 5, 0, 9, 10), put(st, HERO_TYPE, 0, 9, 10, strength=7), put(st, 7, 0, 9, 10))
    return combat.prepare(st, a_ids, 10, 10)


def test_cancel_none():
    s = _cancel_state(0, 0)
    assert (s.a_total, s.d_total) == (2 + 2, 3 + 1 + 2)


def test_cancel_mode_1_city_bonus_attacker_only():
    """w15 == 1 on side A cancels the city bonus; on side B it does nothing (asm ovl38:078d)."""
    assert _cancel_state(1, 0).d_total == 3 + 1
    s = _cancel_state(0, 1)
    assert (s.a_total, s.d_total) == (4, 6)


def test_cancel_mode_2_cancels_other_hero_bonus():
    s = _cancel_state(2, 0)
    assert s.d_total == 1 + 2                           # defender hero bonus gone
    assert _cancel_state(0, 2).a_total == 2             # attacker hero bonus (2) gone


def test_cancel_mode_3_cancels_other_stack_bonus():
    s = _cancel_state(3, 0)
    assert s.d_total == 3 + 2                           # defender stack bonus gone, city stays
    assert _cancel_state(0, 3).a_total == 2             # attacker stack bonus (2) gone


def test_cancel_plus_one_is_not_applied():
    """Register T2b: the "+1" of modes 2/3 is not added by ovl38:008b; it stays Unverified."""
    from warlords2.rules.constants import Unverified
    assert isinstance(K.CANCEL_PLUS_ONE, Unverified) and K.CANCEL_PLUS_ONE.row == "T2b"
    s = _cancel_state(2, 0)
    assert s.a_total == 4                               # no +1


# ----------------------------------------------------------------------------- city bonus


@pytest.mark.parametrize("owner,fort,expect", [(1, False, 3), (NO_OWNER, False, 1), (1, True, 1),
                                               (NO_OWNER, True, 0)])
def test_city_bonus(owner, fort, expect):
    """Fortified first tile -> 1, else city defence; halved (C division) for owner 0xf."""
    st = mk_state()
    city(st, 10, 10, owner, 3)
    if fort:
        st.world.flags[10 * MAP_W + 10] |= MAP_FORTIFIED
    assert B.city_bonus(st, 11, 11, 0, (10, 10), 0, owner, False) == expect
    assert B.city_bonus(st, 11, 11, 0, (10, 10), 0, owner, True) == 0
    assert B.city_bonus(st, 11, 11, 1, (10, 10), 0, owner, False) == 0


def test_site_bonus_two():
    st = mk_state()
    set_terrain(st, 4, 4, Terrain.SITE)
    assert B.city_bonus(st, 4, 4, 0, (4, 4), -1, 1, False) == 2
    assert B.city_bonus(st, 4, 4, 0, (4, 4), -1, NO_OWNER, False) == 1


# ----------------------------------------------------------------------------- unit strength


def test_unit_cap_15():
    """Signed byte sum >= 16 becomes 15 (decomp 06a6ab)."""
    types = default_types()
    types[8] = atype(8, strength=9, str_bonus_open=2)
    st = mk_state(types)
    a = army(st, put(st, 8, 0, 1, 1))
    assert B.unit_strength(st, a, 5, 1, PLAIN) == (15, False)
    assert B.unit_strength(st, a, 3, 1, PLAIN) == (14, False)
    assert B.unit_strength(st, a, 3, 2, PLAIN) == (12, False)    # own bonus only for its class


def test_hero_battle_items_add_to_own_strength():
    st = mk_state()
    h = put(st, HERO_TYPE, 0, 1, 1, strength=6)
    give(st, h, ItemType.BATTLE, 2)
    assert B.unit_strength(st, army(st, h), 1, 1, PLAIN) == (9, False)


@pytest.mark.parametrize("t,expect", [(Terrain.WATER, (4, True)), (Terrain.SHORE, (4, True)),
                                      (Terrain.PLAIN, (14, False))])
def test_aboard_strength_4_on_water_and_shore(t, expect):
    """Aboard (+0xc bit 0x1000) on terrain 2/3: strength 4, no bonuses (decomp 06a6ab)."""
    types = default_types()
    types[8] = atype(8, strength=9, str_bonus_open=2)
    st = mk_state(types)
    a = army(st, put(st, 8, 0, 1, 1, flags=B.ABOARD_FLAG))
    assert B.unit_strength(st, a, 3, 1, t) == expect


def test_no_lower_clamp_in_setup():
    """Strength may go to 0 or below in the set-up; the battle loop uses max(1, s)."""
    types = default_types()
    types[4] = atype(4, enemy_stack_mod=-3)
    st = mk_state(types)
    d = put(st, 1, 1, 5, 5, strength=1)
    a = put(st, 4, 0, 4, 5)
    s = combat.prepare(st, (a,), 5, 5)
    assert s.d_total == -3 and s.d_strength == [-2]


# ----------------------------------------------------------------------------- real data


@pytest.mark.gamedata
def test_armytype_data_bonuses(game):
    """With ARMYTYPE.DAT (tables.md §1): type 25 stack +2 in every class, type 18 w14 = -1,
    type 10 w15 = 1, type 19 w15 = 2, type 27 w15 = 3."""
    types = [ArmyType.from_record(r) for r in parse_armytypes(GameDir(game).read("TERRAIN0/ARMYTYPE.DAT"))]
    st = mk_state(types)
    dragon, eleph, cat = put(st, 25, 0, 1, 1), put(st, 18, 0, 1, 1), put(st, 10, 0, 1, 1)
    for c in range(4):
        sb = B.side_bonus(st, [army(st, dragon), army(st, eleph), army(st, cat)], c)
        assert (sb.stack_bonus, sb.enemy_mod, sb.cancel_city) == (2, -1, True)
    assert B.side_bonus(st, [army(st, put(st, 19, 0, 1, 1))], 1).cancel_hero
    assert B.side_bonus(st, [army(st, put(st, 27, 0, 1, 1))], 1).cancel_stack
