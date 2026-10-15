"""The stored selection words DS:5dfe / 5e00 / 2bda / 5dfc / 5dfa (rules.movement
store_selection_words, `state.selection` count / moves / group / mode / mask): written by the
selection step 0c8c:0529 and the few other writers of the listing, read - not recomputed - by
the walk 0a8b:0c4f / 07f9, the set-up ovl38:0293, the attacks ovl36:0000 / 124a, the prelude
ovl36:0522 and the reveal in ovl36:0a6b; the view update at the end of the human prelude
(ovl36:0718..08a2); the infinite-loop guard of 0a8b:0001.

Synthetic states of test_bonuses (all Plain); side 1 is the computer side, side 0 human."""
import random

import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, ItemState, ItemType, Terrain
from warlords2.model.item import Item
from warlords2.rules import combat, engine
from warlords2.rules import movement as M
from warlords2.rules.bonuses import ABOARD_FLAG
from warlords2.rules.constants import movement as K
from warlords2.rules.constants import turn as KT

from test_bonuses import army, atype, default_types, mk_state, put, set_terrain
from test_combat import WIN, Hooks, script
from test_move_executor import AI, _cities, ai_state, hooks, ready, select  # noqa: F401 (fixture)

FLYER = 6


def flyer_types():
    types = default_types()
    types[FLYER] = atype(FLYER, flag16=1)
    return types


def wings(st, x, y, state=ItemState.ON_MAP, holder=-1):
    st.items.append(Item("wings", int(ItemType.FLIGHT), 0, int(state), holder, x, y))
    return len(st.items) - 1


def words(st):
    s = st.selection
    return s.count, s.moves, s.group, s.mode, s.mask


# ----------------------------------------------------------------------------- 0c8c:0529


def test_0529_stores_the_words_until_the_next_0529():
    """055a..071e: count, signed min from 100, count > 1, mode / mask; nothing else rewrites
    DS:5dfc / 5dfa, so a later flight item or moves change is not seen until 0529 runs again."""
    st = ready(ai_state())
    a = put(st, 1, AI, 10, 10, moves=7)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=12)
    select(st, a, a, h)
    assert words(st) == (2, 7, 1, K.MODE_LAND.value, 0)
    wings(st, 0, 0, ItemState.CARRIED, h)
    army(st, a).moves_left = 30
    assert words(st) == (2, 7, 1, K.MODE_LAND.value, 0)
    select(st, a, a, h)
    assert words(st) == (2, 12, 1, K.MODE_FLY.value, 0)
    select(st, a)                                       # no DS:5e3e entry: allfly stays 1
    assert words(st) == (0, 100, 0, K.MODE_FLY.value, 0)


def test_select_list_writes_count_moves_group_but_not_mode():
    """ovl29:14d3: DS:2bda / 5dfe / 5e00 / 5e3e / 5e62 from the list, DS:5dfc / 5dfa / 5e5e
    untouched; a -1 entry leaves its slot null in place (more than one entry); one entry
    not in slot 0 makes DS:5e3e[0] / 5e62 record -1, kept null here (plan register X38)."""
    st = ready(ai_state(flyer_types()))
    f = put(st, FLYER, AI, 10, 10, moves=9)
    a, b = put(st, 1, AI, 20, 20, moves=5), put(st, 1, AI, 20, 20, moves=8)
    select(st, f, f)
    assert st.selection.mode == K.MODE_FLY.value and st.selection.hero == -1
    M.select_list(st, [a, b, -1])
    assert (st.selection.selected, st.selection.moving) == (a, [a, b])
    assert words(st) == (2, 5, 1, K.MODE_FLY.value, 0)
    M.select_list(st, [b])
    assert (st.selection.selected, words(st)) == (b, (1, 8, 0, K.MODE_FLY.value, 0))
    M.select_list(st, [-1] * 8)
    assert (st.selection.selected, st.selection.moving, words(st)[:3]) == (-1, [], (0, 100, 0))
    M.select_list(st, [-1, a, b])
    assert (st.selection.selected, st.selection.moving, words(st)[:3]) == (-1, [-1, a, b], (2, 5, 1))
    M.select_list(st, [-1, b])
    assert (st.selection.selected, st.selection.moving, words(st)[:3]) == (-1, [], (1, 8, 0))
    M.select_list(st, [a, -1, b, -1])
    assert (st.selection.selected, st.selection.moving) == (a, [a, -1, b])
    with pytest.raises(engine.IllegalCommand):
        M.select_list(st, [a, b, a])


# ----------------------------------------------------------------------------- stale mode


def _channel(st):
    for y in range(40):                                 # water at x = 15, rows 0..39
        set_terrain(st, 15, y, Terrain.WATER)


def test_flight_item_picked_up_by_0001_does_not_make_the_stack_fly(hooks):
    """0a8b:0001 picks up at 0064 (ovl28:0427) after the AI's 0529: 0c4f searches with the
    stored DS:5dfc (0555:1868 at 18ae), so the hero walks round the channel, not across."""
    st = ai_state()
    _channel(st)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=40)
    i = wings(st, 10, 10)
    ready(st)
    hooks(st)
    select(st, h, h)
    _, ev = M.execute_move(st, 20, 10)
    assert (st.items[i].state, st.items[i].holder) == (ItemState.CARRIED, h)
    path = next(e for e in ev if isinstance(e, E.Moved)).info["path"]
    assert all(st.world.terrain(x, y) != Terrain.WATER for x, y in path)
    assert max(y for _, y in path) >= 30 and st.selection.mode == K.MODE_LAND.value


def test_control_after_a_0529_the_stack_flies(hooks):
    st = ai_state()
    _channel(st)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=40)
    wings(st, 10, 10, ItemState.CARRIED, h)
    ready(st)
    hooks(st)
    select(st, h, h)
    _, ev = M.execute_move(st, 20, 10)
    path = next(e for e in ev if isinstance(e, E.Moved)).info["path"]
    assert (15, 10) in path and (army(st, h).x, army(st, h).y) == (20, 10)


def test_item_picked_up_on_the_way_keeps_the_land_mode_after_a_redirect(hooks):
    """0a8b:04c8 picks up per step (0598); a redirect by 0254 (n = 1) loops without a 0529, so
    the second round still walks (no Mountains), though the hero now carries the wings."""
    st = ai_state()
    own, foe = _cities(st)
    h = put(st, HERO_TYPE, AI, 10, 10, moves=110)
    i = wings(st, 12, 10)
    ready(st)
    army(st, h).vector_dest, army(st, h).order = foe, 0x41
    hooks(st, retarget={foe: own})
    select(st, h, h)
    r, ev = M.execute_move(st, 16, 10)
    assert st.items[i].holder == h and st.selection.mode == K.MODE_LAND.value
    walks = [e.info["path"] for e in ev if isinstance(e, E.Moved)]
    assert len(walks) == 2 and walks[1]
    assert all(st.world.terrain(x, y) != Terrain.MOUNTAINS for x, y in walks[1])
    assert r == 4 and (army(st, h).x, army(st, h).y) == (10, 30)


# ----------------------------------------------------------------------------- other writers


def test_walk_lowers_the_stored_moves_of_a_group_only():
    """0a8b:09ff..0a11: with DS:2bda DS:5e00 = max(0, DS:5e00 - cost); without it is not
    touched (the leader's +7 is the budget)."""
    st = ready(ai_state())
    a, b = put(st, 1, AI, 10, 10, moves=9), put(st, 1, AI, 10, 10, moves=12)
    select(st, a, a, b)
    M.walk_selection(st, 13, 10)
    assert st.selection.moves == 3 and [army(st, i).moves_left for i in (a, b)] == [3, 6]
    c = put(st, 1, AI, 30, 30, moves=9)
    select(st, c, c)
    M.walk_selection(st, 33, 30)
    assert st.selection.moves == 9 and army(st, c).moves_left == 3


def test_battle_count_is_rewritten_but_the_group_flag_waits_for_0529(hooks):
    """ovl36:0a6b 0afd..0b47: DS:5dfe = the survivors, DS:2bda kept; 0a8b:0476 then runs 0529
    (04be), which rewrites DS:2bda."""
    st = ready(ai_state())
    weak = put(st, 1, AI, 4, 5, strength=1)
    strong = put(st, 1, AI, 4, 5, strength=9)
    put(st, 2, 2, 5, 5, strength=9)
    hooks(st)
    select(st, weak, weak, strong)
    script(st, [(1, 20), (1, 20), (20, 1), (20, 1)])   # one attacker dies, then the defender
    combat.ai_battle(st, 5, 5)
    n = len(st.selection.moving)
    assert 0 < n < 2 and st.selection.count == n and st.selection.group == 1
    assert combat.selection_group(st) == st.selection.moving[:1]
    M.store_selection_words(st)
    assert st.selection.group == 0


def test_attack_stack_runs_0529_after_the_battle(hooks):
    st = ready(ai_state())
    a, b = put(st, 1, AI, 4, 5, strength=1), put(st, 1, AI, 4, 5, strength=9)
    put(st, 2, 2, 5, 5, strength=9)
    hooks(st)
    select(st, a, a, b)
    script(st, [(1, 20), (1, 20), (20, 1), (20, 1)])
    n, _ = M.attack_stack(st, 5, 5)
    assert n == len(st.selection.moving) == 1 and st.selection.group == 0


def test_prelude_boarding_zeroes_the_stored_moves_even_when_nobody_boards(hooks):
    """ovl36:0522 061d: DS:5e00 = 0 once the board branch runs (leader not aboard, Water /
    Shore, DS:5dfc != 2), boarded or not; then with DS:2bda 0641 max(0, 5e00 - DS:4160)."""
    st = mk_state(flyer_types(), current=AI)
    set_terrain(st, 5, 5, Terrain.WATER)
    put(st, 2, 2, 5, 5, flags=ABOARD_FLAG)
    lead = put(st, FLYER, AI, 4, 5, moves=10)
    other = put(st, FLYER, AI, 4, 5, moves=10, flags=ABOARD_FLAG)    # aboard: mode 1, mask 8
    ready(st)
    hooks(st)
    select(st, lead, lead, other)
    assert (st.selection.mode, st.selection.mask, st.selection.moves) == (1, 8, 10)
    script(st, WIN, cycle=True)
    ev = combat.ai_battle(st, 5, 5)
    assert not any(isinstance(e, E.Embarked) for e in ev)
    assert st.selection.moves == 0


def test_prelude_lowers_the_stored_moves_by_the_attack_cost(hooks):
    st = ready(ai_state())
    a, b = put(st, 1, AI, 4, 5, moves=10), put(st, 1, AI, 4, 5, moves=7)
    put(st, 2, 2, 5, 5)
    hooks(st)
    select(st, a, a, b)
    st.battle_work.attack_cost = 4
    script(st, WIN, cycle=True)
    combat.ai_battle(st, 5, 5)
    assert st.selection.moves == 3 and [army(st, i).moves_left for i in (a, b)] == [6, 3]


def test_ai_battle_flies_by_the_stored_mode(hooks):
    """124a's prelude tests the stored DS:5dfc (05a3): a hero that picked up wings after the
    0529 still boards on a Water target."""
    st = mk_state(current=AI)
    set_terrain(st, 5, 5, Terrain.WATER)
    put(st, 2, 2, 5, 5, flags=ABOARD_FLAG)
    h = put(st, HERO_TYPE, AI, 4, 5)
    ready(st)
    hooks(st)
    select(st, h, h)
    wings(st, 0, 0, ItemState.CARRIED, h)               # after the 0529
    script(st, WIN, cycle=True)
    combat.ai_battle(st, 5, 5)
    assert st.selection.mode == K.MODE_LAND.value
    # the flight item keeps the hero out of the board loop (ovl35:08b4 at 05e9) but the
    # branch ran: DS:5e00 = 0
    assert not army(st, h).flags & ABOARD_FLAG and st.selection.moves == 0


# ----------------------------------------------------------------------------- human path


def _human(st, *ids):
    st.selection.selected, st.selection.moving = ids[0], list(ids)


def test_human_move_reads_the_stored_mode(hooks):
    """0c8c:01fd -> 0c4f(x, y, 0) uses the stored words too: wings taken after the selection
    (no 0529 since) do not lift the stack; a new selection (adopt changes it: the player's
    ovl67:06eb / ovl66:000a, both 0529) does."""
    st = mk_state()
    _channel(st)
    h = put(st, HERO_TYPE, 0, 10, 10, moves=40)
    a = put(st, 1, 0, 10, 10, moves=40)
    ready(st)
    engine.apply(st, C.Move((h,), (11, 10)))
    assert st.selection.mode == K.MODE_LAND.value
    wings(st, 0, 0, ItemState.CARRIED, h)
    ev = engine.apply(st, C.Move((h,), (20, 10)))
    path = next(e for e in ev if isinstance(e, E.Moved)).info["path"]
    assert path and all(st.world.terrain(x, y) != Terrain.WATER for x, y in path)
    st2 = mk_state()
    _channel(st2)
    h = put(st2, HERO_TYPE, 0, 10, 10, moves=40)
    a = put(st2, 1, 0, 10, 10, moves=40)
    wings(st2, 0, 0, ItemState.CARRIED, h)
    ready(st2)
    _human(st2, a)                                      # another stack is selected
    ev = engine.apply(st2, C.Move((h,), (20, 10)))
    assert (15, 10) in next(e for e in ev if isinstance(e, E.Moved)).info["path"]


def test_human_attack_reads_the_stored_mode_and_moves(hooks):
    """ovl36:003f DS:5dfc, 0189..01a7 DS:5e00 with DS:2bda: a stack whose words are stale
    attacks with them."""
    st = mk_state()
    set_terrain(st, 5, 5, Terrain.MOUNTAINS)            # DS:1274 cost 0: only fliers enter
    put(st, 2, 1, 5, 5)
    h = put(st, HERO_TYPE, 0, 4, 5)
    ready(st)
    hooks(st)
    engine.apply(st, C.SelectStack(4, 5))               # ovl67:06eb -> 0529: mode 1
    wings(st, 0, 0, ItemState.CARRIED, h)
    with pytest.raises(engine.IllegalCommand, match="cannot be entered"):
        engine.apply(st, C.Attack((h,), 5, 5))
    st.selection.selected = -1                          # a new selection: 0529 sees the wings
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((h,), 5, 5))
    assert ev[-1].info["attacker_won"]


# ----------------------------------------------------------------------------- view (item 4)


def _view(st, left, top):
    t, l, b, r, cx, cy = KT.SCN_VIEW.value
    st.flags.update({l: left, t: top, r: left + 8, b: top + 8, cx: left + 4, cy: top + 4})


def _read_view(st):
    t, l, b, r, cx, cy = KT.SCN_VIEW.value
    return tuple(st.flags[k] for k in (l, t, r, b, cx, cy))


def _attack(st, frm, to, hooks):
    a = put(st, 1, 0, *frm)
    put(st, 2, 1, *to)
    ready(st)
    hooks(st)
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((a,), *to))


@pytest.mark.parametrize("view,frm,to,after", [
    # (left, top), leader square, target -> (left, top, right, bottom, cx, cy)
    ((0, 0), (8, 5), (9, 5), (4, 1, 12, 9, 8, 5)),          # on the right edge: recentre
    ((0, 0), (2, 0), (3, 1), (0, 0, 6, 4, 2, 0)),           # top edge: recentre, clamped at 0
    ((100, 140), (109, 153), (110, 154), (105, 149, 112, 156, 109, 153)),   # caps 0x70 / 0x9c
    ((10, 10), (16, 14), (17, 14), (11, 10, 19, 18, 15, 14)),   # inside: scroll right
    ((10, 10), (14, 14), (15, 14), (10, 10, 18, 18, 14, 14)),   # centre + 1 == x: no scroll
    ((10, 10), (13, 13), (12, 12), (9, 9, 17, 17, 13, 13)),     # left and up
    ((0, 10), (1, 14), (0, 14), (0, 10, 8, 18, 4, 14)),         # left == 0: no scroll left
    ((103, 147), (110, 150), (111, 151), (103, 147, 111, 155, 107, 151)),  # right 0x6f stops x
])
def test_human_attack_updates_the_view(hooks, view, frm, to, after):
    """ovl36:0522 0718..08a2 with the leader's old square (vx, vy) (ovl36:0178..0186, pushed
    at 027b): not strictly inside -> recentre with max(0, v - 4) / min(v + 4, 0x70 / 0x9c);
    inside -> one square toward the target per axis, under centre / edge conditions."""
    st = mk_state()
    _view(st, *view)
    _attack(st, frm, to, hooks)
    assert _read_view(st) == after


def test_ai_battle_leaves_the_view(hooks):
    """124a passes -1L (1466): [bp-4] = 1 at 053c, 071c skips the view words."""
    st = ready(ai_state())
    _view(st, 0, 0)
    a = put(st, 1, AI, 8, 5)
    put(st, 2, 2, 9, 5)
    ready(st)
    hooks(st)
    select(st, a, a)
    script(st, WIN, cycle=True)
    combat.ai_battle(st, 9, 5)
    assert _read_view(st) == (0, 0, 8, 8, 4, 4)


# ----------------------------------------------------------------------------- human fuzz


def _fuzz_state(rnd):
    st = mk_state(flyer_types())
    for _ in range(40):
        set_terrain(st, rnd.randrange(4, 24), rnd.randrange(4, 24),
                    rnd.choice((Terrain.WATER, Terrain.WATER, Terrain.SHORE, Terrain.FOREST,
                                Terrain.HILLS, Terrain.MOUNTAINS)))
    for _ in range(rnd.randrange(2, 5)):
        x, y = rnd.randrange(8, 20), rnd.randrange(8, 20)
        for _ in range(rnd.randrange(1, 4)):
            put(st, rnd.choice((1, 1, 2, FLYER, HERO_TYPE)), 0, x, y, moves=rnd.randrange(0, 40))
        for _ in range(rnd.randrange(0, 3)):
            put(st, 2, 1, x + rnd.choice((-2, -1, 1, 2)), y + rnd.choice((-2, -1, 1, 2)),
                strength=rnd.randrange(1, 6))
    return ready(st)


def _hash_without_words(st):
    """The state hash with the five stored words zeroed: a word nobody reads may differ (DS:5e00
    of a single army is not lowered by 07f9), which is not behaviour."""
    cp = st.copy()
    s = cp.selection
    s.count = s.moves = s.group = s.mode = s.mask = 0
    return cp.hash()


def _fuzz_run(seed, fresh, monkeypatch):
    """Random human Move / Attack commands on one state; `fresh` re-stores the words at every
    command (what recomputing them from the live armies would read).  Returns per command
    (command, events, state hash without the words)."""
    rnd = random.Random(seed)
    st = _fuzz_state(rnd)
    h = Hooks(st)
    monkeypatch.setattr(combat, "_hook", h.get)
    if fresh:
        orig = M.adopt_selection

        def always(state, ids):
            changed = orig(state, ids)
            M.store_selection_words(state)
            return changed
        monkeypatch.setattr(M, "adopt_selection", always)
        monkeypatch.setattr(combat, "adopt_selection", always)
    out = []
    last = None
    for _ in range(30):
        mine = [a for a in st.armies if a.owner == 0 and a.x >= 0]
        if not mine:
            break
        if last is not None and rnd.random() < 0.7 and all(
                st.armies[i].owner == 0 and st.armies[i].x >= 0 for i in last) and \
                len({(st.armies[i].x, st.armies[i].y) for i in last}) == 1:
            group = last                                  # the same stack again: no new 0529
        else:
            a = rnd.choice(mine)
            here = [b.id for b in mine if (b.x, b.y) == (a.x, a.y)]
            group = tuple(rnd.sample(here, rnd.randrange(1, len(here) + 1)))
        lead = st.armies[group[0]]
        foes = [(b.x, b.y) for b in st.armies if b.owner == 1 and b.x >= 0
                and max(abs(b.x - lead.x), abs(b.y - lead.y)) == 1]
        if foes and rnd.random() < 0.7:
            cmd = C.Attack(group, *rnd.choice(foes))
        elif rnd.random() < 0.15:
            cmd = C.Attack(group, min(max(lead.x + rnd.choice((-1, 0, 1)), 0), 111),
                           min(max(lead.y + rnd.choice((-1, 0, 1)), 0), 155))
        else:
            cmd = C.Move(group, (min(max(lead.x + rnd.randrange(-6, 7), 0), 111),
                                 min(max(lead.y + rnd.randrange(-6, 7), 0), 155)))
        try:
            ev = engine.apply(st, cmd)
        except engine.IllegalCommand as e:
            ev = ["refused %s" % e]
        st.pending = None
        out.append((repr(cmd), repr(ev), _hash_without_words(st)))
        last = group
    return out


@pytest.mark.parametrize("seed", range(40))
def test_human_paths_unchanged_where_the_words_cannot_go_stale(seed, monkeypatch):
    """Without a flight item taken between selection and command, every stored word a human
    Move / Attack reads equals what 0529 would compute now, so storing them changes nothing:
    the same events and state hashes as re-storing them at every command."""
    a = _fuzz_run(seed, False, monkeypatch)
    monkeypatch.undo()
    b = _fuzz_run(seed, True, monkeypatch)
    assert a == b
