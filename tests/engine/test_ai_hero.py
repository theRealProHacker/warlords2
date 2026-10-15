"""ovl28 move Hero (ai.md §6.2) as warlords2.ai.phases.hero, pinned to the listing: scan orders,
signed / unsigned compares, ties, the rnd(1,20,0) draws of 0efc, and the documented quirks."""
import sys
import types
from dataclasses import replace

import pytest

from warlords2.ai.phases import hero as Hm
from warlords2.model.ids import ItemState, Terrain
from warlords2.model.site import Site
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import movement as M

from movekit import add_army, add_city, flat_state, paint, type_with

pytestmark = pytest.mark.gamedata
HERO = 28


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)


def high(st):
    st.flags[SCN_ARMY_HIGH] = len(st.armies)


def seen(st, x, y):
    st.world.roads[y * 112 + x] |= 0x20


@pytest.fixture
def st(game):
    s = flat_state(game)
    s.ai.allocated = 1
    s.ai[0].simulations = 10
    s.sites = []
    for it in s.items:
        it.state = int(ItemState.NOT_IN_PLAY)
    s.turn = 1
    s.options = replace(s.options, quests=0, hidden_map=0)
    return s


@pytest.fixture
def stubs(monkeypatch):
    """ovl20 / ovl24 stand-ins (other forks' modules) recording their calls."""
    log = []
    neutral = types.SimpleNamespace(
        nearest_foreign_army=lambda st, x, y, side: log.append(("0a3e", x, y, side)) or stubs.threat,
        explore=lambda st, i, c: log.append(("0e4b", i, c)) or [])
    clean = types.SimpleNamespace(clean_city=lambda st, c, force: log.append(("023f", c, force)) or [])
    monkeypatch.setitem(sys.modules, "warlords2.ai.phases.neutral", neutral)
    monkeypatch.setitem(sys.modules, "warlords2.ai.phases.clean_city", clean)
    stubs.threat = 1000
    stubs.log = log
    return stubs


def site(st, x, y, kind, special=0):
    paint(st, x, y, Terrain.SITE)
    st.sites.append(Site(x, y, "s", kind, 0, 0, special, 0))
    return len(st.sites) - 1


# ------------------------------------------------------------------------------- 056d .. 065d


def test_site_at_kind_written_before_explored_test(st):
    """056d: not terrain 11 -> (-1, kind unwritten); a searched ruin -> -1 but *kind written;
    a searched temple still counts."""
    t = site(st, 5, 5, 1)
    r = site(st, 8, 8, 2)
    assert Hm.site_at(st, 6, 6) == (-1, None)
    assert Hm.site_at(st, 8, 8) == (r, 2)
    st.world.flags[8 * 112 + 8] |= 0x40
    st.world.flags[5 * 112 + 5] |= 0x40
    assert Hm.site_at(st, 8, 8) == (-1, 2)
    assert Hm.site_at(st, 5, 5) == (t, 1)


def test_blessing_flag_fifth_temple_reads_the_string(st):
    """0600 counts temples before s up to 4; 063c reads DS:0958[k]: 0x6353 for k = 4."""
    ids = [site(st, 2 * i + 2, 2, 1) for i in range(6)]
    ruin = site(st, 30, 2, 2)
    assert [Hm.blessing_flag(st, s) for s in ids] == [2, 4, 8, 0x10, 0x6353, 0x6353]
    assert Hm.temple_ordinal(st, ruin) == 4
    assert Hm.temple_ordinal(st, len(st.sites)) == -1
    assert Hm.blessing_flag(st, len(st.sites)) == -1


def test_hero_table_highest_indices_first_six(st):
    """065d: heroes N-1..0, at most six; AI[+0x0e] counts them; city / site / flight fields."""
    c = add_city(st, 20, 20, 0)
    s = site(st, 40, 40, 2)
    hs = [add_army(st, HERO, 10 + i, 10) for i in range(7)]
    st.armies[hs[6].id].x, st.armies[hs[6].id].y = 21, 21
    hs[5].x, hs[5].y = 40, 40
    add_army(st, HERO, 3, 3, owner=1)
    st.items[4].state, st.items[4].holder, st.items[4].type = 3, hs[4].id, 5
    high(st)
    S = Hm.hero_table(st)
    assert S.heroes == [hs[6].id, hs[5].id, hs[4].id, hs[3].id, hs[2].id, hs[1].id]
    assert S.city[:2] == [c, -1] and S.site[:2] == [-1, s]
    assert S.fly[:3] == [0, 0, 1]
    assert st.ai[0].hero_count == 6


# ------------------------------------------------------------------------------- 0efc


def _S(**kw):
    S = Hm.HeroTable()
    for k, v in kw.items():
        setattr(S, k, v)
    return S


def test_choose_draw_count_and_ties(st):
    """0efc: 4 draws, or 2 in a city with <= 4 counted armies (unsigned); the draw comes before
    the -1 test; the temple is taken unconditionally; later options need strictly more."""
    st.rng = Rec(st.rng, [5, 5, 5, 5])
    S = _S(temple=-1, site_t=-1, city_t=-1, item=-1)
    assert Hm.choose(st, 0, S) == 0 and len(st.rng.calls) == 4
    st.rng = Rec(st.rng.rng, [1, 1])
    S = _S(temple=3, temple_dist=10, site_t=4, site_dist=10, city_t=1, city_dist=0)
    S.city[0] = 7
    st.ai[0].armies_here[7] = 4
    assert Hm.choose(st, 0, S) == 1 and st.rng.calls == [(1, 20, 0)] * 2   # tie keeps temple
    st.ai[0].armies_here[7] = 5
    st.rng = Rec(st.rng.rng, [1, 2, 1, 1])
    assert Hm.choose(st, 0, S) == 4 and len(st.rng.calls) == 4
    st.ai[0].armies_here[7] = 0x85                  # 133 unsigned: not <= 4
    st.rng = Rec(st.rng.rng, [1, 1, 1, 30])
    S.item, S.item_dist = 2, 0
    assert Hm.choose(st, 0, S) == 2


# ------------------------------------------------------------------------------- 1637 / 0fda


def test_site_ok_limits(st):
    """1637: dist < 2T + 3 (+12 with +0x1b), seen 3x3, terrain 11, unsearched unless temple."""
    a = add_army(st, HERO, 10, 10)
    s = site(st, 15, 10, 2)
    high(st)
    st.turn = 1
    assert Hm.site_ok(st, s, a.id) == 0                     # d 5 not < 5
    st.turn = 2
    assert Hm.site_ok(st, s, a.id) == 0                     # not seen
    seen(st, 16, 11)
    assert Hm.site_ok(st, s, a.id) == 1
    st.world.flags[10 * 112 + 15] |= 0x40
    assert Hm.site_ok(st, s, a.id) == 0
    st.sites[s].kind = 1
    assert Hm.site_ok(st, s, a.id) == 1
    st.turn = 1
    st.sites[s].flag_1b = 1
    assert Hm.site_ok(st, s, a.id) == 1


def test_score_sites_temple_and_other_heroes(st):
    """0fda: quest temple (Quests on, no active quest, d < lim, nearest); a blessed temple is
    skipped otherwise; a ruin site-ordered by another hero is no candidate; ties: lowest s."""
    st.turn = 10
    h = add_army(st, HERO, 10, 10)
    o = add_army(st, HERO, 30, 30)
    r1 = site(st, 13, 10, 2)
    r2 = site(st, 10, 13, 2)
    tp = site(st, 7, 10, 1)
    for s in st.sites:
        seen(st, s.x, s.y)
    o.order, o.vector_dest = 3, r1
    high(st)
    S = Hm.HeroTable()
    S.heroes[0], S.heroes[1] = h.id, o.id
    Hm.score_sites(st, 0, S)
    assert (S.site_t, S.site_dist, S.temple) == (r2, 3, -1)  # r1 taken by o; tp blessed? no: not quests
    st.options = replace(st.options, quests=1)
    Hm.score_sites(st, 0, S)
    assert (S.temple, S.temple_dist, S.site_t) == (tp, 3, r2)  # tie d = 3: r2 (lower index) kept
    st.players[0].quest.active = 1
    h.flags |= Hm.blessing_flag(st, tp)
    Hm.score_sites(st, 0, S)
    assert (S.temple, S.site_t) == (-1, r2)
    h.flags = 0
    Hm.score_sites(st, 0, S)
    assert S.site_t == r2                                  # temple d 3 ties, r2 earlier


# ------------------------------------------------------------------------------- 11f8 / 1736


def test_score_items_ties_highest_index_and_city_owner(st):
    h = add_army(st, HERO, 10, 10)
    high(st)
    for i, (x, y) in ((2, (12, 10)), (5, (8, 10)), (7, (10, 30))):
        it = st.items[i]
        it.state, it.x, it.y = 1, x, y
        seen(st, x, y)
    S = Hm.HeroTable()
    S.heroes[0] = h.id
    Hm.score_items(st, 0, S)
    assert (S.item, S.item_dist) == (5, 2)                 # 5 scanned first wins the tie
    c = add_city(st, 7, 9, 3)
    assert Hm.item_ok(st, 5) == 0                          # (8, 10) is in a foreign city
    st.cities[c].owner = 0
    assert Hm.item_ok(st, 5) == 1


# ------------------------------------------------------------------------------- 1348


def test_score_cities_running_distance_and_order_bonus(st, monkeypatch):
    """1348: farther than the running best distance -> no simulation (unless the order city);
    thr 95 for < 3 armies; order city +20; p > best or equal p and nearer."""
    h = add_army(st, HERO, 10, 10)
    h.allowance = 12
    far = add_city(st, 10, 25, 3)                          # index 0: scanned last
    near = add_city(st, 10, 18, 3)                         # index 1
    for p in (0, 3):
        st.relations[0][3] = st.relations[3][0] = 2
    high(st)
    calls = []
    monkeypatch.setattr(Hm.U, "win_odds", lambda s, x, y: calls.append((x, y)) or 96)
    S = Hm.HeroTable()
    S.heroes[0] = h.id
    Hm.score_cities(st, 0, S)
    assert calls == [(10, 18)] and (S.city_t, S.city_dist) == (near, 8)
    calls.clear()
    h.order, h.vector_dest = 1, far
    monkeypatch.setattr(Hm.U, "win_odds", lambda s, x, y: calls.append((x, y)) or 80)
    Hm.score_cities(st, 0, S)                              # near 80 < 95; far 80 + 20 >= 95
    assert calls == [(10, 18), (10, 25)] and S.city_t == far
    h.allowance = 11                                       # no group: both words -1
    Hm.score_cities(st, 0, S)
    assert (S.city_t, S.city_dist) == (-1, -1)


# ------------------------------------------------------------------------------- 07ea / 0b75 / 0cf3


@pytest.fixture
def moves(monkeypatch):
    log = []

    def fake(st, x, y, keep=0):
        log.append((st.selection.selected, list(st.selection.moving), x, y))
        return 4, []
    monkeypatch.setattr(M, "execute_move", fake)
    return log


def test_go_city_stays_when_garrison_count_equals_j(st, stubs, moves):
    """0b75: the stay test compares AI[+0x182+hc] with j (stale [bp-2]), not with n."""
    c = add_city(st, 20, 20, 0)
    e = add_city(st, 40, 20, 3)
    h = add_army(st, HERO, 20, 20)
    h.allowance = 12
    high(st)
    S = Hm.HeroTable()
    S.heroes[2], S.city[2], S.city_t = h.id, c, e
    stubs.threat = 9
    st.ai[0].armies_here[c] = 1                            # == n, but j is 2: moves
    assert Hm.go_city(st, 2, S) == (0, []) and len(moves) == 1
    assert h.order & 0xF == 1 and h.vector_dest == e
    st.ai[0].armies_here[c] = 2                            # == j: stays (T 1: limit 10 > 9)
    assert Hm.go_city(st, 2, S) == (0, []) and len(moves) == 1
    stubs.threat = 10
    Hm.go_city(st, 2, S)
    assert len(moves) == 2


def test_go_site_flyer_and_garrison(st, stubs, moves):
    """07ea: in a city the flyer of the lowest list slot goes with the hero; the whole small
    garrison stays when an enemy is within 15; returns 1 on status 4."""
    c = add_city(st, 20, 20, 0)
    s = site(st, 30, 20, 2)
    fl = type_with(st, flag16=1)
    f1 = add_army(st, fl, 20, 20)
    f2 = add_army(st, fl, 20, 20)
    h = add_army(st, HERO, 20, 20)
    for a in (f1, f2, h):
        a.allowance = 12
    high(st)
    S = Hm.HeroTable()
    S.heroes[0], S.city[0], S.site_t = h.id, c, s
    stubs.threat = 3
    r, _ = Hm.go_site_or_item(st, 0, 3, S)
    assert r == 1 and moves[-1][1] == [h.id, f2.id]        # list N-1..0: [h, f2, f1], lowest slot
    assert h.order & 0xF == 3 and h.vector_dest == s
    f1.type_id = f2.type_id = type_with(st, flag16=0)
    h.order = f1.order = f2.order = 0
    st.ai[0].armies_here[c] = 3
    assert Hm.go_site_or_item(st, 0, 3, S) == (1, [])       # n == 3: hero alone
    assert moves[-1][1] == [h.id]
    stubs.threat = 20
    h.order = 0
    st.ai[0].armies_here[c] = 1                            # n = 1 (th >= 15), == count, but th >= 15
    assert Hm.go_site_or_item(st, 0, 3, S)[0] == 1


def test_quest_city_need_and_odds(st, moves, monkeypatch):
    c = add_city(st, 40, 40, 3)
    h = add_army(st, HERO, 10, 10)
    high(st)
    q = st.players[0].quest
    q.type, q.target = 4, c
    S = Hm.HeroTable()
    S.heroes[0] = h.id
    st.turn = 8
    assert Hm.quest_city(st, 0, S)[0] == 0                 # need 2, only the hero
    st.turn = 7
    monkeypatch.setattr(Hm.U, "win_odds", lambda s, x, y: 74)
    assert Hm.quest_city(st, 0, S)[0] == 0
    h.order, h.vector_dest = 1, c                          # already ordered: no odds test
    assert Hm.quest_city(st, 0, S)[0] == 1 and len(moves) == 1
    q.type = 3
    assert Hm.quest_city(st, 0, S)[0] == 0


# ------------------------------------------------------------------------------- 17db / 1a3d


def _carry(st, hero, i, t):
    it = st.items[i]
    it.state, it.holder, it.type = 3, hero.id, t


def test_share_items_battle_pass_worked_example(st):
    """17db, ai.md example B = (2, 1), items {a, b} / {c}: hero 0 ends with {c}, hero 1 with
    {a, b}; three hand-overs counted in AI[+0x4c]."""
    h0, h1 = add_army(st, HERO, 5, 5), add_army(st, HERO, 5, 5)
    high(st)
    _carry(st, h0, 1, 1)
    _carry(st, h0, 2, 2)
    _carry(st, h1, 3, 8)
    Hm.share_items(st, [h0.id, h1.id] + [-1] * 6)
    assert [st.items[i].holder for i in (1, 2, 3)] == [h1.id, h1.id, h0.id]
    assert st.ai[0].item_handovers == 3


def test_hand_out_gives_to_every_empty_hero(st):
    """1a3d: cnt >= 2 tested once per giver: two flight items on hero 0, heroes 1 and 2 without
    -> (0, 1, 1)."""
    hs = [add_army(st, HERO, 5, 5) for _ in range(3)]
    high(st)
    _carry(st, hs[0], 6, 5)
    _carry(st, hs[0], 9, 5)
    Hm.share_items(st, [h.id for h in hs] + [-1] * 5)
    assert (st.items[6].holder, st.items[9].holder) == (hs[1].id, hs[2].id)


# ------------------------------------------------------------------------------- 0000


def test_move_hero_rounds_and_draws(st, stubs, moves):
    """0000: AI[+0x46] from an active occupy quest; per hero clean city (c, 1) for its city;
    choice 0 ends the rounds; in a city with <= 4 counted armies 0efc draws 2, else 4."""
    c = add_city(st, 20, 20, 0)
    h = add_army(st, HERO, 20, 20)
    high(st)
    st.options = replace(st.options, quests=1)
    q = st.players[0].quest
    q.active, q.type, q.target, q.hero = 1, 5, 0, 999
    st.ai[0].armies_here[c] = 1
    st.rng = Rec(st.rng)
    Hm.move_hero(st)
    assert st.ai[0].quest_city == 0
    assert stubs.log == [("023f", c, 1)]
    assert st.rng.calls == [(1, 20, 0)] * 2
    st.ai[0].armies_here[c] = 5
    st.rng = Rec(st.rng.rng)
    q.active = 0
    Hm.move_hero(st)
    assert st.ai[0].quest_city == -1
    assert st.rng.calls == [(1, 20, 0)] * 4


def test_move_hero_clears_site_orders_on_the_square(st, stubs, moves):
    """0000 01eb..02c9: a site order no longer worth it is cleared on every own army of the
    square with the hero's kind, re-read each time: the hero (scanned first) loses kind 3, so an
    army below it with kind 3 keeps its order."""
    s = site(st, 60, 60, 2)
    low = add_army(st, type_with(st, flag16=0), 10, 10)
    h = add_army(st, HERO, 10, 10)
    top = add_army(st, type_with(st, flag16=0), 10, 10)
    for a in (low, h, top):
        a.order, a.vector_dest, a.goto = 3, s, (60, 60)
    high(st)
    st.rng = Rec(st.rng)
    Hm.move_hero(st)
    assert (top.order, top.vector_dest, top.goto) == (0, 0, (-1, -1))
    assert (h.order, h.goto) == (0, (-1, -1))
    assert (low.order, low.vector_dest, low.goto) == (3, s, (60, 60))


def test_move_hero_explores_after_a_move(st, stubs, monkeypatch):
    """0000 035f..03b8: round 2 choice 0 after a move under Hidden Map before turn 10 with exactly
    one own army with >= 8 moves on the square -> ovl20:0e4b(h, -1)."""
    h = add_army(st, HERO, 10, 10)
    h.moves_left = 20
    high(st)
    st.options = replace(st.options, hidden_map=1)
    seq = iter([3, 0])
    monkeypatch.setattr(Hm, "choose", lambda s, j, S: next(seq))
    monkeypatch.setattr(Hm, "go_site_or_item", lambda s, j, k, S, u: (1, []))
    Hm.move_hero(st)
    assert ("0e4b", h.id, -1) in stubs.log


# ------------------------------------------------------------------------------- review M8b3


def test_go_item_orders_kind_4_and_writes_the_item_square(st, monkeypatch):
    """07ea item branch (0ad1..0b35): 0ae7(L, 4, 0, 0) (kind 4 keeps the goto, index 0), then the
    leader's goto (+0x12 / +0x14) = the item's square (+0x19 / +0x1b), and 0a8b:0001 moves there;
    1 only for status 4."""
    h = add_army(st, HERO, 10, 10)
    h.goto = (50, 50)
    high(st)
    it = st.items[3]
    it.x, it.y = 30, 12
    S = Hm.HeroTable()
    S.heroes[0], S.item = h.id, 3
    log, status = [], [4]

    def fake(s, x, y, keep=0):
        log.append((s.selection.selected, list(s.selection.moving), x, y))
        return status[0], []
    monkeypatch.setattr(M, "execute_move", fake)
    assert Hm.go_site_or_item(st, 0, 2, S) == (1, [])
    assert log == [(h.id, [h.id], 30, 12)]
    assert (h.order & 0xF, h.vector_dest, h.goto) == (4, 0, (30, 12))
    h.order, h.goto, status[0] = 0, (50, 50), 3
    assert Hm.go_site_or_item(st, 0, 2, S) == (0, [])
    assert log[-1][2:] == (30, 12)


def _rounds(monkeypatch, choice, go=(1, [])):
    """choose -> `choice` (a function of the round) and 07ea / 0b75 stand-ins, all recorded."""
    log = []

    def choose(s, j, S):
        log.append(("0efc", j))
        return choice(len([e for e in log if e[0] == "0efc"]))
    monkeypatch.setattr(Hm, "choose", choose)

    def site(s, j, k, S, u):
        log.append(("07ea", j, k, S.site_t, u))
        return go(s) if callable(go) else go
    monkeypatch.setattr(Hm, "go_site_or_item", site)
    monkeypatch.setattr(Hm, "go_city", lambda s, j, S, u: log.append(("0b75", j)) or (1, []))
    return log


def test_move_hero_quest_march_skips_the_hero(st, stubs, monkeypatch):
    """0000 0136..0180: the quest hero (Q +4 == h) marches with 0cf3; a non-zero result ends that
    hero's turn (no site order handling, no rounds)."""
    c = add_city(st, 40, 40, 3)
    h = add_army(st, HERO, 10, 10)
    high(st)
    st.options = replace(st.options, quests=1)
    q = st.players[0].quest
    q.active, q.type, q.target, q.hero = 1, 4, c, h.id
    r = [1]
    monkeypatch.setattr(Hm, "quest_city", lambda s, j, S: (r[0], []))
    log = _rounds(monkeypatch, lambda n: 0)
    Hm.move_hero(st)
    assert log == []
    r[0] = 0
    Hm.move_hero(st)
    assert log == [("0efc", 0)]


def test_move_hero_site_order_goes_on(st, stubs, monkeypatch):
    """0000 018d..01e8: a hero with a site order (kind 3) whose site is still worth it (1637):
    S+0x34 = the site, 07ea(j, 3, S, 1), result dropped, orders on the square kept; the rounds
    follow."""
    s = site(st, 60, 60, 2)
    h = add_army(st, HERO, 10, 10)
    other = add_army(st, type_with(st, flag16=0), 10, 10)
    for a in (h, other):
        a.order, a.vector_dest, a.goto = 3, s, (60, 60)
    high(st)
    monkeypatch.setattr(Hm, "site_ok", lambda st_, s_, a: 1)
    log = _rounds(monkeypatch, lambda n: 0, go=(0, []))
    Hm.move_hero(st)
    assert log == [("07ea", 0, 3, s, 1), ("0efc", 0)]
    assert (other.order, other.vector_dest, other.goto) == (3, s, (60, 60))


def test_move_hero_temple_choice_ends_the_rounds(st, stubs, monkeypatch):
    """0000 table 041f: choice 1 (quest temple) -> go = 0."""
    add_army(st, HERO, 10, 10)
    high(st)
    log = _rounds(monkeypatch, lambda n: 1)
    Hm.move_hero(st)
    assert log == [("0efc", 0)]


@pytest.mark.parametrize("moves, rounds", [(16, 2), (4, 2), (3, 0), (0x84, 0)])
def test_move_hero_two_rounds_while_4_moves(st, stubs, monkeypatch, moves, rounds):
    """0000 03f2..040c: go, rounds < 2 and moves left (+7, signed byte) >= 4."""
    h = add_army(st, HERO, 10, 10)
    h.moves_left = moves
    high(st)
    log = _rounds(monkeypatch, lambda n: 3)
    Hm.move_hero(st)
    assert [e[0] for e in log] == ["0efc", "07ea"] * rounds


def test_move_hero_stops_when_no_longer_an_own_hero(st, stubs, monkeypatch):
    """0000 03c2..03f0: after a move the rounds end when the record is no longer an own hero
    (owner cwde != cur or type != 0x1c)."""
    h = add_army(st, HERO, 10, 10)
    high(st)

    def lost(s):
        h.owner = 3
        return 1, []
    log = _rounds(monkeypatch, lambda n: 3, go=lost)
    Hm.move_hero(st)
    assert [e[0] for e in log] == ["0efc", "07ea"]


@pytest.mark.parametrize("group, odds, taken", [
    (3, 75, True), (3, 74, False), (2, 94, False), (2, 95, True)])
def test_score_cities_threshold_by_group_size(st, monkeypatch, group, odds, taken):
    """1348 141f..142d: thr = 95 for a group (13b2, allowance >= 12) of n < 3, else 75; p >=
    thr (15f5 jl)."""
    h = add_army(st, HERO, 10, 10)
    for _ in range(group - 1):
        add_army(st, type_with(st, flag16=0, moves=12), 10, 10).allowance = 12
    c = add_city(st, 10, 18, 3)
    st.relations[0][3] = st.relations[3][0] = 2
    high(st)
    monkeypatch.setattr(Hm.U, "win_odds", lambda s, x, y: odds)
    S = Hm.HeroTable()
    S.heroes[0] = h.id
    Hm.score_cities(st, 0, S)
    assert S.city_t == (c if taken else -1)
