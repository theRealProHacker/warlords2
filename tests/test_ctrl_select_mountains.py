"""Register X68: with a walking stack selected, Ctrl+click on an own stack on Mountains (a
square the selection cannot enter) selects that stack; without Ctrl, or with Shift or Alt, the
cursor stays the EXE's hand (08a9:0a8c..0a99)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from tests.test_city_click_hold import started  # noqa: E402,F401
from warlords2.model.ids import Terrain  # noqa: E402
from warlords2.rules.heroes import place_ally  # noqa: E402
from warlords2.states.phases.human import CU, MAP_W, TILE, leader  # noqa: E402
from warlords2.ui.mapview import AREA  # noqa: E402


class Mods:
    def __init__(self, ctrl=False, shift=False, alt=False):
        self.ctrl, self.shift, self.alt = ctrl, shift, alt


@pytest.fixture
def mountain(started):
    """A walking stack selected and a second own army placed on a Mountains square in view."""
    a, g = started
    ph, st = g.phase, g.state
    if leader(st) is None:
        ph.select(next((s.x, s.y) for s in st.armies if s.owner == st.current and s.x >= 0))
        ph.stack_drag = None
    lead = leader(st)
    assert st.selection.mode == 1
    w = st.world
    sq = min(((x, y) for y in range(len(w.tiles) // MAP_W) for x in range(MAP_W)
              if w.terrain_of_tile[w.tiles[y * MAP_W + x] & 0xFF] == Terrain.MOUNTAINS),
             key=lambda p: abs(p[0] - lead.x) + abs(p[1] - lead.y))
    other = place_ally(st, lead.type_id, *sq)
    assert other is not None and (other.x, other.y) == sq
    ph.centre_on(*sq)
    return a, g, sq, other, lead


def test_cursor_on_own_stack_on_mountains(mountain):
    a, g, sq, other, lead = mountain
    ph = g.phase
    assert ph.map_cursor(sq, Mods()) == CU.HAND
    assert ph.map_cursor(sq, Mods(ctrl=True)) == CU.TARGET
    assert ph.map_cursor(sq, Mods(ctrl=True, shift=True)) == CU.HAND
    assert ph.map_cursor(sq, Mods(ctrl=True, alt=True)) == CU.HAND


def test_ctrl_click_selects_the_stack_on_mountains(mountain):
    a, g, sq, other, lead = mountain
    left, top = g.view.origin
    pos = (AREA[0] + (sq[0] - left) * TILE + 20, AREA[1] + (sq[1] - top) * TILE + 20)
    assert g.view.square_at(pos) == sq
    w = a.input.window(pos)
    a.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_LCTRL, mod=pygame.KMOD_LCTRL, unicode=""),
            pygame.event.Event(pygame.MOUSEMOTION, pos=w, rel=(0, 0), buttons=(0, 0, 0)),
            pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=w)])
    a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=w),
            pygame.event.Event(pygame.KEYUP, key=pygame.K_LCTRL, mod=0, unicode="")])
    new = leader(g.state)
    assert new is not None and (new.x, new.y) == sq
    assert g.phase.map_drag is None
