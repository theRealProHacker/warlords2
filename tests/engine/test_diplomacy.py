"""rules.diplomacy: proposals ovl00:0a69, marks ovl00:0cc7, resolution ovl00:0db3, the
refused-proposal infamy ovl00:1063, treachery ovl36:20a8 and the rating ovl00:0aed (EL §6.6).

States are built in memory (test_bonuses.mk_state); dice are scripted so each roll and its
arguments are checked against the listing."""
import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import Control, Relation
from warlords2.model import serialize
from warlords2.rules import city as CT, combat, diplomacy as D, engine, heroes as H
from warlords2.rules.constants import turn as KT
from warlords2.rules.engine import IllegalCommand

from test_bonuses import army, city, mk_state, put

P, N, W = Relation.PEACE, Relation.NEUTRAL, Relation.WAR


class Dice:
    def __init__(self, *values):
        self.values, self.calls = list(values), []

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.values.pop(0)


def rel(st, a, b, cur, prop):
    st.relations[a][b] = (st.relations[a][b] & 0xF0) | (prop << 2) | cur


def state(**opts):
    st = mk_state(diplomacy=1, **opts)
    st.relations = [[0] * 8 for _ in range(8)]
    return st


# ----------------------------------------------------------------------------- proposals


def test_propose_writes_only_the_proposal_bits():
    """ovl00:0a69: proposal bits of [0x110][b] = relation (and 0xf3, shl 2, or); current state
    and the high bits stay."""
    st = state()
    st.relations[0][3] = 0xC1
    assert engine.apply(st, C.Propose(3, W)) == []
    assert st.relations[0][3] == 0xC1 | (2 << 2)
    assert D.current(st, 0, 3) == N and D.proposal(st, 0, 3) == W


@pytest.mark.parametrize("cmd", [C.Propose(0, W), C.Propose(8, W), C.Propose(-1, P), C.Propose(2, 3)])
def test_propose_refused(cmd):
    st = state()
    with pytest.raises(IllegalCommand):
        engine.apply(st, cmd)


def test_propose_needs_diplomacy():
    """The dialog opens only with SCN 0x11c set (ovl00:0346)."""
    st = mk_state()
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Propose(1, P))


# ----------------------------------------------------------------------------- marks


@pytest.mark.parametrize("others,bits", [
    ({}, 0),
    ({1: (W, P)}, 0x30),                 # one peace offer: pending + friendly
    ({1: (P, W)}, 0x10),                 # a war threat: pending only
    ({1: (W, P), 2: (N, W)}, 0x10),      # mixed: pending only
    ({1: (W, N), 2: (N, P)}, 0x30),
])
def test_marks_on_the_diagonal(others, bits):
    """ovl00:0cc7: bytes [b][p]: proposal < current -> friendly, > -> hostile; bit 4 = either,
    bit 5 = friendly and not hostile; the old bits 4 / 5 are cleared, the rest kept."""
    st = state()
    st.relations[0][0] = 0x31 | 0x40
    for b, (cur, prop) in others.items():
        rel(st, b, 0, cur, prop)
    rel(st, 0, 5, W, P)                  # p's own proposals do not count
    D.mark_proposals(st)
    assert st.relations[0][0] == 0x41 | bits


# ----------------------------------------------------------------------------- resolution


def test_more_hostile_proposal_applies_at_once_both_ways():
    """ovl00:0e2b..0ee9: current(a, b) < proposal -> both currents = proposal; b's proposal to a
    raised to it when lower; war -> news kind 9 (ovl00:0f15)."""
    st = state()
    rel(st, 0, 1, P, W)
    rel(st, 1, 0, P, P)
    ev = D.resolve(st, 0)
    assert (D.current(st, 0, 1), D.current(st, 1, 0), D.proposal(st, 1, 0)) == (W, W, W)
    assert [type(e) for e in ev] == [E.RelationChanged]
    assert st.news[0] == [[9, 0, 1, ""]]


def test_hostile_proposal_raises_a_lower_one_only():
    """ovl00:0eb9: b's own proposal is kept when it is already at least as hostile."""
    st = state()
    rel(st, 0, 1, P, N)
    rel(st, 1, 0, P, W)
    D.resolve(st, 0)
    assert (D.current(st, 0, 1), D.current(st, 1, 0), D.proposal(st, 1, 0)) == (N, N, W)
    assert st.news[0] == []                       # neutral reached: no news


@pytest.mark.parametrize("theirs,agreed", [(P, True), (N, False), (W, False)])
def test_peace_needs_the_other_sides_agreement(theirs, agreed):
    """ovl00:0f70..0fa5: current > proposal -> applied only when proposal(b, a) <= proposal(a,
    b); peace -> news kind 10 (ovl00:1027)."""
    st = state()
    rel(st, 0, 1, W, P)
    rel(st, 1, 0, W, theirs)
    ev = D.resolve(st, 0)
    assert (D.current(st, 0, 1), D.current(st, 1, 0)) == ((P, P) if agreed else (W, W))
    assert (st.news[0] == [[10, 0, 1, ""]]) == agreed
    assert len(ev) == agreed


def test_neutral_from_war_when_the_other_offers_peace():
    st = state()
    rel(st, 0, 1, W, N)
    rel(st, 1, 0, W, P)
    D.resolve(st, 0)
    assert (D.current(st, 0, 1), D.current(st, 1, 0)) == (N, N) and st.news[0] == []


def test_more_hostile_proposal_wins_whoever_resolves():
    """MAN p.47 "the more hostile of the two proposals takes effect": a proposes peace, b war;
    a's turn changes nothing (b disagrees), b's turn makes war."""
    st = state()
    rel(st, 0, 1, N, P)
    rel(st, 1, 0, N, W)
    D.resolve(st, 0)
    assert D.current(st, 0, 1) == N
    st.current = 1
    D.resolve(st, 1)
    assert (D.current(st, 0, 1), D.current(st, 1, 0), D.proposal(st, 0, 1)) == (W, W, W)


@pytest.mark.parametrize("control,viewed,shown", [(Control.COMPUTER, 1, True), (Control.COMPUTER, 0, False),
                                                  (Control.HUMAN, 1, False)])
def test_resolution_message_only_on_a_viewed_computer_turn(control, viewed, shown):
    """ovl00:0f1d..0f6a: SCN 0x159 and ovl25:09ab (side on turn is a computer) -> STRING
    (111, 1) "war" with b's name; peace (111, 0)."""
    st = state()
    st.current = 2
    st.players[2].control = control
    st.flags[KT.SCN_VIEWED.value] = viewed
    rel(st, 2, 1, P, W)
    rel(st, 2, 3, W, P)
    rel(st, 3, 2, W, P)
    msgs = [e for e in D.resolve(st, 2) if isinstance(e, E.Msg)]
    assert [(m.group, m.index, m.args) for m in msgs] == ([(111, 1, ("p1",)), (111, 0, ("p3",))] if shown else [])


# ----------------------------------------------------------------------------- penalty


@pytest.mark.parametrize("cur,mine,theirs,roll", [
    (N, P, N, ((1, 2, 0), 1)), (N, P, W, ((1, 2, 0), 1)),
    (W, P, N, ((1, 10, 0), 10)), (W, P, W, ((1, 10, 0), 10)),
    (W, N, W, ((1, 2, 0), 1)),
    (W, N, N, None),                     # the other is not more hostile than my proposal
    (W, N, P, None), (N, N, W, None),    # no de-escalation proposed
    (P, P, W, None),
])
def test_refused_deescalation_infamy(cur, mine, theirs, roll):
    """ovl00:1063: proposal(p, b) < current and < proposal(b, p): peace from neutral rnd(1,2,0)+1,
    peace from war rnd(1,10,0)+10, neutral from war rnd(1,2,0)+1; else no roll."""
    st = state()
    rel(st, 0, 4, cur, mine)
    rel(st, 4, 0, cur, theirs)
    st.players[0].infamy = 7
    st.rng = Dice(3)
    assert D.penalty(st) == []
    if roll is None:
        assert st.rng.calls == [] and st.players[0].infamy == 7
    else:
        assert st.rng.calls == [roll[0]] and st.players[0].infamy == 7 + 3 + roll[1]


def test_penalty_rolls_in_side_order():
    st = state()
    for b in (6, 2):
        rel(st, 0, b, W, P)
        rel(st, b, 0, W, W)
    rel(st, 0, 5, N, P)
    rel(st, 5, 0, N, W)
    st.rng = Dice(1, 2, 3)
    D.penalty(st)
    assert st.rng.calls == [(1, 10, 0), (1, 2, 0), (1, 10, 0)]     # b = 2, 5, 6
    assert st.players[0].infamy == (1 + 10) + (2 + 1) + (3 + 10)


# ----------------------------------------------------------------------------- treachery


def _prompted(st, target, attacker_xy):
    put(st, 2, 1, *target)
    a = put(st, 1, 0, *attacker_xy)
    ev = engine.apply(st, C.Attack((a,), *target))
    assert isinstance(st.pending, E.TreacheryPrompt) and ev == [st.pending]
    return a


@pytest.mark.parametrize("start,roll", [(P, ((1, 100, 0), 100)), (N, ((1, 15, 0), 10))])
def test_treachery_infamy_war_and_attack(monkeypatch, start, roll):
    """ovl36:20a8: peace rnd(1,100,0)+100, neutral rnd(1,15,0)+10 (a city target); both
    directions current and proposal war; a human side then attacks (ovl36:0000 again); news
    kind 8 (p, 8, p, o)."""
    st = state()
    city(st, 30, 30, 2, 1)
    ci = city(st, 10, 10, 1, 1)
    rel(st, 0, 1, start, start)
    rel(st, 1, 0, start, P)
    a = _prompted(st, (10, 10), (9, 10))
    attacks = []
    real = combat.attack

    def spy(state, cmd):
        attacks.append((cmd, D.current(state, 0, 1)))
        return []
    monkeypatch.setattr(combat, "attack", spy)
    st.rng = Dice(5)
    ev = engine.apply(st, C.ConfirmTreachery(True))
    monkeypatch.setattr(combat, "attack", real)
    assert st.rng.calls == [roll[0]] and st.players[0].infamy == 5 + roll[1]
    assert [(D.current(st, x, y), D.proposal(st, x, y)) for x, y in ((0, 1), (1, 0))] == [(W, W)] * 2
    assert attacks == [(C.Attack((a,), 10, 10), W)]
    assert isinstance(ev[0], E.Treachery) and ev[0].info["infamy"] == 5 + roll[1]
    assert st.news[0] == [[8, 0, 1, ""]] and st.pending is None and ci == 1


def test_treachery_then_the_real_battle(monkeypatch):
    """The re-made attack is a normal battle now that the sides are at war."""
    st = state()
    rel(st, 0, 1, P, P)
    _prompted(st, (5, 5), (4, 5))
    monkeypatch.setattr(combat, "_hook", lambda name: (lambda *a: (0, []) if name == "quest_check"
                                                        else None if name == "ai_memory" else []))
    ev = engine.apply(st, C.ConfirmTreachery(True))
    assert any(isinstance(e, E.BattleEnded) for e in ev)
    assert isinstance(ev[0], E.Treachery) and D.current(st, 0, 1) == W


@pytest.mark.parametrize("roundtrip", [False, True])
def test_treachery_news_comes_after_the_capture_answer(monkeypatch, roundtrip):
    """ovl36:21e5 runs ovl36:0000(x, y) again; its capture dialog (ovl31:0000) is modal there,
    so a quest entry written by the answer (ovl01:1ded -> news kind 2, rules.quests) precedes
    the kind-8 entry of ovl36:2257.  The entry waits in the pending CityCaptured, also across a
    save (rules.model.serialize)."""
    st = state()
    city(st, 30, 30, 2, 1)
    ci = city(st, 10, 10, 1, 1)
    _prompted(st, (10, 10), (9, 10))
    real = combat._hook
    monkeypatch.setattr(combat, "_hook", lambda n: (lambda *a: (0, [])) if n == "quest_check"
                        else (lambda *a: None) if n == "ai_memory" else real(n))
    engine.apply(st, C.ConfirmTreachery(True))
    assert isinstance(st.pending, E.CityCaptured) and st.pending.info["city"] == ci
    assert st.news[0] == []
    if roundtrip:
        st = serialize.load(serialize.dump(st), rng=st.rng)

    def quest_done(state, words):           # stand-in for the done entry of ovl01:1ded
        H.news(state, state.current, 2, 0, 0, "hero")
        return 1, []
    real_city = CT._hook
    monkeypatch.setattr(CT, "_hook", lambda n: quest_done if n == "quest_event" else real_city(n))
    engine.apply(st, C.CaptureChoice("occupy"))
    assert st.news[0] == [[2, 0, 0, "hero"], [8, 0, 1, ""]] and st.pending is None


def test_treachery_declined_changes_nothing():
    """ovl36:2262: redraw only (no roll, no relation, the stack stays)."""
    st = state()
    rel(st, 0, 1, P, P)
    a = _prompted(st, (5, 5), (4, 5))
    st.rng = Dice()
    before = (army(st, a).x, army(st, a).moves_left, [r[:] for r in st.relations], st.players[0].infamy)
    assert engine.apply(st, C.ConfirmTreachery(False)) == []
    assert st.pending is None and st.news[0] == []
    assert (army(st, a).x, army(st, a).moves_left, st.relations, st.players[0].infamy) == before


def test_computer_treachery_shows_the_message_and_does_not_attack(monkeypatch):
    """ovl25:09ab true (computer): no attack call; with SCN 0x159 STRING (111, 2) with the
    victim's name; neutral owner square -> nothing at all (ovl36:20ca)."""
    st = state()
    st.current = 3
    st.players[3].control = Control.COMPUTER
    st.flags[KT.SCN_VIEWED.value] = 1
    put(st, 2, 1, 5, 5)
    monkeypatch.setattr(combat, "attack", lambda *a: pytest.fail("attacked"))
    st.rng = Dice(1)
    ev = D.treachery(st, 5, 5)
    assert [(m.group, m.index, m.args) for m in ev if isinstance(m, E.Msg)] == [(111, 2, ("p1",))]
    assert st.players[3].infamy == 101 and st.news[3] == [[8, 3, 1, ""]]
    assert D.treachery(st, 50, 50) == [] and st.rng.calls == [(1, 100, 0)]


def test_treachery_at_war_rolls_nothing():
    st = state()
    put(st, 2, 1, 5, 5)
    rel(st, 0, 1, W, W)
    st.rng = Dice()
    st.players[0].control = Control.COMPUTER
    D.treachery(st, 5, 5)
    assert st.players[0].infamy == 0 and st.news[0] == [[8, 0, 1, ""]]


# ----------------------------------------------------------------------------- rating


@pytest.mark.parametrize("n,titles", [(1, [0]), (2, [0, 7]), (3, [0, 3, 7]), (4, [0, 1, 5, 7]),
                                      (5, [0, 1, 3, 5, 7]), (6, [0, 1, 3, 5, 6, 7]),
                                      (7, [0, 1, 3, 4, 5, 6, 7]), (8, list(range(8)))])
def test_rating_ladder(n, titles):
    """ovl00:0aed: live sides sorted by infamy ascending (stable), titles from the jump table
    ovl00:0cb7 by the number of live sides (R10b)."""
    st = state()
    for p in st.players:
        p.alive = int(p.index < n)
        p.infamy = 50 - p.index * 3
    r = D.rating(st)
    assert [s for s, _ in r] == list(range(n - 1, -1, -1))
    assert [t for _, t in r] == titles


def test_rating_ties_keep_side_order_and_skip_the_dead():
    st = state()
    infamy = [5, 5, 1, 9, 5, 0, 0, 0]
    for p in st.players:
        p.infamy = infamy[p.index]
    st.players[2].alive = st.players[6].alive = 0
    assert D.rating(st) == [(5, 0), (7, 1), (0, 3), (1, 5), (4, 6), (3, 7)]


def test_rating_sorts_infamy_signed():
    """ovl00:0aed compares the words 2c04:10e3 with a signed jge (0b92..0b97): a negative
    infamy ranks before 0."""
    st = state()
    infamy = [3, -5, 0, 0x7FFF, -0x8000, 1, 0, 0]
    for p in st.players:
        p.infamy = infamy[p.index]
        p.alive = int(p.index < 6)
    assert [s for s, _ in D.rating(st)] == [4, 1, 2, 5, 0, 3]
