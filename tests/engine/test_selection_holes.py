"""Null slots in DS:5e3e (`Selection.moving`, -1 = null, kept in place): the AI's ovl29:14d3 /
0ae7 leave them, and every reader treats them as the listing does - 0c8c:0529, 0a8b:07f9 /
04c8 / 0476, ovl67:08fb, ovl24:0000 skip them; ovl38:0293..02ea copies slots 0..DS:5dfe-1 as
they are (the null slot itself left out: plan register X38).  The search table DS:3f86
(`GameState.dist_table`) and ovl29:1851 with a null DS:5e62.

Synthetic states of test_bonuses (all Plain); side 1 is the computer side."""
import pytest

from warlords2.ai import base as B
from warlords2.ai import util as U
from warlords2.ai.phases import clean_city as CC
from warlords2.model.ids import HERO_TYPE
from warlords2.rules import combat
from warlords2.rules import movement as M
from warlords2.rules import pathfinding as P
from warlords2.rules import selection as S

from test_bonuses import army, put
from test_move_executor import AI, ai_state, hooks, ready, select  # noqa: F401 (fixture)


def stack(st, n=3, x=10, y=10, **kw):
    return [put(st, 1, AI, x, y, **kw) for _ in range(n)]


# ----------------------------------------------------------------------------- writers


def test_order_stack_keeps_holes_and_0529_skips_them():
    """0ae7 0b59..0b64: DS:5e3e[i] null in place; 0529 058f..0597: count / moves / hero over the
    live slots only, the goto copy (0723..0766) to live slots only."""
    st = ready(ai_state())
    a, b = stack(st, 2, moves=9)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=4)
    last = put(st, 1, AI, 40, 40, moves=1)                 # the record armies[-1]
    army(st, a).goto = (3, 3)
    st.fight_order[AI] = [0] * 29
    st.fight_order[AI][1] = 5                              # a / b beat the hero: a leads
    U.order_stack(st, [-1, a, -1, h, b], -1, 0, 0)
    sel = st.selection
    assert sel.moving == [-1, a, -1, h, b] and sel.selected == a
    assert (sel.count, sel.moves, sel.group, sel.hero) == (3, 4, 1, h)
    assert army(st, h).goto == army(st, b).goto == (3, 3)
    assert army(st, last).goto == (-1, -1)


def test_select_list_null_leader_then_0529_takes_the_first_hero_by_slot():
    """14d3 with slot 0 empty: DS:5e62 null; 0529 (0566: null either way) -> DS:5e5e = the
    first hero by slot; nothing of the null leader is copied (its goto words would come from
    the interrupt vector table; every caller rewrites them, rules.selection.selection_step)."""
    st = ready(ai_state())
    w = put(st, 1, AI, 10, 10)
    h1 = put(st, HERO_TYPE, AI, 10, 10)
    h2 = put(st, HERO_TYPE, AI, 10, 10)
    for i, g in ((w, (1, 1)), (h1, (2, 2)), (h2, (3, 3))):
        army(st, i).goto = g
    st.selection.hero = w                                   # stale
    M.select_list(st, [-1, h2, w, h1])
    S.selection_step(st)
    sel = st.selection
    assert (sel.selected, sel.moving, sel.hero, sel.count, sel.group) == (-1, [-1, h2, w, h1], h2, 3, 1)
    assert [army(st, i).goto for i in (w, h1, h2)] == [(1, 1), (2, 2), (3, 3)]


# ----------------------------------------------------------------------------- readers


def test_battle_setup_copies_the_first_count_slots():
    """ovl38:0293..02ea: DS:42c6[i] = DS:5e3e[i] for i < DS:5dfe: with a hole the last live slot
    stays out; the null slot is left out (X38 stand-in).  DS:2bda clear: DS:5e62 alone; a null
    DS:5e62 gives an empty side for the AI's 15c5, a refusal for the advisor."""
    st = ready(ai_state())
    a, b, c = stack(st, 3)
    U.order_stack(st, [-1, a, -1, b, c], -1, 0, 0)
    assert st.selection.count == 3
    assert combat.selection_group(st) == [a]                # slots 0..2: null, a, null
    M.select_list(st, [-1, -1, c, -1])                      # one entry, not in slot 0
    assert (st.selection.selected, st.selection.moving, st.selection.group) == (-1, [], 0)
    assert combat.selection_group(st, True) == []
    with pytest.raises(M.IllegalCommand):
        combat.selection_group(st)


def test_empty_attacking_side_draws_no_dice():
    """15c5 on an empty side (X38): ovl36:08a6's count-0 rule, no rnd; a defended square is a
    loss (defender survivors), an empty one a win."""
    st = ready(ai_state())
    a, b = stack(st, 2)
    put(st, 1, 2, 11, 10)
    U.order_stack(st, [-1, -1, a, b], -1, 0, 0)
    st.selection.count = 2                                  # slots 0..1 both null
    before = st.rng.state()
    assert combat.simulate_selection(st, 11, 10)[1] == 1
    assert combat.simulate_selection(st, 12, 10)[1] == 0
    assert st.rng.state() == before


def test_mark_done_and_delete_selection_skip_null_slots():
    """ovl67:08fb 0921..0943 and ovl24:0000 0015..0022 skip a null slot (no record -1 in
    Python's sense: armies[-1] is untouched)."""
    st = ready(ai_state())
    a, b = stack(st, 2)
    last = put(st, 1, AI, 40, 40)
    U.order_stack(st, [-1, a, -1, b], -1, 0, 0)
    S.mark_done(st)
    assert army(st, a).flags & 0x40 and army(st, b).flags & 0x40
    assert not army(st, last).flags & 0x40
    CC.delete_selection(st, 0)
    assert army(st, a).owner == army(st, b).owner == 0xFF
    assert army(st, last).owner == AI
    assert (st.selection.moving, st.selection.selected) == ([], -1)


def test_walk_moves_the_live_slots_and_0476_counts_them(hooks):
    """0a8b:04c8 / 07f9 / 0d1a over DS:5e3e[7..0] skip null slots: the live members walk
    together; 0476 counts the non-null slots after the battle."""
    st = ready(ai_state())
    a, b = stack(st, 2, moves=20)
    last = put(st, 1, AI, 40, 40)
    hooks(st)
    U.order_stack(st, [-1, a, -1, b], -1, 0, 0)
    r, _, _ = M.walk_selection(st, 14, 10)
    assert (army(st, a).x, army(st, b).x) == (14, 14) and army(st, last).x == 40
    put(st, 1, 2, 15, 10, strength=1)
    U.order_stack(st, [-1, a, -1, b], -1, 0, 0)
    st.selection.count = 1                                  # set-up: slot 0 only (null)
    n, _ = M.attack_stack(st, 15, 10)
    assert n == len([i for i in st.selection.moving if i != -1])


def test_real_battle_leaves_the_live_slot_past_the_count_out(hooks):
    """ovl38:0293 copies slots 0..DS:5dfe-1: with [null, a, b] and DS:5dfe 2 only a fights; 0a6b
    makes its survivors DS:5e3e (dense), so b drops out of the selection."""
    st = ready(ai_state())
    a, b = stack(st, 2, moves=20)
    put(st, 1, 2, 11, 10, strength=1)
    hooks(st)
    U.order_stack(st, [-1, a, b], -1, 0, 0)
    assert st.selection.count == 2
    combat.ai_battle(st, 11, 10)
    assert st.battle_work.attackers == [a]
    assert b not in st.selection.moving and army(st, b).owner == AI


def test_record_battle_adds_nothing_without_a_first_attacker():
    """ovl25:09d7 reads DS:42c6[0]'s owner; a null first attacker (X38): nothing is added."""
    st = ready(ai_state())
    st.ai.allocated = 1
    put(st, 1, 2, 11, 10)
    U.order_stack(st, [-1, -1, put(st, 1, AI, 10, 10)], -1, 0, 0)
    st.selection.count, st.selection.group = 2, 1
    battle = combat.resolve(st, combat.selection_group(st), 11, 10)
    before = [list(r) for r in st.ai[2].memory]
    B.record_battle(st, battle)
    assert st.ai[2].memory == before


# ----------------------------------------------------------------------------- DS:3f86, 1851


def test_after_raze_with_null_leader_scores_on_the_previous_table(monkeypatch):
    """ovl29:1851 with DS:5e62 null: x = 0x174 (int 0's offset): 1ab9 returns before T, and
    1885 runs on the last search's table with flag 1; a live leader gets a fresh map."""
    st = ready(ai_state())
    a, b = stack(st, 2)
    U.order_stack(st, [a, b], -1, 0, 0)
    P.find_path(st, (10, 10), (30, 10), st.selection.mode, st.selection.mask)
    table = st.dist_table
    seen = []
    monkeypatch.setattr(B, "best_target", lambda s, flag, dm: seen.append((flag, dm.field)) or 7)
    st.selection.selected = -1
    B.after_raze(st, 0)
    assert seen == [(1, table)] and st.dist_table is table and st.ai.raze_target == 7
    st.selection.selected = a
    B.after_raze(st, 0)
    assert seen[1][1] is st.dist_table and st.dist_table is not table
    assert P.DistanceMap(0, st.dist_table).value(10, 10) == 1           # centred on the leader
    st.dist_table = []
    st.selection.selected = -1
    with pytest.raises(RuntimeError):
        B.after_raze(st, 0)
