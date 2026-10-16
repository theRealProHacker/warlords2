"""M7b: hero and site dialogs (hero offer, naming, levels, inspect, promotion, medal, sites)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import HERO_TYPE, ItemState  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))


def _app(game, tmp_path, *extra):
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                           "--controls", "HCCCCCCH", "--user-dir", str(tmp_path / "u"), *extra]))


def _top(g):
    d = getattr(g, "dialogs", None)
    return d.top if d is not None else None


def _until(a, cond, n=300, answer=None):
    """Step until cond(game); pop-ups are dismissed by a release, the hero offer by `answer`."""
    for _ in range(n):
        g = a.manager.current_state()
        if cond(g):
            return g
        top = _top(g)
        tid = getattr(top, "dialog_id", None)
        if tid == "production":
            top.press(192)                                # Done (M6b's city screen of turn 1)
            a.step([])
            continue
        if tid == "hero_offer" and answer is not None:
            answer(top)
            a.step([])
            continue
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message", "level_up", "medal") else [])
    raise AssertionError("condition not reached (top %r)" % getattr(_top(a.manager.current_state()), "dialog_id", None))


def _offer(g):
    return getattr(_top(g), "dialog_id", None) == "hero_offer"


def _human(g):
    return getattr(g, "phase_name", None) == "human" and not g.dialogs


@pytest.fixture
def app(game, tmp_path):
    a = _app(game, tmp_path)
    yield a
    a.close()


def _accept(d):
    d.press(287)


@gamedata
def test_turn1_offer_free_hero_only_accept(app):
    g = _until(app, _offer)
    d = _top(g)
    st = g.state
    assert isinstance(st.pending, E.HeroOffered) and st.pending.info["free"]
    assert d.row.state[288] == DISABLED and d.row.state[287] == NORMAL
    assert d.row.state[290] == (PRESSED if not d.female else NORMAL)
    k = kit(g.app)
    base = 8 if d.female else 0
    want = [k.text.group(97)[base + i] for i in range(3)]
    assert d.lines()[:3] == want                      # turn 1: no arguments in lines 1-3
    assert st.cities[st.pending.info["city"]].name in d.lines()[3]
    d.press(288)                                      # disabled: the row rejects it, press is a no-op
    assert _top(g) is d or st.pending is None


@gamedata
def test_female_wording_and_name(app):
    g = _until(app, _offer)
    d = _top(g)
    k = kit(g.app)
    d.press(291)
    assert d.female == 1 and d.row.state[291] == PRESSED and d.row.state[290] == NORMAL
    group = k.text.group(97)
    assert d.lines()[:3] == [group[8 + i] for i in range(3)]          # STRING 97 idx 8-15
    d.press(289)
    ed = _top(g)
    assert ed.dialog_id == "hero_name"
    for ch in "Xena":
        ed.update([pygame.event.Event(pygame.KEYDOWN, key=ord(ch.lower()), unicode=ch, mod=0, scancode=0)], 16)
    ed.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_RETURN, unicode="\r", mod=0, scancode=0)], 16)
    assert _top(g) is d and d.name == "Xena"
    d.press(287)
    st = g.state
    assert st.pending is None
    h = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == 0)
    slot = st.heroes[h.hero_slot]
    assert slot.name == "Xena" and slot.female == 1


@gamedata
def test_name_editor_limits(app):
    g = _until(app, _offer)
    d = _top(g)
    d.press(289)
    ed = _top(g)
    for _ in range(20):
        ed.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_i, unicode="i", mod=0, scancode=0)], 16)
    assert len(ed.text) == 14                                          # ovl56:0495: < max - 1
    ed.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE, unicode="\x1b", mod=0, scancode=0)], 16)
    assert d.name == g.state.pending.info["name"]                     # Escape keeps the old name


@gamedata
def test_offer_answer_goes_on_with_the_turn(app):
    g = _until(app, _human, answer=_accept)
    st = g.state
    assert st.pending is None and any(a.type_id == HERO_TYPE and a.owner == 0 for a in st.armies)


@gamedata
def test_hero_levels_and_inspect(app):
    g = _until(app, _human, answer=_accept)
    st = g.state
    registry.run_action(registry.MENU_ID["hero_levels"], g)
    d = _top(g)
    assert d.dialog_id == "hero_levels"
    from warlords2.ui.dialogs.hero_levels import rows
    assert [a.owner for a, _ in rows(st)] == [0]
    d.draw(g.app.screen.fb)
    d.update([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(470, 350)),
              pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(470, 350))], 16)
    assert not g.dialogs
    registry.run_action(registry.MENU_ID["hero_inspect"], g)
    d = _top(g)
    assert d.dialog_id == "hero_inspect"
    hero = d.hero
    std = st.current
    assert d.items == [std] and not d.ground()                        # the side's standard, carried
    assert 247 in d.row.state and 248 not in d.row.state
    d.draw(g.app.screen.fb)
    d.press(247)                                                      # drop (ovl40:0d1e)
    assert st.items[std].state in (ItemState.ON_MAP, ItemState.NOT_IN_PLAY)
    if st.items[std].state == ItemState.ON_MAP:
        assert d.ground() and 248 in d.row.state and d.items == [std]  # the list is not rebuilt
        d.press(248)                                                  # take (ovl40:0e70)
        assert st.items[std].state == ItemState.CARRIED and st.items[std].holder == hero.id
    d.press(242)
    assert not g.dialogs


@gamedata
def test_level_up_female_texts(app):
    g = _until(app, _human, answer=_accept)
    st = g.state
    h = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == 0)
    slot = st.heroes[h.hero_slot]
    slot.female = 1
    ev = E.HeroPromoted({"army": h.id, "slot": h.hero_slot, "level": 1, "strength": 1, "moves": 2,
                         "group": 101, "female": 1})
    d = registry.open_dialog("level_up", g, event=ev)
    k = kit(g.app)
    assert d.popup == 0x10 and d.title == k.text.group(101)[6]
    assert d.lines[0] == k.text.group(101)[7]
    d.draw(g.app.screen.fb)
    d.update([UP], 16)
    assert not g.dialogs


def test_direction_words_order():
    """ovl62:0b51: 0 north .. 7 northwest."""
    from warlords2.ui.dialogs.quest import direction
    c = (10, 10)
    assert [direction(c, t) for t in ((10, 5), (15, 5), (15, 10), (15, 15), (10, 15), (5, 15), (5, 10), (5, 5))] \
        == list(range(8))
    assert direction(c, c) == 0


@gamedata
def test_sage_list_paging(app):
    g = _until(app, _human, answer=_accept)
    names = ["n%d" % i for i in range(8)]
    d = registry.open_dialog("sage_list", g, title="t", names=names)
    assert d.rows == [0, 1, 2, 3, 4] and d.row.state[119] == DISABLED and d.row.state[120] == NORMAL
    d.press(120)                                       # ovl51:02be: + min(8 - 4 - 1, 5)
    assert d.rows == [3, 4, 5, 6, 7] and d.row.state[120] == DISABLED
    d.press(121)                                       # ovl51:01f5: one up, the choice follows its entry
    assert d.rows == [2, 3, 4, 5, 6] and d.sel == 1
    d.press(116)
    got = []
    d.on_close = got.append
    d.press(123)
    assert got == [4]
    small = registry.open_dialog("sage_list", g, title="t", names=names[:3])
    assert not {119, 120, 121, 122} & set(small.row.state) and small.rows == [0, 1, 2, -1, -1]


@gamedata
def test_view_items_order(app):
    g = _until(app, _human, answer=_accept)
    from warlords2.rules.bonuses import s8
    from warlords2.ui.dialogs.items import listed
    st = g.state
    rows = listed(st)
    assert sorted(rows) == list(range(8, min(22, len(st.items))))
    keys = [(s8(st.items[i].type), s8(st.items[i].value)) for i in rows]
    assert keys == sorted(keys)


@gamedata
def test_site_panel_and_screen(app):
    g = _until(app, _human, answer=_accept)
    st = g.state
    si = next(i for i, s in enumerate(st.sites) if s.shown_mask & 1)
    s = st.sites[si]
    d = registry.right_click_handler("site")(g, si, (200, 200))
    assert d.dialog_id == "info/site"
    d.draw(g.app.screen.fb)
    g.dialogs.remove(d)
    from warlords2.ui.dialogs.ruins import nearest_site, site_text
    assert nearest_site(g, s.x, s.y) == si
    assert len(site_text(g.app, "TUTORIA", si)) == 3


@gamedata
@pytest.mark.parametrize("close_key", [(pygame.K_ESCAPE, "\x1b"), (pygame.K_RETURN, "\r")])
def test_site_screen_keys(app, monkeypatch, close_key):
    """ovl45:0000 mode 4 runs the shared tail (009d -> 021d), DS:166a = 1 (0248): 07be:0064's
    pop-up rules as on the city screen: 'b' and Del chord, 'B' (0x41..0x5a) nothing, Esc /
    Return press 192 (in DS:1514 and DS:155c), which closes the screen (ovl45:02e1)."""
    from warlords2.audio import effects
    from warlords2.ui.dialogs.ruins import CLOSE
    from warlords2.ui.keys import ESC_LIST, RETURN_LIST, ds_list
    chords = []
    monkeypatch.setattr(effects, "chord", lambda a: chords.append(1))
    g = _until(app, _human, answer=_accept)
    exe = kit(g.app).exe
    assert CLOSE in ds_list(exe, ESC_LIST) and CLOSE in ds_list(exe, RETURN_LIST)
    si = next(i for i, s in enumerate(g.state.sites) if s.shown_mask & 1)
    d = registry.open_dialog("ruins", g, site=si)
    while _top(g) is not d:                               # the tutorial page of the open
        app.step([UP])
    key = lambda k, t: d.update([pygame.event.Event(pygame.KEYDOWN, key=k, unicode=t, mod=0, scancode=0)], 16)
    for k, t in ((pygame.K_b, "b"), (pygame.K_DELETE, "\x7f")):
        key(k, t)
        assert _top(g) is d
    assert len(chords) == 2
    key(pygame.K_b, "B")
    assert len(chords) == 2 and _top(g) is d
    key(*close_key)
    assert d.stack is None and len(chords) == 2


def _human_state(app):
    return _until(app, _human, answer=_accept)


@gamedata
def test_ruin_steps_shapes(app):
    """ovl34:01ab's lines for each outcome, from the events of one Search."""
    from warlords2.model.ids import SiteKind
    from warlords2.ui.dialogs.search_result import ruin_steps
    g = _human_state(app)
    st, k = g.state, kit(g.app)
    hero = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == 0)
    name = st.heroes[hero.hero_slot].name
    ev = E.SiteSearched({"site": 0, "kind": 2, "hero": hero.id})
    item_site = next(s for s in st.sites if s.kind == SiteKind.ITEM_RUIN)
    gold_site = next(s for s in st.sites if s.kind == SiteKind.GOLD_RUIN)
    allies_site = next(s for s in st.sites if s.kind == SiteKind.ALLIES_RUIN)
    g51 = k.text.group(51)
    fight = lambda died: E.GuardianFought({"site": 0, "hero": hero.id, "guardian": 1, "hero_died": died})
    s = ruin_steps(k, st, item_site, ev, [fight(True)])
    assert [o for o, _ in s] == ["line", "wait", "line", "end"] and s[2][1] == g51[1] and s[-1][1] == 0
    assert st.monsters[1].name in s[0][1] and name in s[0][1]
    s = ruin_steps(k, st, item_site, ev, [fight(False), E.ItemFound({"item": 8, "site": 0, "hero": hero.id})])
    assert [o for o, _ in s] == ["line", "wait", "line", "wait", "line", "end"] and s[-1][1] == 1
    assert st.items[8].name in s[4][1]
    s = ruin_steps(k, st, gold_site, ev, [E.SiteSearched({"site": 0, "gold": 777})])
    assert s[0][1] == k.text.group(50)[0] and "777" in s[2][1] and s[-1] == ("end", 0)
    s = ruin_steps(k, st, allies_site, ev, [E.AlliesJoined({"type": 20, "count": 1}), fight(False)])
    assert [o for o, _ in s] == ["line", "end"] and st.army_type(20).name in s[0][1]


@gamedata
def test_synthetic_dialogs_draw(app):
    """Medal, quest reward, failure, a guardian search and the sage's list run and draw."""
    from warlords2.ui.dialogs.search_result import SearchResult
    g = _human_state(app)
    st, fb = g.state, g.app.screen.fb
    hero = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == 0)
    unit = next(x for x in st.armies if x.owner == 0 and x.type_id != HERO_TYPE)
    unit.medals = 2
    for d in (registry.open_dialog("medal", g, event=E.MedalAwarded({"army": unit.id, "medals": 2, "gain": "strength", "text_rolls": (1, 2)})),
              registry.open_dialog("quest_reward", g, event=E.QuestCompleted(
                  {"player": 0, "hero": hero.id, "type": 6, "target": 0, "reward": "site", "value": 1})),
              registry.open_dialog("quest_reward", g, event=E.QuestCompleted(
                  {"player": 0, "hero": hero.id, "type": 6, "target": 0, "reward": "allies", "value": 6}))):
        g.paint(fb)
        g.dialogs.draw(fb)
        g.dialogs.remove(d)
    d = SearchResult(g, [("line", "a"), ("wait", None), ("line", "b"), ("end", 1)], hero.id, (hero.x, hero.y))
    g.dialogs.push(d)
    assert d.row is None and d.lines == ["a"]
    d.update([UP], 16)
    assert d.lines == ["a", "b"] and {292, 293} == set(d.row.state)
    g.paint(fb)
    g.dialogs.draw(fb)
    d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE, unicode="\x1b", mod=0, scancode=0)], 16)
    assert not g.dialogs


@gamedata
def test_later_offer_declined(game, tmp_path):
    """TUTORIA seed 1: the Knights' second offer comes on turn 30; Decline leaves gold and heroes."""
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--levels", "03333330", "--user-dir", str(tmp_path / "u")]))
    try:
        def later(g):
            p = getattr(getattr(g, "state", None), "pending", None)
            return isinstance(p, E.HeroOffered) and not p.info["free"] and _offer(g)
        g = None
        for _ in range(80):
            g = _until(a, lambda g: later(g) or _human(g), n=2000, answer=_accept)
            if later(g):
                break
            g.end_turn()
            a.step([])
        assert later(g)
        st = g.state
        d = _top(g)
        assert d.row.state[288] == NORMAL
        gold, heroes = st.players[st.current].gold, sum(1 for x in st.armies if x.type_id == HERO_TYPE)
        d.press(288)
        assert st.pending is None and st.players[st.current].gold == gold
        assert sum(1 for x in st.armies if x.type_id == HERO_TYPE) == heroes
        _until(a, _human)
    finally:
        a.close()


@gamedata
def test_empty_name_is_kept(app):
    """ovl56:0575: Return copies the buffer, also an empty one; NameHero("") is legal."""
    g = _until(app, _offer)
    d = _top(g)
    d.press(289)
    ed = _top(g)
    ed.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_RETURN, unicode="\r", mod=0, scancode=0)], 16)
    assert d.name == ""


@gamedata
def test_take_sends_take_all(app):
    """ovl34:186e: Take is one TakeAll of the selected hero."""
    from warlords2.model import commands as C
    from warlords2.ui.dialogs import search_result as SR
    g = _human_state(app)
    st = g.state
    hero = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == 0)
    sent = []
    real = SR.answer
    SR.answer = lambda host, cmd: sent.append(cmd)
    try:
        d = SR.SearchResult(g, [("end", 1)], hero.id, (hero.x, hero.y))
        g.dialogs.push(d)
        d.press(SR.TAKE)
    finally:
        SR.answer = real
    assert sent == [C.TakeAll(hero.id)]
