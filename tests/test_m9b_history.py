"""M9b package H: History > City / Events / Gold / Winners (ovl41:0000(0..3), JOIN screen 0x13) and
History > Triumphs (ovl41:09eb, JOIN screen 0x14)."""
import copy
import os
from fractions import Fraction

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import numpy as np  # noqa: E402
import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets.exe import ds_str  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.rules.history import stat_word  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import history as Hd  # noqa: E402
from warlords2.ui.dialogs.hero_offer import raw, sprintf  # noqa: E402
from warlords2.ui.dialogs.production import line  # noqa: E402
from warlords2.ui.info import Panel  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402
from warlords2.ui.screen import IDENTITY  # noqa: E402
from warlords2.ui.widgets import MARBLE, kit, picture_blit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
DISMISS = ("turn_start", "tutorial_page", "message", "level_up", "medal", "quest_reward")


def _key(k, uni=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=uni, mod=0, scancode=0)


def _top(g):
    d = getattr(g, "dialogs", None)
    return d.top if d is not None else None


def _drive(a, turn):
    """Hot seat on TUTORIA (sides 0 and 7, the rest off): end turns until the Knights' `turn`."""
    for _ in range(5000):
        g = a.manager.current_state()
        t = _top(g)
        tid = getattr(t, "dialog_id", None)
        st = getattr(g, "state", None)
        if st is not None and getattr(g, "phase_name", None) == "human" and not g.dialogs:
            if st.turn >= turn and st.current == 0:
                return g
            registry.run_action(registry.MENU_ID["end_turn"], g)
        elif tid == "production":
            t.press(192)
        elif tid == "hero_offer":
            t.press(287)
        a.step([UP] if tid in DISMISS else [])
    raise AssertionError("turn %d not reached" % turn)


@pytest.fixture(scope="module")
def app(game, tmp_path_factory):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "6", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--levels", "03333330",
                        "--user-dir", str(tmp_path_factory.mktemp("u"))]))
    yield a
    a.close()


@pytest.fixture
def g(app):
    """The Knights on turn 5 (4 records); history and flags put back after each test."""
    g = _drive(app, 5)
    st = g.state
    hist, flags = copy.deepcopy(st.history), dict(st.flags)
    yield g
    while g.dialogs:
        g.dialogs.top.close(None)
    st.history[:] = hist
    st.flags.clear()
    st.flags.update(flags)


def _open(g, name):
    registry.run_action(registry.MENU_ID[name], g)
    d = _top(g)
    g.app.step([])
    return d


# ------------------------------------------------------------------ arithmetic (no game data)


def test_round_bits_matches_float32():
    f32 = np.float32
    for a in range(-300, 341):
        for b in (140, 292, 314, 500, 7):
            want = Fraction(float(f32(a) / f32(b)))
            got = Hd.f32_div(a, b)
            assert abs(got - Fraction(a, b)) <= abs(want - Fraction(a, b))
            assert float(got) == float(f32(float(Fraction(a, b))))


def test_line_y_and_record_at():
    assert Hd.line_y(10, 10, 289, 140) == 149
    assert Hd.line_y(0, 10, 289, 140) == 289
    assert Hd.line_y(-50, 500, 289, 140) == 289 + 14          # chop toward zero, below the axis
    assert Hd.line_y(1, 3, 289, 140) == 289 - 46               # 140 * 0.333.. = 46.66 -> 46
    for n in (1, 2, 4, 7, 199, 200):
        rs = [Hd.record_at(300, 292, n, mx) for mx in range(300, 592)]
        assert rs[0] == 1 and rs[-1] == n and rs == sorted(rs)
        rb = [Hd.record_at(275, 314, n, mx) for mx in range(275, 589)]
        assert rb[0] == 1 and rb[-1] == n
    assert Hd.record_at(300, 292, 4, 373) == 2                 # 4 * 73 / 292 = 1.0 exactly


def test_shield_src():
    assert Hd.shield_src(0) == (0x70, 0x5E, 16, 14)
    assert Hd.shield_src(5) == (0x70 + 16, 0x5E + 14, 16, 14)
    assert Hd.shield_src(-1) == (0x70, 0x5E - 14, 16, 14)    # C division toward zero


# ------------------------------------------------------------------ registration and turn 1


@gamedata
def test_menu_ids_registered(app):
    for name in ("history_city", "history_events", "history_gold", "history_winners", "history_triumphs"):
        assert registry.has_action(registry.MENU_ID[name])


@gamedata
def test_turn_one_message_and_triumphs(g):
    """ovl41:0000: t = ovl61:225b() <= 1 -> the two-line message (0x5d, 0 / 1); mode 4 has no test."""
    st = g.state
    k = kit(g.app)
    t0 = st.turn
    try:
        for t in (0, 1):
            st.turn = t
            assert Hd.open_history(g, Hd.CITY).dialog_id == "message"
            assert _top(g).lines == [raw(k, Hd.G_EARLY, 0), raw(k, Hd.G_EARLY, 1)]
            _top(g).close(None)
            assert Hd.open_history(g, Hd.TRIUMPHS).dialog_id == "triumphs"
            _top(g).close(None)
        st.turn = 2
        d = Hd.open_history(g, Hd.EVENTS)
        assert d.dialog_id == "history" and d.n == 1
    finally:
        st.turn = t0


# ------------------------------------------------------------------ the history screen


@gamedata
def test_open_state_and_close_keys(g):
    st = g.state
    n = min(st.turn, Hd.MAX_TURN) - 1
    assert n == len(st.history) == 4
    for name, mode in (("history_city", 0), ("history_events", 1), ("history_gold", 2), ("history_winners", 3)):
        d = _open(g, name)
        assert d.dialog_id == "history" and d.mode == mode and d.r == d.n == n
        rs = d.row.state
        assert [rs[i] for i in Hd.MODE_IDS] == [PRESSED if i == mode else NORMAL for i in range(4)]
        assert rs[Hd.PREV] == NORMAL and rs[Hd.NEXT] == DISABLED and rs[Hd.CLOSE] == NORMAL
        assert d.areas == {Hd.AREA_GRAPH: mode != 1, Hd.AREA_BAR: mode == 1}
        d.update([_key(pygame.K_a, "A")], 16)                   # 'A'..'Z' ignored
        assert _top(g) is d
        key = pygame.K_ESCAPE if mode % 2 else pygame.K_RETURN
        d.update([_key(key)], 16)
        assert _top(g) is None


@gamedata
def test_steps_and_disabled_ends(g):
    d = _open(g, "history_city")
    for r in (3, 2, 1):
        d.press(Hd.PREV)
        assert d.r == r
    assert d.row.state[Hd.PREV] == DISABLED and d.row.state[Hd.NEXT] == NORMAL
    d.press(Hd.NEXT)
    assert d.r == 2 and d.row.state[Hd.PREV] == NORMAL


@gamedata
def test_cursor_saves_and_restores(g):
    d = _open(g, "history_city")
    x, y0, _, y1 = d.cursor
    assert (x, y0, y1) == (300 + 4 * 292 // 4, 148, 296)
    assert all(d.canvas.get_at_mapped((x, y)) == Hd.CURSOR_COLOUR for y in range(y0, y1 + 1))
    saved = list(d.saved)
    d.press(Hd.PREV)
    assert [d.canvas.get_at_mapped((x, y)) for y in range(y0, y1 + 1)] == saved
    assert d.cursor[0] == 300 + 3 * 292 // 4


@gamedata
def test_area_scrub_and_panel(g):
    d = _open(g, "history_city")
    d.poll((300, 200), {1})
    assert d.r == 1
    d.poll((591, 200), {1, 3})                                  # both held: a scrub too
    assert d.r == 4
    d.poll((299, 200), {1})                                     # outside area 10
    assert d.r == 4
    d.poll((400, 322), {1})                                     # area 11 is off in this mode
    assert d.r == 4
    d.poll((400, 200), {3})
    p = _top(g)
    assert isinstance(p, Panel)
    p.close(None)
    d.press(Hd.MODE_IDS[1])
    d.poll((276, 327), {1})
    assert d.r == 1
    d.poll((300, 200), {1})                                     # area 10 off in Events
    assert d.r == 1


@gamedata
def test_scrub_through_input_events(g):
    d = _open(g, "history_gold")
    down = pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(301, 200))
    g.app.input.feed([down])
    d.update([down], 16)
    assert d.r == 1


@gamedata
def test_graph_axes_and_lines(g):
    d = _open(g, "history_gold")
    cv = d.canvas
    px = cv.get_at_mapped
    assert px((300, 150)) == 15 and px((299, 149)) == 0 and px((300, 289)) == 15 and px((299, 288)) == 0
    assert px((296, 220)) == 15 and px((295, 219)) == 0 and px((446, 292)) == 15 and px((445, 291)) == 0
    st = g.state
    ref = pygame.Surface((640, 480), depth=8)
    ref.set_palette(IDENTITY)
    ymax = max([500] + [v for r in st.history for v in r["gold"]])
    prev = (301, 288)
    for r, rec in enumerate(st.history, 1):
        pt = (300 + r * 292 // 4, Hd.line_y(rec["gold"][7], ymax, 289, 140))
        line(ref, *prev, *pt, 1)
        prev = pt
    ink7 = st.flags[0xA0 + 14]
    pts = [(x, y) for x in range(301, 592) for y in range(150, 289) if ref.get_at_mapped((x, y)) == 1]
    assert pts and all(px(p) == ink7 for p in pts if p[0] != d.cursor[0])


@gamedata
def test_stat_lines(g):
    st = g.state
    k = kit(g.app)
    st.history[-1]["score"] = [0, 7, 3, 7, 0, 0, 0, 0]
    d = _open(g, "history_winners")
    assert d.stat_text() == sprintf(raw(k, Hd.G_STAT, 3), 4, st.players[1].name)
    d.close(None)
    st.history[-1]["score"] = [0] * 8
    d = _open(g, "history_winners")
    assert d.stat_text() == sprintf(raw(k, Hd.G_STAT, 3), 4, st.players[0].name)
    d.close(None)
    st.history[-1]["gold"][0] = 0xFFF6                          # a stored u16 read as a signed word
    d = _open(g, "history_gold")
    assert d.stat_text() == sprintf(raw(k, Hd.G_STAT, 2), 4, -10)


@gamedata
def test_event_texts(g):
    st = g.state
    k = kit(g.app)
    city, item = st.cities[2].name, st.items[3].name
    s0, s1 = st.players[0].name, st.players[1].name

    def fmt(i, *a):
        return sprintf(raw(k, Hd.G_EVENT, i), *a)

    cases = [
        ((0, 2, 0, "N"), fmt(0, "N", city)),
        ((1, 0xFFFF, 0, "N"), fmt(1, "N")),
        ((1, 0xFFFE, 0, "N"), fmt(2, "N")),
        ((1, 2, 0, "N"), fmt(3, "N", city)),
        ((2, 0, 0, "N"), fmt(4, "N")),
        ((3, 0, 0, "N"), fmt(5, "N")),
        ((4, 1, 0, ""), fmt(6, s1)),
        ((5, 0xFFFF, 2, "N"), fmt(7, "N", city)),
        ((5, 1, 2, ""), fmt(8, s1, city)),
        ((6, 100, 0, "N"), fmt(9, "N", raw(k, Hd.G_EVENT, 13))),
        ((6, 101, 0, "N"), fmt(9, "N", raw(k, Hd.G_EVENT, 14))),
        ((6, 102, 0, "N"), fmt(9, "N", raw(k, Hd.G_EVENT, 15))),
        ((6, 3, 0, "N"), fmt(9, "N", item)),
        ((7, 0, 0, ""), fmt(10, s0)),
        ((8, 1, 0, ""), fmt(16, s1, s0)),
        ((9, 0, 1, ""), fmt(11, s0, s1)),
        ((10, 1, 0, ""), fmt(12, s1, s0)),
        ((11, 0, 0, ""), "prev"),
        ((0xFF, 0, 0, ""), "prev"),
    ]
    for (kind, a, b, name), want in cases:
        assert Hd.event_text(st, k, kind, a, b, name, "prev") == want, kind
    assert fmt(11, s0, s1) == fmt(11, s0)                       # one %s: the second name is not used


@gamedata
def test_event_list_shields(g):
    st = g.state
    k = kit(g.app)
    st.history[-1]["events"] = [[0, 9, 0, 1, ""], [1, 4, 1, 0, ""]]
    d = _open(g, "history_events")
    f = k.fonts[Hd.CHANCE17]
    pic = k.picture(Hd.ATRANS)
    key = pic.get_colorkey()

    def shield_at(x, y, side):
        sx, sy, w, h = Hd.shield_src(side)
        for i in range(w):
            for j in range(h):
                c = pic.get_at((sx + i, sy + j))
                if c != key:
                    return d.canvas.get_at((x + i, y + j)) == c
        raise AssertionError("empty shield")

    assert shield_at(264, 150, 0) and shield_at(264, 167, 1)
    text0 = Hd.event_text(st, k, 9, 0, 1, "", "")
    assert shield_at(280 + (f.width(text0) >> 3 << 3) + 16, 150, 1)
    assert d.text == Hd.event_text(st, k, 4, 1, 0, "", "")      # DS:5c38 keeps the last entry


@gamedata
def test_bar(g):
    st = g.state
    d = _open(g, "history_events")
    ink, shadow = st.flags[0xA0], st.flags[0xB0]
    s = 4 * 314 // 4
    assert all(d.canvas.get_at_mapped((x, 325)) == ink for x in range(275, 275 + s))
    d.press(Hd.PREV)
    s = 3 * 314 // 4
    assert d.canvas.get_at_mapped((275 + s - 1, 325)) == ink
    assert all(d.canvas.get_at_mapped((x, 325)) == shadow for x in range(275 + s, 589))
    d.n, d.r = 40, 39                                           # s = 306: the tail is not repainted
    d.canvas.fill(99, (275, 322, 314, 11))
    d.bar(False)
    assert d.canvas.get_at_mapped((275 + 305, 325)) == ink and d.canvas.get_at_mapped((275 + 306, 325)) == 99


@gamedata
def test_mode_switch_restores(g):
    d = _open(g, "history_city")
    x = d.cursor[0]
    d.press(Hd.MODE_IDS[1])
    assert d.mode == 1 and d.canvas.get_at_mapped((x, 200)) != Hd.CURSOR_COLOUR
    d.press(Hd.MODE_IDS[0])
    assert d.canvas.get_at_mapped((x, 200)) == Hd.CURSOR_COLOUR


@gamedata
def test_markers_and_razed_cross(g):
    st = g.state
    d = _open(g, "history_city")
    sp = g.sprites
    owners = [0xFF] * len(st.cities)
    buf = pygame.Surface((224, 312), depth=8)
    buf.set_palette(IDENTITY)
    buf.fill(77)
    Hd.history_markers(sp, buf, st, owners)
    c = st.cities[-1]
    ref = pygame.Surface((224, 312), depth=8)
    ref.set_palette(IDENTITY)
    ref.fill(1)
    line(ref, 2 * c.x, 2 * c.y, 2 * c.x + 5, 2 * c.y + 5, 0)
    line(ref, 2 * c.x, 2 * c.y + 6, 2 * c.x + 5, 2 * c.y, 0)
    pts = [(x, y) for x in range(224) for y in range(312) if ref.get_at_mapped((x, y)) == 0]
    assert len(pts) >= 10 and all(buf.get_at_mapped(p) == 0 for p in pts)
    buf2 = buf.copy()
    buf2.fill(77)
    Hd.history_markers(sp, buf2, st, [0x0F] * len(st.cities))
    assert any(buf2.get_at_mapped(p) != 0 for p in pts)
    assert d.bitmap is not None


@gamedata
def test_marble_wraps_to_the_next_row(g):
    k = kit(g.app)
    pic = k.picture(MARBLE)
    cv = pygame.Surface((640, 480), depth=8)
    cv.set_palette(IDENTITY)
    picture_blit(cv, pic, (0, 0), (400, 10, 120, 3))
    for i in range(120):
        want = pic.get_at_mapped((400 + i, 10)) if 400 + i < 480 else pic.get_at_mapped((400 + i - 480, 11))
        assert cv.get_at_mapped((i, 0)) == want


@gamedata
def test_missing_records_raise(g):
    del g.state.history[-1]
    with pytest.raises(RuntimeError):
        Hd.History(g, 0)


@gamedata
def test_screens_are_read_only(g):
    st = g.state
    before = st.hash()
    for name in ("history_city", "history_events", "history_gold", "history_winners"):
        d = _open(g, name)
        d.press(Hd.PREV)
        d.poll((400, 200), {1})
        d.poll((400, 327), {1})
        for i in Hd.MODE_IDS:
            d.press(i)
        d.close(None)
    t = _open(g, "history_triumphs")
    t.press(Hd.SIDE_IDS[3])
    t.close(None)
    assert st.hash() == before


@gamedata
def test_panel_texts(g):
    d = _open(g, "history_city")
    k = kit(g.app)
    d.poll((400, 200), {3})
    p = _top(g)
    fb = pygame.Surface((640, 480), depth=8)
    fb.set_palette(IDENTITY)
    p.draw(fb)
    want = pygame.Surface((640, 480), depth=8)
    want.set_palette(IDENTITY)
    from warlords2.ui.info import POPUP, two_lines
    x, y, w, h = p.rect
    want.blit(k.picture(POPUP), (x, y), (0, 0, w, h))
    two_lines(k, ds_str(k.exe, 0x11FC), ds_str(k.exe, 0x120C))(want, x, y)
    assert pygame.image.tobytes(fb, "P") == pygame.image.tobytes(want, "P")


# ------------------------------------------------------------------ Triumphs


@gamedata
def test_triumphs(g):
    st = g.state
    k = kit(g.app)
    p = st.current
    st.flags[stat_word(p, p, 0)] = 1
    st.flags[stat_word(p, p, 2)] = 5
    st.flags[stat_word(p, p, 4)] = 0xFFFF                       # -1: nothing
    st.flags[stat_word(p, 7, 8)] = 2
    t = _open(g, "history_triumphs")
    assert t.dialog_id == "triumphs" and t.sel == p
    assert t.stat_lines() == [(177, sprintf(raw(k, 0x51, 0), 1)), (212, sprintf(raw(k, 0x52, 1), 5))]
    assert t.row.state[Hd.SIDE_IDS[p]] == PRESSED and t.row.state[Hd.T_CLOSE] == NORMAL
    t.press(Hd.SIDE_IDS[7])
    assert t.sel == 7 and t.row.state[Hd.SIDE_IDS[7]] == PRESSED and t.row.state[Hd.SIDE_IDS[p]] == NORMAL
    assert t.stat_lines() == [(317, sprintf(raw(k, 0x5A, 1), 2))]
    cells = k.picture(4)
    x = 128 + 48 * 7
    assert all(t.canvas.get_at_mapped((x + i, 109 + j)) == cells.get_at_mapped((400 + i, 40 + j))
               for i in range(0, 48, 7) for j in range(0, 2))
    down = pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(x + 4, 120))
    up = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(x + 4, 120))
    t.update([down, up], 16)                                    # the pressed side: rejected
    assert t.sel == 7
    t.update([_key(pygame.K_ESCAPE)], 16)
    assert _top(g) is None


@gamedata
def test_kit_popup_0x0a_runs_on(g):
    """Kit.draw_popup(0x0a): MARBLE (480 wide) read on into its next rows for 576 px."""
    k = kit(g.app)
    pic = k.picture(MARBLE)
    cv = pygame.Surface((640, 480), depth=8)
    cv.set_palette(IDENTITY)
    k.draw_popup(cv, 0x0A)
    x, y, w, h = k.popup_rect[0x0A]
    for i in (0, 479, 480, 575):
        want = pic.get_at_mapped((i, 5)) if i < 480 else pic.get_at_mapped((i - 480, 6))
        assert cv.get_at_mapped((x + i, y + 5)) == want


def _ev(kind, button, pos):
    return pygame.event.Event(kind, button=button, pos=pos)


@gamedata
def test_right_added_while_scrubbing_keeps_scrubbing(g):
    """0726:0415 / 0441: the panel only for mask 2 (right alone); mask 3 scrubs."""
    d = _open(g, "history_city")
    inp = g.app.input
    left = _ev(pygame.MOUSEBUTTONDOWN, 1, (301, 200))
    inp.feed([left])
    d.update([left], 16)
    assert d.r == 1
    right = _ev(pygame.MOUSEBUTTONDOWN, 3, (590, 200))
    motion = pygame.event.Event(pygame.MOUSEMOTION, pos=(590, 200), rel=(289, 0), buttons=(1, 0, 1))
    inp.feed([motion, right])
    d.update([motion, right], 16)
    assert _top(g) is d and d.r == 4
    for b in (1, 3):
        e = _ev(pygame.MOUSEBUTTONUP, b, (590, 200))
        inp.feed([e])
        d.update([e], 16)
    right = _ev(pygame.MOUSEBUTTONDOWN, 3, (400, 200))
    inp.feed([right])
    d.update([right], 16)
    assert isinstance(_top(g), Panel)
    up = _ev(pygame.MOUSEBUTTONUP, 3, (400, 200))
    inp.feed([up])


@gamedata
def test_no_help_while_a_button_is_held(g, monkeypatch):
    """08a9:0143: a right press over a button shows no help while DS:166c (a left press held
    on a live button) is set."""
    calls = []
    monkeypatch.setitem(registry._right_click, "button", lambda host, id, pos: calls.append(id))
    d = _open(g, "history_city")
    inp = g.app.input
    done = d.row.at((520, 350))
    down = _ev(pygame.MOUSEBUTTONDOWN, 1, (520, 350))
    inp.feed([down])
    d.update([down], 16)
    assert d.row.held is done
    r = _ev(pygame.MOUSEBUTTONDOWN, 3, (400, 350))
    inp.feed([r])
    d.update([r], 16)
    assert calls == []
    for e in (_ev(pygame.MOUSEBUTTONUP, 3, (400, 350)), _ev(pygame.MOUSEBUTTONUP, 1, (600, 400))):
        inp.feed([e])
        d.update([e], 16)
    assert d.row.held is None and _top(g) is d
    r = _ev(pygame.MOUSEBUTTONDOWN, 3, (400, 350))
    inp.feed([r])
    d.update([r], 16)
    assert calls == [Hd.PREV]
    inp.feed([_ev(pygame.MOUSEBUTTONUP, 3, (400, 350))])
    t = _open(g, "history_triumphs")
    down = _ev(pygame.MOUSEBUTTONDOWN, 1, (500, 360))
    inp.feed([down])
    t.update([down], 16)
    r = _ev(pygame.MOUSEBUTTONDOWN, 3, (200, 120))
    inp.feed([r])
    t.update([r], 16)
    assert calls == [Hd.PREV]
    inp.feed([_ev(pygame.MOUSEBUTTONUP, 3, (200, 120)), _ev(pygame.MOUSEBUTTONUP, 1, (600, 400))])


@gamedata
def test_popup_input_no_help_while_held(g, monkeypatch):
    """keys.popup_input, the shared loop of the other JOIN-screen pop-ups: the same 08a9:0143 rule."""
    from warlords2.ui.dialog import Dialog
    from warlords2.ui.keys import popup_input
    from warlords2.ui.widgets import ButtonRow
    calls = []
    monkeypatch.setitem(registry._right_click, "button", lambda host, id, pos: calls.append(id))
    k = kit(g.app)
    lay = k.layouts.screen(Hd.SCREEN)
    d = Dialog()
    d.host = g
    g.dialogs.push(d)
    row = ButtonRow(list(lay.buttons), k.picture)
    inp = g.app.input
    evs = [_ev(pygame.MOUSEBUTTONDOWN, 1, (520, 350)), _ev(pygame.MOUSEBUTTONDOWN, 3, (400, 350))]
    inp.feed(evs)
    popup_input(d, evs, row, k.exe, lambda id: False)
    assert row.held is not None and calls == []
    evs = [_ev(pygame.MOUSEBUTTONUP, 3, (400, 350)), _ev(pygame.MOUSEBUTTONUP, 1, (600, 400)),
           _ev(pygame.MOUSEBUTTONDOWN, 3, (400, 350)), _ev(pygame.MOUSEBUTTONUP, 3, (400, 350))]
    inp.feed(evs)
    popup_input(d, evs, row, k.exe, lambda id: False)
    assert calls == [Hd.PREV]


@gamedata
def test_event_text_buffer_kept_across_opens(g):
    """DS:5c38 is static DGROUP: a kind outside 0..10 shows the last text of an earlier open."""
    st = g.state
    k = kit(g.app)
    st.history[-1]["events"] = [[0, 4, 1, 0, ""]]
    d = _open(g, "history_events")
    first = Hd.event_text(st, k, 4, 1, 0, "", "")
    assert d.text == first
    d.close(None)
    st.history[-1]["events"] = [[0, 11, 0, 0, ""]]
    d = _open(g, "history_events")
    assert d.text == first and g.app.history_event_text == first
