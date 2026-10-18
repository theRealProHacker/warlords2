"""Move All (the order menu's 'm', 07be:01fc -> 0c8c:04c4): each further stack is selected inside
the one command (ovl67:06eb, palette 0c8c:04fb) before its walk, so while it walks the stack
palette, the path marks, the moving army and the ghost are that stack's (rules.movement.move
info["selection"], ui.anim.move.walk), not those of the stack selected before the command."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.rules.constants import selection as K  # noqa: E402
from warlords2.states.phases.human import leader  # noqa: E402
from warlords2.ui.palettes import lowest_moves  # noqa: E402


@pytest.fixture
def started(game, tmp_path):
    """TUTORIA with Quick Start, the turn-1 screens closed (as tests/test_city_click_hold.py)."""
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
    g.state.flags[0x134] |= 0xFF                       # the tutorial pages count as shown
    yield a, g
    a.close()


def test_the_second_stack_walks_with_its_own_palette_and_marks(started):
    a, g = started
    ph, st = g.phase, g.state
    first, second = st.armies[0], st.armies[2]           # Origin's hero, the stack at (49, 69)
    assert (first.x, first.y) != (second.x, second.y)
    dest2 = (second.x + 3, second.y)
    for s, dest in ((first, (first.x + 3, first.y)), (second, dest2)):
        ph.apply(C.SelectStack(s.x, s.y))
        ph.set_path(dest)
        assert leader(st).goto == dest
    second.flags &= ~K.VISITED.value                     # its goto as if from an earlier turn
    ph.apply(C.SelectStack(first.x, first.y))
    second_moves = lowest_moves(_selected_as(st, second))
    assert second_moves != lowest_moves(st)              # the two palettes say different moves
    ph.apply(C.MoveAll())
    seen = []
    for _ in range(300):
        sc = ph.scene()
        seen.append((sc.selection.selected, tuple(ph.display.squares), lowest_moves(sc)))
        if not ph.animator.busy:
            break
        a.step([])
    walking_second = [s for s in seen if s[1] and s[1][-1] == dest2]
    assert walking_second and len(walking_second) < len(seen), seen   # the first walked too
    for selected, _, moves in walking_second:
        assert selected == second.id and moves == second_moves


def _selected_as(st, army):
    from warlords2.rules.selection import select_army_stack
    cp = st.copy()
    select_army_stack(cp, cp.armies[army.id])
    return cp
