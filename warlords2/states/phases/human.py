"""The human side's turn: map, overview, palettes and keys (M4c).

Input reaches the original through the generic loop 08a9:000e (11b5:0003 events, switch
08a9:011c): a left or right press over a live button presses it (07be:0e26) or shows its help
(ovl15:0000); a left release over the pressed button runs it (08a9:0189 -> 07be:04d8, table
07be:0b0c); keys go to 07be:0064; idle polls with a button held go to the area dispatcher
0726:0009 (area 1 overview 0186, area 2 map 0225 -> ovl46:0000, area 9 bottom bar 02ad).
Here one logical frame is one poll.

Map clicks (ovl46:0000): a press over no button does nothing by itself (08a9:012c); the area
dispatcher 0726:0009 runs on every idle poll while a button is held (12bf:0944) and none of
DS:1174 / 1176 / 1172 is set, so a held left button acts again on every poll (here: the press
is the first such poll, then `held`).  The left button acts on the cursor 08a9:0896 would show
(`cursor`; table ovl46:0316): 2 / 6 move the stack to the square (0c8c:01fd(0, 0), which takes
the square under the pointer -> `Move`), 5 selects (0b62:0405: a click on the leader's square
less than 0x28 BIOS ticks after the previous one and with DS:1172 clear is Group All, else
`SelectStack`; both set DS:1172 and DS:1178 = 0), 4 starts a map drag (ovl61:0e04, DS:1176),
8 / 10 attack (ovl36:0000 -> `Attack`), 11 sets the path (0c8c:0007(1, 1) -> `SetPath`; on the
leader's own square the gotos are cleared -> `CancelPath`); 3 (city, ovl45:0000(2 for an own
city, else 0)), 7 (site, ovl45:0000(0 when a city holds the square, else 4)) and 9 (advisor,
ovl36:1f19) go to `registry.left_click` (M6b / M7b / M5b).  So holding the button on a move
square walks there, then (the cursor now on the stack) selects it and the path drag follows;
holding it on a path cursor searches the path again every poll.  The right button (ovl46:0000
with button 2): nothing when the square fails ovl64:15ff; an army shown (army bit and View
Enemies SCN 0x12a, or own, or fortified) -> Tower panel for a fortified other side's square,
else the stack panel; else City (type 10) -> M6b's city info; site (11) -> city info when a
city is there, else M7b's site info; signpost (9) -> sign; else the terrain panel
(`ui.info`).  A right press on the map frame around the view (area 13, 0726:0294) opens the
"Drag Screen" panel (`ui.info.frame`).

Holding the button after selecting (DS:1172): every poll DS:1178 is incremented and, when its
old value is above 6 (the 8th poll after the select), ovl61:0b3b(mouse) runs and DS:1178 = 7
(0726:009c..00c4).  0b3b: outside the map rectangle the centre moves one square towards the
mouse (the top-right corner moves (+1, +1): 0c49 -> 0ca9); inside it nothing when the square is
the one of the last call (DS:2ad8 / 2ada) or the leader's square, else a square on a border row
/ column of the view moves the centre one square that way (the right column's corners move
(+1, +1) at the top and (+1, -1) at the bottom: 0d52..0d8c) and then 0c8c:0007(1, 0) sets the
path to the square under the mouse after the scroll (without ovl61:0174).  0c8c:0007 does
nothing on a square failing ovl64:15ff.  On release DS:1172 is cleared and, when DS:1178's old
value is above 6, ovl61:0b3b(-1, -1) moves the stack along its goto (0c8c:01fd, then 0174 and
DS:2ad8 / 2ada = -1) unless the mouse is over the stack's square (0726:005a..007e); a release
before that does not move.  The map drag (DS:1176, ovl61:0e04): centre = start centre + (-dx /
40, -dy / 40) of the mouse travel (the mickey counters, vertical halved: logical pixels here),
truncated.

Overview (0726:0186): left press and every poll while held -> ovl65:0227 on the square
(view from that centre, the centre kept as given); with Alt -> 0c8c:0007(0, 1) (path to
the square, every poll).  Right -> `ui.info.minimap`.

Buttons (07be:04d8): 173 Move / End -> 0c8c:01fd(goto) (nothing without a goto); 174 Next ->
ovl67:019b; 175 -> ovl61:0ed7 (`LeaveGroup`); 176 -> ovl67:03a6 (`Defend`); 177 / Home ->
ovl61:0f02 centre on the leader; 178 / Del -> 0b62:08b3; 179-182 -> ovl14:0072 (the shortcut's
menu action); 183-185 -> ovl00:0346 (M9b); 186 / Tab -> ovl61:0f3f (with a goto, the leader's
square in view and the centre not on the goto: centre on the goto, else on the leader); 187 /
Backspace -> ovl61:0fe9 (the gotos -1, DS:2ea6 = 0); 188 -> help pages; 224-231 -> ovl66:0963,
232-239 -> ovl66:0910, 240 / Space -> ovl66:0a55, 241 -> ovl66:0a99; 320-327 / arrows ->
ovl64:0723(id - 320 / 0, 6, 2, 4): the centre one square on, clamped by ovl64:0629 to
4..0x6b, 4..0x97.  Keys (07be:0064): nothing while DS:1174, 1176, 1172 or 3700 is set
(007d..00a2; the menu keys 1372:0047 come after that test); Esc / Return press the first live
button of DS:1514 / DS:155c (175 / 174 on this screen), with none live they go on through the
tables and end in the chord; '1'-'9' (07be:0444, 0c8c:0197): '5' centres on the leader
(ovl64:0565), the others move the stack one square (0c8c:041f: '8' N, '9' NE, '6' E, '3' SE,
'2' S, '1' SW, '4' W, '7' NW; 01fd(square), refused off the map; result 3 or 5 -> attack there;
then every member's goto is cleared, moved or not); letters A-Z are ignored; a key in none of
the tables plays the chord (ovl58:0b5f).  The other keys of 07be:0337 are menu actions (the
menu bar) or other milestones' dialogs.  0c8c:01fd(0, 0) takes the square under the pointer
instead (022a..0255), so a key step or goto onto the map's corner square (0, 0) goes there;
recorded, kept.

After an order Next / Quit & Next / Defend the ding (ovl58:0b79) sounds when a stack was found,
the chord when none is left (ovl67:01c8 / 01db).

Path marks (`PathDisplay`): the list DS:6475 / count DS:2ea6 / reach DS:2eaa / walked DS:2ea8
written by 0c8c:0963 (at most 200 entries, 09a8) for the selection step 0c8c:0529 (07ab..07f3:
a human side's leader with a goto; budget DS:5e00; else all three 0), by 0c8c:0007 (0117..0180, budget DS:5e00 for a group, else the
leader's +7; no path -> chord, the list unchanged), by the move (`ui.anim.move`) and by Cancel
Path (DS:2ea6 = 0).  ovl64:2ef5 marks entries [DS:2ea8, DS:2ea6 - 1) in view: 1 below DS:2eaa,
else 2, drawn by ovl64:22bf..2385 as ASHADOW (0x1f0, 0x1f for 1 / 0x30 for 2, 16, 14) at the
square + (16, 13); the last entry gets the ghost (`ui.mapview.path_ghost`); only with DS:5e62,
DS:2ea6 > 0 and DS:2ea8 < DS:2ea6.

Selected stack on the map (077b:0020 / 01a1, from ovl64:006c via ovl62:0afd (single army) /
0b27 (group)): CURS.PCK frame f = DS:125c[kind] + phase (kind 1 single, 2 group: frames 0-3
and 4-7), source ((f % 4) * 64, (f / 4) * 40), 40x40 at the square, for each VGA plane k the
source plane 0 where bit k of the colour (the word table DS:2b6c[SCN 0x110], ovl62:0b05 /
0b2f) is set, else plane 1, under the picture's mask: pixels of value 1 take that colour,
value 4 black, 0 stay.  077b:011f runs once per main-loop poll (08a9:00a2) unless DS:166a,
1176, 1172 or 1174 is set: when the BIOS tick differs from the last one it saw (DS:1248) the
counter DS:125a = (DS:125a + 1) & 7, and when that is a multiple of 4 077b:0161 draws the frame
of phase DS:124e and steps DS:124e = (DS:124e + 1) & 3.  While the button is held the counter
and the phase stand still and go on from there; during a walk the main loop does not run (no
frame is drawn, `ui.anim.move`).  The draw at every arm (0afd / 0b27 -> 077b:005f, one draw
and one phase step per map redraw) is not modelled: the frame shown first is phase 0.  Not
drawn on the black square.
"""
from __future__ import annotations

import numpy as np
import pygame

from ...assets import cursors as CU
from ...assets.exe import ds_words
from ...audio import effects
from ...model import commands as C
from ...model.ids import MAP_ARMY, MAP_FORTIFIED, MAP_OWNER_MASK, MAP_W, ROAD_PIECE_MASK, Control, Terrain
from ...rules import pathfinding as P
from ...rules.bonuses import s8
from ...rules.constants.movement import DIR_DX, DIR_DY, TERRAIN_COST
from ...rules.engine import IllegalCommand, NotImplementedCommand
from ...rules.movement import stack_mode
from ...ui import registry
from ...ui.anim.move import clamp_centre
from ...ui.animate import Animator, ticks_at
from ...ui.info import in_map, square_centre, visible
from ...ui.layout import NORMAL
from ...ui.mapview import AREA, VIEW
from ...ui.menubar import with_codes
from ...ui.minimap import RECT as OVERVIEW
from ...ui.palettes import (ActionPalette, leader, painter_for, CANCEL_PATH, CENTRE, DEFEND, DESELECT,
                            DIPLOMACY, GROUP_ALL, HELP, MOVE, NEXT, PATH, QUIT_NEXT, SCROLL,
                            SELECT_ARMY, SELECT_GROUP, SHORTCUTS, UNGROUP_ALL)
from ...ui.screen import IDENTITY
from ...ui.widgets import kit
from . import Phase

TILE = 40
MAP_FRAME = (0, 17, 392, 386)                 # DS:2ab8
BOTTOM = (16, 408, 360, 56)                   # AREA 9
DOUBLE_TICKS = 0x28                           # 08a9:01cd
DRAG_POLLS = 6                                # 0726:009c: old DS:1178 > 6, then DS:1178 = 7
PATH_CAP = 0xC8                               # 0c8c:09a8
MARK_SRC_X, MARK_SRC_Y, MARK_W, MARK_H, MARK_AT = 0x1F0, (0x1F, 0x30), 16, 14, (16, 13)
ANTS_TICKS, ANTS_DRAW, ANTS_PHASES = 8, 4, 4  # 077b:0151 (& 7), 0164 (& 3), 0199 (& 3)
ANTS_FIRST = {1: 0, 2: 4}                     # DS:125c[kind]
ANTS_COLOURS = 0x2B6C                         # words, [SCN 0x110] (ovl62:0b05)
ANTS_SIZE, ANTS_PITCH = 40, 64
ANTS_INK, ANTS_BLACK = 1, 4                   # CURS.PCK pixel values (planes 0 / 1)
CURS = 10
ESC, RETURN = 0x1B, 0x0D
KEY_LISTS = {ESC: 0x1514, RETURN: 0x155C}     # 07be:00da / 0112
KEY_DIRS = {"8": 0, "9": 1, "6": 2, "3": 3, "2": 4, "1": 5, "4": 6, "7": 7}   # 0c8c:0197
ARROWS = {0x148: 0, 0x14B: 6, 0x14D: 2, 0x150: 4}                            # 07be:04a4
K_HOME, K_END, K_DEL, K_BACKSPACE, K_TAB, K_SPACE = 0x147, 0x14F, 0x153, 0x08, 0x09, 0x20
EXTENDED = {pygame.K_HOME: K_HOME, pygame.K_END: K_END, pygame.K_DELETE: K_DEL,
            pygame.K_BACKSPACE: K_BACKSPACE, pygame.K_TAB: K_TAB,
            pygame.K_KP7: K_HOME, pygame.K_KP1: K_END, pygame.K_KP_PERIOD: K_DEL}
ATTACK_RESULTS = (3, 5)                       # 0c8c:041f
FLY = 2
OWN_CITY, ANY_CITY, NO_CITY = 2, 0, 4         # ovl45:0000 modes (ovl46:0144 / 0148 / 0118)


def _inside(rect, pos) -> bool:
    x, y, w, h = rect
    return x <= pos[0] < x + w and y <= pos[1] < y + h


class PathDisplay:
    """DS:6475 (squares after the stack, at most 200), DS:2eaa (reach), DS:2ea8 (walked)."""

    def __init__(self):
        self.clear()

    def clear(self) -> None:
        self.squares, self.reach, self.done = [], 0, 0

    def set(self, squares, reach: int) -> None:
        self.squares, self.reach, self.done = list(squares)[:PATH_CAP], reach, 0

    @property
    def marks_left(self) -> bool:
        return len(self.squares) > self.done


def group_of(state) -> tuple:
    """DS:5e3e with DS:2bda, else DS:5e62 alone."""
    sel = state.selection
    return tuple(sel.moving) if len(sel.moving) > 1 else (sel.selected,)


def lowest(state, ids) -> int:
    return min(s8(state.armies[i].moves_left) for i in ids)


def path_preview(state, ids, dest):
    """(squares, reach) of the path from the group's square to `dest` on a copy of the
    state (find_path writes the path cache and patches the cost map), or None."""
    cp = state.copy()
    members = [cp.armies[i] for i in ids]
    lead = members[0]
    mode, mask = stack_mode(cp, members)
    codes = P.find_path(cp, (lead.x, lead.y), tuple(dest), mode, mask)
    if codes is None:
        return None
    budget = lowest(cp, ids) if len(ids) > 1 else s8(lead.moves_left)
    return P.cells((lead.x, lead.y), codes), P.reach_this_turn(cp, (lead.x, lead.y), codes, mode, mask, budget)


SELECTION_STEP = (C.SelectStack, C.Next, C.LeaveGroup, C.Defend, C.Group, C.Ungroup, C.SelectGroup,
                  C.GroupAll, C.UngroupAll)


class Human(Phase):
    name = "human"

    def enter(self) -> None:
        g = self.game
        self.k = kit(g.app)
        exe = self.k.exe
        self.painter = painter_for(g)
        self.palette = ActionPalette(g)
        self.animator = Animator(g)
        self.display = PathDisplay()
        self.poll = 0                          # logical frames since the phase began
        self.last_select = None                # poll of the previous 0b62:0405 call
        self.stack_drag = None                 # DS:1172 set: DS:1178
        self.map_drag = None                   # DS:1176: (start centre, start pos)
        self.dispatched = None                 # poll of the last left dispatch (the press)
        self.drag_last = None                  # DS:2ad8 / 2ada (-1, -1)
        self.ants_tick = ticks_at(g.app, 0)    # DS:1248
        self.ants_ticks = 0                    # DS:125a
        self.ants_phase, self.ants_shown = 1, 0   # DS:124e after the first draw, its frame
        self.ants_colours = ds_words(exe, ANTS_COLOURS, 8)
        self.key_lists = {c: _ds_list(exe, off) for c, off in KEY_LISTS.items()}
        self.curs = self.k.picture(CURS)
        self._ants = {}
        self.selection_display()
        self.refresh()
        g.bar.repaint()                        # ovl61:0000 (ovl57:0ed0): 0174, then 1372:132f(0)

    # ---------------------------------------------------------------- commands

    def apply(self, cmd, before=None, refresh: bool = True):
        """Run a command; play its events; None when the engine refused it."""
        g = self.game
        before = before if before is not None else g.state.copy()
        try:
            events = g.apply(cmd)
        except NotImplementedCommand:
            return None
        except IllegalCommand:
            if isinstance(cmd, C.Attack):
                effects.chord(g.app)                    # ovl36:0079
            return None
        if isinstance(cmd, SELECTION_STEP):
            self.selection_display()
        if isinstance(cmd, (C.Next, C.LeaveGroup, C.Defend)):
            (effects.ding if leader(g.state) is not None else effects.chord)(g.app)   # ovl67:01c8 / 01db
        self.animator.play(events, before)
        if refresh:
            self.refresh()
        return events

    def selection_display(self) -> None:
        """0c8c:0529's path words for the selected stack."""
        st = self.game.state
        a = leader(st)
        if a is None:
            return
        if st.players[st.current].control != Control.HUMAN or a.goto[0] < 0 or a.goto[1] < 0:
            self.display.clear()
            return
        ids = tuple(st.selection.moving) or (a.id,)
        p = path_preview(st, ids, a.goto)
        if p is None:
            self.display.clear()
        else:
            self.display.set(*p)

    def move_to(self, dest) -> None:
        """0c8c:01fd(dest): the selected stack walks towards `dest` (nothing off the map)."""
        st = self.game.state
        if leader(st) is None or not (0 <= dest[0] < MAP_W and 0 <= dest[1] < len(st.world.tiles) // MAP_W):
            return
        group = group_of(st)
        before = st.copy()
        for i in group:
            before.armies[i].goto = tuple(dest)
        self.apply(C.Move(group, tuple(dest)), before)

    def set_path(self, dest, refresh: bool = True) -> None:
        """0c8c:0007(.., refresh): every member's goto = dest, the path searched and shown;
        nothing on a square failing ovl64:15ff."""
        g = self.game
        st = g.state
        a = leader(st)
        if a is None or not visible(st, g.sprites, g.view.origin, *dest):
            return
        group = group_of(st)
        if (a.x, a.y) == tuple(dest):
            self.apply(C.CancelPath(group), refresh=False)            # 0099..00d5: no 0174
            return
        p = path_preview(st, group, dest)
        self.apply(C.SetPath(group, (tuple(dest),)), refresh=False)
        if p is None:
            effects.chord(g.app)                                       # 0c8c:0131
            return
        self.display.set(*p)
        if refresh:
            self.refresh()                                             # 0c8c:018e ovl61:0174

    def cancel_path(self) -> None:
        """ovl61:0fe9."""
        a = leader(self.game.state)
        if a is None or a.goto[0] < 0 or a.goto[1] < 0:
            return
        self.apply(C.CancelPath(group_of(self.game.state)))
        self.display.squares = []
        self.refresh()

    def step_dir(self, d: int) -> None:
        """0c8c:041f(d): 01fd on the next square, an attack on result 3 / 5, then the gotos
        cleared (also when 01fd refused a square off the map)."""
        st = self.game.state
        a = leader(st)
        if a is None:
            return
        nxt = P.step(a.x, a.y, d)
        group = group_of(st)
        if nxt is not None:
            before = st.copy()
            for i in group:
                before.armies[i].goto = nxt
            ev = self.apply(C.Move(group, nxt), before)
            status = next((e.info.get("status") for e in ev or () if type(e).__name__ == "Moved"), None)
            if status in ATTACK_RESULTS:
                self.apply(C.Attack(group, *nxt))
        st = self.game.state
        live = [i for i in group if st.armies[i].owner == st.current and st.armies[i].x >= 0]
        if live and any(st.armies[i].goto != (-1, -1) for i in live):
            self.apply(C.CancelPath(tuple(live)))

    # ---------------------------------------------------------------- view

    def centre_on(self, x: int, y: int) -> None:
        self.game.scroll_to(*clamp_centre(x, y))

    def scroll(self, d: int) -> None:
        """ovl64:0723(d)."""
        v = self.game.view
        self.centre_on(v.cx + DIR_DX.value[d], v.cy + DIR_DY.value[d])

    def centre_leader(self) -> None:
        a = leader(self.game.state)
        if a is not None:
            self.centre_on(a.x, a.y)

    def toggle_path_view(self) -> None:
        """ovl61:0f3f."""
        a = leader(self.game.state)
        if a is None:
            return
        v = self.game.view
        left, top = v.origin
        in_view = left <= a.x < left + VIEW and top <= a.y < top + VIEW
        if a.goto[0] >= 0 and a.goto[1] >= 0 and in_view and (v.cx, v.cy) != a.goto:
            self.centre_on(*a.goto)
        else:
            self.centre_on(a.x, a.y)

    # ---------------------------------------------------------------- cursor 08a9:0896

    def cursor(self, pos) -> int:
        g, st = self.game, self.game.state
        if self.map_drag is not None:
            return CU.HAND
        if self.stack_drag is not None:
            return CU.PATH
        if st.players[st.current].control != Control.HUMAN:
            return CU.ARROW
        inp = g.app.input
        if _inside(OVERVIEW, pos):
            return CU.PATH if inp.alt else CU.MAGNIFIER
        sq = g.view.square_at(pos)
        if sq is not None:
            return self.map_cursor(sq, inp)
        return CU.HAND if _inside(MAP_FRAME, pos) else CU.ARROW

    def map_cursor(self, sq, inp) -> int:
        st = self.game.state
        w = st.world
        x, y = sq
        i = y * MAP_W + x
        f = w.flags[i]
        owner, army = f & MAP_OWNER_MASK, bool(f & MAP_ARMY)
        t = w.terrain_of_tile[w.tiles[i] & 0xFF]
        a = leader(st)
        sel = a is not None
        dist = P.distance((x, y), (a.x, a.y)) if sel else 0
        mode = stack_mode(st, [st.armies[j] for j in group_of(st)])[0] if sel else 1
        under = w.terrain_of_tile[w.tiles[a.y * MAP_W + a.x] & 0xFF] if sel else int(Terrain.PLAIN)
        cost = TERRAIN_COST.value[t] if sel and mode != FLY else 1
        if w.roads[i] & ROAD_PIECE_MASK:
            cost = 1
        if not visible(st, self.game.sprites, self.game.view.origin, x, y) or cost <= 0:
            return CU.HAND
        cur = st.current
        city, site = t == Terrain.CITY, t == Terrain.SITE
        if inp.shift:
            if sel and dist <= 1 and owner != cur and (city or army) and st.options.military_advisor:
                return CU.QUESTION
            return CU.TOWER if city else CU.RUIN if site else CU.HAND
        move = CU.BOOT if mode == FLY else CU.SHIP if t in (Terrain.WATER, Terrain.SHORE) else CU.BOOT
        if army and owner == cur and not inp.ctrl:
            if inp.alt:
                return CU.PATH
            return CU.TARGET if not sel or dist < 1 else move
        if sel and dist <= 1 and owner != cur and (city or army) and not self._no_attack(a, mode, under, t):
            if st.options.diplomacy and owner != 0x0F:
                rel = st.relations[cur][owner] & 3
                if city:
                    return CU.SWORD if rel == 2 else CU.HEART
                return CU.HEART if rel == 0 else CU.SWORD
            return CU.SWORD
        if sel and (owner == cur or (owner == 0x0F and not city)):
            if inp.alt:
                return CU.PATH
            if dist >= 1 and inp.ctrl and army:
                return CU.TARGET
            return move
        return CU.TOWER if city else CU.RUIN if site else CU.HAND

    @staticmethod
    def _no_attack(a, mode, under, t) -> bool:
        """08a9:0b48..0ba3: no attack between water and land without a crossing."""
        coast = (Terrain.SHORE, Terrain.WATER, Terrain.CITY, Terrain.BRIDGE)
        if a.flags & 0x1000 and mode == 1 and under == Terrain.SHORE and t not in coast:
            return True
        return not a.flags & 0x1000 and mode == 1 and t == Terrain.SHORE and under not in coast

    # ---------------------------------------------------------------- input

    def held_mode(self) -> bool:
        """DS:1176 or DS:1172 (DS:1174 is an open panel: the phase does not step then)."""
        return self.map_drag is not None or self.stack_drag is not None

    def step(self, events, dt):
        self.poll += 1
        if self.animator.busy:
            self.animator.step()
            if not self.animator.busy:
                self.refresh()
            return None
        g = self.game
        for e, code in with_codes(events, g.app.input):
            if g.dialogs or self.animator.busy:
                break
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                self.right_press(e.pos)
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                if self.palette.row.at(e.pos):
                    self.palette.row.event(e)
                else:
                    self.left_press(e.pos)
            elif e.type == pygame.MOUSEBUTTONUP and e.button == 1:
                hit = self.palette.row.event(e)
                if hit is not None:
                    self.button(hit)
                self.left_release(e.pos)
            elif e.type == pygame.MOUSEMOTION:
                self.palette.row.event(e)
            elif e.type == pygame.KEYDOWN:
                self.key(e, code)
        if not g.dialogs and not self.animator.busy:
            self.ants_poll()
            self.held(g.app.input)
        return None

    def ants_poll(self) -> None:
        """077b:011f, skipped while a button is held for a drag (08a9:0086..00a2)."""
        if self.held_mode():
            return
        t = ticks_at(self.game.app, self.poll)
        if t == self.ants_tick:
            return
        self.ants_tick = t
        self.ants_ticks = (self.ants_ticks + 1) % ANTS_TICKS
        if self.ants_ticks % ANTS_DRAW == 0 and leader(self.game.state) is not None:   # 077b:0161
            self.ants_shown, self.ants_phase = self.ants_phase, (self.ants_phase + 1) % ANTS_PHASES

    def held(self, inp) -> None:
        """The polls of 0726:0009 while the left button is held."""
        if 1 not in inp.buttons or self.dispatched == self.poll:   # the press was this poll
            return
        pos = inp.pos
        if self.map_drag is not None:                        # ovl61:0e04
            (cx, cy), (px, py) = self.map_drag
            self.centre_on(cx + int(-(pos[0] - px) / TILE), cy + int(-(pos[1] - py) / TILE))
        elif self.stack_drag is not None:                    # 0726:009c..00c4
            old = self.stack_drag
            self.stack_drag += 1
            if old > DRAG_POLLS:
                self.drag_path(pos)
                self.stack_drag = DRAG_POLLS + 1
        else:
            self.dispatch_left(pos)

    def drag_path(self, pos) -> None:
        """ovl61:0b3b(mouse)."""
        v = self.game.view
        x, y, w, h = AREA
        a = leader(self.game.state)
        if a is None:                                        # 0b48
            return
        if not _inside(AREA, pos):                           # 0bee..0cb3
            dx = -1 if pos[0] < x else 1 if pos[0] >= x + w else 0
            dy = -1 if pos[1] < y else 1 if pos[1] >= y + h else 0
            if (dx, dy) == (1, -1):
                dy = 1                                       # 0c49 -> 0ca9
            self.centre_on(v.cx + dx, v.cy + dy)
            return
        sq = v.square_at(pos)
        if sq == self.drag_last:                             # 0ce1..0ced
            return
        self.drag_last = sq
        if (a.x, a.y) == sq:                                 # 0cf8..0d07
            return
        left, top = v.origin
        col, row = sq[0] - left, sq[1] - top
        dx = -1 if col == 0 else 1 if col == VIEW - 1 else 0
        dy = -1 if row == 0 else 1 if row == VIEW - 1 else 0
        if dx == 1:
            dy = -dy                                         # 0d52..0d8c: right column corners
        if dx or dy:
            self.centre_on(v.cx + dx, v.cy + dy)
        sq = v.square_at(pos)                                # 0c8c:0007(1, 0) reads the mouse
        if sq is not None:
            self.set_path(sq, refresh=False)

    def left_press(self, pos) -> None:
        self.dispatched = self.poll
        self.dispatch_left(pos)

    def dispatch_left(self, pos) -> None:
        """0726:0009 with the left button: the overview (0186), the map (0225 -> ovl46:0000)
        or the map frame (026d)."""
        g = self.game
        if _inside(OVERVIEW, pos):                           # 0726:0186
            t = g.minimap.tile_at(pos)
            if t is None:
                return
            if g.app.input.alt:
                self.set_path(t)
            else:
                g.scroll_to(*t)
            return
        sq = g.view.square_at(pos)
        c = self.cursor(pos)
        if sq is None:
            if c == CU.HAND and _inside(MAP_FRAME, pos):
                self.map_drag = ((g.view.cx, g.view.cy), pos)
            return
        st = g.state
        if c in (CU.SHIP, CU.BOOT):
            self.move_to(sq)
        elif c == CU.HAND:
            self.map_drag = ((g.view.cx, g.view.cy), pos)
        elif c == CU.TARGET:
            self.select(sq)
        elif c in (CU.SWORD, CU.HEART):
            self.apply(C.Attack(group_of(st), *sq))
        elif c == CU.PATH:
            self.set_path(sq)
        elif c == CU.TOWER:                                  # ovl46:011c
            i = st.city_at(*sq)
            own = i >= 0 and st.cities[i].owner == st.current
            self._left_hook("city", sq, OWN_CITY if own else ANY_CITY)
        elif c == CU.RUIN:                                   # ovl46:0106
            self._left_hook("site", sq, ANY_CITY if st.city_at(*sq) >= 0 else NO_CITY)
        elif c == CU.QUESTION:                               # ovl46:0162
            self._left_hook("advisor", sq, None)

    def _left_hook(self, kind, sq, mode) -> None:
        fn = registry.left_click_handler(kind)
        if fn is not None:
            fn(self.game, sq, mode)

    def select(self, sq) -> None:
        """0b62:0405."""
        st = self.game.state
        a = leader(st)
        prev, self.last_select = self.last_select, self.poll
        if (a is not None and (a.x, a.y) == sq and prev is not None
                and ticks_at(self.game.app, self.poll) - ticks_at(self.game.app, prev) < DOUBLE_TICKS):
            self.apply(C.GroupAll(*sq))
        else:
            self.apply(C.SelectStack(*sq))
        self.stack_drag = 0                                  # DS:1172 = 1, DS:1178 = 0

    def left_release(self, pos) -> None:
        """0726:003b..0084."""
        self.map_drag = None
        if self.stack_drag is not None:
            old, self.stack_drag = self.stack_drag, None
            if old > DRAG_POLLS:
                self.release_drag(pos)

    def release_drag(self, pos) -> None:
        """ovl61:0b3b(-1, -1)."""
        a = leader(self.game.state)
        if a is None or self.game.view.square_at(pos) == (a.x, a.y):
            return
        self.move_to(a.goto)
        self.refresh()
        self.drag_last = None

    def right_press(self, pos) -> None:
        g = self.game
        b = self.palette.row.at(pos)
        if b is not None and registry.right_click_handler("button")(g, b.id, pos) is not None:
            return
        if _inside(OVERVIEW, pos):
            registry.right_click_handler("minimap")(g, g.minimap.tile_at(pos), pos)
        elif in_map(pos):
            self.map_info(g.view.square_at(pos))
        elif _inside(MAP_FRAME, pos):                        # 0726:0294
            registry.right_click_handler("frame")(g, None, pos)
        elif _inside(BOTTOM, pos):
            registry.right_click_handler("palette")(g, None, pos)

    def map_info(self, sq) -> None:
        """ovl46:0000 with the right button."""
        from ...ui.info.terrain import terrain_type
        g, st = self.game, self.game.state
        x, y = sq
        if not visible(st, g.sprites, g.view.origin, x, y):
            return
        w = st.world
        f = w.flags[y * MAP_W + x]
        owner = f & MAP_OWNER_MASK
        centre = square_centre(g.view.origin, x, y)
        t = terrain_type(w, x, y)
        if f & MAP_ARMY and (st.options.view_enemies or owner == st.current or f & MAP_FORTIFIED):
            kind = "tower" if f & MAP_FORTIFIED and owner != st.current else "army"
            registry.right_click_handler(kind)(g, sq, centre)
            return
        if t == Terrain.CITY or (t == Terrain.SITE and st.city_at(x, y) >= 0):
            fn, arg = registry.right_click_handler("city"), st.city_at(x, y)
        elif t == Terrain.SITE:
            fn, arg = registry.right_click_handler("site"), st.site_at(x, y)
        elif t == Terrain.TOWER:
            fn, arg = registry.right_click_handler("sign"), sq
        else:
            fn, arg = registry.right_click_handler("terrain"), sq
        if fn is not None:
            fn(g, arg, centre)

    def key(self, e, code) -> None:
        """07be:0064."""
        c = EXTENDED.get(e.key, code)
        if c is None or self.held_mode():                    # 007d..00a2
            return
        if 0x41 <= c <= 0x5A:
            return
        if c in self.key_lists:                              # Esc / Return
            for id in self.key_lists[c]:
                b = next((b for b in self.palette.row.buttons if b.id == id), None)
                if b is not None and self.palette.row.state.get(id) == NORMAL:
                    self.button(id)
                    return
            effects.chord(self.game.app)                     # 07be:0104 .. 032c
            return
        if c in ARROWS:
            self.scroll(ARROWS[c])
        elif 0x31 <= c <= 0x39:
            if chr(c) == "5":
                self.centre_leader()
            elif leader(self.game.state) is not None:
                self.step_dir(KEY_DIRS[chr(c)])
        elif c == K_BACKSPACE:
            self.cancel_path()
        elif c == K_TAB:
            self.toggle_path_view()
        elif c == K_SPACE:
            self.group_all()
        elif c == K_HOME:
            self.centre_leader()
        elif c == K_END:
            self.button(MOVE)
        elif c == K_DEL:
            self.apply(C.Deselect())
        else:
            effects.chord(self.game.app)                     # 07be:0064, no table entry

    def group_all(self) -> None:
        a = leader(self.game.state)
        if a is not None:
            self.apply(C.GroupAll(a.x, a.y))

    def button(self, id: int) -> None:
        """07be:04d8."""
        st = self.game.state
        sel = st.selection
        a = leader(st)
        if id == MOVE:
            if a is not None and a.goto[0] >= 0 and a.goto[1] >= 0:
                self.move_to(a.goto)
        elif id == NEXT:
            self.apply(C.Next())
        elif id == QUIT_NEXT:
            self.apply(C.LeaveGroup(group_of(st) if a is not None else ()))
        elif id == DEFEND:
            if a is not None:
                self.apply(C.Defend(group_of(st)))
        elif id == CENTRE:
            self.centre_leader()
        elif id == DESELECT:
            self.apply(C.Deselect())
        elif id in SHORTCUTS:
            registry.run_action(self.palette.shortcuts[id - SHORTCUTS[0]], self.game)
        elif id in DIPLOMACY or id == HELP:
            registry.run_action(id, self.game)
        elif id == PATH:
            self.toggle_path_view()
        elif id == CANCEL_PATH:
            self.cancel_path()
        elif id in SELECT_ARMY:
            i = id - SELECT_ARMY.start
            if i < len(sel.palette):
                cmd = C.Ungroup if sel.palette_selected[i] else C.Group
                self.apply(cmd((sel.palette[i],)))
        elif id in SELECT_GROUP:
            i = id - SELECT_GROUP.start
            if i < len(sel.palette):
                self.apply(C.SelectGroup(sel.palette[i]))
        elif id == GROUP_ALL:
            self.group_all()
        elif id == UNGROUP_ALL:
            if a is not None:
                self.apply(C.UngroupAll(a.x, a.y))
        elif id in SCROLL:
            self.scroll(id - SCROLL.start)
        self.refresh()

    def refresh(self) -> None:
        """ovl61:0174."""
        self.palette.refresh(self.game.state, self.display.marks_left)

    # ---------------------------------------------------------------- drawing

    def scene(self):
        return self.animator.scene if self.animator.busy else self.game.state

    def paint_map(self, fb) -> None:
        g = self.game
        st = self.scene()
        a = leader(st)
        d = self.display
        show = a is not None and d.squares and d.done < len(d.squares)
        g.view.draw(fb, st, moving=a.id if a is not None else None, ghost=d.squares[-1] if show else None)
        left, top = g.view.origin
        if show:
            for i in range(d.done, len(d.squares) - 1):
                x, y = d.squares[i]
                if left <= x < left + VIEW and top <= y < top + VIEW:
                    src = (MARK_SRC_X, MARK_SRC_Y[0 if i < d.reach else 1], MARK_W, MARK_H)
                    fb.blit(g.sprites.ashadow, (AREA[0] + (x - left) * TILE + MARK_AT[0],
                                                AREA[1] + (y - top) * TILE + MARK_AT[1]), src)
        if not self.animator.busy and a is not None and left <= a.x < left + VIEW and top <= a.y < top + VIEW \
                and visible(st, g.sprites, g.view.origin, a.x, a.y):
            self.ants(fb, st, a, left, top)

    def ants(self, fb, st, a, left, top) -> None:
        kind = 2 if len(st.selection.moving) > 1 else 1
        f = ANTS_FIRST[kind] + self.ants_shown
        sx, sy = f % 4 * ANTS_PITCH, f // 4 * ANTS_SIZE
        frame = self._ants_frame(sx, sy, self.ants_colours[st.current])
        fb.blit(frame, (AREA[0] + (a.x - left) * TILE, AREA[1] + (a.y - top) * TILE))

    def _ants_frame(self, sx, sy, colour):
        key = (sx, sy, colour)
        if key not in self._ants:
            src = pygame.surfarray.array2d(self.curs)[sx:sx + ANTS_SIZE, sy:sy + ANTS_SIZE]
            out = np.full(src.shape, 255, np.uint8)
            out[src == ANTS_INK] = colour
            out[src == ANTS_BLACK] = 0
            s = pygame.Surface((ANTS_SIZE, ANTS_SIZE), depth=8)
            s.set_palette(IDENTITY)
            pygame.surfarray.blit_array(s, out)
            s.set_colorkey(255)
            self._ants[key] = s
        return self._ants[key]

    def paint(self, fb) -> None:
        g = self.game
        if self.animator.busy:                               # the overview of the walk's scene
            g.minimap.draw(fb, self.scene(), *g.view.origin)
        self.painter.draw(fb, self.scene())
        self.palette.draw(fb)
        kit(g.app).cursors.current = self.cursor(g.app.input.pos)


def _ds_list(exe, off):
    """A zero-ended word list in DGROUP."""
    out = []
    while (v := ds_words(exe, off + 2 * len(out), 1)[0]) != 0:
        out.append(v)
    return out


PHASE = Human
