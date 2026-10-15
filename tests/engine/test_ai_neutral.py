"""ovl20 (ai.md §6.10) as warlords2.ai.phases.neutral, pinned to the listing: scan orders,
signed / unsigned compares, ties, the freed-record quirk of 0a3e and the rnd order."""
import sys
import types

import pytest

from warlords2.ai import util as U
from warlords2.ai.phases import neutral as N
from warlords2.model.ids import ROAD_SEEN, Terrain
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import movement as M

from movekit import add_army, add_city, flat_state, paint, type_with

pytestmark = pytest.mark.gamedata


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)


def high(st):
    st.flags[SCN_ARMY_HIGH] = len(st.armies)


def _prep(s):
    s.ai.allocated = 1
    s.ai[0].simulations = 10
    s.ai[0].quest_city = -1
    nb = s.ai.neighbours
    nb.ids[:] = [0xFF] * len(nb.ids)
    nb.dists[:] = [0] * len(nb.dists)
    return s


@pytest.fixture
def st(game):
    return _prep(flat_state(game))


@pytest.fixture
def hm(game):
    return _prep(flat_state(game, options=GameOptions(hidden_map=1)))


def seen_all(st):
    st.world.roads = [ROAD_SEEN] * len(st.world.roads)


def nb(st, c, entries):
    for i, (t, d) in enumerate(entries):
        st.ai.neighbours.ids[c * 6 + i] = t
        st.ai.neighbours.dists[c * 6 + i] = d


def stub(monkeypatch, name, **fns):
    mod = types.ModuleType("warlords2.ai.phases." + name)
    for k, v in fns.items():
        setattr(mod, k, v)
    monkeypatch.setitem(sys.modules, "warlords2.ai.phases." + name, mod)
    return mod


# ------------------------------------------------------------------------------- 0a3e / 0981


def test_nearest_foreign_army_counts_freed_record_at_minus_one(st):
    """0a3e: no x != -1 test: a freed record (owner 0xff, x = y = -1) counts for side -1."""
    t = type_with(st, flag16=0)
    add_army(st, t, 30, 30, owner=3)
    add_army(st, t, 12, 12, owner=0)            # own: skipped for side -1
    add_army(st, t, 11, 10, owner=0x0F)         # neutral: always skipped
    high(st)
    assert N.nearest_foreign_army(st, 10, 10, -1) == 28          # isqrt(400 + 400)
    f = add_army(st, t, 5, 5, owner=3)
    M.remove_army(st, f)
    high(st)
    assert N.nearest_foreign_army(st, 10, 10, -1) == 15          # isqrt(121 + 121) to (-1, -1)
    assert N.nearest_foreign_army(st, 10, 10, 3) == 28           # signed owner == side
    assert N.nearest_foreign_army(st, 10, 10, 0) == 2            # own side asked explicitly


def test_nearest_foreign_army_hidden_map_needs_seen_square(hm):
    """0a3e under Hidden Map: only armies with a seen square in their 3x3 (ovl29:16ae)."""
    t = type_with(hm, flag16=0)
    add_army(hm, t, 20, 20, owner=3)
    add_army(hm, t, 40, 40, owner=3)
    high(hm)
    assert N.nearest_foreign_army(hm, 0, 0, -1) == 1000
    hm.world.roads[41 * 112 + 41] = ROAD_SEEN
    assert N.nearest_foreign_army(hm, 0, 0, -1) == 56


def test_nearest_city_intact_and_owner(st):
    """0981: intact cities only (terrain 10 at the corner), owner cwde == side or any for -1."""
    a = add_city(st, 20, 20, 2)
    add_city(st, 10, 10, 3)
    paint(st, 10, 10, Terrain.PLAIN)             # razed corner
    assert N.nearest_city(st, 0, 0, -1) == 28
    assert N.nearest_city(st, 0, 0, 3) == 10000
    assert N.nearest_city(st, 0, 0, 2) == 28 and a == 0


# ------------------------------------------------------------------------------- 01f6 / 0935


def test_neutral_neighbours_rules(st):
    """01f6: 0xff / AI[+0x46] / not intact / not neutral skipped; after the first kept one,
    slots >= 2 need distance < 20 (unsigned byte)."""
    c0 = add_city(st, 2, 2, 0)
    ids = [add_city(st, 10 + 4 * k, 10, 0x0F) for k in range(5)]
    add_city(st, 50, 50, 3)
    nb(st, c0, [(0xFF, 0), (ids[0], 30), (ids[1], 25), (ids[2], 19), (ids[3], 0x90), (6, 1)])
    n, i, d = N.neutral_neighbours(st, c0)
    assert (n, i, d) == (2, [0xFF, ids[0], 0xFF, ids[2], 0xFF, 0xFF], [0, 30, 0, 19, 0, 0])
    st.ai[0].quest_city = ids[0]
    n, i, _ = N.neutral_neighbours(st, c0)
    assert i == [0xFF, 0xFF, ids[1], ids[2], 0xFF, 0xFF] and n == 2   # first kept: slot 2 any dist


def test_pick_neutral_signed_sent_and_slot_order(st):
    """0935: first of slots 5..0 with sent < 3 (signed byte: 0xff = -1 passes)."""
    c0 = add_city(st, 2, 2, 0)
    a, b = add_city(st, 10, 10, 0x0F), add_city(st, 20, 10, 0x0F)
    nb(st, c0, [(a, 5), (b, 5)])
    sent = [0] * 100
    sent[b] = 3
    assert N.pick_neutral(st, c0, sent) == a
    sent[b] = 0xFF
    assert N.pick_neutral(st, c0, sent) == b
    sent[a] = sent[b] = 3
    assert N.pick_neutral(st, c0, sent) == 0xFF
    nb(st, c0, [(0xFF, 0), (0xFF, 0)])
    assert N.pick_neutral(st, c0, [0] * 100) == 0xFF


def test_mark_explore_cities(st):
    """02ff: role 3 with neighbours but no neutral unflagged one -> 2; no neighbour: unchanged."""
    c0, c1 = add_city(st, 2, 2, 0), add_city(st, 30, 2, 0)
    n1 = add_city(st, 10, 10, 0x0F)
    b = st.ai[0]
    b.role[c0] = b.role[c1] = 3
    nb(st, c0, [(n1, 5)])
    b.city_flags[n1] = 1
    N.mark_explore_cities(st)
    assert b.role[c0] == 2 and b.role[c1] == 3
    b.role[c0], b.city_flags[n1] = 3, 0
    N.mark_explore_cities(st)
    assert b.role[c0] == 3


# ------------------------------------------------------------------------------- 164e / 177f


def test_flagged_city_one_draw_per_flagged_city_highest_index_wins_ties(st):
    """164e: one rnd(1,10,0) per intact flagged city (count-1..0) after the dist; strict <;
    target corner - 1."""
    t = type_with(st, flag16=1)
    a = add_army(st, t, 20, 20)
    high(st)
    c0, c1, c2 = add_city(st, 30, 20, 3), add_city(st, 10, 20, 0x0F), add_city(st, 60, 60, 0)
    for c in (c0, c1):
        st.ai[0].city_flags[c] = 1
    st.rng = Rec(st.rng, [3, 3])
    assert N.flagged_city(st, a.id) == (1, 9, 19)             # c1 drawn first: c0 ties, strict <
    assert st.rng.calls == [(1, 10, 0)] * 2
    st.rng = Rec(st.rng, [5, 1])                              # c1 = 10 + 5, c0 = 10 + 1
    assert N.flagged_city(st, a.id) == (1, 29, 19)
    st.rng = Rec(st.rng, [1, 5])
    assert N.flagged_city(st, a.id) == (1, 9, 19)
    st.ai[0].city_flags[c0] = st.ai[0].city_flags[c1] = 0
    st.rng = Rec(st.rng)
    assert N.flagged_city(st, a.id)[0] == 0 and st.rng.calls == []
    assert c2 == 2


def test_frontier_draw_order_and_first_tie(st):
    """177f: rnd(1,4,-1) first, then per candidate square (x outer, y inner, ascending)
    rnd(1,10,0) after both dists; s > best strict: the first square in scan order wins ties."""
    t = type_with(st, flag16=0, flag18=0, flag17=0)
    a = add_army(st, t, 50, 50)
    a.home_city = 0
    add_city(st, 80, 80, 0)
    high(st)
    U.order_stack(st, [a.id] + [-1] * 7, 4, 0, 0x20)
    st.rng = Rec(st.rng, [1] + [1] * 100)
    found, x, y, kind, _, _ = N.frontier(st, a.id)
    assert st.rng.calls[0] == (1, 4, -1) and set(st.rng.calls[1:]) == {(1, 10, 0)}
    assert len(st.rng.calls) == 1 + 100                        # every square of the window qualifies
    # s = 1 + 2 d1 + d2 + 90 + 100: the far corner from home and army wins
    best = max(((1 + 2 * N._dist(xx, yy, 50, 50) + N._dist(xx, yy, 80, 80) + 190, -(xx * 1000 + yy), xx, yy)
                for xx in range(45, 55) for yy in range(45, 55)))
    assert (found, x, y, kind) == (1, best[2], best[3], 0)


def test_frontier_skips_seen_and_low_unseen(st):
    """177f: seen squares skipped; u < 2 skipped; a seen window gives found 0 but still draws
    rnd(1,4,-1)."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 50, 50)
    add_city(st, 80, 80, 0)
    high(st)
    U.order_stack(st, [a.id] + [-1] * 7, 4, 0, 0x20)
    seen_all(st)
    st.rng = Rec(st.rng)
    assert N.frontier(st, a.id)[0] == 0 and st.rng.calls == [(1, 4, -1)]


def test_frontier_city_and_site_kinds(st):
    """1bab overwrites (the last foreign city in scan order), 1c9d only while kind == 0."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 50, 50)
    add_city(st, 80, 80, 0)
    high(st)
    U.order_stack(st, [a.id] + [-1] * 7, 4, 0, 0x20)
    seen_all(st)
    paint(st, 48, 49, Terrain.SITE)
    out = {"kind": 0, "kx": -1, "ky": -1}
    N.frontier_site(st, a.id, 48, 49, out)
    assert out == {"kind": 2, "kx": 48, "ky": 49}
    N.frontier_city(st, a.id, 52, 50, out)
    assert out == {"kind": 1, "kx": 52, "ky": 50}
    N.frontier_site(st, a.id, 48, 49, out)
    assert out["kind"] == 1
    N.frontier_city(st, a.id, 54, 50, out)                    # dist 4: too far
    assert out["kx"] == 52


# ------------------------------------------------------------------------------- 06c7 / 03aa


def _chain_setup(st):
    t = type_with(st, flag16=0)
    src = add_city(st, 10, 10, 0)
    n1, n2 = add_city(st, 20, 10, 0x0F), add_city(st, 10, 20, 0x0F)
    nb(st, src, [(n1, 10), (n2, 45)])
    a = add_army(st, t, 10, 10)
    b = add_army(st, t, 10, 10)
    high(st)
    return src, n1, n2, a, b


def test_neutral_chain_score_and_rnd_without_neutral_cities(st, monkeypatch):
    """06c7 with Neutral Cities off: p stays 100 (no 15c5); per candidate (slots 5..0)
    rnd(1,10,0); s = r + d + 10 sent + (d > 40: 10) + 100 - p; the smallest wins; sent += n;
    DS:07c6 / 40c0; order kind 1 with flag 0x80; then the executor."""
    src, n1, n2, a, b = _chain_setup(st)
    moved = []
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: moved.append((x, y)) or (2, []))
    monkeypatch.setattr(U, "win_odds", lambda *a: pytest.fail("no 15c5 without Neutral Cities"))
    sent = [0] * 100
    st.rng = Rec(st.rng, [10, 1])                 # n2 (slot 1) first: 1 + 45 + 10 = 56; n1: 10 + 10 = 20
    group = [a.id, b.id] + [-1] * 6
    ret = [1]
    N.neutral_chain(st, src, 2, sent, group, ret)
    assert st.rng.calls == [(1, 10, 0)] * 2 and ret == [0]
    assert sent[n1] == 2 and st.ai.neutral_last == n1 and st.ai.neutral_source == src
    assert a.order & 0xF == 1 and a.vector_dest == n1 and a.flags & 0x80
    assert moved == [(20, 10)]                    # 0c7e: corner, 0d88 steps only coordinates below the army's


def test_neutral_chain_sent_three_skips_but_clears_ret(st, monkeypatch):
    """06c7: *ret = 0 before the sent >= 3 test; no best and no Hidden Map -> nothing."""
    src, n1, n2, a, b = _chain_setup(st)
    monkeypatch.setattr(M, "execute_move", lambda *a, **k: pytest.fail("no move"))
    sent = [0] * 100
    sent[n1] = sent[n2] = 3
    st.rng = Rec(st.rng)
    ret = [1]
    N.neutral_chain(st, src, 1, sent, [a.id] + [-1] * 7, ret)
    assert ret == [0] and st.rng.calls == []


def test_neutral_chain_hidden_tail_orders_last_target(hm, monkeypatch):
    """06c7 under Hidden Map with no acceptable candidate: DS:40c0 == src and DS:07c6 != -1 ->
    0ae7(group, 1, DS:07c6, 0x80) without a move."""
    src, n1, n2, a, b = _chain_setup(hm)
    monkeypatch.setattr(M, "execute_move", lambda *a, **k: pytest.fail("no move"))
    hm.ai[0].city_flags[n1] = hm.ai[0].city_flags[n2] = 1
    hm.ai.neutral_source, hm.ai.neutral_last = src, n2
    N.neutral_chain(hm, src, 1, [0] * 100, [a.id] + [-1] * 7, [1])
    assert a.order & 0xF == 1 and a.vector_dest == n2 and a.flags & 0x80


def test_neutral_chain_with_neutral_cities_simulates(game, monkeypatch):
    """06c7 with Neutral Cities on: 14d3(group), then 15c5 per unflagged candidate with sent < 3
    before its rnd; p < 75 draws no rnd."""
    st = _prep(flat_state(game, options=GameOptions(neutral_cities=1)))
    src, n1, n2, a, b = _chain_setup(st)
    calls = []
    odds = iter([50, 80])
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: calls.append((x, y)) or next(odds))
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: (2, []))
    st.rng = Rec(st.rng, [4])
    N.neutral_chain(st, src, 2, [0] * 100, [a.id, b.id] + [-1] * 6, [1])
    assert calls == [(10, 20), (20, 10)] and st.rng.calls == [(1, 10, 0)]
    assert a.vector_dest == n1


def test_send_group_keep_and_allowance_sort(st, monkeypatch):
    """03aa: keep = (th < 15) + (2 if th < 5) + (AI[+0x48] != 0) + min(mem row 5 sum, 2); the
    first `keep` armies (records from the top) stay; the rest sorted by allowance desc, the
    highest slot on ties, allowance <= 0 dropped; per = 1 without Neutral Cities."""
    t = type_with(st, flag16=0)
    c = add_city(st, 10, 10, 0)
    arm = [add_army(st, t, 10, 10) for _ in range(5)]
    for x, al in zip(arm, (5, 7, 7, 0, 3)):
        x.allowance = al
    add_army(st, t, 20, 10, owner=3)              # th = 10 -> keep 1
    high(st)
    seen = []
    monkeypatch.setattr(N, "neutral_chain",
                        lambda s, src, n, sent, g, ret: seen.append((n, [i for i in g if i != -1])) or [])
    r, _ = N.send_group(st, c, [0] * 100)
    # scan from the top: arm4 kept back; G = arm3, arm2, arm1, arm0 (slots 0..3); arm3 (0) dropped
    assert seen == [(1, [arm[1].id]), (1, [arm[2].id]), (1, [arm[0].id])] and r == 0   # tie 7/7: slot 2
    st.ai[0].memory[5][3] = 1
    st.ai[0].memory[5][4] = 5
    seen.clear()
    N.send_group(st, c, [0] * 100)                # keep = 1 + 2
    assert seen == [(1, [arm[1].id]), (1, [arm[0].id])]


def test_send_group_none_returns_zero_even_under_hidden_map(hm):
    c = add_city(hm, 10, 10, 0)
    assert N.send_group(hm, c, [0] * 100) == (0, [])


# ------------------------------------------------------------------------------- 10a8 / 12eb / 1581


def test_explore_attack_thresholds(st, monkeypatch):
    """10a8: first qualifying city count-1..0; non-hero strength <= 3 -> need 50 / 40 / 75."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 30, 30)
    a.strength = 3
    high(st)
    c = add_city(st, 31, 31, 3)
    stub(monkeypatch, "diplomacy", may_attack_city=lambda s, cc: 1)
    stub(monkeypatch, "evaluate", clear_unseen=lambda s, cc: None)
    moved = []
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: moved.append((x, y)) or (2, []))
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: 45)
    b = st.ai[0]
    b.neutral_cities, b.own_cities = 0, 0     # 0 < 1 // 10 is false -> turn rule: own 0 <= 0 -> 40
    st.turn = 1
    assert N.explore_attack(st, a.id, 30, 30)[0] == 1 and moved
    assert a.order & 0xF == 1 and a.vector_dest == c and not a.flags & 0x20 and a.flags & 0x80
    b.own_cities = 1
    a.order = 0
    assert N.explore_attack(st, a.id, 30, 30)[0] == 0
    assert a.order & 0xF == 4 and a.flags & 0x20                # 0ae7([a], 4, 0, 0x20) stays


def test_explore_attack_flagged_city_after_clear_unseen(st, monkeypatch):
    """10a8: a flagged city calls 0b95; still flagged -> the scan goes on."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 30, 30)
    high(st)
    c0 = add_city(st, 29, 29, 3)
    c1 = add_city(st, 31, 31, 3)
    st.ai[0].city_flags[c1] = 1
    cleared = []
    stub(monkeypatch, "diplomacy", may_attack_city=lambda s, cc: 1)
    stub(monkeypatch, "evaluate", clear_unseen=lambda s, cc: cleared.append(cc))
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: 0)
    N.explore_attack(st, a.id, 30, 30)
    assert cleared == [c1] and c0 == 0


def test_explore_site_not_reached_marks_done(st, monkeypatch):
    """12eb: hero to a ruin; the executor stops short -> flags 0x40, then 0x20, order / goto cleared."""
    a = add_army(st, 28, 30, 30)
    high(st)
    paint(st, 33, 30, Terrain.SITE)
    stub(monkeypatch, "hero", site_at=lambda s, x, y: (4, 2), blessing_flag=lambda s, si: 2)
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: (2, []))
    r, _ = N.explore_site(st, a.id, 33, 30)
    assert r == 1 and a.flags & 0x60 == 0x60 and a.goto == (-1, -1) and a.order & 0xF == 0


def test_explore_site_refusals(st, monkeypatch):
    """12eb: no site, aboard, blessed at the temple, non-hero at a ruin, foreign owner nibble."""
    t = type_with(st, flag16=0)
    h = add_army(st, 28, 30, 30)
    w = add_army(st, t, 30, 30)
    high(st)
    monkeypatch.setattr(M, "execute_move", lambda *a, **k: pytest.fail("no move"))
    stub(monkeypatch, "hero", site_at=lambda s, x, y: (-1, None), blessing_flag=lambda s, si: 2)
    assert N.explore_site(st, h.id, 33, 30) == (0, [])
    stub(monkeypatch, "hero", site_at=lambda s, x, y: (1, 1), blessing_flag=lambda s, si: 2)
    h.flags |= 2
    assert N.explore_site(st, h.id, 33, 30) == (0, [])
    stub(monkeypatch, "hero", site_at=lambda s, x, y: (1, 2), blessing_flag=lambda s, si: 2)
    assert N.explore_site(st, w.id, 33, 30) == (0, [])
    st.world.flags[30 * 112 + 33] = (st.world.flags[30 * 112 + 33] & 0xF0) | 3
    assert N.explore_site(st, h.id, 33, 30) == (0, [])


def test_explore_stops_when_not_moved(st, monkeypatch):
    """0e4b: 0ae7([a], 4, 0, 0x20); one 0f46 when the square does not change."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 30, 30, moves=12)
    high(st)
    steps = []
    monkeypatch.setattr(N, "explore_step", lambda s, i, c: steps.append(i) or [])
    N.explore(st, a.id, -1)
    assert steps == [a.id] and a.flags & 0x20 and a.order & 0xF == 4


def test_explore_step_count(st, monkeypatch):
    """0e4b: steps = moves / 5 + 1; each move that keeps >= 4 moves and 0x20 uses one."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 30, 30, moves=10)
    high(st)
    n = []

    def step(s, i, c):
        n.append(i)
        s.armies[i].x += 1
        s.armies[i].moves_left -= 1
        return []
    monkeypatch.setattr(N, "explore_step", step)
    N.explore(st, a.id, -1)
    assert len(n) == 4                           # steps = 3: the 4th move finds steps == 0


def test_explore_step_fallback_clears_order(st, monkeypatch):
    """0f46: nothing found, not a flyer, c == -1 -> order, 0x20, goto and group cleared."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 30, 30)
    a.group, a.goto, a.order, a.flags = 3, (5, 5), 0x14, 0x21
    high(st)
    monkeypatch.setattr(N, "frontier", lambda s, i: (0, -1, -1, 0, -1, -1))
    N.explore_step(st, a.id, -1)
    assert (a.order, a.flags, a.goto, a.group) == (0x10, 1, (-1, -1), 0)


# ------------------------------------------------------------------------------- 0000 / 00b5


def test_neutral_phase_order_with_stubs(st, monkeypatch):
    """0000: sent from kind-1 orders; 00b5 pass 0 over own cities count-1..0: role 1 ->
    023f(c, 1) and 3; no neighbour -> 4; 03aa == 0 and 0935 -> roles; a pass returning 0 ends."""
    c0 = add_city(st, 10, 10, 0)
    c1 = add_city(st, 30, 10, 0)
    n1 = add_city(st, 20, 20, 0x0F)
    t = type_with(st, flag16=0)
    o = add_army(st, t, 50, 50)
    o.order, o.vector_dest = 1, n1
    high(st)
    b = st.ai[0]
    b.role[c0], b.role[c1] = 1, 3
    nb(st, c0, [(n1, 5)])
    log = []
    stub(monkeypatch, "clean_city", clean_city=lambda s, c, f: log.append(("023f", c, f)) or [])
    monkeypatch.setattr(N, "send_group", lambda s, c, sent: log.append(("03aa", c, sent[n1])) or (0, []))
    N.neutral(st)
    assert log == [("023f", 0, 1), ("03aa", 0, 1)]
    assert b.role[c1] == 4 and b.role[c0] == 3


def test_explore_move_uses_the_leaders_goto(st, monkeypatch):
    """1581: goto = (x, y); ovl67:06eb selects the square's group (its 0529 copies the
    leader's goto); 0a8b:0001 with DS:5e62's goto; r == 1 clears 0x20 and the order; 0x40,
    goto (-1, -1) and +0x11 = 0 on the army only."""
    t1, t2 = type_with(st, flag16=0), type_with(st, flag16=1)
    a = add_army(st, t1, 30, 30, flags=0x21)
    b = add_army(st, t2, 30, 30, flags=1)
    a.group = b.group = 5
    a.order = 0x13
    st.fight_order[0][t1], st.fight_order[0][t2] = 1, 9
    high(st)
    called = []
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: called.append((x, y)) or (1, []))
    N.explore_move(st, a.id, 35, 35)
    assert called == [(-1, -1)]                  # b leads: its goto is copied to a
    assert (a.flags & 0x60, a.order, a.goto, a.group) == (0x40, 0x10, (-1, -1), 0)
    assert b.group == 5


def test_explore_site_reached_searches_and_flags_allies(st, monkeypatch):
    """12eb on the site: DS:5e62 = the army, hero -> ovl22:15c3(i, s); kind 5 (056d's value):
    own armies with order kind 0 and a w13 type on the square get 0x20."""
    a = add_army(st, 28, 30, 30)
    high(st)
    ally_t = next(t.type_id for t in st.army_types if t.special and t.type_id != 28)
    searched = []

    def arrive(s, x, y, k=0):
        s.armies[a.id].x, s.armies[a.id].y = x, y
        return 4, []

    def search(s, i, si):
        searched.append((i, si, s.selection.selected))
        add_army(s, ally_t, 33, 30)
        high(s)
        return []
    monkeypatch.setattr(M, "execute_move", arrive)
    stub(monkeypatch, "hero", site_at=lambda s, x, y: (7, 5), blessing_flag=lambda s, si: 2)
    stub(monkeypatch, "move", search_on_arrival=search, search_command=lambda s: pytest.fail("hero"))
    r, _ = N.explore_site(st, a.id, 33, 30)
    assert r == 1 and searched == [(a.id, 7, a.id)]
    assert st.armies[-1].flags & 0x20 and a.flags & 0x20 and not a.flags & 0x40


def test_neutral_pass_explorers_when_send_group_says_so(st, monkeypatch):
    """00b5: 03aa != 0 -> 0b19(c, max(turn, 1) > 10) and role 2."""
    c0 = add_city(st, 10, 10, 0)
    n1 = add_city(st, 20, 20, 0x0F)
    nb(st, c0, [(n1, 5)])
    st.turn = 11
    log = []
    monkeypatch.setattr(N, "send_group", lambda s, c, sent: (1, []))
    monkeypatch.setattr(N, "send_explorers", lambda s, c, f: log.append((c, f)) or [])
    assert N.neutral_pass(st, 0, [0] * 100)[0] == 1
    assert log == [(c0, 1)] and st.ai[0].role[c0] == 2


# ------------------------------------------------------------------------------- review items (M8b3)


def test_neutral_sent_counts_order_cities_below_the_count(st, monkeypatch):
    """0000: sent[c] += 1 for own (cwde) armies with order kind 1 and order city c < count
    (0060..0071 `jae`); an index == count is not counted, another side's army neither."""
    t = type_with(st, flag16=0)
    c0 = add_city(st, 10, 10, 0)
    for owner, kind, c in ((0, 1, c0), (0, 1, c0), (0, 1, 1), (3, 1, c0), (0, 4, c0)):
        x = add_army(st, t, 50, 50, owner=owner)
        x.order, x.vector_dest = kind, c                     # city 1 == count: beyond the table
    high(st)
    seen = []
    monkeypatch.setattr(N, "neutral_pass", lambda s, p, sent: seen.append(list(sent[:3])) or (0, []))
    N.neutral(st)
    assert seen == [[2, 0, 0]]


def test_explore_step_kinds_fall_through_to_1581(st, monkeypatch):
    """0f46: found with kind 1 -> 10a8(i, kx, ky), kind 2 -> 12eb(i, kx, ky); a non-zero result
    ends the step, zero (and kind 0) goes to 1581 on the frontier square (x, y), not (kx, ky)."""
    t = type_with(st, flag16=0)
    a = add_army(st, t, 30, 30)
    high(st)
    log = []
    monkeypatch.setattr(N, "explore_attack", lambda s, i, x, y: log.append(("10a8", x, y)) or (r[0], []))
    monkeypatch.setattr(N, "explore_site", lambda s, i, x, y: log.append(("12eb", x, y)) or (r[0], []))
    monkeypatch.setattr(N, "explore_move", lambda s, i, x, y: log.append(("1581", x, y)) or [])
    for kind, res, want in ((1, 1, [("10a8", 7, 8)]), (1, 0, [("10a8", 7, 8), ("1581", 3, 4)]),
                            (2, 1, [("12eb", 7, 8)]), (2, 0, [("12eb", 7, 8), ("1581", 3, 4)]),
                            (0, 1, [("1581", 3, 4)])):
        r = [res]
        log.clear()
        monkeypatch.setattr(N, "frontier", lambda s, i, k=kind: (1, 3, 4, k, 7, 8))
        N.explore_step(st, a.id, -1)
        assert log == want, (kind, res)


def test_explore_attack_skips_quest_city_and_hero_needs_75(st, monkeypatch):
    """10a8: c == AI[+0x46] is skipped (1126) and the scan goes on to the next city; a hero
    keeps need = 75 whatever its strength (1215 before the strength test)."""
    h = add_army(st, 28, 30, 30)
    h.strength = 1
    high(st)
    c_low = add_city(st, 31, 31, 3)
    c_quest = add_city(st, 29, 29, 3)
    st.ai[0].quest_city = c_quest
    stub(monkeypatch, "diplomacy", may_attack_city=lambda s, cc: 1)
    stub(monkeypatch, "evaluate", clear_unseen=lambda s, cc: None)
    odds = []
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: odds.append(s.city_at(x, y)) or 74)
    monkeypatch.setattr(M, "execute_move", lambda *a, **k: pytest.fail("p < 75: no move"))
    b = st.ai[0]
    b.neutral_cities, b.own_cities = 0, 0                    # a weak non-hero would need 40
    st.turn = 1
    assert N.explore_attack(st, h.id, 30, 30)[0] == 0 and odds == [c_low]
    monkeypatch.setattr(U, "win_odds", lambda s, x, y: 75)
    moved = []
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: moved.append((x, y)) or (2, []))
    assert N.explore_attack(st, h.id, 30, 30)[0] == 1 and moved


def _explorer_city(st, n=3, t=None):
    t = type_with(st, flag16=0) if t is None else t
    c = add_city(st, 10, 10, 0)
    arm = [add_army(st, t, 10, 10) for _ in range(n)]
    return c, arm


def test_send_explorers_hero_only_with_a_task_force_and_fly_only(st, monkeypatch):
    """0b19: a hero is left out only while a task force is active (0c68..0c74); fly_only keeps
    flyers only; each chosen army goes to 0e4b(a, c)."""
    c, arm = _explorer_city(st, 1)
    h = add_army(st, 28, 10, 10)
    f = add_army(st, type_with(st, flag16=1), 10, 10)
    high(st)
    sent = []
    monkeypatch.setattr(N, "explore", lambda s, i, cc: sent.append(i) or [])
    N.send_explorers(st, c, 0)
    assert sorted(sent) == sorted([arm[0].id, h.id, f.id])
    st.ai[0].task_forces[2].age = 1
    sent.clear()
    N.send_explorers(st, c, 0)
    assert sorted(sent) == sorted([arm[0].id, f.id])
    sent.clear()
    N.send_explorers(st, c, 1)
    assert sent == [f.id]


def test_send_explorers_rechecks_the_threat_before_each(hm, monkeypatch):
    """0b19 0df9..0e36: with keep == 0 and Hidden Map, 0a3e(c, -1) < 15 is tested again before
    every explorer: an enemy that comes near stops the rest.  keep != 0 skips the test."""
    c, arm = _explorer_city(hm, 3)
    t = type_with(hm, flag16=0)
    high(hm)
    seen_all(hm)                                             # 0a3e counts seen armies only
    sent = []

    def go(s, i, cc):
        sent.append(i)
        add_army(s, t, 20, 10, owner=3)                      # 0a3e = 10 after the first one
        high(s)
        return []
    monkeypatch.setattr(N, "explore", go)
    N.send_explorers(hm, c, 0)
    assert len(sent) == 1
    sent.clear()
    hm.armies[-1].x = 26                                     # th = 16: keep 0 at the start ...
    hm.ai[0].no_quick_attack = 1                             # ... but AI[+0x48] makes keep 1
    for a in hm.armies:
        if a.owner == 3:
            a.x = 60
    N.send_explorers(hm, c, 0)
    assert len(sent) == 2                                    # one kept back, no threat test


def test_frontier_boat_and_skips(st):
    """177f: rnd(1,4,-1) == 0 on a coastal own city square, no hero -> boat: Water / Shore score
    200 + 10 min(d2, 50), land nothing; Hills without road and without DS:5dfa bit 0 skipped;
    terrain cost 0 skipped (not flying)."""
    t = type_with(st, flag16=0, flag18=0, flag17=0)
    c = add_city(st, 50, 50, 0)
    a = add_army(st, t, 50, 50)
    a.home_city = c
    high(st)
    U.order_stack(st, [a.id] + [-1] * 7, 4, 0, 0x20)
    for y in range(45, 55):
        for x in range(52, 55):
            paint(st, x, y, Terrain.WATER)
    from warlords2.rules import pathfinding as P
    P.rebuild_cost_map(st)
    assert P.coastal(st, 50, 50) or P.coastal(st, 51, 50)
    st.rng = Rec(st.rng, [0] + [1] * 200)
    found, x, y, _, _, _ = N.frontier(st, a.id)
    assert found and N._terrain(st, x, y) in (Terrain.WATER, Terrain.SHORE)
    st.rng = Rec(st.rng, [1] + [1] * 200)                    # no boat: land wins
    found, x, y, _, _, _ = N.frontier(st, a.id)
    assert found and N._terrain(st, x, y) not in (Terrain.WATER, Terrain.SHORE)
    # Hills without road: skipped (no draw for it); terrain cost 0: skipped
    for y in range(45, 55):
        for x in range(45, 55):
            if (x, y) not in ((50, 50), (51, 50), (50, 51), (51, 51)):
                paint(st, x, y, Terrain.HILLS)
    paint(st, 45, 45, Terrain.MOUNTAINS)
    st.rng = Rec(st.rng, [1] + [1] * 200)
    assert N.frontier(st, a.id)[0] == 0 and st.rng.calls == [(1, 4, -1)]
    st.world.roads[47 * 112 + 47] |= 1                       # a road piece: Hills square counts
    st.rng = Rec(st.rng, [1] + [1] * 200)
    found, x, y, _, _, _ = N.frontier(st, a.id)
    assert (found, x, y) == (1, 47, 47) and len(st.rng.calls) == 2


def test_neutral_chain_second_link_and_its_stops(st, monkeypatch):
    """06c7: after a link the chain goes on from the taken city when it is ours, AI[+0x48] == 0
    and 0a3e(best, -1) >= 10; d > 50 adds 30 more (40 < d: 10).  Each of the three tests stops
    it."""
    t = type_with(st, flag16=0)
    src = add_city(st, 10, 10, 0)
    n1 = add_city(st, 30, 10, 0x0F)
    n2 = add_city(st, 50, 10, 0x0F)
    nb(st, src, [(n1, 10)])
    nb(st, n1, [(n2, 51)])
    a = add_army(st, t, 10, 10)
    high(st)

    def run(take=True):
        moved = []

        def ex(s, x, y, k=0):
            moved.append((x, y))
            c = s.city_at(x, y) if s.city_at(x, y) >= 0 else s.city_at(x - 1, y)
            if take and c >= 0:
                s.cities[c].owner = 0
            return 2, []
        monkeypatch.setattr(M, "execute_move", ex)
        st.cities[n1].owner = st.cities[n2].owner = 0x0F
        st.rng = Rec(st.rng, [1] * 10)
        N.neutral_chain(st, src, 1, [0] * 100, [a.id] + [-1] * 7, [1])
        return moved
    assert len(run()) == 2 and st.ai.neutral_last == n2
    # d = 51: s = 1 + 51 + 10 + 30 + 0 = 92 is still the only candidate; the score is not shown
    assert run(take=False) == [(30, 10)]                     # not taken: stop
    st.ai[0].no_quick_attack = 1
    assert len(run()) == 1                                   # AI[+0x48] != 0: stop
    st.ai[0].no_quick_attack = 0
    add_army(st, t, 39, 10, owner=3)                         # 0a3e(n1) = 9 < 10: stop
    high(st)
    assert len(run()) == 1


def test_neutral_chain_far_bonus(st, monkeypatch):
    """06c7 07ef..082b: s = r + d + 10 sent + 100 - p, + 10 when d > 40 and + 30 more when d >
    50 (unsigned bytes), the smallest s wins (strict, slots 5..0)."""
    t = type_with(st, flag16=0)
    src = add_city(st, 10, 10, 0)
    c50, c51 = add_city(st, 30, 10, 0x0F), add_city(st, 10, 30, 0x0F)
    a = add_army(st, t, 10, 10)
    high(st)
    monkeypatch.setattr(M, "execute_move", lambda s, x, y, k=0: (2, []))
    nb(st, src, [(c50, 50), (c51, 51)])                      # slot 1 (c51) is drawn first
    st.rng = Rec(st.rng, [10, 39])                           # s(51) = 10 + 51 + 40 = 101; s(50) = 39 + 60 = 99
    N.neutral_chain(st, src, 1, [0] * 100, [a.id] + [-1] * 7, [1])
    assert st.ai.neutral_last == c50
    st.rng = Rec(st.rng, [8, 39])                            # s(51) = 99: not < 99, slot 1 kept
    N.neutral_chain(st, src, 1, [0] * 100, [a.id] + [-1] * 7, [1])
    assert st.ai.neutral_last == c51
    nb(st, src, [(c50, 50), (c51, 0x90)])                    # 144 unsigned: + 40
    st.rng = Rec(st.rng, [1, 39])                            # s(144) = 1 + 144 + 40 = 185
    N.neutral_chain(st, src, 1, [0] * 100, [a.id] + [-1] * 7, [1])
    assert st.ai.neutral_last == c50
