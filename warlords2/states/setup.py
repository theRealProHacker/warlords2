"""Game Setup screen (pgsm state `setup`): WARLORD2.EXE ovl57.

The screen edits the scenario's SCN image in place, as the EXE edits segment 2c04 (EL §7);
Begin hands the choices to the game state as `model.newgame.NewGameConfig`, and
`rules.setup.new_game` applies the Begin side rules of ovl57:0cfe to them.

Evidence (EL = docs/research/exe_logic.md):
* entry from Game Start, ovl60:060f -> ovl57:0000(1, 1, 1, 0): menu bar titles repainted
  (1372:132f(0)), game frame FILE.DAT group 65 = PICS\\SCREEN0-3 (ovl61:092a(0)), the
  progress scroll (popup 0x17, ovl57:0047) over it for the whole scenario load
  (`load_scroll`): ovl57:0194(1) with STRING group 135, bar ovl02:01b5, ovl02:01ff at 0
  before the SCN read and 20, 60, 100 after the SCN, the map / road files ovl57:0323 and
  the city reset ovl29:0000, a 10-tick wait ovl59:0000(10) (ovl57:02ce; `LOAD_WAIT`
  ticks of `ui.widgets.tick_frames`), then the strategic map ovl63:232b
  (terrain set SCN 0x161, the one source of it here) in the same scroll (ovl17:08bf finds it open, ovl17:070b
  clears its text area): STRING group 137 and 0, 10, ..., 90 (`ui.minimap.build`); the
  scroll closes at ovl57:0092 (ovl17:069c).  Only then (ovl57:02dd) is every side with
  0x137 = 0 renamed "Not used" (DS:256f) with level 3 (EL §9.1).  The bitmap goes to the
  game with Begin (`overview=`), as DS:581d stays filled in the EXE;
* dice: ovl59:02bf is the one roller of the EXE (seeded once, ovl59:0356), so its stream
  runs from the Game Start faces (`states.menu`) and earlier visits here through the
  loader's 256 rnd(1,3,1) (ovl63:2479), the quotation (ovl57:0fe8) and Random Characters
  (ovl57:20af) and Begin's talking face into Begin.  This screen draws from the run's one
  `Rng` (`states.menu.session_dice`): each entry hands its state before the loader's rolls
  to Begin as `NewGameConfig.rng_state` and its later rolls as `NewGameConfig.setup_rolls`,
  which `new_game` repeats after the loader's.  The face ovl58:026f rolls rnd(1, 30, 10)
  exactly once per call whatever the speech length (ovl58:094c; later blinks reset the
  counter to 0 at ovl58:097d without a roll; the only early exits are the talking advisor
  off at ovl58:0293 and a failed screen-save allocation at ovl58:075e), so Begin's face
  (talking advisor on, `audio.voice.talking`) adds one (1, 30, 10).  The music at the entry
  (ovl57:003c, mode 0) and at Begin (ovl57:0e26, mode 11) plays fixed entries and draws no
  die (register X32);
* with the tutorial flag (SCN 0x12E) the ten option words become preset row 0 (DS:2378,
  ovl57:00a4), the tutorial page FILE.DAT (25, 8) is shown (ovl61:168d) and Begin follows
  at once; otherwise OPTIONS.DAT (FILE.DAT (67, 0)) is read into DS:23b4 (ovl57:223b),
  then the screen is drawn: marble (picture 25) source (0, 0, 360, 360) at DS:2ab0 =
  (16, 30) (ovl61:0a10), the eight side boxes (ovl57:0634), the rating (ovl57:0bab), the
  SSG logo (picture 52, DS:2550 -> DS:2558, ovl57:10c7), the quotation (ovl57:0f88),
  STRING (7, 0) / (7, 1) centred at (512, 48) / (512, 206), JOIN screen 3, the buttons
  and the menu bar items (ovl57:0416);
* side box ovl57:0634(p): DS:23c8[p] = (x, y, w, h); colour 0x0A0[p]: its outline, the
  top and left lines of (x-1, y-1, w+2, h+2), the bottom and right lines of
  (x+1, y+1, w-2, h-2); colour 0x0B0[p]: the other four lines; the name on colour 3
  over (nx - 4, ny, width + 8, 20) at DS:2478[p] in SetFont(2, a0, b0, 3); portrait
  (SETUPBU, picture 31, opaque) DS:2408[d] at DS:2458[p] with d = 4 (5 for odd p) for a
  human side, the level for a computer side, level + 7 with a card, 6 for a side that
  does not take part; control label DS:24b8[d'] at DS:2498[p] (d' = d - 7 from 7 on,
  5 -> 4, 6 -> 3); the Character box DS:24ec[card == 0] at DS:24fc[p] and "Character"
  (DS:258b) at DS:251c[p];
* rating ovl57:0bab: `rules.setup.difficulty_rating`, STRING 6 SetFont(2, 15, 0, 3)
  centred at DS:24e0 over marble restored at DS:24e4 (source rectangle - (16, 343));
* quotation ovl57:0f88: QUOTES.DAT (FILE.DAT (2, 0)): the count "%2d" of the first
  line, quote k = rnd(1, count, 0) (ovl59:02bf); each quote line is "%3d" n and n + 1
  bytes, the byte before the last cleared; the text is drawn up to each '|', segment j
  centred at DS:253c[j] in SetFont(2, 15, 0, 3);
* buttons ovl57:0416: 125-140 and 149-156 normal; preset buttons 145-147 pressed while
  the first six option words equal their row of DS:2378 (ovl57:1241), else normal; 148
  normal; 143 (I am the Greatest) with SCN 0x116 = 0, else 144 (its Off variant), the
  other one hidden; 141, 142, 157 normal; 158 normal when a computer side takes part,
  else disabled; menu bar as ovl60:011e with 503 = SCN 0x120;
* dispatch 07be:04d8: 125-132 -> ovl57:0a4e(p) control cycle human -> level 0 -> 1 -> 2
  -> 3 (off) -> human (card 0; three label frames from the old label's source moved down
  by k * h, k = 1..3, one ovl59:0000(1) wait each); 133-140 and 149-156 -> ovl57:16ea(p)
  (`ui/dialogs/setup_side`); 141 -> ovl57:0cfe (Begin); 142 -> ovl57:0edb (Main Menu,
  ovl60:0000(1)); 143 / 144 -> ovl57:0ee8(1 / 0) (every live side computer level 2,
  card 0 unless it was level 2 already, SCN 0x116 = 1 / SCN 0x116 = 0); 145-147 ->
  ovl57:1273(p) (preset); 148 -> ovl57:12a2 (`ui/dialogs/options`); 157 -> ovl57:2229
  (Recall Options: OPTIONS.DAT again); 158 -> ovl57:2051 (Random Characters: every live
  computer side not off gets card rnd(1, cards - 1, 0) of its level);
* Begin ovl57:0cfe: no side with 0x137 != 0 and level != 3 -> only the chord (ovl58:0b5f
  at ovl57:0d36) and the buttons again; else the side rules, the music ovl58:0000(0xb), the
  talking face ovl58:026f(1) (ovl57:0e2e; `ui/dialogs/voice_face`),
  OPTIONS.DAT written (ovl57:2289), then the game (ovl61:0000(0, 1)).  Here OPTIONS.DAT
  is read from and written to `--user-dir` (the game directory's copy is read when the
  user has none).

Random maps and Load Map (M11): with DS:28c8 set the entry from Game Start generates first
(ovl57:10e8, `Setup._generate`: the id dice and the generator in the scroll of STRING group
136, the files into the RANDOM overlay, the record DS:5d64 "random" + the id, then 0194(0)
without its own text and 232b, SAVE\\RMAPTEMP.DAT by ovl49:11f3, then the screen as for any
scenario); Load Map enters with `loaded` (ovl57:0000(0, 1, 0, 1): the loaded memory's sides, no
loader and no OPTIONS.DAT read, the quotation, then ovl49:13a6..13b9) and its Begin starts from
that memory (`rules.setup.begin`, no replay).  Every entry writes SCN 0x120 = DS:28c8 into the
screen's SCN image (ovl57:007f), which the menu bar's 503 and Save Map's gate read
(ovl57:05d2, ovl49:1214), and Begin passes it as `NewGameConfig.random_flag`.

Begin passes SCN 0x116 as `NewGameConfig.greatest`: the word lives in the SCN image from
the load on, ovl57:0ee8 is its only writer (ovl57:0f52 / 0f60), and ovl53:0295 (start
infamy), ovl18:06ad and ovl27:13b7 read it after Begin (register X29).  The label frames and the
load wait are ovl59:0000 BIOS ticks (`ui.widgets.tick_frames`, register X05 closed).
"""
from __future__ import annotations

import struct
import sys

import pygame

from ..assets.fonts import CHANCE17
from ..audio import effects
from ..assets.sprites import MapColors
from ..assets.store import cache_load, cache_unload
from ..formats.scenario import load_scenario
from ..model.ids import LEVEL_OFF, Control
from ..model.newgame import NewGameConfig
from ..model.options import GameOptions
from ..rules.constants.setup import LOADER_TILE_ROLLS
from ..rules.rng import Rng
from ..rules.setup import difficulty_rating
from ..assets.exe import ds_str, ds_words
from ..ui import minimap, random_panel, registry
from ..ui.dialogs.options import apply_preset, matches, presets
from ..ui.dialogs.setup_side import (OFF_A0, OFF_ALIVE, OFF_B0, OFF_CARD, OFF_CONTROL, OFF_ENH, OFF_LEVEL,
                                      leader_names)
from ..ui.layout import DISABLED, NORMAL, PRESSED
from ..ui.menubar import saved_games, saved_maps
from ..ui.widgets import blit_opaque, kit, text_centred, tick_frames
from .host import ScreenHost
from .menu import session_dice

SCREEN_SETUP = 3
SCREEN_PIC, MARBLE, SETUPBU, SSG = 3, 25, 31, 52
N_SIDES, NAME_LEN = 8, 20
TOP_LEVEL, SAVE_MAP, TUTORIAL, SCN_LOADED = 0x116, 0x120, 0x12E, 0x130
HUMAN, COMPUTER, TOP = Control.HUMAN, Control.COMPUTER, 2
BOXES, PORTRAIT_SRC, PORTRAIT_AT, NAME_AT = 0x23C8, 0x2408, 0x2458, 0x2478
LABEL_AT, LABEL_SRC, CHECK_SRC, CHECK_AT, CHAR_AT = 0x2498, 0x24B8, 0x24EC, 0x24FC, 0x251C
RATING_AT, RATING_BOX, QUOTE_AT, SSG_SRC, SSG_AT = 0x24E0, 0x24E4, 0x253C, 0x2550, 0x2558
UNUSED_NAME, CHARACTER = 0x256F, 0x258B
RANDOM_NAME = 0x255C                    # "random" (ovl57:11df / 11ef: DS:5da0, DS:5d78)
OPTION_WORDS = 0x23B4                   # DS:23b4, ten words (EXE image before any OPTIONS.DAT read)
SCN_SIZE = 0x2EE1
GENERATE_GROUP = 136                    # ovl57:1116..1186: STRING (136, 0..6) on the open popup
RANDOM_SCENARIO = "RANDOM"
MAP_AREA = 0x2AB0
RATING_MARBLE = (16, 343)
QUOTES, OPTIONS_FILE, TUTORIAL_PAGE = (2, 0), (67, 0), 8
LOAD_GROUP, LOAD_STEPS = 135, (0, 20, 60, 100)
LOAD_WAIT = 10                          # ovl57:02cc: ovl59:0000(10) after 100 %
BUILD_GROUP = 137                       # ovl63:237a..23e0: strings (0x89, 0..6)
SCN_TERRAIN_SET = 5                     # words_157_to_161[5] = SCN 0x161
BEGIN_SPEECH = 1                        # ovl57:0e2c: ovl58:026f(1)
HEADINGS = ((7, 0, (512, 48)), (7, 1, (512, 206)))
RATING_TEXT = (6, 0)
INK, SHADOW, PAPER = 15, 0, 3
CONTROL, CHAR_BOX, PORTRAIT = range(125, 133), range(133, 141), range(149, 157)
BEGIN, MAIN_MENU, GREATEST, GREATEST_OFF = 141, 142, 143, 144
PRESET_IDS, EDIT_OPTIONS, RECALL, RANDOM_CHARS = range(145, 148), 148, 157, 158


class Sides:
    """The per-side words of an SCN image (2c04 in the EXE), edited in place."""

    def __init__(self, scn: bytes):
        self.scn = bytearray(scn)

    def get(self, off: int, p: int = 0) -> int:
        return struct.unpack_from("<h", self.scn, off + 2 * p)[0]

    def set(self, off: int, p: int, v: int) -> None:
        struct.pack_into("<h", self.scn, off + 2 * p, v)

    def name(self, p: int) -> str:
        raw = self.scn[NAME_LEN * p:NAME_LEN * (p + 1)]
        return bytes(raw).split(b"\0")[0].decode("cp437")

    def set_name(self, p: int, s: str) -> None:
        b = s.encode("cp437")[:NAME_LEN - 1]
        self.scn[NAME_LEN * p:NAME_LEN * (p + 1)] = b + bytes(NAME_LEN - len(b))

    def alive(self, p: int) -> bool:
        return self.get(OFF_ALIVE, p) != 0

    def human(self, p: int) -> bool:
        return self.get(OFF_CONTROL, p) == HUMAN

    @classmethod
    def from_state(cls, st) -> "Sides":
        """The words of the SCN image the Setup screen reads and edits, from a game state in
        memory (Load Map's: ovl57:0000(0, 1, 0, 1) shows 2c04 as 0414 left it, no loader):
        names, 0xa0 / 0xb0, 0xc0 level, 0xd0 control, 0xe0 card, 0xf0 enhanced, 0x137, and the
        words 0x116, 0x120, 0x12e and 0x130 (Save Map's gate, 1 after 0414: ovl49:0896)."""
        s = cls(bytes(SCN_SIZE))
        for p, pl in enumerate(st.players):
            s.set_name(p, pl.name)
            for off, v in ((OFF_A0, st.flags.get(OFF_A0 + 2 * p, 0)), (OFF_B0, st.flags.get(OFF_B0 + 2 * p, 0)),
                           (OFF_LEVEL, pl.level), (OFF_CONTROL, int(pl.control)), (OFF_CARD, pl.card),
                           (OFF_ENH, pl.enhanced), (OFF_ALIVE, pl.alive)):
                s.set(off, p, int(v))
        for off in (TOP_LEVEL, SAVE_MAP, TUTORIAL, SCN_LOADED):
            s.set(off, 0, int(st.flags.get(off, 0)))
        return s

    def playing_computer(self, p: int) -> bool:
        """0x137 != 0, 0x0D0 == 1, 0x0C0 != 3 (ovl57:0416, 0bab, 2051)."""
        return self.alive(p) and self.get(OFF_CONTROL, p) == COMPUTER and self.get(OFF_LEVEL, p) != LEVEL_OFF


def read_quote(data: bytes, k: int) -> str:
    """ovl57:0f88: quote k (1-based) of QUOTES.DAT, its last byte before CR LF cleared."""
    pos = 4
    text = b""
    for _ in range(k):
        n = int(data[pos:pos + 3])
        chunk = data[pos + 3:pos + 3 + n + 1]
        text = chunk[:n - 1]
        pos += 3 + n + 1
    return text.decode("cp437")


def quote_lines(text: str) -> list[str]:
    """The segments drawn by ovl57:0f88: each one ends at a '|'."""
    return text.split("|")[:-1]


def terrain_set(sc) -> int:
    """SCN 0x161 of a loaded scenario: the terrain set (TERRAIN<n>)."""
    return sc["scn"]["globals"]["words_157_to_161"][SCN_TERRAIN_SET]


def _load_files(gd, name: str, tick_hz: int):
    """ovl57:0194(1) as a progress generator; returns the loaded scenario."""
    yield LOAD_STEPS[0]
    sc = load_scenario(gd, name)                  # the SCN (ovl57:0285), MAP and RD (ovl57:0323)
    yield LOAD_STEPS[1]
    yield LOAD_STEPS[2]
    yield LOAD_STEPS[3]                           # after ovl29:0000
    for _ in range(tick_frames(LOAD_WAIT, tick_hz)):     # ovl59:0000(10) (ovl57:02ce)
        yield None
    return sc


def load_scroll(host, name: str, rng: Rng, done, quiet: bool = False) -> None:
    """The scenario load of ovl57:0000 (si != 1) in its progress scroll: ovl57:0194(1)
    (group 135), then ovl63:232b (group 137) drawing the loader's rolls from `rng`
    (ovl63:2479) and building the overview bitmap.  The EXE keeps one popup and clears
    its text area (ovl17:08bf, 070b); here the second scroll opens as the first closes,
    in the same frame.  `done(sc, pixels)` follows the close (ovl57:0092).
    `quiet`: ovl57:0194(0), the random Begin's load inside ovl57:10e8: no text of its own, no
    bar, no percentages and no 10-tick wait (0194's `or si, si` at 019f / 029e / 02af / 02c0), so
    the scenario is read at once and 232b's scroll follows the generator's (asm ovl57:0194..02d4)."""
    a = host.app.assets

    def build(sc):
        count, roll = LOADER_TILE_ROLLS.value
        rolls = [rng.rnd(*roll) for _ in range(count)]
        t = terrain_set(sc)
        colors = MapColors.load(a, t)
        raw, pixels = sc["_raw"], minimap.blank()
        work = minimap.build(raw["tiles"], raw["roads"], t, rolls, colors, pixels)
        registry.open_dialog("progress", host, group=BUILD_GROUP, work=work, on_close=lambda r: done(sc, pixels))

    if quiet:
        return build(load_scenario(host.app.gd, name))
    registry.open_dialog("progress", host, group=LOAD_GROUP, work=_load_files(host.app.gd, name, host.app.cfg.tick_hz),
                         on_close=build)


def images_of(sc) -> tuple[bytes, bytes]:
    """The map words 1e1d:0000 and the road layer 19d9:0000 a scenario load leaves (its .MAP and
    .RD read whole, ovl57:0323), as bytes (register X62: a later generation starts from them)."""
    raw = sc["_raw"]
    return struct.pack("<%dH" % len(raw["tiles"]), *raw["tiles"]), bytes(raw["roads"])


class Setup(ScreenHost):
    screen_id = SCREEN_SETUP

    def __init__(self, app):
        super().__init__(app)
        self.rng_state: dict | None = None       # the stream before the loader's rolls
        self.rolls: list[tuple[int, int, int]] = []       # ovl59:02bf calls after the loader's
        self.overview = None
        self.scenario: str | None = None
        self.sides: Sides | None = None
        self.words: list[int] | None = None      # DS:23b4 (None: the EXE image, never read yet)
        self.quote: list[str] = []
        self.ready = False
        self.anim: tuple[int, int, int, int] | None = None    # (side, old label, frame 1..3, frames left)
        self.random_map = False                  # this entry generates (ovl57:10e8)
        self.loaded = None                       # Load Map's `map_slots.MapLoadResult`, until shown
        self.begin_state = None                  # the memory Begin starts from (Load Map), else None

    def on_enter(self, frm: str, scenario: str | None = None, random_map=None, back: bool = False,
                 loaded=None, **kw) -> None:
        """ovl57:0000(1, 1, 1, 0) from Game Start (the scenario load; with `random_map` DS:28c8 is
        set and ovl57:10e8 generates the map first), with `loaded` (a `ui.dialogs.map_slots.
        MapLoadResult`) ovl57:0000(0, 1, 0, 1) after Load Map (ovl49:139e: no generator, no
        loader, no popup, no OPTIONS.DAT read; the screen and its quotation on the memory 0414
        left), or with `back` ovl57:0000(0, 0, 0, 1) (the Cancel path of ovl34:1434 / ovl49:02d3
        after the Load list of this screen, here a load the host refused): di = 0 no frame or
        screen redraw (no quotation roll, 00fb / 0141), si = 1 no scroll and no OPTIONS.DAT read
        (0042 / 00f1), [bp+0xa] = 0 no load (0071); the buttons and the bar as they were
        (ovl57:0416).  Every entry ends its load part with SCN 0x120 = DS:28c8 (007f)."""
        if kw:
            raise TypeError(f"setup: unexpected arguments {sorted(kw)}")
        super().on_enter(frm)
        if back:
            self.starting = False
            if self.sides is not None:
                self.sides.set(SAVE_MAP, 0, random_panel.run_words(self.app).random)   # 007f
            return
        self.scenario, self.sides, self.ready, self.anim = scenario, None, False, None
        self.random_map, self.loaded, self.begin_state = bool(random_map), loaded, None
        if loaded is not None:
            rec = loaded.loaded.record
            self.scenario = rec["str_3c"] if rec is not None else ""
        cache_unload(self.app)                               # ovl57:0014 0997:0066 (X44)
        self.rng_state, self.rolls, self.overview = None, [], None

    # ------------------------------------------------------------------ load

    def enter_screen(self, k) -> None:
        from ..audio import music_triggers
        if self.loaded is None:                              # Load Map: `map_setup_entry` played it
            music_triggers.pre_game(self.app, 0, "ovl57:003a")  # every ovl57:0000 entry, no die
        if self.ready:                                       # back (ovl57:0000(0, 0, 0, 1)): ovl57:0416 only
            return self.refresh()
        self.bar.repaint()                                   # 1372:132f(0)

    def start_screen(self, k) -> None:
        if self.loaded is not None:
            r, self.loaded = self.loaded, None
            return self._map_entry(k, r)
        dice = session_dice(self.app)
        if self.random_map:
            return self._generate(k, dice)
        self.rng_state = dice.state()                        # before ovl63:2479
        load_scroll(self, self.scenario.upper(), dice, lambda sc, px: self._loaded(k, px, sc))

    def roll(self, dice: int, sides: int, add: int) -> int:
        """ovl59:02bf, recorded for `NewGameConfig.setup_rolls`."""
        self.rolls.append((dice, sides, add))
        return session_dice(self.app).rnd(dice, sides, add)

    # ------------------------------------------------------------------ the random Begin (M11)

    def _generate(self, k, dice) -> None:
        """ovl57:0000(1, 1, 1, 0) with DS:28c8: the popup 0x17 (0047), then ovl57:10e8: the map
        id's 6 dice and the generator (`rules.randmap.random_begin`) on the run's one stream,
        its percentages in the scroll with STRING group 136 (10e8's ovl61:1471).  The generator
        starts from the run's memory (register X62): the map words and road layer as the last
        load or game left them (`RunCarry.run_images`), and the pathfinder's cache and search
        field as the last generation or game left them (None in a fresh run)."""
        import copy
        from ..rules import randmap as RM
        from ..ui.dialogs.save_load import run_carry
        app = self.app
        carry = run_carry(app)
        words, roads = carry.run_images()
        pf, game = carry.pathfinder, carry.game
        if pf is None and game is not None:
            pf = RM.PathRun(path_cache=copy.deepcopy(game.path_cache), dist_table=list(game.dist_table),
                            cost_map=list(game.cost_map))
        work = RM.random_begin(app.gd.read, dice, carry.random_map, map_words=words, roads=roads,
                               pathfinder=pf, army_set=int(bool(app.cfg.alt_names)))
        registry.open_dialog("progress", self, group=GENERATE_GROUP, work=work,
                             on_close=lambda g: self._generated(k, dice, g))

    def _generated(self, k, dice, g) -> None:
        """The rest of ovl57:10e8 after ovl02:0000: the files as ovl09 wrote them (into the
        RANDOM overlay of the user directory, `persist.randomdir.RandomDir.write_files`; a failed
        create of .MAP / .RD / .CTY / .SPC is ovl52:0000, which ends the program; of .SCN the
        printf of ERROR.DAT (0, 0) at ovl09:1117), DS:5da0 = DS:5d78 = "random" and DS:5da8 = the
        id (11de..120c: the record DS:5d64, its other fields as they were), SCN 0x161 = DS:28ca
        (lost: the load rereads the SCN), then ovl57:0194(0) and ovl63:232b's 256 dice
        (`load_scroll(quiet=True)`), then ovl49:11f3 (`_random_loaded`)."""
        from ..formats.scenario import parse_scenario_header
        from ..persist.randomdir import FatalCreate
        from ..ui.dialogs.save_load import run_carry
        app = self.app
        carry = run_carry(app)
        try:
            printed = app.random_dir.write_files(g.files)
        except FatalCreate as e:
            return app.fatal(e.error, e.file)
        for err, name in printed:                            # ovl09:1117 printf, then on
            sys.stdout.write(app.assets.error(err, name))
        word = ds_str(k.exe, RANDOM_NAME)
        rec = dict(carry.record) if carry.record is not None else parse_scenario_header(bytes(0x54))
        rec.update(str_3c=word, dir=word, str_44=g.id)
        carry.record = rec
        pf = g.work.pathfinder                               # the run's search memory from now on (X62)
        carry.pathfinder = pf
        if carry.game is not None:
            carry.game.path_cache, carry.game.dist_table = pf.path_cache, list(pf.dist_table)
        self.rng_state = dice.state()                        # before ovl63:2479
        load_scroll(self, self.scenario.upper(), dice, lambda sc, px: self._random_loaded(k, sc, px, rec), quiet=True)

    def _random_loaded(self, k, sc, pixels, rec) -> None:
        """ovl49:11f3 at ovl57:1234: SAVE\\RMAPTEMP.DAT from the memory after the generation's
        load (`rules.setup.loaded_state` of the generated files with the run's memory: the last
        game's run part, CURRENT.SGN / .HST as that game left them; the 256 rolls replayed from
        the stream before them), before ovl57:007f sets SCN 0x120 (`persist.maps.Maps.write_temp`);
        then the screen as for any scenario."""
        from ..formats.tables import parse_armytypes
        from ..rules.heroes import load_hero_names
        from ..rules.saveload import run_part
        from ..rules.setup import loaded_state, unused_side_name
        from ..ui.dialogs.save_load import run_carry
        app = self.app
        carry = run_carry(app)
        game = carry.game
        types = parse_armytypes(app.assets.read(f"TERRAIN{terrain_set(sc)}/ARMYTYP{'2' if app.cfg.alt_names else 'E'}.DAT"))
        st = loaded_state(sc, list(types), rng=Rng.from_state(self.rng_state), unused_name=unused_side_name(k.exe),
                          hero_names=load_hero_names(app.gd, terrain_set(sc)),
                          run=run_part(game) if game is not None else None,
                          signs=game.world.signs if game is not None else None,
                          history=game.history if game is not None else None)
        app.maps.write_temp(st, rec)
        self._loaded(k, pixels, sc)

    # ------------------------------------------------------------------ Load Map (M11)

    def _map_entry(self, k, r) -> None:
        """ovl57:0000(0, 1, 0, 1) at Load Map (ovl49:139e) after `rules.saveload.map_setup_entry`
        (003a's music, 007f's SCN 0x120 = DS:28c8): the screen on the memory Load Map left (the
        sides of the loaded state, no loader, no OPTIONS.DAT read: DS:23b4 as the run left it,
        00f1 with si = 1), the tutorial test, the quotation (0f88); then the rest of 12f2:
        DS:28c6 = DS:2a86 = 0, `rules.saveload.map_setup_done` (ovl62:0af3, ovl58:0000(0) at 13b7).
        Begin then starts from that memory (`begin_state`), its dice live on the run's stream (no
        replay, no second 256); the overview is 0414's 232b bitmap.  A failed open shows the wiped
        live memory the same way."""
        from ..audio import music_triggers
        from ..rules import saveload as SL
        st = r.loaded.state
        self.app.session_dice = st.rng                       # the run's one stream (X49)
        self.begin_state, self.overview = st, r.overview
        self.sides = Sides.from_state(st)
        if self.words is None:
            self.words = list(ds_words(k.exe, OPTION_WORDS, 10))
        self._show(k, recall=False)
        music_triggers.sounded(self.app, SL.map_setup_done(st))

    # ------------------------------------------------------------------ the screen

    def _loaded(self, k, pixels, sc=None) -> None:
        from ..ui.dialogs.save_load import run_carry
        name = self.scenario.upper()
        self.sides, self.overview = Sides(k.store.read(f"{name}/{name}.SCN")), pixels
        if sc is not None:
            run_carry(self.app).images = images_of(sc)       # ovl57:0323's map words / roads (X62)
        unused = ds_str(k.exe, UNUSED_NAME)              # ovl57:02dd..031a
        for p in range(N_SIDES):
            if not self.sides.alive(p):
                self.sides.set_name(p, unused)
                self.sides.set(OFF_LEVEL, p, LEVEL_OFF)
        self.sides.set(SAVE_MAP, 0, random_panel.run_words(self.app).random)    # ovl57:007f
        self._show(k, recall=True)

    def _show(self, k, recall: bool) -> None:
        """ovl57:0000 after 007f: the tutorial test (00a4), OPTIONS.DAT (223b, si != 1:
        `recall`), the screen with the quotation (0f88), the buttons (0416)."""
        if self.sides.get(TUTORIAL):
            self.words = list(presets(k.exe)[0])
            registry.open_dialog("tutorial_page", self, index=TUTORIAL_PAGE, on_close=lambda r: self.begin())
            return
        if recall:
            self.recall(k)
        data = k.store.read(k.files.get(*QUOTES))
        count = int(data[:2])
        self.quote = quote_lines(read_quote(data, self.roll(1, count, 0)))
        self.bar.repaint()
        self.ready = True
        self.refresh()

    def redraw_screen(self) -> None:
        """ovl57:0000(0, 0, 0, 1) (the Cancel paths of the Load list and of ovl34:1434 on this
        screen): the buttons and the bar again; its 003a music call (mode 0, no die)."""
        from ..audio import music_triggers
        music_triggers.pre_game(self.app, 0, "ovl57:003a")
        if self.sides is not None:
            self.sides.set(SAVE_MAP, 0, random_panel.run_words(self.app).random)   # 007f
        self.refresh()

    def options_path(self, k):
        return self.app.user.path(k.files.get(*OPTIONS_FILE).replace("\\", "/"))

    def recall(self, k) -> None:
        """ovl57:223b: the ten words of OPTIONS.DAT (the user's copy first)."""
        p = self.options_path(k)
        data = p.read_bytes() if p.is_file() else k.store.read(k.files.get(*OPTIONS_FILE))
        n = min(len(data) // 2, 10)
        if self.words is None:
            self.words = list(ds_words(k.exe, OPTION_WORDS, 10))
        self.words[:n] = struct.unpack_from(f"<{n}h", data)

    # ------------------------------------------------------------------ state

    def levels_for_rating(self) -> list[int]:
        s = self.sides
        return [s.get(OFF_LEVEL, p) if s.playing_computer(p) else LEVEL_OFF for p in range(N_SIDES)]

    def rating(self) -> int:
        return difficulty_rating(GameOptions.from_words(self.words), self.levels_for_rating())

    def refresh(self) -> None:
        """ovl57:0416."""
        k, s = kit(self.app), self.sides
        cache_load(k, SETUPBU)                               # the side boxes ovl57:0634, the buttons (X44)
        for p in range(N_SIDES):
            for ids in (CONTROL, CHAR_BOX, PORTRAIT):
                self.set_button(ids[p], NORMAL)
        rows = presets(k.exe)
        for p, id in enumerate(PRESET_IDS):
            self.set_button(id, PRESSED if matches(self.words, rows[p]) else NORMAL)
        self.set_button(EDIT_OPTIONS, NORMAL)
        if s.get(TOP_LEVEL):
            self.hide_button(GREATEST)
            self.set_button(GREATEST_OFF, NORMAL)
        else:
            self.hide_button(GREATEST_OFF)
            self.set_button(GREATEST, NORMAL)
        for id in (BEGIN, MAIN_MENU, RECALL):
            self.set_button(id, NORMAL)
        any_computer = any(s.playing_computer(p) for p in range(N_SIDES))
        self.set_button(RANDOM_CHARS, NORMAL if any_computer else DISABLED)
        self.bar.pre_game(saved_games(self.app), saved_maps(self.app), s.get(SAVE_MAP) != 0)   # ovl57:0599 / 05b3

    def cycle(self, p: int) -> None:
        """ovl57:0a4e."""
        s = self.sides
        if not s.alive(p):
            return self.refresh()
        old = 4 if s.human(p) else s.get(OFF_LEVEL, p)
        lv = s.get(OFF_LEVEL, p)
        if s.human(p):
            s.set(OFF_CONTROL, p, COMPUTER)
            s.set(OFF_LEVEL, p, 0)
        elif lv == 2:
            s.set(OFF_LEVEL, p, LEVEL_OFF)
        elif lv == LEVEL_OFF:
            s.set(OFF_LEVEL, p, 0)
            s.set(OFF_CONTROL, p, HUMAN)
        else:
            s.set(OFF_LEVEL, p, lv + 1)
        s.set(OFF_CARD, p, 0)
        self.anim = (p, old, 1, tick_frames(1, self.app.cfg.tick_hz))
        self.refresh()

    def greatest(self, on: bool) -> None:
        """ovl57:0ee8."""
        s = self.sides
        if on:
            for p in range(N_SIDES):
                if s.alive(p):
                    s.set(OFF_CONTROL, p, COMPUTER)
                    if s.get(OFF_LEVEL, p) != TOP:
                        s.set(OFF_CARD, p, 0)
                    s.set(OFF_LEVEL, p, TOP)
        s.set(TOP_LEVEL, 0, int(on))
        self.refresh()

    def random_characters(self) -> None:
        """ovl57:2051: for each side with 0x137 != 0, 0xd0 == 1, 0xc0 != 3 (s = 0..7) the list
        ovl51:03d9(7, level) (209e: the leader names into DS:483c, `save_load.list_names`), then
        0xe0 = rnd(1, DS:482e - 1, 0)."""
        from ..ui.dialogs.save_load import list_names
        k, s = kit(self.app), self.sides
        for p in range(N_SIDES):
            if s.playing_computer(p):
                names = leader_names(k, s.get(OFF_LEVEL, p))
                list_names(self.app, names)
                n = len(names)
                s.set(OFF_CARD, p, self.roll(1, n - 1, 0))
        self.refresh()

    def new_game_config(self) -> NewGameConfig:
        """The screen's choices; `random_flag` = SCN 0x120 as 007f wrote it (DS:28c8).  After Load
        Map there is no loader stream to replay (rng_state None, no setup_rolls: Begin continues
        the live stream, `rules.setup.begin`)."""
        s, cfg = self.sides, self.app.cfg
        per = lambda off: tuple(s.get(off, p) for p in range(N_SIDES))   # noqa: E731
        live = self.begin_state is not None
        source = (session_dice(self.app).state() if live else self.rng_state)["source"]
        return NewGameConfig(scenario=self.scenario.upper(), controls=per(OFF_CONTROL), levels=per(OFF_LEVEL),
                             cards=per(OFF_CARD), enhanced=per(OFF_ENH),
                             names=tuple(s.name(p) for p in range(N_SIDES)),
                             options=GameOptions.from_words(self.words), army_set=int(cfg.alt_names),
                             seed=cfg.seed, rng=source, greatest=s.get(TOP_LEVEL),
                             setup_rolls=() if live else tuple(self.rolls),
                             rng_state=None if live else self.rng_state, random_flag=s.get(SAVE_MAP))

    def begin(self) -> None:
        """ovl57:0cfe."""
        s = self.sides
        if not any(s.alive(p) and s.get(OFF_LEVEL, p) != LEVEL_OFF for p in range(N_SIDES)):
            effects.chord(self.app)                      # ovl57:0d36
            return self.refresh()
        k = kit(self.app)
        from ..audio import music_triggers
        music_triggers.pre_game(self.app, 0xB, "ovl57:0e24")   # INT22 (19, 0), no die
        self.face(BEGIN_SPEECH, lambda: self._start(k))  # ovl57:0e2c: ovl58:026f(1)

    def _start(self, k) -> None:
        self.options_path(k).write_bytes(struct.pack("<10h", *self.words))     # ovl57:2289
        under = self.app.screen.fb.copy()            # the screen ovl57:0cfe leaves up (`Game.under`)
        self.paint(under)
        more = {} if self.begin_state is None else {"begin_state": self.begin_state}   # after Load Map
        self.request("game", new_game=self.new_game_config(), overview=self.overview, under=under, **more)

    def on_button(self, id: int) -> None:
        if self.anim is not None or not self.ready:
            return
        k = kit(self.app)
        if id in CONTROL:
            self.cycle(id - CONTROL[0])
        elif id in CHAR_BOX or id in PORTRAIT:
            p = id - (CHAR_BOX[0] if id in CHAR_BOX else PORTRAIT[0])
            if self.sides.alive(p):
                registry.open_dialog("setup_side", self, sides=self.sides, side=p,
                                     on_close=lambda r: self.refresh())
            else:
                self.refresh()
        elif id == BEGIN:
            self.begin()
        elif id == MAIN_MENU:
            self.request("menu")
        elif id in (GREATEST, GREATEST_OFF):
            self.greatest(id == GREATEST)
        elif id in PRESET_IDS:
            apply_preset(self.words, presets(k.exe)[id - PRESET_IDS[0]])
            self.refresh()
        elif id == EDIT_OPTIONS:
            registry.open_dialog("options", self, words=self.words, on_close=lambda r: self.refresh())
        elif id == RECALL:
            self.recall(k)
            self.refresh()
        elif id == RANDOM_CHARS:
            self.random_characters()
        else:
            registry.run_action(id, self)

    def step(self, events, dt):
        if self.anim is not None:
            p, old, n, left = self.anim                     # each frame: ovl59:0000(1)
            if left > 1:
                self.anim = (p, old, n, left - 1)
            else:
                self.anim = (p, old, n + 1, tick_frames(1, self.app.cfg.tick_hz, n)) if n < 3 else None
            return
        super().step(events, dt)

    # ------------------------------------------------------------------ drawing

    def paint(self, fb: pygame.Surface) -> None:
        k = self._kit()
        exe = k.exe
        blit_opaque(fb, k.picture(SCREEN_PIC), (0, 0), None)
        if self.ready:
            x, y, w, h = ds_words(exe, MAP_AREA, 4)
            blit_opaque(fb, k.picture(MARBLE), (x, y), (0, 0, w, h))
            for p in range(N_SIDES):
                self.draw_side(fb, k, p)
            self.draw_rating(fb, k)
            blit_opaque(fb, k.picture(SSG), ds_words(exe, SSG_AT, 2), ds_words(exe, SSG_SRC, 4))
            f = k.fonts[CHANCE17]
            for j, line in enumerate(self.quote):
                text_centred(fb, f, *ds_words(exe, QUOTE_AT + 4 * j, 2), line, INK, SHADOW)
            for g, i, at in HEADINGS:
                text_centred(fb, f, *at, k.text.S(g, i), INK, SHADOW)
            self.buttons.draw(fb)
        self.bar.draw(fb)

    def draw_rating(self, fb, k) -> None:
        """ovl57:0bab."""
        x, y, w, h = ds_words(k.exe, RATING_BOX, 4)
        mx, my = RATING_MARBLE
        blit_opaque(fb, k.picture(MARBLE), (x, y), (x - mx, y - my, w, h))
        text_centred(fb, k.fonts[CHANCE17], *ds_words(k.exe, RATING_AT, 2),
                     k.text.S(*RATING_TEXT, self.rating()), INK, SHADOW)

    def draw_side(self, fb, k, p: int) -> None:
        """ovl57:0634(p)."""
        exe, s, f = k.exe, self.sides, k.fonts[CHANCE17]
        a0, b0 = s.get(OFF_A0, p), s.get(OFF_B0, p)
        x, y, w, h = ds_words(exe, BOXES + 8 * p, 4)
        ox, oy, ow, oh = x - 1, y - 1, w + 2, h + 2
        ix, iy, iw, ih = x + 1, y + 1, w - 2, h - 2
        pygame.draw.rect(fb, a0, (x, y, w, h), 1)
        for r in ((ox, oy, ow, 1), (ox, oy, 1, oh), (ix, iy + ih - 1, iw, 1), (ix + iw - 1, iy, 1, ih)):
            fb.fill(a0, r)
        for r in ((ix, iy, iw, 1), (ix, iy, 1, ih), (ox, oy + oh - 1, ow, 1), (ox + ow - 1, oy, 1, oh)):
            fb.fill(b0, r)
        name = s.name(p)
        nx, ny = ds_words(exe, NAME_AT + 4 * p, 2)
        fb.fill(PAPER, (nx - 4, ny, f.width(name) + 8, 20))
        f.draw(fb, nx, ny, name, a0, b0)
        card = s.get(OFF_CARD, p)
        d = 4 if s.human(p) else s.get(OFF_LEVEL, p)
        if s.get(OFF_CONTROL, p) == COMPUTER and card != 0:
            d = s.get(OFF_LEVEL, p) + 7
        if d == 4 and p % 2 == 1:
            d = 5
        if not s.alive(p):
            d = 6
        pic = k.picture(SETUPBU)
        blit_opaque(fb, pic, ds_words(exe, PORTRAIT_AT + 4 * p, 2), ds_words(exe, PORTRAIT_SRC + 8 * d, 4))
        if d >= 7:
            d -= 7
        d = {5: 4, 6: 3}.get(d, d)
        lx, ly, lw, lh = ds_words(exe, LABEL_SRC + 8 * d, 4)
        if self.anim is not None and self.anim[0] == p:          # ovl57:0a4e frames
            _, old, n, _ = self.anim
            lx, ly, lw, lh = ds_words(exe, LABEL_SRC + 8 * old, 4)
            ly += n * lh
        blit_opaque(fb, pic, ds_words(exe, LABEL_AT + 4 * p, 2), (lx, ly, lw, lh))
        blit_opaque(fb, pic, ds_words(exe, CHECK_AT + 4 * p, 2),
                    ds_words(exe, CHECK_SRC + 8 * int(card == 0), 4))
        f.draw(fb, *ds_words(exe, CHAR_AT + 4 * p, 2), ds_str(exe, CHARACTER), a0, b0)
