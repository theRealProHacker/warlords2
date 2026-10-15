"""Present points (rules.present): where the engine stops for the computer phase's drawing, in
the order of the EXE's draws and waits, and the state writes that go with them (the view
words of a computer walk, ovl64:0565 -> 0629; ovl65:0227 of the AI's battle).  Without a
presenter `present` does nothing (every other test runs that way)."""
import threading

import pytest

from warlords2.ai import base as B
from warlords2.model.ids import MAP_W, Control
from warlords2.model.options import GameOptions
from warlords2.rules import combat
from warlords2.rules import movement as M
from warlords2.rules import present as PR
from warlords2.rules import turn as T
from warlords2.rules.constants import turn as KT

from movekit import scenario_state
from test_ai_base import phases  # noqa: F401 (fixture)
from test_bonuses import put
from test_move_executor import AI, ai_state, corridor, hooks, ready, select  # noqa: F401 (fixture)

BARS = [10, 15, 20, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]


@pytest.fixture
def points():
    got = []
    me = threading.current_thread()
    PR.attach(me, lambda name, info: got.append((name, dict(info))))
    yield got
    PR.detach(me)


def test_present_without_presenter_is_a_no_op():
    assert PR.present("bar", n=10) is None


def test_presenter_of_another_thread_is_not_called(points):
    out = []
    t = threading.Thread(target=lambda: out.append(PR.present("bar", n=5)))
    t.start()
    t.join()
    assert out == [None] and points == []


@pytest.mark.gamedata
@pytest.mark.parametrize("hidden", [0, 1])
def test_computer_turn_bar_points_in_ovl25_order(game, phases, points, hidden):  # noqa: F811
    """ovl25:0000: the strip 0952 (0064), 131b(10) before Diplomacy (00c7), then 15..95 after
    the phases (none after Diplomacy, quick attack, update hide; 20 after move Search also
    without Hidden Map), 100 after 0a4c:0348 (034e), the keyboard ovl25:045e (0380) after the
    penalty."""
    st = scenario_state(game, "ERYTHEA", seed=3, options=GameOptions(hidden_map=hidden))
    st.current = 3
    st.ai.allocated = 1
    B.computer_turn(st)
    names = [n for n, _ in points]
    assert names[0] == "strip" and names[-1] == "keys"
    assert [i["n"] for n, i in points if n == "bar"] == BARS
    # the bar after a phase comes after that phase's work (the recorder logs its rnd)
    assert names.count("bar") == 18


@pytest.mark.gamedata
def test_cityless_side_points(game, points):
    """ovl68:0000: the announcement points, then (after ovl00:0db3) the bar of a side without
    cities (0168..0192); DS:3254 written at 0074."""
    st = scenario_state(game, "ERYTHEA", seed=3, options=GameOptions(hidden_map=1))
    p = 3
    st.current = p
    for c in st.cities:
        if c.owner == p:
            c.owner = 0
    T.computer_turn(st)
    assert [n for n, _ in points] == ["turn_start", "no_cities"]
    humans = sum(1 for q in st.players if q.alive and q.control == Control.HUMAN)
    assert st.ai.proc.single_view == int(humans == 1)


def test_computer_walk_writes_the_view_words_per_step(hooks, points):  # noqa: F811
    """0a8b:04c8 (05f2): ovl64:0565 -> 0629 after every step of a computer stack: the view
    centre follows DS:5e62, clamped to 4..0x6b / 4..0x97, and the map is drawn ("step")."""
    st = ai_state()
    corridor(st, 2, 1, 12)
    a = put(st, 1, AI, 2, 2, moves=40)
    ready(st)
    hooks(st)
    select(st, a, a)
    M.walk_selection(st, 9, 2)
    steps = [i for n, i in points if n == "step"]
    assert [(i["x"], i["y"]) for i in steps] == [(x, 2) for x in range(3, 10)]
    top, left, bottom, right, cx, cy = KT.SCN_VIEW.value
    assert (st.flags[cx], st.flags[cy]) == (9, 4)
    assert (st.flags[left], st.flags[top], st.flags[right], st.flags[bottom]) == (5, 0, 13, 8)


def test_human_walk_leaves_the_view_words_to_the_presentation(points):
    """A human walk gets the words from its SetView commands (ui.anim.move): the engine
    writes none and presents nothing."""
    st = ai_state()
    st.current = 0
    st.players[0].control = Control.HUMAN
    corridor(st, 2, 1, 12)
    a = put(st, 1, 0, 2, 2, moves=40)
    ready(st)
    select(st, a, a)
    before = {k: st.flags.get(k) for k in KT.SCN_VIEW.value}
    M.walk_selection(st, 9, 2)
    assert {k: st.flags.get(k) for k in KT.SCN_VIEW.value} == before
    assert points == []


@pytest.mark.gamedata
def test_battle_gates(game):
    """ovl36:124a 1281..13d5: show / show2 / view from SCN 0x159, the defender's control,
    DS:3254 with road bit 7, several humans with Hidden Map."""
    st = scenario_state(game, "ERYTHEA", seed=3)
    x, y = 10, 10
    i = y * MAP_W + x

    def gates(owner, viewed, single=0, s=st):
        s.world.flags[i] = (s.world.flags[i] & 0xF0) | owner
        s.flags[KT.SCN_VIEWED.value] = viewed
        s.ai.proc.single_view = single
        return combat.ai_battle_gates(s, x, y)

    st.players[0].control = Control.HUMAN
    for p in range(1, 8):
        st.players[p].control = Control.COMPUTER
    assert gates(15, 1) == (True, False, False)          # a neutral defender: no window
    assert gates(15, 0) == (False, False, False)
    assert gates(3, 1) == (True, True, False)
    assert gates(3, 0) == (False, False, False)
    assert gates(0, 0) == (True, True, False)            # the human defender sees it
    st.world.roads[i] &= 0x7F
    assert gates(0, 0, single=1) == (False, False, False)        # DS:3254, square unseen
    st.world.roads[i] |= 0x80
    assert gates(0, 0, single=1) == (True, True, False)
    hm = st.copy()
    hm.options = GameOptions(hidden_map=1)
    hm.players[1].control = Control.HUMAN
    assert gates(15, 1, s=hm) == (False, False, True)            # several humans, Hidden Map
    assert gates(3, 0, s=hm) == (False, False, False)


# ----------------------------------------------------------------------------- engine writes


def _words(st):
    return tuple(st.flags.get(k) for k in KT.SCN_VIEW.value)


def _battle(hooks, viewed, owner_human=False):  # noqa: F811
    from test_combat import WIN, script
    st = ready(ai_state())
    a = put(st, 1, AI, 4, 5, moves=10)
    put(st, 2, 2, 5, 5)
    st.players[2].control = Control.HUMAN if owner_human else Control.COMPUTER
    hooks(st)
    select(st, a, a)
    script(st, WIN, cycle=True)
    st.flags[KT.SCN_VIEWED.value] = viewed
    T.centre_view(st, 50, 50)
    return st


@pytest.mark.parametrize("viewed", [0, 1])
def test_0227_at_1474_only_when_shown(hooks, points, viewed):  # noqa: F811
    """ovl36:1474: ovl65:0227(x, y) writes the view words (centre as given) only for `show`."""
    st = _battle(hooks, viewed)
    before = _words(st)
    combat.ai_battle(st, 5, 5)
    top, left, bottom, right, cx, cy = KT.SCN_VIEW.value
    if viewed:
        assert (st.flags[cx], st.flags[cy], st.flags[left], st.flags[top]) == (5, 5, 1, 1)
        assert [n for n, _ in points][:2] == ["battle_mark", "battle_before"]
    else:
        assert _words(st) == before and "battle_mark" not in [n for n, _ in points]


@pytest.mark.parametrize("viewed", [0, 1])
def test_0476_centres_on_the_stack_only_with_0x159(hooks, points, viewed):  # noqa: F811
    """0a8b:0481..0489: SCN 0x159 -> ovl64:0565 (the words on DS:5e62, clamped) before 124a."""
    st = _battle(hooks, viewed)
    seen = []
    me = threading.current_thread()
    PR.attach(me, lambda name, info: seen.append((name, info.get("at"), st.flags[0x17D], st.flags[0x17F])))
    M.attack_stack(st, 5, 5)
    pre = [s for s in seen if s[:2] == ("map", "0a8b:0565")]
    assert pre == ([("map", "0a8b:0565", 4, 5)] if viewed else [])


@pytest.mark.parametrize("viewed", [0, 1])
def test_0254_centres_before_and_after_with_0x159(hooks, points, viewed):  # noqa: F811
    """0a8b:0292 / 02b4: around the battle on a neutral city, SCN 0x159 -> ovl64:0565 before and
    (DS:5e62 set) after."""
    from test_combat import WIN, script
    from test_bonuses import city
    st = ai_state()
    c = city(st, 6, 4, 0x0F, 1)
    a = put(st, 1, AI, 5, 5, moves=10)
    ready(st)
    hooks(st)
    select(st, a, a)
    script(st, WIN, cycle=True)
    st.flags[KT.SCN_VIEWED.value] = viewed
    T.centre_view(st, 50, 50)
    M.attack_order_city(st, c, 6, 5, (6, 5))
    maps = [i["at"] for n, i in points if n == "map" and i["at"].startswith("0a8b")]
    assert maps == (["0a8b:0565", "0a8b:0565"] if viewed else [])
    if not viewed:
        assert (st.flags[0x17D], st.flags[0x17F]) == (50, 50)


@pytest.mark.gamedata
def test_human_turn_clears_ds_3254(game):
    """ovl68:0267: DS:3254 = 0 at every human turn start."""
    st = scenario_state(game, "ERYTHEA", seed=3)
    st.current = 0
    st.players[0].control = Control.HUMAN
    st.ai.proc.single_view = 1
    T.human_turn(st)
    assert st.ai.proc.single_view == 0


@pytest.mark.gamedata
@pytest.mark.parametrize("viewed,single,human,drawn", [(1, 0, 0, True), (0, 0, 0, False),
                                                       (1, 1, 0, False), (0, 1, 1, True)])
def test_sage_overview_point(game, monkeypatch, points, viewed, single, human, drawn):
    """ovl26:031a..0368: after the map view, (SCN 0x159 and not DS:3254) or a human side ->
    ovl63:2200 and ovl63:0000(1, 1, NULL)."""
    from warlords2.ai.phases import quick_attack as QA
    from warlords2.rules import ruins
    from test_ai_quick_attack import sage_state
    st, _, _ = sage_state(game, 1)
    monkeypatch.setattr(ruins, "map_view", lambda st_, x, y: [])
    st.rng.script = [700, 1, 1]
    st.flags[KT.SCN_VIEWED.value] = viewed
    st.ai.proc.single_view = single
    st.players[st.current].control = Control.HUMAN if human else Control.COMPUTER
    QA.sage(st, 3)
    assert (("overview", {"at": "ovl26:0360"}) in points) == drawn


def test_hero_allies_overview_point_is_not_forced(points):
    """ovl47:020a: ovl63:0000(1, 0, NULL) before the price is paid (markers, no force)."""
    from warlords2.rules import heroes as H
    st = ai_state()
    h = put(st, 1, AI, 10, 10)
    st.turn = 1
    H.pay_and_allies(st, h, 0)
    assert points[0] == ("overview", {"at": "ovl47:020a", "markers": 1, "force": 0})


@pytest.mark.gamedata
def test_city_lines_come_before_the_raze_and_the_sack(game, monkeypatch, points):
    """ovl19:18f4..1914 before ovl32:016b, 19ba..19da before ovl31:0941 and the gold,
    1a3f..1a5f before the gold and ovl31:0886: the line is drawn with the city as it was."""
    from warlords2.ai import base as BB
    from warlords2.ai.phases import assault as A
    from test_ai_assault import mk, slot_city
    st = mk(game)
    seen = []
    me = threading.current_thread()
    PR.attach(me, lambda name, info: seen.append(
        (name, info.get("fmt"), st.world.terrain(st.cities[info["city"]].x, st.cities[info["city"]].y),
         st.players[st.current].gold, [s.type & 0xFF for s in st.cities[info["city"]].slots]))
        if name == "city_line" else None)
    monkeypatch.setattr(BB, "after_raze", lambda s, ci: setattr(s.ai, "raze_target", -1))
    cheap, expensive = 11, 19
    c = slot_city(st, 20, 20, 0, [cheap, cheap])
    st.rng.script = [4]
    A.capture_choice(st, c, 1)
    assert seen[0][1] == A.RAZED_FMT and int(seen[0][2]) == 10           # still a City square
    c2 = slot_city(st, 60, 20, 0, [expensive] * 4)
    gold = st.players[0].gold
    st.rng.script = [1]
    A.capture_choice(st, c2, 1)
    assert seen[1][1] == A.SACKED_FMT and seen[1][3] == gold and seen[1][4] == [expensive] * 4
    c3 = slot_city(st, 80, 20, 0, [cheap])
    gold = st.players[0].gold
    st.rng.script = [2]
    A.pillage(st, c3)
    assert seen[2][1] == A.PILLAGED_FMT and seen[2][3] == gold and seen[2][4][0] == cheap
