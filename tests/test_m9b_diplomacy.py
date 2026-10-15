"""M9b package D: the Diplomatic Report (515), the Diplomatic Action dialog (183-185), the
treachery question and the confirmation keys (ovl00, ovl36:010c, ovl56:0088)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import Control  # noqa: E402
from warlords2.rules import diplomacy as D  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import diplomacy_action as DA  # noqa: E402
from warlords2.ui.dialogs import diplomacy_report as DR  # noqa: E402
from warlords2.ui.keys import ESC_LIST, RETURN_LIST, ds_list  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
DIPLOMACY_ON = "0,1,0,0,0,0,0,0,0,0"


def key(k, ch):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


ESC, RET, LETTER = key(pygame.K_ESCAPE, "\x1b"), key(pygame.K_RETURN, "\r"), key(pygame.K_a, "A")


def _top(g):
    d = getattr(g, "dialogs", None)
    return d.top if d is not None else None


def _human(a, n=400):
    """Step TUTORIA's turn 1 to the Knights' map: pop-ups dismissed, the hero accepted."""
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


def _app(game, tmp_path, options=DIPLOMACY_ON):
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1", "--scenario", "TUTORIA",
                           "--controls", "HCCCCCCH", "--options", options, "--user-dir", str(tmp_path / "u")]))


@pytest.fixture
def app(game, tmp_path):
    a = _app(game, tmp_path)
    yield a
    a.close()


def _draw(g):
    fb = g.app.screen.fb
    g.paint(fb)
    g.dialogs.draw(fb)
    return fb


def _same(fb, pic, dst, src, w, h) -> bool:
    return all(fb.get_at_mapped((dst[0] + x, dst[1] + y)) == pic.get_at_mapped((src[0] + x, src[1] + y))
               for x in range(0, w, 3) for y in range(0, h, 3))


# ------------------------------------------------------------------ pure mappings


def test_target_skips_the_own_column():
    """ovl00:0a69: b = id - base, b + 1 from the own column on; relation by the row."""
    assert DA.target(372, 0) == (1, 0) and DA.target(378, 0) == (7, 0)
    assert DA.target(380, 3) == (0, 1) and DA.target(382, 3) == (2, 1) and DA.target(383, 3) == (4, 1)
    assert DA.target(388, 7) == (0, 2) and DA.target(394, 7) == (6, 2)
    assert DA.columns(3) == [0, 1, 2, 4, 5, 6, 7]
    assert DA.cell_ids() == [*range(372, 379), *range(380, 387), *range(388, 395)]


@gamedata
def test_key_lists_of_the_exe(app):
    """Esc / Return: DS:1514 holds 190 (no), 368, 370 and not 189; DS:155c 189, 368, 370 and not 190."""
    k = kit(app)
    esc, ret = ds_list(k.exe, ESC_LIST), ds_list(k.exe, RETURN_LIST)
    assert {190, 368, 370} <= set(esc) and 189 not in esc
    assert {189, 368, 370} <= set(ret) and 190 not in ret


# ------------------------------------------------------------------ the report


@gamedata
def test_report_opens_closes_and_switches(app):
    g = _human(app)
    st = g.state
    assert st.options.diplomacy and registry.has_action(515)
    closed = []
    g.settings_closed = lambda: closed.append(1)
    registry.run_action(515, g)
    d = _top(g)
    assert d.dialog_id == "diplomacy_report" and set(d.row.state) == {368, 369}
    _draw(g)
    d.update([LETTER], 16)
    assert _top(g) is d                                  # 'A'..'Z' ignored
    d.update([ESC], 16)
    assert not g.dialogs and closed == [1]               # Esc -> 368 -> ovl61:011f
    registry.run_action(515, g)
    _top(g).update([RET], 16)
    assert not g.dialogs and closed == [1, 1]            # Return -> 368
    registry.run_action(515, g)
    _top(g).press(369)                                   # Action: no close path in between
    a = _top(g)
    assert a.dialog_id == "diplomacy_action" and len(g.dialogs) == 1 and closed == [1, 1]
    a.press(371)
    r = _top(g)
    assert r.dialog_id == "diplomacy_report" and len(g.dialogs) == 1 and closed == [1, 1]
    r.press(368)
    assert not g.dialogs and closed == [1, 1, 1]


@gamedata
def test_report_cells(app):
    """Diagonal for every side (dead too), war / peace icons between live sides, nothing for
    neutral or with a dead side; header shields of live sides only; the rating rows."""
    g = _human(app)
    st = g.state
    alive = [p.index for p in st.players if p.alive]
    assert alive == [0, 7]
    D.set_current(st, 0, 7, D.K.WAR.value)
    D.set_current(st, 7, 0, D.K.NEUTRAL.value)
    D.set_current(st, 1, 2, D.K.WAR.value)               # two dead sides: not drawn
    assert DR.cell_icon(st, 3, 3) == DR.DIAGONAL
    assert DR.cell_icon(st, 0, 7) == DR.WAR_ICON and DR.cell_icon(st, 7, 0) is None
    assert DR.cell_icon(st, 1, 2) is None and DR.cell_icon(st, 0, 1) is None
    D.set_current(st, 7, 0, D.K.PEACE.value)
    assert DR.cell_icon(st, 7, 0) == DR.PEACE_ICON
    registry.run_action(515, g)
    fb = _draw(g)
    pic = kit(app).picture(DR.DIPLOM)
    cell = lambda a, b: (120 + 32 * a, 139 + 29 * b)      # noqa: E731
    assert _same(fb, pic, cell(4, 4), DR.DIAGONAL, 32, 29)
    assert _same(fb, pic, cell(0, 7), DR.WAR_ICON, 32, 29)
    assert _same(fb, pic, cell(7, 0), DR.PEACE_ICON, 32, 29)
    assert not _same(fb, pic, cell(1, 2), DR.WAR_ICON, 32, 29)
    assert fb.get_at_mapped((120, 200)) == DR.GRID and fb.get_at_mapped((300, 110)) == DR.GRID
    assert fb.get_at_mapped((392, 200)) == DR.PANEL
    shields = kit(app).picture(5)
    assert _same(fb, shields, (128 + 32 * 7, 117), (40 * 7 + 24, 46), 16, 16)
    assert not _same(fb, shields, (128 + 32 * 3, 117), (40 * 3 + 24, 46), 16, 16)
    rank = D.rating(st)
    assert _same(fb, shields, (400, 146 + 29), (40 * rank[1][0] + 24, 46), 16, 16)


# ------------------------------------------------------------------ the action dialog


@gamedata
def test_action_cells_and_proposals(app):
    g = _human(app)
    st = g.state
    registry.run_action(183, g)
    d = _top(g)
    assert d.dialog_id == "diplomacy_action" and set(d.row.state) == {370, 371, *DA.cell_ids()}
    me = st.current
    assert me == 0
    d.press(386)                                          # neutral to column 6 = side 7
    assert D.proposal(st, 0, 7) == 1 and D.current(st, 0, 7) == 0
    d.press(394)                                          # war to side 7
    assert D.proposal(st, 0, 7) == 2
    d.press(372)                                          # peace to dead side 1: accepted
    assert D.proposal(st, 0, 1) == 0
    d.press(388)
    assert D.proposal(st, 0, 1) == 2 and _top(g) is d
    D.set_proposal(st, 7, 0, D.K.WAR.value)
    cells = DA.cells(st, 7)
    assert cells[DA.STATE_Y] == (80, 45)                  # peace state icon
    assert cells[DA.OFFER_Y] == (320, 45)                 # their war proposal
    assert [cells[y] for y in DA.BUTTON_Y] == [(0, 45), (120, 45), (280, 45)]   # mine war: down
    assert set(DA.cells(st, 1).values()) == {None}        # dead side: empty
    D.set_proposal(st, 7, 0, D.K.PEACE.value)
    assert DA.cells(st, 7)[DA.OFFER_Y] is None            # proposal == current
    fb = _draw(g)
    pic = kit(app).picture(DA.DIPLOM)
    x7 = 272 + 40 * 6
    assert _same(fb, pic, (x7, 151), (80, 45), 40, 40)
    assert _same(fb, pic, (x7, 325), (280, 45), 40, 40)
    assert _same(fb, pic, (x7, 245), (0, 45), 40, 40)
    assert fb.get_at_mapped((272, 151)) == DA.EDGE and fb.get_at_mapped((290, 170)) == DA.GROUND
    assert fb.get_at_mapped((x7 + 20, 191 + 20)) == DA.GROUND and fb.get_at_mapped((x7, 191)) == DA.EDGE
    d.update([ESC], 16)
    assert not g.dialogs
    registry.run_action(185, g)
    _top(g).update([RET], 16)
    assert not g.dialogs


@gamedata
def test_cell_press_through_the_mouse(app):
    g = _human(app)
    st = g.state
    registry.run_action(184, g)
    d = _top(g)
    x, y, w, h = d.row.at((272 + 40 * 6 + 5, 290)).rect
    pos = (x + w // 2, y + h // 2)
    d.update([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=pos),
              pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=pos)], 16)
    assert D.proposal(st, 0, 7) == 1 and all(v == 1 for v in d.row.state.values())


@gamedata
def test_nothing_without_diplomacy(game, tmp_path):
    a = _app(game, tmp_path, options="0,0,0,0,0,0,0,0,0,0")
    try:
        g = _human(a)
        for id in (515, 183, 184, 185):
            assert registry.run_action(id, g) is None
        assert not g.dialogs
    finally:
        a.close()


# ------------------------------------------------------------------ confirm keys, treachery


@gamedata
def test_confirm_keys(app):
    g = _human(app)
    got = []
    for ev, want in ((ESC, False), (RET, True)):
        d = registry.open_dialog("confirm", g, title="t", lines=["a"], on_close=got.append)
        d.update([LETTER], 16)
        assert _top(g) is d
        d.update([ev], 16)
        assert _top(g) is None and got[-1] is want


@gamedata
def test_treachery_view_and_answers(app, monkeypatch):
    g = _human(app)
    st = g.state
    k = kit(app)
    ev = E.TreacheryPrompt({"attacker": 0, "other": 7, "x": 51, "y": 51, "group": [], "city": 0})
    st.pending = ev
    it = registry.event_views(E.TreacheryPrompt)
    assert len(it) == 1
    view = it[0](g, ev)
    next(view)
    d = _top(g)
    assert d.dialog_id == "treachery_confirm"
    assert d.title == k.text.group(140)[0] and d.lines == k.text.group(140)[1:5]
    before = st.copy()
    before.pending = None
    d.update([ESC], 16)                                   # no: nothing changes
    assert st.pending is None and st.hash() == before.hash() and not g.dialogs
    with pytest.raises(StopIteration):
        next(view)
    sent = []
    monkeypatch.setattr(g.phase, "apply", lambda cmd: sent.append(cmd) or [])
    st.pending = ev
    view = it[0](g, ev)
    next(view)
    _top(g).update([RET], 16)
    assert sent == [C.ConfirmTreachery(True)] and not g.dialogs
    st.players[0].control = Control.COMPUTER              # ovl36:010c asks any attacker
    view = it[0](g, ev)
    next(view)
    assert _top(g).dialog_id == "treachery_confirm"
