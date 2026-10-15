"""The computer's move executor (resident 0a8b) and battle (ovl36:124a(x, y, 1)), ai.md §7a.1,
§7a.2, §7a.6, §7a.7: rules.movement walk_selection (0c4f(x, y, 1)), execute_move (0001),
attack_stack (0476), attack_order_city (0254), pick_up (ovl28:0427), set_selection /
selection_values (0c8c:0529); rules.combat ai_battle, selection_group, simulate_selection; and
the tutorial tail of the human move (0c8c:02a1..0415).

Synthetic states of test_bonuses (all Plain: cost 2 per step, DS:1274[7]); side 1 is the
computer side on turn.  Each case names the listing lines it pins."""
import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, MAP_ARMY, MAP_W, NO_OWNER, Control, ItemState, Terrain
from warlords2.model.item import Item
from warlords2.model.site import Site
from warlords2.model.state import SCN_TUTORIAL
from warlords2.rules import combat, engine
from warlords2.rules import movement as M
from warlords2.rules import pathfinding as P
from warlords2.rules.bonuses import ABOARD_FLAG
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.constants import movement as K

from test_bonuses import army, atype, city, default_types, mk_state, put, set_terrain
from test_combat import WIN, Hooks, script

AI = 1


def ai_state(types=None, **opts):
    st = mk_state(types, current=AI, **opts)
    return st


def ready(st):
    combat.refresh_map(st)
    P.rebuild_cost_map(st)
    return st


class MoveHooks:
    """Recording stand-ins for the executor's AI hooks (rules.movement.HOOKS)."""

    def __init__(self, retarget=None, quest_city=-1):
        self.calls = []
        self.retarget = retarget or {}
        self.quest = quest_city

    def get(self, name):
        def f(*args):
            self.calls.append((name,) + tuple(args[1:]))
            if name == "ai_retarget":
                return self.retarget.get(args[1], args[1])
            if name == "ai_quest_city":
                return self.quest
            if name == "ai_set_role":
                return None
            return []
        return f


class TakeHooks(Hooks):
    """take_city makes the attacker the owner (what rules.city.take_city does first)."""

    def get(self, name):
        f = super().get(name)
        if name != "take_city":
            return f

        def g(state, ci, attacker, owner, flying):
            f(state, ci, attacker, owner, flying)
            state.cities[ci].owner = attacker
            return []
        return g


@pytest.fixture
def hooks(monkeypatch):
    def install(st, retarget=None, quest_city=-1, take=False):
        mh = MoveHooks(retarget, quest_city)
        ch = (TakeHooks if take else Hooks)(st)
        monkeypatch.setattr(M, "_hook", mh.get)
        monkeypatch.setattr(combat, "_hook", ch.get)
        return mh, ch
    return install


def corridor(st, y, x0, x1):
    """Mountains above and below row y, so land paths keep to the row."""
    for x in range(x0, x1 + 1):
        set_terrain(st, x, y - 1, Terrain.MOUNTAINS)
        set_terrain(st, x, y + 1, Terrain.MOUNTAINS)


def select(st, leader, *members):
    M.set_selection(st, leader, list(members))


# ----------------------------------------------------------------------------- selection


def test_set_selection_and_values():
    """0c8c:0529: DS:5dfe = non-null DS:5e3e, DS:5e00 = signed min from 100 (0560, 05d3..05db),
    DS:2bda = count > 1, DS:5e5e = the leader if a hero else the first hero, goto copied."""
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10, moves=7)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=12)
    army(st, a).goto = (20, 20)
    select(st, a, a, h)
    v = M.selection_values(st)
    assert (v.count, v.moves, v.group, v.hero) == (2, 7, 1, h)
    assert army(st, h).goto == (20, 20)
    army(st, a).moves_left = army(st, h).moves_left = 120
    assert M.selection_values(st).moves == 7              # stored: no 0529 since
    select(st, a, a, h)
    assert M.selection_values(st).moves == 100
    with pytest.raises(engine.IllegalCommand):
        M.set_selection(st, a, [a] * 2)


def test_selection_group_and_simulation_follow_ds_2bda():
    """ovl38:0293..02ea: DS:5e3e[0..5dfe) with DS:2bda, else DS:5e62 alone."""
    st = ready(ai_state())
    a, b = put(st, 1, AI, 10, 10), put(st, 1, AI, 10, 10)
    put(st, 2, 2, 11, 10)
    st.selection.selected, st.selection.moving = a, [b]
    assert combat.selection_group(st) == [a]
    script(st, WIN, cycle=True)
    combat.simulate_selection(st, 11, 10)
    assert st.battle_work.attackers == [a]
    select(st, a, a, b)
    assert combat.selection_group(st) == [a, b]
    combat.simulate_selection(st, 11, 10)
    assert sorted(st.battle_work.attackers) == [a, b]


# ----------------------------------------------------------------------------- pick-up


def test_pick_up_needs_the_stack_hero_and_takes_the_city_block():
    """ovl28:0427: nothing without DS:5e5e (0466); off a city only (x, y) (0492..04b7); on a
    City square the 2x2 from (x, y) (04c0..0505); state 3, holder = the hero (0511..055a)."""
    st = ready(ai_state())
    h = put(st, HERO_TYPE, AI, 10, 10)
    st.items = [Item("i%d" % i, 1, 0, int(ItemState.ON_MAP), -1, x, y)
                for i, (x, y) in enumerate([(10, 10), (11, 10), (20, 20), (21, 21), (19, 20)])]
    assert M.pick_up(st, 10, 10) == []                    # no hero selected yet
    select(st, h, h)
    ev = M.pick_up(st, 10, 10)
    assert [e.info["item"] for e in ev] == [0]
    assert (st.items[0].state, st.items[0].holder) == (ItemState.CARRIED, h)
    city(st, 20, 20, AI, 1)
    M.pick_up(st, 20, 20)
    assert [it.state == ItemState.CARRIED for it in st.items] == [True, False, True, True, False]


# ----------------------------------------------------------------------------- 0c4f


def test_walk_selection_no_path_is_status_1():
    """0a8b:0c4f: goto set (0c5b..0c69), 0555:000a fails -> 1 (0cb1), nothing moves."""
    st = ai_state()
    set_terrain(st, 20, 10, Terrain.MOUNTAINS)
    a = put(st, 1, AI, 10, 10)
    ready(st)
    select(st, a, a)
    status, ahead, ev = M.walk_selection(st, 20, 10)
    assert (status, ahead) == (1, None) and ev[0].info["no_path"]
    assert (army(st, a).x, army(st, a).goto) == (10, (20, 10))


def test_walk_selection_moves_the_selection_not_a_command_group():
    """07f9 with DS:2bda: DS:5e3e walks on DS:5e00; an army of the square outside DS:5e3e stays;
    out of moves -> 2 (0a90); only the leader's goto is written (0c5b)."""
    st = ai_state()
    corridor(st, 10, 9, 31)
    a, b, c = put(st, 1, AI, 10, 10, moves=10), put(st, 1, AI, 10, 10, moves=14), put(st, 1, AI, 10, 10)
    ready(st)
    select(st, a, a, b)
    status, _, ev = M.walk_selection(st, 30, 10)
    assert status == 2
    assert [(army(st, i).x, army(st, i).moves_left) for i in (a, b, c)] == [(15, 0), (15, 4), (10, 10)]
    assert army(st, b).goto == (-1, -1) and army(st, a).goto == (30, 10)
    assert ev[0].info["path"] == [(11 + i, 10) for i in range(5)]


def test_walk_selection_single_army_uses_its_own_points():
    """07f9 0832..0847: without DS:2bda the budget is DS:5e62's +7."""
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10, moves=6)
    select(st, a, a)
    assert M.walk_selection(st, 30, 10)[0] == 2 and army(st, a).x == 13


# ----------------------------------------------------------------------------- 0001


def test_execute_move_early_return_changes_nothing(hooks):
    """0a8b:002a..0053: no DS:5e62 or (x, y) off the map -> 0 before the loop and the keep test."""
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10)
    hooks(st)
    assert M.execute_move(st, 5, 5) == (0, [])
    select(st, a, a)
    assert M.execute_move(st, 112, 5) == (0, []) and st.selection.selected == a
    assert not army(st, a).flags & 0x40


def test_execute_move_arrival_marks_done_and_deselects(hooks):
    """007f..00a2: the leader on its goto -> status 4 and goto (-1, -1); keep 0 -> ovl67:08fb and
    0b62:08b3 (022a..023d)."""
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10, moves=20)
    hooks(st)
    select(st, a, a)
    r, ev = M.execute_move(st, 14, 10)
    assert r == 4 and (army(st, a).x, army(st, a).goto) == (14, (-1, -1))
    assert army(st, a).flags & 0x40 and st.selection.selected == -1
    select(st, a, a)
    assert M.execute_move(st, 16, 10, keep=1)[0] == 4 and st.selection.selected == a


def test_execute_move_out_of_moves_is_done(hooks):
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10, moves=6)
    hooks(st)
    select(st, a, a)
    r, _ = M.execute_move(st, 30, 10)
    assert r == 2 and army(st, a).flags & 0x40 and army(st, a).goto == (30, 10)


def test_execute_move_fights_the_stack_ahead_and_goes_on(hooks):
    """Status 3 -> 0476(DS:5dc8, DS:5dc6) = 124a(x, y, 1); survivors -> 0529 and the next round
    walks on from the battle square (0206..021c)."""
    st = ai_state()
    corridor(st, 10, 9, 17)
    a = put(st, 1, AI, 10, 10, moves=40)
    d = put(st, 2, 2, 12, 10)
    ready(st)
    hooks(st)
    select(st, a, a)
    script(st, WIN, cycle=True)
    r, ev = M.execute_move(st, 16, 10)
    assert r == 4 and army(st, a).x == 16
    assert army(st, d).owner == 0xFF
    kinds = [type(e).__name__ for e in ev]
    assert kinds.index("BattleStarted") < kinds.index("BattleEnded") < len(kinds) - 1


def test_execute_move_site_order_searches_on_arrival(hooks):
    """Status 4 with k == 3 and DS:5e5e: ovl22:15c3(hero index, ovl62:04b5(hero square)) and
    DS:5e3e +0xe &= 0xf0, &= 0x8f (0150..0204)."""
    st = ready(ai_state())
    st.sites = [Site(14, 10, "s", 1, 0, 0, 0, 0)]
    h = put(st, HERO_TYPE, AI, 10, 10, moves=20)
    b = put(st, 1, AI, 10, 10, moves=20)
    army(st, h).order, army(st, b).order = 0xB3, 0x93
    mh, _ = hooks(st)
    select(st, h, h, b)
    M.execute_move(st, 14, 10)
    assert ("ai_search_on_arrival", h, 0) in mh.calls
    assert (army(st, h).order, army(st, b).order) == (0x80, 0x80)


def test_execute_move_site_order_kind_is_read_once(hooks):
    """k is read at 0020 only: without kind 3 on entry no search."""
    st = ready(ai_state())
    st.sites = [Site(14, 10, "s", 1, 0, 0, 0, 0)]
    h = put(st, HERO_TYPE, AI, 10, 10, moves=20)
    mh, _ = hooks(st)
    select(st, h, h)
    army(st, h).order = 0x31
    M.execute_move(st, 14, 10)
    assert not [c for c in mh.calls if c[0] == "ai_search_on_arrival"]
    assert army(st, h).order == 0x31


def _cities(st):
    corridor(st, 10, 9, 15)
    own = city(st, 10, 30, AI, 1)                          # city 0, the side's own
    foe = city(st, 16, 10, 2, 1)                           # city 1, side 2's, empty
    return own, foe


def test_execute_move_redirect_to_another_city(hooks):
    """Status 5 on a city goto, order city c foreign -> 0254: AI[+0x46] != c, ovl29:1771(c, x, y)
    = t != c -> DS:5e3e order kind 1, city t, goto t's square, 1; the loop walks on (0129..014a)."""
    st = ai_state()
    own, foe = _cities(st)
    a = put(st, 1, AI, 10, 10, moves=110)
    ready(st)
    army(st, a).vector_dest, army(st, a).order = foe, 0x41
    mh, _ = hooks(st, retarget={foe: own})
    select(st, a, a)
    r, _ = M.execute_move(st, 16, 10)
    assert ("ai_quest_city",) in mh.calls and ("ai_retarget", foe, 16, 10) in mh.calls
    assert (army(st, a).vector_dest, army(st, a).order) == (own, 0x41)
    assert r == 4 and (army(st, a).x, army(st, a).y) == (10, 30)


def test_execute_move_quest_city_with_hero_is_not_retargeted(hooks):
    """0318..033d: AI[+0x46] == c and DS:5e5e -> t = c without ovl29:1771: battle (03ea), the
    taken city goes to ovl26:0000(c, owner before) (0400..0416), orders cleared."""
    st = ai_state()
    own, foe = _cities(st)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=60)
    ready(st)
    army(st, h).vector_dest, army(st, h).order = foe, 0x21
    mh, ch = hooks(st, quest_city=foe, take=True)
    select(st, h, h)
    script(st, WIN, cycle=True)
    r, _ = M.execute_move(st, 16, 10)
    assert not [c for c in mh.calls if c[0] == "ai_retarget"]
    assert ("ai_captured", foe, 2) in mh.calls
    assert (army(st, h).vector_dest, army(st, h).order) == (0, 0x20)
    assert r == 5 and st.cities[foe].owner == AI


def test_attack_order_city_neutral_sets_role_one(hooks):
    """0285..0303: c neutral -> 124a on the blocking square; c now the side's -> AI +0x56 + c = 1;
    orders cleared (0444); result 0."""
    st = ai_state()
    c = city(st, 16, 10, NO_OWNER, 1)
    put(st, 2, NO_OWNER, 16, 10)
    a = put(st, 1, AI, 15, 10)
    ready(st)
    army(st, a).vector_dest, army(st, a).order = c, 0x51
    mh, ch = hooks(st, take=True)
    select(st, a, a)
    script(st, WIN, cycle=True)
    res, goto, ev = M.attack_order_city(st, c, 16, 10, (16, 10))
    assert (res, goto) == (0, (16, 10))
    assert ("ai_set_role", c, 1) in mh.calls
    assert (army(st, a).vector_dest, army(st, a).order) == (0, 0x50)
    assert any(isinstance(e, E.BattleEnded) for e in ev)


def test_attack_order_city_own_city_only_clears_orders(hooks):
    st = ai_state()
    c = city(st, 16, 10, AI, 1)
    a = put(st, 1, AI, 15, 10)
    ready(st)
    army(st, a).vector_dest, army(st, a).order = c, 0x21
    mh, _ = hooks(st)
    select(st, a, a)
    assert M.attack_order_city(st, c, 17, 10, (16, 10)) == (0, (16, 10), [])
    assert (army(st, a).vector_dest, army(st, a).order) == (0, 0x20) and mh.calls == []


def test_stale_n_without_a_battle_stops(hooks):
    """Status 5 with the order city the side's own and n still 0 (000e): the loop ends."""
    st = ai_state()
    own, foe = _cities(st)
    a = put(st, 1, AI, 10, 10, moves=60)
    ready(st)
    army(st, a).vector_dest = own
    hooks(st)
    select(st, a, a)
    r, _ = M.execute_move(st, 16, 10)
    assert r == 5 and army(st, a).x == 15 and st.selection.selected == -1


def test_stale_n_after_a_won_battle_never_ends(hooks):
    """n (DI) is zeroed only on entry: after a won battle (n = 1) a status 5 with the own order
    city loops (0131), and from the square before the city nothing changes: the original hangs
    (ai.md §7a.1); here MoveLoopHang (a RuntimeError)."""
    st = ai_state()
    own, foe = _cities(st)
    a = put(st, 1, AI, 10, 10, moves=60)
    put(st, 2, 2, 12, 10)
    ready(st)
    army(st, a).vector_dest = own
    hooks(st)
    select(st, a, a)
    script(st, WIN, cycle=True)
    with pytest.raises(M.MoveLoopHang, match="never ends") as e:
        M.execute_move(st, 16, 10)
    assert isinstance(e.value, RuntimeError)
    assert army(st, a).x == 15


def _not_written(monkeypatch, hooks, name):
    """Hook `name` of the `hooks` table points at a function that does not exist (a step not
    written yet)."""
    ms, _, what, addr = hooks[name]
    monkeypatch.setitem(hooks, name, (ms, "test_move_executor:not_written", what, addr))


def test_executor_hooks_are_required_in_strict_mode(monkeypatch):
    _not_written(monkeypatch, M.HOOKS, "ai_retarget")
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10)
    select(st, a, a)
    with pytest.raises(engine.NotImplementedCommand):
        M.execute_move(st, 14, 10)
    assert army(st, a).x == 10 and army(st, a).goto == (-1, -1)
    with allowing_unverified():
        assert M.execute_move(st, 14, 10)[0] == 4


# ----------------------------------------------------------------------------- 124a(x, y, 1)


def test_ai_battle_sets_up_before_the_prelude(hooks):
    """124a calls ovl38:008b at 1311 and the prelude 0522 at 1466: a land unit attacking Water
    fights at its strength (not aboard at 4, as the human path ovl36:0000 has it) and is put
    aboard afterwards."""
    types = default_types()
    types[8] = atype(8, strength=9)
    st = mk_state(types, current=AI)
    set_terrain(st, 5, 5, Terrain.WATER)
    put(st, 2, 2, 5, 5, flags=ABOARD_FLAG)
    land = put(st, 8, AI, 4, 5)
    ready(st)
    hooks(st)
    select(st, land, land)
    script(st, WIN, cycle=True)
    ev = combat.ai_battle(st, 5, 5)
    bs = next(e for e in ev if isinstance(e, E.BattleStarted))
    assert bs.info["a_strength"] == [9]
    assert army(st, land).flags & ABOARD_FLAG and army(st, land).moves_left == 0


def test_ai_battle_charges_the_stale_attack_cost(hooks):
    """DS:4160 is written only by the human attack (ovl36:0211): 0 before any, then the last
    human attack's max(2, DS:1274[t])."""
    st = ready(ai_state())
    a = put(st, 1, AI, 4, 5, moves=10)
    put(st, 2, 2, 5, 5)
    hooks(st)
    select(st, a, a)
    script(st, WIN, cycle=True)
    combat.ai_battle(st, 5, 5)
    assert army(st, a).moves_left == 10 and (army(st, a).x, army(st, a).goto) == (5, (-1, -1))
    st.current = 0
    set_terrain(st, 21, 20, Terrain.HILLS)
    h0 = put(st, 1, 0, 20, 20)
    put(st, 2, 2, 21, 20)
    engine.apply(st, C.Attack((h0,), 21, 20))
    assert st.battle_work.attack_cost == 6
    st.current = AI
    b = put(st, 1, AI, 4, 7, moves=10)
    put(st, 2, 2, 5, 7)
    select(st, b, b)
    combat.ai_battle(st, 5, 7)
    assert army(st, b).moves_left == 4


def test_ai_battle_step_order(hooks):
    """1502 ovl25:09d7, 1543 0a6b (history, take-over), 1686 2274, 1697 ovl01:1ded(0, ...) (the
    quest hook with captured False = words (0, 0, 0, 0, 0)), 16a3 ovl26:038d(x, y); no
    re-selection of the target square (the human path's ovl67:06eb): the survivors stay
    DS:5e3e as 0a6b left them, without the 0x200 / bit 0 marks of 06eb."""
    st = ai_state()
    ci = city(st, 10, 10, 2, 1)
    a, b = put(st, 1, AI, 9, 11), put(st, 1, AI, 9, 11)
    put(st, 2, 2, 11, 11)
    ready(st)
    _, ch = hooks(st)
    select(st, a, a, b)
    script(st, WIN, cycle=True)
    ev = combat.ai_battle(st, 11, 11)
    names = [c[0] for c in ch.calls]
    assert names == ["ai_memory", "history", "take_city", "medals", "quest_check", "ai_after_battle"]
    assert ch.calls[-2][2] is False and ch.calls[-1][1:] == (11, 11)
    assert st.cities[ci].attacked_by == 1 << AI
    assert sorted(st.selection.moving) == [a, b] and st.selection.selected == st.selection.moving[0]
    assert all(army(st, i).flags & 0x201 == 0 for i in (a, b))
    assert st.world.flags[11 * MAP_W + 11] & MAP_ARMY
    assert st.pending is None and isinstance(ev[-1], E.BattleEnded) and ev[-1].info["captured"]


@pytest.mark.parametrize("rel,treachery", [(0, True), (1, True), (2, False)])
def test_ai_battle_treachery_before_the_battle_dice(hooks, rel, treachery):
    """13d8..1420: a city target, Diplomacy on, owner byte != 0x0f and relation & 3 != 2 ->
    ovl36:20a8 at once (no question): rnd(1,100,0) from peace / rnd(1,15,0) from neutral, then
    the battle dice of 08a6."""
    st = ai_state(diplomacy=1)
    city(st, 10, 10, 2, 1)
    a = put(st, 1, AI, 9, 11)
    put(st, 2, 2, 11, 11)
    ready(st)
    st.relations[AI][2] = st.relations[2][AI] = rel
    hooks(st)
    select(st, a, a)
    src = script(st, [(5,)] + WIN * 4)
    ev = combat.ai_battle(st, 11, 11)
    first = {0: 100, 1: 15}.get(rel)
    assert src.sides[:1] == ([first] if treachery else [20])
    assert any(isinstance(e, E.Treachery) for e in ev) == treachery
    assert st.relations[AI][2] & 3 == 2 and st.relations[2][AI] & 3 == 2


def test_ai_battle_needs_its_hooks_in_strict_mode(monkeypatch):
    _not_written(monkeypatch, combat.HOOKS, "ai_after_battle")
    st = ready(ai_state())
    a = put(st, 1, AI, 4, 5)
    put(st, 2, 2, 5, 5)
    select(st, a, a)
    with pytest.raises(engine.NotImplementedCommand):
        combat.ai_battle(st, 5, 5)
    assert army(st, a).x == 4


# ----------------------------------------------------------------------------- human move tail


def test_human_move_tail_shows_the_turn_one_page():
    """0c8c:02a9..02f0: status 2 -> done mark, deselect, then page (25, 9) on turn 1 (SCN 0x12e);
    the cue is the last event of the Move, as SelectStack returns its pages."""
    st = ready(mk_state())
    st.flags[SCN_TUTORIAL], st.flags[0x134] = 1, 0
    a = put(st, 1, 0, 10, 10, moves=6)
    ev = engine.apply(st, C.Move((a,), (30, 10)))
    assert ev[0].info["status"] == 2
    assert ev[-1] == E.TurnCue({"kind": "tutorial", "file": (25, 9)})
    assert st.selection.selected == -1
    st.turn = 2
    army(st, a).moves_left, army(st, a).flags = 6, 0
    ev = engine.apply(st, C.Move((a,), (30, 10)))
    assert not [e for e in ev if isinstance(e, E.TurnCue)]


def test_human_move_tail_city_page_after_another_status():
    """0c8c:02f9..039d: status != 2 -> (25, 4) when one of the 8 squares around DS:5e62 holds a
    city of another owner (byte 0x134 bit 4)."""
    st = mk_state()
    city(st, 20, 10, 2, 1)
    st.flags[SCN_TUTORIAL], st.flags[0x134] = 1, 0
    a = put(st, 1, 0, 10, 10, moves=40)
    ready(st)
    ev = engine.apply(st, C.Move((a,), (19, 10)))
    assert ev[0].info["status"] in (0, 4) and army(st, a).x == 19
    assert ev[-1] == E.TurnCue({"kind": "tutorial", "file": (25, 4)}) and st.flags[0x134] == 0x10


def test_human_move_without_tutorial_has_no_cue():
    st = ready(mk_state())
    a = put(st, 1, 0, 10, 10, moves=6)
    ev = engine.apply(st, C.Move((a,), (30, 10)))
    assert not [e for e in ev if isinstance(e, E.TurnCue)]


# ----------------------------------------------------------------------------- text rolls (X33)


def test_text_roll_counts_are_string_dat_groups(game):
    """ovl59:052f reads the group's entry count (0584) for index -1: 0x8d, 0x42, 0x43."""
    from pathlib import Path
    from warlords2.formats.tables import StringTable
    from warlords2.rules.constants import combat as KC
    t = StringTable((Path(game) / "DATA" / "STRING.DAT").read_bytes())
    assert len(t.groups[0x8D]) == KC.FLED_GROUP_COUNT.value
    assert (len(t.groups[0x42]), len(t.groups[0x43])) == KC.CAPTURE_GROUP_COUNTS.value


def test_unopposed_capture_draws_the_text_rolls_in_order(monkeypatch):
    """Human attack on an empty city: no battle dice (08a6 at once), STRING 0x8d rnd(1, 4, -1)
    at ovl36:0316, then (quest check 0) ovl31:0039 / 005a rnd(1, 4, -1), rnd(1, 3, -1)."""
    st = mk_state()
    city(st, 10, 10, 1, 1)
    a = put(st, 1, 0, 9, 11)
    ready(st)
    monkeypatch.setattr(combat, "_hook", Hooks(st).get)
    src = script(st, [(3,), (2,), (1,)])
    ev = engine.apply(st, C.Attack((a,), 10, 11))
    end = next(e for e in ev if isinstance(e, E.BattleEnded))
    assert src.sides == [4, 4, 3]
    assert end.info["fled_text"] == 2 and st.pending.info["texts"] == [1, 0]


def test_opposed_or_field_battle_has_no_fled_roll(monkeypatch):
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    monkeypatch.setattr(combat, "_hook", Hooks(st).get)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((a,), 5, 5))
    assert "fled_text" not in ev[-1].info
