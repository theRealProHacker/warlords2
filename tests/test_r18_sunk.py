"""R18: the message after armies sank for lack of a boat (0b62:11ef..1293, `ui.dialogs.sunk`)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import HERO_TYPE, MAP_W, Terrain  # noqa: E402
from warlords2.rules.movement import _flies  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import message as MS  # noqa: E402
from warlords2.ui.dialogs import sunk as SK  # noqa: E402
from warlords2.ui.dialogs.hero_offer import raw  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))


def _top(g):
    d = getattr(g, "dialogs", None)
    return d.top if d is not None else None


def _human(a, n=600):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        tid = getattr(_top(g), "dialog_id", None)
        if tid == "production":
            _top(g).press(192)
        elif tid == "hero_offer":
            _top(g).press(287)
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message") else [])
    raise AssertionError("human phase not reached")


@pytest.fixture
def app(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1", "--scenario", "ERYTHEA",
                        "--controls", "HCCCCCCC", "--user-dir", str(tmp_path / "u")]))
    yield a
    a.close()


def _water(st, near):
    """The water square nearest to `near` with no army on it."""
    taken = {(a.x, a.y) for a in st.armies if a.owner != 0xFF}
    h = len(st.world.tiles) // MAP_W
    sq = [(x, y) for y in range(h) for x in range(MAP_W)
          if st.world.terrain(x, y) == Terrain.WATER and (x, y) not in taken]
    return min(sq, key=lambda s: abs(s[0] - near[0]) + abs(s[1] - near[1]))


def _sinkers(st, n):
    """n armies that sink (side 0's, then other sides' given to side 0)."""
    out = sorted((a for a in st.armies if a.owner != 0xFF and a.type_id != HERO_TYPE and not _flies(st, a)),
                 key=lambda a: a.owner != 0)[:n]
    assert len(out) == n
    for a in out:
        a.owner = 0
    return out


@gamedata
def test_registered():
    registry.load_all()
    assert SK.sunk in registry.event_views(E.Sunk)


@gamedata
@pytest.mark.parametrize("n", [1, 2])
def test_select_on_water_sinks_with_the_message(app, monkeypatch, n):
    g = _human(app)
    st = g.state
    k = kit(app)
    gone = _sinkers(st, n)
    sq = _water(st, (gone[0].x, gone[0].y))
    for a in gone:
        a.x, a.y, a.group = *sq, 0
    drawn = []
    real = MS.text_centred
    monkeypatch.setattr(MS, "text_centred", lambda fb, font, x, y, s, ink, sh: (drawn.append((x, y, s)),
                                                                                  real(fb, font, x, y, s, ink, sh)))
    centre = (g.view.cx, g.view.cy)
    ev = g.phase.apply(C.SelectStack(*sq))
    assert [type(e) for e in ev] == [E.Sunk] and ev[0].info["count"] == n and ev[0].info["square"] == sq
    d = _top(g)
    assert d.dialog_id == "message"
    first = raw(k, 168, 2) if n == 1 else raw(k, 168, 0).replace("%d", str(n))
    assert d.lines == SK.lines(k, n) == [first, raw(k, 168, 1)]
    scene = g.phase.scene()                                  # the map drawn without them (1230)
    assert scene is not st and all(scene.armies[a.id].owner == 0xFF for a in gone)
    assert (g.view.cx, g.view.cy) == centre                  # centred only after the message (1288)
    fb = g.app.screen.fb
    g.paint(fb)
    g.dialogs.draw(fb)
    assert drawn == [(320, 190, d.lines[0]), (320, 212, d.lines[1])]
    for _ in range(5):
        app.step([])
    assert _top(g) is d                                      # waits (ovl61:1160)
    app.step([UP])
    app.step([])
    assert _top(g) is None and not g.phase.busy()
    assert (g.view.cx, g.view.cy) == (st.flags[0x17D], st.flags[0x17F])
    assert abs(g.view.cx - sq[0]) <= 4 and abs(g.view.cy - sq[1]) <= 4
    assert st.selection.selected == -1


@gamedata
def test_turn_start_form_does_not_move_the_view(app):
    g = _human(app)
    st = g.state
    centre = (g.view.cx, g.view.cy)
    st.flags[0x17D], st.flags[0x17F] = centre[0] + 7, centre[1] + 9   # the view words elsewhere
    g.phase.animator.play([E.Sunk({"armies": (), "count": 3, "square": (-1, -1)})], st.copy())
    d = _top(g)
    assert d.dialog_id == "message" and d.lines == SK.lines(kit(app), 3)
    app.step([UP])
    app.step([])
    assert _top(g) is None and (g.view.cx, g.view.cy) == centre
