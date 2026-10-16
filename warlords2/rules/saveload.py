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

Random maps (M11 package E):

* A random-map game (SCN 0x120 != 0) saves RANDOM\\RANDOM.SPC and RANDOM\\RANDOM.CTY as they
  are on disk (`saved_part(..., random_texts=)`), and its load hands them back
  (`Loaded.random_texts`) for the host to write over those files: the descriptions come from
  there afterwards (ovl45:1de4 drops the description buffer, `rules.descriptions`).
* `map_part(state, record)`: SAVE\\RMAPTEMP.DAT (ovl49:11f3 = 0a46(NULL, 1, ...)), the snapshot
  right after a generation, a save without the AI blocks; Save Map (1214 / 13c2 / 1463) copies
  that file to SAVE\\RMAP<n>.DAT byte for byte (0d61, the host's).  `save_map_allowed` = 1214's
  gate.
* `load_map(saved, run)` = 0414(e, 0, 1); the rest of 12f2: `after_load_map(state)`
  (recounts, cost map), `map_setup_entry(state, random_flag)` (ovl57:0000(0, 1, 0, 1)'s music
  mode 0 at 003a and SCN 0x120 = DS:28c8), the host's Setup screen, `map_setup_done(state)`
  (13b7).  Begin from there is `rules.setup.begin` on the loaded state.
* `rules.descriptions.DescCache` (DS:0fc0 / 4484, register X64) is dropped by `new_game` and
  by a load whose SCN 0x120 != 0 (`descriptions=`).

Not modelled (no engine state): 0997:0066 / 034a (picture cache), ovl64:1927 / 1931 (DGROUP
bits DS:6469 and the 9x9 tables DS:61e7 / 5f41, rules.setup's [U]), the progress scroll
(ovl17, ovl61:1471, ovl02:01b5 / 01ff), ovl63:2200 (fog mask of the overview), ovl48:0000 (the per-type table, read through
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
from . import music as MU
from .movement import FREE, remove_army
from .present import present
from .descriptions import DescCache, drop as drop_descriptions
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

# A map file (0a46 with map_flag 1: ovl49:0d44..0d4b skips ovl29:0da9) holds these:
MAP_FIELDS = tuple(k for k in SAVED_FIELDS if k != "ai")

KINDS = ("game", "map")                  # `kind` of a saved part (absent in M10b files: "game")
TEXTS = tuple(name for name, _ in K.RANDOM_TEXTS.value)     # ("SPC", "CTY"), in file order


def _random_game(flags: dict) -> bool:
    return bool(flags.get(K.SCN_RANDOM_MAP.value, 0))


def _texts(random_texts) -> list:
    """The two text blocks as the save writes them (0bbe SPC, then 0c46 CTY), as plain data:
    [[name, hex of the file's bytes], ...]."""
    if random_texts is None:
        raise ValueError("a random-map game (SCN 0x120) saves RANDOM.SPC / RANDOM.CTY "
                         "(ovl49:0bbe / 0c46): pass random_texts")
    out = []
    for name in TEXTS:
        b = random_texts.get(name)
        if not isinstance(b, (bytes, bytearray)):
            raise ValueError("random_texts[%r]: the bytes of RANDOM.%s" % (name, name))
        out.append([name, bytes(b).hex()])
    return out


def _write(state: GameState, record: dict, kind: str, fields: tuple, random_texts) -> dict:
    """ovl49:0a46(desc, map_flag, path) as plain data (see `saved_part` / `map_part`)."""
    if state.pending is not None:
        raise ValueError("no save while a question is pending (the dialogs are modal)")
    d = serialize.dump(state, rng=False)
    out = {"format": SAVE_FORMAT, "state_format": serialize.FORMAT, "kind": kind,
           "record": dict(record), "state": {k: d[k] for k in fields}}
    if _random_game(state.flags):                       # 0bbe / 0c46 test the live SCN
        out["random_texts"] = _texts(random_texts)
    return out


def saved_part(state: GameState, record: dict, *, random_texts=None) -> dict:
    """What the save ovl49:0a46 writes, as plain data: the scenario record DS:5d64 (`record`, a
    `formats.scenario.parse_scenario_header` dict; +0x3c is the scenario directory DS:5da0 that
    the .CTY descriptions use, +0x44 the compare field of the load's overview rebuild) and the
    state fields `SAVED_FIELDS`.  Nothing of the run (dice, caches, selection, battle arrays,
    production report, AI process words) is in it.  The save changes no game state.
    A random-map game (SCN 0x120 != 0) also holds RANDOM\\RANDOM.SPC and RANDOM\\RANDOM.CTY as
    they are on disk now: `random_texts` = {"SPC": bytes, "CTY": bytes} (the host reads them
    from its RANDOM overlay, register X55), kept as "random_texts" [[name, hex], ...] in the
    save's order (SPC, CTY); without them such a save raises ValueError (register X65: the
    EXE never tests these handles, 0b50 / 0bd8 / 0c60 / 0cdb `mov di, ax; push ax; lcall
    070b:00a9` [V], so a missing file is a write of what the lseek of a bad handle returns,
    which the DOS runtime decides; not reachable while the generator and every random-game
    load write both).  For any other game
    `random_texts` is not read (the EXE does not open the files).
    Evidence: asm ovl49:0a46..0d60: 070b:004e (ah=40h, write) at 0ad1 / 0ae3 / 0af5 / 0b07 /
    0b29 of DS:5d64 (0x54), 2c04:0000 (0x2ee1), 1e1d:0000 (0xde70), 19d9:0000 (0x4440), the
    buffer of handle DS:1270 (0x4440); 0b46..0d3c CURRENT.SGN, [RANDOM.SPC (FILE.DAT (0x22, 0))
    at 0bbe, RANDOM.CTY ((0x23, 0)) at 0c46, each only when SCN 0x120: open mode 2, length by
    070b:00a9, 4-byte length then the bytes], CURRENT.HST as length + bytes; 0d4b (map flag 0)
    ovl29:0da9 (8 blocks of 0x42c and the 0x4b0-byte neighbour table, 070b:004e at 0dcb /
    0dee)."""
    return _write(state, record, "game", SAVED_FIELDS, random_texts)


def map_part(state: GameState, record: dict, *, random_texts=None) -> dict:
    """SAVE\\RMAPTEMP.DAT as ovl49:11f3 writes it right after a random map's generation and
    load (ovl57:10e8 step 9): 0a46(NULL, map_flag 1, FILE.DAT (27, 0)): no slot table (desc
    NULL), the blocks of `saved_part` but no AI blocks (`MAP_FIELDS`), marked kind "map".
    `state` is the memory at that point, `rules.setup.loaded_state(generated scenario, ...)`:
    the SCN, map words and roads the scenario loader read from RANDOM\\RANDOM.SCN / .MAP / .RD
    (ovl57:0194 reads only these: 0285 / 0386 / 03fa), the army table and the explored layer as
    the run left them (the loader writes neither: no ovl64:113b in ovl57 [V grep]; Begin's
    ovl53:0135 resets the explored layer), the signs = CURRENT.SGN as it is on disk then (the
    run's last game's, not RANDOM.SGN: 0a46 saves CURRENT.SGN at 0b46 and no loader reads a
    .SGN; Begin replaces them from DS:5da0's .SGN by ovl13:0103, quirk Q3, register X63:
    after Load Map that is RANDOM\\RANDOM.SGN of the last generation, so the map's own signs
    are never used), `history` = CURRENT.HST as it is on disk then (the previous game's).
    The record is DS:5d64 after 10e8 (+0x3c and +0x14 "random", ovl57:11e2..11f6; +0x44 the
    map id; the rest stale).
    SCN 0x120 is still the template's 0 there (ovl57:007f sets it after 10e8 returns), so the
    snapshot holds no SPC / CTY; the 0bbe / 0c46 test is kept as in `saved_part` all the same.
    Save Map (1463) copies this file to SAVE\\RMAP<n>.DAT byte for byte (0d61): the saved map
    is the generation snapshot, not the game being played.
    Evidence: asm ovl49:11f3..1213 (0a46(0, 1, ovl59:0505(0x1b, 0))), 0a46..0a7a (desc NULL:
    no slot table), 0a7a..0a8e (map flag: the given path), 0d44..0d4b (map flag: no ovl29:0da9),
    0bbe / 0c46; ovl57:10e8 (11f3 before 007f)."""
    return _write(state, record, "map", MAP_FIELDS, random_texts)


def save_map_allowed(flags: dict, game_start: bool) -> bool:
    """ovl49:1214's gate (Save Map 503 / Alt+M lists the slots, else does nothing): SCN 0x130 ==
    0 (no load since the last Begin or scenario load: 0414 sets it at 0896, Begin clears it at
    ovl57:0ea7, the scenario file holds 0) and SCN 0x120 != 0 (a random map) and DS:28c6 == 0 (not
    on the Game Start screen, `game_start`).  `flags`: the SCN words (`GameState.flags`).
    Evidence: asm ovl49:121d..1234."""
    loaded, rnd = K.SAVE_MAP_GATE.value
    return not flags.get(loaded, 0) and bool(flags.get(rnd, 0)) and not game_start


@dataclass
class RunPart:
    """What a load keeps from the running program.  `fields`: the `RUN_FIELDS` as plain data
    (serialize's form).  `rng`: the run's one dice stream (DS:3d84, ovl59:02bf), continued.
    `process`: the run's `model.ai.AiProcess` (DS:0832 ...), None = a fresh run.
    `production_report`: the heap block DS:4464 (ovl43, allocated once per run).
    `armies`: the army table 1e1d:8880 as the last game left it (plain data), which a Begin
    keeps but for owner / x / y (ovl53:00c1..00fe; `begin_carry`); a load reads it from the
    file instead.  None = a fresh run (BSS).  `list_names`: the ovl51 name buffer DS:483c
    (`GameState.list_names`, the same list object: the run has one), None = a fresh run (BSS:
    empty).  `music`: the run's music words (`model.music.MusicWords`, DS:2632 / 379e / 37a9 /
    0bee / 37a3, the same object: the run has one), None = a fresh one (the EXE image values).
    The ovl49 words DS:128c / 128e / 1290 are the dialog's (persist / ui), and
    DS:0a54 / DS:5c38 live on the App."""
    fields: dict
    rng: Any
    process: Any = None
    production_report: ProductionReport | None = None
    armies: list | None = None
    list_names: list | None = None
    music: Any = None


def run_part(state: GameState) -> RunPart:
    """The run part of a load in a run that had `state` as its last game (or the Game Setup
    screen's scenario): its heap buffers and DGROUP words, its dice stream and AI process words
    (the same objects: the run has one of each) and its production report block.
    Evidence: asm ovl49:0414..093a reads only DS:5d64, 2c04, 1e1d, 19d9, the DS:1270 buffer,
    the scenario text files and (0dff) the AI blocks; everything else keeps the run's value
    (EL "Save / Load / Quit", What a load keeps)."""
    d = serialize.dump(state, rng=False)
    return RunPart({k: d[k] for k in RUN_FIELDS}, state.rng, state.ai.proc, state.production_report,
                   d["armies"], state.list_names, state.music)


def fresh_run_part(rng, army_types, advisor_talking: int = 0, advisor_digital: int = 0,
                   advisor_groups: dict | None = None, process=None, list_names: list | None = None,
                   music=None) -> RunPart:
    """The run part of a load in a fresh run of the program: the BSS / EXE-image values (zero
    selection words and battle arrays, no search field, no cost map, a cleared path cache, zero
    caches and city counts, no overview bitmap, DS:16a6 = 0), the army types as the run loads
    them on first use (FILE.DAT (21, DS:26c4) with the loaded SCN 0x161: the caller reads
    them), the session's advisor settings, the run's AI process (`process`: pass the App's
    `AiProcess`; its `allocated` 0 makes the AI read draw the 0519 dice; None, for tests, gets
    a new one at the AI read), an empty report block and the run's list name buffer DS:483c
    (`list_names`: what the pre-game lists left, the host's `RunCarry.names`; None = empty) and
    the run's music words (`music`: the host's object, which the pre-game screens' modes 0 / 11
    wrote; None = the EXE image values).
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
    return RunPart(fields, rng, process, ProductionReport(), list_names=list_names, music=music)


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
    if "ai" not in d:                    # a map file: the AI blocks stay the run's (load_map)
        from ..model.ai import AiState
        d["ai"] = serialize.plain(AiState())
    d.update(format=serialize.FORMAT, pending=None, rng=None)
    st = serialize.load(d, rng=run.rng)
    st.production_report = run.production_report if run.production_report is not None else ProductionReport()
    if run.list_names is not None:
        st.list_names = run.list_names
    if run.music is not None:
        st.music = run.music
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
    # The files the load wrote back (ovl49:0728 / 07a9, the file's SCN 0x120 != 0): {"SPC":
    # bytes, "CTY": bytes} for RANDOM\RANDOM.SPC / .CTY, which the host writes over its RANDOM
    # overlay (X55); None when the file has none (any other game, every map file, a failed open)
    random_texts: dict | None = None


def _kind(saved: dict) -> str:
    kind = saved.get("kind", "game")
    if kind not in KINDS:
        raise ValueError("unknown saved part kind %r" % (kind,))
    return kind


def _read_texts(saved: dict) -> dict:
    """ovl49:0728..081d: the SPC then the CTY block of a file whose SCN 0x120 != 0."""
    blocks = saved.get("random_texts")
    try:
        names = [name for name, _ in blocks]
        if names != list(TEXTS):
            raise ValueError
        return {name: bytes.fromhex(h) for name, h in blocks}
    except (TypeError, ValueError) as e:
        raise ValueError("a random-map game's file holds RANDOM.SPC and RANDOM.CTY "
                         "(ovl49:0728 / 07a9): none or malformed here") from e


def load(saved: dict | None, run: RunPart | None = None, *, where: str = "game",
         live_record: dict | None = None, live: GameState | None = None,
         ai_read: Callable[[GameState], None] | None = None,
         descriptions: DescCache | None = None) -> Loaded:
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
    0908..0915 SCN 0x120 -> ovl45:1de4); ovl29:0dff..0e59 (0e51 0555:0350).
    A random-map game's file (its SCN 0x120 != 0) also brings RANDOM.SPC and RANDOM.CTY, which
    the load writes back over those files (`Loaded.random_texts`; ovl49:0728..081d, open mode
    9); ovl45:1de4 then drops the description buffer (`descriptions`, the run's
    `rules.descriptions.DescCache`: dropped whenever the loaded SCN 0x120 != 0, on a failed
    open the live one's; None: not modelled), so the next city / site dialog reads them.  A map file (kind "map")
    is refused here: it is `load_map`'s."""
    texts = None
    if saved is None:
        if live is None:
            raise ValueError("a failed open works on the live game (none given)")
        wipe(live)
        record = live_record
        st = live
    else:
        if run is None:
            raise ValueError("a load needs the run part")
        if _kind(saved) != "game":
            raise ValueError("a map file is loaded by Load Map (load_map), not Load Game")
        st = merge(saved, run)
        if _random_game(st.flags):
            texts = _read_texts(saved)
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
    if _random_game(st.flags):                           # 090d..0915 (also a failed open)
        drop_descriptions(descriptions)
    return Loaded(st, rebuilt, record, texts)


def load_map(saved: dict | None, run: RunPart | None = None, *, live_record: dict | None = None,
             live: GameState | None = None, descriptions: DescCache | None = None) -> Loaded:
    """Load Map's ovl49:0414(e, 0, 1) (12f2; `saved` = the map file FILE.DAT (26, e), a
    `map_part`; None for a failed open): as `load` but
    * no AI read (game 0): ovl29:0dff is skipped, so the AI blocks stay the run's heap blocks
      (`run.process`'s, attached without the 0519 dice; DS:0832 keeps its value) and the
      neighbour table is a zero one [I: nothing reads it before Begin's set-up rebuilds it];
    * no path-cache clear (0555:0350 is inside 0dff): the path cache stays the run's;
    * the overview rebuild always (rebuild 1): the 256 rnd(1, 3, 1), also on a failed open;
    * SCN 0x130 = 1 as for games (0896 comes before the game test), so Save Map is off on
      the Setup screen of a loaded map (`save_map_allowed`); Begin clears it (ovl57:0ea7), so
      in the game of a loaded map with DS:28c8 = 1 Save Map is on again and copies RMAPTEMP,
      which 12f2's 0d61 made a copy of RMAP<e>;
    * the army table, history (CURRENT.HST), explored layer, map words, roads and signs are the
      file's (the snapshot's, `map_part`); SCN 0x120 is the file's (0: map files never hold
      SPC / CTY, so nothing is written back and 090d skips ovl45:1de4: the description buffer
      (`descriptions`) keeps whatever file was read last, of any scenario (register X64), and
      a later read takes RANDOM.CTY / .SPC as the last generation or random-game load left them
      (X58)); `map_setup_entry` then sets SCN 0x120 from DS:28c8 (ovl57:007f..0088).
    The wipe before the read and the failed open (08b1, X47 for the host) are `load`'s; on a
    failed open the 256 dice roll on `live`.
    Evidence: asm ovl49:12f2..1348 (0414(si, 0, 1)), 0414..093a: 0891..0896 SCN 0x130,
    089d..08a1 (game 0: no ovl29:0dff), 08e3..08e7 (rebuild: ovl63:232b without the strcmp),
    0728 / 07a9 (the file's SCN 0x120)."""
    texts = None
    if saved is None:
        if live is None:
            raise ValueError("a failed open works on the live game (none given)")
        wipe(live)
        st, record = live, live_record
    else:
        if run is None:
            raise ValueError("a load needs the run part")
        if _kind(saved) != "map":
            raise ValueError("Load Map reads a map file (map_part), not a saved game")
        st = merge(saved, run)
        from ..model.ai import AiProcess
        st.ai.attach(run.process if run.process is not None else AiProcess(), carry=True)
        if _random_game(st.flags):                       # 0728 / 07a9: unreachable for 11f3's files
            texts = _read_texts(saved)
        record = saved["record"]
    _game, rebuild = K.MAP_LOAD_ARGS.value
    if rebuild:                                          # 08e3..08e7: no strcmp
        overview_rolls(st)
    if _random_game(st.flags):                           # 090d..0915: a map file's is 0
        drop_descriptions(descriptions)
    return Loaded(st, bool(rebuild), record, texts)


def after_load_map(state: GameState) -> None:
    """The rest of Load Map ovl49:12f2 after 0414 (its scroll closed), up to the Setup screen:
    [0d61, the copy of SAVE\\RMAP<e>.DAT over SAVE\\RMAPTEMP.DAT: the host's (persist), so a
    later Save Map saves the loaded map]; the recounts ovl62:03f9 -> 02bf -> 0372 (the run's
    DS:5dea / 5dda / 5dca, which Begin keeps, `begin_carry`); the cost map 0555:0d9e(SCN 0x110,
    1).  No dice.  Then the host runs, in this order: `map_setup_entry` (the engine part of
    ovl57:0000(0, 1, 0, 1)), the Game Setup screen (the quotation die 0f88 and the rest of
    ovl57:0000), `map_setup_done`.
    Not here (unlike `after_load`): ovl48:0000, ovl35:09f2, ovl62:0000, ovl61:0000, the
    strips, the message, music mode 1.
    Evidence: asm ovl49:134e..1369 (0d61(FILE.DAT (26, si), (27, 0))), 136f / 1374 / 1379
    ovl62:03f9 / 02bf / 0372, 137e..138a 0555:0d9e(SCN 0x110, 1), 1392..139e ovl57:0000(0, 1,
    0, 1)."""
    EC.refresh_cities(state)
    EC.refresh_upkeep(state)
    EC.refresh_income(state)
    P.rebuild_cost_map(state)


def map_setup_entry(state: GameState, random_flag: int) -> list:
    """The engine part of ovl57:0000(0, 1, 0, 1) at Load Map (ovl49:139e), in its order: the
    music ovl58:0000(0) at ovl57:003a (no die: mode 0 has a fixed track), then SCN 0x120 =
    DS:28c8 at 007f (`random_flag`, the Game Start screen's random flag as last left,
    `rules.randmap.RandomRun.random`; quirk Q2, register X58, reproduced).  The rest of that
    call is the host's Setup screen, entered right after this: picture cache, frame, bar, no
    popup (si = 1), no generator and no scenario loader (aA = 0), the tutorial test SCN 0x12e,
    no OPTIONS.DAT read (00f1), the screen with its quotation die (0f88), ovl53:056a(3), 0416;
    its own 003a call is this one (the host does not play mode 0 again on this entry).
    Returns the music call's events ([MusicStarted] or [], e.g. [] with mode 0 still playing).
    Evidence: asm ovl49:1392..139e; ovl57:0000..0097 (003a ovl58:0000(0), 0042 si == 1, 004f..
    007e aA == 0: no 10e8 / 0194, 007f SCN 0x120 = DS:28c8), 00f1 (si == 1: no 223b)."""
    mode = K.MAP_MUSIC_MODE.value
    events = MU.start(state.music, mode, "ovl57:003a")
    present("music", at="ovl57:003a", mode=mode, events=events)
    state.flags[K.SCN_RANDOM_MAP.value] = int(random_flag)
    return events


def map_setup_done(state: GameState) -> list:
    """Load Map ovl49:12f2 after ovl57:0000 returned (the Setup screen is up): the host sets
    DS:28c6 = DS:2a86 = 0 (13a6 / 13ac); "frame_off" (ovl62:0af3); the music ovl58:0000(0) at
    13b7, which with 003a's mode 0 still playing returns at once (0011) and never draws a die
    (mode 0 has a fixed track).  Returns that call's events.
    Evidence: asm ovl49:13a6..13b9."""
    present("frame_off", at="ovl49:13b2")
    mode = K.MAP_MUSIC_MODE.value
    events = MU.start(state.music, mode, "ovl49:13b7")
    present("music", at="ovl49:13b9", mode=mode, events=events)
    return events


def after_load(state: GameState, rebuilt: bool, where: str = "game") -> list:
    """ovl49:02d3 after a load (0414 returned `rebuilt`), from `where` ("game", "game_start",
    "setup"): the recounts 03f9 -> 02bf -> 0372 (0372 reads 03f9's counts), the site tiles
    ovl35:09f2(SCN 0x110), the map words ovl62:0000, the cost map 0555:0d9e(SCN 0x110, 1); then
    the screen: present points "load_blank" (ovl61:0a6e + ovl65:0698 when in a game and the
    overview was rebuilt), "view_setup" (ovl65:0000 from the Game Start / Setup screens),
    "game_screen" (ovl61:0000(DS:28c6, 0): frame first from the Game Start screen, map,
    overview, info cell, palettes and menu refresh; its ovl66:0356 is `redraw_palette`), two
    "strip" points (ovl68:0952(1, 0), (0, 0)), the "message" STRING (47, 1) with the side's
    name (ovl61:10fb, waits for a key), "map" (ovl64:006c), "frame_off" (ovl62:0af3) and
    "music" mode 1 (ovl58:0000(1), `rules.music.play`: a die unless mode 1 still plays, e.g.
    a load from the Game Start screen (mode 0 before) rolls, a load in a game with the turn
    music looping does not; info `events` = what it returned).  Returns those events
    ([MusicStarted] or []).  The host sets DS:2a86 = 1 (inside
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
    events = MU.play(state, K.LOAD_MUSIC_MODE.value, "ovl49:040a")
    present("music", at="ovl49:040c", mode=K.LOAD_MUSIC_MODE.value, events=events)
    return events


def new_game(state: GameState, ai_setup: Callable[[GameState], None] | None = None,
             descriptions: DescCache | None = None) -> None:
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
    `rules.setup.new_game(run=)`, `begin_carry`).  First of all ovl45:1de4 (0207): the run's
    description buffer is dropped (`descriptions`, `rules.descriptions.DescCache`).
    Evidence: asm ovl49:0203..026a (0207 ovl45:1de4; 020c..022f 0b62:03be for i < 0x3e8; 0231
    ovl62:0000; 0236 / 023b ovl64:1927 / 1931; 0240 ovl65:01ff; 0245 ovl64:113b; 024a / 0250
    DS:2a86 / 166a = 0; 0256 ovl62:0af3; 025d ovl60:0000(1); 0263 ovl25:0519); ovl60:0000..011d
    (002f DS:28c6 = 1, 00fd ovl58:0000(0), 0109 ovl58:026f(2)); ovl58:0293..029a."""
    from .setup import explored_map
    drop_descriptions(descriptions)                     # 0207 ovl45:1de4
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
    session's advisor words, the report block DS:4464, the list name buffer DS:483c, the music
    words (`RunPart.music`: DS:2632 etc., written in ovl57 / ovl53 only through ovl58:0000)
    and the army table (its records keep
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
    if run.list_names is not None:
        state.list_names = run.list_names
    if run.music is not None:
        state.music = run.music

