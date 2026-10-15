"""Save Game, Load Game and New Game of ovl49, the engine side (docs/plan.md M10b, EL "Save /
Load / Quit (ovl49)").

The file format is ours (plan register X12); what the file holds, what a load keeps from the
running program and what a load does afterwards are the EXE's:

* `saved_part(state, record)`: exactly the blocks ovl49:0a46 writes (DS:5d64, the 0x54-byte
  scenario record; the SCN 2c04:0000; map words and the 1000 army records 1e1d:0000; the road
  layer 19d9:0000; the explored layer of handle DS:1270; CURRENT.SGN; CURRENT.HST; the eight AI
  blocks and the neighbour table of ovl29:0da9), as plain data.
* `run_part(state)` / `fresh_run_part(...)`: what a load leaves as the running program has it
  (the dice stream, the AI process words, heap buffers, DGROUP words), from the previous game of
  this run or as a fresh run has them.
* `load(saved, run, ...)`: ovl49:0414 in its order, the failed open included (D3);
  `after_load(state, ...)`: what ovl49:02d3 does after 0414 (recounts, map words, cost map,
  present points of the screen).
* `new_game(state)`: the state part of New Game ovl49:0203.

Not modelled (no engine state): 0997:0066 / 034a (picture cache), ovl64:1927 / 1931 (DGROUP
bits DS:6469 and the 9x9 tables DS:61e7 / 5f41, rules.setup's [U]), the progress scroll
(ovl17, ovl61:1471, ovl02:01b5 / 01ff), ovl63:2200 (fog mask of the overview), ovl45:1de4
(random-map heap buffer DS:4484), ovl48:0000 (the per-type table, read through
`rules.movement.type_flag`), ovl65:01ff / 0000 / 0698, ovl61:0a6e (display).
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Callable, NamedTuple

from ..model import serialize
from ..model.army import Army
from ..model.state import GameState, ProductionReport
from . import economy as EC
from . import pathfinding as P
from .constants import saveload as K
from .constants.setup import LOADER_TILE_ROLLS
from .mapwords import refresh_map
from .movement import FREE, remove_army
from .present import present
from .ruins import site_tiles
from .selection import redraw_palette

SAVE_FORMAT = 1

# The GameState fields the EXE save holds (ovl49:0a46, read back by 0414 in the same order):
SAVED_FIELDS = (
    # SCN 2c04:0000, 0x2ee1 bytes (written ovl49:0ae3, read 063c)
    "players", "cities", "sites", "items", "heroes", "monsters", "fight_order", "options",
    "turn", "current", "relations", "news", "flags",
    # map words + army records 1e1d:0000 (0xde70), road layer 19d9:0000, explored layer
    # (handle DS:1270), CURRENT.SGN; World.terrain_of_tile is SCN 0x710
    "world", "armies",
    "history",                          # CURRENT.HST
    "ai",                               # ovl29:0da9: 8 blocks x 0x42c, neighbour table 0x4b0
    # TERRAIN<SCN 0x161>/HERONAM<p>.DAT, re-read by the EXE at every name draw (ovl47:0c67):
    # the same bytes either way, so it rides with the saved part
    "hero_names",
)

# The GameState fields a load leaves as the running program has them (heap and DGROUP words):
RUN_FIELDS = (
    "army_types",                       # heap DS:0e88 / 447c, loaded once per run
    "reveal_at_first_human_turn",       # DS:16a6
    "overview_mountain_rolls",          # ovl63:232b's bitmap, kept unless 232b runs again
    "cost_map",                         # DS:3f82 (rebuilt by after_load)
    "path_cache",                       # DS:3f7e (cleared by the game load, 0555:0350)
    "dist_table",                       # DS:3f86
    "selection",                        # DS:5e62 / 5e5e / 5e3e nulled by 0414, the rest kept
    "battle_work",                      # DS:41fa..436a, DS:4160
    "advisor_talking", "advisor_digital", "advisor_groups",   # session settings
    "income_cache", "upkeep_cache", "city_counts",            # DS:5dca / 5dda / 5dea (recounted)
)

WHERE = ("game", "game_start", "setup")   # DS:2a86 set; DS:28c6 set; neither (Game Setup screen)


def saved_part(state: GameState, record: dict) -> dict:
    """What the save ovl49:0a46 writes, as plain data: the scenario record DS:5d64 (`record`, a
    `formats.scenario.parse_scenario_header` dict; +0x3c is the scenario directory DS:5da0 that
    the .CTY descriptions use, +0x44 the compare field of the load's overview rebuild) and the
    state fields `SAVED_FIELDS`.  Nothing of the run (dice, caches, selection, battle arrays,
    production report, AI process words) is in it.  The save changes no game state.
    Evidence: asm ovl49:0a46..0d60: 070b:004e (ah=40h, write) at 0ad1 / 0ae3 / 0af5 / 0b07 /
    0b29 of DS:5d64 (0x54), 2c04:0000 (0x2ee1), 1e1d:0000 (0xde70), 19d9:0000 (0x4440), the
    buffer of handle DS:1270 (0x4440); 0b46..0d3c CURRENT.SGN, [RANDOM.SPC / RANDOM.CTY when
    SCN 0x120, 0bbe / 0c46], CURRENT.HST as length + bytes; 0d4b (map flag 0) ovl29:0da9 (8
    blocks of 0x42c and the 0x4b0-byte neighbour table, 070b:004e at 0dcb / 0dee).  A
    random-map game (SCN 0x120) is refused until M11, which adds the two text files."""
    if state.pending is not None:
        raise ValueError("no save while a question is pending (the dialogs are modal)")
    if state.flags.get(K.SCN_RANDOM_MAP.value, 0):
        raise NotImplementedError("a random-map game also saves RANDOM.SPC / RANDOM.CTY "
                                  "(ovl49:0bbe / 0c46): M11")
    d = serialize.dump(state, rng=False)
    return {"format": SAVE_FORMAT, "state_format": serialize.FORMAT, "record": dict(record),
            "state": {k: d[k] for k in SAVED_FIELDS}}


@dataclass
class RunPart:
    """What a load keeps from the running program.  `fields`: the `RUN_FIELDS` as plain data
    (serialize's form).  `rng`: the run's one dice stream (DS:3d84, ovl59:02bf), continued.
    `process`: the run's `model.ai.AiProcess` (DS:0832 ...), None = a fresh run.
    `production_report`: the heap block DS:4464 (ovl43, allocated once per run).
    `armies`: the army table 1e1d:8880 as the last game left it (plain data), which a Begin
    keeps but for owner / x / y (ovl53:00c1..00fe; `begin_carry`); a load reads it from the
    file instead.  None = a fresh run (BSS).
    The ovl49 / ovl51 words DS:128c / 128e / 1290 and the list name buffer DS:483c are the
    dialog's (persist / ui), and DS:0a54 / DS:5c38 live on the App."""
    fields: dict
    rng: Any
    process: Any = None
    production_report: ProductionReport | None = None
    armies: list | None = None


def run_part(state: GameState) -> RunPart:
    """The run part of a load in a run that had `state` as its last game (or the Game Setup
    screen's scenario): its heap buffers and DGROUP words, its dice stream and AI process words
    (the same objects: the run has one of each) and its production report block.
    Evidence: asm ovl49:0414..093a reads only DS:5d64, 2c04, 1e1d, 19d9, the DS:1270 buffer,
    the scenario text files and (0dff) the AI blocks; everything else keeps the run's value
    (EL "Save / Load / Quit", What a load keeps)."""
    d = serialize.dump(state, rng=False)
    return RunPart({k: d[k] for k in RUN_FIELDS}, state.rng, state.ai.proc, state.production_report,
                   d["armies"])


def fresh_run_part(rng, army_types, advisor_talking: int = 0, advisor_digital: int = 0,
                   advisor_groups: dict | None = None, process=None) -> RunPart:
    """The run part of a load in a fresh run of the program: the BSS / EXE-image values (zero
    selection words and battle arrays, no search field, no cost map, a cleared path cache, zero
    caches and city counts, no overview bitmap, DS:16a6 = 0), the army types as the run loads
    them on first use (FILE.DAT (21, DS:26c4) with the loaded SCN 0x161: the caller reads
    them), the session's advisor settings, the run's AI process (`process`: pass the App's
    `AiProcess`; its `allocated` 0 makes the AI read draw the 0519 dice; None, for tests, gets
    a new one at the AI read) and an empty report block.
    `rng`: the run's dice stream; the EXE seeds it from the clock at the first roll (EL §2), the
    stand-in is `rules.rng.Rng(cfg.seed, cfg.rng)` (plan register X49).
    Evidence: EXE image zeros (file 0x33250 + DS) of DS:5dfe..5e62, 41fa..436a, 4160, 16a6,
    5dca / 5dda / 5dea; 0555:0350 needs DS:00de (never allocated: the cache stays zero);
    ovl43:076d allocates DS:4464 with count 0 (07aa)."""
    st = GameState(world=None, players=[], cities=[], sites=[], items=[], armies=[], heroes=[],
                   monsters=[], army_types=list(army_types), fight_order=[], options=None,
                   turn=0, current=0, relations=[], rng=None,
                   advisor_talking=advisor_talking, advisor_digital=advisor_digital,
                   advisor_groups=dict(advisor_groups or {}))
    fields = {k: serialize.plain(getattr(st, k)) for k in RUN_FIELDS}
    return RunPart(fields, rng, process, ProductionReport())


def _null_selection(state) -> None:
    sel = state.selection
    sel.selected, sel.hero, sel.moving = -1, -1, []


def _bss_record(i: int) -> Army:
    """An army record never allocated in this game (rules.movement.alloc_army's append)."""
    return Army(id=i, type_id=0, owner=FREE, x=-1, y=-1, allowance=0, moves_left=0, strength=0,
                home_city=0, hero_slot=0, medals=0, upkeep=0, flags=0, vector_dest=0, transit=0,
                group=0, goto=(-1, -1))


def wipe(state: GameState) -> None:
    """The writes of ovl49:0414 on the live game before it opens the file: army records 0..9
    get owner 0x0f and x = y = -1 (their other bytes stay; a record not yet in the table is the
    BSS one), DS:5e5e, DS:5e62 and DS:5e3e[0..7] are nulled (the other selection words stay),
    and ovl64:113b resets the explored layer and the road bits (`rules.setup`'s explored map).
    On a good open the file overwrites all of it but the selection pointers; on a failed open
    (D3) it stays on the live game.
    Evidence: asm ovl49:0458..04a5 (records 0..9: 046d +5 = 0x0f, 0490 +2 = -1, 0499 +0 = -1),
    04a7..04ae (dword 5e5e, 5e62 = 0), 04b2..04d7 (5e3e + 4i, i < 8), 05d4 ovl64:113b; ovl64:113b..1297."""
    from .setup import explored_map
    n, (x, y) = K.WIPED_RECORDS.value, K.WIPED_XY.value
    while len(state.armies) < n:
        state.armies.append(_bss_record(len(state.armies)))
    for a in state.armies[:n]:
        a.owner, a.x, a.y = K.WIPED_OWNER.value, x, y
    _null_selection(state)
    explored_map(state)


def merge(saved: dict, run: RunPart) -> GameState:
    """The game ovl49:0414 has after a good open and read: the saved part over the run part,
    the selection pointers null (the wipe before the read; the file does not hold them) and SCN
    0x130 = 1 (Save Map stays off for a loaded game).  The AI process is a fresh one until the
    AI read (`load`'s `ai_read`) attaches the run's.
    Evidence: asm ovl49:04a7..04d7 (pointers), 0623..088e (the reads: DS:5d64, 2c04, 1e1d, 19d9,
    DS:126c, CURRENT.SGN, [RANDOM.SPC / .CTY], CURRENT.HST), 0891..0896 (SCN 0x130 = 1)."""
    if saved.get("format") != SAVE_FORMAT or saved.get("state_format") != serialize.FORMAT:
        raise ValueError("unknown save format %r / %r" % (saved.get("format"), saved.get("state_format")))
    d = dict(run.fields)
    d.update(saved["state"])
    d.update(format=serialize.FORMAT, pending=None, rng=None)
    st = serialize.load(d, rng=run.rng)
    st.production_report = run.production_report if run.production_report is not None else ProductionReport()
    _null_selection(st)
    off, v = K.SCN_LOADED.value
    st.flags[off] = v
    return st


def needs_rebuild(saved_record: dict, live_record: dict | None, where: str, rebuild: bool = False) -> bool:
    """Whether the load runs ovl63:232b (the overview bitmap, 256 new dice): with `rebuild`
    (Load Map) or when the compare string differs from the loaded record's +0x44 field (DS:5da8).
    The compare string is DS:129f ("") on the Game Start screen (DS:28c6) or without a game
    screen (DS:2a86 == 0), else the live record's +0x44 (`live_record`, DS:5d64 as it is in
    memory: the game's record in a game).
    Evidence: asm ovl49:0424..0441 (compare string), 08e3..08fe (rebuild flag, strcmp
    0000:4a40 with DS:5da8, ovl63:232b)."""
    if where not in WHERE:
        raise ValueError(where)
    live = "" if where != "game" or live_record is None else live_record["str_44"]
    return bool(rebuild) or live != saved_record["str_44"]


def overview_rolls(state: GameState) -> None:
    """ovl63:232b's dice: 256 rnd(1, 3, 1) from the run's stream into the overview bitmap's
    mountain colours (`GameState.overview_mountain_rolls`).
    Evidence: asm ovl63:2479..2489 (rules.constants.setup LOADER_TILE_ROLLS)."""
    count, roll = LOADER_TILE_ROLLS.value
    state.overview_mountain_rolls = [state.rng.rnd(*roll) for _ in range(count)]


class Loaded(NamedTuple):
    state: GameState
    rebuilt: bool                # ovl49:0414's return value (232b ran)
    record: dict                 # DS:5d64 afterwards (the file's, or the live one on a failed open)


def load(saved: dict | None, run: RunPart | None = None, *, where: str = "game",
         live_record: dict | None = None, live: GameState | None = None,
         ai_read: Callable[[GameState], None] | None = None) -> Loaded:
    """ovl49:0414(slot, 1, 0), the game load, in the EXE's order.  `saved`: the file's saved
    part, None for a failed open (D3).  `run`: the run part.  `where`: "game" (DS:2a86),
    "game_start" (DS:28c6) or "setup".  `live_record`: DS:5d64 in memory now.
    `live`: the live game (only for a failed open, which works on it in place).
    `ai_read(state)`: the AI read ovl29:0dff, the hook point for `ai.cards.load_draws(state,
    cards, run.process)` (rules may not import ai): its first ovl25:056c runs 0519 with the
    dice when the run's DS:0832 is 0; None (tests only) attaches the run's process without
    those draws.  Either way DS:0832 is 1 afterwards, as 0dff leaves it.
    Order: wipe (of it only the selection pointers outlive the read; the live game itself is
    not touched on a good open), read, SCN 0x130, AI read, path cache clear (0555:0350 at
    the end of 0dff), the overview rebuild (`needs_rebuild`, 256 dice after the AI's).
    A failed open skips from the open to 08b1: the wipe stays on `live`, no SCN 0x130, no AI
    read, no path-cache clear; the rebuild compares DS:5da8 with itself (in a game: no
    rebuild; from the Game Start / Setup screens: when the live record's +0x44 is not "").
    Evidence: asm ovl49:0414..093a (0458..05d4 wipe, 0612..0620 open and jump to 08b1,
    0623..088e reads, 0891 SCN 0x130, 089d..08a4 game -> ovl29:0dff, 08e3..0903 ovl63:232b,
    0908..0915 SCN 0x120 -> ovl45:1de4); ovl29:0dff..0e59 (0e51 0555:0350)."""
    if saved is None:
        if live is None:
            raise ValueError("a failed open works on the live game (none given)")
        wipe(live)
        record = live_record
        st = live
    else:
        if run is None:
            raise ValueError("a load needs the run part")
        st = merge(saved, run)
        if ai_read is None:
            from ..model.ai import AiProcess
            st.ai.attach(run.process if run.process is not None else AiProcess(), carry=False)
        else:
            ai_read(st)
        st.ai.allocated = 1                  # DS:0832 after 0dff: 04c5 (04c9) or already 1
        P.clear_cache(st)
        record = saved["record"]
    rebuilt = False
    if record is not None and needs_rebuild(record, live_record, where):
        overview_rolls(st)
        rebuilt = True
    return Loaded(st, rebuilt, record)


def after_load(state: GameState, rebuilt: bool, where: str = "game") -> None:
    """ovl49:02d3 after a load (0414 returned `rebuilt`), from `where` ("game", "game_start",
    "setup"): the recounts 03f9 -> 02bf -> 0372 (0372 reads 03f9's counts), the site tiles
    ovl35:09f2(SCN 0x110), the map words ovl62:0000, the cost map 0555:0d9e(SCN 0x110, 1); then
    the screen: present points "load_blank" (ovl61:0a6e + ovl65:0698 when in a game and the
    overview was rebuilt), "view_setup" (ovl65:0000 from the Game Start / Setup screens),
    "game_screen" (ovl61:0000(DS:28c6, 0): frame first from the Game Start screen, map,
    overview, info cell, palettes and menu refresh; its ovl66:0356 is `redraw_palette`), two
    "strip" points (ovl68:0952(1, 0), (0, 0)), the "message" STRING (47, 1) with the side's
    name (ovl61:10fb, waits for a key), "map" (ovl64:006c), "frame_off" (ovl62:0af3) and
    "music" mode 1 (ovl58:0000(1); M10c, register X32).  The host sets DS:2a86 = 1 (inside
    ovl61:0000) and DS:28c6 = 0 (03a7).  No turn start, no main-loop pass: the human phase of
    SCN 0x110 goes on as saved.
    Evidence: asm ovl49:0332 ovl48:0000; 0337..0349 (2a86 and rebuilt -> 0a6e, 0698); 034e..035c
    (28c6 or not 2a86 -> ovl65:0000); 0361 / 0366 / 036b ovl62:03f9 / 02bf / 0372; 037a
    ovl35:09f2; 0380 ovl62:0000; 0391 0555:0d9e; 039f ovl61:0000; 03b0 / 03bb ovl68:0952;
    03d6..03f8 sprintf + ovl61:10fb; 0400 ovl64:006c; 0405 ovl62:0af3; 040c ovl58:0000(1);
    ovl61:0000..011e (008f ovl66:0356 with new-game 0)."""
    if where not in WHERE:
        raise ValueError(where)
    if where == "game" and rebuilt:
        present("load_blank", at="ovl49:0344")
    if where != "game":
        present("view_setup", at="ovl49:035c")
    EC.refresh_cities(state)
    EC.refresh_upkeep(state)
    EC.refresh_income(state)
    site_tiles(state, state.current)
    refresh_map(state)
    P.rebuild_cost_map(state)
    present("game_screen", at="ovl49:039f", from_game_start=where == "game_start")
    redraw_palette(state)
    for args, at in zip(K.LOAD_STRIP.value, ("ovl49:03b0", "ovl49:03bb")):
        present("strip", at=at, args=args)
    g, i = K.LOAD_MESSAGE.value
    present("message", group=g, index=i, args=(state.players[state.current].name,), wait=None)
    present("map", at="ovl49:0400")
    present("frame_off", at="ovl49:0405")
    present("music", at="ovl49:040c", mode=K.LOAD_MUSIC_MODE.value)


def new_game(state: GameState, ai_setup: Callable[[GameState], None] | None = None) -> None:
    """New Game (menu 500 / Alt+N, confirmed: ovl49:019d -> 0203) on the live game: every army
    record freed (0b62:03be), the map words rebuilt (ovl62:0000), the explored layer and road
    bits reset (ovl64:113b), then the present point "frame_off" (ovl62:0af3) and "game_start"
    (ovl60:0000(1): the Game Start screen, DS:28c6 = 1, music mode 0 and the talking face
    ovl58:026f(2), which rolls rnd(1, 30, 10) only when the advisor talks: it returns at once
    when DS:26c8 != 0, 0293..029a), then the AI set-up ovl25:0519 on this game's SCN
    (`ai_setup(state)` = `ai.cards.setup_all(state, cards)`, its dice after the face's if any;
    a host that shows the Game Start screen itself calls it after the face).  The host sets
    DS:2a86 = 0 and DS:166a = 0.  The state stays the run's memory: a later load and a later
    Begin both take its run part (`run_part`: dice, AI process and heap blocks, path cache,
    search field, battle arrays, selection words, caches, report block, army table and types;
    `rules.setup.new_game(run=)`, `begin_carry`).
    Evidence: asm ovl49:0203..026a (0207 ovl45:1de4; 020c..022f 0b62:03be for i < 0x3e8; 0231
    ovl62:0000; 0236 / 023b ovl64:1927 / 1931; 0240 ovl65:01ff; 0245 ovl64:113b; 024a / 0250
    DS:2a86 / 166a = 0; 0256 ovl62:0af3; 025d ovl60:0000(1); 0263 ovl25:0519); ovl60:0000..011d
    (002f DS:28c6 = 1, 00fd ovl58:0000(0), 0109 ovl58:026f(2)); ovl58:0293..029a."""
    from .setup import explored_map
    for a in state.armies:
        remove_army(state, a)
    refresh_map(state)
    explored_map(state)
    present("frame_off", at="ovl49:0256")
    present("game_start", at="ovl49:025d")
    if ai_setup is not None:
        ai_setup(state)


# Begin keeps these of the run's memory (EL §10.7): every RUN_FIELDS word but the overview
# bitmap, which the scenario loader always rebuilds (ovl57:0194 -> ovl63:232b, before Begin).
BEGIN_FIELDS = tuple(k for k in RUN_FIELDS if k != "overview_mountain_rolls")


def begin_carry(state: GameState, run: RunPart) -> None:
    """A Begin in a run that had a game (`run` = `run_part` of that game, after New Game or not):
    the new game's state starts with the run's memory where the EXE has no writer before the
    words are read: path cache DS:3f7e (0555:0350 runs only at allocation 034b and in the load
    0e51), search field DS:3f86, cost map, battle arrays DS:41fa..436a and DS:4160, selection
    words (DS:5dfe / 5e00 / 2bda / 5dfc / 5dfa / 3250 / 6862 / 6842 / 6852; ovl53 nulls only the
    pointers), the caches DS:5dca / 5dda / 5dea (no new-game path calls 0372 / 02bf / 03f9),
    DS:16a6 (ovl53 writes it only to set it), the army type table (loaded once per run), the
    session's advisor words, the report block DS:4464 and the army table (its records keep
    every byte; ovl53 then sets owner 0xff, x = y = -1, `rules.setup.new_game`).  Called by
    `rules.setup.new_game(run=)` right after the state is built, so the set-up steps overwrite
    what the EXE's overwrite (the cost map, the search field by the territories' distance maps,
    the explored layer, ...).
    Evidence: grep of out/asm for the writers of these words: none in ovl57 (loader, Begin),
    ovl61:0000..011e / 1732 / 17f6, ovl53:0000 but 007c (DS:16a6 = 1 with Hidden Map and one
    human) and 0100..0120 (DS:5e5e, 5e62, 5e3e[0..7] = 0); 0555:0350 callers 0555:034b and
    ovl29:0e51 only; ovl44:112f (`cmp dword [0xe88], 0`: the type table read once)."""
    d = serialize.dump(state, rng=False)
    d.update({k: run.fields[k] for k in BEGIN_FIELDS})
    if run.armies is not None:
        d["armies"] = run.armies
    tmp = serialize.load(d, rng=state.rng)
    for k in BEGIN_FIELDS + ("armies",):
        setattr(state, k, getattr(tmp, k))
    if run.production_report is not None:
        state.production_report = run.production_report

