"""Quests: the quest page (ovl01:0167, after the temple's quest button and for Report > Quest), the
reward page of a completed quest (ovl01:1520) and the failure messages (ovl01:1ded).

Evidence (asm ovl01, ovl62, ovl63, read from the user's EXE):
* ovl01:0167: has = the side's quest record (2c04:1103 + 0xc p) active and its hero army
  (+4) on the map (x, y >= 0) with type 0x1c (016b..01ff); popup type 2 (the map popup, base
  map without city markers, ovl63:0000(0, 0, NULL) at 02aa); has: SCROLL.PCK (picture 45) masked,
  DS:0094 -> DS:009c (0212..0226); else SetFont(2, 15, 0, 3) STRING (20, -1) centred at (432, 134);
  SetFont(1, 15, 0, 3) DS:00b4 centred at (432, 62); ovl53:056a(16), 330 normal; has: ovl01:0320,
  then ovl63:1f5f(hero x, y, 1) (0305); 330 -> 07be:0930 -> ovl01:0d65: ovl17:069c, ovl61:0000(0, 0);
* ovl01:0320: SetFont(2, 0, 7, 1); sprintf(DS:00ba, hero name) centred at (440, 145); colour 0
  across (360, 165) 160 long (1133:02fe); lines centred at x 440 from y 175 (+ 20, or + 30 after
  the marked ones), per type (jump table ovl01:0d57):
  0 (03cd): (21, 0), (21, 1), sprintf((21, 2), side name of the target's owner), the target
    hero's name [+30], (21, 3), the direction word DS:2b7c[ovl62:0b51(hero, target)]; marks
    ovl62:0a3f(hero -> target, 8), 0899 (= 08cd, `square_mark`), 08b3 (= 099e, `box_mark`);
  1 (0591): (22, 0), (22, 1), the item's name [+30], (22, 2), the direction to the item's place
    (ovl35:0b36); marks as 0 for an item in state 1, 2 or 3 (a state-2 item also sets its site's
    +0x1d bit p, 0682..06a9: the engine's `QuestPage` / `rules.quests.quest_page`);
  2 (06fe): (23, 0..2), "%s" (DS:00c5) with the type's name (ovl44:14f4); ovl63:158d(NULL, -1, t,
    1, 0) (ovl01:077d..0845): the army markers of that type but the side's own (`army_markers`);
  3 (0788): (24, 0), sprintf((24, 1), amount), the target side's name [+30], (24, 2),
    sprintf((24, 3), progress); ovl63:158d(NULL, t, -1, 1, 0);
  4 / 5 (0850 / 09fa): g = 25 / 26: (g, 0), sprintf((g, 1 when the city is known else 2), city
    name) (known: Hidden Map off or one of its squares seen, 0855..0947), (g, 3), (g, 4) [+30],
    (g, 5), the direction to the city; marks 0a3f, 07bf (= 08cd), 0837 (= 099e) at the city;
  6 (0c81): (27, 0), sprintf((27, 1), amount), (27, 2), (27, 3) [+30], (27, 4), sprintf((27, 5),
    progress); no marks.
  Every mark only where seen (Hidden Map off or the square's road-layer bit 0x20);
* ovl62:0b51(ax, ay, bx, by): 0 north .. 7 northwest (same x: 4 when ay < by else 0; same y: 2
  when ax < bx else 6; then 7 / 5 / 1 / 3 by the signs, else 0);
* ovl63:158d(NULL, owner, type, skip own, skip city): army records in table order, on the map,
  the first one of its square only (the 0x10 map bit, cleared for every square first), with Hidden Map seen;
  matching owner / type (-1 = any): ATRANS2 (DS:2cbe + 4 o, + (2x - 1 & 7) * DS:2ce8) of
  DS:2ce6 = 16x10 masked at (max(0, (2x - 1) >> 3 << 3), max(0, 2y - 1)), o = owner (0x0f -> 8);
* completion (ovl01:26e5..273c): for a human ovl58:0000(3) music (M10c), ovl01:1520(kind, v):
  popup type 2, SCROLL.PCK as above, SetFont(1, 15, 0, 3) DS:00c8 centred at (432, 64), screen 17
  (331 normal), base map, ovl01:160e: SetFont(2, 0, 7, 1) sprintf(DS:00ce, hero) at (440, 145),
  the rule, (28, 0) at 175, (28, 1) at 195, then by kind: item (30, 0), (30, 1), the item's name
  at 225 / 245 / 265; site (29, 0), (29, 1), the site's name, marks 0a3f(hero -> site), 0806
  (`square_mark`), 0868 (`box_mark`); gold (31, 0), (31, 1), sprintf((31, 2), v, DS:00d9);
  allies (31, 0), (31, 1), sprintf((31, 2), v, type 0x13's name); then ovl63:1f5f(hero, 1);
  331 -> 07be:0938 -> ovl01:18a1 (the re-selection and the continuation, done by the engine);
* failures: for a human ovl61:1160((g, 0), (g, 1)) with the reason's group g (32..42).
* Report > Quest (menu 516, key '=', 07be:02a7 -> ovl01:0167): the command `QuestPage` rolls the
  empty page's member of (20, -1) on the game's dice (ovl59:04f0 -> 02bf at 0244) and rebuilds
  the army bits of quest types 2 / 3 (`rules.quests.quest_page`); the page shows the rolled member;
* keys (DS:166a = 1 at ovl01:0290 / 157a): `ui.keys.popup_input`; 330 and 331 are in both DS:1514
  and DS:155c, so Esc and Return close either page;
* Hidden Map edges: the page with a quest and the reward page end with ovl63:04d3 (colour 3,
  ovl01:0310 / 15ff); the page without one does not (ovl63:0000's colour 4, `map_page`).
"""
from __future__ import annotations

import logging

import pygame

from ...assets.exe import ds_far, ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import events as E
from ...model import commands as C
from ...model.ids import HERO_TYPE, MAP_W, Control, ItemState, Terrain
from ...rules.bonuses import s8
from .. import registry
from ..dialog import Dialog
from ..typename import type_name
from ..keys import popup_input
from ..widgets import MAP_POPUP, MARBLE, ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import (HIDDEN_LINE as EDGE_04D3, MAP_SHIFT, MAP_TOP, bitmap, box_mark, line_mark, map_popup, raw,
                         seen, sprintf, square_mark, wait)

log = logging.getLogger(__name__)

PAGE_SCREEN, PAGE_CLOSE, REWARD_SCREEN, REWARD_CLOSE = 16, 330, 17, 331
SCROLL, SCROLL_SRC, SCROLL_AT = 45, 0x0094, 0x009C
PAGE_TITLE, REWARD_TITLE, HERO_FMT, REWARD_HERO_FMT, NAME_FMT, GOLD_WORD = 0x00B4, 0x00C8, 0x00BA, 0x00CE, 0x00C5, 0x00D9
PAGE_TITLE_AT, REWARD_TITLE_AT = (432, 62), (432, 64)
NO_QUEST, NO_QUEST_AT = 20, (432, 134)
DIRECTIONS = 0x2B7C
X, HEAD_Y, Y0, STEP, GAP = 440, 145, 175, 20, 30
RULE = (360, 165, 160)
MARK = 8
G_TYPE = {0: 21, 1: 22, 2: 23, 3: 24, 4: 25, 5: 26, 6: 27}
G_DONE, G_SITE, G_ITEM, G_PAY = 28, 29, 30, 31
REWARD_ALLY_TYPE = 0x13
ARMY_MARKS, ARMY_MARK_SIZE = 0x2CBE, 0x2CE6
TEXT_INK, TEXT_SHADOW = 0, 7
INK, SHADOW = 15, 0
NEUTRAL, NEUTRAL_ROW = 0x0F, 8
EDGE_0000 = 4                                    # ovl63:0403 push 4


def direction(a, b) -> int:
    """ovl62:0b51."""
    (ax, ay), (bx, by) = a, b
    if ax == bx:
        return 4 if ay < by else 0
    if ay == by:
        return 2 if ax < bx else 6
    if bx < ax and by < ay:
        return 7
    if bx < ax and ay < by:
        return 5
    if ax < bx and by < ay:
        return 1
    if ax < bx and ay < by:
        return 3
    return 0


def direction_word(k, a, b) -> str:
    return ds_str(k.exe, ds_far(k.exe, DIRECTIONS + 4 * direction(a, b)))


def army_markers(k, buf, state, owner: int, type_id: int, skip_own: bool = False,
                 skip_city: bool = False) -> None:
    """ovl63:158d(NULL, owner, type, skip_own, skip_city): per army record the first-on-square
    test (map bit 0x10, 1675..1698), the Hidden Map seen test (16a3..16c6), then with the fifth
    argument set a square whose terrain SCN 0x710[tile] is 10 (city) is skipped (16c9..16f6), with
    the fourth an army of SCN 0x110 (owner 0x0f mapped to 8 first, 170d..1713) is skipped
    (1718..172c), then the owner / type filters (172f..176a).  Report > Army passes (0, 1)
    (ovl42:0154), the quest pages of types 2 / 3 (1, 0) (ovl01:077d / 083a)."""
    w, h = ds_words(k.exe, ARMY_MARK_SIZE, 2)
    done = set()
    pic = k.picture(9)
    world = state.world
    for a in state.armies:
        if a.x < 0 or a.y < 0 or a.owner == 0xFF or (a.x, a.y) in done:
            continue
        done.add((a.x, a.y))
        if not seen(state, a.x, a.y):
            continue
        if skip_city and world.terrain_of_tile[world.tiles[a.y * MAP_W + a.x] & 0xFF] == Terrain.CITY:
            continue
        o = NEUTRAL_ROW if a.owner == NEUTRAL else a.owner
        if skip_own and o == state.current:
            continue
        if (owner >= 0 and a.owner != owner) or (type_id >= 0 and a.type_id != type_id):
            continue
        sx, sy = ds_words(k.exe, ARMY_MARKS + 4 * o, 2)
        u = 2 * a.x - 1
        buf.blit(pic, (max(0, u >> 3 << 3), max(0, 2 * a.y - 1)), (sx, sy + (u & 7) * h, w, h))


def target_marks(buf, state, hero, at) -> None:
    if seen(state, *at):
        line_mark(buf, (hero.x, hero.y), at, MARK)
        square_mark(buf, *at, MARK)
        box_mark(buf, *at, MARK)


def map_page(fb, host, cities: bool, draw=None, markers=(), edge: int = EDGE_04D3) -> None:
    """ovl17:0000(2) and the overview ovl63:0000(cities, 1, NULL), as `map_popup`, with the colour
    of the Hidden Map edge lines as the caller leaves them: with the popup up and no rectangle
    ovl63:0000 draws them in colour 4 into the bitmap before its copy (03f6..0446, rect DS:2a88
    = (0, 0, 224, 312)); a following ovl63:04d3 redraws the same three lines in colour 3
    (`map_popup`).  So `edge` is 3 when the caller runs 04d3, else 4 (Report > City / Gold /
    Winning ovl42:019f / 01c3 / 0222, the quest page without a quest ovl01:02aa)."""
    if edge == EDGE_04D3:
        map_popup(fb, host, markers, cities=cities, draw=draw)
        return
    k = kit(host.app)
    x, y, w, h = k.popup_rect[MAP_POPUP]
    shift = ds_words(k.exe, MAP_SHIFT, 1)[0]
    blit_opaque(fb, k.picture(MARBLE), (x + shift, y), (shift, 0, w - shift, h))
    pygame.draw.rect(fb, 0, (x - 1, y - 1, w + 2, h + 2), 1)
    fb.fill(0, (x + 1, y + h + 1, w + 2, 2))
    fb.fill(0, (x + w + 1, y + 1, 2, h + 2))
    st = host.state
    mm = host.minimap
    if cities:
        mm.compose(st)
        buf = mm.buf.copy()
    else:
        buf = bitmap(mm, st)
    if draw is not None:
        draw(buf)
    if st.options.hidden_map:
        bw, bh = buf.get_size()
        buf.fill(edge, (0, 0, bw, 1))
        buf.fill(edge, (0, 0, 1, bh))
        buf.fill(edge, (0, bh - 1, bw, 1))
    px, _ = k.popup_pos[MAP_POPUP]
    fb.blit(buf, (px, MAP_TOP))


def quest_lines(k, state):
    """ovl01:0320: (lines as (y, text), marks callback)."""
    from ...rules.quests import item_location
    p = state.current
    q = state.players[p].quest
    hero = state.armies[q.hero]
    g = G_TYPE[q.type]
    t = q.target
    out, marks = [], None
    y = Y0

    def add(s, step=STEP):
        nonlocal y
        out.append((y, s))
        y += step

    r = lambda i, *a: sprintf(raw(k, g, i), *a)
    if q.type == 0:
        ta = state.armies[t]
        add(r(0)); add(r(1)); add(r(2, state.players[s8(ta.owner)].name))
        add(state.heroes[s8(ta.hero_slot)].name, GAP); add(r(3))
        add(direction_word(k, (hero.x, hero.y), (ta.x, ta.y)))
        marks = lambda buf: target_marks(buf, state, hero, (ta.x, ta.y))
    elif q.type == 1:
        loc = item_location(state, t) or (0, 0)
        add(r(0)); add(r(1)); add(state.items[t].name, GAP); add(r(2))
        add(direction_word(k, (hero.x, hero.y), loc))
        if state.items[t].state in (ItemState.ON_MAP, ItemState.IN_SITE, ItemState.CARRIED):
            marks = lambda buf: target_marks(buf, state, hero, loc)
    elif q.type == 2:
        add(r(0)); add(r(1)); add(r(2)); add(sprintf(ds_str(k.exe, NAME_FMT), type_name(k, state, t)))          # ovl01:0755
        marks = lambda buf: army_markers(k, buf, state, -1, t, skip_own=True)
    elif q.type == 3:
        add(r(0)); add(r(1, q.amount)); add(state.players[t].name, GAP); add(r(2)); add(r(3, q.progress))
        marks = lambda buf: army_markers(k, buf, state, t, -1, skip_own=True)
    elif q.type in (4, 5):
        c = state.cities[t]
        known = any(seen(state, c.x + dx, c.y + dy) for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1)))
        add(r(0)); add(r(1 if known else 2, c.name)); add(r(3)); add(r(4), GAP); add(r(5))
        add(direction_word(k, (hero.x, hero.y), (c.x, c.y)))
        marks = lambda buf: target_marks(buf, state, hero, (c.x, c.y))
    else:
        add(r(0)); add(r(1, q.amount)); add(r(2)); add(r(3), GAP); add(r(4)); add(r(5, q.progress))
    return out, marks


def has_quest(state) -> bool:
    q = state.players[state.current].quest
    if not q.active:
        return False
    a = state.armies[q.hero]
    return a.x >= 0 and a.y >= 0 and a.type_id == HERO_TYPE


class Page(Dialog):
    """The scroll page of ovl01:0167 / 1520."""

    def __init__(self, host, screen, button, title, title_at, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        self.row = ButtonRow([k.layouts.screen(screen).button(button)], k.picture)
        self.button, self.title, self.title_at = button, title, title_at
        self.head = None
        self.lines, self.marks, self.hero = [], None, None
        self.scroll = True
        self.empty = None

    def update(self, events, dt) -> None:
        """07be:0064 with DS:166a set (ovl01:0290 / 157a): the button, its help on a right press,
        Esc / Return press 330 / 331 (both in DS:1514 and DS:155c), other keys chord."""
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == self.button:
            self.close(None)
            return True
        return False

    def draw(self, fb) -> None:
        k = self.k
        st = self.host.state
        markers = [(self.hero.x, self.hero.y, 1)] if self.hero is not None else []
        map_page(fb, self.host, False, self.marks, markers, EDGE_04D3 if self.hero is not None else EDGE_0000)
        if self.scroll:
            fb.blit(k.picture(SCROLL), ds_words(k.exe, SCROLL_AT, 2), ds_words(k.exe, SCROLL_SRC, 4))
        f = k.fonts[CHANCE17]
        if self.empty is not None:
            text_centred(fb, f, *NO_QUEST_AT, self.empty, INK, SHADOW)
        text_centred(fb, k.fonts[CHANCE36], *self.title_at, self.title, INK, SHADOW)
        if self.head is not None:
            text_centred(fb, f, X, HEAD_Y, self.head, TEXT_INK, TEXT_SHADOW)
            fb.fill(0, (RULE[0], RULE[1], RULE[2], 1))
        for y, s in self.lines:
            text_centred(fb, f, X, y, s, TEXT_INK, TEXT_SHADOW)
        self.row.draw(fb)


@registry.dialog("quest")
def quest_page(host, on_close=None, empty_index=None):
    """ovl01:0167.  Without a quest the line is STRING (20, r) with r the engine's roll (command
    `QuestPage`, `Msg(20, r)`), passed as `empty_index`."""
    k = kit(host.app)
    st = host.state
    d = Page(host, PAGE_SCREEN, PAGE_CLOSE, ds_str(k.exe, PAGE_TITLE), PAGE_TITLE_AT, on_close)
    if has_quest(st):
        q = st.players[st.current].quest
        hero = st.armies[q.hero]
        d.hero = hero
        d.head = sprintf(ds_str(k.exe, HERO_FMT), st.heroes[s8(hero.hero_slot)].name)
        d.lines, d.marks = quest_lines(k, st)
    else:
        if empty_index is None:
            log.warning("quest page without a quest and without the engine's roll (ovl01:0244); member 0 shown")
        d.scroll = False
        d.empty = raw(k, NO_QUEST, empty_index or 0)
    return d


@registry.action(registry.MENU_ID["report_quest"])
def open_quest_page(host):
    """Report > Quest, key '=' (07be:02a7 -> ovl01:0167): the command `QuestPage` (the army bits
    of quest types 2 / 3, or the roll of the empty page's line), then the page; 330 -> 07be:0930
    -> ovl01:0d65: ovl17:069c, ovl61:0000(0, 0) (the palette refresh, `settings_closed`)."""
    if getattr(host, "state", None) is None:
        return None
    events = host.command(C.QuestPage())
    if events is None:
        return None
    empty = next((e.index for e in events if isinstance(e, E.Msg) and e.group == NO_QUEST), None)
    return registry.open_dialog("quest", host, empty_index=empty, on_close=lambda _: host.settings_closed())


@registry.dialog("quest_reward")
def quest_reward(host, event, on_close=None):
    """ovl01:1520 / 160e."""
    k = kit(host.app)
    st = host.state
    info = event.info
    d = Page(host, REWARD_SCREEN, REWARD_CLOSE, ds_str(k.exe, REWARD_TITLE), REWARD_TITLE_AT, on_close)
    hero = st.armies[info["hero"]]
    d.hero = hero
    d.head = sprintf(ds_str(k.exe, REWARD_HERO_FMT), st.heroes[s8(hero.hero_slot)].name)
    lines = [(Y0, raw(k, G_DONE, 0)), (Y0 + STEP, raw(k, G_DONE, 1))]
    kind, v = info["reward"], info["value"]
    y = Y0 + STEP + GAP
    if kind == "item":
        third, g = st.items[v].name, G_ITEM
    elif kind == "site":
        third, g = st.sites[v].name, G_SITE
        s = st.sites[v]
        d.marks = lambda buf: target_marks(buf, st, hero, (s.x, s.y))
    elif kind == "gold":
        third, g = sprintf(raw(k, G_PAY, 2), v, ds_str(k.exe, GOLD_WORD)), G_PAY
    else:
        third, g = sprintf(raw(k, G_PAY, 2), v, type_name(k, st, REWARD_ALLY_TYPE)), G_PAY   # ovl01:1821
    lines += [(y, raw(k, g, 0)), (y + STEP, raw(k, g, 1)), (y + 2 * STEP, third)]
    d.lines = lines
    return d


def _human(state) -> bool:
    return state.players[state.current].control == Control.HUMAN


@registry.event_view(E.QuestAssigned)
def _assigned(host, ev):
    """ovl01:011b -> ovl01:0167 (a human's temple quest)."""
    if not _human(host.state):
        return None
    return wait(registry.open_dialog("quest", host))


@registry.event_view(E.QuestCompleted)
def _completed(host, ev):
    if not _human(host.state):
        return None
    return wait(registry.open_dialog("quest_reward", host, event=ev))


@registry.event_view(E.QuestFailed)
def _failed(host, ev):
    if not ev.info.get("message"):
        return None
    k = kit(host.app)
    g = ev.info["group"]
    return wait(registry.open_dialog("message", host, lines=[raw(k, g, 0), raw(k, g, 1)]))
