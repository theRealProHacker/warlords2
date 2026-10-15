"""ovl21:084d / 0d7b and ovl25:0519 (ai.md §4.1, EL §6.8) as warlords2.ai.cards: the blocks at
Begin, the card unpacking, the dice in the setup stream, and the draws of a load before any
Begin (ai.md §3.4)."""
import dataclasses
import struct

import pytest

from warlords2.ai import cards as AC
from warlords2.formats.gamedir import GameDir
from warlords2.model.ai import AiBlock, AiProcess
from warlords2.model.ids import Control
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load
from warlords2.rules import setup as S
from warlords2.rules.rng import Rng

from movekit import _inputs, scenario_state

pytestmark = pytest.mark.gamedata
COMP, HUMAN = Control.COMPUTER, Control.HUMAN


class Rec:
    """Delegating die roller that records every rnd(dice, sides, add)."""

    def __init__(self, rng):
        self.rng, self.calls = rng, []

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.rng.rnd(d, s, a)

    def state(self):
        return self.rng.state()


def card(**words):
    """A 103-byte card with the given little-endian words (key = 'w%02x' % offset)."""
    b = bytearray(AC.CARD_SIZE)
    for k, v in words.items():
        struct.pack_into("<h", b, int(k[1:], 16), v)
    b[AC.FIGHT_ORDER_OFF:AC.FIGHT_ORDER_OFF + AC.FIGHT_ORDER_LEN] = bytes(range(28, -1, -1))
    return bytes(b)


CARD = card(w08=3, w0a=0, w2b=7, w2d=11, w2f=12, w31=40, w45=101, w47=102, w49=103, w4b=104,
            w4d=105, w4f=106, w51=107, w53=108, w55=6, w57=7, w59=8, w5b=9, w5f=109, w61=1,
            w63=5, w65=1)


def cards_seen(log):
    def read(level, number):
        log.append((level, number))
        return CARD
    return read


def test_personality_from_level_and_control(game):
    """ovl21:0935..096a: computer at level 0 / 1 -> that level; level 2 and every human -> 2."""
    st = scenario_state(game, "ERYTHEA")
    for ctl, lvl, want in ((COMP, 0, 0), (COMP, 1, 1), (COMP, 2, 2), (HUMAN, 0, 2), (HUMAN, 2, 2)):
        st.players[3].control, st.players[3].level = ctl, lvl
        assert AC.personality(st, 3) == want


@pytest.mark.parametrize("pers,draws,fields", [
    (0, [(1, 4, 0)] * 3, dict(rebuild_quota=30, no_quick_attack=1, n_task_forces=1, solidarity=0,
                              buy_low=3, buy_high=3, leader_share=80, flags=0, enemy_bonus_l0=0)),
    (1, [(1, 4, 0), (1, 4, 0), (1, 8, 0)],
     dict(rebuild_quota=20, no_quick_attack=0, n_task_forces=2, buy_low=6, buy_high=18, tf_odds_1=5,
          tf_odds_2=10, tf_odds_4=20, tf_city_mult=1, tf_bonus_human=5, leader_share=35, flags=1,
          enemy_bonus_l2=None)),
    (2, [(1, 10, 0), (1, 8, 0), (1, 6, 0)],
     dict(rebuild_quota=10, n_task_forces=4, solidarity=1, flags=1, buy_low=7, buy_high=0,
          tf_city_mult=5, tf_bonus_human=50, tf_bonus_poor=50, plunder_early=1, leader_share=35,
          enemy_bonus_l2=0)),
])
def test_defaults_per_personality(game, pers, draws, fields):
    """0da0 / 0e4d / 0ef5: the constants and the three draws of each personality, in order; a
    human (no card) stops there (0fad / 0fc1)."""
    st = scenario_state(game, "ERYTHEA", cards=False)
    st.players[2].control = HUMAN
    st.rng = Rec(st.rng)
    AC.apply_card(st, 2, pers, cards_seen(log := []))
    assert st.rng.calls == draws and log == []
    b = st.ai[2]
    for k, v in fields.items():
        if v is not None:
            assert getattr(b, k) == v, k
    first = {0: ("enemy_bonus_human", "enemy_bonus_l2", "enemy_bonus_l1"),
             1: ("enemy_bonus_human", "enemy_bonus_l2", "enemy_bonus_l0"),
             2: ("enemy_bonus_human", "enemy_bonus_l1", "enemy_bonus_l0")}[pers]
    assert all(1 <= getattr(b, f) <= s for f, (_, s, _) in zip(first, draws))


def test_card_overrides_and_draw_order(game):
    """0fda..10ef for a live computer side: dice +0x55, +0x59, +0x57, +0x5b (-> +0x18, +0x1a,
    +0x1c, +0x1e) after the three defaults, then rnd(1,10,0) for +0x44 = word +0x63 * 10 + r;
    word copies; +0x0c keeps the default bit 0 (an OR) when card word +0x0a is 0; fight order
    card +0x0e.. -> SCN 0x60b + 29p."""
    st = scenario_state(game, "ERYTHEA")
    p = 4
    st.players[p].control, st.players[p].level, st.players[p].card, st.players[p].alive = COMP, 1, 7, 1
    st.rng = Rec(st.rng)
    AC.apply_card(st, p, 1, cards_seen(log := []))
    assert log == [(1, 7)]
    assert st.rng.calls == [(1, 4, 0), (1, 4, 0), (1, 8, 0), (1, 6, 0), (1, 8, 0), (1, 7, 0), (1, 9, 0),
                            (1, 10, 0)]
    b = st.ai[p]
    assert (b.n_task_forces, b.solidarity, b.no_quick_attack, b.buy_low, b.buy_high, b.rebuild_quota) == (
        3, 1, 7, 11, 12, 40)
    assert (b.tf_odds_1, b.tf_odds_2, b.tf_odds_4, b.tf_city_mult, b.tf_bonus_human) == (101, 102, 103, 104, 105)
    assert (b.tf_bonus_l0, b.tf_bonus_l1, b.tf_bonus_l2) == (106, 107, 108)    # +0x34, +0x32, +0x30
    assert (b.tf_bonus_poor, b.plunder_early) == (109, 1)
    assert b.flags == 1                                                         # OR, default kept
    assert 51 <= b.leader_share <= 60
    assert 1 <= b.enemy_bonus_human <= 6 and 1 <= b.enemy_bonus_l1 <= 8
    assert 1 <= b.enemy_bonus_l0 <= 7 and 1 <= b.enemy_bonus_l2 <= 9
    assert st.fight_order[p] == list(range(28, -1, -1))


def test_card_flag_word_sets_bit0_for_personality_0(game):
    """1045..104b: word +0x0a != 0 -> +0x0c |= 1 (personality 0 has no default bit)."""
    st = scenario_state(game, "ERYTHEA")
    st.players[4].control, st.players[4].level, st.players[4].alive = COMP, 0, 1
    AC.apply_card(st, 4, 0, lambda lv, n: card(w0a=1, w55=1, w57=1, w59=1, w5b=1))
    assert st.ai[4].flags == 1
    AC.apply_card(st, 4, 0, lambda lv, n: card(w55=1, w57=1, w59=1, w5b=1))
    assert st.ai[4].flags == 1                     # 084d zeroes +0x0c, 0d7b alone only ORs


def test_dead_side_reads_no_card(game):
    """0fad: SCN 0x137[p] == 0 -> no card even for a computer side."""
    st = scenario_state(game, "ERYTHEA")
    st.players[5].alive, st.players[5].control = 0, COMP
    st.rng = Rec(st.rng)
    AC.apply_card(st, 5, 0, cards_seen(log := []))
    assert log == [] and len(st.rng.calls) == 3


def test_init_block_resets_and_city_bytes(game):
    """084d: the zeroed words, +0x20 = 10, role 4 with Quick Start, unseen bit with Hidden Map,
    for the cities count-1..0 only; task-force ages and all seven memory rows cleared."""
    st = scenario_state(game, "TUTORIA", options=GameOptions(quick_start=1, hidden_map=1))
    b = st.ai[1]
    b.quest_battles = b.turns_with_cities = b.explorers = b.slots_bought = 9
    b.role[len(st.cities)] = 77
    b.task_forces[2].age = 5
    b.memory[6][3] = 4
    b.own_cities = 12                              # +0x02 is not written by 084d
    AC.init_block(st, 1, lambda lv, n: CARD)
    n = len(st.cities)
    assert b.role[:n] == [4] * n and b.city_flags[:n] == [1] * n and b.age[:n] == [0] * n
    assert b.role[n] == 77 and b.own_cities == 12
    assert (b.quest_battles, b.turns_with_cities, b.explorers, b.slots_bought, b.simulations) == (0, 0, 0, 0, 10)
    assert b.task_forces[2].age == 0 and b.memory[6][3] == 0


def _new(game, name, **kw):
    sc, at, base = _inputs(game, name)
    cfg = scenario_cfg(name)
    return S.new_game(sc, cfg, list(at), **base, **kw)


def scenario_cfg(name, seed=5):
    from warlords2.model.newgame import NewGameConfig
    return NewGameConfig(name, (HUMAN,) + (COMP,) * 7, (0, 1, 2, 0, 1, 2, 0, 1), tuple(range(8)),
                         (0,) * 8, None, GameOptions(random_turns=1), 0, seed)


def test_begin_draws_in_the_setup_stream(game, monkeypatch):
    """ovl57:0cfe: ovl25:0519 runs after the options are copied and before the turn order
    (ovl61:1732): with cards the stream is the card-less one with, after the loader's and the
    setup screen's rolls, per side 7..0 three default draws and, for each live computer side,
    five card draws inserted; sides read their own card (level, number)."""
    calls = []

    class RecRng(Rng):
        def rnd(self, d, s, a):
            calls.append((d, s, a))
            return super().rnd(d, s, a)

    monkeypatch.setattr(S, "Rng", RecRng)
    base = _new(game, "ERYTHEA")
    plain = list(calls)
    calls.clear()
    log = []
    st = _new(game, "ERYTHEA", cards=cards_seen(log))
    loader = 256
    ai = []
    want_reads = []
    for p in range(7, -1, -1):
        pl = st.players[p]
        pers = AC.personality(st, p)
        ai += {0: [(1, 4, 0)] * 3, 1: [(1, 4, 0), (1, 4, 0), (1, 8, 0)],
               2: [(1, 10, 0), (1, 8, 0), (1, 6, 0)]}[pers]
        if pl.alive and pl.control == COMP:
            ai += [(1, 6, 0), (1, 8, 0), (1, 7, 0), (1, 9, 0), (1, 10, 0)]
            want_reads.append((pl.level, pl.card))
    assert calls[:loader] == plain[:loader]
    assert calls[loader:loader + len(ai)] == ai
    assert calls[loader + len(ai):loader + len(ai) + 40] == [(1, 8, -1)] * 40      # ovl61:1732 swaps
    assert log == want_reads
    assert st.ai.allocated == 1 and base.ai.allocated == 0
    for p in range(8):
        card_side = st.players[p].alive and st.players[p].control == COMP
        assert (st.fight_order[p] == list(range(28, -1, -1))) == card_side
        assert (st.fight_order[p] == base.fight_order[p]) == (not card_side)


def test_card_reader_reads_the_game_files(game):
    """ovl57:21c1 name CARDS\\<KLW[level]><nnn>.CRD from DS:2616 / 261a / 262a."""
    gd = GameDir(game)
    from warlords2.formats.gamedir import EXE_NAME
    exe = gd.read(EXE_NAME)
    assert AC.card_name(exe, 0, 0) == "CARDS\\K000.CRD"
    assert AC.card_name(exe, 2, 5) == "CARDS\\W005.CRD"
    data = AC.card_reader(gd)(1, 2)
    assert len(data) == AC.CARD_SIZE and data == gd.read("CARDS/L002.CRD")


def test_load_before_begin_draws_and_keeps_saved_blocks(game):
    """ovl29:0da9 with DS:0832 == 0: 04c5(1) -> 0519 draws as at Begin on the loaded SCN, the
    saved blocks then overwrite the blocks; the fight orders stay the cards'.  A later load in
    the same run draws nothing."""
    st = _new(game, "ERYTHEA", cards=lambda lv, n: CARD)
    st.ai[3].own_cities = 17
    st.ai[3].role[5] = 6
    st.fight_order[3] = [0] * 29
    saved = dump(st)
    a, b = load(saved), load(saved)
    b.rng = Rec(b.rng)
    AC.setup_all(b, lambda lv, n: CARD)
    want = b.rng.calls
    a.rng = Rec(a.rng)
    AC.load_draws(a, lambda lv, n: CARD, run_allocated=False)
    assert a.rng.calls == want and len(want) > 24
    assert a.ai[3].own_cities == 17 and a.ai[3].role[5] == 6
    assert a.fight_order[3] == list(range(28, -1, -1))
    c = load(saved)
    c.rng = Rec(c.rng)
    AC.load_draws(c, lambda lv, n: CARD, run_allocated=True)
    assert c.rng.calls == [] and c.fight_order[3] == [0] * 29 and c.ai.allocated == 1
    # through the run's process object: a fresh one draws and leaves DS:40ee on block 0; the
    # process of a run that played already draws nothing and keeps its DS:40ee / DS:40f2
    d = load(saved)
    d.rng = Rec(d.rng)
    AC.load_draws(d, lambda lv, n: CARD, AiProcess())
    assert d.rng.calls == want and d.ai.locked == 0 and d.ai.proc.blocks is d.ai.blocks
    e = load(saved)
    e.rng = Rec(e.rng)
    run = st.ai.proc
    run.locked, run.solidarity[2] = 5, 1
    AC.load_draws(e, lambda lv, n: CARD, run)
    assert e.rng.calls == [] and e.ai.proc is run and e.ai.locked == 5 and e.ai.solidarity[2] == 1
    assert e.ai[3].own_cities == 17 and run.blocks is e.ai.blocks


def test_ai_state_round_trips(game):
    """model/serialize FORMAT 9: blocks (task forces, memory), neighbour table; the process
    words (DS:0832 / 0836 / 40f2 / 40ee, the raze result) are not saved: a load has fresh ones."""
    st = _new(game, "TUTORIA", cards=lambda lv, n: CARD)
    st.ai[2].task_forces[1].targets[3] = 9
    st.ai[2].task_forces[1].w52[2] = -3
    st.ai[0].memory[6][7] = 5
    st.ai.solidarity[4], st.ai.raze_target, st.ai.turn_active = 1, 12, 0
    back = load(dump(st))
    assert back.ai == st.ai and dataclasses.asdict(back.ai[2]) == dataclasses.asdict(st.ai[2])
    assert isinstance(back.ai[2], AiBlock) and dump(back) == dump(st)
    assert (back.ai.allocated, back.ai.solidarity, back.ai.raze_target) == (0, [0] * 8, -1)
    assert back.hash() == st.hash()
