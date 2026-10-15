"""The game state: game frame, playing map, overview map and the phase machine.

Entered with `new_game=NewGameConfig` and `overview=` the strategic bitmap the setup
screen's scenario load built (ovl63:232b runs inside ovl57:0194, before the Game Setup
screen; `states.setup.load_scroll`), or with `new_game` alone (--scenario via
`states.boot`, which has no setup screen: the building phase runs the same load first),
or `load_slot=n` (M10b: `start_load` from the first `step`, no building phase).  `on_enter`
runs on pgsm's hook thread, so it only stores the arguments; the engine game is started by
the building phase (or the load) on the main thread.  Until
then the state draws the empty game frame (SCREEN0-3, SHOT 08) with the program's one menu
bar (`ui.menubar.title_bar`) as the Game Setup screen left it (ovl57:0416 / 0564: all
titles off but Game / Quit, rules.md section 9.7); with --scenario there was no setup
screen, so its enable sequence and title repaint run here once.

Turns (M8a).  Begin enters ovl61:0000(0, 1): turn order and first side (done by
`rules.setup.new_game`), then the main loop ovl61:2123 (`rules.turn.run`, `start_turns`); End
Turn (menu 535, ovl61:2074) is the `EndTurn` command (`end_turn`), which ends in the same loop.
Each loop pass begins with `rules.turn.pass_top` (site tiles, map words, cost map, ...).  Its events are played by the turn-start phase (the
"Turn %d" pop-up, the advisor, the tutorial pages, the pending hero offer); then the human
phase.  The run from Begin goes one computer side at a time (`run_loop`, `rules.turn.run` with
max_sides=1), and so does End Turn (`EndTurn(max_sides=1)`; ovl61:220b stops the loop after a
side when the Settings dialog ovl25:045e opened is up, and its changes reach the next side).
A run goes on an engine thread (`states.runner.Runner`) that stops at the EXE's draw / wait
points (`rules.present`); the computer phase (`states.phases.computer`, M8b1) is made current at
the first point that draws (no frame between End Turn's draws and ovl68:0000's) and draws each
point from the state as it is then; it runs the next side's run itself and hands the human part,
from the human turn start on, to the turn-start phase (`hand_over`).  A run without such a point
(End Turn to another human side) goes to the turn-start phase directly.  While a computer
side's turn plays the pointer is hidden (ovl61:21e8 / 21fd, the phase's `hides_pointer`).
When the engine refuses the loop (strict mode with a step of a later milestone missing, e.g. a
computer side without M8b1's AI) the error is logged and the game stays where it was (the human
phase, without a turn start, when it was the run from Begin).  The game or the app closing
during a run abandons the parked engine thread (`abandon_run`).  With no live human at the start
ovl61:0000 shows the two-line message STRING (14, 0) / (14, 1) (ovl61:00f1..0110 -> ovl61:1160,
which waits for its dismissal with DS:166a set) before the loop ovl61:2123 (0118): the loop runs
when the message is closed.

Map, overview and info bar with Hidden Map and more than one live human (ovl68:0259 di = 0):
* End Turn (ovl61:2074): the info bar gets the plain marble cell ovl61:0aeb (20cb; picture 25,
  source (0, 0x3c), over DS:2a9c = (16, 403, 360, 66)) and the map and the overview are filled
  black (ovl61:0a6e at 2110: DS:2ab0, DS:2aa8 with colour 0) -- `blank_map` "black";
* Begin (ovl61:0000(0, 1), si = 1): no map draw (ovl64:006c only for si = 0, 005a), the overview
  only without Hidden Map (00a7..00b8), no 0a6e: the game frame's backdrop shows there --
  `blank_map` "backdrop"; the info bar is the marble cell (0076, no ovl66:0356 for si != 0);
* the human turn start: the marble cell again (ovl68:034c); with di = 0 the overview, the map and
  the info bar are not drawn before the pop-up (0337 / 037a skip ovl63:0000, ovl64:0629,
  ovl66:0356); after the pop-up and the wait for the turn sample (155e:0736) the overview and the
  map are drawn (0449..0484), the info bar only when ovl66:0356 next runs: ovl68:05a8 at the end of
  the turn start (TurnCue "info_bar", rules/turn.py; not on turn 1, whose hero offer / production
  screen return first), the hero offer's accept (ovl47:129d -> ovl61:011f(1, 0, 1), not decline,
  12bc: 011f(0, 0, 0)), or a command that redraws the palette (selection steps 0b62 / ovl66 /
  ovl67, Deselect 0b62:08fa, Move 0c8c:04fb, Attack ovl36) -- `bar_blank`.
With di = 1 the turn start draws all three before the pop-up (0344, 039c, 03a4).

No main-loop pass between two commands: the EXE's event loop 08a9:000e dispatches each event
(0726:0009 / 07be:0064 / 07be:0e26 / 07be:04d8) and returns to its poll, and none of that path
calls ovl35:09f2, ovl62:0000 or 0555:0d9e; ovl61:2123 returns right after ovl68:0259 for a human
side (2221..2236).  The site tiles, the map words and the cost map are refreshed only inside the
commands that do it themselves (the battle ovl36:02ee / 0cf1 / 168a, the take-over's cost map
ovl36:0f69, Disband 0b62:0895, the sinking 0b62:122b, the production restart ovl43:0760, the
ruin search ovl34:039b, the sage ovl34:11f1 and the quest reward ovl01:1d07 (site tiles), Resign
ovl49:17e7) and at the top of each pass of the loop (`rules.turn.pass_top`: Begin, End Turn,
the Settings close of the computer turn).  So a square a stack left keeps its owner nibble, and
the four squares of a city razed this turn keep their city cost bytes, until the next side's
pass.  The overview squares of the sites are redrawn where 09f2 runs (ovl35:0b0b ->
ovl63:2785): at the turn start (`hand_over`) and after a command that rewrote a site's tile
byte (the sage, a quest reward; `apply`).  `rules.pathfinding.find_path` writes the path cache
and patches the cost map, so a path preview must run on `state.copy()`.

The view centre lives in SCN 0x17d / 0x17f with the view rectangle 0x175..0x17b: every scroll
writes them (ovl64:0629 for the clamped centrings, ovl65:0227 for an overview click: centre as
given, top / left = centre - 4 clamped to 0..0x93 / 0..0x67, bottom / right = top / left + 8),
and the view follows them after every turn-loop run (ovl68:039c / 047c, `rules.turn.centre_view`).

Input: the menu bar takes presses and keys only while the human phase waits for a command
(no walk playing) and no drag is held: 07be:0064 returns before the menu keys 1372:0047 while
DS:1174 / 1176 / 1172 / 3700 are set (007d..00a2) and skips them while DS:166a is set (00a9);
a press on the menu bar is the area case 0726:02df (1372:00f0(1)) of the area dispatcher
0726:0009, which with DS:1174 set does nothing (008c) and with DS:1172 / 1176 runs the drag
instead (0095..00ed), so no menu opens during a drag.  DS:166a (a modal pop-up) and DS:3700 (a
menu open) are the dialog stack here.

Pointer: every poll of the main loop and of the pop-up waits (08a9:005d; 11b5:0039, the wait
ovl59:0142 of ovl61:10fb / 1160 and ovl68:042a) calls 151d:008a -> 08a9:0885, which sets the
shape 08a9:0896 returns: 0 (the arrow) while a menu is open (DS:3700, 08ab) or a modal pop-up is
up (DS:166a, 08cc: Settings ovl33:0000, the "Turn %d" pop-up, the messages, the tutorial pages,
the hero offer ovl47:0d70, ...); so with a dialog on the stack the pointer is the arrow
(`dialog_pointer`).  The talking advisor's face ovl58:026f sets no DS:166a and polls no pointer:
the shape stays as it was.

Shield strip (ovl68:0952, `ui.shield_strip`): drawn only at its callers (Begin's ovl61:0034 in
`start_turns`, the run's "strip" points through `strip_call`) into a picture the game keeps and
puts over the menu bar after every bar draw; nothing before Begin.  A failed run puts it back
with the state.  After the victory (SCN 0x15b and 0x157) the over phase follows the turn start:
the human phase without End Turn (ovl61:2074 returns at once).

Scrolls: every write of the view words is the command `SetView` (`GameView.centre`), without a
main-loop pass, so a command replay gives the same state.
"""
from __future__ import annotations

import logging

import pygame

from ..assets import cursors as CU
from ..assets.sprites import MapColors, Sprites
from ..model import commands as C
from ..model.ids import Control
from ..model.state import SCN_TERRAIN_SET
from ..ui import registry
from ..ui import tutorial  # noqa: F401  (registers the tutorial pop-ups)
from ..ui.dialog import DialogStack
from ..ui.mapview import AREA, MapView
from ..ui.menubar import MenuDialog, saved_games, saved_maps, title_bar, with_codes
from ..ui.minimap import RECT as OVERVIEW_RECT
from ..ui.minimap import Minimap
from ..ui.widgets import draw_pointer, kit
from .base import BaseState
from .phases import phase_class
from .phases.computer import live_humans

log = logging.getLogger(__name__)

BACKDROP = "screen.pck"
SCN_VIEW_CX, SCN_VIEW_CY, SCN_SAVE_MAP = 0x17D, 0x17F, 0x120
NO_HUMANS_MSG = ((14, 0), (14, 1))               # ovl61:00f1..0110 -> ovl61:1160
BLACK, BACKDROP_SHOWS = "black", "backdrop"      # ovl61:0a6e at End Turn / nothing drawn at Begin
HELD = "held"                                    # the computer phase's last picture (ovl68:0259 di = 0)
# Commands whose EXE path draws the palette ovl66:0356 where the engine has no
# `rules.selection.redraw_palette` (its calls are counted, `GameState.palette_draws`): the attack
# ovl36:0000 (01b9, 04a1 ovl61:011f(1, 1, 1), 04cb), the treachery confirmed (ovl36:20a8 goes on
# into the battle), the capture choices ovl31:03b0 / 040e / 04c5 (ovl61:011f(0, 0, 1); not the raze
# ovl31:0318, 011f(1, 1, 0)), Take ovl34:186e (011f(1, 0, 1)), the burning ovl49:17f9 (011f(1, 1, 1)).
# Not the raze of an own city: ovl32:00ab / 00d6 run ovl61:0000(0, 0) only with DS:4124 set, whose
# one writer is ovl32:0006 (= 0, when the confirmation opens), so both go back to the city screen
# ovl45:0000 (00c9 / 00f4), whose close ovl45:02e1 draws the palette (`PALETTE_ON_CLOSE`).
def _draws_palette(cmd) -> bool:
    if isinstance(cmd, (C.Attack, C.TakeAll, C.Resign)):
        return True
    if isinstance(cmd, C.ConfirmTreachery):
        return bool(cmd.yes)
    return isinstance(cmd, C.CaptureChoice) and cmd.choice != "raze"


# Dialogs whose close runs ovl66:0356 (ovl61:011f(x, y, 1) or ovl61:0000(x, 0)) without a command
# of their own (`GameDialogs`): the city / site screen ovl45:02e1 (011f(1, 1, 1)), the quest page
# ovl01:0d65, the temple ovl01:0132 (329: its quest page closes the same way), the sage ovl34:0bcf,
# the advisor ovl36:2050, the fight order ovl38:10fa / 111c, the stack ovl66:14d3 / 14fd, the sign
# ovl13:0486 (ovl61:0000(0, 0)), the search result ovl34:1964 / 186e and the quest result
# ovl01:18a1 (011f(1, 0, 1) / (1, 1, 1)).  Not: the reports, the history, the items, the hero
# levels, the diplomacy dialogs, the shortcuts, Settings (011f(0, 0, 0)), the hero panel ovl40:0b30
# (011f(1, 0, 0)), Resign (its own `palette_drawn` calls).
PALETTE_ON_CLOSE = frozenset({"production", "ruins", "quest", "temple", "sage", "advisor", "fight_order",
                              "stack", "signpost", "search_result", "quest_reward"})


class GameDialogs(DialogStack):
    """The game's dialog stack: a dialog of `PALETTE_ON_CLOSE` leaving it redraws the palette."""

    def __init__(self, game):
        super().__init__()
        self.game = game

    def remove(self, d) -> None:
        super().remove(d)
        if getattr(d, "dialog_id", None) in PALETTE_ON_CLOSE:
            self.game.palette_drawn()


def dialog_pointer(dialogs) -> int | None:
    """The shape 08a9:0896 gives while dialogs are up: the arrow for an open menu (DS:3700) or a
    modal pop-up (DS:166a); None (unchanged) for the advisor's face alone or no dialog."""
    from ..ui.dialogs.voice_face import VoiceFace
    items = list(dialogs)
    if any(isinstance(d, MenuDialog) for d in items):
        return CU.ARROW
    if any(not isinstance(d, VoiceFace) for d in items):
        return CU.ARROW
    return None


class GameView(MapView):
    """The playing map whose centre is SCN 0x17d / 0x17f of the game's state."""

    def __init__(self, sprites, game):
        super().__init__(sprites)
        self.game = game

    def centre(self, x: int, y: int) -> None:
        """A scroll: the view words through the command SetView (ovl65:0227 / ovl64:0629)."""
        super().centre(x, y)
        if self.game.state is not None:
            self.game.command(C.SetView(x, y))

    def follow(self, state) -> None:
        """The centre as the engine left it."""
        MapView.centre(self, state.flags[SCN_VIEW_CX], state.flags[SCN_VIEW_CY])


def advice_groups() -> set[int]:
    """FILE.DAT groups the talking advisor's turn remark may roll in (rules/constants/turn.py),
    sample groups and their caption groups."""
    from ..rules.constants import turn as K
    g = set(K.ADVICE_LOSE.value.values()) | set(K.ADVICE_WIN.value.values())
    g |= {K.ADVICE_LOSE_ELSE.value, K.ADVICE_WIN_ELSE.value, K.ADVICE_REMARK.value}
    g |= {v for _, v in K.ADVICE_GOLD.value} | {v for _, v in K.ADVICE_HEROES.value}
    return g | {v + K.ADVICE_CAPTION.value for v in g}


class Game(BaseState):
    def __init__(self, app):
        super().__init__(app)
        self.config = self.load_slot = self.overview = None
        self.state = None
        self.phase_name: str | None = None
        self.phase = None
        self._next: str | None = None
        self.map_ready = False
        self.sprites = self.view = self.minimap = self.bar = None
        self.no_setup = False
        self.turn_events = None
        self.blank_map = None
        self.bar_blank = False
        self.loop_blank = BLACK
        self.run_palette = None
        self.held_screen = None
        self.run_start = self.run_prev = self.run_phase = None
        self.shield_strip = None
        self.strip_saved = None
        self.load_where = self.load_backdrop = self.load_prev = None
        self.load_started = self.pointer_hidden = False

    def on_enter(self, frm: str, new_game=None, load_slot=None, overview=None) -> None:
        self.config, self.load_slot, self.overview = new_game, load_slot, overview
        self.dialogs = GameDialogs(self)
        self.load_where = self.load_backdrop = self.load_prev = None
        self.load_started = self.pointer_hidden = False
        if load_slot is not None:                 # Load Game (ovl49:02d3 -> 0414): `start_load`
            self.load_where = LOAD_WHERE.get(frm, "game")
            if self.load_where == "game" and self.state is not None:
                # DS:2a86 stays 1: the game screen stays up under the scroll until 02d3 redraws
                self.load_prev = (self.phase_name, self.phase)
                self._next = None
                return
            if frm != "game":                     # (502 is live in a game only in human / over)
                self.load_backdrop = frm          # the Game Start / Setup screen stays up under it
        self.state, self.phase_name, self.phase = None, None, None
        self.map_ready = False
        self.battle_names = [None, None]          # DS:4148 / 4134 (ui.dialogs.fight)
        self._next = "building" if load_slot is None else None
        self.no_setup = frm != "setup" and load_slot is None
        self.bar = None
        self.turn_events = None
        self.blank_map = None
        self.bar_blank = False
        self.run_palette = None
        self.held_screen = None
        self.run_start = self.run_prev = self.run_phase = None
        self.shield_strip = None                  # nothing before Begin (ovl61:0034)
        self.strip_saved = None

    def on_exit(self, to: str) -> None:
        """The game stays the run's memory (`persist.saves.RunCarry.game`, entered at Begin and
        at every load): a later Begin, load or New Game takes its run words (EL §10.4, §10.7)."""
        self.abandon_run()
        if self.state is not None:                # (already so: entered at Begin / the load)
            from ..ui.dialogs.save_load import run_carry
            run_carry(self.app).game = self.state

    def abandon_run(self) -> None:
        """A run parked at a present point is left (the game or the app closes)."""
        ab = getattr(self.phase, "abandon", None)
        if ab is not None:
            ab()

    # ------------------------------------------------------------------ main thread

    def _ready(self) -> None:
        if self.bar is None:
            self.bar = title_bar(self.app)
            if self.no_setup:                     # what ovl57:0416 and 1372:132f(0) left
                self.bar.pre_game(saved_games(self.app), saved_maps(self.app), False)
                self.bar.repaint()
        if self.sprites is None:
            self.sprites = Sprites(self.app.assets)
            self.view = GameView(self.sprites, self)

    def start_engine(self, sc=None) -> None:
        """Start the engine game (rules.setup.new_game) from the loaded scenario `sc`
        (loaded here when None) with the overview bitmap of the load.  A Begin in a run that had
        a game keeps that game's run memory (`rules.saveload.run_part` of `RunCarry.game`, the
        last game: abandoned by New Game, or loaded; EL §10.7): the path cache, the battle
        arrays, the selection words, the caches DS:5dca / 5dda / 5dea (no new-game path calls
        ovl62:03f9, so Begin's menu refresh ovl61:0174 -> 0519 reads the old counts), the report
        block, the list name buffer and the army records.  The new game is then the run's memory
        with the scenario record DS:5d64 (`RunCarry.enter`), and its dice are the run's one
        stream (`states.menu.session_dice`, X06)."""
        from ..audio import audio
        from ..formats.scenario import load_scenario
        from ..formats.tables import parse_armytypes
        from ..rules.saveload import run_part
        from ..rules.setup import new_game, unused_side_name
        from ..ui.dialogs.save_load import run_carry
        cfg = self.config
        if cfg is None:
            raise RuntimeError("game entered without new_game= or load_slot=")
        from .setup import terrain_set
        a = self.app.assets
        sc = sc or load_scenario(self.app.gd, cfg.scenario)
        types = parse_armytypes(a.read(f"TERRAIN{terrain_set(sc)}/ARMYTYP{'2' if cfg.army_set else 'E'}.DAT"))
        from ..rules.heroes import load_hero_names
        from ..ai.cards import card_reader
        carry = run_carry(self.app)
        run = run_part(carry.game) if carry.game is not None else None
        st = self.state = new_game(sc, cfg, list(types), unused_name=unused_side_name(a.read("WARLORD2.EXE")),
                                   hero_names=load_hero_names(self.app.gd, terrain_set(sc)),
                                   cards=card_reader(self.app.gd), process=self.app.ai_process, run=run)
        carry.enter(st, scenario_record(self.app, cfg.scenario, carry.record))
        self.app.session_dice = st.rng            # the run's one stream goes on in the game
        snd = audio(self.app)                     # DS:26c8 / 37a4 and the FILE.DAT group sizes
        st.advisor_talking = int(snd.settings.speech)
        st.advisor_digital = int(snd.mixer.available)
        st.advisor_groups = {g: snd.members(g) for g in sorted(advice_groups())}
        if self.no_setup:
            self.bar.pre_game(saved_games(self.app), saved_maps(self.app), st.flags[SCN_SAVE_MAP] != 0)
        self.minimap = Minimap(self.sprites, MapColors.load(a, st.flags[SCN_TERRAIN_SET]), self.overview)
        self.view.follow(st)

    # ------------------------------------------------------------------ Load Game (M10b)

    def start_load(self) -> None:
        """ovl49:02d3(e) after the Load list: 0414(e, 1, 0) in its scroll
        (`save_load.open_load`), then the rest of 02d3 (`load_done`).  Entered from the game
        (`load_where` "game", DS:2a86: the game screen stays up), the Game Start screen
        ("game_start", DS:28c6) or the Game Setup screen ("setup"); the screen it came from
        stays up under the scroll until ovl61:0000 draws the game screen."""
        from ..ui.dialogs import save_load
        save_load.open_load(self, self.load_slot, self.load_where, self.load_done, refused=self.load_refused)

    def hide_pointer(self) -> None:
        """ovl49:0606 12bf:07a5: the pointer hidden for the rest of the load's scroll (shown again
        at 092f, 12bf:0757: `load_done` / `load_refused`)."""
        self.pointer_hidden = True

    def load_refused(self) -> None:
        """A load the host cannot run (logged by `save_load.load_work`: a file that is not a
        save of this program, a missing army type file, or a failed open with no game in
        memory, register X47): nothing was changed, and the Cancel path of 02d3 runs as the
        stand-in: DS:28c6 ? ovl60:0000(0) : DS:2a86 ? ovl61:0000(0, 0) : ovl57:0000(0, 0, 0, 1)."""
        where, self.load_where, self.load_slot = self.load_where, None, None
        self.pointer_hidden = False                # 092f 12bf:0757
        if where == "game_start":
            return self.request("menu", draw=False)
        if where == "setup":
            return self.request("setup", back=True)
        self.phase_name, self.phase = self.load_prev
        self.load_prev = None
        self.redraw_game_screen()

    def load_done(self, result) -> None:
        """The rest of ovl49:02d3 after 0414 (`persist.saves.Saves.finish_load` =
        `rules.saveload.after_load`), its present points drawn in its order: "game_screen"
        (ovl61:0000(DS:28c6, 0): the game frame, map, overview, info cell, palette and menu
        refresh, bar repaint, the info area ovl66:0356; DS:2a86 = 1), DS:28c6 = 0, the strips
        ovl68:0952(1, 0) and (0, 0), the message ovl61:10fb (`save_load.load_message`, waits);
        "map" / "frame_off" (drawn by the phase from the state) and "music" mode 1 (M10c, X32)
        follow the message.  The game goes on mid-turn in the human phase of SCN 0x110 (or the
        over phase after an acknowledged victory, SCN 0x15b / 0x157): no turn start.  The
        overview bitmap is the one ovl63:232b built, else the one already there (DS:581d)."""
        import threading
        from ..rules import present as PR
        from ..ui.dialogs import save_load
        loaded = result.loaded
        st = loaded.state
        self.pointer_hidden = False                # ovl49:092f 12bf:0757 (after the scroll's close)
        points = []
        me = threading.current_thread()
        PR.attach(me, lambda point, info: points.append((point, info)))
        try:
            save_load.saves(self.app).finish_load(loaded, self.load_where)
        finally:
            PR.detach(me)
        self.app.session_dice = st.rng            # the run's one stream (X06 / X49)
        for point, info in points:
            if point == "game_screen":
                self._show_loaded(st, result.overview)
            elif point == "strip":
                self.strip_call(info["at"])
            elif point == "message":
                save_load.load_message(self, st)
                break                              # "map", "frame_off", "music": nothing to draw here

    def _show_loaded(self, st, overview) -> None:
        """ovl61:0000(DS:28c6, 0) on the loaded game: DS:2a86 = 1, DS:28c6 = 0."""
        from ..rules import turn as T
        a = self.app.assets
        self.state = st
        self.config = None
        if overview is not None or self.minimap is None:
            self.minimap = Minimap(self.sprites, MapColors.load(a, st.flags[SCN_TERRAIN_SET]), overview)
        else:                                      # DS:581d as it was (no ovl63:232b)
            self.minimap = Minimap(self.sprites, MapColors.load(a, st.flags[SCN_TERRAIN_SET]),
                                   self.minimap.pixels)
        self.view.follow(st)
        self.load_where = self.load_backdrop = self.load_prev = self.load_slot = None
        self.blank_map, self.bar_blank, self.turn_events = None, False, None
        self.run_palette = self.held_screen = None
        self.phase_name = "over" if T.loop_over(st) else "human"
        self.phase = phase_class(self.phase_name)(self)
        self._next = None
        self.phase.enter()                         # ovl61:0174 -> 0519 and 1372:132f
        self.map_ready = True
        self.palette_drawn()                       # ovl61:008f ovl66:0356

    def redraw_game_screen(self) -> None:
        """ovl61:0000(0, 0) (the Cancel paths of ovl49:0995 / 02d3, ovl34:1434, after a save):
        map, overview, the palette and menu refresh ovl61:0174 -> 0519, the bar repaint and the
        info area ovl66:0356."""
        self._refresh_palette()
        if self.bar is not None:
            self.bar.repaint()
        self.palette_drawn()

    def new_game_confirmed(self) -> None:
        """ovl49:0203 (New Game confirmed): the state part on this game (`rules.saveload.new_game`:
        every army record freed, map words, explored layer), DS:2a86 = DS:166a = 0, then the
        Game Start screen ovl60:0000(1) with its talking face, and after it ovl25:0519 (the AI
        set-up of all eight sides on this game's SCN, `ai.cards.setup_all`, its dice after the
        face's).  The game stays the run's memory (`RunCarry.game`)."""
        from ..ai.cards import card_reader, setup_all
        from ..rules import saveload as SL
        st = self.state
        SL.new_game(st)
        cards = card_reader(self.app.gd)
        self.request("menu", after_face=lambda: setup_all(st, cards))

    def scenario_dir(self) -> str:
        """DS:5da0 (record +0x3c of DS:5d64): the scenario directory of the game (the .CTY
        descriptions)."""
        from ..ui.dialogs.save_load import run_carry
        rec = run_carry(self.app).record
        if rec is not None:
            return rec["str_3c"]
        return getattr(self.config, "scenario", "") if self.config is not None else ""

    def apply(self, cmd):
        """Run one command of the human phase through the engine (no main-loop pass follows:
        module text); the overview squares of the sites again when the command ran ovl35:09f2
        (a site's tile byte changed: the sage ovl34:11f1, a quest reward ovl01:1d07; 09f2 is the
        only writer of those bytes, and it redraws the squares through ovl35:0b0b ->
        ovl63:2785); the info area when the command drew the palette ovl66:0356
        (`palette_drawn`).  Raises the engine's IllegalCommand."""
        from ..rules.engine import apply
        st = self.state
        sites, draws = site_bytes(st), st.palette_draws
        events = apply(st, cmd)
        self._after(cmd, sites, draws)
        return events

    def _after(self, cmd, sites, draws) -> None:
        st = self.state
        if site_bytes(st) != sites and self.minimap is not None:
            self.minimap.redraw_sites(st)
        if st.palette_draws != draws or _draws_palette(cmd):
            self.palette_drawn()

    def command(self, cmd) -> list | None:
        """A command outside the human phase's command path (the Settings toggles, ovl33:04cc /
        0508 / 053f / 0576 return to the dialog; the scrolls; the dialogs' own commands); None
        when the engine refused it."""
        from ..rules.engine import IllegalCommand, apply
        st = self.state
        sites, draws = site_bytes(st), st.palette_draws
        try:
            events = apply(st, cmd)
        except IllegalCommand as e:
            log.error("%s refused: %s", type(cmd).__name__, e)
            return None
        self._after(cmd, sites, draws)                     # as `apply`
        return events

    def palette_drawn(self) -> None:
        """ovl66:0356 ran: the info area shows the numbers as they are now (`ui.palettes.Painter`),
        and the marble strip of the turn start is gone (`bar_blank`).  Its 055c -> 070d writes the
        movement-kind cell's item lists into DS:483c (`rules.selection.palette_list`; the paint
        itself reads without writing): at a dialog close of `PALETTE_ON_CLOSE` (the Stack
        dialog's ovl66:14d3 / 14fd -> ovl61:0000(0, 0) included), after a save, a load, ...
        (where the engine's `redraw_palette` already wrote, the same list again)."""
        self.bar_blank = False
        if self.state is not None:
            from ..rules.selection import palette_list
            palette_list(self.state)
        if self.state is not None and self.sprites is not None:
            from ..ui.palettes import painter_for
            painter_for(self).palette_drawn(self.state)

    # ------------------------------------------------------------------ the turn loop

    def _loop(self, run, blank: str = BLACK, begin: bool = False) -> bool:
        """Start the main loop `run` on its own thread (`states.runner.Runner`) and play it up
        to its first hold (`ComputerTurn.pump`); False when the engine refused it (strict mode),
        with the state as before.  The computer phase the run goes through is made current at
        its first drawing point (`enter_computer_phase`); a run that never draws goes to the
        turn-start phase (`hand_over`)."""
        from ..rules.engine import IllegalCommand
        from .phases.computer import BACKDROP, ComputerTurn
        from .runner import Runner
        st = self.state
        snap = run_snapshot(st)
        self.loop_blank = blank
        if self.phase_name != "computer":               # the first run of End Turn / Begin
            self.run_start = snap
            ss = self.shield_strip
            self.strip_saved = (ss.copy(), ss.drawn) if ss is not None else None
            self.run_prev = (self.phase_name, self.phase) if self.phase_name == "human" else None
        ph = self.phase if self.phase_name == "computer" else ComputerTurn(self)
        self.run_phase = ph
        ph.start_run(Runner(run), BACKDROP if begin else None)
        try:
            ph.pump()
        except Exception as e:                          # noqa: BLE001 (logged, the state restored)
            self.run_failed(e)
            return False
        except BaseException:
            ph.abandon()
            run_restore(st, snap)
            raise
        return True

    def run_failed(self, e: Exception) -> None:
        """An error of the turn loop, at its start (strict mode refusing a missing step) or at
        any later point of its runs: logged, the parked engine thread ended, the state as it
        was before End Turn / Begin, and the game where it was (the human phase it came from,
        else the human phase without a turn start)."""
        from ..rules.engine import IllegalCommand
        ph = getattr(self, "run_phase", None)
        if ph is not None:
            ph.abandon()
            ph.current = False
        if isinstance(e, IllegalCommand):
            log.error("turn loop refused: %s", e)
        else:
            log.error("turn loop failed: %r", e, exc_info=e)
        for d in list(self.dialogs):                   # Settings / a pop-up of the run
            if getattr(d, "stack", None) is not None and ph is not None and d in (ph.settings, ph.popup):
                d.close(None)
        if self.run_start is not None:
            run_restore(self.state, self.run_start)
            if self.strip_saved is not None:
                self.shield_strip.restore(*self.strip_saved)
        self.view.follow(self.state)
        if self.run_prev is not None:
            self.phase_name, self.phase = self.run_prev
            self._next = None
        else:
            self._next = "human"
        self.run_start = self.run_prev = self.run_phase = None

    def enter_computer_phase(self, ph) -> None:
        """The run's first drawing point: its computer phase becomes current at once (no frame
        between End Turn's draws and ovl68:0000's)."""
        self.phase_name, self.phase, self._next = "computer", ph, None
        ph.current = True
        self.blank_map = None

    def next_run(self) -> None:
        """ovl61:2123 goes on after a computer side (`rules.turn.run` with max_sides=1); the
        computer phase plays it."""
        from ..rules import turn
        from .runner import Runner
        self.phase.start_run(Runner(lambda: turn.run(self.state, max_sides=1)), None)

    def hand_over(self, events, blank: str | None = None, run=None) -> None:
        """The human part of a run (from its turn start on) to the turn-start phase, with the
        buttons as the run left them (`run`: its computer phase, current or not: End Turn's
        ovl61:0418, Begin's 0174).  With
        Hidden Map and more than one live human the turn start draws nothing before its pop-up
        (ovl68:0259 di = 0): the screen keeps what the run left (End Turn's black, Begin's
        backdrop, or what the computer turns drew last)."""
        if blank is None:
            blank = getattr(self, "loop_blank", BLACK)
        st = self.state
        self.minimap.redraw_sites(st)                       # ovl35:09f2's overview squares
        self.view.follow(st)
        p = st.players[st.current]                          # ovl68:0259 di = 0
        held = bool(st.options.hidden_map) and live_humans(st) > 1 and p.control == Control.HUMAN
        ph = self.phase if self.phase_name == "computer" else None
        run = ph if ph is not None else run                 # the run's buttons (0418 / Begin's 0174)
        self.run_palette = run.palette if run is not None else None
        self.held_screen = ph if held and ph is not None else None
        self.blank_map = (HELD if ph is not None else blank) if held else None
        if not held:
            self.palette_drawn()                            # ovl68:03a4 (ovl66:0356, di = 1)
        self.bar_blank = held
        self.turn_events = list(events)
        self._next = "turn_start"
        self.run_start = self.run_prev = self.run_phase = None

    def start_turns(self) -> None:
        """ovl61:0000(0, 1) after the new game: the full shield strip ovl68:0952(1, 1) (0034,
        after 1732 / 17f6, before the message); no live human -> the two-line message, and the
        main loop ovl61:2123 once it is closed; else the loop now."""
        self.strip_call("ovl61:0034")
        if live_humans(self.state) == 0:
            k = registry_kit(self.app)
            registry.open_dialog("message", self, lines=[k.text.S(*m) for m in NO_HUMANS_MSG],
                                 on_close=lambda _: self.run_loop(begin=True))
            return
        self.run_loop(begin=True)

    def run_loop(self, begin: bool = False) -> None:
        """The main loop from the side on turn, one computer side at a time (`rules.turn.run`
        with max_sides=1; the computer phase runs the next one while `loop_waits`); refused ->
        the human phase without a turn start.  `begin`: the run from Begin, ovl61:0000(0, 1),
        which drew no map (the backdrop) and the overview only without Hidden Map."""
        from ..rules import turn
        if not self._loop(lambda: turn.run(self.state, max_sides=1), BACKDROP_SHOWS if begin else BLACK,
                          begin=begin):
            self._next = "human"

    def strip_call(self, at: str) -> None:
        """ovl68:0952 from the caller at `at` (`ui.shield_strip.CALLS`), drawn from the state as
        it is now into the strip the game keeps over the menu bar."""
        if self.shield_strip is None:
            from ..ui.shield_strip import ShieldStrip
            self.shield_strip = ShieldStrip(kit(self.app))
        self.shield_strip.call(self.state, at)

    def loop_goes_on(self) -> bool:
        """The loop can run another pass (nothing pending, not over)."""
        from ..rules import turn
        return self.state.pending is None and not turn.loop_over(self.state)

    def loop_waits(self) -> bool:
        """The run stopped before a computer side's turn (max_sides) with nothing pending."""
        from ..rules import turn
        st = self.state
        return st.pending is None and st.players[st.current].control != Control.HUMAN and not turn.loop_over(st)

    def end_turn(self) -> None:
        """Menu 535 / its key (07be:02af -> ovl61:2074): the EndTurn command (one computer side
        per run, `rules.turn.run` max_sides=1; the computer phase runs the next ones), while
        the human phase waits for a command.  Not in the over phase: ovl61:2074 returns at once
        while SCN 0x15b is set (207c..2084; the menu item is off too, `ui.game_menus`)."""
        from ..rules.engine import apply
        if self.phase_name != "human" or self.phase.busy():
            return
        self._loop(lambda: apply(self.state, C.EndTurn(max_sides=1)))

    def answer(self, cmd, refresh: bool = True) -> list | None:
        """The answer to a pending question of the turn start (the hero offer's AcceptHero /
        NameHero, which go on with rules.turn.resume(state, 1)); its events are played by the
        turn-start phase.  For M7b's dialog "hero_offer" (`open_dialog("hero_offer", game,
        offer=event)`), which calls this with its command.  No main-loop pass follows: the
        buttons ovl47:127e / 12af run ovl61:011f and ovl68:04bd(1) only.  Accept (127e:
        011f(1, 0, 1)) redraws the info bar (ovl66:0356 at ovl61:0168), decline (12af:
        011f(0, 0, 0)) does not.  The victory screen's button 483 (CloseVictory, ovl61:2004)
        runs 011f(1, 1, 1): the info bar too.  `refresh` False: no ovl61:011f with the answer
        (the surrender buttons 485 / 486, ovl61:1e4e / 1ecd; the decline screen's 484 runs
        011f(0, 0, 0) later, `screen_closed`)."""
        from ..rules.engine import IllegalCommand, apply
        before = self.state.copy()
        try:
            events = apply(self.state, cmd)
        except IllegalCommand as e:
            log.error("%s refused: %s", type(cmd).__name__, e)
            return None
        if isinstance(cmd, (C.NameHero, C.CloseVictory)) or (isinstance(cmd, C.AcceptHero) and cmd.yes):
            self.palette_drawn()
        if refresh:
            self._refresh_palette()                         # ovl61:011f -> 0174
        self.view.follow(self.state)
        play = getattr(self.phase, "play", None)
        if play is not None:
            play(events, before)
        return events

    def turn_popup_closed(self) -> None:
        """ovl68:0449..0484 (after 155e:0736): with the map held back it is drawn now."""
        self.blank_map = None

    def screen_closed(self) -> None:
        """ovl61:011f(0, 0, 0) after a turn-start screen (the decline screen's 484, ovl61:2046):
        DS:166a = 0 and the palette refresh ovl61:0174."""
        self._refresh_palette()

    def info_bar_drawn(self) -> None:
        """ovl66:0356 ran (TurnCue "info_bar", ovl68:05a8), then the buttons ovl61:0174 (05ad)."""
        self.palette_drawn()
        self._refresh_palette()

    def _refresh_palette(self) -> None:
        pal = getattr(self.phase, "palette", None)
        if pal is not None and self.state is not None:
            pal.refresh(self.state, False)

    def settings_closed(self) -> None:
        """ovl33:0034 -> ovl61:011f(0, 0): the palette refresh ovl61:0174 (from the menu); the
        computer-turn interrupt goes on with the loop instead (the computer phase)."""
        refresh = getattr(self.phase, "refresh", None)
        if refresh is not None:
            refresh()

    def scroll_to(self, x: int, y: int) -> None:
        self.view.centre(x, y)

    # ------------------------------------------------------------------ frame

    def step(self, events, dt):
        self._ready()
        if self.load_slot is not None and not self.load_started:
            self.load_started = True
            return self.start_load()
        if self._next is not None:
            self.phase_name, self._next = self._next, None
            cls = phase_class(self.phase_name)
            self.phase = cls(self) if cls else None
            if self.phase:
                self.phase.enter()
            return
        rest = []
        phase = self.phase
        menus = self.phase_name in ("human", "over") and not self.phase.busy() and not self.phase.held_mode()
        for e, code in with_codes(events, self.app.input):
            if self.dialogs:
                return
            if menus and e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.bar.bar.press(self, e.pos):
                continue
            if menus and code is not None and self.bar.bar.key(self, code):
                continue
            rest.append(e)
        if self.phase is not phase:                        # End Turn made the computer phase current
            return
        if self.phase is not None and not self.dialogs:
            nxt = phase.step(rest, dt)
            if nxt and self.phase is phase:                # not after a switch to the computer phase
                self._next = nxt

    def update(self, events, dt):
        """While the engine runs on under the Settings dialog ovl25:045e opened (the loop has
        not reached ovl61:220b), the computer phase steps and the dialog takes no input: keys go
        to the BIOS buffer, where the kill loop can take them, and what is left there when the
        loop stops is the dialog's (07be:0064 reads the buffer)."""
        if self.dialogs and getattr(self.phase, "under_dialogs", False):
            self._ready()
            self.phase.step([e for e in events if e.type == pygame.KEYDOWN], dt)   # the BIOS buffer
            return
        held = getattr(self.phase, "handoff", None)
        if held:                                           # keys typed while the engine ran
            events = held + list(events)
            self.phase.handoff = []
        super().update(events, dt)

    def scene(self):
        fn = getattr(self.phase, "scene", None)
        return fn() if fn is not None else self.state

    def overview_scene(self):
        fn = getattr(self.phase, "overview_scene", None)
        return fn() if fn is not None else self.scene()

    def overview_box(self, st) -> tuple[int, int]:
        """The view box's (left, top): the map's origin, or for a later overview state the
        origin of its view centre (SCN 0x17d / 0x17f, read back as `GameView.follow` does)."""
        if st is self.scene():
            return self.view.origin
        from ..ui.mapview import view_origin
        return view_origin(st.flags[SCN_VIEW_CX], st.flags[SCN_VIEW_CY])

    def paint(self, fb):
        self._ready()
        if self.load_backdrop is not None:         # the scroll of a load over the screen it came from
            self.app.manager.states[self.load_backdrop].paint(fb)
            shape = dialog_pointer(self.dialogs)
            if shape is not None:
                kit(self.app).cursors.current = shape
            return
        fb.blit(self.app.assets.picture(BACKDROP), (0, 0))
        if self.map_ready:
            if self.blank_map == BLACK:
                fb.fill(0, AREA)
                fb.fill(0, OVERVIEW_RECT)
            elif self.blank_map == BACKDROP_SHOWS:
                pass
            elif self.blank_map == HELD:
                self.held_screen.paint_map(fb)
                self.held_screen.paint_overview(fb)
            else:
                paint_map = getattr(self.phase, "paint_map", None)       # the human phase (M4c)
                if paint_map is not None:
                    paint_map(fb)
                else:
                    self.view.draw(fb, self.scene())
                paint_ov = getattr(self.phase, "paint_overview", None)       # the computer phase
                if paint_ov is not None:
                    paint_ov(fb)
                else:
                    ov = self.overview_scene()
                    self.minimap.draw(fb, ov, *self.overview_box(ov))
        if self.phase is not None:
            self.phase.paint(fb)
            if self.bar_blank and self.map_ready and self.phase_name != "computer":   # ovl61:0aeb, no ovl66:0356 since
                painter = getattr(self.phase, "painter", None)
                if painter is not None:
                    painter.strip(fb)
        shape = dialog_pointer(self.dialogs)
        if shape is not None:
            kit(self.app).cursors.current = shape
        self.bar.draw(fb)
        if self.shield_strip is not None:             # ovl68:0952's pixels over the bar row
            self.shield_strip.paint(fb)

    def draw(self, s):
        super().draw(s)
        if not getattr(self.phase, "hides_pointer", False) and not self.pointer_hidden:   # a computer side's turn: ovl61:21e8 / 21fd; a load (ovl49:0606..092f)
            draw_pointer(self.app, s, self.dialogs)


def site_bytes(state) -> list:
    """The tile bytes of the site squares (ovl35:09f2 writes them, `rules.ruins.site_tiles`)."""
    from ..model.ids import MAP_W
    t = state.world.tiles
    return [t[s.y * MAP_W + s.x] for s in state.sites]


def run_snapshot(state) -> tuple:
    """The state before a turn-loop run: `serialize.snapshot` and the production report block
    (`GameState.production_report`, heap memory of the EXE, not in the snapshot), byte for byte
    as `rules.engine.apply` keeps it."""
    from ..model.serialize import snapshot
    return snapshot(state), state.production_report.copy()


def run_restore(state, snap: tuple) -> None:
    """Put `state` back to `run_snapshot`'s `snap`, the whole report block included (in place)."""
    from ..model.serialize import restore
    d, report = snap
    restore(state, d)
    state.production_report.data[:] = report.data


def registry_kit(app):
    from ..ui.widgets import kit
    return kit(app)


@registry.action(registry.MENU_ID["end_turn"])
def _end_turn(host):
    fn = getattr(host, "end_turn", None)
    if fn is not None:
        fn()


LOAD_WHERE = {"menu": "game_start", "setup": "setup", "game": "game"}   # DS:28c6 / neither / DS:2a86


def scenario_record(app, directory: str, current: dict | None) -> dict | None:
    """DS:5d64 at Begin: the record the Game Start screen made current (`current`), else the
    SCENARIO.DAT record of `directory` (--scenario has no Game Start screen); None for a
    directory without a record (the random map, M11)."""
    if current is not None and current["str_3c"].upper() == directory.upper():
        return current
    from .menu import scenario_records
    return next((r for r in scenario_records(kit(app)) if r["str_3c"].upper() == directory.upper()), None)
