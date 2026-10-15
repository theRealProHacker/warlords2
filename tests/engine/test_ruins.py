"""rules.ruins: Search, guardians, ruin rewards, temples, sages, site tiles (M7a).
Expected values from out/asm/ovl34.asm and the decompilation of ovl34 / ovl35:09f2."""
import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import (HERO_TYPE, MAP_EXPLORED, MAP_W, Control, ItemState, SiteKind, Terrain)
from warlords2.model.site import Site
from warlords2.model.state import Monster
from warlords2.rules import engine
from warlords2.rules import ruins as R
from warlords2.rules.engine import IllegalCommand
from warlords2.rules.movement import remove_army

from test_bonuses import put, set_terrain
from test_heroes import dice, hero, mk

SEEN = 0x20


def site(st, x, y, kind, item=0, guard=0, flag=0, shown=0xFF):
    set_terrain(st, x, y, Terrain.SITE)
    st.sites.append(Site(x, y, "s", int(kind), item, guard, flag, shown))
    return len(st.sites) - 1


def mkr(**opts):
    st = mk(**opts)
    st.monsters = [Monster("", 0)] + [Monster("m%d" % t, t) for t in range(1, 10)]
    return st


def explored(st, x, y):
    return bool(st.world.flags[y * MAP_W + x] & MAP_EXPLORED)


# ----------------------------------------------------------------------------- guardians


@pytest.mark.parametrize("s,h,b,m,roll,dies", [
    (1, 5, 0, 9, 73, False),      # 90 + 3 + 5*(5-9) = 73: dies only above
    (1, 5, 0, 9, 74, True),
    (3, 2, 2, 5, 100, True),      # 90 + 9 - 5 = 94
    (3, 2, 2, 5, 94, False),
    (8, 9, 3, 1, 100, False)])    # 90 + 24 + 55 >= 100
def test_guardian_survival_formula(s, h, b, m, roll, dies):
    """ovl34:07ad: dies when 90 + 3S + 5(H + B - M) < rnd(1,100,0)."""
    st = mkr()
    si = site(st, 5, 5, SiteKind.GOLD_RUIN, guard=m)
    hr = hero(st, strength=h)
    for _ in range(s - 1):
        put(st, 1, 0, 5, 5)
    if b:
        st.items[9].type, st.items[9].value = 1, b
        st.items[9].state, st.items[9].holder = int(ItemState.CARRIED), hr.id
    dice(st, [roll])
    assert R.guardian_kills(st, st.sites[si], hr) == dies


def test_hero_killed_in_a_ruin(monkeypatch):
    """ovl34:01ab: death -> news (1, -2), statistics +1, items fall, hero freed; nothing found."""
    st = mkr()
    si = site(st, 5, 5, SiteKind.GOLD_RUIN, guard=9)
    hr = hero(st, strength=1)
    st.items[0].state, st.items[0].holder = int(ItemState.CARRIED), hr.id
    gold = st.players[0].gold
    dice(st, [100])
    ev = engine.apply(st, C.Search((hr.id,)))
    assert any(isinstance(e, E.HeroDied) for e in ev)
    assert hr.owner == 0xFF and st.players[0].gold == gold and not explored(st, 5, 5)
    assert st.flags[0x1167] == 1 and st.flags[0x116B] == 1
    assert st.news[0][0][:3] == [1, 0xFFFE, 0] and st.items[0].state == ItemState.ON_MAP
    assert st.sites[si].guardian_or_ally == 9


@pytest.mark.parametrize("flag,die,gold", [(0, 1, 503), (0, 500, 2000), (1, 1, 1003), (1, 1000, 4000)])
def test_gold_ruin(flag, die, gold):
    """ovl34:01ab kind 4: rnd(3,500,500), rnd(3,1000,1000) with +0x1b; exp + 3; explored."""
    st = mkr()
    site(st, 5, 5, SiteKind.GOLD_RUIN, flag=flag)
    hr = hero(st)
    st.players[0].gold = 0
    dice(st, [die, die, die])
    engine.apply(st, C.Search((hr.id,)))
    assert st.players[0].gold == gold and explored(st, 5, 5)
    assert st.heroes[hr.hero_slot].exp == 3
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Search((hr.id,)))


@pytest.mark.parametrize("flag,die,n", [(0, 1, 1), (0, 2, 2), (1, 1, 3), (1, 2, 4)])
def test_allies_ruin(flag, die, n):
    st = mkr()
    site(st, 5, 5, SiteKind.ALLIES_RUIN, guard=24, flag=flag)
    hr = hero(st)
    dice(st, [die])
    engine.apply(st, C.Search((hr.id,)))
    assert sum(1 for a in st.armies if a.type_id == 24 and a.owner == 0) == n


@pytest.mark.parametrize("control,state", [(Control.HUMAN, ItemState.ON_MAP), (Control.COMPUTER, ItemState.CARRIED)])
def test_item_ruin(control, state):
    """Kind 2: a human finds the item lying on the square, the computer's hero carries it; the
    site becomes kind 0; the guardian is fought first."""
    st = mkr()
    st.players[0].control = control
    si = site(st, 5, 5, SiteKind.ITEM_RUIN, item=12, guard=1)
    hr = hero(st)
    dice(st, [1])
    ev = engine.apply(st, C.Search((hr.id,)))
    assert any(isinstance(e, E.GuardianFought) for e in ev)
    it = st.items[12]
    assert it.state == state and st.sites[si].kind == 0 and st.sites[si].guardian_or_ally == 0
    if control == Control.HUMAN:
        assert (it.x, it.y) == (5, 5)
        engine.apply(st, C.TakeItem(hr.id, 12))
    assert st.items[12].holder == hr.id


def test_search_needs_moves_site_and_hero():
    st = mkr()
    site(st, 5, 5, SiteKind.GOLD_RUIN)
    u = put(st, 1, 0, 5, 5)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Search((u,)))                 # no hero: only temples
    hr = hero(st, x=6, y=6)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Search((hr.id,)))             # not on a site
    hr.x, hr.y, hr.moves_left = 5, 5, 0
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Search((hr.id,)))


def test_search_is_ovl34_0000_on_the_adopted_selection(monkeypatch):
    """Search(group) makes the group the selection and runs ovl34:0000 (`search_selection`) on it,
    after the refusals; a searched site refuses before it runs."""
    st = mkr()
    site(st, 5, 5, SiteKind.GOLD_RUIN)
    hr = hero(st, x=5, y=5)
    seen = []
    monkeypatch.setattr(R, "search_selection",
                        lambda s, cls: seen.append((s.selection.selected, s.selection.hero, cls)) or ["ran"])
    assert engine.apply(st, C.Search((hr.id,))) == ["ran"] and seen == [(hr.id, hr.id, C.Search)]
    st.world.flags[5 * MAP_W + 5] |= MAP_EXPLORED
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Search((hr.id,)))
    assert len(seen) == 1


def test_search_keeps_the_stored_hero_of_the_selection():
    """07be:0279 runs ovl34:0000 on DS:5e5e as stored: for the selected stack it is the hero a map
    select left (ovl67:0955, the lowest slot), not 0529's leader; another group gets 0529's."""
    st = mkr()
    si = site(st, 5, 5, SiteKind.SAGE)
    h1, h2 = hero(st, x=5, y=5), hero(st, x=5, y=5)
    sel = st.selection
    sel.selected, sel.moving, sel.group, sel.count, sel.hero = h1.id, [h2.id, h1.id], 1, 2, h2.id
    ev = engine.apply(st, C.Search((h1.id, h2.id)))
    assert ev[0].info == {"site": si, "kind": int(SiteKind.SAGE), "hero": h2.id}
    st.pending = None
    st.world.flags[5 * MAP_W + 5] &= ~MAP_EXPLORED
    engine.apply(st, C.Search((h1.id,)))                    # not the selection: 0529's hero
    assert sel.hero == h1.id


def test_search_selection_reads_the_hero_pointer_as_it_is():
    """ovl34:009b: DS:5e5e is a pointer; a freed record there is not null, so a stack on a temple
    whose hero word points at it is not blessed (the hero branch tests the searched bit and the
    kind; a temple for a human opens the menu)."""
    st = mkr()
    si = site(st, 5, 5, SiteKind.TEMPLE)
    u = put(st, 1, 0, 5, 5)
    gone = hero(st, x=9, y=9)
    remove_army(st, gone)                                     # a freed record
    sel = st.selection
    sel.selected, sel.moving, sel.hero = u, [u], gone.id
    ev = R.search_selection(st)
    assert ev and ev[0].info.get("temple_menu") and ev[0].info["site"] == si
    sel.hero = -1
    assert isinstance(R.search_selection(st)[0], E.Blessed)


# ----------------------------------------------------------------------------- temples


def test_temple_blessings_once_per_temple_first_four_only():
    """ovl34:08a1: temples 1-4 (table order) set +0xc 0x02..0x10 and strength + 1; a fifth
    temple does nothing; a blessed hero gets + 1 exp."""
    st = mkr()
    temples = [site(st, 10 + 2 * i, 5, SiteKind.TEMPLE) for i in range(5)]
    u = put(st, 1, 0, 10, 5, strength=3)
    engine.apply(st, C.Search((u,)))
    assert st.armies[u].strength == 4 and st.armies[u].flags & 0x02
    engine.apply(st, C.Search((u,)))
    assert st.armies[u].strength == 4
    for i, bit in zip(range(1, 5), (0x04, 0x08, 0x10, None)):
        a = st.armies[u]
        a.x = 10 + 2 * i
        before = a.strength
        ev = engine.apply(st, C.Search((u,)))
        if bit:
            assert a.flags & bit and a.strength == before + 1
        else:
            assert a.strength == before and ev[0].info["armies"] == []
    assert len(temples) == 5


def test_human_temple_menu_bless_and_quest():
    st = mkr(quests=1)
    site(st, 5, 5, SiteKind.TEMPLE)
    hr = hero(st)
    ev = engine.apply(st, C.Search((hr.id,)))
    assert ev[0].info["temple_menu"] and hr.strength == 5
    engine.apply(st, C.TempleChoice("bless"))
    assert hr.strength == 6 and st.heroes[hr.hero_slot].exp == 1
    dice(st, [7])                                        # DS:00a0[6] = 6: gold quest
    dice(st, [7, 1, 1, 1])
    ev = engine.apply(st, C.TempleChoice("quest"))
    q = st.players[0].quest
    assert (q.active, q.type, q.hero, q.amount) == (1, 6, hr.id, 503)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.TempleChoice("quest"))       # a quest is running


# ----------------------------------------------------------------------------- sages


def _sage_state():
    st = mkr(hidden_map=1)
    st.world.roads = [0] * len(st.world.roads)
    sg = site(st, 20, 20, SiteKind.SAGE)
    near_gold = site(st, 30, 20, SiteKind.GOLD_RUIN, flag=1, shown=0)
    site(st, 25, 20, SiteKind.GOLD_RUIN, flag=1, shown=0)        # nearer gold
    site(st, 20, 60, SiteKind.ALLIES_RUIN, flag=1, shown=0)      # too far (40)
    site(st, 22, 20, SiteKind.ITEM_RUIN, item=14, flag=1, shown=0)
    site(st, 21, 20, SiteKind.GOLD_RUIN, flag=0, shown=0)        # not special
    hr = hero(st, x=20, y=20)
    return st, sg, near_gold, hr


def test_sage_offer_lists_special_unshown_sites_within_35():
    """ovl34:1610: +0x1b set, not shown to p, distance < 35: one gold entry (-1), item entries."""
    st, sg, _, hr = _sage_state()
    ev = engine.apply(st, C.Search((hr.id,)))
    off = st.pending
    assert isinstance(off, E.SageOffered) and off.info["entries"] == [-1, 14] and off.info["map_view"]
    assert st.heroes[hr.hero_slot].exp == 3 and explored(st, 20, 20)
    assert st.news[0][0][:2] == [6, 0x65]
    assert ev[0].info["kind"] == SiteKind.SAGE


def test_sage_gem():
    st, *_ , hr = _sage_state()
    engine.apply(st, C.Search((hr.id,)))
    st.players[0].gold = 0
    dice(st, [1, 1, 1])
    engine.apply(st, C.SageChoice("gem"))
    assert st.players[0].gold == 503 and st.pending is None


def test_sage_shows_the_nearest_gold_ruin_and_redraws_site_tiles():
    st, _, _, hr = _sage_state()
    engine.apply(st, C.Search((hr.id,)))
    engine.apply(st, C.SageChoice("show_site", 0))
    nearest = st.site_at(25, 20)
    assert st.sites[nearest].shown_mask & 1 and not st.sites[st.site_at(30, 20)].shown_mask & 1
    assert st.world.roads[20 * MAP_W + 25] & SEEN
    assert st.world.tiles[20 * MAP_W + 25] == 0x0A and st.world.tiles[20 * MAP_W + 30] == 0x0C - 2
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SageChoice("gem"))            # answered


def test_sage_map_view_rectangle():
    """ovl34:0cd6: corner (x - rnd(1,5,8), y - rnd(1,5,8)), size rnd(1,10,15)^2, reveal per square."""
    st, *_, hr = _sage_state()
    engine.apply(st, C.Search((hr.id,)))
    st.world.roads = [0] * len(st.world.roads)
    dice(st, [1, 5, 1, 10])                              # back 9 / 13, size 16 / 25
    ev = engine.apply(st, C.SageChoice("map_view", (50, 40)))
    assert ev[0].info["map_view"] == (41, 27, 16, 25)
    seen = {(i % MAP_W, i // MAP_W) for i, r in enumerate(st.world.roads) if r & SEEN}
    assert seen == {(x, y) for x in range(40, 58) for y in range(26, 53)}


def test_sage_map_view_clipped_at_the_edges():
    st, *_, hr = _sage_state()
    engine.apply(st, C.Search((hr.id,)))
    dice(st, [5, 5, 10, 10])
    ev = engine.apply(st, C.SageChoice("map_view", (105, 150)))
    x0, y0, w, h = ev[0].info["map_view"]
    assert (x0, y0) == (92, 137) and x0 + w == 111 and y0 + h == 155


def test_site_tiles():
    """ovl35:09f2: 0x0b temple, 0x0c plain, 0x09 special hidden with Quests, else 0x0a."""
    st = mkr(quests=1)
    for i, (k, f, sh) in enumerate([(1, 0, 0), (4, 0, 0), (4, 1, 0), (4, 1, 1)]):
        site(st, 2 * i, 0, k, flag=f, shown=sh)
    R.site_tiles(st, 0)
    assert [st.world.tiles[2 * i] for i in range(4)] == [0x0B, 0x0C, 0x09, 0x0A]
    from dataclasses import replace
    st.options = replace(st.options, quests=0)
    R.site_tiles(st, 0)
    assert st.world.tiles[4] == 0x0A
