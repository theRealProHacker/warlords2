"""rules.selection: stack palette (ovl66:000a / 0910 / 0963 / 0a55 / 0a99 / 0d30), Next
(ovl67:019b / 040e / 06eb), Quit & Next (ovl67:0393), Defend (ovl67:03a6), Deselect
(0b62:08b3), Move All (0c8c:04c4 / ovl67:05c4), Disband (0b62:06bf / 076a), and the turn-start
pieces fortify (ovl67:0000), flag clear (ovl67:0113) and group cleanup (0b62:0d85)."""
import importlib
import inspect
import json
import re

import pytest

from movekit import add_army, flat_state, paint, type_with
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, MAP_FORTIFIED, MAP_W, Terrain
from warlords2.model.serialize import dump, load
from warlords2.rules import engine
from warlords2.rules import selection as S
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.engine import IllegalCommand, NotImplementedCommand

pytestmark = pytest.mark.gamedata
AWAKE, DONE, VISITED = 0x01, 0x40, 0x200


@pytest.fixture
def st(game):
    s = flat_state(game)
    s.fight_order[0] = list(range(29))           # fight-order byte = type id
    return s


def foot(st):
    return type_with(st, flag16=0, flag19=0)


def army(st, x, y, t=None, flags=AWAKE, group=0, owner=0, goto=(-1, -1), type_id=None):
    a = add_army(st, foot(st) if type_id is None else type_id, x, y, owner=owner, flags=flags)
    a.group, a.goto = group, goto
    return a


def sel(st):
    return st.selection


# ----------------------------------------------------------------------------- turn start


def test_clear_turn_flags_own_side_and_reference_square(st):
    """ovl67:0113: 0x40 and 0x200 cleared on own armies only; DS:3250/3252 = record +4/+6."""
    a = army(st, 5, 5, flags=AWAKE | DONE | VISITED | 0x1000)
    b = army(st, 6, 5, flags=DONE | VISITED, owner=1)
    S.clear_turn_flags(st)
    assert a.flags == AWAKE | 0x1000 and b.flags == DONE | VISITED
    assert sel(st).next_ref == tuple(st.players[0].capital)


def test_group_cleanup_single_member_ids(st):
    """0b62:0d85: an id >= 2 with one own army on the map -> 0; ids 0/1, pairs, other sides and
    armies off the map are not counted or changed."""
    lone = army(st, 5, 5, group=4)
    p1, p2 = army(st, 6, 6, group=5), army(st, 6, 6, group=5)
    off = army(st, 7, 7, group=6)
    off.x = off.y = -1
    with_off = army(st, 8, 8, group=6)
    enemy = army(st, 9, 9, group=7, owner=1)
    defended = army(st, 10, 10, group=1)
    S.group_cleanup(st)
    assert (lone.group, p1.group, p2.group) == (0, 5, 5)
    assert (off.group, with_off.group) == (6, 0)       # the off-map one is neither counted nor reset
    assert enemy.group == 7 and defended.group == 1


@pytest.mark.parametrize("terrain,road,marked", [
    (Terrain.PLAIN, False, True), (Terrain.FOREST, False, True), (Terrain.HILLS, False, True),
    (Terrain.BRIDGE, False, True), (Terrain.MARSH, False, True), (Terrain.TOWER, False, True),
    (Terrain.MOUNTAINS, False, False), (Terrain.SHORE, False, False), (Terrain.SITE, False, False),
    (Terrain.MOUNTAINS, True, True), (Terrain.SITE, True, True)])
def test_fortify_squares(st, terrain, road, marked):
    """ovl67:0000: terrain in {1, 4, 5, 7, 8, 9} or a road piece."""
    paint(st, 5, 5, terrain, road=road)
    army(st, 5, 5, flags=0)
    ev = S.fortify_marks(st)
    assert bool(st.world.flags[5 * MAP_W + 5] & MAP_FORTIFIED) == marked
    assert ev == ([E.Fortified({"squares": [(5, 5)]})] if marked else [])


def test_fortify_needs_asleep_full_moves_own(st):
    """bit 0 clear and +7 >= +6 (signed); own side only."""
    awake = army(st, 5, 5, flags=AWAKE)
    spent = army(st, 6, 6, flags=0)
    spent.moves_left = spent.allowance - 1
    enemy = army(st, 7, 7, flags=0, owner=1)
    full = army(st, 8, 8, flags=0)
    full.moves_left = full.allowance + 2
    S.fortify_marks(st)
    f = st.world.flags
    assert [bool(f[a.y * MAP_W + a.x] & MAP_FORTIFIED) for a in (awake, spent, enemy, full)] == \
        [False, False, False, True]


# ----------------------------------------------------------------------------- Next


def test_next_nearest_then_reference_moves(st):
    """ovl67:040e: smallest |dx|+|dy| to DS:3250/3252; the reference becomes the result."""
    sel(st).next_ref = (10, 10)
    far = army(st, 20, 10)
    near = army(st, 12, 11)
    engine.apply(st, C.Next())
    assert sel(st).selected == near.id and sel(st).next_ref == (12, 11)
    assert near.flags & VISITED and not far.flags & VISITED
    engine.apply(st, C.Next())
    assert sel(st).selected == far.id


def test_next_distance_zero_counts_9000_and_ties_highest_index(st):
    sel(st).next_ref = (10, 10)
    here = army(st, 10, 10)
    t1 = army(st, 13, 10)
    t2 = army(st, 10, 13)                        # same distance 3, higher index
    engine.apply(st, C.Next())                   # here counts 9000; t1, t2 at 3 -> t2 (higher)
    assert sel(st).selected == t2.id and sel(st).next_ref == (10, 13)
    engine.apply(st, C.Next())                   # from (10, 13): here 3, t1 6
    assert sel(st).selected == here.id
    engine.apply(st, C.Next())
    assert sel(st).selected == t1.id


def test_next_skips_asleep_and_done_and_resets_cycle(st):
    sel(st).next_ref = (0, 0)
    asleep = army(st, 2, 2, flags=0)
    done = army(st, 3, 3, flags=AWAKE | DONE)
    a = army(st, 20, 20, flags=AWAKE | VISITED)
    b = army(st, 30, 30, flags=AWAKE | VISITED)
    other = army(st, 1, 1, flags=AWAKE | VISITED, owner=1)
    engine.apply(st, C.Next())                   # only visited ones left: reset the cycle
    assert sel(st).selected == a.id
    assert not b.flags & VISITED and other.flags & VISITED and a.flags & VISITED
    engine.apply(st, C.Next())
    assert sel(st).selected == b.id
    assert asleep.flags == 0 and done.flags == AWAKE | DONE


def test_next_nothing_left_deselects(st):
    a = army(st, 5, 5, flags=0)
    sel(st).selected = a.id
    engine.apply(st, C.Next())
    assert sel(st).selected == -1


def test_select_stack_members_leader_and_wake(st):
    """ovl67:06eb: same nonzero +0x11 joins and gets 0x200 and bit 0; the leader has the
    highest fight-order byte; group 0 selects the army alone."""
    types = sorted(t.type_id for t in st.army_types
                   if t.type_id != HERO_TYPE and not t.flag16 and not t.flag19)
    t_lo, t_hi = types[0], types[-1]
    a = army(st, 5, 5, type_id=t_lo, flags=0, group=3)
    b = army(st, 5, 5, type_id=t_hi, flags=0, group=3)
    c = army(st, 5, 5, type_id=t_hi, flags=0, group=0)
    engine.apply(st, C.SelectStack(5, 5))        # square list first: highest +0x11 -> a or b
    assert sel(st).selected == b.id and sorted(sel(st).moving) == [a.id, b.id]
    assert a.flags == b.flags == AWAKE | VISITED and c.flags == 0
    assert sel(st).palette == [b.id, a.id, c.id] and sel(st).palette_group == [0, 0, 1]
    assert sel(st).palette_selected == [1, 1, 0]


# ----------------------------------------------------------------------------- palette


def stack(st, n, x=5, y=5, **kw):
    return [army(st, x, y, **kw) for _ in range(n)]


def test_group_all_new_id_and_goto_copy(st):
    """ovl66:0a55 + 000a: one run, awake -> smallest free id (2, with id 1 taken: constants
    FREE_ID_SLOT1_TAKEN); the leader's goto goes to every member."""
    a, b, c = stack(st, 3)
    elsewhere = army(st, 9, 9, group=2)          # id 2 in use on the map -> 3
    engine.apply(st, C.SelectStack(5, 5))
    lead = sel(st).selected
    st.armies[lead].goto = (7, 5)
    engine.apply(st, C.GroupAll(5, 5))
    assert {a.group, b.group, c.group} == {3} and elsewhere.group == 2
    assert sorted(sel(st).moving) == [a.id, b.id, c.id] and sel(st).selected == sel(st).palette[0]
    assert {a.goto, b.goto, c.goto} == {st.armies[sel(st).selected].goto}


def test_free_id_skips_one_without_defended_army(st):
    """0b62:0cde's id-1 word is uninitialised; modelled as taken, so 2 even with no +0x11 = 1."""
    stack(st, 2)
    engine.apply(st, C.SelectStack(5, 5))
    engine.apply(st, C.GroupAll(5, 5))
    assert {st.armies[i].group for i in sel(st).palette} == {2}


def test_ungroup_all(st):
    """ovl66:0a99: index i per army, only slot 0 selected -> all +0x11 = 0, moving = slot 0."""
    arms = stack(st, 3, group=4)
    engine.apply(st, C.SelectStack(5, 5))
    engine.apply(st, C.UngroupAll(5, 5))
    assert [a.group for a in arms] == [0, 0, 0]
    assert sel(st).moving == [sel(st).palette[0]] == [sel(st).selected]


def test_reuse_ids_from_the_top_never_the_first(st):
    """000a: ids >= 2 on the palette in order of appearance L = [5, 3]; the first awake run of
    two takes L[1] = 3, the next one a free id (L[0] = 5 is never reused); an asleep run -> 1."""
    a1, a2 = stack(st, 2, group=5)
    b1, b2 = stack(st, 2, group=3)
    c1, c2 = stack(st, 2, group=9, flags=0)
    engine.apply(st, C.SelectStack(5, 5))        # palette sorted by +0x11: 9, 9, 5, 5, 3, 3
    assert [st.armies[i].group for i in sel(st).palette] == [9, 9, 5, 5, 3, 3]
    assert sel(st).palette_group == [0, 0, 1, 1, 2, 2]
    # SelectStack woke group 9; put it back to sleep to get an asleep run
    c1.flags = c2.flags = 0
    engine.apply(st, C.SelectGroup(a1.id))       # select the 5-run; L = [9, 5, 3]
    # runs: [c] asleep -> 1; [a] awake -> L[2] = 3; [b] (bit 0 set at creation) -> L[1] = 5
    assert (c1.group, c2.group) == (1, 1)
    assert (a1.group, a2.group) == (3, 3)
    assert (b1.group, b2.group) == (5, 5)
    assert sorted(sel(st).moving) == sorted([a1.id, a2.id])


def test_reuse_then_free_id(st):
    """With L = [4] the awake run takes a free id (L[0] is never reused), found while the old
    ids are still on the map (0b62:0cde runs mid-renumbering: 2 is taken elsewhere, 4 by the
    run itself -> 3); Select Army joins the first selected army's index (ovl66:0963), and runs
    are contiguous palette positions, so the joined army forms a run of its own."""
    a1, a2 = stack(st, 2, group=4)
    b1, b2 = stack(st, 2, group=0)
    elsewhere = army(st, 9, 9, group=2)
    engine.apply(st, C.SelectStack(5, 5))
    assert sel(st).palette == [a2.id, a1.id, b2.id, b1.id]
    assert sel(st).palette_group == [0, 0, 1, 2] and sel(st).palette_selected == [1, 1, 0, 0]
    engine.apply(st, C.Group((b1.id,)))          # b1 joins index 0; the sort ovl66:17e7(1)
    assert sel(st).palette == [a2.id, a1.id, b1.id, b2.id]      # moves it up to its index
    assert sel(st).palette_group == [0, 0, 0, 1]
    assert (a1.group, a2.group, b1.group, b2.group, elsewhere.group) == (3, 3, 3, 0, 2)
    assert sel(st).moving == [a2.id, a1.id, b1.id] and sel(st).selected == a2.id


def test_group_all_sorts_the_palette_before_the_apply_step(st):
    """ovl66:0a7f: ovl66:17e7(1) sorts the palette by index, ties by fight-order byte
    (descending, current side's row) before ovl66:000a, so the leader is the army with the
    greater fight-order byte, not the first one of the old palette."""
    t_low = foot(st)
    t_high = max(t.type_id for t in st.army_types
                 if t.type_id not in (t_low, 28) and not t.flag16 and not t.flag19)
    low = army(st, 5, 5, type_id=t_low, group=5)
    high = army(st, 5, 5, type_id=t_high)
    engine.apply(st, C.SelectStack(5, 5))
    assert sel(st).palette == [low.id, high.id] and sel(st).selected == low.id   # +0x11 5 first
    engine.apply(st, C.GroupAll(5, 5))
    assert sel(st).palette == [high.id, low.id] and sel(st).selected == high.id
    assert sel(st).moving == [high.id, low.id]


def test_toggle_alone_in_index_does_nothing(st):
    """ovl66:0963: a selected army alone in its palette index stays selected."""
    a, b = stack(st, 2)
    engine.apply(st, C.SelectStack(5, 5))
    lead = sel(st).selected
    engine.apply(st, C.Ungroup((lead,)))
    assert sel(st).selected == lead and sel(st).palette_selected[sel(st).palette.index(lead)] == 1
    other = b.id if lead == a.id else a.id
    engine.apply(st, C.Group((other,)))
    assert sorted(sel(st).moving) == sorted([a.id, b.id])
    assert a.group == b.group == 2
    engine.apply(st, C.Ungroup((other,)))        # shares index 0 -> leaves for index 1
    assert sel(st).moving == [lead] and a.group == b.group == 0
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Ungroup((other,)))    # not selected
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Group((lead,)))       # already selected


def test_palette_out_of_date_is_refused(st):
    a, b = stack(st, 2)
    engine.apply(st, C.SelectStack(5, 5))
    b.x = 6
    with pytest.raises(IllegalCommand, match="out of date"):
        engine.apply(st, C.GroupAll(5, 5))
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.GroupAll(6, 5))


# ----------------------------------------------------------------------------- orders


def test_defend_then_next(st):
    """ovl67:03a6: bit 0 cleared and +0x11 = 1 on each member; goto and RNG untouched; Next."""
    a, b = stack(st, 2, goto=(9, 9))
    c = army(st, 20, 20)
    rng = st.rng.state()
    engine.apply(st, C.Defend((a.id, b.id)))
    assert (a.flags & AWAKE, b.flags & AWAKE, a.group, b.group) == (0, 0, 1, 1)
    assert a.goto == b.goto == (9, 9) and st.rng.state() == rng
    assert sel(st).selected == c.id
    S.fortify_marks(st)
    assert st.world.fortified(5, 5) and not st.world.fortified(20, 20)


def test_leave_group_marks_done_and_next(st):
    """ovl67:0393 -> 08fb (0x40 on the stack) -> Next, which skips it from then on."""
    a, b = stack(st, 2)
    c = army(st, 8, 5)
    engine.apply(st, C.LeaveGroup((a.id, b.id)))
    assert a.flags & DONE and b.flags & DONE and not c.flags & DONE
    assert sel(st).selected == c.id
    engine.apply(st, C.LeaveGroup((c.id,)))
    assert sel(st).selected == -1
    engine.apply(st, C.LeaveGroup(()))           # nothing selected: just Next
    assert sel(st).selected == -1


def test_deselect_changes_no_army_byte(st):
    stack(st, 2)
    engine.apply(st, C.SelectStack(5, 5))
    before = dump(st)["armies"]
    moving = list(sel(st).moving)
    engine.apply(st, C.Deselect())
    assert sel(st).selected == -1 and dump(st)["armies"] == before and sel(st).moving == moving


def test_move_all_order_and_exclusions(st):
    """0c8c:04c4: selected stack with a goto first; then nearest-first by ovl67:05c4 without
    a cycle reset; asleep and done armies and armies without goto never move."""
    sel(st).next_ref = (0, 0)
    first = army(st, 50, 50, goto=(52, 50))
    near = army(st, 10, 10, goto=(12, 10))
    far = army(st, 30, 30, goto=(32, 30))
    nogoto = army(st, 5, 5)
    asleep = army(st, 6, 6, flags=0, goto=(8, 6))
    done = army(st, 7, 7, flags=AWAKE | DONE, goto=(9, 7))
    sel(st).selected, sel(st).moving = first.id, [first.id]
    ev = engine.apply(st, C.MoveAll())
    order = [e.info["armies"][0] for e in ev if isinstance(e, E.Moved)]
    assert order == [first.id, near.id, far.id]
    assert (first.x, near.x, far.x) == (52, 12, 32)
    assert (asleep.x, done.x, nogoto.x) == (6, 7, 5)
    assert nogoto.flags & VISITED and not asleep.flags & VISITED
    assert first.goto == (-1, -1)                # leader on its goto -> cleared (0c8c:027c)
    engine.apply(st, C.MoveAll())                # everything visited: nothing moves again
    assert (near.x, far.x) == (12, 32)


def test_move_all_out_of_moves_marks_done_and_deselects(st):
    a = army(st, 10, 10, goto=(40, 10))
    a.moves_left = 4
    sel(st).next_ref = (10, 10)
    engine.apply(st, C.MoveAll())
    assert a.flags & DONE and sel(st).selected == -1 and 10 < a.x < 40


def test_move_adopts_group_as_selection(st):
    a, b = stack(st, 2)
    engine.apply(st, C.Move((b.id, a.id), (7, 5)))
    assert sel(st).selected == b.id and sel(st).moving == [b.id, a.id]


def test_human_move_ends_with_the_01fd_tail(st):
    """Every human move enters through 0c8c:01fd -> 0a8b:0c4f(x, y, 0): with a path the palette
    is rebuilt at the new square (0a8b:0d0a), the leader's goto is cleared on arrival
    (0c8c:027c), and status 2 marks the stack done and deselects it (0c8c:02a9..02bc)."""
    a, b = stack(st, 2)
    other = army(st, 7, 5)
    engine.apply(st, C.Move((a.id, b.id), (7, 5)))
    assert sorted(sel(st).palette) == sorted([a.id, b.id, other.id]) and sel(st).selected == a.id
    assert a.goto == (-1, -1) and b.goto == (7, 5)
    assert not a.flags & DONE
    c = army(st, 20, 20)
    c.moves_left = 4
    ev = engine.apply(st, C.Move((c.id,), (40, 20)))
    assert ev[0].info["status"] == 2 and c.flags & DONE and sel(st).selected == -1
    assert c.goto == (40, 20)


def test_computer_move_has_no_01fd_tail(st):
    """A computer side moves through 0a8b:0001 (AI), not 0c8c:01fd: no palette rebuild, goto
    kept, no done mark or deselect here."""
    st.players[0].control = 1
    c = army(st, 20, 20)
    c.moves_left = 4
    ev = engine.apply(st, C.Move((c.id,), (40, 20)))
    assert ev[0].info["status"] == 2 and not c.flags & DONE and sel(st).selected == c.id
    assert sel(st).palette == []


# ----------------------------------------------------------------------------- Disband


def test_disband_question_then_no_then_yes(st):
    a, b = stack(st, 2)
    ev = engine.apply(st, C.Disband((a.id, b.id)))
    assert isinstance(st.pending, E.DisbandPrompt) and ev == [st.pending]
    assert st.pending.info == {"armies": (a.id, b.id), "heroes": False}
    with pytest.raises(IllegalCommand, match="pending"):
        engine.apply(st, C.Next())
    engine.apply(st, C.ConfirmDisband(False))
    assert st.pending is None and a.owner == 0 and b.owner == 0
    engine.apply(st, C.Disband((a.id, b.id)))
    engine.apply(st, C.ConfirmDisband(True))
    assert a.owner == b.owner == 0xFF and a.x == -1
    assert not st.world.flags[5 * MAP_W + 5] & 0x10
    assert sel(st).selected == -1 and sel(st).moving == [] and sel(st).hero == -1
    with pytest.raises(IllegalCommand, match="no pending"):
        engine.apply(st, C.ConfirmDisband(True))


def test_disband_hero_needs_the_hero_death_step(st):
    h = army(st, 5, 5, type_id=HERO_TYPE)
    hsh = st.hash()
    if S._hook("hero_died") is not None:
        pytest.skip("M7a delivered rules.heroes.hero_died; covered by test_disband_hero_and_quest_record")
    with pytest.raises(NotImplementedCommand):
        engine.apply(st, C.Disband((h.id,)))
    assert st.hash() == hsh and st.pending is None


@pytest.mark.parametrize("grouped", [True, False])
def test_disband_hero_and_quest_record(st, monkeypatch, grouped):
    """0b62:076a: the hero goes through ovl36:16cd first; only the group path clears the quest
    record (+0 = 0) when its +4 is the disbanded hero."""
    h = army(st, 5, 5, type_id=HERO_TYPE)
    other = army(st, 5, 5)
    q = st.players[0].quest
    q.active, q.hero = 1, h.id
    calls = []

    def died(state, army_id, x, y):
        calls.append((army_id, x, y))
        return [E.HeroDied({"army": army_id})]

    monkeypatch.setattr(S, "_hook", lambda name: died)
    group = (h.id, other.id) if grouped else (h.id,)
    engine.apply(st, C.Disband(group))
    assert st.pending.info["heroes"] is True
    ev = engine.apply(st, C.ConfirmDisband(True))
    assert calls == [(h.id, 5, 5)] and ev == [E.HeroDied({"army": h.id})]
    assert h.owner == 0xFF and (other.owner == 0xFF) == grouped
    assert q.active == (0 if grouped else 1)


def test_hook_signature():
    """HOOKS documents f(state, ...); an existing target takes exactly those parameters."""
    for name, (milestone, target, doc, _) in S.HOOKS.items():
        params = [p.strip() for p in re.match(r"^f\(([^)]*)\)", doc).group(1).split(",")]
        assert params[0] == "state"
        mod, fn = target.split(":")
        try:
            f = getattr(importlib.import_module(mod), fn, None)
        except ModuleNotFoundError:
            f = None
        if f is not None:
            assert list(inspect.signature(f).parameters) == params


# ----------------------------------------------------------------------------- state


def test_selection_is_serialised_and_hashed(st):
    stack(st, 3)
    h0 = st.hash()
    engine.apply(st, C.SelectStack(5, 5))
    assert st.hash() != h0
    st2 = load(json.loads(json.dumps(dump(st))))
    assert st2.hash() == st.hash() and st2.selection == st.selection


# ----------------------------------------------------------------------------- fuzz


def _order_cmd(st, r):
    own = [a for a in st.armies if a.owner == st.current and a.y >= 0]
    if not own:
        return None
    a = r.choice(own)
    here = tuple(b.id for b in own if (b.x, b.y) == (a.x, a.y))
    grp = tuple(r.sample(here, r.randint(1, len(here))))
    pal = st.selection.palette
    k = r.randrange(12)
    if k == 0:
        return C.SelectStack(a.x, a.y)
    if k == 1:
        return C.Next()
    if k == 2:
        return C.LeaveGroup(grp if r.random() < 0.8 else ())
    if k == 3:
        return C.Defend(grp)
    if k == 4:
        return C.GroupAll(a.x, a.y)
    if k == 5:
        return C.UngroupAll(a.x, a.y)
    if k == 6 and pal:
        return C.Group((r.choice(pal),))
    if k == 7 and pal:
        return C.Ungroup((r.choice(pal),))
    if k == 8 and pal:
        return C.SelectGroup(r.choice(pal))
    if k == 9:
        return C.MoveAll()
    if k == 10:
        return C.Deselect()
    return C.Disband(grp)


@pytest.mark.parametrize("name,seed", [("DRAGON", 2), ("TUTORIA", 4)])
def test_order_fuzz(game, name, seed):
    """Random Move / Attack (test_fuzz) mixed with the order and palette commands, with the
    turn-start pieces at each side change; invariants after every command; same hash twice."""
    import collections
    import logging
    import random
    from test_fuzz import OPTS, build, invariants, random_cmd
    from warlords2.rules import movement as M
    from warlords2.rules import pathfinding as P
    from warlords2.rules.mapwords import refresh_map

    def play():
        with allowing_unverified():
            st = build(game, name, seed, OPTS[seed % 3])
            r = random.Random(seed * 31 + 7)
            alive = [p.index for p in st.players if p.alive]
            refresh_map(st)
            P.rebuild_cost_map(st)
            errs, counts = [], collections.Counter()
            for k in range(150):
                if k % 25 == 0:
                    st.pending = None
                    st.current = alive[(alive.index(st.current) + 1) % len(alive)]
                    refresh_map(st)
                    P.rebuild_cost_map(st)
                    S.group_cleanup(st)
                    M.refresh_moves(st, st.current)
                    S.fortify_marks(st)
                    S.clear_turn_flags(st)
                if isinstance(st.pending, E.DisbandPrompt):
                    cmd = C.ConfirmDisband(r.random() < 0.5)
                elif st.pending is not None:
                    st.pending = None
                    continue
                else:
                    cmd = _order_cmd(st, r) if r.random() < 0.6 else random_cmd(st, r)
                if cmd is None:
                    continue
                try:
                    engine.apply(st, cmd)
                    counts[type(cmd).__name__] += 1
                except IllegalCommand:
                    counts["illegal"] += 1
                errs += invariants(st, "%s step %d %s" % (name, k, type(cmd).__name__))
                if errs:
                    break
            return st, errs, counts

    logging.disable(logging.WARNING)
    try:
        st, errs, counts = play()
        st2, _, _ = play()
    finally:
        logging.disable(logging.NOTSET)
    assert errs == []
    assert sum(counts[n] for n in ("Next", "Defend", "LeaveGroup", "GroupAll", "MoveAll")) > 0
    assert st.hash() == st2.hash()
