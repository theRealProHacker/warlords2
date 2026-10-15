"""Hero > Search (menu 521, key 'z') and the "Searching" pop-up of a ruin search with its result
(ovl34:0000, 01ab, 175b, 17c9, 1812, 186e, 1964); the blessing message (ovl34:08a1).

Evidence (asm ovl34, read from the user's EXE):
* key table 07be:0337 'z' -> 07be:0279 -> ovl34:0000: `Search` with the selected stack; every
  refusal (no stack, no movement, not a site, no hero away from a temple, explored) returns
  without a message or a sound (0010..00fe), as the engine's IllegalCommand here;
* a human's ruin search (01ab): 01eb ovl36:1a41(hero x, y, 0): WAR.PCK (picture 11) cell DS:0d02
  = (0, 121, 48, 40) masked on the map square; 01f8 ovl34:175b: popup type 4 ((120, 50) 400x360,
  marble, framed), SetFont(1, 15, 0, 3) DGROUP "Searching" (DS:0c90) centred at DS:0c50, SEARCH.PCK
  (picture 0x23) source DS:0c60 opaque at DS:0c68, colour-0 outline DS:0c6c, DS:0c74 = 1; 01fe
  ovl58:01a9(0) (`audio.effects`);
* ovl34:17c9(line): SetFont(2, 15, 0, 3), the line left-aligned (ovl59:00bf) at the slot
  DS:0c50 + 4 k (k = DS:0c74: (128, 300), (128, 320), (128, 340)), then k + 1;
* ovl61:10fb(NULL) (0248, 02a7, 03e9): no popup, only DS:166a = 1 and the wait for a mouse
  release or a key (ovl59:0142), then the input flush;
* lines: no guardian (+0x1a == 0, kind != 5): (50, 0), wait (0225..024b); a guardian:
  sprintf((51, 0), hero name, monster name 2c04:0f67 + 0x10 t), wait, ovl58:01a9(1) (0290..02b1);
  the hero slain: (51, 1) then 1812(0) (03b9..03c3); victorious: (51, 2), wait (03e0..03e9);
  kind 2: sprintf((52, 0), hero, item name), 1812(1) (0456..046e); kind 4: sprintf((53, 0),
  hero, gold), 1812(0) (0624..063c); kind 5 (no guardian section): n > 1 sprintf((54, 1), n,
  type name (ovl44:14f4), hero), n == 1 sprintf((54, 0), type name, hero), 1812(0) (06d1..072c);
* ovl34:1812(take): ovl53:056a(13): 292 OK, 293 Take (only with take, 182f..1858); Return
  presses Take after an item (07be:0001 puts 0x125 into the Return list DS:155c), else OK;
  Escape presses OK (DS:1514); the other keys as on every pop-up (`ui.keys.popup_key`:
  'A'..'Z' nothing, the rest the chord);
* 292 -> ovl34:1964: ovl17:069c; the stack on the search square selected again (the engine's
  re-selection, rules.ruins); 293 -> ovl34:186e: every item lying on the hero's square (ovl51:03d9
  mode 3) to the hero, the popup closed, the stack selected, ovl61:011f(1, 0, 1), ovl01:1ded(3);
* blessing ovl34:08a1 (0a31..0a94): n blessed: (55, 0) for 0, (56, 0) for 1, sprintf((56, 1), n)
  for more; a human sees ovl61:1160(that line, (56, 2)) (the two-line message).
The events of one Search come together; the pop-up's lines are read from the events still queued
for the animator (`ui.animate.Animator.queue`), so the steps play in the EXE's order and the
rest of the command (the hero's death, the re-selection) plays after the pop-up closes.

Take is the command `TakeAll` (ovl34:186e: every lying item, the re-selection, one item quest
check).  Deviations: a site of another kind (the EXE leaves
the pop-up up without a close, ovl34:0416) gets OK; the guardian's orch sample plays when the
fight's event starts (M10a), before the guardian line, not after its wait.
"""
from __future__ import annotations

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...model import events as E
from ...model.ids import Control, SiteKind
from .. import registry
from ..dialog import Dialog
from ..keys import RETURN_LIST, ds_list, popup_input
from ..mapview import AREA
from ..typename import type_name
from ..widgets import ButtonRow, blit_opaque, is_dismiss, kit, text_centred
from .hero_offer import answer, human_phase, outline, raw, sprintf, wait

POPUP, SCREEN = 4, 13
OK, TAKE = 292, 293
TITLE, SLOTS, PIC_SRC, PIC_AT, PIC_FRAME = 0x0C90, 0x0C50, 0x0C60, 0x0C68, 0x0C6C
SEARCH_PICTURE = 0x23
WAR_PICTURE, WAR_CELL = 11, 0x0D02                # ovl36:1a65, DS:0d02 + 8 * 0
TILE = 40
INK, SHADOW = 15, 0
G_EMPTY, G_GUARD, G_ITEM, G_GOLD, G_ALLIES = 50, 51, 52, 53, 54
G_NONE_BLESSED, G_BLESSED = 55, 56
RUIN_KINDS = (SiteKind.ITEM_RUIN, SiteKind.GOLD_RUIN, SiteKind.ALLIES_RUIN)


def human(state) -> bool:
    return state.players[state.current].control == Control.HUMAN


def group_of(state) -> tuple:
    """The selected stack as `rules.selection.adopt` sees it (DS:2bda as stored): ovl34:0000
    itself reads only DS:5e62 / 5e5e."""
    sel = state.selection
    return tuple(i for i in sel.moving if i != -1) if sel.group else (sel.selected,)


@registry.action(registry.MENU_ID["hero_search"])
def search(host):
    """07be:0279 -> ovl34:0000 with the selected stack (refusals are silent)."""
    st = getattr(host, "state", None)
    if st is None or human_phase(host) is None or st.selection.selected < 0:
        return None
    return answer(host, C.Search(group_of(st)))


class Searching(Dialog):
    """ovl34:175b's pop-up with the lines of ovl34:17c9."""

    def __init__(self, host, marker=None, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        exe = k.exe
        self.title_at = ds_words(exe, SLOTS, 2)
        self.slots = [ds_words(exe, SLOTS + 4 * i, 2) for i in range(1, 4)]
        self.pic_src, self.pic_at = ds_words(exe, PIC_SRC, 4), ds_words(exe, PIC_AT, 2)
        self.frame = ds_words(exe, PIC_FRAME, 4)
        self.lines: list[str] = []
        self.marker = marker
        self.origin = host.view.origin

    def line(self, s: str) -> None:
        if len(self.lines) < len(self.slots):
            self.lines.append(s)

    def draw_marker(self, fb) -> None:
        """ovl36:1a41(x, y, 0) into the map (cleared by the map redraw after the pop-up)."""
        if self.marker is None:
            return
        left, top = self.origin
        x, y = self.marker
        fb.set_clip(AREA)
        fb.blit(self.k.picture(WAR_PICTURE), (AREA[0] + (x - left) * TILE, AREA[1] + (y - top) * TILE),
                ds_words(self.k.exe, WAR_CELL, 4))
        fb.set_clip(None)

    def draw(self, fb) -> None:
        k = self.k
        self.draw_marker(fb)
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *self.title_at, ds_str(k.exe, TITLE), INK, SHADOW)
        blit_opaque(fb, k.picture(SEARCH_PICTURE), self.pic_at, self.pic_src)
        outline(fb, self.frame)
        f = k.fonts[CHANCE17]
        for (x, y), s in zip(self.slots, self.lines):
            f.draw(fb, x, y, s, INK, SHADOW)


class SearchResult(Searching):
    """The ruin search: lines and waits in the EXE's order, then ovl34:1812."""

    def __init__(self, host, steps, hero: int, square, on_close=None):
        super().__init__(host, marker=square, on_close=on_close)
        self.steps = list(steps)
        self.hero, self.square = hero, square
        self.row = None
        self.take = False
        self.advance()

    def advance(self) -> None:
        while self.steps:
            op, arg = self.steps.pop(0)
            if op == "line":
                self.line(arg)
            elif op == "wait":
                return
            elif op == "end":                                 # ovl34:1812(arg)
                self.take = bool(arg)
                lay = self.k.layouts.screen(SCREEN)
                self.row = ButtonRow([b for b in lay.buttons if b.id == OK or (b.id == TAKE and self.take)],
                                     self.k.picture)
                return

    def update(self, events, dt) -> None:
        if self.row is None:
            if any(is_dismiss(e) for e in events):           # ovl61:10fb(NULL)
                self.advance()
            return
        popup_input(self, events, self.row, self.k.exe, self.press, ret=self.return_list())

    def return_list(self) -> tuple[int, ...]:
        """DS:155c after ovl34:1812: 07be:0001(292, 293) with take, else 07be:0001(293, 292)."""
        old, new = (OK, TAKE) if self.take else (TAKE, OK)
        ids = list(ds_list(self.k.exe, RETURN_LIST))
        if old in ids:
            ids[ids.index(old)] = new
        return tuple(ids)

    def press(self, id: int) -> bool:
        self.close(id)
        if id == TAKE:                                        # ovl34:186e
            answer(self.host, C.TakeAll(self.hero))
        return True

    def draw(self, fb) -> None:
        super().draw(fb)
        if self.row is not None:
            self.row.draw(fb)


def _queued(host) -> list:
    anim = getattr(getattr(host, "phase", None), "animator", None)
    return list(anim.queue) if anim is not None else []


def _before(host):
    """The state as it was before the command (the animator's scene), else the state."""
    anim = getattr(getattr(host, "phase", None), "animator", None)
    return anim.scene if anim is not None and anim.scene is not None else host.state


def ruin_steps(k, before, site, ev, rest) -> list:
    """The pop-up's steps for a ruin search from its first event and the ones queued after it."""
    hero = before.armies[ev.info["hero"]]
    name = before.heroes[hero.hero_slot].name
    steps = []
    fight = next((e for e in rest if isinstance(e, E.GuardianFought)), None)
    if site.kind != SiteKind.ALLIES_RUIN:
        if fight is None:
            steps += [("line", raw(k, G_EMPTY, 0)), ("wait", None)]
        else:
            monster = before.monsters[fight.info["guardian"]].name
            steps += [("line", sprintf(raw(k, G_GUARD, 0), name, monster)), ("wait", None)]
            if fight.info["hero_died"]:
                return steps + [("line", raw(k, G_GUARD, 1)), ("end", 0)]
            steps += [("line", raw(k, G_GUARD, 2)), ("wait", None)]
    if site.kind == SiteKind.ITEM_RUIN:
        found = next(e for e in rest if isinstance(e, E.ItemFound))
        return steps + [("line", sprintf(raw(k, G_ITEM, 0), name, before.items[found.info["item"]].name)),
                        ("end", 1)]
    if site.kind == SiteKind.GOLD_RUIN:
        gold = next(e for e in rest if isinstance(e, E.SiteSearched) and "gold" in e.info).info["gold"]
        return steps + [("line", sprintf(raw(k, G_GOLD, 0), name, gold)), ("end", 0)]
    if site.kind == SiteKind.ALLIES_RUIN:
        al = next(e for e in rest if isinstance(e, E.AlliesJoined))
        n, t = al.info["count"], type_name(k, before, al.info["type"])          # ovl34:06b2 / 06f7
        s = sprintf(raw(k, G_ALLIES, 1), n, t, name) if n > 1 else sprintf(raw(k, G_ALLIES, 0), t, name)
        return steps + [("line", s), ("end", 0)]
    return steps + [("end", 0)]


@registry.dialog("search_result")
def search_result(host, event, on_close=None):
    k = kit(host.app)
    before = _before(host)
    site = before.sites[event.info["site"]]
    hero = before.armies[event.info["hero"]]
    steps = ruin_steps(k, before, site, event, _queued(host))
    return SearchResult(host, steps, event.info["hero"], (hero.x, hero.y), on_close)


@registry.event_view(E.SiteSearched)
def _ruin(host, ev):
    i = ev.info
    if "hero" not in i or "kind" not in i or i.get("temple_menu") or "gold" in i:
        return None
    if i["kind"] not in RUIN_KINDS or not human(host.state):
        return None
    return wait(registry.open_dialog("search_result", host, event=ev))


SHOWN: set[int] = set()                          # Blessed events the temple menu already showed


def blessing_lines(k, ev) -> list[str]:
    """ovl34:0a31..0a94."""
    n = len(ev.info["armies"])
    first = raw(k, G_NONE_BLESSED, 0) if n == 0 else raw(k, G_BLESSED, 0) if n == 1 else \
        sprintf(raw(k, G_BLESSED, 1), n)
    return [first, raw(k, G_BLESSED, 2)]


@registry.event_view(E.Blessed)
def _blessed(host, ev):
    """The blessing without the temple menu (ovl34:00ce: a stack without a hero)."""
    if id(ev) in SHOWN:
        SHOWN.discard(id(ev))
        return None
    if not human(host.state):
        return None
    return wait(registry.open_dialog("message", host, lines=blessing_lines(kit(host.app), ev)))
