"""The menu bar and its drop-down menus, as WARLORD2.EXE builds and runs them.

All text and keys come from the user's EXE (DGROUP, `assets.exe`):

* DS:1cac menu root: far titles (run-time copy), far action table, u16 title count,
  u16 action count (Evidence: EXE 1372:0002 / ovl54:0198).
* DS:1adc title table, 12 bytes per title: far item list, far title string, u16 key
  that opens the menu, u16 menu number (copied by ovl54:0052).
* Item list: far strings ended by a null pointer; an entry "%" is a separator, an entry
  followed by "&" has the next entry as its key label.  Items are numbered from 1,
  separators and key labels are not counted (1372:049b, 1372:1286).
* DS:1798 action table, 8 bytes per row: u16 action id, u16 menu, u16 item, u16 key in
  Borland getch form (0x100 + scan code for Alt and function keys, ASCII otherwise).

Geometry and colours (font slot 0 = TEXT, height h):
* titles from x = 8: text width w rounded up to a multiple of 8; title rectangle
  (x, 0, w + 8, h + 2); text at (x + 2, 1); next x = x + w + 16 (ovl54:0052, 1372:132f);
* the bar is filled with colour 15 over (0, 0, 640, h + 2) (ovl54:02d8, ovl54:0341);
* enabled text: SetFont(0, 0, 15, 15); disabled: SetFont(0, 3, 15, 15) (ovl54:029c);
  a title is drawn enabled when its menu has any enabled item (1372:132f); menu text
  is drawn opaque (11e2:0401) on colour 15;
* drop-down at (title x, h + 3): measured by 1372:049b, frame by 1372:0803 (fill 15 over
  (x + 1, y, w - 3, h - 2), black lines, one-pixel drop shadow right and below),
  separators are a black line, items 2 px apart;
* the open title is XORed with 7 over (x, 0, w + 8, h + 1) (1372:102d), the item under
  the pointer with 15 over (x + 1, y + item_y, w - 3, h + 1) (1372:0ad8).

Behaviour (1372:00f0, 0047, 111b, 0428): a left press on a title opens its menu and the
pointer is tracked until a mouse button is released; the item under the pointer then
runs.  Keys: the menu's own key (Alt + letter) or F1 / Insert (last menu) open it for
the keyboard: Up / Down move over enabled items, Left / Right change menu, Return runs
the item, Escape closes.  An item's own key runs it directly; the key of a disabled item
is swallowed.  Disabled items cannot be highlighted or chosen.

An item is enabled when the host has enabled it (1372:0ef8 / 0e17, mirrored by `enable`
and `enable_menu`) and its action id is registered (`ui.registry`).  The bar starts with
every item enabled by the host (1372:1286).  Not implemented: check marks (1372:0ce7,
no caller found yet) and the title flash after a shortcut key (1372:111b; its timer
unit is not traced).
"""
from __future__ import annotations

from dataclasses import dataclass, field

import pygame

from ..assets.exe import ds_far, ds_str, ds_words
from . import registry
from .dialog import Dialog
from .input import MODIFIERS

ROOT, TITLES, TITLE_REC, ACTION_REC = 0x1CAC, 0x1ADC, 12, 8
SEPARATOR, KEYMARK = "%", "&"
FONT_SLOT = 0
BAR_W = 640
X0, GAP = 8, 8
ENABLED_INK, DISABLED_INK, PAPER = 0, 3, 15
TITLE_XOR, ITEM_XOR = 7, 15
LEFT_MARGIN, TEXT_X, RIGHT_PAD = 12, 3, 5     # 1372:049b
OFF = 0x2710                                   # item_y of a disabled item (never hit)

# Borland getch codes of the non-ASCII keys the menu loop reads
K_ENTER, K_ESC, K_UP, K_LEFT, K_RIGHT, K_DOWN, K_F1, K_INS = (
    0x0D, 0x1B, 0x148, 0x14B, 0x14D, 0x150, 0x13B, 0x152)
SCAN = {c: s for s, row in ((0x10, "qwertyuiop"), (0x1E, "asdfghjkl"), (0x2C, "zxcvbnm"))
        for c, s in zip(row, range(s, s + len(row)))}
SPECIAL = {pygame.K_RETURN: K_ENTER, pygame.K_KP_ENTER: K_ENTER, pygame.K_ESCAPE: K_ESC,
           pygame.K_UP: K_UP, pygame.K_LEFT: K_LEFT, pygame.K_RIGHT: K_RIGHT,
           pygame.K_DOWN: K_DOWN, pygame.K_F1: K_F1, pygame.K_INSERT: K_INS}


def getch_code(e: pygame.event.Event, alt: bool, ctrl: bool) -> int | None:
    """The Borland getch code a KEYDOWN would have produced, or None."""
    if e.key in SPECIAL:
        return SPECIAL[e.key]
    name = pygame.key.name(e.key)
    if alt and name in SCAN:
        return 0x100 + SCAN[name]
    if ctrl and len(name) == 1 and name.isalpha():
        return ord(name) & 0x1F
    u = getattr(e, "unicode", "")
    return ord(u) if len(u) == 1 and 32 <= ord(u) < 127 else None


def with_codes(events: list[pygame.event.Event], input) -> list[tuple[pygame.event.Event, int | None]]:
    """Each event with the getch code of a KEYDOWN (else None), under the Alt / Ctrl held
    at that event.  `input` (`ui.input.Input`) has already seen the whole frame, so its
    held modifier keys are first rolled back over this frame's modifier events."""
    held = {k for k in input.keys if k in MODIFIERS}
    for e in reversed(events):
        if e.type in (pygame.KEYDOWN, pygame.KEYUP) and e.key in MODIFIERS:
            (held.discard if e.type == pygame.KEYDOWN else held.add)(e.key)
    out = []
    for e in events:
        code = None
        if e.type in (pygame.KEYDOWN, pygame.KEYUP) and e.key in MODIFIERS:
            (held.add if e.type == pygame.KEYDOWN else held.discard)(e.key)
        elif e.type == pygame.KEYDOWN:
            kinds = {MODIFIERS[k] for k in held}
            code = getch_code(e, "alt" in kinds, "ctrl" in kinds)
        out.append((e, code))
    return out


# --------------------------------------------------------------------------- EXE tables


@dataclass
class Item:
    number: int                  # 1-based, as in the action table
    label: str
    key_label: str | None
    separator_before: bool


@dataclass
class Menu:
    number: int
    title: str
    key: int
    entries: list[str]           # raw item list, separators and key marks included
    items: list[Item] = field(default_factory=list)


@dataclass(frozen=True)
class MenuAction:
    id: int
    menu: int
    item: int
    key: int


def read_menu_tables(exe: bytes) -> tuple[list[Menu], list[MenuAction]]:
    """Menus and the action table from WARLORD2.EXE (v1.02 offsets)."""
    _, _, act, _ = ds_words(exe, ROOT, 4, signed=False)
    n_titles, n_actions = ds_words(exe, ROOT + 8, 2, signed=False)
    menus = []
    for i in range(n_titles):
        rec = TITLES + TITLE_REC * i
        items_p, title_p = ds_far(exe, rec), ds_far(exe, rec + 4)
        key, number = ds_words(exe, rec + 8, 2, signed=False)
        entries, p = [], items_p
        while (s := ds_far(exe, p)) is not None:
            entries.append(ds_str(exe, s))
            p += 4
        m = Menu(number, ds_str(exe, title_p), key, entries)
        sep, j = False, 0
        while j < len(entries):
            if entries[j] == SEPARATOR:
                sep, j = True, j + 1
                continue
            keyed = j + 1 < len(entries) and entries[j + 1] == KEYMARK
            m.items.append(Item(len(m.items) + 1, entries[j], entries[j + 2] if keyed else None, sep))
            sep, j = False, j + (3 if keyed else 1)
        menus.append(m)
    actions = [MenuAction(*ds_words(exe, act + ACTION_REC * i, 4, signed=False)) for i in range(n_actions)]
    return menus, actions


def check_menu_ids(actions: list[MenuAction]) -> None:
    """The registry's menu names must sit where the user's EXE puts their ids."""
    exe = {a.id: (a.menu, a.item) for a in actions}
    for name, (id, menu, item) in registry.MENU.items():
        if exe.get(id) != (menu, item):
            raise ValueError(f"menu action {name} ({id}) is at {exe.get(id)} in the EXE, not {(menu, item)}")
    if set(exe) != set(registry.MENU_ID.values()):
        raise ValueError("EXE menu action ids differ from ui.registry.MENU")


def xor_rect(fb: pygame.Surface, rect: tuple[int, int, int, int], colour: int) -> None:
    x, y, w, h = rect
    px = pygame.surfarray.pixels2d(fb)
    px[max(x, 0):x + w, max(y, 0):y + h] ^= colour
    del px


# --------------------------------------------------------------------------- bar


class MenuBar:
    def __init__(self, menus: list[Menu], actions: list[MenuAction], font,
                 is_registered=registry.has_action):
        self.menus, self.actions, self.font = menus, actions, font
        self.is_registered = is_registered
        self.h = font.height
        self.by_item = {(a.menu, a.item): a for a in actions}
        self.by_id = {a.id: a for a in actions}
        self.by_key = {a.key: a for a in actions}
        self.title_rects, self.text_pos = [], []
        x = X0
        for m in menus:
            w = (font.width(m.title) + 7) // 8 * 8
            self.title_rects.append((x, 0, w + GAP, self.h + 2))
            self.text_pos.append((x + 2, 1))
            x += w + 2 * GAP
        # host enable masks, bit n = item n (1372:1286: all items on)
        self.masks = [sum(1 << it.number for it in m.items) & 0xFFFFFE for m in menus]
        self.last = (0, None)               # last menu / item chosen by keyboard

    # host side (1372:0ef8, 0e17, 0eab)
    def enable(self, id: int, on: bool) -> None:
        a = self.by_id[id]
        bit = 1 << a.item
        self.masks[a.menu] = (self.masks[a.menu] & ~bit) | (bit if on else 0)

    def enable_menu(self, menu: int | None, on: bool) -> None:
        """Every item of one menu, or of all menus when `menu` is None."""
        for i in (range(len(self.menus)) if menu is None else [menu]):
            self.masks[i] = 0xFFFFFF if on else 0

    def host_enabled(self, menu: int, item: int) -> bool:
        return bool(self.masks[menu] >> item & 1)

    def item_enabled(self, menu: int, item: int) -> bool:
        a = self.by_item.get((menu, item))
        return a is not None and self.host_enabled(menu, item) and self.is_registered(a.id)

    def title_enabled(self, menu: int) -> bool:
        return self.masks[menu] != 0

    def title_at(self, pos: tuple[int, int]) -> int | None:
        for i, (x, y, w, h) in enumerate(self.title_rects):
            if x <= pos[0] < x + w and y <= pos[1] < y + h:
                return i
        return None

    def draw(self, fb: pygame.Surface) -> None:
        fb.fill(PAPER, (0, 0, BAR_W, self.h + 2))
        for i, m in enumerate(self.menus):
            ink = ENABLED_INK if self.title_enabled(i) else DISABLED_INK
            self.font.draw(fb, *self.text_pos[i], m.title, ink, PAPER, PAPER)

    # input side: `host` has `dialogs` and `app.input`
    def press(self, host, pos: tuple[int, int]) -> bool:
        """A left press at pos while no menu is open: open the menu under it for the mouse
        (1372:00f0 mode 1); True when the menu bar used it."""
        i = self.title_at(pos)
        if i is None:
            return False
        host.dialogs.push(MenuDialog(self, host, i, keyboard=False))
        return True

    def key(self, host, code: int) -> bool:
        """A getch code typed while no menu is open; True when the menu bar used it."""
        if code in (K_F1, K_INS):
            menu, item = self.last
            host.dialogs.push(MenuDialog(self, host, menu, keyboard=True, item=item))
            return True
        for i, m in enumerate(self.menus):
            if m.key == code:
                host.dialogs.push(MenuDialog(self, host, i, keyboard=True))
                return True
        a = self.by_key.get(code)
        if a is None:
            return False
        if self.item_enabled(a.menu, a.item):
            registry.run_action(a.id, host)
        return True                         # a disabled item's key is swallowed

    def choose(self, host, menu: int, item: int | None) -> None:
        if item is not None and self.item_enabled(menu, item):
            registry.run_action(self.by_item[(menu, item)].id, host)


class MenuDialog(Dialog):
    """An open drop-down; modal like the EXE's menu loop."""

    def __init__(self, bar: MenuBar, host, menu: int, keyboard: bool, item: int | None = None):
        super().__init__(on_close=lambda r: r and bar.choose(host, *r))
        self.bar, self.input, self.keyboard = bar, host.app.input, keyboard
        self._open(menu, item)
        if not keyboard:
            self._track(self.input.pos)

    def _open(self, menu: int, item: int | None = None) -> None:
        """Measure the drop-down of `menu` (1372:049b) and pick the keyboard item."""
        bar, f = self.bar, self.bar.font
        self.menu = menu
        tx, _, _, _ = bar.title_rects[menu]
        self.x, self.y = tx, bar.h + 3
        width, keycol, height, keyw = 0, 0, 2, 0
        self.rows = []                       # (kind, y, item) in drawing order
        self.item_y = {}
        for it in bar.menus[menu].items:
            if it.separator_before:
                self.rows.append(("sep", height, None))
                height += 2
            self.item_y[it.number] = height - 1 if bar.item_enabled(menu, it.number) else OFF
            right = LEFT_MARGIN + f.width(it.label)
            if it.key_label is not None:
                keycol = max(keycol, right + RIGHT_PAD)
                keyw = max(keyw, f.width(it.key_label))
                right = keycol + keyw
            width = max(width, right + RIGHT_PAD)
            self.rows.append(("item", height, it))
            height += f.height + 2
        self.w, self.h, self.keycol = width, height + 1, keycol
        enabled = [n for n, y in sorted(self.item_y.items()) if y != OFF]
        if item is None or self.item_y.get(item, OFF) == OFF:
            item = enabled[0] if enabled else None          # 1372:0c50 / 0c98
        self.item = item if self.keyboard else None

    def _hit(self, pos) -> int | None:
        """1372:0a5d: the item row under pos, highest number first."""
        for n in sorted(self.item_y, reverse=True):
            y = self.y + self.item_y[n]
            if self.x <= pos[0] < self.x + self.w and y <= pos[1] < y + self.bar.font.height + 1:
                return n
        return None

    def _track(self, pos) -> None:
        """1372:0428: switch menu under the pointer, highlight the item under it."""
        t = self.bar.title_at(pos)
        if t is not None and t != self.menu:
            self._open(t)
        self.item = self._hit(pos)

    def _step(self, d: int) -> None:
        enabled = [n for n, y in sorted(self.item_y.items()) if y != OFF]
        if self.item is None or not enabled:
            return
        later = [n for n in enabled if (n > self.item if d > 0 else n < self.item)]
        if later:
            self.item = later[0] if d > 0 else later[-1]

    def update(self, events, dt) -> None:
        for e, code in with_codes(events, self.input):
            if e.type == pygame.MOUSEBUTTONDOWN:
                self.keyboard = False
            elif e.type == pygame.MOUSEBUTTONUP and not self.keyboard:
                self._track(e.pos)
                return self.close((self.menu, self.item))
            elif e.type == pygame.KEYDOWN and self.keyboard:
                if code == K_ENTER:
                    self.bar.last = (self.menu, self.item)
                    return self.close((self.menu, self.item))
                if code == K_ESC:
                    return self.close(None)
                if code in (K_UP, K_DOWN):
                    self._step(1 if code == K_DOWN else -1)
                elif code in (K_LEFT, K_RIGHT):
                    n = self.menu + (1 if code == K_RIGHT else -1)
                    if 0 <= n < len(self.bar.menus):
                        self._open(n)
        if not self.keyboard:
            self._track(self.input.pos)

    def draw(self, fb: pygame.Surface) -> None:
        bar, f = self.bar, self.bar.font
        tx, ty, tw, th = bar.title_rects[self.menu]
        xor_rect(fb, (tx, 0, tw, th - 1), TITLE_XOR)
        x, y, w, h = self.x, self.y, self.w, self.h
        fb.fill(PAPER, (x + 1, y, w - 3, h - 2))
        fb.fill(0, (x, y + h - 2, w - 2, 1))
        fb.fill(0, (x + 2, y + h - 1, w - 2, 1))
        fb.fill(0, (x, y, 1, h - 2))
        fb.fill(0, (x + w - 2, y, 1, h - 1))
        fb.fill(0, (x + w - 1, y + 1, 1, h - 1))
        for kind, ry, it in self.rows:
            if kind == "sep":
                fb.fill(0, (x + 1, y + ry - 1, w - 2, 1))
                continue
            ink = ENABLED_INK if bar.item_enabled(self.menu, it.number) else DISABLED_INK
            f.draw(fb, x + TEXT_X, y + ry, it.label, ink, PAPER, PAPER)
            if it.key_label is not None:
                f.draw(fb, x + self.keycol, y + ry, it.key_label, ink, PAPER, PAPER)
        if self.item is not None and self.item_y.get(self.item, OFF) != OFF:
            xor_rect(fb, (x + 1, y + self.item_y[self.item], w - 3, f.height + 1), ITEM_XOR)


class TitleBar:
    """The program's one menu bar (1372:1286) with the title colours of its last repaint.

    Its titles are only repainted by 1372:132f, which the Game Start screen never calls: on
    the first visit every title is black (SHOT 00) although ovl60:011e has switched most items
    off; the setup screen repaints them (SHOT 09).  `draw` uses the masks of the last
    repaint for the titles; menus and keys use the live masks (`bar`)."""

    def __init__(self, k):
        self.bar = MenuBar(k.menus, k.menu_actions, k.fonts[FONT_SLOT])
        self.shown = list(self.bar.masks)

    def repaint(self, grey: bool = False) -> None:
        """1372:132f(grey): titles drawn from the masks as they are now."""
        self.shown = [0] * len(self.bar.masks) if grey else list(self.bar.masks)

    def draw(self, fb: pygame.Surface) -> None:
        live = self.bar.masks
        self.bar.masks = self.shown
        try:
            self.bar.draw(fb)
        finally:
            self.bar.masks = live

    def pre_game(self, saved_games: bool, saved_maps: bool, save_map: bool) -> None:
        """The enable sequence of ovl60:011e and ovl57:0416 (ovl57:0564..0612, with save_map =
        SCN 0x120): every title off (1372:0eab(0, 0)), 498 / 500 / 501 off, 502 / 504 as
        ovl49:0e25 / 0e42, 503 = save_map, 505 on, menus 2-5 and 7 off."""
        b, m = self.bar, registry.MENU_ID
        b.enable_menu(None, False)
        for name in ("settings", "new_game", "save_game"):
            b.enable(m[name], False)
        b.enable(m["load_game"], saved_games)
        b.enable(m["load_map"], saved_maps)
        b.enable(m["save_map"], save_map)
        b.enable(m["quit"], True)
        for menu in (2, 3, 4, 5, 7):
            b.enable_menu(menu, False)


def title_bar(app) -> TitleBar:
    """The one menu bar of the app, built on first use (main thread)."""
    from .widgets import kit
    t = getattr(app, "title_bar", None)
    if t is None:
        t = app.title_bar = TitleBar(kit(app))
    return t


def saved_games(app) -> bool:
    """ovl49:0e25 / 0e42: there are no saves or map slots before M10b / M11."""
    return False
