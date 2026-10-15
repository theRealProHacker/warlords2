"""Tutorial pages of the selection commands (SCN 0x12e; SCN byte 0x134 bits 3, 4, 7) and of the
move tail: 0b62:04f2..063f (SelectStack), ovl67:01ea..0337 (Next / Quit & Next / Defend),
0c8c:02a1..0415 (`tutorial_after_move`); the hero offer's page, ovl47:11d5..1207 (SCN byte 0x134
bit 0, `rules.heroes.human_offer`)."""
import dataclasses

import pytest

from movekit import add_army, flat_state, paint
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, Terrain
from warlords2.rules import engine
from warlords2.rules import selection as S

pytestmark = pytest.mark.gamedata
TUT, BYTE = 0x12E, 0x134


def pages(ev):
    return [e.info["file"] for e in ev if isinstance(e, E.TurnCue) and e.info["kind"] == "tutorial"]


@pytest.fixture
def st(game):
    s = flat_state(game)
    s.flags[TUT], s.flags[BYTE] = 1, 0
    return s




def test_first_select_page_once(st):
    add_army(st, 1, 10, 10)
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == [(25, 3)]
    assert st.flags[BYTE] == 0x08
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == []


def test_no_pages_without_the_tutorial_flag(st):
    st.flags[TUT] = 0
    add_army(st, 1, 10, 10)
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == [] and st.flags[BYTE] == 0


def test_city_of_another_owner_next_to_the_army(game, st):
    """(25, 4): one of the 8 squares around the selected army in a city (2x2, ovl62:044a) whose
    owner byte is not the side on turn; the side's own city does not count."""
    from movekit import scenario_state
    proto = scenario_state(game, "TUTORIA").cities[0]
    st.cities = [dataclasses.replace(proto, x=12, y=9, owner=0), dataclasses.replace(proto, x=20, y=20, owner=7)]
    add_army(st, 1, 10, 10)
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == [(25, 3)]      # own city at (12, 9)
    st.cities[0].owner = 0x0F                                               # neutral: another owner
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == []             # (11, 9)..: city at x 12, 13
    st.cities[0].x = 11                                                     # covers (11, 9), (11, 10)
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == [(25, 4)]
    assert st.flags[BYTE] == 0x18
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == []


def test_hero_on_a_site(st):
    paint(st, 10, 10, Terrain.SITE)
    add_army(st, 1, 12, 12)
    add_army(st, HERO_TYPE, 10, 10)
    st.flags[BYTE] = 0x08
    assert pages(engine.apply(st, C.SelectStack(12, 12))) == []             # not a hero
    assert pages(engine.apply(st, C.SelectStack(10, 10))) == [(25, 5)]
    assert st.flags[BYTE] == 0x88


def test_next_with_nothing_left_shows_only_the_first_page(st):
    assert pages(engine.apply(st, C.Next())) == [(25, 3)]
    assert st.selection.selected == -1


def test_move_tail(st):
    """0c8c:02a1..02db: status 2 on turn 1 -> (25, 9) every time, no flag; later turns nothing;
    another status -> the (25, 4) / (25, 5) checks."""
    st.turn = 1
    assert S.tutorial_after_move(st, 2) == S.tutorial_after_move(st, 2) == [
        E.TurnCue({"kind": "tutorial", "file": (25, 9)})]
    st.turn = 2
    assert S.tutorial_after_move(st, 2) == []
    paint(st, 10, 10, Terrain.SITE)
    h = add_army(st, HERO_TYPE, 10, 10)
    st.selection.selected = h.id
    assert pages(S.tutorial_after_move(st, 0)) == [(25, 5)] and st.flags[BYTE] == 0x80


def test_hero_offer_page_once(game):
    """ovl47:11d5..1207 inside the offer dialog: SCN 0x12e and byte 0x134 bit 0 clear -> bit 0
    set, FILE.DAT (25, 0) after the HeroOffered; a second offer shows no page."""
    from movekit import scenario_state
    from warlords2.model.ids import Control
    from warlords2.rules import heroes as H
    s = scenario_state(game, "TUTORIA", seed=3, controls=(Control.HUMAN,) * 8)
    s.flags[TUT], s.flags[BYTE] = 1, 0
    ev = H.human_offer(s)
    assert isinstance(ev[0], E.HeroOffered) and s.pending is ev[0]
    assert pages(ev) == [(25, 0)] and ev[1] is ev[-1] and s.flags[BYTE] == 0x01
    s.pending = None
    assert pages(H.human_offer(s)) == [] and s.flags[BYTE] == 0x01
    s.pending, s.flags[TUT], s.flags[BYTE] = None, 0, 0
    assert pages(H.human_offer(s)) == [] and s.flags[BYTE] == 0
