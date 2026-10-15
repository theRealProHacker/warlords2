"""M9b package M: About (497), the shortcut editor (499), Signpost (519), Resign (509), Disband
(508) and Move All (507) (ovl49, ovl14, ovl13, 0b62:06bf, 0c8c:04c4)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import struct  # noqa: E402

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets.exe import ds_str  # noqa: E402
from warlords2.assets.fonts import CHANCE17  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.rules import economy, signs  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import about as AB  # noqa: E402
from warlords2.ui.dialogs import order_menu as OM  # noqa: E402
from warlords2.ui.dialogs import resign as RS  # noqa: E402
from warlords2.ui.dialogs import shortcuts as SC  # noqa: E402
from warlords2.ui.dialogs import signpost as SP  # noqa: E402
from warlords2.ui.dialogs.popup_help import help_texts  # noqa: E402
from warlords2.ui.keys import ESC_LIST, RETURN_LIST, ds_list  # noqa: E402
from warlords2.ui.palettes import BUTTON_PCK, SHORTCUT_LARGE_AT, shortcut_ids  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
STACK, SIGN = (86, 8), (84, 10)              # ERYTHEA: side 0's hero and army in Mirea; sign 0


def key(k, ch):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


ESC, RET, LETTER = key(pygame.K_ESCAPE, "\x1b"), key(pygame.K_RETURN, "\r"), key(pygame.K_a, "A")


def _top(g):
    d = getattr(g, "dialogs", None)
    return d.top if d is not None else None


def _tid(g):
    return getattr(_top(g), "dialog_id", None)


def _human(a, n=600):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        tid = _tid(g)
        if tid == "production":
            _top(g).press(192)
        elif tid == "hero_offer":
            _top(g).press(287)
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message") else [])
    raise AssertionError("human phase not reached")


def _idle(a, g, n=400):
    for _ in range(n):
        if not g.phase.busy() and not g.dialogs:
            return
        a.step([])
    raise AssertionError("still busy")


@pytest.fixture
def app(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1", "--scenario", "ERYTHEA",
                        "--controls", "HCCCCCCC", "--user-dir", str(tmp_path / "u")]))
    yield a
    a.close()


def _draw(g):
    fb = g.app.screen.fb
    g.paint(fb)
    g.dialogs.draw(fb)
    return fb


def _same(fb, pic, dst, src, w, h) -> bool:
    return all(fb.get_at_mapped((dst[0] + x, dst[1] + y)) == pic.get_at_mapped((src[0] + x, src[1] + y))
               for x in range(w) for y in range(h))


def _texts(monkeypatch, module):
    """Every text_centred call of a module: (x, y, text, ink, shadow)."""
    got = []
    real = module.text_centred

    def rec(fb, font, x, y, s, ink, shadow):
        got.append((x, y, s, ink, shadow))
        real(fb, font, x, y, s, ink, shadow)
    monkeypatch.setattr(module, "text_centred", rec)
    return got


def _on_sign(a, g):
    g.phase.apply(C.SelectStack(*STACK))
    g.phase.move_to(SIGN)
    _idle(a, g)
    assert signs.sign_at(g.state) == 0


# ------------------------------------------------------------------ registry and EXE lists


@gamedata
def test_registered_and_key_lists(app):
    for name in ("about", "shortcuts", "move_all", "disband", "signpost", "resign"):
        assert registry.has_action(registry.MENU_ID[name])
    for d in ("about", "shortcuts", "signpost", "resign", "disband_confirm"):
        assert registry.has_dialog(d)
    assert registry.event_views(E.DisbandPrompt) == [OM.disband_prompt]
    for w2 in range(33, 37):
        assert registry.help_selector_for(w2) is SC.shortcut_help
    k = kit(app)
    assert [k.text.hlp(179 + i)["word2"] for i in range(4)] == [33, 34, 35, 36]
    esc, ret = set(ds_list(k.exe, ESC_LIST)), set(ds_list(k.exe, RETURN_LIST))
    for both in (294, 421, 489):
        assert both in esc and both in ret
    for neither in (487, 488, 422, 423, *range(295, 320)):
        assert neither not in esc and neither not in ret


# ------------------------------------------------------------------ About


@gamedata
def test_about_lines_and_wait(app, monkeypatch):
    g = _human(app)
    k = kit(app)
    t = k.text.group(139)
    assert AB.lines(k, (1999, 12000, 7)) == [t[0], t[1], ds_str(k.exe, 0x1292), t[3],
                                              t[4].replace("%lu", "1"), t[5].replace("%lu", "12"),
                                              t[6].replace("%lu", "0")]
    closed = []
    g.settings_closed = lambda: closed.append(1)
    assert g.bar.bar.key(g, ord("?"))                    # 07be:0337 '?' -> 029f
    d = _top(g)
    assert d.dialog_id == "about"
    got = _texts(monkeypatch, AB)
    _draw(g)
    want = AB.lines(k)
    assert [(x, y, s) for x, y, s, _, _ in got] == [(328, 181, want[2]), (328, 221, want[4]),
                                                    (328, 241, want[5]), (328, 261, want[6])]
    assert {(i, s) for _, _, _, i, s in got} == {(0, 7)}
    d.update([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(10, 10))], 16)
    assert _top(g) is d                                  # a press does not end the wait
    d.update([LETTER], 16)
    assert not g.dialogs and closed == []                # any key; no ovl61:011f
    registry.run_action(497, g)
    _top(g).update([pygame.event.Event(pygame.MOUSEBUTTONUP, button=3, pos=(10, 10))], 16)
    assert not g.dialogs


# ------------------------------------------------------------------ Shortcuts


@gamedata
def test_shortcuts_edit_and_done(app):
    g = _human(app)
    k = kit(app)
    recs = SC.records(k)
    old = shortcut_ids(app)
    assert not (app.user.root / "UDB").exists()          # reading UDB.CUR makes no directory
    closed = []
    g.settings_closed = lambda: closed.append(1)
    assert g.bar.bar.key(g, 0x116)                       # Alt-U -> 07be:02d2
    d = _top(g)
    assert d.dialog_id == "shortcuts" and d.cur == 0
    assert d.slots == [SC.index_of(recs, i) for i in old] and -1 not in d.slots
    assert d.row.at((350, 110)).id == 297 and d.row.at((260, 110)).id == 296   # BUTTON.DAT x 300
    assert d.row.at((420, 110)).id == 297 and d.row.at((500, 110)) is None
    d.press(318)                                         # 00e9(2)
    assert d.cur == 2 and k.shortcut_slot == 2
    d.press(296)                                         # 0053(1): record 1 into slot 2
    assert d.slots[2] == 1 and d.slots[:2] == [SC.index_of(recs, i) for i in old[:2]]
    fb = _draw(g)
    art = k.picture(SC.MENUBUTT)
    x, y, w, h = recs[1]["rect_large"]
    assert _same(fb, art, (248, 100), (x + w // 2, y, w // 2, h), w // 2, h)       # chosen: right half
    x0, y0, w0, h0 = recs[0]["rect_large"]
    assert _same(fb, art, (96, 100), (x0, y0, w0 // 2, h0), w0 // 2, h0)
    sx, sy, _, _ = recs[1]["rect_large"]
    assert fb.get_at_mapped((176, 342)) == 9 and fb.get_at_mapped((176 + 31, 342 + 28)) == 9   # outline
    assert fb.get_at_mapped((136, 342)) == art.get_at_mapped(tuple(recs[d.slots[1]]["rect_large"][:2]))
    assert _same(fb, art, (177, 343), (sx + 1, sy + 1, 30, 27), 30, 27)          # slot 2 inside
    d.update([RET], 16)                                  # Return -> 294
    assert not g.dialogs and closed == [1]
    data = app.user.path(SC.CUR_FILE).read_bytes()
    new = [old[0], old[1], recs[1]["button_id"], old[3]]
    assert list(struct.unpack("<4H", data)) == new
    assert shortcut_ids(app) == new and g.phase.palette.shortcuts == new
    sheet = g.phase.palette.row.picture(BUTTON_PCK)
    assert _same(sheet, art, SHORTCUT_LARGE_AT[2], recs[1]["rect_large"], 64, 29)
    registry.run_action(499, g)
    d = _top(g)
    assert d.cur == 2 and d.slots[2] == 1                # DS:055a and the ids kept
    d.update([ESC], 16)
    assert not g.dialogs and closed == [1, 1]


@gamedata
def test_shortcut_help(app):
    g = _human(app)
    k = kit(app)
    recs = SC.records(k)
    ids = shortcut_ids(app)
    title = ds_str(k.exe, 0x5E6)
    for i in range(4):
        name = next(r["name"] for r in recs if r["button_id"] == ids[i])
        assert help_texts(g, 179 + i) == (title, name)
    g.phase.palette.shortcuts = [0, ids[1], ids[2], ids[3]]
    assert help_texts(g, 179) == (title, recs[-1]["name"])        # 050b: no match, the last read


# ------------------------------------------------------------------ Signpost


@gamedata
def test_signpost(app, monkeypatch):
    g = _human(app)
    st = g.state
    assert registry.run_action(519, g) is None and not g.dialogs     # no stack
    g.phase.apply(C.SelectStack(*STACK))
    assert registry.run_action(519, g) is None and not g.dialogs     # not on the sign
    g.phase.move_to(SIGN)
    _idle(app, g)
    s = st.world.signs[0]
    l1, l2 = s.line1, s.line2
    assert g.bar.bar.key(g, ord("x"))
    d = _top(g)
    assert d.dialog_id == "signpost" and d.sign == 0 and d.lines == [l1, l2]
    k = kit(app)
    got = _texts(monkeypatch, SP)
    _draw(g)
    assert [(x, y, s_) for x, y, s_, _, _ in got] == [(320, 94, ds_str(k.exe, 0x3EB)), (320, 140, ds_str(k.exe, 0x3F7)),
                                                      (320, 160, ds_str(k.exe, 0x410))]
    d.update([LETTER], 16)
    assert _top(g) is d
    d.press(422)
    e = _top(g)
    assert e.dialog_id == "hero_name" and e.rect == (200, 190, 240, 22) and e.old == l1
    assert e.max_len == 0x1E and e.max_width == 0xD8 and e.text == ""
    e.update([key(pygame.K_q, "Q"), key(pygame.K_z, "z"), RET], 16)
    e2 = _top(g)
    assert d.lines[0] == "Qz" and e2.dialog_id == "hero_name" and e2.rect == (200, 215, 240, 22)
    e2.update([key(pygame.K_w, "w"), ESC], 16)            # Esc: the old line 2
    assert _top(g) is d and d.lines == ["Qz", l2]
    d.press(423)
    e3 = _top(g)
    assert e3.rect == (200, 215, 240, 22)
    e3.update([key(pygame.K_b, "b"), RET], 16)
    assert _top(g) is d and d.lines == ["Qz", "b"]       # 423 alone: no further editor
    assert (s.line1, s.line2) == (l1, l2)                # nothing written before OK
    d.update([ESC], 16)                                  # Esc -> 421
    assert not g.dialogs and (s.line1, s.line2) == ("Qz", "b")


@gamedata
def test_signpost_typing_limit(app):
    g = _human(app)
    _on_sign(app, g)
    registry.run_action(519, g)
    _top(g).press(423)
    e = _top(g)
    e.update([key(pygame.K_i, "i")] * 40, 16)
    assert e.text == "i" * (0x1E - 1)                    # ovl56:0495: length < 0x1e - 1 before a key
    e.update([RET], 16)
    _top(g).press(423)
    w = _top(g)
    w.update([key(pygame.K_m, "M")] * 40, 16)
    f = kit(app).fonts[CHANCE17]
    assert f.width(w.text[:-1]) < 0xD8 <= f.width(w.text) and len(w.text) < 0x1E - 1
    w.update([RET], 16)
    _top(g).press(421)
    assert g.state.world.signs[0].line2 == w.text


# ------------------------------------------------------------------ Disband, Move All


@gamedata
def test_disband_no_and_yes(app):
    g = _human(app)
    st = g.state
    k = kit(app)
    assert registry.run_action(508, g) is None and not g.dialogs     # no stack: 06d0
    g.phase.apply(C.SelectStack(*STACK))
    hero = st.selection.selected
    assert st.armies[hero].type_id == 0x1C
    assert g.bar.bar.key(g, ord("q"))
    app.step([])
    d = _top(g)
    assert d.dialog_id == "disband_confirm" and isinstance(st.pending, E.DisbandPrompt)
    assert d.title == ds_str(k.exe, 0x2BF8)
    assert d.lines == [ds_str(k.exe, o) for o in (0x2C00, 0x2C11, 0x2C26, 0x2BE5)]
    assert d.pos == [tuple(p) for p in d.pos] and len(d.pos) == 4
    d.update([ESC], 16)                                  # 190: no
    _idle(app, g)
    assert st.pending is None and st.armies[hero].owner == 0
    g.phase.apply(C.SelectStack(*STACK))
    registry.run_action(508, g)
    app.step([])
    _top(g).update([RET], 16)                            # 189: yes
    _idle(app, g)
    assert st.pending is None and st.armies[hero].owner == 0xFF and st.selection.selected == -1


@gamedata
def test_disband_line_without_heroes(app):
    k = kit(app)
    title, lines = OM.texts(k, False)
    assert len(lines) == 4 and lines[3] == "" and lines[:3] == OM.texts(k, True)[1][:3]


@gamedata
def test_move_all(app):
    g = _human(app)
    st = g.state
    g.phase.apply(C.SelectStack(*STACK))
    g.phase.set_path(SIGN)
    hero = st.selection.selected                         # 0c8c:04ca: the selected stack first
    sent = []
    real = g.phase.apply
    g.phase.apply = lambda cmd, *a, **kw: sent.append(cmd) or real(cmd, *a, **kw)
    assert g.bar.bar.key(g, ord("m"))
    assert sent == [C.MoveAll()]
    _idle(app, g)
    assert (st.armies[hero].x, st.armies[hero].y) == SIGN


# ------------------------------------------------------------------ Resign


def _record(g, monkeypatch):
    """The order of the Resign commands and the messages shown."""
    log = []
    real_apply = g.phase.apply
    monkeypatch.setattr(g.phase, "apply", lambda cmd, *a, **kw: log.append(cmd) or real_apply(cmd, *a, **kw))
    real_open = registry.open_dialog

    def opened(id, host, **kw):
        if id == "message":
            log.append(tuple(kw["lines"]))
        return real_open(id, host, **kw)
    monkeypatch.setattr(registry, "open_dialog", opened)
    return log


def _messages(a, g):
    for _ in range(10):
        if _tid(g) != "message":
            return
        _top(g).update([LETTER], 16)


@gamedata
def test_resign_dialog_and_keep_playing(app, monkeypatch):
    g = _human(app)
    k = kit(app)
    closed = []
    g.settings_closed = lambda: closed.append(1)
    before = g.state.hash()
    assert g.bar.bar.key(g, ord("r"))
    d = _top(g)
    assert d.dialog_id == "resign" and [b.id for b in d.row.buttons] == [487, 488, 489]
    got = _texts(monkeypatch, RS)
    _draw(g)
    t = k.text.group(165)
    assert [(x, y, s) for x, y, s, _, _ in got] == [(320, 92, t[0]), (320, 140, t[1]), (320, 160, t[2]),
                                                    (320, 180, t[3])]
    d.update([LETTER], 16)
    assert _top(g) is d
    d.update([ESC], 16)                                  # 489
    assert not g.dialogs and closed == [1] and g.state.hash() == before
    registry.run_action(509, g)
    _top(g).update([RET], 16)
    assert not g.dialogs and closed == [1, 1] and g.state.hash() == before


@gamedata
def test_resign_graciously_talks_first(app, monkeypatch):
    g = _human(app)
    t = kit(app).text.group(165)
    log = _record(g, monkeypatch)
    registry.run_action(509, g)
    _top(g).press(487)
    _messages(app, g)
    assert log == [(t[6],), (t[7],), (t[8],), (t[9], t[10]), C.Resign(True)]
    _idle(app, g)
    st = g.state
    assert economy.city_count(st, 0) == 0 and not any(a.owner == 0 for a in st.armies)


@gamedata
def test_resign_ungraciously_burns_first(app, monkeypatch):
    g = _human(app)
    t = kit(app).text.group(165)
    log = _record(g, monkeypatch)
    n = economy.cached_cities(g.state, 0)
    registry.run_action(509, g)
    _top(g).press(488)
    assert log == [C.Resign(False), (t[4], t[5])] and economy.city_count(g.state, 0) == 0
    _messages(app, g)
    assert not g.dialogs
    assert economy.cached_cities(g.state, 0) == n > 0              # the burning runs no ovl62:03f9
    registry.run_action(509, g)                                    # so 151c lets it open again
    assert _tid(g) == "resign"


@gamedata
def test_resign_refused_shows_nothing(app, monkeypatch):
    g = _human(app)
    log = _record(g, monkeypatch)
    registry.run_action(509, g)
    monkeypatch.setattr(g.phase, "apply", lambda cmd, *a, **kw: log.append(cmd) and None)
    _top(g).press(488)
    assert log == [C.Resign(False)] and not g.dialogs              # no message after a refusal
    for c in g.state.cities:
        c.owner = 0x0F if c.owner == 0 else c.owner
    assert registry.run_action(509, g) is not None                 # 151c reads DS:5dea, not owners
    _top(g).press(489)
    g.state.city_counts[0] = 0
    assert registry.run_action(509, g) is None and not g.dialogs  # DS:5dea[0] == 0 (151c)


def _over(g):
    from warlords2.states.phases.over import Over
    ph = Over(g)
    ph.enter()
    g.phase, g.phase_name = ph, "over"
    return ph


@gamedata
def test_order_menu_in_the_over_phase(app):
    """After the victory only the main loop has ended (ovl61:2236..2252); 07be:01fc / 0225 /
    0268 / 022d test no victory flag, so the orders work as in the human phase."""
    g = _human(app)
    st = g.state
    ph = _over(g)
    sent = []
    real = ph.apply
    ph.apply = lambda cmd, *a, **kw: sent.append(cmd) or real(cmd, *a, **kw)
    ph.apply(C.SelectStack(*STACK))
    ph.set_path(SIGN)
    hero = st.selection.selected
    assert g.bar.bar.key(g, ord("m"))
    _idle(app, g)
    assert C.MoveAll() in sent and (st.armies[hero].x, st.armies[hero].y) == SIGN
    assert g.bar.bar.key(g, ord("x")) and _tid(g) == "signpost"
    _top(g).update([RET], 16)
    assert isinstance(sent[-1], C.EditSign)
    assert g.bar.bar.key(g, ord("q"))
    app.step([])
    assert _tid(g) == "disband_confirm"
    _top(g).update([ESC], 16)
    assert sent[-1] == C.ConfirmDisband(False)
    _idle(app, g)
    assert g.bar.bar.key(g, ord("r")) and _tid(g) == "resign"
    _top(g).press(488)
    assert sent[-1] == C.Resign(False)


@gamedata
def test_search_and_plant_flag_go_through_the_over_phase(app):
    from warlords2.ui.dialogs import hero_inspect as HI
    from warlords2.ui.dialogs import search_result as SR
    g = _human(app)
    ph = _over(g)
    sent = []
    ph.apply = lambda cmd, *a, **kw: sent.append(cmd) or []
    st = g.state
    st.selection.selected = st.selection.hero = next(a.id for a in st.armies if a.owner == 0 and a.type_id == 0x1C)
    SR.search(g)
    HI.plant_flag(g)
    assert [type(c) for c in sent] == [C.Search, C.PlantFlag]


@gamedata
def test_keys_after_return_go_to_the_next_editor(app):
    """ovl59:020d reads one key at a time: what follows Return in the buffer is line 2's."""
    g = _human(app)
    _on_sign(app, g)
    registry.run_action(519, g)
    d = _top(g)
    d.press(422)
    _top(g).update([key(pygame.K_a, "a"), RET, key(pygame.K_b, "b"), RET, RET], 16)
    assert not g.dialogs and g.state.world.signs[0].line1 == "a" and g.state.world.signs[0].line2 == "b"


@gamedata
def test_signpost_empty_return_and_esc_send_the_edit(app):
    """ovl56:03a6: the buffer starts empty (03e2..03eb), Return writes it even empty (0575), Esc
    keeps the old line (045b); OK sends both lines."""
    g = _human(app)
    _on_sign(app, g)
    s = g.state.world.signs[0]
    old2 = s.line2
    sent = []
    real = g.phase.apply
    g.phase.apply = lambda cmd, *a, **kw: sent.append(cmd) or real(cmd, *a, **kw)
    registry.run_action(519, g)
    _top(g).press(422)
    e = _top(g)
    assert e.text == ""
    e.update([key(pygame.K_LEFTBRACKET, "{"), key(pygame.K_BACKQUOTE, "~"), RET], 16)   # > 0x7a: ignored
    _top(g).update([key(pygame.K_c, "c"), ESC], 16)
    _top(g).press(421)
    assert sent == [C.EditSign(0, "", old2)] and (s.line1, s.line2) == ("", old2)


@gamedata
def test_signpost_ok_refreshes_once(app):
    """ovl13:0486 -> one ovl61:0000(0, 0): `Human.apply`'s palette refresh."""
    g = _human(app)
    _on_sign(app, g)
    n = []
    real = g.phase.refresh
    g.phase.refresh = lambda: n.append(1) or real()
    registry.run_action(519, g)
    _top(g).press(421)
    assert n == [1]


# ------------------------------------------------------------------ About figures (X39)


@gamedata
def test_about_figures_fixed_in_deterministic_runs(app, monkeypatch):
    monkeypatch.setattr(AB, "heap_figures", lambda: (5_000_000, 4_000_000, 3_000_000))
    assert app.cfg.fixed_dt and AB.figures(app) == AB.FIXED == (0, 0, 0)
    g = _human(app)
    registry.run_action(497, g)
    assert _top(g).lines == AB.lines(kit(app), (0, 0, 0))


@gamedata
def test_about_figures_measured_and_dwords(app, monkeypatch):
    monkeypatch.setattr(app.cfg, "fixed_dt", False)
    monkeypatch.setattr(AB, "heap_figures", lambda: (5_000_000_000, 123_999, -7))
    assert AB.figures(app) == (0xFFFFFFFF, 123_999, 0)
    g = _human(app)
    registry.run_action(497, g)
    t = kit(app).text.group(139)
    assert _top(g).lines[4:] == [t[4].replace("%lu", "4294967"), t[5].replace("%lu", "123"),
                                 t[6].replace("%lu", "0")]


def test_heap_figures_sources(monkeypatch):
    import resource
    a, b, c = AB.heap_figures()
    assert a > 0 and 0 < b <= a and c > 0
    mem = {("/proc/meminfo", "MemAvailable"): 8 << 30, ("/proc/self/status", "VmRSS"): 50 << 20}
    monkeypatch.setattr(AB, "_meminfo", lambda path, k: mem.get((path, k)))
    monkeypatch.setattr(resource, "getrlimit", lambda r: (1 << 30, resource.RLIM_INFINITY)
                        if r == resource.RLIMIT_AS else (resource.RLIM_INFINITY,) * 2)
    assert AB.heap_figures() == (8 << 30, 1 << 30, 50 << 20)
    mem.clear()                                          # no /proc: sysconf / getrusage
    monkeypatch.setattr(AB.os, "sysconf", lambda n: {"SC_AVPHYS_PAGES": 3, "SC_PAGE_SIZE": 4096}[n])
    monkeypatch.setattr(resource, "getrusage", lambda w: type("R", (), {"ru_maxrss": 7})())
    assert AB.heap_figures() == (3 * 4096, 3 * 4096, 7 * 1024)

    def none(n):
        raise ValueError(n)
    monkeypatch.setattr(AB.os, "sysconf", none)
    assert AB.heap_figures()[0] == 0


def test_meminfo_reads_kb_lines(tmp_path):
    f = tmp_path / "meminfo"
    f.write_text("MemTotal:  100 kB\nMemAvailable:   2048 kB\n")
    assert AB._meminfo(str(f), "MemAvailable") == 2048 * 1024
    assert AB._meminfo(str(f), "VmRSS") is None and AB._meminfo(str(tmp_path / "x"), "MemTotal") is None
