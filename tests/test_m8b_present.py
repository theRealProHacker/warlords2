"""The engine gives the same results with or without a display: a run played by
`states.runner.Runner` (its own thread, paused at every present point) and by the game's
computer phase (which draws at the points) equals the plain run, state hash by state hash and
die roll by die roll."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

from collections import defaultdict  # noqa: E402

import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import Control  # noqa: E402
from warlords2.rules import rng as R  # noqa: E402
from warlords2.rules import turn as T  # noqa: E402
from warlords2.rules.engine import apply  # noqa: E402
from warlords2.states.runner import Runner  # noqa: E402

gamedata = pytest.mark.gamedata
ACCEPT = {"hero_offer": 287, "production": 192}
GAMES = [("ERYTHEA", "HCCCCCCC", "0,1,0,0,0,0,0,0,0,0", 3),
         ("ERYTHEA", "HCCCCCCC", "1,1,0,1,0,0,0,0,0,0", 3),      # Hidden Map, one human (DS:3254)
         ("ERYTHEA", "HHCCCCCC", "0,1,0,1,0,0,0,0,0,0", 2),      # Hidden Map, two humans
         ("TUTORIA", "CCCCCCCH", "0,0,0,0,0,0,0,0,0,0", 2)]


class _Rolls(defaultdict):
    """The roll log and the Rng objects it has seen (strong references)."""

    def __init__(self, *a):
        super().__init__(*a)
        self.keep = {}


@pytest.fixture
def rolls(monkeypatch):
    """Every die roll, per Rng object: (dice, sides, add, result), keyed by id(rng).  Every Rng
    that rolled is kept alive for the test, so no later Rng can get a dead one's address (a
    temporary Rng, e.g. states/setup.py's load roller, would else lend its rolls to the copy
    CPython puts at the freed address)."""
    log = _Rolls(list)
    orig = R.Rng.rnd

    def rnd(self, d, s, a):
        v = orig(self, d, s, a)
        log.keep[id(self)] = self
        log[id(self)].append((d, s, a, v))
        return v
    monkeypatch.setattr(R.Rng, "rnd", rnd)
    return log


def test_rolls_of_a_dead_rng_are_not_lent_to_a_new_one(rolls):
    """A temporary Rng (setup's 256 load rolls) freed before the test's copies: CPython puts the
    next Rng at the freed address, so without the kept references its log would start with the
    dead one's rolls."""
    tmp = R.Rng(3)
    for _ in range(256):
        tmp.rnd(1, 8, -1)
    del tmp
    for _ in range(200):                     # each freed again: any reuse would show up
        r = R.Rng(3)
        r.rnd(1, 8, -1)
        assert len(rolls[id(r)]) == 1
        del r


def _app(game, tmp, scen, ctl, opts):
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", scen,
                           "--controls", ctl, "--options", opts, "--user-dir", str(tmp / "u")]))


def _top(g):
    d = getattr(g, "dialogs", None)
    return getattr(d.top, "dialog_id", None) if d and d.top is not None else None


def _human_waits(a, n=40000):
    import pygame
    up = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        top = _top(g)
        if top in ACCEPT:
            g.dialogs.top.press(ACCEPT[top])
            a.step([])
            continue
        a.step([up] if top not in (None, "fight", "settings") else [])
    raise AssertionError("no human turn")


def _answer(st):
    """The answer the UI tests give to a pending hero offer (accept) or victory screen (483)."""
    if isinstance(st.pending, E.HeroOffered):
        apply(st, C.AcceptHero(True))
    elif isinstance(st.pending, E.Victory):
        apply(st, C.CloseVictory())


def _threaded(st):
    """End Turn as the user interface runs it (one computer side per run), every point acked."""
    def go(fn):
        r = Runner(fn)
        while r.resume() is not None:
            pass
        return r.result
    go(lambda: apply(st, C.EndTurn(max_sides=1)))
    while st.pending is None and st.players[st.current].control != Control.HUMAN and not T.loop_over(st):
        go(lambda: T.run(st, max_sides=1))


def _music_on(st):
    """The music switch on (DS:0bee, M10c): ovl58:0000 then rolls the game's dice."""
    st.music.on, st.music.mode, st.music.playing = 1, 1, 1


@gamedata
@pytest.mark.parametrize("music", [False, True], ids=["music_off", "music_on"])
@pytest.mark.parametrize("scen,ctl,opts,rounds", GAMES, ids=lambda v: str(v))
def test_runner_equals_plain_run(game, tmp_path, rolls, scen, ctl, opts, rounds, music):
    a = _app(game, tmp_path, scen, ctl, opts)
    g = _human_waits(a)
    if music:
        _music_on(g.state)
    plain, threaded = g.state.copy(), g.state.copy()
    a.close()
    for _ in range(rounds):
        apply(plain, C.EndTurn())
        _threaded(threaded)
        assert threaded.hash() == plain.hash() and threaded.music == plain.music
        _answer(plain)
        _answer(threaded)
    assert rolls[id(threaded.rng)] == rolls[id(plain.rng)] and rolls[id(plain.rng)]
    assert plain.music.starts > 0 if music else plain.music.starts == 0


@gamedata
@pytest.mark.parametrize("music", [False, True], ids=["music_off", "music_on"])
@pytest.mark.parametrize("scen,ctl,opts,rounds", GAMES[:3], ids=lambda v: str(v))
def test_computer_phase_equals_plain_run(game, tmp_path, rolls, scen, ctl, opts, rounds, music):
    """The game's End Turn with the computer phase drawing at every point: same state hashes
    and the same rolls as the engine alone (with the music on too: its dice are the engine's)."""
    a = _app(game, tmp_path, scen, ctl, opts)
    g = _human_waits(a)
    if music:
        _music_on(g.state)
    plain = g.state.copy()
    start = len(rolls[id(g.state.rng)])
    for _ in range(rounds):
        apply(plain, C.EndTurn())
        g.end_turn()
        n = 0
        while g.phase_name != "turn_start":
            a.step([])
            n += 1
            assert n < 60000
        assert g.state.hash() == plain.hash()
        g = _human_waits(a)
        _answer(plain)
        assert g.state.hash() == plain.hash()
    assert rolls[id(g.state.rng)][start:] == rolls[id(plain.rng)]
    assert g.state.music == plain.music and (plain.music.starts > 0) == music
    a.close()
