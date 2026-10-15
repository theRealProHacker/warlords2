"""ovl22 move phases (ai.md §6.6) as warlords2.ai.phases.move, pinned to the listing: scan
orders, signed compares, ties, record writes, and the order of the calls that draw rnd.  The
cross-phase callees (ovl20 neutral, ovl24 clean city, ovl18 diplomacy) are fakes injected into
sys.modules; the move executor, the battle simulation and the distance map are stubbed where a
test pins the calls rather than their effect."""
import dataclasses
import sys
import types

import pytest

from warlords2.ai import util as U
from warlords2.ai.phases import move as MV
from warlords2.model.ids import HERO_TYPE, MAP_EXPLORED, MAP_W, Terrain
from warlords2.model.options import GameOptions
from warlords2.model.site import Site
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import movement as M
from warlords2.rules import pathfinding as P
from warlords2.rules import ruins as R
from warlords2.rules import selection as S

from movekit import add_army, add_city, flat_state, paint, type_with

pytestmark = pytest.mark.gamedata


def high(st):
    st.flags[SCN_ARMY_HIGH] = len(st.armies)


class Calls:
    def __init__(self):
        self.log = []


@pytest.fixture
def fakes(monkeypatch):
    """Fake neutral / clean_city / diplomacy modules recording their calls."""
    rec = Calls()
    neutral = types.ModuleType("warlords2.ai.phases.neutral")
    neutral.explore = lambda st, i, c: rec.log.append(("explore", i, c)) or []
    neutral.nb = {}
    neutral.neutral_neighbours = lambda st, c: (
        rec.log.append(("nb", c)) or neutral.nb.get(c, (0, [0xFF] * 6, [0] * 6)))
    neutral.nearest_city = lambda st, x, y, side: rec.log.append(("near", x, y, side)) or neutral.near
    neutral.near = 10000
    clean = types.ModuleType("warlords2.ai.phases.clean_city")
    clean.delete_army = lambda st, i, r: rec.log.append(("delete_army", i, r)) or []
    clean.delete_list = lambda st, ids, r: rec.log.append(("delete_list", list(ids), r)) or []
    dip = types.ModuleType("warlords2.ai.phases.diplomacy")
    dip.f = 0
    dip.may_attack_city = lambda st, c: rec.log.append(("may", c)) or dip.f
    for name, mod in (("neutral", neutral), ("clean_city", clean), ("diplomacy", dip)):
        monkeypatch.setitem(sys.modules, "warlords2.ai.phases." + name, mod)
    rec.neutral, rec.clean, rec.dip = neutral, clean, dip
    return rec


def make(game, **opts):
    st = flat_state(game, options=GameOptions(**opts))
    st.ai.allocated = 1
    st.ai[0].simulations = 10
    st.ai[0].quest_city = -1
    st.sites = []
    return st


@pytest.fixture
def st(game):
    return make(game)


def stub_exec(monkeypatch, log):
    def fake(state, x, y, keep=0):
        log.append(("exec", x, y, state.selection.selected, tuple(state.selection.moving)))
        S.mark_done(state)
        return 2, []
    monkeypatch.setattr(M, "execute_move", fake)


def walker(st):
    return type_with(st, flag16=0)


def flyer(st):
    return type_with(st, flag16=1)


# ------------------------------------------------------------------------------- move #1 / #2


def test_move_visited_bookkeeping_and_invalid_orders(st, fakes, monkeypatch):
    """0000: 0x200 cleared, set again for moves < 2; an army with no order kind (00b1) loses
    goto and gets 0x40 on every DS:5e3e member; goto x < 0 is skipped (0087)."""
    log = []
    stub_exec(monkeypatch, log)
    t = walker(st)
    a = add_army(st, t, 10, 10, flags=0x201, moves=1)
    b = add_army(st, t, 20, 20, flags=0x001)
    b.goto = (25, 20)
    c = add_army(st, t, 30, 30, flags=0x001)
    high(st)
    MV.move(st)
    assert a.flags & 0x200 and not a.flags & 0x40              # moves < 2: visited, never moved
    assert b.flags & 0x40 and b.goto == (-1, -1)                # kind 0 -> invalid
    assert c.flags & 0x200 and not c.flags & 0x40              # no goto: skipped
    assert log == []


def test_move_invalid_city_orders_and_own_city_goto(st, fakes, monkeypatch):
    """00d2 c >= count (unsigned), 00f8 c == AI[+0x46], 0110..0162 razed corner -> invalid;
    an own order city -> leader goto = corner + 1, then 0a8b:0001."""
    log = []
    stub_exec(monkeypatch, log)
    t = walker(st)
    own = add_city(st, 40, 40, 0)
    quest = add_city(st, 50, 40, 15)
    razed = add_city(st, 60, 40, 15)
    paint(st, 60, 40, Terrain.PLAIN)
    armies = []
    for k, cidx in enumerate((own, quest, razed, 9)):
        a = add_army(st, t, 10 + 10 * k, 10, flags=1)
        a.order, a.vector_dest, a.goto = 1, cidx, (0, 0)
        armies.append(a)
    st.ai[0].quest_city = quest
    high(st)
    MV.move(st)
    assert [bool(a.flags & 0x40) for a in armies[1:]] == [True, True, True]
    assert all(a.order & 0xF == 0 and a.goto == (-1, -1) for a in armies[1:])
    assert log == [("exec", 41, 41, armies[0].id, (armies[0].id,))]


def test_move_retarget_gate_and_reread(st, fakes, monkeypatch):
    """01cc: flag 0x80 -> 05ff; result 0 skips the move; k / c re-read from the army after it."""
    log = []
    stub_exec(monkeypatch, log)
    t = walker(st)
    c0 = add_city(st, 40, 40, 15)
    c1 = add_city(st, 60, 40, 0)
    a = add_army(st, t, 10, 10, flags=0x81)
    a.order, a.vector_dest, a.goto = 1, c0, (40, 40)
    b = add_army(st, t, 12, 10, flags=0x81)
    b.order, b.vector_dest, b.goto = 1, c0, (40, 40)
    high(st)
    st.selection.next_ref = (10, 10)
    results = {a.id: 0, b.id: 1}

    def fake_retarget(state):
        lead = state.armies[state.selection.selected]
        log.append(("retarget", lead.id))
        if results[lead.id]:
            lead.vector_dest = c1
        return results[lead.id], []
    monkeypatch.setattr(MV, "retarget", fake_retarget)
    MV.move(st)
    # 05c4: |dx| + |dy| with 0 counting 9000, so b (2 away) comes before a (on the square)
    assert log == [("retarget", b.id), ("exec", 61, 41, b.id, (b.id,)), ("retarget", a.id)]


# ------------------------------------------------------------------------------- 05ff


def _group(st, ids, leader):
    M.set_selection(st, leader, ids)


def test_retarget_foreign_city(st, fakes):
    """0642..065c / 0827: c not own: ovl18:0851 != 0 -> 1 untouched; 0 -> orders and gotos of
    DS:5e3e cleared without 0x40 -> 0."""
    t = walker(st)
    c = add_city(st, 40, 40, 3)
    a = add_army(st, t, 10, 10, flags=0x81)
    a.order, a.vector_dest, a.goto = 1, c, (40, 40)
    high(st)
    _group(st, [a.id], a.id)
    fakes.dip.f = 1
    assert MV.retarget(st) == (1, [])
    assert a.order == 1 and a.vector_dest == c
    fakes.dip.f = 0
    assert MV.retarget(st) == (0, [])
    assert (a.order, a.vector_dest, a.goto, a.flags & 0x40) == (0, 0, (-1, -1), 0)
    assert fakes.log[0] == ("may", c)


def test_retarget_own_city_neighbours_ties_and_p(st, fakes, monkeypatch):
    """0661..0687: neighbours of the city on the leader's square when it has any, else of c;
    slots 5..0, unseen skipped, strict < on dist (highest slot wins ties); with Neutral Cities
    off p stays 100 and no simulation is drawn."""
    t = walker(st)
    c = add_city(st, 10, 10, 0)
    n1 = add_city(st, 20, 10, 15)
    n2 = add_city(st, 10, 20, 15)                       # same distance as n1
    n3 = add_city(st, 12, 12, 15)                       # nearest but unseen
    a = add_army(st, t, 10, 10, flags=0x81)
    a.order, a.vector_dest = 1, c
    high(st)
    _group(st, [a.id], a.id)
    st.ai[0].city_flags[n3] |= 1
    fakes.neutral.nb[c] = (3, [n1, 0xFF, n2, n3, 0xFF, 0xFF], [0] * 6)
    sims = []
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: sims.append((x, y)) or 100)
    assert MV.retarget(st)[0] == 1
    assert sims == []
    assert fakes.log[1] == ("nb", c)                    # here == c (own square): 01f6(here) first
    assert a.vector_dest == n2 and a.order & 0xF == 1      # slot 2 beats slot 0 on the tie
    assert a.goto == (10, 20)                           # 0c7e: foreign city above the army: as is


def test_retarget_p_not_reset_with_neutral_cities(game, fakes, monkeypatch):
    """06c1..06f2: with Neutral Cities on each unflagged candidate draws 15c5 in slot order
    5..0; p is never reset, so a candidate after a refusal still needs its own p."""
    st = make(game, neutral_cities=1)
    t = walker(st)
    c = add_city(st, 10, 10, 0)
    n1 = add_city(st, 20, 10, 15)
    n2 = add_city(st, 30, 10, 15)
    a = add_army(st, t, 50, 50, flags=0x81)
    a.order, a.vector_dest = 1, c
    high(st)
    _group(st, [a.id], a.id)
    fakes.neutral.nb[c] = (2, [n1, n2, 0xFF, 0xFF, 0xFF, 0xFF], [0] * 6)
    odds = {(30, 10): 74, (20, 10): 75}
    sims = []
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: sims.append((x, y)) or odds[(x, y)])
    assert MV.retarget(st)[0] == 1
    assert sims == [(30, 10), (20, 10)] and a.vector_dest == n1


def test_retarget_none_found_explores_reselected_slots(game, fakes, monkeypatch):
    """07a6..0821: nothing found, Hidden Map, turn < 10: DS:5e3e[s] is re-read for every slot,
    and 0e4b reselects (0ae7), so only what DS:5e3e then holds is sent on."""
    st = make(game, hidden_map=1)
    t = walker(st)
    c = add_city(st, 10, 10, 0)
    a = add_army(st, t, 50, 50, flags=0x81)
    b = add_army(st, t, 50, 50, flags=0x81)
    a.order, a.vector_dest = 1, c
    high(st)
    _group(st, [a.id, b.id], a.id)

    def explore(state, i, cc):
        fakes.log.append(("explore", i, cc))
        M.set_selection(state, i, [i])                  # 0e4b's 0ae7([i]) reselects
        return []
    fakes.neutral.explore = explore
    assert MV.retarget(st)[0] == 0
    assert [e for e in fakes.log if e[0] == "explore"] == [("explore", a.id, -1)]
    st2 = make(game)                                     # no Hidden Map -> 1, nothing explored
    a2 = add_army(st2, t, 50, 50, flags=0x81)
    add_city(st2, 10, 10, 0)
    a2.order, a2.vector_dest = 1, 0
    high(st2)
    _group(st2, [a2.id], a2.id)
    assert MV.retarget(st2)[0] == 1


# ------------------------------------------------------------------------------- rescue


def test_rescue_razed_target_clears_mates_then_sends(st, fakes, monkeypatch):
    """0918..0ab7: moves == allowance + 2, not in a city, kind 1 at a razed city: every own
    mate with the same order loses kind and bits 4-6 (+0xf kept); the army itself too, so it
    then goes to 0c5b (0ae9 kind 0)."""
    sent = []
    monkeypatch.setattr(MV, "send_to_city", lambda s, i: sent.append(i) or [])
    t = walker(st)
    c = add_city(st, 40, 40, 15)
    paint(st, 40, 40, Terrain.PLAIN)
    a = add_army(st, t, 10, 10)
    a.moves_left = a.allowance + 2
    b = add_army(st, t, 10, 10)
    other = add_army(st, t, 10, 10)
    for x in (a, b):
        x.order, x.vector_dest = 0x71, c
    other.order, other.vector_dest = 0x71, 1
    high(st)
    MV.rescue(st)
    assert (a.order, a.vector_dest, b.order, other.order) == (0, c, 0, 0x71)
    assert sent == [a.id]


def test_rescue_skips(st, fakes, monkeypatch):
    """08e9 moves < allowance, 0ad1 explorer, 0ae9 any order, 0b30 city square: no 0c5b."""
    sent = []
    monkeypatch.setattr(MV, "send_to_city", lambda s, i: sent.append(i) or [])
    t = walker(st)
    add_city(st, 30, 30, 0)
    low = add_army(st, t, 10, 10)
    low.moves_left = low.allowance - 1
    expl = add_army(st, t, 11, 10, flags=0x20)
    ordered = add_army(st, t, 12, 10)
    ordered.order = 3
    in_city = add_army(st, t, 30, 30)
    ok = add_army(st, t, 13, 10)
    high(st)
    MV.rescue(st)
    assert sent == [ok.id]
    del low, expl, ordered, in_city


def test_last_rescue_conditions_and_writes(st, fakes, monkeypatch):
    """0b4d: only moves == allowance + 2 outside a city; flags &= 0xff5f, +0xe &= 0xf0 (bits
    4-7 kept), +0xf kept, goto -1; explorers and ordered armies too."""
    sent = []
    monkeypatch.setattr(MV, "send_to_city", lambda s, i: sent.append(i) or [])
    t = walker(st)
    a = add_army(st, t, 10, 10, flags=0xA1)
    a.moves_left = a.allowance + 2
    a.order, a.vector_dest, a.goto = 0x73, 5, (3, 3)
    b = add_army(st, t, 12, 10)
    b.moves_left = b.allowance + 1
    high(st)
    MV.last_rescue(st)
    assert sent == [a.id]
    assert (a.flags, a.order, a.vector_dest, a.goto) == (0x01, 0x70, 5, (-1, -1))


# ------------------------------------------------------------------------------- 0c5b / 0f3c


def test_send_to_city_weak_walker_disbanded(st, fakes):
    """0cc9..0cf6: a weak (allowance < 8 or strength < 3) walker is disbanded at once."""
    t = walker(st)
    a = add_army(st, t, 10, 10)
    a.strength = 2
    high(st)
    MV.send_to_city(st, a.id)
    assert fakes.log == [("near", 10, 10, 0), ("delete_army", a.id, 1)]


def test_send_to_city_drops_walkers_and_limits(st, fakes, monkeypatch):
    """0de5..0e56: flyers, heroes and others present: the walkers are dropped (holes kept for
    00ca); 0e86..0ec1: lim = 50 with a stack hero, min(near + 10); 0ef2: 0f3c gets the 12c9
    count; no target -> ovl24:00ca on the list with its holes."""
    tw, tf = walker(st), flyer(st)
    h = add_army(st, HERO_TYPE, 10, 10, moves=12)
    f = add_army(st, tf, 10, 10, moves=12)
    add_army(st, tw, 10, 10, moves=3)                      # filtered by 12c9 (moves < 8)
    w = add_army(st, tw, 10, 10, moves=12)                 # highest index: slot 0
    for x in (w, f, h):
        x.strength, x.allowance = 5, 12
    high(st)
    fakes.neutral.near = 20
    maps, picks = [], []
    monkeypatch.setattr(P, "distance_map", lambda s, lim, x, y, mode, mask: maps.append((lim, x, y)) or "dm")
    monkeypatch.setattr(MV, "pick_city", lambda s, n, dm: picks.append((n, dm)) or -1)
    MV.send_to_city(st, w.id)
    assert maps == [(30, 10, 10)]                          # hero: 50, near + 10 = 30 smaller
    assert picks == [(3, "dm")]                            # the 12c9 count, before the drop
    assert st.selection.moving == [-1, f.id, h.id]         # 14d3 copies the hole in place
    assert st.selection.selected == -1                     # DS:5e62 = DS:5e3e[0] = null
    assert (st.selection.count, st.selection.group) == (2, 1)
    assert st.selection.hero == h.id                       # 0529 with a null leader
    assert fakes.log[-1] == ("delete_list", [-1, f.id, h.id, -1, -1, -1, -1, -1], 1)


def test_send_to_city_limit_without_hero_and_order(st, fakes, monkeypatch):
    """0e8e..0ea6: no hero: lim = 10 * (strength / 2) of the trigger army; target found ->
    0ae7(list, 1, t, 0) and 0a8b:0001 with the leader's goto."""
    log = []
    stub_exec(monkeypatch, log)
    tf = flyer(st)
    a = add_army(st, tf, 10, 10, moves=12)
    a.strength, a.allowance = 7, 12
    b = add_army(st, tf, 10, 10, moves=12)
    high(st)
    city = add_city(st, 30, 10, 0)
    maps = []
    monkeypatch.setattr(P, "distance_map", lambda s, lim, x, y, mode, mask: maps.append(lim) or "dm")
    monkeypatch.setattr(MV, "pick_city", lambda s, n, dm: city)
    MV.send_to_city(st, a.id)
    assert maps == [30]
    assert a.order & 0xF == 1 and a.vector_dest == city and b.vector_dest == city
    assert log and log[0][1:3] == (31, 11)


def test_send_to_city_single_weak_flyer_disbanded(st, fakes, monkeypatch):
    """0e69..0e7e: n < 2 and weak (a flyer gets past the first test) -> disband army i."""
    a = add_army(st, flyer(st), 10, 10, moves=12)
    a.allowance = 6
    high(st)
    MV.send_to_city(st, a.id)
    assert fakes.log[-1] == ("delete_army", a.id, 1)


class FakeMap:
    def __init__(self, vals):
        self.vals = vals

    def value(self, x, y):
        return self.vals.get((x, y), 30000)


def test_pick_city_scores_ties_and_filters(st, fakes, monkeypatch):
    """0f3c: own city d + 30 (role 7: + 10), + 100 with n >= 4; foreign needs 15c5 >= 75 and
    scores d; strict < so the highest index wins ties; owner at peace skipped."""
    a_own = add_city(st, 10, 10, 0)
    b_own = add_city(st, 30, 10, 0)
    foe = add_city(st, 50, 10, 2)
    peace = add_city(st, 70, 10, 3)
    st.relations[0][2] = 2
    st.relations[0][3] = 0
    dm = FakeMap({(10, 9): 5, (30, 9): 5, (50, 9): 25, (70, 9): 1})
    sims = []
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: sims.append((x, y)) or 80)
    assert MV.pick_city(st, 1, dm) == foe                  # 25 < 35; the peace city never counts
    assert sims == [(50, 10)]
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: 74)
    assert MV.pick_city(st, 1, dm) == b_own                # 35 / 35: the higher index
    st.ai[0].role[a_own] = 7
    assert MV.pick_city(st, 1, dm) == a_own                # role 7: 15
    assert MV.pick_city(st, 4, dm) == a_own                # 115 vs 135
    del peace


def test_pick_city_unreachable_unseen_quest(st, fakes, monkeypatch):
    """104f x == -1 unreachable; 0fc0 unseen; 0fcf AI[+0x46] -> skipped."""
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: 100)
    c0 = add_city(st, 10, 10, 15)
    c1 = add_city(st, 30, 10, 15)
    c2 = add_city(st, 50, 10, 15)
    dm = FakeMap({(30, 9): 3, (50, 9): 3})
    st.ai[0].city_flags[c1] |= 1
    st.ai[0].quest_city = c2
    assert MV.pick_city(st, 1, dm) == -1
    del c0


# ------------------------------------------------------------------------------- 11a6


def _site(st, x, y, kind):
    st.sites.append(Site(x, y, "s", kind, 0, 0, 0, 0))
    paint(st, x, y, Terrain.SITE)
    st.world.roads[y * MAP_W + x] |= 0x20                # seen
    return len(st.sites) - 1


def test_hero_explore_no_hero_no_flyer(st, fakes):
    t = walker(st)
    a = add_army(st, t, 10, 10)
    h = add_army(st, HERO_TYPE, 10, 10)
    high(st)
    assert MV.hero_explore(st, [a.id] + [-1] * 7) == (0, [])
    lst = [-1, a.id, h.id] + [-1] * 5
    assert MV.hero_explore(st, lst) == (1, [])
    assert lst == [-1, a.id, h.id] + [-1] * 5           # untouched before the flyer test


def test_hero_explore_site_beats_city_and_scores(st, fakes, monkeypatch):
    """1429..1460 / 14dd..150e: a site within 40 always wins over any city (shared best,
    site tested first at 151b); the nearer of two sites wins; 0ae7 kind 3 flags 0x100."""
    log = []
    stub_exec(monkeypatch, log)
    h = add_army(st, HERO_TYPE, 10, 10)
    f = add_army(st, flyer(st), 10, 10)
    h.order, f.order, h.vector_dest = 0x23, 0x21, 9
    add_city(st, 11, 11, 0)                                 # city at distance 1: 114
    far = _site(st, 30, 10, 2)                              # d = 20: 70
    near = _site(st, 10, 22, 2)                             # d = 12: 203
    high(st)
    calls = []
    monkeypatch.setattr(MV, "search_on_arrival_result",
                        lambda s, i, si: calls.append((i, si)) or (2, []))
    lst = [f.id, h.id] + [-1] * 6
    assert MV.hero_explore(st, lst)[0] == 2
    assert lst == [h.id, f.id] + [-1] * 6
    assert calls == [(h.id, near)]
    assert h.order == 0x23 and h.vector_dest == near and h.flags & 0x100
    del far


def test_hero_explore_site_filters_and_city(st, fakes, monkeypatch):
    """Sites skipped: targeted by another own hero (kind 3, index), a temple, searched (0x4000),
    unseen around; then the city (role 7 counts 80 nearer) farther than 2 gets the order."""
    log = []
    stub_exec(monkeypatch, log)
    h = add_army(st, HERO_TYPE, 10, 10)
    f = add_army(st, flyer(st), 10, 10)
    other = add_army(st, HERO_TYPE, 40, 40)
    s0 = _site(st, 12, 10, 2)
    other.order, other.vector_dest = 3, s0
    _site(st, 13, 10, 1)                                    # temple
    s2 = _site(st, 14, 10, 2)
    st.world.flags[10 * MAP_W + 14] |= MAP_EXPLORED
    s3 = _site(st, 10, 14, 2)                               # nothing seen in its 3x3
    st.world.roads[14 * MAP_W + 10] &= ~0x20 & 0xFF
    near = add_city(st, 11, 10, 0)                          # d = 1: 114
    stag = add_city(st, 60, 60, 0)                          # d = 70 - 80 = -10: 125
    st.ai[0].role[stag] = 7
    high(st)
    r, _ = MV.hero_explore(st, [h.id, f.id] + [-1] * 6)
    assert r == 0 and h.vector_dest == stag and h.order & 0xF == 1
    assert log and log[0][1:3] == (61, 61)
    del s2, s3, near


def test_hero_explore_city_too_close(st, fakes, monkeypatch):
    """158d: the chosen city within distance 2 -> no order, no move, 0."""
    log = []
    stub_exec(monkeypatch, log)
    h = add_army(st, HERO_TYPE, 10, 10)
    f = add_army(st, flyer(st), 10, 10)
    add_city(st, 11, 11, 0)
    high(st)
    assert MV.hero_explore(st, [h.id, f.id] + [-1] * 6)[0] == 0
    assert log == [] and h.order == 0


# ------------------------------------------------------------------------------- 15c3


def test_search_on_arrival_codes(st, fakes, monkeypatch):
    """1604..162f not there / no moves -> 0; 1657 not terrain 11 -> 2; 166c..1694 searched ruin
    -> 2 (no search); a non-hero after the search -> 0; a hero -> 2 and 0x40 cleared on
    DS:5e3e[k < DS:5dfe]."""
    searched = []
    monkeypatch.setattr(MV, "search_command", lambda s: searched.append(s.selection.selected) or [])
    s = _site(st, 10, 10, 2)
    h = add_army(st, HERO_TYPE, 10, 10, flags=0x40)
    w = add_army(st, walker(st), 10, 10, flags=0x40)
    high(st)
    M.set_selection(st, h.id, [h.id, w.id])
    h.moves_left = 0
    assert MV.search_on_arrival_result(st, h.id, s) == (0, [])
    h.moves_left = 5
    assert MV.search_on_arrival_result(st, h.id, s)[0] == 2
    assert searched == [h.id] and not h.flags & 0x40 and not w.flags & 0x40
    assert MV.search_on_arrival_result(st, w.id, s)[0] == 0
    st.world.flags[10 * MAP_W + 10] |= MAP_EXPLORED
    assert MV.search_on_arrival_result(st, h.id, s)[0] == 2 and len(searched) == 2
    paint(st, 10, 10, Terrain.PLAIN)
    assert MV.search_on_arrival_result(st, h.id, s)[0] == 2 and len(searched) == 2


def test_search_on_arrival_quest_and_allies(game, fakes, monkeypatch):
    """16bf..16ed: a temple with Quests on and no active quest -> ovl01:0d7a(1); 174a: Hidden Map
    and an allies ruin (kind read after the search) -> own w13 armies without order on the
    square become explorers and go exploring (N-1..0)."""
    from warlords2.rules import quests as Q
    st = make(game, quests=1, hidden_map=1)
    monkeypatch.setattr(MV, "search_command", lambda s: [])
    q = []
    monkeypatch.setattr(Q, "assign", lambda s, computer: q.append(computer) or [])
    t = _site(st, 10, 10, 1)
    h = add_army(st, HERO_TYPE, 10, 10)
    high(st)
    st.players[0].quest.active = 0
    MV.search_on_arrival_result(st, h.id, t)
    assert q == [True]
    st.players[0].quest.active = 1
    MV.search_on_arrival_result(st, h.id, t)
    assert q == [True]
    s5 = _site(st, 20, 20, 5)
    h.x, h.y = 20, 20
    tw = type_with(st, special=1)
    al1 = add_army(st, tw, 20, 20)
    al2 = add_army(st, tw, 20, 20)
    al3 = add_army(st, tw, 20, 20)
    al3.order = 1
    high(st)
    assert MV.search_on_arrival_result(st, h.id, s5)[0] == 2
    assert [e for e in fakes.log if e[0] == "explore"] == [("explore", al2.id, -1), ("explore", al1.id, -1)]
    assert al1.flags & 0x20 and al2.flags & 0x20 and not al3.flags & 0x20


def test_search_on_arrival_hook_returns_events(st, fakes, monkeypatch):
    monkeypatch.setattr(MV, "search_on_arrival_result", lambda s, i, si: (2, ["e"]))
    assert MV.search_on_arrival(st, 0, 0) == ["e"]


# ------------------------------------------------------------------------------- ovl34:0000


def test_search_command_branches(st, fakes, monkeypatch):
    """ovl34:0000: no moves -> nothing; no hero: temple -> bless, ruin -> nothing; hero: searched
    bit -> nothing; temple (computer) -> bless; sage -> exp, ai_sage, searched bit; ruin ->
    01ab."""
    calls = []
    monkeypatch.setattr(R, "bless", lambda s, si: calls.append(("bless", si)) or [])
    monkeypatch.setattr(R, "ruin_search", lambda s, si, x, y: calls.append(("ruin", si, x, y)) or [])
    monkeypatch.setattr(R, "_call", lambda name, d, s, si: calls.append((name, si)) or [])
    st.ai.turn_active = 1
    temple = _site(st, 10, 10, 1)
    w = add_army(st, walker(st), 10, 10)
    high(st)
    M.set_selection(st, w.id, [w.id])
    w.moves_left = 0
    assert MV.search_command(st) == [] and calls == []
    w.moves_left = 5
    MV.search_command(st)
    assert calls == [("bless", temple)]
    ruin = _site(st, 20, 10, 2)
    w.x = 20
    M.set_selection(st, w.id, [w.id])
    MV.search_command(st)
    assert calls == [("bless", temple)]
    h = add_army(st, HERO_TYPE, 20, 10)
    high(st)
    M.set_selection(st, h.id, [h.id])
    MV.search_command(st)
    assert calls[-1] == ("ruin", ruin, 20, 10)
    sage = _site(st, 30, 10, 3)
    h.x = 30
    MV.search_command(st)
    assert calls[-1] == ("ai_sage", sage) and st.world.flags[10 * MAP_W + 30] & MAP_EXPLORED
    n = len(calls)
    MV.search_command(st)                                   # searched: nothing
    assert len(calls) == n
    h.x = 10
    MV.search_command(st)
    assert calls[-1] == ("bless", temple)


def test_search_command_searched_temple_and_site_without_record(st, fakes, monkeypatch):
    """ovl34:0000: with a hero the searched bit (00ef) is tested before the kind (017c): a hero on
    a searched temple does nothing, a stack without a hero is still blessed there (00b3..00ce
    test no bit); terrain 11 without a site record counts as 7 (0081): nothing, for a hero
    (no ruin search) and without one (no blessing)."""
    calls = []
    monkeypatch.setattr(R, "bless", lambda s, si: calls.append(("bless", si)) or [])
    monkeypatch.setattr(R, "ruin_search", lambda s, si, x, y: calls.append(("ruin", si)) or [])
    st.ai.turn_active = 1
    temple = _site(st, 10, 10, 1)
    st.world.flags[10 * MAP_W + 10] |= MAP_EXPLORED
    h = add_army(st, HERO_TYPE, 10, 10)
    w = add_army(st, walker(st), 10, 10)
    high(st)
    M.set_selection(st, h.id, [h.id])
    assert MV.search_command(st) == [] and calls == []
    M.set_selection(st, w.id, [w.id])
    MV.search_command(st)
    assert calls == [("bless", temple)]
    paint(st, 40, 10, Terrain.SITE)                         # no site record
    for a in (h, w):
        a.x = 40
        M.set_selection(st, a.id, [a.id])
        assert MV.search_command(st) == []
    assert calls == [("bless", temple)]


def test_search_command_requires_the_sage_hook(st, fakes, monkeypatch):
    """The computer's sage (ovl26:0080, rules.ruins HOOKS ai_sage) is required in strict mode,
    before the hero's experience or the searched bit change."""
    from warlords2.rules.engine import NotImplementedCommand
    st.ai.turn_active = 1
    _site(st, 30, 10, 3)
    h = add_army(st, HERO_TYPE, 30, 10)
    high(st)
    M.set_selection(st, h.id, [h.id])
    monkeypatch.setattr(R, "_hook", lambda name: None)
    before = st.hash()
    with pytest.raises(NotImplementedCommand):
        MV.search_command(st)
    assert st.hash() == before


# ------------------------------------------------------------------------------- 0284 / 0458 / 10e3


def test_search_phase_passes_release_and_counts(game, fakes):
    """0284: heroes first (pass 0) then the others, each N-1..0; a hero is released while a
    role-7 city exists; flyers after the 8th kept with strength < 4 are released; counts."""
    st = make(game, hidden_map=1)
    tw, tf = walker(st), flyer(st)
    w = add_army(st, tw, 10, 10, flags=0x20)
    fl = [add_army(st, tf, 12, 10, flags=0x20) for _ in range(9)]
    for f in fl:
        f.strength = 3
    h = add_army(st, HERO_TYPE, 14, 10, flags=0x20)
    add_army(st, tw, 16, 10)                                # no 0x20
    high(st)
    MV.search(st)
    order = [e[1] for e in fakes.log if e[0] == "explore"]
    assert order[0] == h.id                                 # pass 0
    assert order[1:] == [f.id for f in reversed(fl[1:])] + [w.id]
    assert not fl[0].flags & 0x20 and fl[0].order == 0      # released (AI[+0x24] = 8 > 7)
    assert st.ai[0].explorers == 8 and st.ai[0].w22 == 2    # w and the hero
    c = add_city(st, 50, 50, 0)
    st.ai[0].role[c] = 7
    fakes.log.clear()
    MV.search(st)
    assert not h.flags & 0x20 and h.id not in [e[1] for e in fakes.log if e[0] == "explore"]


def test_explore_phase_loop(st, fakes, monkeypatch):
    """0458: 0x100 cleared on every type; a hero loops on 11a6 while it returns 2 and moved;
    r 0 / 1 ends; standing still with spent moves ends; moves < 3 ends."""
    h = add_army(st, HERO_TYPE, 10, 10, flags=0x100)
    w = add_army(st, walker(st), 20, 20, flags=0x100)
    high(st)
    seq = [2, 2, 1]

    def fake(s, lst):
        h.x += 1
        h.moves_left -= 3
        return seq.pop(0), []
    monkeypatch.setattr(MV, "hero_explore", fake)
    h.moves_left = 20
    MV.explore(st)
    assert seq == [] and not w.flags & 0x100 and not h.flags & 0x100
    h.flags |= 0x100
    seq[:] = [2, 2]
    calls = []

    def still(s, lst):
        calls.append(1)
        h.moves_left -= 1
        return seq.pop(0), []
    monkeypatch.setattr(MV, "hero_explore", still)
    MV.explore(st)
    assert len(calls) == 1


def test_specials_role_13(st, fakes, monkeypatch):
    """10e3: own city with flag 0x20, role != 7, armies with order byte 0 on the upper-right
    square -> 11a6; r == 1 and 0fd5 == 0 -> role 13."""
    c = add_city(st, 10, 10, 0)
    c2 = add_city(st, 20, 10, 0)
    h = add_army(st, HERO_TYPE, 11, 10)
    add_army(st, HERO_TYPE, 21, 10)
    high(st)
    for k in (c, c2):
        st.ai[0].city_flags[k] |= 0x20
    st.ai[0].role[c2] = 7
    st.cities[c].turns_left = 0
    MV.specials(st)
    assert st.ai[0].role[c] == 13 and st.ai[0].role[c2] == 7
    del h


# ------------------------------------------------------------------------------- rnd order


def test_rnd_order_rescue_pick_city(st, fakes, monkeypatch):
    """§8.3 rescue: per idle army 0c5b -> 0f3c: one 15c5 per reachable foreign candidate in
    city order count-1..0, then the executor."""
    log = []
    stub_exec(monkeypatch, log)
    tf = flyer(st)
    a = add_army(st, tf, 10, 10, moves=14)
    a.strength, a.allowance = 9, 12
    a.moves_left = a.allowance + 2
    high(st)
    add_city(st, 20, 10, 15)
    add_city(st, 30, 10, 15)
    add_city(st, 40, 10, 15)
    sims = []
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: sims.append((x, y)) or 100)
    dm = FakeMap({(20, 9): 9, (30, 9): 12})
    monkeypatch.setattr(P, "distance_map", lambda *args: dm)
    MV.rescue(st)
    assert sims == [(30, 10), (20, 10)]
    assert log[0][1:3] == (20, 10)                          # 0c7e: no coordinate below the army's


def test_hero_explore_real_executor_searches_gold_ruin(st, fakes):
    """11a6 end to end with the real 0a8b:0001: the hero and its flyer walk to the ruin; on
    arrival the executor's 15c3 (status 4, order kind 3, DS:5e5e) searches it (gold rnd(3,500,500)),
    then 11a6's own 15c3 finds the ruin searched and returns 2."""
    from warlords2.rules.constants import allowing_unverified
    h = add_army(st, HERO_TYPE, 10, 10, moves=16)
    f = add_army(st, flyer(st), 10, 10, moves=16)
    s = _site(st, 14, 10, 4)
    for x in range(9, 16):
        st.world.roads[10 * MAP_W + x] |= 0x20
    high(st)
    st.ai.turn_active = 1
    gold = st.players[0].gold
    with allowing_unverified():
        r, events = MV.hero_explore(st, [h.id, f.id] + [-1] * 6)
    assert (h.x, h.y) == (14, 10) and (f.x, f.y) == (14, 10)
    assert st.world.flags[10 * MAP_W + 14] & MAP_EXPLORED
    assert st.players[0].gold > gold
    assert r == 2
    del s


# ----------------------------------------------------------------------------- integration (M8b3)

M8B3_PHASES = {"move Hero", "move Search", "move Explore", "move #1", "rescue", "neutral",
               "move #2", "specials", "last rescue"}


def _m8b3_noop(state, *args):
    return []


def _m8b3_delete_army(state, i, redraw):
    from warlords2.rules import movement as _M
    _M.remove_army(state, state.armies[i])
    return []


def _m8b3_delete_list(state, ids, redraw):
    from warlords2.rules import movement as _M
    for i in reversed([k for k in ids if k != -1]):
        _M.remove_army(state, state.armies[i])
    return []


def _m8b3_stubs(monkeypatch):
    """The M8b2 / M8b4 phases and callees replaced by no-ops (deletes free the record)."""
    import sys
    import types
    from warlords2.ai import base as B
    from warlords2.rules import combat as CB
    from warlords2.rules import movement as MV
    from warlords2.rules import ruins as RU
    monkeypatch.setattr(B, "PHASES", tuple(
        (n, ms, t if n in M8B3_PHASES else "test_ai_move:_m8b3_noop", a) for n, ms, t, a in B.PHASES))
    fakes = {"clean_city": dict(clean_city=_m8b3_noop, delete_army=_m8b3_delete_army,
                                delete_list=_m8b3_delete_list),
             "diplomacy": dict(may_attack_city=lambda state, c: 1),
             "evaluate": dict(clear_unseen=_m8b3_noop, update_hide=_m8b3_noop),
             "quick_attack": dict(captured=_m8b3_noop, after_battle=_m8b3_noop, sage=_m8b3_noop)}
    for name, fns in fakes.items():
        mod = types.ModuleType("warlords2.ai.phases." + name)
        for k, v in fns.items():
            setattr(mod, k, v)
        monkeypatch.setitem(sys.modules, mod.__name__, mod)
    for hooks, name in ((MV.HOOKS, "ai_captured"), (CB.HOOKS, "ai_after_battle"), (RU.HOOKS, "ai_sage")):
        ms, _, doc, addr = hooks[name]
        monkeypatch.setitem(hooks, name, (ms, "test_ai_move:_m8b3_noop", doc, addr))


class _RecRng:
    """The game's dice with a log of every rnd(dice, sides, add) call."""

    def __init__(self, rng):
        self.rng, self.calls = rng, []

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.rng.rnd(d, s, a)

    def state(self):
        return self.rng.state()


def _m8b3_game(game, opts, seed):
    from movekit import scenario_state
    from warlords2.ai import cards as AC
    from warlords2.formats.gamedir import GameDir
    from warlords2.model.ids import Control
    st = scenario_state(game, "ERYTHEA", seed=seed, options=opts, controls=(Control.COMPUTER,) * 8)
    AC.setup_all(st, AC.card_reader(GameDir(game)))
    st.rng = _RecRng(st.rng)
    return st


@pytest.mark.parametrize("opts", [GameOptions(), GameOptions(hidden_map=1, neutral_cities=1)],
                         ids=["plain", "hidden_neutral"])
def test_m8b3_phases_play_erythea_deterministically(game, monkeypatch, opts):
    """Integration: the M8b3 phases (move Hero, Search, Explore, move #1 / #2, rescue, neutral,
    specials, last rescue) play 24 computer turns of ERYTHEA (every side computer, the M8b2 /
    M8b4 phases and callees no-ops) through the real turn loop and move executor.  Armies move,
    neutral cities are taken (without Hidden Map), and two runs from one seed give the same state hash and the
    same rnd call sequence."""
    from warlords2.rules import turn as T
    _m8b3_stubs(monkeypatch)

    def play(seed):
        st = _m8b3_game(game, opts, seed)
        start = [(a.x, a.y) for a in st.armies]
        owners = [c.owner for c in st.cities]
        T.run(st, max_sides=24)
        return st, start, owners

    a, start, owners = play(11)
    b, _, _ = play(11)
    assert a.hash() == b.hash() and a.rng.calls == b.rng.calls
    assert a.rng.calls, "the phases drew no dice"
    moved = sum(1 for k, xy in enumerate(start) if k < len(a.armies) and (a.armies[k].x, a.armies[k].y) != xy)
    assert moved > 0
    if not opts.hidden_map:          # under Hidden Map every city stays unseen (bit 0): the
        assert any(c.owner != o for c, o in zip(a.cities, owners))   # stubbed 0b95 never clears it
