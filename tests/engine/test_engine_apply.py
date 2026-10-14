"""engine.apply is atomic; Move without a path; the RNG source of NewGameConfig."""
import pytest

from warlords2.model import commands as C
from warlords2.model.ids import Control, Terrain
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load
from warlords2.rules import engine
from warlords2.rules import setup as S
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.rng import BorlandRand

from movekit import _inputs, add_army, flat_state, paint, type_with


def test_apply_rolls_back_a_handler_that_raises_after_mutating(monkeypatch, game):
    st = flat_state(game)
    a = add_army(st, type_with(st, flag16=0), 10, 10)
    h0 = st.hash()

    def bad(state, cmd):
        state.armies[0].x = 50
        state.players[0].gold += 7
        state.rng.rnd(1, 6, 0)
        state.armies.append(state.armies[0])
        raise engine.IllegalCommand("after mutating")

    monkeypatch.setattr(engine, "resolve", lambda cls: bad)
    with pytest.raises(engine.IllegalCommand):
        engine.apply(st, C.Move((a.id,), (12, 10)))
    assert st.hash() == h0
    assert st.armies[0] is a and a.x == 10                # references stay valid


def test_move_without_path_reports_it(game):
    """0555:000a returns 0 -> 0a8b:0c8f: nothing moves; the human side hears ovl58:0b5f."""
    st = flat_state(game)
    a = add_army(st, type_with(st, flag16=0, flag19=0), 10, 10)
    for y in range(156):
        paint(st, 20, y, Terrain.MOUNTAINS)
    ev = engine.apply(st, C.Move((a.id,), (30, 10)))
    assert len(ev) == 1 and ev[0].info["no_path"] and ev[0].info["path"] == []
    assert (a.x, a.y) == (10, 10) and a.goto == (30, 10)


def test_borland_rng_is_reachable_and_serialised(game):
    sc, at, kw = _inputs(game, "TUTORIA")
    cfg = NewGameConfig("TUTORIA", (Control.HUMAN,) + (Control.COMPUTER,) * 7, (1,) * 8, (0,) * 8,
                        (0,) * 8, None, GameOptions(), 0, 7, rng="borland")
    with allowing_unverified():
        st = S.new_game(sc, cfg, list(at), **kw)
        st2 = S.new_game(sc, cfg, list(at), **kw)
    assert isinstance(st.rng.src, BorlandRand) and st.hash() == st2.hash()
    back = load(dump(st))
    assert isinstance(back.rng.src, BorlandRand) and back.hash() == st.hash()
    assert back.rng.rnd(1, 20, 0) == st.rng.rnd(1, 20, 0)


def test_new_game_config_default_rng():
    cfg = NewGameConfig("X", (0,) * 8, (0,) * 8, (0,) * 8, (0,) * 8, None, None, 0, 1)
    assert cfg.rng == "python"
