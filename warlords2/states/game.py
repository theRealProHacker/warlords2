"""The game state: game frame, playing map, overview map and the phase machine.

Entered with `new_game=NewGameConfig` and `overview=` the strategic bitmap the setup
screen's scenario load built (ovl63:232b runs inside ovl57:0194, before the Game Setup
screen; `states.setup.load_scroll`), or with `new_game` alone (--scenario via
`states.boot`, which has no setup screen: the building phase runs the same load first),
or `load_slot=n` (M10b).  `on_enter` runs on pgsm's hook thread, so it only stores the
arguments; the engine game is started by the building phase on the main thread.  Until
then the state draws the empty game frame (SCREEN0-3, SHOT 08) with the program's one menu
bar (`ui.menubar.title_bar`) as the Game Setup screen left it (ovl57:0416 / 0564: all
titles off but Game / Quit, rules.md section 9.7); with --scenario there was no setup
screen, so its enable sequence and title repaint run here once.

Main loop pass (ovl61:2123..2194): at the top of every pass the site tile bytes are
rewritten for the side whose turn it is (ovl35:09f2(SCN 0x110) at ovl61:217d,
`rules.ruins.site_tiles`; with Quests on it also redraws each site's overview square,
`Minimap.redraw_sites`), then the map owner nibbles and army bits are rebuilt (ovl62:0000 at
ovl61:2183, `rules.mapwords.refresh_map`) and then the cost map of that side (0555:0d9e at
ovl61:2194, `rules.pathfinding.rebuild_cost_map`); the map (ovl64:006c) and the overview
(ovl63:0000(1, 1, NULL)) are drawn.  Here `loop_pass` runs once the engine game is started
(before the first frame of the map) and after each command (`apply`); drawing is every
frame.  `rules.pathfinding.find_path` writes the path cache and patches the cost map, so a
path preview must run on `state.copy()`.

The view centre is kept here, initialised from SCN 0x17d / 0x17f; scrolling does not write
those SCN words back (there is no command for it).
"""
from __future__ import annotations

import pygame

from ..assets.sprites import MapColors, Sprites
from ..model.state import SCN_TERRAIN_SET
from ..rules.mapwords import refresh_map
from ..rules.ruins import site_tiles
from ..rules.pathfinding import rebuild_cost_map
from ..ui.dialog import DialogStack
from ..ui.mapview import MapView
from ..ui.menubar import saved_games, title_bar, with_codes
from ..ui.minimap import Minimap
from ..ui.widgets import draw_pointer
from .base import BaseState
from .phases import phase_class

BACKDROP = "screen.pck"
SCN_VIEW_CX, SCN_VIEW_CY, SCN_SAVE_MAP = 0x17D, 0x17F, 0x120


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

    def on_enter(self, frm: str, new_game=None, load_slot=None, overview=None) -> None:
        self.config, self.load_slot, self.overview = new_game, load_slot, overview
        self.state, self.phase_name, self.phase = None, None, None
        self.map_ready = False
        self.dialogs = DialogStack()
        self._next = "building"
        self.no_setup = frm != "setup"
        self.bar = None

    # ------------------------------------------------------------------ main thread

    def _ready(self) -> None:
        if self.bar is None:
            self.bar = title_bar(self.app)
            if self.no_setup:                     # what ovl57:0416 and 1372:132f(0) left
                self.bar.pre_game(saved_games(self.app), saved_games(self.app), False)
                self.bar.repaint()
        if self.sprites is None:
            self.sprites = Sprites(self.app.assets)
            self.view = MapView(self.sprites)

    def start_engine(self, sc=None) -> None:
        """Start the engine game (rules.setup.new_game) from the loaded scenario `sc`
        (loaded here when None) with the overview bitmap of the load."""
        from ..formats.scenario import load_scenario
        from ..formats.tables import parse_armytypes
        from ..rules.setup import new_game, unused_side_name
        if self.load_slot is not None:
            raise NotImplementedError("Load Game (load_slot) is M10b")
        cfg = self.config
        if cfg is None:
            raise RuntimeError("game entered without new_game= or load_slot=")
        from .setup import terrain_set
        a = self.app.assets
        sc = sc or load_scenario(self.app.gd, cfg.scenario)
        types = parse_armytypes(a.read(f"TERRAIN{terrain_set(sc)}/ARMYTYP{'2' if cfg.army_set else 'E'}.DAT"))
        from ..rules.heroes import load_hero_names
        self.state = new_game(sc, cfg, list(types), unused_name=unused_side_name(a.read("WARLORD2.EXE")),
                              hero_names=load_hero_names(self.app.gd, terrain_set(sc)))
        if self.no_setup:
            self.bar.pre_game(saved_games(self.app), saved_games(self.app), self.state.flags[SCN_SAVE_MAP] != 0)
        self.minimap = Minimap(self.sprites, MapColors.load(a, self.state.flags[SCN_TERRAIN_SET]), self.overview)
        self.view.centre(self.state.flags[SCN_VIEW_CX], self.state.flags[SCN_VIEW_CY])

    def loop_pass(self) -> None:
        """Top of a main-loop pass: ovl35:09f2(SCN 0x110) (ovl61:217d) with its overview squares,
        ovl62:0000 (ovl61:2183), then 0555:0d9e(SCN 0x110, 1) (ovl61:2194)."""
        site_tiles(self.state, self.state.current)
        self.minimap.redraw_sites(self.state)
        refresh_map(self.state)
        rebuild_cost_map(self.state)

    def apply(self, cmd):
        """Run one command through the engine, then start the next main-loop pass."""
        from ..rules.engine import apply
        events = apply(self.state, cmd)
        self.loop_pass()
        return events

    def army_turn_start(self) -> None:
        """Stand-in until M8a's turn_start phase exists: the army steps of the human turn
        start ovl68:0259 (EL section 6.2) that the engine has, in their order: group cleanup
        0b62:0d85 (ovl68:0351), movement refresh ovl68:05fb, fortify marks ovl67:0000
        (ovl68:035b), flag clear ovl67:0113 (ovl68:0365); then a main-loop pass.  Diplomacy,
        recount, income, production, hero code and the report screens are M8a's."""
        from ..rules.movement import refresh_moves
        from ..rules.selection import clear_turn_flags, fortify_marks, group_cleanup
        st = self.state
        group_cleanup(st)
        refresh_moves(st, st.current)
        fortify_marks(st)
        clear_turn_flags(st)
        self.loop_pass()

    def scroll_to(self, x: int, y: int) -> None:
        self.view.centre(x, y)

    def step(self, events, dt):
        self._ready()
        if self._next is not None:
            self.phase_name, self._next = self._next, None
            cls = phase_class(self.phase_name)
            if cls is None and self.phase_name == "turn_start" and self.state is not None:
                self.army_turn_start()
                self.phase_name, cls = "human", phase_class("human")
            self.phase = cls(self) if cls else None
            if self.phase:
                self.phase.enter()
            return
        rest = []
        for e, code in with_codes(events, self.app.input):
            if self.dialogs:
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.bar.bar.press(self, e.pos):
                continue
            if code is not None and self.bar.bar.key(self, code):
                continue
            rest.append(e)
            if self.phase is None:
                self.idle(e)
        if self.phase is not None and not self.dialogs:
            nxt = self.phase.step(rest, dt)
            if nxt:
                self._next = nxt

    def idle(self, e: pygame.event.Event) -> None:
        """No module for the current phase yet: a left click on the overview map centres
        the playing map there (MAN p.21)."""
        if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.map_ready:
            t = self.minimap.tile_at(e.pos)
            if t:
                self.scroll_to(*t)

    def paint(self, fb):
        self._ready()
        fb.blit(self.app.assets.picture(BACKDROP), (0, 0))
        if self.map_ready:
            paint_map = getattr(self.phase, "paint_map", None)       # the human phase (M4c)
            if paint_map is not None:
                paint_map(fb)
            else:
                self.view.draw(fb, self.state)
            self.minimap.draw(fb, self.state, *self.view.origin)
        if self.phase is not None:
            self.phase.paint(fb)
        self.bar.draw(fb)

    def draw(self, s):
        super().draw(s)
        draw_pointer(self.app, s, self.dialogs)
