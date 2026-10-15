"""M5b: View -> Stack (ovl66:0c9c) and View -> Army Bonus (ovl66:1e3b)."""
import logging
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model.ids import HERO_TYPE  # noqa: E402
from warlords2.rules.engine import apply  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import army_bonus as AB  # noqa: E402
from warlords2.ui.dialogs import stack as SK  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
ACCEPT_HERO = 287
ESC = pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE, unicode="\x1b", mod=0, scancode=0)


def _press(a, d, id):
    b = next(b for b in d.row.buttons if b.id == id)
    x, y, w, h = b.rect
    s = a.input.scale                                    # Input.feed takes window px
    p = ((x + w // 2) * s, (y + h // 2) * s)
    a.step([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=p)])
    a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=p)])


@pytest.fixture
def game(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--user-dir", str(tmp_path / "u")]))
    for _ in range(400):
        g = a.manager.current_state()
        top = getattr(g, "dialogs", None) and g.dialogs.top
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            break
        did = getattr(top, "dialog_id", "") if top else ""
        if did == "hero_offer":                          # M7b's turn-1 offer: Accept
            _press(a, top, ACCEPT_HERO)
            continue
        if did == "production":                          # M6b's turn-1 city screen: Esc
            a.step([ESC])
            continue
        a.step([UP] if top else [])
    else:
        raise AssertionError("human phase not reached")
    yield a, g
    a.close()


def _select_capital(a, g):
    st = g.state
    h = next(x for x in st.armies if x.owner == 0 and x.type_id == HERO_TYPE)
    g.phase.apply(C.SelectStack(h.x, h.y))
    while g.dialogs:
        a.step([UP])
    a.step([])
    return h


@gamedata
def test_stack_needs_a_selected_stack(game):
    a, g = game
    assert registry.run_action(registry.MENU_ID["stack"], g) is None and not g.dialogs     # ovl66:0ca5
    _select_capital(a, g)
    d = registry.run_action(registry.MENU_ID["stack"], g)
    assert d.dialog_id == "stack" and g.dialogs.top is d


@gamedata
def test_stack_button_states_and_strengths(game):
    a, g = game
    h = _select_capital(a, g)
    d = registry.open_dialog("stack", g)
    n = len(g.state.selection.palette)
    assert n == 2
    assert d.row.state[SK.GROUP_ALL] == d.row.state[SK.UNGROUP_ALL] == NORMAL               # ovl66:1445
    assert [d.row.state[SK.SELECT_ARMY + i] for i in range(8)] == [NORMAL] * n + [DISABLED] * (8 - n)
    st = g.state
    k = kit(g.app)
    i = st.selection.palette.index(h.id)
    from warlords2.rules.bonuses import battle_items, command_items
    v = min(h.strength + battle_items(st, h), 9)
    bonus = SK.hero_entry(k.exe, v) + command_items(st, h)                  # the hero alone selected
    assert SK.stack_strengths(k, st, st.selection) == {i: v + min(bonus, st.flags[0x112])}
    sel = d.work.selection                                                                   # one army left
    sel.palette, sel.palette_group, sel.palette_selected = sel.palette[:1], [0], [1]
    d.states()
    assert d.row.state[SK.GROUP_ALL] == d.row.state[SK.UNGROUP_ALL] == DISABLED


@gamedata
def test_stack_cancel_restores_and_ok_sends_the_arrays(game):
    a, g = game
    _select_capital(a, g)
    st = g.state
    h0 = st.hash()
    d = registry.open_dialog("stack", g)
    for id in (SK.SELECT_ARMY + 1, SK.UNGROUP_ALL, SK.GROUP_ALL):
        _press(a, d, id)
    assert st.hash() == h0                                       # edits stay in the dialog's copy
    _press(a, d, SK.CANCEL)                                      # ovl66:14fd
    assert not g.dialogs and st.hash() == h0
    lead = st.armies[st.selection.selected]
    ref = st.copy()
    apply(ref, C.GroupAll(lead.x, lead.y))
    d = registry.open_dialog("stack", g)
    _press(a, d, SK.GROUP_ALL)
    w = d.work.selection
    want = C.SetPalette(tuple(w.palette), tuple(w.palette_group), tuple(w.palette_selected))
    sent = []
    real = g.phase.apply
    g.phase.apply = lambda cmd, *x, **kw: (sent.append(cmd), real(cmd, *x, **kw))[1]
    a.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_RETURN, unicode="\r", mod=0, scancode=0)])
    while g.phase.busy():
        a.step([])
    assert sent == [want]                                        # ovl66:14d3 -> 000a
    assert not g.dialogs
    assert st.selection.moving == ref.selection.moving and len(st.selection.moving) == 2
    assert [x.group for x in st.armies] == [x.group for x in ref.armies]


@gamedata
def test_stack_ok_with_nothing_selected_is_refused(game):
    a, g = game
    _select_capital(a, g)
    st = g.state
    h0 = st.hash()
    d = registry.open_dialog("stack", g)
    d.work.selection.palette_selected = [0] * len(d.work.selection.palette)
    _press(a, d, SK.OK)                                          # SetPalette refused: no state change
    assert not g.dialogs and st.hash() == h0


@gamedata
def test_stack_select_army_with_none_selected_is_ignored(game, caplog):
    a, g = game
    _select_capital(a, g)
    d = registry.open_dialog("stack", g)
    sel = d.work.selection
    sel.palette_selected = [0] * len(sel.palette)
    before = (list(sel.palette_group), list(sel.palette_selected))
    with caplog.at_level(logging.WARNING):
        d.press(SK.SELECT_ARMY)
    assert (sel.palette_group, sel.palette_selected) == before
    assert any("ovl66:157d" in r.message for r in caplog.records)


@gamedata
def test_bonus_text_branches(game):
    a, g = game
    st, k = g.state, kit(g.app)
    S = lambda n, *x: k.text.S(SK.BONUS_GROUP, n, *x)
    types = {t: st.army_type(t) for t in range(29) if t != HERO_TYPE}
    for t, r in types.items():
        got = SK.bonus_text(k, st, t)
        if r.cancel_mode == 1 and not (r.special or all((r.stack_bonus_hills, r.stack_bonus_woods,
                                                          r.stack_bonus_open, r.stack_bonus_city))):
            assert got == S(SK.B_CANCEL_CITY)
        if r.cancel_mode in (2, 3):
            assert got == S(SK.B_CANCEL_HERO if r.cancel_mode == 2 else SK.B_CANCEL_STACK)
        if r.cancel_mode == 0 and r.special:
            assert got == S(SK.B_SPECIAL, r.stack_bonus_open)               # ovl66:1ad6: w10
    assert SK.bonus_text(k, st, HERO_TYPE) is None                          # uninitialised stack
    h = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == 0)
    h2 = st.copy().armies[h.id]
    h2.flags |= SK.ABOARD
    assert SK.bonus_text(k, st, HERO_TYPE, h2) == S(SK.B_BOAT)


@gamedata
def test_army_bonus_order_and_scrolling(game):
    a, g = game
    st = g.state
    d = registry.run_action(registry.MENU_ID["army_bonus"], g)
    assert d.dialog_id == "army_bonus"
    row = st.fight_order[st.current]
    assert [row[t] for t in d.order] == list(range(29))                    # ovl66:1e5b..1e88
    assert d.order.index(HERO_TYPE) >= AB.SHOWN_END                         # never shown
    assert d.row.state[AB.UP] == d.row.state[AB.PAGE_UP] == DISABLED
    _press(a, d, AB.DOWN)
    assert d.first == 1 and d.row.state[AB.UP] == NORMAL
    for want in (7, 13, 19, 21):
        _press(a, d, AB.PAGE_DOWN)
        assert d.first == want
    assert d.row.state[AB.DOWN] == d.row.state[AB.PAGE_DOWN] == DISABLED
    _press(a, d, AB.PAGE_UP)
    assert d.first == 15
    a.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE, unicode="\x1b", mod=0, scancode=0)])
    assert not g.dialogs                                                    # DS:1514 -> 490


@gamedata
def test_army_bonus_rejects_a_broken_order(game):
    a, g = game
    g.state.fight_order[g.state.current][0] = 40
    with pytest.raises(RuntimeError):
        AB.type_order(g.state)
