"""Register X67: a left click on an own city on the main map, held for some frames, opens that
city's production screen (ovl46:011c -> ovl45:0000(2)) and stays on it: the held poll of the
screen's area 6 (0726:030e -> ovl45:1afa -> ovl44:028b) waits until the opening click's button
was seen up."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.ui.dialogs.production import CityScreen  # noqa: E402
from warlords2.states.phases.human import TILE  # noqa: E402
from warlords2.ui.mapview import AREA  # noqa: E402


@pytest.fixture
def started(game, tmp_path):
    """TUTORIA with Quick Start (Origin, Zekond, Faraway for side 0), the turn-1 screens closed."""
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--options", "0,0,0,0,0,0,0,1,0,0",
                        "--user-dir", str(tmp_path / "u")]))
    answer = {"hero_offer": 287, "production": 192}
    for _ in range(120):
        g = a.manager.current_state()
        top = g.dialogs.top if g.dialogs else None
        if top is not None and getattr(top, "dialog_id", "") in answer:
            top.press(answer[top.dialog_id])
            up = []
        else:
            up = [pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))] if g.dialogs else []
        a.step(up)
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            break
    assert g.phase_name == "human" and not g.dialogs
    g.state.flags[0x134] |= 0x02 | 0x04 | 0x08 | 0x10 | 0x20 | 0x80   # the tutorial pages count as shown
    yield a, g
    a.close()


@pytest.mark.parametrize("held", [1, 2, 6])
def test_held_click_on_city_keeps_that_city(started, held):
    a, g = started
    st = g.state
    origin = next(i for i, c in enumerate(st.cities) if c.name == "Origin")
    c = st.cities[origin]
    left, top = g.view.origin
    # Origin's free lower-right square; its strategic-map square ((x - 80) / 2, (y - 60) / 2) on the
    # screen lies nearer Faraway
    pos = (AREA[0] + (c.x + 1 - left) * TILE + 24, AREA[1] + (c.y + 1 - top) * TILE + 25)
    assert st.city_at(*g.view.square_at(pos)) == origin
    w = a.input.window(pos)
    a.step([pygame.event.Event(pygame.MOUSEMOTION, pos=w, rel=(0, 0), buttons=(0, 0, 0)),
            pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=w)])
    scr = g.dialogs.top
    assert isinstance(scr, CityScreen) and scr.ci == origin
    for _ in range(held - 1):
        a.step([pygame.event.Event(pygame.MOUSEMOTION, pos=w, rel=(0, 0), buttons=(1, 0, 0))])
    a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=w)])
    a.step([])
    assert g.dialogs.top is scr and scr.ci == origin, st.cities[scr.ci].name


@pytest.mark.parametrize("held", [2, 30, 90])
def test_held_click_on_a_move_square_moves_once(started, held):
    """X67 for the map: the walk ends while the click is still held; the held polls then wait for
    the release, so no select / stack drag / second move follows from the same click."""
    from warlords2.model import commands as C
    from warlords2.states.phases.human import CU, leader
    a, g = started
    ph, st = g.phase, g.state
    if leader(st) is None:
        ph.select(next((s.x, s.y) for s in st.armies if s.owner == st.current and s.x >= 0))
        ph.stack_drag = None
    lead = leader(st)
    left, top = g.view.origin
    pos = sq = None
    for dx, dy in ((2, 0), (-2, 0), (0, 2), (0, -2), (1, 1), (-1, -1), (1, 0), (0, 1)):
        p = (AREA[0] + (lead.x + dx - left) * TILE + 20, AREA[1] + (lead.y + dy - top) * TILE + 20)
        if g.view.square_at(p) is not None and ph.cursor(p) in (CU.BOOT, CU.SHIP):
            pos, sq = p, g.view.square_at(p)
            break
    assert pos is not None
    done = []
    real = ph.apply
    ph.apply = lambda cmd, *r, **k: (done.append(type(cmd).__name__), real(cmd, *r, **k))[1]
    w = a.input.window(pos)
    a.step([pygame.event.Event(pygame.MOUSEMOTION, pos=w, rel=(0, 0), buttons=(0, 0, 0)),
            pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=w)])
    for _ in range(held - 1):
        a.step([pygame.event.Event(pygame.MOUSEMOTION, pos=w, rel=(0, 0), buttons=(1, 0, 0))])
    a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=w)])
    for _ in range(60):
        a.step([])
    assert done == [C.Move.__name__], done
    assert ph.stack_drag is None and not ph.wait_up
