"""Keys and button presses while a pop-up screen is up (07be:0064 with DS:166a set).

Evidence (asm res_07be, res_08a9, ovl53):
* 07be:0064: a code in 'A'..'Z' (0x41..0x5a) is ignored (00bd; with DS:166a set no 1372:0047
  runs before it, so only those codes); Esc (0x1b) presses the first button of the list
  DS:1514 whose state (08a9:05ab, byte +4 of the current JOIN screen's record) is 1, Return
  (0x0d) the same with DS:155c (00cc..0122, the press 07be:04d8).  Then 07be:0444 returns 0
  (DS:166a set, 0458) and 07be:03ef returns 1 for every code (DS:166a set, 03f2), so the key
  table cs:0337 (the map scrolls, the menu letters, the city screen's 'b' / 'c' / 'p' / 'v')
  is never reached and ^W (07be:0430) never tested.
* 07be:03ef: 0x1b and 0x153 (Del) -> DS:4c3e = 08a9:03f5(1) (the index of the button with id
  1, else 0; no BUTTON.DAT record has id 1) and 07be:0e26(0) on that index; 0x181 nothing;
  every other code the chord ovl58:0b5f (0426).
* Index 0 of every JOIN screen's table is BUTTON.DAT's all-zero first record of the group
  (ovl53:056a copies the group's records as they are, 06ee..0718; the hit test 08a9:0756
  treats index 0 as "none"), and ovl53:056a -> 08a9:0345 clears every record's state and
  visibility, so 0e26 finds state 0 there and chords (0e56..0e7b).  So Esc with no live
  listed button, Del and every other code chord; no button is pressed by them.
* 07be:0e26(1) (the left press, 08a9:012c with DS:4c3e = the button under the pointer): a
  button whose state is 0 (already pressed) or 2 (disabled) gets the chord (0e7b) and nothing
  else.
* A right press over a visible button (08a9:0756 skips hidden ones, byte +5, and checks no
  state) runs its help ovl15:0000 (08a9:013d..0159), unless a left press is held on a button
  (DS:166c, set by 07be:0e9c for a live button; 08a9:0143): `ButtonRow.held`.  DS:166c is
  cleared by the next left release wherever it is (08a9:0189 -> 01c5), as `ButtonRow.event`
  clears `held`.  `right_help` is that test for every screen; with DS:166c set the area
  handlers of the poll 0726:0009 (0726:0493 jump table: the pop-ups' map and slot areas) do
  not run either (0016..001f returns 0).
* While DS:166c is set a key does nothing at all, neither press nor chord (07be:006f..007a:
  the key call 08a9:010b passes 1, so 0x331 returns 0 before any list or table).
The EXE's lists test the state byte only (a hidden button keeps it, 08a9:03b3 clears byte +5
alone); `ButtonRow` holds the visible buttons, so a button hidden after it was made live is
not found here.  The dialogs that use this rebuild their rows on every state change and
hide no button that the lists name after making it live.
"""
from __future__ import annotations

import pygame

from ..assets.exe import ds_words
from .layout import NORMAL

ESC, RETURN, DEL, SILENT = 0x1B, 0x0D, 0x153, 0x181
ESC_LIST, RETURN_LIST = 0x1514, 0x155C
UPPER = range(0x41, 0x5B)

# keys whose getch codes `ui.menubar.getch_code` leaves out: the control characters Backspace /
# Tab and the extended keys (0x100 + BIOS scan code, as getch's 0 prefix is counted here); F11 /
# F12 (scan 0x85 / 0x86) are left out, DOS getch does not report them
K_HOME, K_END, K_DEL, K_BACKSPACE, K_TAB = 0x147, 0x14F, 0x153, 0x08, 0x09
K_PGUP, K_PGDN = 0x149, 0x151
F_KEYS = {getattr(pygame, "K_F%d" % n): 0x13B + n - 1 for n in range(2, 11)}     # F2..F10: 0x13c..0x144
EXTENDED = {pygame.K_HOME: K_HOME, pygame.K_END: K_END, pygame.K_DELETE: K_DEL,
            pygame.K_BACKSPACE: K_BACKSPACE, pygame.K_TAB: K_TAB,
            pygame.K_KP7: K_HOME, pygame.K_KP1: K_END, pygame.K_KP_PERIOD: K_DEL,
            pygame.K_PAGEUP: K_PGUP, pygame.K_PAGEDOWN: K_PGDN, **F_KEYS}

_lists: dict[tuple[int, int], tuple[int, ...]] = {}


def ds_list(exe: bytes, off: int) -> tuple[int, ...]:
    """A zero-ended word list in DGROUP."""
    key = (id(exe), off)
    if key not in _lists:
        out = []
        while (v := ds_words(exe, off + 2 * len(out), 1, signed=False)[0]) != 0:
            out.append(v)
        _lists[key] = tuple(out)
    return _lists[key]


def code_of(e: pygame.event.Event, code: int | None) -> int | None:
    """The getch code of a KEYDOWN (`with_codes`' code, or the extended code of the keys it
    leaves out); None for any other event."""
    if e.type != pygame.KEYDOWN:
        return None
    return EXTENDED.get(e.key, code)


def first_live(row, ids) -> int | None:
    """07be:00d6..0102 / 010e..012e: the first id of the list whose button is live (state 1)."""
    shown = {b.id for b in row.buttons}
    return next((i for i in ids if i in shown and row.state.get(i) == NORMAL), None)


def popup_key(app, row, code: int | None, exe: bytes, esc=None, ret=None) -> int | None:
    """07be:0064 with DS:166a set: the id of the button the key presses, or None (the chord
    already played when it is due).  `esc` / `ret` replace the lists DS:1514 / DS:155c (the
    capture question edits its Return list, 07be:0001)."""
    if code is None or code in UPPER or row.held is not None:      # 07be:006f DS:166c
        return None
    if code == ESC:
        hit = first_live(row, ds_list(exe, ESC_LIST) if esc is None else esc)
        if hit is not None:
            return hit
    elif code == RETURN:
        hit = first_live(row, ds_list(exe, RETURN_LIST) if ret is None else ret)
        if hit is not None:
            return hit
    if code != SILENT:
        from ..audio import effects
        effects.chord(app)                    # 07be:0e7b on record 0 (Esc, Del) / 07be:0426
    return None


def right_help(host, row, pos) -> bool:
    """08a9:012c with a right press.  True when the press is used up: a shown button is under
    `pos` (08a9:0756), whose help (`registry.right_click_handler("button")`, ovl15:0000) opens
    unless a left press is held on a button (DS:166c, 08a9:0143); or such a press is held,
    which also stops every pop-up's area handlers (the poll 0726:0009 returns at 0016..001f).
    False: the caller's areas may take it."""
    from . import registry
    b = row.at(pos)
    if row.held is not None:
        return True
    if b is None:
        return False
    fn = registry.right_click_handler("button")
    if fn is not None:
        fn(host, b.id, pos)
    return True


def left_press(app, row, e: pygame.event.Event) -> None:
    """08a9:012c -> 07be:0e26(1): the chord on a pressed or disabled button, then the press."""
    b = row.at(e.pos)
    if b is not None and row.state.get(b.id) != NORMAL:
        from ..audio import effects
        effects.chord(app)                    # 07be:0e7b
    row.event(e)


def popup_input(dialog, events, row, exe: bytes, press, help_host=None, esc=None, ret=None) -> list:
    """The input of a pop-up screen whose only inputs are its buttons: right press -> help
    (`registry.right_click_handler("button")`, with `help_host`), left press / release /
    motion -> the buttons, keys -> `popup_key`.  `row` is a ButtonRow, or a function that
    returns the current one (for a dialog whose press rebuilds its row).  `press(id)` runs a
    button; the loop stops once the dialog is no longer on top, or when `press` returns True;
    the events after that one are returned."""
    from .menubar import with_codes
    app = dialog.host.app
    current = row if callable(row) else (lambda: row)
    for i, (e, code) in enumerate(with_codes(events, app.input)):
        if dialog.stack is None or dialog.stack.top is not dialog:
            return []
        row = current()
        hit = None
        if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
            right_help(help_host or dialog.host, row, e.pos)
        elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
            left_press(app, row, e)
        elif e.type in (pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
            hit = row.event(e)
        elif e.type == pygame.KEYDOWN:
            hit = popup_key(app, row, code_of(e, code), exe, esc, ret)
        if hit is not None and press(hit):
            return list(events[i + 1:])
    return []


def hand_on(dialog, rest, dt) -> None:
    """One event queue (11b5:0003): the events after a press that opened another pop-up go to
    it, not lost with this frame's batch."""
    if rest and dialog.stack is not None and dialog.stack.top is not dialog:
        dialog.stack.top.update(rest, dt)
