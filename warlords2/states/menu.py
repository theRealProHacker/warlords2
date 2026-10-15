"""Game Start screen (pgsm state `menu`): WARLORD2.EXE ovl60.

Evidence (EL = docs/research/exe_logic.md; addresses as in docs/research/parts/00_image.md):

* entry ovl60:0000(draw): DS:28c8 (random map) = the scenario directory equals "random"
  (DS:2a67); JOIN screen 1 (ovl53:056a(1)); with `draw`: palette (ovl55:0000), backdrop
  FILE.DAT group 66 = PICS\\STARTUP0-3 (ovl61:092a(1)); on the first visit only (DS:2a0c)
  the SCENARIO.DAT record whose directory is "Erythea" (DS:2a6e) becomes current
  (DS:28ce, record copy DS:5d64), else record 0; then the picture (ovl60:0332), the
  title (ovl60:02bf), the buttons (ovl60:011e), music (ovl58:0000, M10c) and, with
  `draw`, the talking face ovl58:026f(2) (`ui/dialogs/voice_face`, register X19);
* picture ovl60:0332: SCENARIO.PCK of the scenario directory (picture 2), opaque copy of
  DS:2928 = (0, 0, 264, 225) to DS:2938 = (328, 200); with DS:28c8 set colour 3 over
  DS:2930 and the random-map panel (M11);
* title ovl60:02bf: colour 3 over DS:2940 = (336, 166, 248, 28); the record's text at
  +0x1c, or STRING (0, 0) with DS:28c8 set, SetFont(2, 15, 0, 3) centred at DS:293c;
* buttons ovl60:011e: 100 and 103 normal; 101 normal when ovl49:0e25 finds a saved game,
  else disabled; 102 disabled while DS:28c8 is set, else normal; 104-113 (the random-map
  panel) only with DS:28c8; menu bar: every menu off (1372:0eab(0, 0) walks all titles),
  498 500 501 503 off, 502 / 504 as ovl49:0e25 / 0e42, 505 on, menus 2-5 and 7 off;
* dispatch 07be:04d8: 100 -> ovl60:058d (the scenario list, `ui/dialogs/scenario_select`),
  101 -> ovl60:05e3 (Load Game, M10b), 102 -> ovl60:05f5 (Random Map, M11), 103 ->
  ovl60:060f (Begin: ovl57:0000(1, 1, 1, 0), the Game Setup screen, `states/setup`);
* list OK ovl60:0b7e -> 067c(i): record i current, its directory = record +0x3c
  (DS:5da0), DS:28c8 = 0, ovl60:0000(0) (no face); Cancel ovl60:0b90 -> 067c(-1).

* Begin ovl60:060f: with DS:28c8 set first the talking face ovl58:026f(0) (ovl60:0621),
  then the Game Setup screen.

The menu bar is the program's one `ui.menubar.TitleBar` (`title_bar`).  Every entry
(ovl60:0000) repeats the record lookup and ovl60:011e / 0332 / 02bf (`enter_screen`); the
talking face opens from the first update after it (`start_screen`), not with the talking
advisor off (`audio.voice.talking`: OPTIONS.SND digit 2, --no-voice).

Dice: ovl59:02bf is the EXE's one roller, seeded on its first call (DS:2678 -> ovl59:0356)
and never again in a run; nothing rolls from the start-up (08a9:0219..024c) up to ovl60:0000.
The faces roll rnd(1, 30, 10) once per call (ovl58:094c, reached from every branch of
speech 2 (0838 -> 0845 / 085d -> 0854 / 0939 -> 0944) and 0 (087b -> 0944); the only exit is
the talking advisor off at ovl58:0293; the speech files are FILE.DAT (0x3b / 0x3c, 1 / 0),
fixed entries; ovl59:052f draws a die only for a negative STRING / FILE / ERROR.DAT entry
(04f0 / 0505 / 051a -> 058b..0595)), so with the talking advisor on each
entry with `draw` (the start-up 08a9:024c, the setup screen's Main Menu ovl57:0ee0) and
Begin with the random map roll before the setup screen's loader (ovl63:2479).  Menu and
setup draw from the run's one `Rng` (`session_dice`, started at the seed with the default
die source); the setup screen hands its state to Begin (`NewGameConfig.rng_state`).  The
music on the way to the first game draws no die: mode 0 before the face (ovl60:00fd) and at
the setup screen's entry (ovl57:003a / 003c) plays the fixed FILE.DAT entries (8, 0) /
(7, 0), and Begin's mode 11 (ovl57:0e24 / 0e26) (19, 0) / (7, 0) (register X32).
Not modelled: after a game the stream does not continue from the game's dice (the game's
`GameState.rng` is its own copy of the stream).

No saved games or maps exist before M10b / M11, so ovl49:0e25 / 0e42 are false here; 101
and 102 run their registered actions and are inert until M10b / M11 register them.
"""
from __future__ import annotations

import struct
from typing import TYPE_CHECKING

import pygame

from ..assets.exe import ds_str, ds_words
from ..assets.fonts import CHANCE17
from ..formats.scenario import parse_scenario_dat
from ..model.newgame import NewGameConfig
from ..rules.rng import Rng
from ..ui import registry
from ..ui.layout import DISABLED, NORMAL
from ..ui.menubar import saved_games
from ..ui.widgets import blit_opaque, text_centred
from .host import ScreenHost

if TYPE_CHECKING:
    from ..ui.widgets import Kit

STARTUP, SCENARIO_PIC, MARBLE = 0, 2, 25
SCREEN_START = 1
NEW_SCENARIO, LOAD_GAME, RANDOM_MAP, BEGIN = 100, 101, 102, 103
RANDOM_PANEL = (104, 105, *range(106, 114))
SCENARIO_DAT = (0, 0)                     # FILE.DAT group, index
RANDOM_TITLE = (0, 0)                     # STRING.DAT
DEFAULT_DIR, RANDOM_DIR = 0x2A6E, 0x2A67  # "Erythea", "random"
PIC_SRC, PIC_DST, PANEL = 0x2928, 0x2938, 0x2930
TITLE_POS, TITLE_BOX = 0x293C, 0x2940
PAPER, INK, SHADOW = 3, 15, 0
GREETING, ONE_MOMENT = 2, 0               # ovl58:026f(2) (ovl60:0000), (0) (ovl60:0621)
RANDOM_SCENARIO = "RANDOM"


# --------------------------------------------------------------------------- dice

def session_dice(app) -> Rng:
    """The run's one ovl59:02bf stream before a game (seeded once, DS:2678 / ovl59:0356):
    started at the seed on the first roll, then shared by Game Start and Game Setup."""
    dice = getattr(app, "session_dice", None)
    if dice is None:
        dice = app.session_dice = Rng(app.cfg.seed, NewGameConfig.rng)
    return dice


# --------------------------------------------------------------------------- scenarios


def scenario_records(k: Kit) -> list[dict]:
    """DATA/SCENARIO.DAT (FILE.DAT group 0, ovl60:06c8), in file order."""
    return parse_scenario_dat(k.store.read(k.files.get(*SCENARIO_DAT)))


def scenario_info(k: Kit, directory: str) -> dict:
    """Title, description and counts of a scenario directory.  RANDOM has no SCENARIO.DAT
    record: its counts come from RANDOM/RANDOM.SCN (cities 0x157B, sites 0x80F, sides with
    0x137 != 0) and its title is STRING (0, 0) (docs/plan.md row M2b, C8)."""
    if directory.upper() == RANDOM_SCENARIO:
        scn = k.store.read(f"{RANDOM_SCENARIO}/{RANDOM_SCENARIO}.SCN")
        title = k.text.S(*RANDOM_TITLE)
        return {"title": title, "description": title, "dir": RANDOM_SCENARIO,
                "cities": struct.unpack_from("<H", scn, 0x157B)[0],
                "sites": struct.unpack_from("<H", scn, 0x80F)[0],
                "players": sum(1 for w in struct.unpack_from("<8H", scn, 0x137) if w)}
    for r in scenario_records(k):
        if r["str_3c"].upper() == directory.upper():
            return {"title": r["title"], "description": r["description"], "dir": r["str_3c"].upper(),
                    "cities": r["cities"], "sites": r["sites"], "players": r["players"]}
    raise KeyError(directory)


class Menu(ScreenHost):
    screen_id = SCREEN_START

    def __init__(self, app):
        super().__init__(app)
        self.records: list[dict] | None = None
        self.index = 0                       # DS:28ce
        self.directory: str | None = None    # DS:5da0 (record +0x3c)
        self.random = False                  # DS:28c8
        self.greet = False                   # ovl58:026f(2) pending

    def on_enter(self, frm: str, scenario: str | None = None, **kw) -> None:
        """ovl60:0000(1).  `scenario` (a directory name) makes that scenario current."""
        if kw:
            raise TypeError(f"menu: unexpected arguments {sorted(kw)}")
        super().on_enter(frm)
        if scenario is not None:
            self.directory = scenario.upper()
        self.greet = True

    def enter_screen(self, k: Kit) -> None:
        """ovl60:0000: the current record (DS:28ce) by directory, the first visit's default
        (DS:2a0c), DS:28c8, then ovl60:011e (the buttons and the bar)."""
        if self.records is None:
            self.records = scenario_records(k)
        dirs = [r["str_3c"].upper() for r in self.records]
        if self.directory is None:                           # first visit (DS:2a0c)
            want = ds_str(k.exe, DEFAULT_DIR).upper()
            self.index = dirs.index(want) if want in dirs else 0
            self.directory = dirs[self.index]
        elif self.directory in dirs:
            self.index = dirs.index(self.directory)
        self.random = self.directory == ds_str(k.exe, RANDOM_DIR).upper()
        self.refresh()

    def start_screen(self, k: Kit) -> None:
        """ovl60:0000(1) ends with the talking face ovl58:026f(2)."""
        if self.greet:
            self.greet = False
            self.face(GREETING, lambda: None)

    def roll(self, dice: int, sides: int, add: int) -> int:
        """ovl59:02bf from the run's one stream (`session_dice`)."""
        return session_dice(self.app).rnd(dice, sides, add)

    def refresh(self) -> None:
        """ovl60:011e."""
        self.set_button(NEW_SCENARIO, NORMAL)
        self.set_button(BEGIN, NORMAL)
        self.set_button(LOAD_GAME, NORMAL if saved_games(self.app) else DISABLED)
        self.set_button(RANDOM_MAP, DISABLED if self.random else NORMAL)
        for id in RANDOM_PANEL:
            self.hide_button(id)            # the panel is M11's (random_map)
        self.bar.pre_game(saved_games(self.app), saved_games(self.app), False)

    def choose(self, index: int | None) -> None:
        """ovl60:067c: list result; None = Cancel."""
        if index is not None:
            self.index = index
            self.directory = self.records[index]["str_3c"].upper()
            self.random = False
        self.refresh()

    def on_button(self, id: int) -> None:
        if id == NEW_SCENARIO:
            registry.open_dialog("scenario_select", self, records=self.records, current=self.index,
                                 on_close=self.choose)
        elif id == BEGIN:                                    # ovl60:060f
            go = lambda: self.request("setup", scenario=self.directory, random_map=None)   # noqa: E731
            if self.random:
                self.face(ONE_MOMENT, go)
            else:
                go()
        else:
            registry.run_action(id, self)

    def paint(self, fb: pygame.Surface) -> None:
        k = self._kit()
        exe, f = k.exe, k.fonts[CHANCE17]
        blit_opaque(fb, k.picture(STARTUP), (0, 0), None)
        if self.random:
            fb.fill(PAPER, ds_words(exe, PANEL, 4))
            title = k.text.S(*RANDOM_TITLE)
        else:
            src, dst = ds_words(exe, PIC_SRC, 4), ds_words(exe, PIC_DST, 2)
            blit_opaque(fb, k.picture(SCENARIO_PIC, self.directory), dst, src)
            title = self.records[self.index]["description"]
        fb.fill(PAPER, ds_words(exe, TITLE_BOX, 4))
        text_centred(fb, f, *ds_words(exe, TITLE_POS, 2), title, INK, SHADOW)
        self.buttons.draw(fb)
        self.bar.draw(fb)
