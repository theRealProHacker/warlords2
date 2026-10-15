"""The battle display of a human attack: the map mark, the battle window, the result lines.

Its timeline is played by `ui.anim.battle` (the event views); this module draws and keeps the
window's state.  Evidence (asm; positions and rectangles are DGROUP words read from the user's
EXE):

* ovl36:1836(x, y, 1) at ovl36:0275, before the prelude ovl36:0522 moves the stack: the view
  is rebuilt (ovl65:0227 on SCN 0x17d / 0x17f, ovl64:0053), war.pck (picture 11, 0997:034a(0xb))
  rectangle DS:0cfa = (0, 0, 128, 120) is blitted through its mask ([DS:69c8], mask DS:56f6)
  into the map bitmap at ((x - SCN 0x177) * 40 - 40, (y - SCN 0x175) * 40 - 40); on the view's
  left column (x == SCN 0x177) the source x + 40, width - 48 and no - 40 on the destination, on
  its right column (x == SCN 0x17b) width - 48, on its top row (y == SCN 0x175) source y + 40,
  height - 40 and no - 40, on its bottom row (y == SCN 0x179) height - 40 (1925..19b1); the
  bitmap goes to the screen at (16, 30) (14d0:009d); a human side hears war.8SN (ovl58:0206,
  which waits for the sample's end) with the pointer hidden (19d7..1a2d).  Nothing redraws the
  map before ovl61:011f after the battle, so the mark stays under the window and after it
  (ovl17:069c restores the screen the window covered).  The other early exits of 1836
  (computer side with several humans and Hidden Map; Hidden Map with DS:3254 set) do not
  apply to a human turn (ovl68:0259 clears DS:3254).
* ovl37:0160(0) -> ovl37:041c: popup type 8 (DS:06a8: (160, 60, 320, 312), marble), DS:4366 =
  0x12a (the first message line); bshield.pck (picture 38, 0997:034a(0x26)) cell
  (32 * o, 0, 32, 0x24) through its mask at DS:0d3c for the defending owner nibble and DS:0d40
  for the attacker (owner 0x0f -> column 8).  Slot positions (DS:43b8 x / DS:4368 y, 40 slots,
  defenders 0..31 then attackers 32..39, 01a1..02dd): full rows of 8 at x = DS:0d1e[0..7] and
  y = DS:0d14[row]; the last (or only) row of n < 8 units at x = DS:0d2e[4 - (n + 1) / 2 + i]
  for odd n, DS:0d1e[...] for even n; the attackers' row is DS:0d14[4].  Each unit (02df..0415):
  aboard (DS:4204 / DS:41fc, the set-up's flag: army bit 0x1000 on terrain 2 / 3) -> war.pck
  (0, 0xa2, 0x20, 0x12) opaque (0997:0129) at (x, y + 10); then ovl64:08be(type DS:4254 /
  DS:424c, owner DS:41fb / DS:41fa, x, y, ring 0, mode 0).  0160(0) runs with the pointer
  hidden (12bf:07a5 at ovl36:02cf, 12bf:0757 at 02e9).
* ovl37:0094 (per kill of DS:41b5): the explosion ovl37:0000(x, y, fast) = atrans2 (picture 9)
  (0x20, 0, 0x20, 0x1d) masked (0997:027e) at the dead unit's slot, ovl59:0000(5, or 2 when
  fast), then ovl17:07e4 restores the window picture's (x - 160, y - 60, 32, 30) - the unit is
  gone.  Timing and sounds: `ui.anim.battle`.
* ovl37:04c5(msg): SetFont(2, 15, 0, 3), centred at (0x140, DS:4366), DS:4366 += 0x14.
* ovl37:04f6: a human side (SCN 0x0d0[0x110] == 0) waits for ovl61:10fb(0) (a mouse release or
  a key), then ovl17:069c closes the window.

The window's names DS:4148 (the group's hero DS:5e5e by name, 2c04:0223 + 0x14 * army +0xa, else
the attacker's name 2c04:0000 + 0x14 * DS:41fa) and DS:4134 (the city's name, 2c04:1581 +
0x41 * ovl62:044a(x, y)) are written on a won city battle (ovl36:032e..0382) and read by the
capture question (ovl36:04f7 -> ovl31:0000); `battle_names` holds them.
"""
from __future__ import annotations

from collections import deque

import pygame

from ...assets.exe import ds_words
from ...assets.fonts import CHANCE17
from ...model.ids import Control, Terrain
from ...rules.bonuses import ABOARD_FLAG, s8
from ...rules.constants import combat as KC
from .. import registry
from ..dialog import Dialog
from ..mapview import AREA
from ..palettes import painter_for
from ..widgets import blit_opaque, is_dismiss, kit, text_centred

POPUP = 8
WAR, ATRANS, BSHIELD = 11, 9, 38                 # FILE.DAT group-3 pictures (0997:034a(0xb / 0x26), 027e(9))
MARK_RECT = 0x0CFA                               # ovl36:191b: (0, 0, 128, 120)
TILE = 0x28
MARK_EDGE_W, MARK_EDGE_H = 0x30, 0x28            # ovl36:192c..1964
SCN_TOP, SCN_LEFT, SCN_BOTTOM, SCN_RIGHT = 0x175, 0x177, 0x179, 0x17B
ROW_Y, EVEN_X, ODD_X = 0x0D14, 0x0D1E, 0x0D2E    # ovl37:01d1 / 01eb / 022f
SHIELD_D, SHIELD_A = 0x0D3C, 0x0D40              # ovl37:046c / 049a
SHIELD_W, SHIELD_H = 0x20, 0x24                  # ovl37:0475
ROW, A_ROW, A_BASE, SLOTS = 8, 4, 0x20, 0x28     # ovl37:01c8, 027b, 01ba
BOAT = (0, 0xA2, 0x20, 0x12)                     # ovl37:0322..032e (war.pck, opaque)
BOAT_DY = 0x0A                                   # ovl37:0309
BLAST = (0x20, 0, 0x20, 0x1D)                    # ovl37:000e..0014 (atrans2, masked)
RESTORE_H = 0x1E                                 # ovl37:006a: ovl17:07e4 keeps 32 x 30
FIRST_LINE, LINE_STEP, LINE_X = 0x12A, 0x14, 0x140   # ovl37:0429, 04ef, 04e4
INK, SHADOW = 15, 0
NEUTRAL, NEUTRAL_COLUMN = 0x0F, 8                # ovl37:042f..0451



def battle_names(host) -> list:
    """DS:4148 (attacker or hero name), DS:4134 (city name) of the last won city battle of this
    game: the host's `battle_names` (the game state sets it to [None, None] on entry)."""
    names = getattr(host, "battle_names", None)
    if names is None:
        names = host.battle_names = [None, None]
    return names


def slot_positions(exe, n_a: int, n_d: int) -> dict[int, tuple[int, int]]:
    """Slot -> (x, y) of ovl37:0160 (defenders 0..n_d-1, attackers 32..32+n_a-1)."""
    ys = ds_words(exe, ROW_Y, A_ROW + 1)
    even, odd = ds_words(exe, EVEN_X, ROW), ds_words(exe, ODD_X, ROW)
    pos = {}

    def row(base: int, n: int, y: int) -> None:
        si = A_ROW - int((n + 1) / 2)
        for i in range(n):
            pos[base + i] = ((odd if n & 1 else even)[si + i], y)

    di, n = 0, n_d
    while n:
        if n >= ROW:
            for i in range(ROW):
                pos[di + i] = (even[i], ys[di // ROW])
            di, n = di + ROW, n - ROW
        else:
            row(di, n, ys[di // ROW])
            di, n = di + n, 0
    row(A_BASE, n_a, ys[A_ROW])
    return pos


def mark_blit(exe, view_origin, x: int, y: int):
    """ovl36:190f..19d4: (source rect in war.pck, destination in the map bitmap)."""
    sx, sy, w, h = ds_words(exe, MARK_RECT, 4)
    left, top = view_origin
    right, bottom = left + 8, top + 8                # SCN 0x17b / 0x179 (game.store_view)
    if x == left:
        sx, w = sx + TILE, w - MARK_EDGE_W
    if x == right:
        w -= MARK_EDGE_W
    if y == top:
        sy, h = sy + TILE, h - MARK_EDGE_H
    if y == bottom:
        h -= MARK_EDGE_H
    dx = (x - left) * TILE - (0 if x == left else TILE)
    dy = (y - top) * TILE - (0 if y == top else TILE)
    return (sx, sy, w, h), (dx, dy)


class Fight(Dialog):
    """Phases: "mark" (the war sample), "kills" (window up), "result" (lines and the
    after-battle steps), "wait" (ovl61:10fb), "after" (window closed, the map mark stays until
    the battle's end redraws the map).  `ui.anim.battle` drives it; while it is the top dialog
    `update` steps the host's animator, whose current view is the battle's timeline."""

    def __init__(self, host, battle, scene, anim, on_close=None):
        super().__init__(on_close)
        self.host, self.anim = host, anim
        k = self.k = kit(host.app)
        info = battle.info
        self.x, self.y = info["x"], info["y"]
        self.attacker, self.owner = info["attacker"], info["owner"]
        self.attackers, self.defenders = list(info["attackers"]), list(info["defenders"])
        st = host.state
        terrain = int(scene.world.terrain(self.x, self.y))
        board = terrain in KC.ABOARD_TERRAIN.value
        # DS:424c / 4254 = army +4 at the set-up (the scene), drawn sign-extended (ovl37:0401
        # cwde: type 0xff -> ovl64:08be(-1) draws no icon, X36); DS:41fc / 4204: the prelude's
        # boarding is in the state after the command (records keep +0xc when freed)
        self.units = {}
        pos = slot_positions(k.exe, len(self.attackers), len(self.defenders))
        for base, ids, owner in ((0, self.defenders, self.owner), (A_BASE, self.attackers, self.attacker)):
            for i, aid in enumerate(ids):
                aboard = board and bool(st.armies[aid].flags & ABOARD_FLAG)
                self.units[base + i] = (pos[base + i], s8(scene.armies[aid].type_id), owner, aboard)
        self.city = terrain == Terrain.CITY
        self.view_origin = host.view.origin
        self.mark = True                           # ovl36:1836(x, y, 1) ran (a computer battle shown
        self.phase = "mark"                        # with several humans and Hidden Map: no mark)
        self.dead: set[int] = set()
        self.blast: int | None = None
        self.lines: list[str] = []
        self.keys: deque = deque()                 # the BIOS keyboard buffer (0000:38dc / 3708)
        self.fast = False
        self.human = st.players[self.attacker].control == Control.HUMAN
        self.painter = painter_for(host)

    # ---------------------------------------------------------------- timeline hooks

    @property
    def hides_pointer(self) -> bool:
        return self.phase in ("mark", "kills")

    def slot(self, duel) -> int:
        """The dying unit's slot: ovl37:00e4..0118 count the kills of each side."""
        loser = duel.info["loser"]
        if loser == "attacker":
            return A_BASE + self.attackers.index(duel.info["attacker"])
        return self.defenders.index(duel.info["defender"])

    def poll_key(self) -> bool:
        """ovl37:00ae..00ce: one key off the buffer (an extended key is two getch calls, one
        entry here); True when it is the space bar."""
        return bool(self.keys) and self.keys.popleft() == 0x20

    def say(self, text: str) -> None:
        """ovl37:04c5."""
        self.lines.append(text)

    def close_window(self) -> None:
        """ovl37:04f6 after its wait: ovl17:069c; the map mark stays."""
        self.phase = "after"

    # ---------------------------------------------------------------- input

    def update(self, events, dt) -> None:
        for e in events:
            if self.phase == "wait":
                if is_dismiss(e):
                    self.close_window()
                    break
            elif is_dismiss(e) and e.type == pygame.KEYDOWN and self.phase in ("mark", "kills", "result"):
                self.keys.append(0x20 if e.key == pygame.K_SPACE else (e.unicode or e.key))   # BIOS buffer
        if self.phase != "wait" and self.stack is not None:
            self.anim.step()
            if self.phase == "after" and not self.anim.busy and self.stack is not None:
                self.close(None)                   # nothing left to present (no BattleEnded)

    # ---------------------------------------------------------------- drawing

    def draw(self, fb) -> None:
        k = self.k
        x, y, w, h = AREA
        if self.mark:
            (sx, sy, mw, mh), (dx, dy) = mark_blit(k.exe, self.view_origin, self.x, self.y)
            clip = fb.get_clip()
            fb.set_clip(pygame.Rect(AREA))
            fb.blit(k.picture(WAR), (x + dx, y + dy), (sx, sy, mw, mh))
            fb.set_clip(clip)
        if self.phase in ("mark", "after"):
            return
        k.draw_popup(fb, POPUP)
        shield = k.picture(BSHIELD)
        for at, o in ((SHIELD_D, self.owner), (SHIELD_A, self.attacker)):
            col = NEUTRAL_COLUMN if o == NEUTRAL else o
            fb.blit(shield, ds_words(k.exe, at, 2), (col * SHIELD_W, 0, SHIELD_W, SHIELD_H))
        war, atrans = k.picture(WAR), k.picture(ATRANS)
        for s in sorted(self.units):
            if s in self.dead:
                continue
            (ux, uy), t, o, aboard = self.units[s]
            if aboard:
                blit_opaque(fb, war, (ux, uy + BOAT_DY), BOAT)
            self.painter.army(fb, t, o, ux, uy)
            if s == self.blast:
                fb.blit(atrans, (ux, uy), BLAST)
        font = k.fonts[CHANCE17]
        for i, s in enumerate(self.lines):
            text_centred(fb, font, LINE_X, FIRST_LINE + i * LINE_STEP, s, INK, SHADOW)


@registry.dialog("fight")
def fight(host, battle, scene, anim, on_close=None):
    return Fight(host, battle, scene, anim, on_close)
