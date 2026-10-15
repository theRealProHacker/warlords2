"""Hero > Inspect (menu 517, key ','): one hero of the side with its stack, battle and command
bonus, level and experience, and the items it carries or that lie on its square (take, drop).

Evidence (asm ovl40, read from the user's EXE; key table 07be:0337 ',' -> 07be:0297):
* ovl40:0000: the list DS:440e = heroes (type 0x1c) of SCN 0x110 over the army records SCN
  0x181 - 1 .. 0 (0005..005b); none -> return (nothing shown, 005d); the hero shown first is the
  one nearest the view centre SCN 0x17d / 0x17f (0a8b:0acc, strict < from 1000; 0067..00c6);
  DS:0d6c = 0; ovl53:056a(8): JOIN screen 8; ovl40:00f9, 0620, 10ac; DS:166a = 1;
* ovl40:00f9: popup type 2 (the map popup, `hero_offer.map_popup`) on the first open, then the
  colour-0 outline (308, 206, 248, 129) and bevel 14d0:02e5(4, 2) on (307, 205, 250, 131)
  (0195..01ec; a hero switch restores only marble areas that do not cross them, 016a..0193);
  SetFont(1, 15, 0, 3) the hero's name centred at (432, 62) (01ef..0230); ovl64:08be(0x1c, p,
  ring 1) at (304, 110), the other armies of the square (0b62:007d order, the hero skipped) at
  304 + 32 k, empty rings up to k = 7 (0233..030a); SetFont(2, 15, 0, 3); right-aligned at x 384:
  STRING (0x83, 0) "near" when no city holds the square (ovl62:044a) else (0x83, 1) at y 145,
  (0x83, 2) at 165, (0x83, 3) at 185; at x 528: (0x83, 4) at 165, (0x83, 5) at 185 (0320..03bc);
  left: (0x83, 6) with (position + 1, count) at (312, 347) (03bf..03f5); the name of the nearest
  city (ovl62:04fa(x, y, 0x0e, 1): any owner, with Hidden Map only a city one of whose squares
  passes ovl64:15ff) at (392, 145); DS:0d6e "+%d" battle items (ovl38:0d1a) at (392, 165);
  DS:0d72 "+%d" command = DS:0ce4[min(strength + battle, 9)] + command items (ovl38:0d71) at
  (392, 185); DS:0d76 level + 1 at (536, 165); DS:0d79 experience at (536, 185) (0472..0591);
  the item list ovl51:03d9(6, hero): carried items (state 3, holder = the hero), then the items
  lying on its square (state 1), each in item order (0594); window prev / cur / next = -1 / 0 / 1
  (05bb..060a);
* ovl40:0724: DS:0d6c = (item[list[cur]].state != 3) (072b..074c); colour 3 on (367, 236, 184,
  66) with bevel(4, 2); bevel(2, 4) on (369, 258, 180, 21); marble (24, 151, 200, 20) of the popup
  restored at (328, 211) (ovl17:070b) and SetFont(2, 15, 0, 3) (0x83, 7) "on the ground" when
  DS:0d6c, else (0x83, 8), centred at (432, 211); rows prev / cur / next at (376, 238 + 22 r)
  with ink 10 for state 1, 5 for state 0, else 7 (0806..08a5); colour 3 on (312, 260, 55, 20);
  the current item's effect by type (8 DS:0d7c, 2 DS:0d83 value, 1 DS:0d8b value, 5 DS:0d93,
  6 DS:0d97, 7 DS:0d9c value) centred at (340, 260) in the row's ink (08d3..0a6e); ABITS ticks
  (DS:0ad4[k], opaque): carried at (312, 311) with k = DS:0d6c, ground at (400, 311) with k =
  !DS:0d6c; DS:0da4 SetFont(2, 7, 0, 3) left at (336, 313), DS:0dac SetFont(2, 10, 0, 3) left at
  (424, 313) (0a71..0b27);
* ovl40:0620 (08a9:066e): 242 normal; 243 / 244 normal with more than one hero, else disabled;
  245 iff prev >= 0, 246 iff next >= 0; ground view: 249 pressed, 250 normal, 248 (take) normal
  iff cur >= 0, 247 removed (08a9:03b3); carried view: 249 normal, 250 pressed, 247 (drop) iff
  cur >= 0, 248 removed (0695..0711);
* buttons (07be:0b0c): 242 -> ovl40:0b2d done: ovl62:0372, ovl17:069c, ovl61:011f(1, 0, 0),
  ovl01:1ded(3) (the engine runs the item quest check after every take / drop, rules.heroes);
  243 / 244 -> 0b5b / 0b8a next / previous (mod count, DS:0d6c = 0, the page and list again);
  245 / 246 -> 0bbd / 0bf1 the window one up / down; 249 / 250 -> 0fc2 / 1037: the window on the
  first item with state 1 / 3, when there is one; 247 -> 0d1e: ovl47:0943 (`DropItem`), 248 ->
  0e70: ovl47:08c7 (`TakeItem`), both without rebuilding the list (the row keeps its place in
  its new ink);
* areas (res_0726:0009): 8 = the map (80, 60, 224, 312): a left press on square
  ((px - 80) / 2, (py - 60) / 2) -> ovl40:115e: the hero nearest to it (strict <, from 1000)
  becomes current; a right press -> ovl46:1201 + 10e1(DS:11d5, DS:11e5); 12 = the army row (304,
  110, 256, 30): a right press -> slot clamp((px - 304) / 32, 0, 7): the army panel ovl46:0626 of
  slot 0 = the hero, k = the k-th other army, past them ovl46:10e1((0x84, 0), (0x84, 1));
* ovl40:10ac: the map with ovl63:0000(0, 1, NULL) (no city markers), ATRANS2 markers
  ovl63:1f5f(x, y, 0) for the other heroes of the list, (x, y, 1) for the current one, then
  ovl63:04d3.
Not traced (left as found): with an empty item list the original reads list[-1] (DS:4bfa)
for the view flag (here: the carried view); a nearest city of -1 reads record -1 (here: no
name); item types 0, 3, 4 leave the effect buffer uninitialised (here: no text).
Keys: none in these routines; with DS:166a set they go through 07be:0064 (`ui.keys.popup_key`).
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...model.ids import HERO_TYPE, ItemState
from ...rules.bonuses import battle_items, command_items, s8
from ...rules.movement import armies_at
from ...rules.setup import distance
from .. import registry
from ..dialog import Dialog
from ..keys import code_of, left_press, popup_key, right_help
from ..menubar import with_codes
from ..info import panel_rect, visible
from ..layout import DISABLED, NORMAL, PRESSED
from ..palettes import painter_for
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import answer, bevel, human_phase, map_popup, outline, raw, sprintf, ticks

SCREEN = 8
DONE, NEXT, PREV, UP, DOWN, DROP, TAKE, GROUND, CARRIED = 242, 243, 244, 245, 246, 247, 248, 249, 250
MAP_AREA, ROW_AREA = (80, 60, 224, 312), (304, 110, 256, 30)
START = 1000
GROUP, INFO_GROUP = 0x83, 0x84
FRAME, FRAME_BEVEL = (308, 206, 248, 129), (307, 205, 250, 131)
NAME_AT, ICON_AT, ICON_STEP, ICONS = (432, 62), (304, 110), 32, 8
LABELS = ((2, 384, 165), (3, 384, 185), (4, 528, 165), (5, 528, 185))
NEAR_AT, POS_AT = (384, 145), (312, 347)
CITY_AT, BATTLE_AT, COMMAND_AT, LEVEL_AT, EXP_AT = (392, 145), (392, 165), (392, 185), (536, 165), (536, 185)
FMT_BATTLE, FMT_COMMAND, FMT_LEVEL, FMT_EXP = 0x0D6E, 0x0D72, 0x0D76, 0x0D79
HEROTAB, HEROTAB_N = 0x0CE4, 10
LIST_BOX, CUR_BOX = (367, 236, 184, 66), (369, 258, 180, 21)
TITLE_SRC, TITLE_AT = (24, 151, 200, 20), (432, 211)
ROW_X, ROW_Y, ROW_STEP = 376, 238, 22
EFFECT_BOX, EFFECT_AT = (312, 260, 55, 20), (340, 260)
EFFECTS = {8: (0x0D7C, False), 2: (0x0D83, True), 1: (0x0D8B, True), 5: (0x0D93, False),
           6: (0x0D97, False), 7: (0x0D9C, True)}
CARRIED_TICK, GROUND_TICK = (312, 311), (400, 311)
CARRIED_LABEL, GROUND_LABEL = (0x0DA4, 7, (336, 313)), (0x0DAC, 10, (424, 313))
SELECT_TEXTS = (0x11D5, 0x11E5)
INK, SHADOW, PAPER = 15, 0, 3
STATE_INK = {int(ItemState.ON_MAP): 10, int(ItemState.NOT_IN_PLAY): 5}
OTHER_INK = 7
NEAREST_ANY = 0x0E


def heroes(state) -> list[int]:
    """ovl40:0005..005b."""
    return [a.id for a in reversed(state.armies) if a.type_id == HERO_TYPE and s8(a.owner) == state.current]


def nearest(state, ids, x, y) -> int:
    best, at = START, 0
    for i, aid in enumerate(ids):
        a = state.armies[aid]
        d = distance(x, y, a.x, a.y)
        if d < best:
            best, at = d, i
    return at


def nearest_city(host, x, y) -> int:
    """ovl62:04fa(x, y, 0x0e, 1)."""
    st = host.state
    best, idx = START, -1
    for i, c in enumerate(st.cities):
        if st.options.hidden_map and not any(visible(st, host.sprites, host.view.origin, c.x + dx, c.y + dy)
                                             for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1))):
            continue
        d = distance(x, y, c.x, c.y)
        if d < best:
            best, idx = d, i
    return idx


def item_list(state, hero) -> list[int]:
    """ovl51:03d9 mode 6."""
    out = [i for i, it in enumerate(state.items) if it.state == ItemState.CARRIED and it.holder == hero.id]
    return out + [i for i, it in enumerate(state.items)
                  if it.state == ItemState.ON_MAP and (it.x, it.y) == (hero.x, hero.y)]


class HeroInspect(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        self.painter = painter_for(host)
        st = host.state
        self.ids = heroes(st)
        self.pos = nearest(st, self.ids, st.flags.get(0x17D, 0), st.flags.get(0x17F, 0))
        self.ticks = ticks(k)
        self.layout = k.layouts.screen(SCREEN)
        self.page()

    @property
    def hero(self):
        return self.host.state.armies[self.ids[self.pos]]

    def page(self) -> None:
        """ovl40:00f9's list part (0594..060a)."""
        st = self.host.state
        self.items = item_list(st, self.hero)
        from .save_load import list_names
        list_names(self.host.app, [st.items[i].name for i in self.items])   # ovl51:0425..052e (DS:483c)
        n = len(self.items)
        self.prev, self.cur, self.next = -1, (0 if n else -1), (1 if n > 1 else -1)
        self.buttons()

    def ground(self) -> bool:
        """ovl40:072b..074c."""
        if self.cur < 0:
            return False
        return self.host.state.items[self.items[self.cur]].state != ItemState.CARRIED

    def buttons(self) -> None:
        """ovl40:0620."""
        g = self.ground()
        live = [DONE, NEXT, PREV, UP, DOWN, GROUND, CARRIED, TAKE if g else DROP]
        keep = {b.id: b for b in self.layout.buttons}
        self.row = ButtonRow([keep[i] for i in live if i in keep], self.k.picture)
        s = self.row.state
        s[DONE] = NORMAL
        s[NEXT] = s[PREV] = NORMAL if len(self.ids) > 1 else DISABLED
        s[UP] = NORMAL if self.prev >= 0 else DISABLED
        s[DOWN] = NORMAL if self.next >= 0 else DISABLED
        s[GROUND], s[CARRIED] = (PRESSED, NORMAL) if g else (NORMAL, PRESSED)
        s[TAKE if g else DROP] = NORMAL if self.cur >= 0 else DISABLED

    def update(self, events, dt) -> None:
        for e, code in with_codes(events, self.host.app.input):
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                return self.right(e.pos)
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and _inside(MAP_AREA, e.pos) \
                    and self.row.at(e.pos) is None:
                return self.pick((e.pos[0] - MAP_AREA[0]) // 2, (e.pos[1] - MAP_AREA[1]) // 2)
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                left_press(self.host.app, self.row, e)                    # 07be:0e26(1)
                continue
            if e.type == pygame.KEYDOWN:
                hit = popup_key(self.host.app, self.row, code_of(e, code), self.k.exe)
            else:
                hit = self.row.event(e)
            if hit is not None:
                return self.press(hit)

    def right(self, pos) -> None:
        if right_help(self.host, self.row, pos):
            pass
        elif _inside(MAP_AREA, pos):
            registry.open_dialog("info/text", self.host, title=ds_str(self.k.exe, SELECT_TEXTS[0]),
                                 text=ds_str(self.k.exe, SELECT_TEXTS[1]), pos=pos)
        elif _inside(ROW_AREA, pos):                         # ovl40:11dc
            slot = min(max((pos[0] - ROW_AREA[0]) // ICON_STEP, 0), ICONS - 1)
            row = self.row_armies()
            if slot < len(row):
                registry.open_dialog("info/army_unit", self.host, army=row[slot].id, pos=pos)
            else:
                registry.open_dialog("info/text", self.host, title=raw(self.k, INFO_GROUP, 0),
                                     text=raw(self.k, INFO_GROUP, 1), pos=pos)

    def pick(self, x, y) -> None:
        """ovl40:115e."""
        self.pos = nearest(self.host.state, self.ids, x, y)
        self.page()

    def press(self, id: int) -> None:
        n = len(self.items)
        if id == DONE:
            return self.close(None)
        if id in (NEXT, PREV):
            self.pos = (self.pos + (1 if id == NEXT else len(self.ids) - 1)) % len(self.ids)
            return self.page()
        if id == UP:
            self.next, self.cur = self.cur, self.prev
            self.prev = self.prev - 1 if self.prev - 1 >= 0 else -1
        elif id == DOWN:
            self.prev, self.cur = self.cur, self.next
            self.next = self.next + 1 if self.next + 1 < n else -1
        elif id in (GROUND, CARRIED):
            want = ItemState.ON_MAP if id == GROUND else ItemState.CARRIED
            st = self.host.state
            s = next((j for j, i in enumerate(self.items) if st.items[i].state == want), None)
            if s is not None:
                self.prev, self.cur, self.next = (s - 1 if s > 0 else -1), s, (s + 1 if s < n - 1 else -1)
        elif id == DROP:
            answer(self.host, C.DropItem(self.hero.id, self.items[self.cur]))
        elif id == TAKE:
            answer(self.host, C.TakeItem(self.hero.id, self.items[self.cur]))
        self.buttons()

    def row_armies(self) -> list:
        h = self.hero
        return [h] + [a for a in armies_at(self.host.state, h.x, h.y) if a.id != h.id]

    def draw(self, fb) -> None:
        k, st, exe = self.k, self.host.state, self.k.exe
        h = self.hero
        others = [(st.armies[i].x, st.armies[i].y, 0) for i in self.ids if i != h.id]
        map_popup(fb, self.host, others + [(h.x, h.y, 1)], cities=False)
        outline(fb, FRAME)
        bevel(fb, FRAME_BEVEL, 4, 2)
        slot = st.heroes[s8(h.hero_slot)]
        text_centred(fb, k.fonts[CHANCE36], *NAME_AT, slot.name, INK, SHADOW)
        row = self.row_armies()
        p = st.current
        for i in range(ICONS):
            t = row[i].type_id if i < len(row) else -1
            self.painter.army(fb, t, p, ICON_AT[0] + ICON_STEP * i, ICON_AT[1], ring=1)
        f = k.fonts[CHANCE17]

        def right(s, x, y):
            f.draw(fb, x - f.width(s), y, s, INK, SHADOW)

        right(raw(k, GROUP, 0 if st.city_at(h.x, h.y) < 0 else 1), *NEAR_AT)
        for i, x, y in LABELS:
            right(raw(k, GROUP, i), x, y)
        f.draw(fb, *POS_AT, sprintf(raw(k, GROUP, 6), self.pos + 1, len(self.ids)), INK, SHADOW)
        c = nearest_city(self.host, h.x, h.y)
        if c >= 0:
            f.draw(fb, *CITY_AT, st.cities[c].name, INK, SHADOW)
        battle = battle_items(st, h)
        tab = ds_words(exe, HEROTAB, HEROTAB_N)
        command = tab[min(s8(h.strength) + battle, HEROTAB_N - 1)] + command_items(st, h)
        for at, fmt, v in ((BATTLE_AT, FMT_BATTLE, battle), (COMMAND_AT, FMT_COMMAND, command),
                           (LEVEL_AT, FMT_LEVEL, slot.level + 1), (EXP_AT, FMT_EXP, slot.exp)):
            f.draw(fb, *at, sprintf(ds_str(exe, fmt), v), INK, SHADOW)
        self.draw_items(fb)
        self.row.draw(fb)

    def draw_items(self, fb) -> None:
        """ovl40:0724."""
        k, st = self.k, self.host.state
        f = k.fonts[CHANCE17]
        g = self.ground()
        fb.fill(PAPER, LIST_BOX)
        bevel(fb, LIST_BOX, 4, 2)
        bevel(fb, CUR_BOX, 2, 4)
        px, py = k.popup_pos[2]
        blit_opaque(fb, k.picture(25), (px + 224 + TITLE_SRC[0], py + TITLE_SRC[1]),
                    (224 + TITLE_SRC[0], TITLE_SRC[1], TITLE_SRC[2], TITLE_SRC[3]))
        text_centred(fb, f, *TITLE_AT, raw(k, GROUP, 7 if g else 8), INK, SHADOW)
        for r, j in enumerate((self.prev, self.cur, self.next)):
            if j < 0:
                continue
            it = st.items[self.items[j]]
            f.draw(fb, ROW_X, ROW_Y + ROW_STEP * r, it.name, STATE_INK.get(it.state, OTHER_INK), SHADOW)
        fb.fill(PAPER, EFFECT_BOX)
        if self.cur >= 0:
            it = st.items[self.items[self.cur]]
            e = EFFECTS.get(it.type)
            if e is not None:
                s = ds_str(k.exe, e[0])
                s = sprintf(s, s8(it.value)) if e[1] else s
                text_centred(fb, f, *EFFECT_AT, s, STATE_INK.get(it.state, OTHER_INK), SHADOW)
        abits = k.picture(8)
        blit_opaque(fb, abits, CARRIED_TICK, self.ticks[int(g)])
        blit_opaque(fb, abits, GROUND_TICK, self.ticks[0 if g else 1])
        for off, ink, at in (CARRIED_LABEL, GROUND_LABEL):
            f.draw(fb, *at, ds_str(k.exe, off), ink, SHADOW)


def _inside(rect, pos) -> bool:
    x, y, w, h = rect
    return x <= pos[0] < x + w and y <= pos[1] < y + h


@registry.dialog("hero_inspect")
def hero_inspect(host, on_close=None):
    return HeroInspect(host, on_close)


@registry.action(registry.MENU_ID["hero_inspect"])
def open_hero_inspect(host):
    """07be:0297 -> ovl40:0000; nothing without a hero of the side (ovl40:005d)."""
    st = getattr(host, "state", None)
    if st is None or not heroes(st):
        return None
    return registry.open_dialog("hero_inspect", host, on_close=lambda _: host.settings_closed())


@registry.action(registry.MENU_ID["plant_flag"])
def plant_flag(host):
    """Hero > Plant Standard (key 'f', 07be:01d7 -> ovl47:09f7): `PlantFlag` for the selected
    stack's hero DS:5e5e; every refusal is silent (09fb..0a7c and 0a89 return without a word),
    a planted standard redraws the map and the palette (ovl64:006c, ovl61:0174 at 0b2e / 0b3f)."""
    st = getattr(host, "state", None)
    if st is None or human_phase(host) is None:
        return None
    if st.selection.hero < 0:
        return None
    return answer(host, C.PlantFlag(st.selection.hero))
