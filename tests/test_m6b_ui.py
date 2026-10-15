"""M6b: the city screen (production, city info, build, vectoring), Build Production, View -> Cities,
raze / rename and the city right-click panel."""
import logging
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.rules.economy import s16  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import production as P  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
QUICK_START = "0,0,0,0,0,0,0,1,0,0"            # Quick Start (option word 8, SCN 0x128): three cities for the Knights
ORIGIN, ZEKOND, FARAWAY = 2, 3, 5             # TUTORIA city records of side 0 with Quick Start


def _app(game, tmp_path, *extra):
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                           "--controls", "HCCCCCCH", "--user-dir", str(tmp_path / "u"), *extra]))


def _top(a):
    g = a.manager.current_state()
    t = g.dialogs.top if getattr(g, "dialogs", None) else None
    return g, t, (getattr(t, "dialog_id", type(t).__name__) if t is not None else None)


def _ev(kind, pos, scale, **kw):
    return pygame.event.Event(kind, pos=(pos[0] * scale, pos[1] * scale), **kw)


def _click(a, pos, button=1):
    s = a.cfg.scale
    a.step([_ev(pygame.MOUSEMOTION, pos, s, rel=(0, 0), buttons=(0, 0, 0)),
            _ev(pygame.MOUSEBUTTONDOWN, pos, s, button=button), _ev(pygame.MOUSEBUTTONUP, pos, s, button=button)])


def _press(a, bid):
    _, b = kit(a).layouts.find_button(bid)
    x, y, w, h = b.rect
    _click(a, (x + w // 2, y + h // 2))


def _key(a, key, text=""):
    a.step([pygame.event.Event(pygame.KEYDOWN, key=key, unicode=text, mod=0, scancode=0),
            pygame.event.Event(pygame.KEYUP, key=key, unicode=text, mod=0, scancode=0)])


def _square(x, y):
    """Screen point of map square (x, y) in the city screen's map (area 6)."""
    return 80 + 2 * x + 1, 60 + 2 * y + 1


def _dismiss(a):
    while _top(a)[2] == "tutorial_page":
        a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(0, 0))])
        a.step([])


def _screen(a, pages=None):
    """Up to the turn-1 production screen (TurnCue city_screen, ovl68:0588), the hero offer accepted."""
    for _ in range(400):
        g, t, i = _top(a)
        if i == "production":
            a.step([])
            seen = []
            while _top(a)[2] == "tutorial_page":
                seen.append(_top(a)[1])
                a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(0, 0))])
                a.step([])
            if pages is not None:
                pages.extend(seen)
            return g, t
        if i == "hero_offer":
            _press(a, 287)
            continue
        a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(0, 0))] if i in ("turn_start", "tutorial_page")
               else [])
    raise AssertionError("no production screen; at %r" % (_top(a)[2],))


@pytest.fixture
def quick(game, tmp_path):
    a = _app(game, tmp_path, "--options", QUICK_START)
    yield a
    a.close()


@pytest.fixture
def plain(game, tmp_path):
    a = _app(game, tmp_path)
    yield a
    a.close()


def test_registrations():
    registry.load_all()
    for n in range(1, 25):
        assert registry.help_selector_for(n) is P.production_help
    for name in ("build", "cities", "production", "vectoring"):
        assert registry.has_action(registry.MENU_ID[name])
    for d in ("production", "build_production", "rename_city", "raze_confirm", "info/city", "info/army_type"):
        assert registry.has_dialog(d)
    assert registry.left_click_handler("city") is P.city_click
    assert registry.right_click_handler("city") is not None


def test_line_like_1133_00b8():
    buf = pygame.Surface((20, 20), depth=8)
    buf.fill(0)
    P.line(buf, 2, 2, 2, 2, 7)
    assert pygame.surfarray.array2d(buf).sum() == 0                 # one point: nothing
    P.line(buf, 5, 5, 0, 0, 7)                                      # 45 degrees: one step in
    px = {(x, y) for x in range(20) for y in range(20) if buf.get_at_mapped((x, y)) == 7}
    assert px == {(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6)}
    buf.fill(0)
    P.line(buf, 0, 0, 6, 2, 7)                                      # x-major: 7 pixels, error before each
    px = sorted((x, y) for x in range(20) for y in range(20) if buf.get_at_mapped((x, y)) == 7)
    assert [x for x, _ in px] == list(range(7)) and px[-1] == (6, 2)


@gamedata
def test_turn_1_production_screen_and_tutorial_pages(quick):
    pages = []
    g, scr = _screen(quick, pages)
    st = g.state
    assert scr.mode == P.PRODUCTION and scr.ci == st.city_at(*st.players[0].capital) == ORIGIN
    assert [p.dialog_id for p in pages] == ["tutorial_page", "tutorial_page"]
    assert st.flags[0x134] & 0x02 and st.flags[0x134] & 0x20       # (25, 1), then (25, 6): 3 cities


@gamedata
def test_one_city_shows_only_the_first_page(plain):
    pages = []
    g, scr = _screen(plain, pages)
    assert len(pages) == 1 and g.state.flags[0x134] & 0x02 and not g.state.flags[0x134] & 0x20


@gamedata
def test_buttons_like_03a9(quick):
    g, scr = _screen(quick)
    s = scr.row.state
    live = {b.id for b in scr.row.buttons}
    assert s[P.PROD_TAB] == PRESSED and s[P.INFO_TAB] == s[P.BUILD_TAB] == s[P.VECTOR_TAB] == NORMAL
    assert {*P.SLOTS, P.DONE2, P.STOP} <= live and P.DONE not in live and s[P.STOP] == DISABLED
    _press(quick, 197)
    assert scr.row.state[P.STOP] == NORMAL
    _press(quick, P.VECTOR_TAB)
    live = {b.id for b in scr.row.buttons}
    assert {P.DONE, P.VECTOR_NEW, P.VECTOR_MOVE, P.SEE_ALL} <= live
    assert not live & {P.DONE2, P.STOP, *P.SLOTS, P.VECTOR_NEW_ON, P.VECTOR_MOVE_ON, P.SEE_ALL_ON}
    assert scr.row.state[P.VECTOR_MOVE] == DISABLED                # no sources yet
    _press(quick, P.INFO_TAB)
    assert scr.area14 and {b.id for b in scr.row.buttons} == {P.DONE, *P.TABS}
    _press(quick, P.BUILD_TAB)
    assert {P.RENAME, P.RAZE, P.BUILD_PROD} <= {b.id for b in scr.row.buttons}


@gamedata
def test_set_production_and_stop(quick):
    g, scr = _screen(quick)
    c = g.state.cities[ORIGIN]
    t = c.slots[0].type
    _press(quick, 197)
    assert (c.current, c.turns_left, scr.chosen) == (t, c.slots[0].time, t)
    _press(quick, P.STOP)
    assert c.turns_left == 0 and c.vectoring == 0 and scr.chosen == -1


@gamedata
def test_vector_two_cities_see_all_and_move(quick):
    g, scr = _screen(quick)
    st = g.state
    o, z, f = (st.cities[i] for i in (ORIGIN, ZEKOND, FARAWAY))
    _press(quick, 197)
    _press(quick, P.VECTOR_TAB)
    _press(quick, P.VECTOR_NEW)
    assert scr.action == 1 and scr.row.state[P.VECTOR_NEW_ON] == NORMAL
    _click(quick, _square(z.x, z.y))
    assert (o.vectoring, tuple(o.vector_to)) == (1, (z.x, z.y)) and scr.ci == ORIGIN and scr.action == 0
    _click(quick, _square(z.x, z.y))                              # action 0: the click selects
    assert scr.ci == ZEKOND and scr.mode == P.VECTOR
    _press(quick, P.PROD_TAB)
    _press(quick, 197)
    _press(quick, P.VECTOR_TAB)
    _press(quick, P.VECTOR_NEW)
    _click(quick, _square(f.x, f.y))
    assert (z.vectoring, tuple(z.vector_to)) == (1, (f.x, f.y))
    _click(quick, _square(f.x, f.y))
    assert scr.ci == FARAWAY and scr.row.state[P.VECTOR_MOVE] == NORMAL
    _press(quick, P.SEE_ALL)
    assert scr.see_all and P.SEE_ALL_ON in {b.id for b in scr.row.buttons}
    _press(quick, P.SEE_ALL_ON)
    _press(quick, P.VECTOR_MOVE)
    assert scr.action == 2
    _click(quick, _square(o.x, o.y))                              # every source of Faraway to Origin
    assert tuple(z.vector_to) == (o.x, o.y) and scr.ci == ORIGIN


@gamedata
def test_shift_click_vectors_from_the_production_page(quick):
    g, scr = _screen(quick)
    st = g.state
    z = st.cities[ZEKOND]
    _press(quick, 197)
    s = quick.cfg.scale
    pos = _square(z.x, z.y)
    quick.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_LSHIFT, unicode="", mod=0, scancode=0),
                _ev(pygame.MOUSEMOTION, pos, s, rel=(0, 0), buttons=(0, 0, 0)),
                _ev(pygame.MOUSEBUTTONDOWN, pos, s, button=1), _ev(pygame.MOUSEBUTTONUP, pos, s, button=1),
                pygame.event.Event(pygame.KEYUP, key=pygame.K_LSHIFT, unicode="", mod=0, scancode=0)])
    assert tuple(st.cities[ORIGIN].vector_to) == (z.x, z.y) and scr.ci == ORIGIN
    _click(quick, pos)                                            # no Shift: another city's page
    assert scr.ci == ZEKOND and scr.mode == P.PRODUCTION


@gamedata
def test_build_offers_only_w4_ge_0_buys_and_sorts(quick):
    g, scr = _screen(quick)
    st = g.state
    c = st.cities[ORIGIN]
    _press(quick, P.BUILD_TAB)
    _press(quick, P.BUILD_PROD)
    g, b, i = _top(quick)
    assert i == "build_production"
    offered = [t.type_id for t in st.army_types[:28] if s16(t.buy_price) >= 0]
    assert b.offered() == offered and offered != [t.type_id for t in st.army_types[:28]]
    live = {x.id for x in b.row.buttons}
    assert live == {P.BUILD_DONE, *P.REPLACE, *P.OFFER[:len(offered)]}
    assert all(b.row.state[x] == DISABLED for x in P.REPLACE)       # slot 3 empty
    gold = st.players[0].gold
    k = next(k for k, t in enumerate(offered) if t not in [s.type for s in c.slots] and
             s16(st.army_type(t).buy_price) <= gold and s16(st.army_type(t).buy_price) > 0)
    t = offered[k]
    slot = b.slot
    _press(quick, P.OFFER[k])
    assert c.slots[slot].type == t and st.players[0].gold == gold - s16(st.army_type(t).buy_price)
    assert b.row.state[P.OFFER[k]] == DISABLED and b.slot == slot + 1
    _press(quick, P.BUILD_DONE)
    filled = [s.type for s in c.slots if s.type >= 0]
    prices = [abs(s16(st.army_type(x).buy_price)) for x in filled]
    assert prices == sorted(prices) and t in filled
    assert _top(quick)[2] == "production" and scr.mode == P.BUILD


@gamedata
def test_a_full_city_buys_into_the_chosen_slot(quick):
    """ovl44:1112 picks slot 2 of a full city; ovl44:0ee3 buys into it (BuyProduction slot)."""
    g, scr = _screen(quick)
    st = g.state
    c = st.cities[ZEKOND]
    _click(quick, _square(c.x, c.y))                               # Zekond's production page
    _press(quick, P.BUILD_TAB)
    _press(quick, P.BUILD_PROD)
    b = _top(quick)[1]
    st.players[0].gold = 30000
    from warlords2.model.city import Slot
    for i in range(4):
        if c.slots[i].type < 0:
            t = next(x for x in b.offered() if x not in [s.type for s in c.slots])
            c.slots[i] = Slot(t, 1, 1, 1, 1)
    b.buttons()
    assert all(b.row.state[x] == NORMAL for x in P.REPLACE)
    _press(quick, 399)
    assert b.slot == 2
    before = [s.type for s in c.slots]
    k, t = next((k, t) for k, t in enumerate(b.offered()) if t not in before)
    _press(quick, P.OFFER[k])
    assert [s.type for s in c.slots] == before[:2] + [t] + before[3:]
    assert b.slot == 2                                             # slot 3 is filled: no + 1


@gamedata
def test_rename_and_raze(quick):
    g, scr = _screen(quick)
    st = g.state
    f = st.cities[FARAWAY]
    _press(quick, P.BUILD_TAB)
    _click(quick, _square(f.x, f.y))                               # the Build page of Faraway
    assert scr.ci == FARAWAY and scr.mode == P.BUILD
    _press(quick, P.RENAME)
    assert _top(quick)[2] == "rename_city"
    _press(quick, 191)
    for ch in "Abcd":
        _key(quick, ord(ch.lower()), ch)
    _key(quick, pygame.K_RETURN, "\r")
    _key(quick, pygame.K_RETURN, "\r")                             # Return outside the editor: 189
    assert f.name == "Abcd" and _top(quick)[2] == "production" and scr.mode == P.BUILD
    _press(quick, P.RENAME)
    _press(quick, 190)
    assert f.name == "Abcd" and scr.mode == P.BUILD
    infamy = st.players[0].infamy
    _press(quick, P.RAZE)
    assert _top(quick)[2] == "raze_confirm"
    _press(quick, 190)
    assert f.owner == 0 and scr.mode == P.BUILD
    _press(quick, P.RAZE)
    _press(quick, 189)
    assert f.owner == 0x0F and 26 <= st.players[0].infamy - infamy <= 50
    assert scr.mode == P.INFO and scr.ci == FARAWAY
    assert all(scr.row.state[t] == DISABLED for t in (P.BUILD_TAB, P.PROD_TAB, P.VECTOR_TAB))


@gamedata
def test_done_shows_the_close_page_and_refreshes(plain):
    g, scr = _screen(plain)
    _key(plain, pygame.K_ESCAPE, "\x1b")                            # DS:1514: 201
    assert scr.stack is None and _top(plain)[2] == "tutorial_page"
    assert g.state.flags[0x134] & 0x04


@gamedata
def test_city_info_slots_help_and_description(quick):
    g, scr = _screen(quick)
    _press(quick, P.INFO_TAB)
    k = kit(quick)
    lines = scr.description(1)
    raw = k.store.read("TUTORIA/TUTORIA.CTY")
    assert all(s and s.encode("cp437") in raw for s in lines)        # three lines of entry #002
    s = quick.cfg.scale
    quick.step([_ev(pygame.MOUSEMOTION, (320, 200), s, rel=(0, 0), buttons=(0, 0, 0)),
                _ev(pygame.MOUSEBUTTONDOWN, (320, 200), s, button=3)])  # area 14, slot 0
    assert _top(quick)[2] == "info/army_type"
    quick.step([_ev(pygame.MOUSEBUTTONUP, (320, 200), s, button=3)])
    quick.step([])
    assert _top(quick)[1] is scr


@gamedata
def test_city_panel_and_view_cities(quick):
    g, scr = _screen(quick)
    _press(quick, P.DONE2)
    for _ in range(200):
        if g.phase_name == "human" and not g.dialogs:
            break
        _dismiss(quick)
        quick.step([])
    st = g.state
    z = st.cities[ZEKOND]
    s = quick.cfg.scale
    pos = (400 + 2 * z.x + 1, 30 + 2 * z.y + 1)                    # the overview (0726:0186)
    quick.step([_ev(pygame.MOUSEMOTION, pos, s, rel=(0, 0), buttons=(0, 0, 0)),
                _ev(pygame.MOUSEBUTTONDOWN, pos, s, button=3)])
    assert _top(quick)[2] == "info/city"
    quick.step([_ev(pygame.MOUSEBUTTONUP, pos, s, button=3)])
    quick.step([])
    registry.run_action(registry.MENU_ID["cities"], g)
    g, t, i = _top(quick)
    assert i == "production" and t.mode == P.INFO
    assert t.ci == P.nearest_city(g, st.flags[0x17D], st.flags[0x17F], P.ANY_OWNER, True)


@gamedata
def test_screen_hash_is_deterministic(game, tmp_path):
    hashes = []
    for n in range(2):
        a = _app(game, tmp_path / str(n), "--options", QUICK_START)
        g, scr = _screen(a)
        _press(a, 197)
        _press(a, P.VECTOR_TAB)
        pygame.image.save(a.screen.present_surface, str(tmp_path / f"{n}.png"))
        hashes.append((g.state.hash(), (tmp_path / f"{n}.png").read_bytes()))
        a.close()
    assert hashes[0] == hashes[1]


@gamedata
def test_keys_while_the_screen_is_up(quick, monkeypatch):
    """07be:0064 with DS:166a set: 'b' / 'c' / 'p' / 'v' and Del chord (07be:03ef), 'A'..'Z'
    nothing; Return presses 192 (DS:155c); no page switch by a key."""
    from warlords2.audio import effects
    chords = []
    monkeypatch.setattr(effects, "chord", lambda app: chords.append(1))
    g, t = _screen(quick)
    mode = t.mode
    for key, text in ((pygame.K_b, "b"), (pygame.K_c, "c"), (pygame.K_p, "p"), (pygame.K_v, "v"),
                      (pygame.K_DELETE, "\x7f")):
        _key(quick, key, text)
        assert _top(quick)[1] is t and t.mode == mode
    assert len(chords) == 5
    _key(quick, pygame.K_b, "B")                                       # 'B' (0x42): ignored
    assert len(chords) == 5 and _top(quick)[1] is t
    _key(quick, pygame.K_RETURN, "\r")
    assert t.stack is None and len(chords) == 5


@gamedata
def test_build_close_sorts_and_empty_slot_chooses(quick):
    """ovl44:0eca -> 1544 on every close (SortSlots, nothing bought); an empty slot clicked runs
    ovl44:00ff with the remembered type (ChooseProduction)."""
    from warlords2.model import commands as C
    g, scr = _screen(quick)
    sent = []
    real = scr.command
    scr.command = lambda cmd: (sent.append(cmd), real(cmd))[1]
    _press(quick, P.BUILD_TAB)
    _press(quick, P.BUILD_PROD)
    _press(quick, P.BUILD_DONE)
    assert C.SortSlots(scr.ci) in sent
    _press(quick, P.PROD_TAB)
    c = scr.city
    empty = next(i for i in range(4) if c.slots[i].type < 0 or c.slots[i].type == 0xFF)
    sent.clear()
    scr.choose(empty)
    assert sent == [C.ChooseProduction(scr.ci, scr.chosen)]
