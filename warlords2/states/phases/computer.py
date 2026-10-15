"""The screen during a main-loop run that contains computer turns: the engine paused at its
present points (`rules.present`) and the picture drawn from the real state at each of them.

The run (`rules.turn.run`, or `EndTurn` from End Turn) goes on its own thread
(`states.runner.Runner`); at every point where the EXE draws or waits it stops, this phase draws
what the EXE draws there from the state as it is at that moment (read only: no copy, no event
replay), holds the frames of the EXE's wait and lets the engine go on.  The engine never runs
while this phase draws and vice versa.  What the original keeps on the screen between its draws
is kept here as pictures (`map`, `overview` and the overview box, the info area of
`ui.turn_bar`, the battle window), so a computer side whose map is not drawn (Observe off)
leaves the picture as last drawn.  The display words of the EXE live here: DS:2eac / 2eae /
2eb0 (the map-view hysteresis of ovl64:006c), DS:0cf8 (the battle's message flag), DS:2d25
(overview markers), DS:124c / 1250 / 1252 / 1254 / 124e (the selection frame, 077b), the BIOS
keyboard buffer (keys typed during the run, flushed at each loop pass ovl59:01f1 at
ovl61:2165 and after the kills ovl37:0157, read one per kill by ovl37:00ae).

The game makes this phase current at the first point that draws (`needs_screen`); a run that
never reaches one (End Turn to another human side without anything shown) is handed to the
turn-start phase as before.  The points (address, what is drawn here):

* "end_turn" ovl61:2074: the buttons ovl61:0418 (2092: 0xad..0xb7, 0xba..0xbc, 0xf0, 0xf1,
  0x140..0x147 disabled, `END_TURN_OFF`; not enabled again during the computer turns), the info
  strip 0aeb (20cb), the map ovl64:006c (20c5), and with Hidden Map and more than one live human
  the map and the overview black (0a6e at 2110).  Begin (ovl61:0000(0, 1), si = 1) draws the
  strip (0076), refreshes the buttons (0174 at 0080) and disables the same set (0418 at 009f),
  and without Hidden Map draws the overview (00b8); no map (backdrop).  The buttons go to the
  turn-start phase as the run left them, also when the first side is human, until ovl68:05ad.
* "loop_pass" ovl61:2165: the keyboard buffer flushed (ovl59:01f1).
* "side" / "side_done" ovl61:21e8 / 21fd: the pointer off / on (12bf:07a5 / 0757); the music
  ovl58:0000(2) at 21d4 is M10c.
* "turn_start" ovl68:0000 (00ea..014d): no live human or (SCN 0x159 and not DS:3254) -> with
  Hidden Map the fog mask ovl63:2200 (00ea), and the overview ovl63:0000(1, 1, NULL) (0112,
  whatever SCN 0x124 says); the side's name ovl61:11d1 (013e), the bar's ground 1291 (0146) and
  131b(5) (014d).
* "no_cities" ovl68:0168..0192: the shield strip ovl68:0952(0, 0) (016d), 1291 and
  131b(25, 50, 75, 100), after the diplomacy messages of ovl00:0db3.
* "strip" ovl68:0952 from ovl25:0064 (0, 0), ovl61:183f (1, 0, the round end) and ovl68:0374
  (0, 0, the human turn start, after "human_turn": drawn although the rest of the run is the
  turn-start phase's): the game's strip over the menu bar (`ui.shield_strip`, `Game.strip_call`);
  it needs no screen of this phase.  "bar" ovl25:00c7..034e: 131b(n).
* End states of the round end ovl61:1aed (`rules.victory.check`): "no_players" (two-line pop-ups
  ovl61:1160 at 1c28 / 1c4f, each waits for a key), then "quit" (0a4c:02b5 at 1c55: the program
  ends, nothing after it runs); "no_humans" (1160 at 1c8d / 1cb4); "winner" (one line ovl61:10fb
  at 1d71).  The pop-ups are the dialog "message" (popup 5), as the waiting elimination line.
* "keys" ovl25:045e (0380): Alt or Shift held (BIOS 0000:0417 & 0x0b, here `Input.alt` /
  `shift`) -> Settings ovl33:0000(0): the dialog drawn, DS:166a set, no modal wait; the engine
  runs on under it until "loop_check" (ovl61:220b..2212) answers True and the loop stops; the
  dialog's close (ovl33:0034 with DS:0bf0 = 0) runs the loop again (0060).
* "turn_end" ovl68:0218: ovl62:0af3 (the selection frame taken off, 077b:003d -> ovl64:0238).
* "message" ovl61:11d1(msg, t) with the caller's wait: ovl00:0f5f (0x14), ovl36:2232 (0x14),
  ovl64:18c7 (0x19); "eliminated" ovl61:1a39 (11d1(.., 0x64) for a computer side with no human
  alive, else the waiting pop-up ovl61:10fb); "city_line" ovl19:1914 / 19da / 1a5f -> ovl36:16b3
  (11d1(.., 5) only when DS:0cf8).
* "step" 0a8b:05f2: ovl64:0565 -> 0629 -> 006c (the view words were written by the engine), then
  the step wait 05f7..0654 (3 ticks, not gated); "overview_square" ovl63:1fed (05ea) after a
  reveal; "map" the other 006c calls (0a8b:0565 around a battle, 0a8b:02cb / 043a, ovl67:094b,
  0b62:08d8, ovl24:1103); "frame" 077b:005f; "frame_off" ovl62:0af3; "overview" ovl63:0000
  (ovl47:020a, ovl26:0360).
* The AI's battle ovl36:124a: "battle_mark" 1836(x, y, 1) (1454: the map rebuilt at the view
  words with war.pck's mark; no war sample, 1a1a tests a human side); "battle_before" (147c..
  14eb: the box moved by ovl65:0227 at 1474 when shown, STRING 0x94 / 0x95 through 11d1(.., 5),
  DS:0cf8); "battle_window" (150a..1538: ovl37:0160(0), ovl59:0000(5), the kills ovl37:0094);
  "battle_result" (157b..161f: 0x98 / 0x8e / 0x96, ovl36:16b3, the window line ovl37:04c5,
  ovl59:0000(10), ovl37:04f6 without a wait for a computer side); "battle_after" (162d..167e:
  1836(x, y, 0), ovl62:0af3, ovl65:05ec with DS:3254 and Hidden Map, ovl63:0000(1, 1, NULL)).
* "human_turn" ovl68:0259: from here the run is the human turn start's, played by the
  turn-start phase from its events (`Game.hand_over`).

ovl64:006c (`map_draw`): returns for a computer side with SCN 0x159 == 0 (0083..0098); with
DS:3254 (`AiProcess.single_view`) it returns when the selected stack's square (00aa..00c6) or
the view centre (0106..0128) is fully hidden in the human's view, i.e. DS:2d56[ovl64:1055(x,
y, 1)] == 0x0e, where 1055 sets bit k for neighbour k (DS:2efa / 2f0a) off the map or without
road bit 7; the exception: DS:2eac set and the square within one of the last drawn centre
DS:2eae / 2eb0 (00c8..00f4, 012a..015d; the centre case then draws once and clears DS:2eac,
015f).  It draws: DS:2eac = 1 (0169, not on the 015f path), DS:2eae / 2eb0 = the view centre,
ovl65:0227(centre) (the overview box), the view ovl64:0053 (from road bit 7 with DS:3254) and,
for DS:5e62 on a square that is not black, the selection frame (ovl62:0afd / 0b27 ->
077b:0020 / 005f: two frame draws, phases DS:124e and DS:124e + 1).
ovl63:0000(markers, force, rect) (`overview_draw`): returns with Hidden Map for a computer side
with SCN 0x159 == 0 (0010..0042); with DS:3254 and a rectangle only the box (0698); with markers
on (DS:2d25) and force 0 nothing; else the bitmap through the fog (road bit 7 with DS:3254) and
the markers (ovl63:0ed7, DS:2d25 = 1) or none (DS:2d25 = 0).
"""
from __future__ import annotations

import logging
from collections import deque
from dataclasses import dataclass
from types import SimpleNamespace

import numpy as np
import pygame

from ...assets.exe import ds_bytes, ds_str, ds_words
from ...model import events as E
from ...model.ids import MAP_H, MAP_W, Control, Terrain
from ...rules.constants import movement as KM
from ...rules.constants import turn as KT
from ...ui import registry
from ...ui.animate import frames as tick_count
from ...ui.dialogs import fight as F
from ...ui.layout import DISABLED
from ...ui.mapview import AREA, VIEW, MapView, compose, render, view_origin
from ...ui.minimap import RECT as OVERVIEW_RECT
from ...ui.palettes import ActionPalette, painter_for
from ...ui.screen import IDENTITY
from ...ui.turn_bar import TurnBar
from ...ui.widgets import kit
from . import Phase

log = logging.getLogger(__name__)

BLACK, BACKDROP = "black", "backdrop"          # ovl61:0a6e / nothing drawn (Begin)
NO_CITY_BAR = (25, 50, 75, 100)                # ovl68:0178..0190
FIRST_BAR = 5                                  # ovl68:014b
STEP_TICKS = 3                                 # 0a8b:0640 (cmp eax, 3)
SCN_VIEWED = KT.SCN_VIEWED.value               # 0x159
SCN_TOP, SCN_LEFT, SCN_CX, SCN_CY = 0x175, 0x177, 0x17D, 0x17F
SEEN, PORT_VIEW = KM.EXPLORED.value, KM.ROAD_PORT_VIEW.value    # road bits 5 / 7
FOG_TABLE, FOG_FULL = 0x2D56, 0x0E             # ovl64:00c1 / 0123
NEIGHBOURS_1055 = (0x2EFA, 0x2F0A)             # ovl64:106e / 1079
END_TURN_OFF = (tuple(range(0xAD, 0xB8)) + (0xBA, 0xBB, 0xBC, 0xF0, 0xF1)
                + tuple(range(0x140, 0x148)))  # ovl61:0418
BEFORE, BEFORE_NEUTRAL = 0x94, 0x95            # ovl36:149b / 14b9
C_LOST, C_HERO_WON, C_WON = 0x98, 0x8E, 0x96   # ovl36:1594 / 15b7 / 15d2
LINE_WAIT, WINDOW_WAIT, RESULT_WAIT = 5, 5, 10   # ovl36:14d5 / 16bd, 1523, 1612
BLAST, BLAST_FAST, PAUSE, PAUSE_SLOW = 5, 2, 3, 5    # ovl37:0054 / 0058, 0133 / 013f
SPACE = 0x20
SIDES = 8
TILE = 40
OV_W, OV_H = MAP_W, MAP_H                      # overview squares (2 px each)
ANTS_FIRST = {1: 0, 2: 4}                      # DS:125c[kind] (077b:017c)
ANTS_COLOURS, ANTS_SIZE, ANTS_PITCH = 0x2B6C, 40, 64
ANTS_INK, ANTS_BLACK, CURS = 1, 4, 10
# points that need this phase on the screen (the others only keep the picture up to date)
QUIET = frozenset({"end_turn", "loop_pass", "human_turn", "loop_check", "sound", "strip"})
# points drawn after "human_turn" too (they draw only what the game keeps, not this phase)
ALWAYS = frozenset({"strip"})


def live_humans(state) -> int:
    return sum(1 for p in state.players if p.alive and p.control == Control.HUMAN)


@dataclass
class DisplayWords:
    """DGROUP words of the drawing that the EXE keeps for the whole program run (not saved):
    one per app (`App.display_words`), so they carry from one computer phase to the next.
    Start values: DS:0cf8, 2eac..2eb0, 124c, 124e 0 (image); DS:2d25 taken as 1, the markers
    every game-frame overview draw shows (ovl61:0000's 0112 / 00b8 call (1, 1, NULL))."""
    told: int = 0                                      # DS:0cf8
    eac: int = 0                                       # DS:2eac
    eae: int = 0                                       # DS:2eae
    eb0: int = 0                                       # DS:2eb0
    frame: tuple | None = None                         # DS:124c kind, 1252, 1254, 1250
    frame_phase: int = 0                               # DS:124e
    markers: int = 1                                   # DS:2d25


def _word(name):
    return property(lambda self: getattr(self.words, name), lambda self, v: setattr(self.words, name, v))


class ComputerTurn(Phase):
    name = "computer"
    told, eac, eae, eb0 = _word("told"), _word("eac"), _word("eae"), _word("eb0")
    frame, frame_phase, markers = _word("frame"), _word("frame_phase"), _word("markers")

    def __init__(self, game):
        super().__init__(game)
        g = game
        k = self.k = kit(g.app)
        self.painter = painter_for(g)
        self.palette = ActionPalette(g)
        self.bar = TurnBar(g)
        self.view = MapView(g.sprites)                 # never centred through SetView
        self.map: pygame.Surface | str | None = BACKDROP
        self.overview: pygame.Surface | str | None = BACKDROP
        st = g.state
        self.box = view_origin(st.flags.get(SCN_CX, 0), st.flags.get(SCN_CY, 0)) if st is not None else None
        self.runner = None
        self.it = None
        self.reply = None
        self.ticks = 0                                 # BIOS ticks of the waits so far
        self.keys: deque = deque()                     # BIOS keyboard buffer (codes)
        self.key_events: deque = deque()               # the same keys as pygame events
        self.handoff: list = []                        # buffered keys the Settings dialog reads
        self.hidden = False                            # pointer off (ovl61:21e8 .. 21fd)
        self.current = False                           # the game's phase
        self.presenting = True                         # False from ovl68:0259 on
        self.settings = None                           # Settings opened by ovl25:045e
        self.popup = None                              # ovl61:10fb pop-up
        self.done_events = None                        # a finished run waiting for Settings
        self.stopped = False                           # the run ended at ovl61:220b
        self.palette_set = False                       # End Turn's 0418 / Begin's 0174 done
        words = getattr(g.app, "display_words", None)
        if words is None:
            words = g.app.display_words = DisplayWords()
        self.words = words                             # DS:0cf8, 2eac.., 124c.., 2d25
        self.fight = None                              # the battle window (not on the stack)
        exe = k.exe
        self.fog_table = ds_bytes(exe, FOG_TABLE, 256)
        self.nb1055 = tuple(zip(ds_words(exe, NEIGHBOURS_1055[0], 8), ds_words(exe, NEIGHBOURS_1055[1], 8)))
        self.ants_colours = ds_words(exe, ANTS_COLOURS, 8)
        self.curs = k.picture(CURS)
        self._ants = {}

    # ---------------------------------------------------------------- the run

    def start_run(self, runner, blank: str | None = None) -> None:
        """A new run; `blank` the picture the run starts from (Begin: "backdrop"), None to keep
        it (the next run of the same computer phase, End Turn draws its own)."""
        g = self.game
        self.runner = runner
        self.presenting = True
        if blank == BACKDROP:                          # ovl61:0000(0, 1) (si = 1)
            self.palette.refresh(g.state, False)       # 0174 (0080)
            self.disable_buttons()                     # 0418 (009f, si != 0)
            self.map = BACKDROP                        # no ovl64:006c (005a)
            if not g.state.options.hidden_map:         # 00a7..00b8
                self.overview_draw()
            else:
                self.overview = BACKDROP
            self.box = view_origin(g.state.flags.get(SCN_CX, 0), g.state.flags.get(SCN_CY, 0))

    def abandon(self) -> None:
        if self.runner is not None:
            self.runner.abandon()
            self.runner = None

    def needs_screen(self, name: str) -> bool:
        return self.presenting and name not in QUIET

    def pump(self) -> None:
        """Let the engine run from point to point until a point holds frames, a dialog waits or
        the run is over."""
        g = self.game
        while True:
            if self.it is not None or self.waiting():
                return
            if self.runner is None:
                if self.done_events is not None and self.settings is None:
                    events, self.done_events = self.done_events, None
                    if not self.finish(events):
                        return
                    continue
                return
            p = self.runner.resume(self.reply)
            self.reply = None
            if p is None:
                events = self.runner.result or []
                self.runner = None
                if self.settings is not None:          # stopped at ovl61:220b: the dialog's
                    self.done_events = events          # loop (07be:0064) reads the buffer now
                    self.handoff = list(self.key_events)
                    self.flush_keys()
                    return
                if not self.finish(events):
                    return
                continue
            name, info = p
            if not self.presenting:
                if name in ALWAYS:
                    self.handle(name, info)
                continue
            if not self.current and self.needs_screen(name):
                g.enter_computer_phase(self)
            it = self.handle(name, info)
            if it is not None and self.current:
                self.it = iter(it)
                if self.advance():
                    return

    def advance(self) -> bool:
        """One frame of the current point's hold; False when it is over."""
        try:
            next(self.it)
            return True
        except StopIteration:
            self.it = None
            return False

    def waiting(self) -> bool:
        if self.popup is not None:
            if self.popup.stack is not None:
                return True
            self.popup = None
        return False

    def finish(self, events) -> bool:
        """The run is over: the next run of the loop (one computer side per run), or the human
        part to the turn-start phase.  True when a new run was started."""
        g = self.game
        if not self.current:
            g.hand_over(events, run=self if self.palette_set else None)
            return False
        k = next((i for i, e in enumerate(events) if isinstance(e, E.TurnStarted) and e.info.get("human")), None)
        stopped, self.stopped = self.stopped, False
        if k is None and (g.loop_waits() or (stopped and g.loop_goes_on())):
            g.next_run()                               # ovl61:2123 goes on (after Settings: 0060)
            return True
        g.hand_over(events[k:] if k is not None else [])
        return False

    # ---------------------------------------------------------------- frames

    def busy(self) -> bool:
        return True

    @property
    def hides_pointer(self) -> bool:
        return self.hidden or (self.fight is not None and self.fight.phase == "kills")

    @property
    def under_dialogs(self) -> bool:
        """The engine runs on under the Settings dialog ovl25:045e opened (ovl61:2123 has not
        stopped yet)."""
        return self.runner is not None and self.settings is not None and not self.waiting()

    def step(self, events, dt):
        """One frame: keys typed go to the BIOS buffer (int 9 runs whatever the program does,
        also while the engine runs on under the Settings dialog); the current hold, or the
        engine to its next hold.  An error of the run is the game's (`Game.run_failed`)."""
        for e in events:
            if e.type == pygame.KEYDOWN:
                self.keys.append(SPACE if e.key == pygame.K_SPACE else (e.unicode or e.key))
                self.key_events.append(e)
        try:
            if self.it is not None and self.advance():
                return None
            self.pump()
        except Exception as e:                        # noqa: BLE001 (logged, the state restored)
            self.game.run_failed(e)
        return None

    def poll_key(self):
        """One key off the BIOS buffer (ovl37:00ae..00ce), None when it is empty."""
        if self.key_events:
            self.key_events.popleft()
        return self.keys.popleft() if self.keys else None

    def flush_keys(self) -> None:
        """ovl59:01f1."""
        self.keys.clear()
        self.key_events.clear()

    def settings_closed(self) -> None:
        """ovl33:0034 with DS:0bf0 = 0: DS:166a = 0, screen 0, the loop ovl61:2123 again (0060);
        no palette refresh."""
        self.settings = None

    def refresh(self) -> None:
        self.settings_closed()

    # ---------------------------------------------------------------- points

    def handle(self, name: str, info: dict):
        fn = getattr(self, "p_" + name, None)
        if fn is None:
            log.warning("present point %r is not drawn", name)
            return None
        return fn(**info)

    def wait(self, ticks: int):
        """ovl59:0000(ticks) and the other tick waits: one sequence from the phase's start."""
        n = max(1, tick_count(self.game.app, ticks, self.ticks))
        self.ticks += ticks
        for _ in range(n):
            yield None

    def p_end_turn(self, player):
        """ovl61:2074: 0418 (2092), 0aeb (20cb), 006c (20c5), 0a6e (2110)."""
        g = self.game
        st = g.state
        human = getattr(g.phase, "palette", None)
        if human is not None:
            self.palette.row.state = dict(human.row.state)
            self.palette.row.buttons = list(human.row.buttons)
            self.palette.hidden = set(human.hidden)
        self.disable_buttons()
        self.map_draw()
        self.overview_draw()
        self.box = self.words_box(st)
        if st.options.hidden_map and live_humans(st) > 1:      # 20fd..2110
            self.map = self.overview = BLACK
        return None

    def disable_buttons(self) -> None:
        """ovl61:0418: the buttons of `END_TURN_OFF` to state 2 (08a9:066e)."""
        for id in END_TURN_OFF:
            self.palette.row.state[id] = DISABLED
        self.palette_set = True

    def p_loop_pass(self):
        self.flush_keys()                               # ovl59:01f1 at ovl61:2165

    def p_side(self, player):
        self.hidden = True                              # 12bf:07a5 at ovl61:21e8

    def p_side_done(self, player):
        self.hidden = False                             # 12bf:0757 at ovl61:21fd

    def p_human_turn(self, player):
        self.presenting = False

    def p_loop_check(self):
        self.reply = self.stopped = self.settings is not None     # DS:166a (ovl61:220b)

    def p_strip(self, at):
        self.game.strip_call(at)                        # ovl68:0952 (ui.shield_strip.CALLS)

    def p_sound(self, name, at):
        if self.current:
            from ...audio import effects
            getattr(effects, name)(self.game.app)

    def p_turn_start(self, player, no_human):
        st = self.game.state
        single = st.ai.proc.single_view
        if no_human or (st.flags.get(SCN_VIEWED, 0) and not single):
            self.overview_draw()                        # (Hidden Map: ovl63:2200 at 00ea) ovl63:0000 (0112)
        self.bar.announce(st)                           # 11d1 (013e)
        self.bar.ground_on()                            # 1291 (0146)
        self.bar.progress(st, FIRST_BAR)                # 131b(5) (014d)

    def p_no_cities(self, player):
        st = self.game.state
        self.game.strip_call("ovl68:016d")              # ovl68:0952(0, 0)
        self.bar.ground_on()
        for n in NO_CITY_BAR:
            self.bar.progress(st, n)

    def p_bar(self, n):
        self.bar.progress(self.game.state, n)

    def p_keys(self):
        g = self.game
        if not (g.app.input.alt or g.app.input.shift):
            return None
        self.settings = registry.open_dialog("settings", g, on_close=lambda _: g.settings_closed())
        return None

    def p_turn_end(self, player):
        self.frame_off()

    def p_message(self, group, index, args, wait):
        st = self.game.state
        self.bar.message(st, self.k.text.S(group, index, *args))
        return self.wait(wait) if wait > 0 else None

    def p_eliminated(self, group, index, args, timed, wait):
        st = self.game.state
        text = self.k.text.S(group, index, *args)
        if timed:
            self.bar.message(st, text)
            return self.wait(wait)
        return self._wait_lines([text])                 # ovl61:10fb (1a49..1a4f)

    def _wait_lines(self, lines):
        """ovl61:10fb (one line) / 1160 (two): popup 5 waiting for a key (mask 0xd4, ovl59:0142);
        after the close 10fb flushes the keyboard (ovl59:01f1 at 1159), 1160 does not (11ca..11d0)."""
        flush = len(lines) == 1
        self.popup = registry.open_dialog("message", self.game, lines=lines,
                                          on_close=(lambda _: self.flush_keys()) if flush else None)
        return None

    def p_no_players(self, group, index, at):
        T = self.k.text
        return self._wait_lines([T.S(group, index), T.S(group, index + 1)])

    def p_no_humans(self, group, index, at):
        T = self.k.text
        return self._wait_lines([T.S(group, index), T.S(group, index + 1)])

    def p_winner(self, group, index, args, at):
        return self._wait_lines([self.k.text.S(group, index, *args)])

    def p_quit(self, at):
        """0a4c:02b5: the program ends (155e:02a0, ..., exit(0)); the engine thread stays where
        it is and is abandoned when the app closes (`App.exit_program`: the console banner too)."""
        from ...ui.dialogs.save_load import exit_program
        exit_program(self.game.app)
        return self._ended()

    def _ended(self):
        while True:
            yield None

    def p_city_line(self, fmt, city):
        if not self.told:                               # ovl36:16b3
            return None
        st = self.game.state
        self.bar.message(st, ds_str(self.k.exe, fmt) % st.cities[city].name)
        return self.wait(LINE_WAIT)

    def p_step(self, x, y):
        """0a8b:04c8: t0 at 050c (before the step), the step, 006c, then the wait until t - t0
        >= 3 (05f7..0654).  The step and the draw take no time here, so the 3 ticks counted
        from this point are the 3 ticks from the step's start."""
        self.map_draw()
        return self.wait(STEP_TICKS)

    def p_map(self, at):
        self.map_draw()

    def p_frame(self, at):
        self.frame_draw()

    def p_frame_off(self, at):
        self.frame_off()

    def p_overview(self, at, markers=1, force=1):
        self.overview_draw(markers, force)

    def p_overview_square(self, x, y):
        self.overview_square(x, y)

    # ---------------------------------------------------------------- the AI's battle

    def p_battle_mark(self, x, y):
        """ovl36:1836(x, y, 1): ovl65:0227 on the view words, the view built and the mark."""
        st = self.game.state
        self.box = self.words_box(st)
        self.render_map(st)
        self.mark(st, x, y)

    def p_battle_before(self, x, y, owner, show, show2, view):
        st = self.game.state
        if show:
            self.box = self.words_box(st)               # ovl65:0227(x, y) at 1474
        self.told = int(bool(show or view))             # DS:0cf8
        if not self.told:
            return None
        T = self.k.text
        line = T.S(BEFORE, 0, st.players[owner].name) if owner < SIDES else T.S(BEFORE_NEUTRAL, 0)
        self.bar.message(st, line)
        return self.wait(LINE_WAIT)

    def p_battle_window(self, x, y, battle, owner, attacker):
        g = self.game
        s = battle.setup
        ev = SimpleNamespace(info={"x": x, "y": y, "attacker": s.attacker, "owner": s.owner,
                                   "attackers": list(s.attackers), "defenders": list(s.defenders)})
        d = F.Fight(g, battle=ev, scene=g.state, anim=None)
        d.mark = False
        d.phase = "kills"
        self.fight = d
        return self._kills(d, battle.duels)

    def _kills(self, d, duels):
        """ovl37:0160(0), ovl59:0000(5), ovl37:0094 (asm 00a6..0157)."""
        from ...audio import effects
        app = self.game.app
        yield from self.wait(WINDOW_WAIT)
        for duel in duels:
            if not d.fast and self.poll_key() == SPACE:                        # 00ae..00ce
                d.fast = True
            ev = SimpleNamespace(info=duel)
            if not d.fast:
                effects.army(app, 0 if duel["loser"] == "attacker" else 1)    # 00dd / 010c
            d.blast = d.slot(ev)
            yield from self.wait(BLAST_FAST if d.fast else BLAST)
            d.dead.add(d.blast)
            d.blast = None
            yield from self.wait(PAUSE)
            if not d.fast:
                yield from self.wait(PAUSE_SLOW)
        self.flush_keys()                               # ovl59:01f1 at ovl37:0157
        d.phase = "result"

    def p_battle_result(self, x, y, won, show, show2, view):
        """ovl36:157b..161f."""
        st = self.game.state
        T = self.k.text
        side = st.players[st.current].name
        hero = st.selection.hero                        # DS:5e5e (0a6b leaves it; a dead hero's
        slot = st.armies[hero].hero_slot if 0 <= hero < len(st.armies) else -1   # record keeps +0xa)
        if not won:
            line = T.S(C_LOST, 0, side)
        elif 0 <= slot < len(st.heroes):
            line = T.S(C_HERO_WON, 0, st.heroes[slot].name)
        else:
            line = T.S(C_WON, 0, side)
        return self._result(line, bool(show2 or view))

    def _result(self, line, window):
        if self.told:                                   # ovl36:16b3
            self.bar.message(self.game.state, line)
            yield from self.wait(LINE_WAIT)
        if window and self.fight is not None:           # ovl37:04c5, ovl59:0000(10), 04f6
            self.fight.say(line)
            yield from self.wait(RESULT_WAIT)
            self.fight = None                           # ovl17:069c

    def p_battle_after(self, x, y):
        """ovl36:1836(x, y, 0), ovl62:0af3, ovl65:05ec, ovl63:0000(1, 1, NULL)."""
        st = self.game.state
        self.fight = None
        self.box = self.words_box(st)
        self.render_map(st)
        self.frame_off()
        self.overview_draw()

    # ---------------------------------------------------------------- the map (ovl64)

    def words_box(self, st) -> tuple[int, int]:
        return st.flags.get(SCN_LEFT, 0), st.flags.get(SCN_TOP, 0)

    def hidden_at(self, st, x: int, y: int, edge: int = 1) -> bool:
        """DS:2d56[ovl64:1055(x, y, edge)] == 0x0e with DS:3254 (road bit 7)."""
        roads = st.world.roads
        m = 0
        for k, (dx, dy) in enumerate(self.nb1055):
            nx, ny = x + dx, y + dy
            if not (0 <= nx < MAP_W and 0 <= ny < MAP_H):
                m |= edge << k
            elif not roads[ny * MAP_W + nx] & PORT_VIEW:
                m |= 1 << k
        return self.fog_table[m & 0xFF] == FOG_FULL

    def selected(self, st):
        i = st.selection.selected
        if 0 <= i < len(st.armies) and st.armies[i].owner != 0xFF:
            return st.armies[i]
        return None

    def map_draw(self) -> None:
        """ovl64:006c."""
        st = self.game.state
        f = st.flags
        if st.players[st.current].control == Control.COMPUTER and not f.get(SCN_VIEWED, 0):
            return                                      # 0083..0098
        cx, cy = f.get(SCN_CX, 0), f.get(SCN_CY, 0)
        if st.ai.proc.single_view:
            lead = self.selected(st)
            if lead is not None and self.hidden_at(st, lead.x, lead.y):          # 00a2..00c6
                if not (self.eac and abs(lead.x - self.eae) <= 1 and abs(lead.y - self.eb0) <= 1):
                    self.eac = 0
                    return
            if self.hidden_at(st, cx, cy):                                       # 0106..0128
                if not (self.eac and abs(cx - self.eae) <= 1 and abs(cy - self.eb0) <= 1):
                    self.eac = 0
                    return
                self.eac = 0                                                     # 015f
            else:
                self.eac = 1
        else:
            self.eac = 1                                                         # 0169
        self.eae, self.eb0 = cx, cy                                              # 016f..0184
        self.box = view_origin(cx, cy)                                           # ovl65:0227
        self.render_map(st)
        lead = self.selected(st)
        if lead is None:
            return
        left, top = view_origin(cx, cy)
        inside = left <= lead.x < left + VIEW and top <= lead.y < top + VIEW
        if inside and self.cells[lead.x - left][lead.y - top].fog == FOG_FULL:  # 0203
            return
        self.frame = (2 if st.selection.group else 1, lead.x, lead.y, self.ants_colours[st.current])
        self.frame_draw()

    def render_map(self, st) -> None:
        """ovl64:0053 at the view words into the map picture."""
        cx, cy = st.flags.get(SCN_CX, 0), st.flags.get(SCN_CY, 0)
        left, top = view_origin(cx, cy)
        lead = self.selected(st)
        seen = PORT_VIEW if st.ai.proc.single_view else SEEN
        self.cells = compose(st, left, top, self.view.sp, lead.id if lead is not None else None, seen)
        render(self.view.buf, self.cells, self.view.sp, None)
        self.map = self.view.buf.copy()
        self.map_origin = (left, top)

    def mark(self, st, x: int, y: int) -> None:
        """ovl36:190f..19d4: war.pck through its mask into the map picture."""
        if not isinstance(self.map, pygame.Surface):
            return
        (sx, sy, w, h), (dx, dy) = F.mark_blit(self.k.exe, self.map_origin, x, y)
        self.map.blit(self.k.picture(F.WAR), (dx, dy), (sx, sy, w, h))

    def square_redraw(self, x: int, y: int) -> None:
        """ovl64:0238(x, y): in the view, SCN 0x159, with DS:3254 the view centre not hidden
        (1055(.., 0)); the view built, only (x, y) copied."""
        st = self.game.state
        f = st.flags
        left, top = view_origin(f.get(SCN_CX, 0), f.get(SCN_CY, 0))
        if not (left <= x < left + VIEW and top <= y < top + VIEW) or not f.get(SCN_VIEWED, 0):
            return
        if st.ai.proc.single_view and self.hidden_at(st, f.get(SCN_CX, 0), f.get(SCN_CY, 0), 0):
            return
        old = self.map
        self.render_map(st)
        if isinstance(old, pygame.Surface):
            r = ((x - left) * TILE, (y - top) * TILE, TILE, TILE)
            old.blit(self.map, r[:2], r)
            self.map = old

    def frame_draw(self) -> None:
        """077b:005f: 0161(4) and 0161(0) draw the frame (phase DS:124e, then + 1)."""
        for _ in range(2):
            if self.frame is None:
                return
            kind, x, y, colour = self.frame
            self._ants_on_map(kind, x, y, colour, ANTS_FIRST[kind] + self.frame_phase)
            self.frame_phase = (self.frame_phase + 1) % 4

    def frame_off(self) -> None:
        """ovl62:0af3 -> 077b:003d: with DS:124c the square redrawn (ovl64:0238), DS:124c = 0."""
        if self.frame is not None:
            _, x, y, _ = self.frame
            self.square_redraw(x, y)
        self.frame = None

    def _ants_on_map(self, kind, x, y, colour, f) -> None:
        """077b:01a1: CURS.PCK frame f under its mask in the side's colour, on (x, y) when it is
        in the view (077b:03f8)."""
        if not isinstance(self.map, pygame.Surface):
            return
        st = self.game.state
        left, top = view_origin(st.flags.get(SCN_CX, 0), st.flags.get(SCN_CY, 0))
        if not (left <= x < left + VIEW and top <= y < top + VIEW):
            return
        key = (f, colour)
        s = self._ants.get(key)
        if s is None:
            sx, sy = f % 4 * ANTS_PITCH, f // 4 * ANTS_SIZE
            src = pygame.surfarray.array2d(self.curs)[sx:sx + ANTS_SIZE, sy:sy + ANTS_SIZE]
            out = np.full(src.shape, 255, np.uint8)
            out[src == ANTS_INK] = colour
            out[src == ANTS_BLACK] = 0
            s = pygame.Surface((ANTS_SIZE, ANTS_SIZE), depth=8)
            s.set_palette(IDENTITY)
            pygame.surfarray.blit_array(s, out)
            s.set_colorkey(255)
            self._ants[key] = s
        self.map.blit(s, ((x - left) * TILE, (y - top) * TILE))

    # ---------------------------------------------------------------- the overview (ovl63)

    def overview_draw(self, markers: int = 1, force: int = 1, region=None) -> None:
        """ovl63:0000(markers, force, region)."""
        g = self.game
        st = g.state
        computer = st.players[st.current].control == Control.COMPUTER
        hm = bool(st.options.hidden_map)
        if hm and computer and not st.flags.get(SCN_VIEWED, 0):
            return                                      # 0010..0042 (DS:2d28 is 0)
        if hm and computer and st.ai.proc.single_view and region is not None:
            return                                      # 0698 only: the box, drawn always here
        if markers and self.markers and not force:
            return
        seen = PORT_VIEW if st.ai.proc.single_view else SEEN
        mm = g.minimap
        mm.compose(st, seen, bool(markers))
        self.markers = int(bool(markers))
        if region is None or not isinstance(self.overview, pygame.Surface):
            self.overview = mm.buf.copy()
            return
        x, y, w, h = region
        self.overview.blit(mm.buf, (x, y), (x, y, w, h))

    def overview_square(self, x: int, y: int) -> None:
        """ovl63:1fed(x, y, 1): Hidden Map, a human side or SCN 0x159, no DS:3254; the reveal box
        (5 x 5 for a city square, map high byte bit 5 or a flying stack DS:5dfc == 2, else 3 x 3)
        clipped to the map, then ovl63:0000(1, 1, box) (0000..02e8: the box widened to the
        4-square grid and 8 squares around it)."""
        st = self.game.state
        if not st.options.hidden_map or st.ai.proc.single_view:
            return
        if st.players[st.current].control == Control.COMPUTER and not st.flags.get(SCN_VIEWED, 0):
            return
        i = y * MAP_W + x
        wide = (st.world.terrain(x, y) == Terrain.CITY or st.world.flags[i] >> 5 & 1
                or st.selection.mode == KM.MODE_FLY.value)
        r = 2 if wide else 1
        x0, y0, w, h = x - r, y - r, 2 * r + 1, 2 * r + 1
        if x0 < 0:
            w, x0 = w + x0, 0
        if y0 < 0:
            h, y0 = h + y0, 0
        if x0 + w >= OV_W:
            w = OV_W - 1 - x0
        if y0 + h >= OV_H:
            h = OV_H - 1 - y0
        a, aw, b, bh = (x0 >> 2) << 2, ((w - 1 >> 3) + 1) * 8, y0, h       # 1f52..1f58
        if a < 0:
            a, aw = 0, 8
        if b < 0:
            b, bh = 0, 8
        if a + aw > OV_W:
            a, aw = OV_W - 8, 8
        if b + bh > OV_H:
            b, bh = OV_H - 8, 8
        a, b, aw, bh = a - 4, b - 4, aw + 8, bh + 8                         # 1f4a..1f50
        a, b = max(a, 0), max(b, 0)
        if a + aw > OV_W:
            a, aw = OV_W - 16, 16
        if b + bh > OV_H:
            b, bh = OV_H - 16, 16
        self.overview_draw(1, 1, (2 * a, 2 * b, 2 * aw, 2 * bh))

    # ---------------------------------------------------------------- drawing

    def paint_map(self, fb) -> None:
        if isinstance(self.map, pygame.Surface):
            fb.blit(self.map, AREA[:2])
        elif self.map == BLACK:
            fb.fill(0, AREA)

    def paint_overview(self, fb) -> None:
        if isinstance(self.overview, pygame.Surface):
            fb.blit(self.overview, OVERVIEW_RECT[:2])
            if self.box is not None:
                from ...ui.minimap import BOX, BOX_COLOUR, BOX_LEN
                x, y = OVERVIEW_RECT[0] + 2 * self.box[0], OVERVIEW_RECT[1] + 2 * self.box[1]
                for d in (0, 1, BOX - 2, BOX - 1):
                    fb.fill(BOX_COLOUR, (x, y + d, BOX_LEN, 1))
                    fb.fill(BOX_COLOUR, (x + d, y, 1, BOX_LEN))
        elif self.overview == BLACK:
            fb.fill(0, OVERVIEW_RECT)

    def paint(self, fb) -> None:
        self.painter.strip(fb)                 # ovl61:0aeb (End Turn 20cb, Begin 0076)
        self.bar.draw(fb)                      # 11d1 / 1291 / 131b as drawn so far
        self.palette.draw(fb)
        if self.fight is not None:
            self.fight.draw(fb)


PHASE = ComputerTurn
