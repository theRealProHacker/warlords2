"""Save Map / Load Map of ovl49 (docs/plan.md M11, prep §4): the map slot table, SAVE\\RMAPTEMP.DAT
and the map files SAVE\\RMAP<n>.DAT around `rules.saveload`.

The file format is ours (registers X12 / X56): the slot table keeps the EXE's line format (the
`persist.saves.SlotTable` of the game slots: ovl49:1029 / 1116 are 0e5f / 0f4c with DS:4672 /
DS:467c for DS:4712 / DS:471c), a map file is our save envelope holding `rules.saveload.map_part`;
their names are FILE.DAT (5, 0), (27, 0) and (26, n), placed in the user directory.

* `Maps.write_temp` = ovl49:11f3 (RMAPTEMP right after a generation and its load, ovl57:10e8).
* Save Map 503 / Alt+M: `save_list` = 1214 (its gate `rules.saveload.save_map_allowed`),
  `choose_save` = 13c2, `save_map` = 1463 (slot table 1116, then the copy 0d61 RMAPTEMP ->
  RMAP<n>: the map saved is the generation snapshot, not the game being played).
* Load Map 504 / Alt+Z: `load_list` = 128a, `choose_load` = 12f2's entry test (the entry index is
  the file number, register X57 as X45), `read_map` / `load_map` = 0414(e, 0, 1), `finish_load`
  = the rest of 12f2 up to ovl57:0000 (0d61 RMAP<e> -> RMAPTEMP, `rules.saveload.after_load_map`).
* `any_used` = ovl49:0e42 (`ui.menubar.saved_maps`: menu 504 and the bars).

The ovl51 list, the input box, the progress scroll (STRING group 134), the three-way redraw after
Cancel / Save and the Setup screen after a load are the user interface's and the host's.
"""
from __future__ import annotations

import json
from pathlib import Path

from ..model.state import GameState
from ..rules import saveload as SL
from . import saves as PS
from .saves import NoGameInMemory, RunCarry, SlotTable

TABLE_FILE = (5, 0)                  # FILE.DAT: DATA\MAPINFO.DAT (ovl49:1037 / 1124)
MAP_FILE = SL.K.MAP_FILE.value       # FILE.DAT (26, n): SAVE\RMAP<n>.DAT (ovl49:135e / 1491)
TEMP_FILE = SL.K.MAP_TEMP_FILE.value  # FILE.DAT (27, 0): SAVE\RMAPTEMP.DAT (11f6 / 134e / 14aa)
SAVE_FIRST_ROW = 0                   # ovl49:126a: the Save Map list starts at row 0 (push 0)

# Register X57 (closed): the map slot table seeds the same way as the game slots (X46), with its
# own switch; "empty" as the game slots.  The game's MAPINFO.DAT has 5 lines for the 10 slots;
# under "copy" 1029 reads past the end into its stack variables, so slots 5..9 are unused with
# the first two characters of slot 4's text (`SlotTable.from_bytes`, [I] from the asm, not run).
SEED_POLICY = "empty"


def copy_file(src: Path, dst: Path) -> bool:
    """ovl49:0d61(src, dst): open src (mode 2; failing: nothing at all, dst untouched), create
    dst (mode 9; failing: src closed, nothing), copy its length in 30000-byte chunks (byte for
    byte).  Returns whether dst was written."""
    try:
        data = src.read_bytes()
    except OSError:
        return False
    try:
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_bytes(data)
    except OSError:
        return False
    return True


class Maps:
    """The map slot table and the map files of one user directory.  `user`: a
    `persist.userdir.UserDir`; `gd`: the game directory (FILE.DAT names, the seed of the table);
    `saves`: the run's `persist.saves.Saves` (the army types and music words of a fresh-run Load
    Map); `random_texts` / `random_write`: the RANDOM overlay's reader / writer
    (`persist.randomdir.RandomDir.texts` / `write_texts`), used only for a snapshot / map file
    with SCN 0x120 != 0 (none of 11f3's: the template's 0x120 is 0 there).  The table is read at
    once (res_0a4c:0255 -> ovl49:1029 at start-up)."""

    def __init__(self, user, gd, *, policy: str | None = None, saves: PS.Saves | None = None,
                 random_texts=None, random_write=None):
        self.user, self.gd, self.saves = user, gd, saves
        self.random_texts, self.random_write = random_texts, random_write
        self.files = saves.files if saves is not None else PS.StringTable(gd.read("DATA/FILE.DAT"))
        self.policy = SEED_POLICY if policy is None else policy
        if self.policy not in PS.SEED_POLICIES:
            raise ValueError(self.policy)
        self.table = self.read_table()

    # ---------------------------------------------------------------- paths

    def table_rel(self) -> str:
        return PS._rel(self.files.get(*TABLE_FILE))

    def map_path(self, n: int) -> Path:
        """The user-dir path of FILE.DAT (26, n) (no directory made)."""
        return self.user.root / PS._rel(self.files.get(MAP_FILE, n))

    def temp_path(self) -> Path:
        return self.user.root / PS._rel(self.files.get(*TEMP_FILE))

    # ---------------------------------------------------------------- the table

    def read_table(self) -> SlotTable:
        """ovl49:1029 at start-up: the user directory's MAPINFO.DAT, else the seed of `policy`
        from the game's copy (X57 = X46's three ways).  Nothing is written until a Save Map."""
        p = self.user.root / self.table_rel()
        if p.is_file():
            return SlotTable.from_bytes(p.read_bytes())
        g = self.gd.path(self.table_rel())
        game = SlotTable.from_bytes(g.read_bytes()) if g.is_file() else SlotTable()
        if self.policy == "copy":
            return game
        if self.policy == "copy_if_file":
            game.used = [u and self.map_path(i).is_file() for i, u in enumerate(game.used)]
            return game
        blank = next((d for u, d in zip(game.used, game.desc) if not u), "")
        return SlotTable(desc=[blank] * PS.N_SLOTS)

    def write_table(self) -> None:
        """ovl49:1116: all ten lines (a failed create writes nothing, no message)."""
        try:
            self.user.path(self.table_rel()).write_bytes(self.table.to_bytes())
        except OSError:
            pass

    def any_used(self) -> int:
        """ovl49:0e42: the number of used map slots (Load Map 504 is live iff it is not 0)."""
        return self.table.any_used()

    # ---------------------------------------------------------------- envelope

    def _write_part(self, path: Path, part: dict) -> bool:
        text = json.dumps({"envelope": PS.ENVELOPE, "saved": part}, separators=(",", ":"))
        try:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
        except OSError:
            return False
        return True

    def _texts(self, state: GameState):
        if state.flags.get(SL.K.SCN_RANDOM_MAP.value, 0) and self.random_texts is not None:
            return self.random_texts()
        return None

    # ---------------------------------------------------------------- RMAPTEMP 11f3

    def write_temp(self, state: GameState, record: dict) -> bool:
        """ovl49:11f3 = 0a46(NULL, map_flag 1, FILE.DAT (27, 0)): SAVE\\RMAPTEMP.DAT from the
        memory right after a generation's scenario load (`rules.saveload.map_part(state,
        record)`, record = DS:5d64 after 10e8).  No slot table.  A failed create writes nothing
        (returns False)."""
        part = SL.map_part(state, record, random_texts=self._texts(state))
        return self._write_part(self.temp_path(), part)

    # ---------------------------------------------------------------- Save Map 503

    def save_list(self, carry: RunCarry, flags: dict, game_start: bool) -> tuple[list[str], int] | None:
        """ovl49:1214: nothing (None) unless `rules.saveload.save_map_allowed(flags, game_start)`
        (`flags`: the SCN words in memory, `game_start`: DS:28c6); else all ten slots with
        their descriptions into DS:483c (DS:4bfc[i] = i, not kept) and the list ovl51:0000(13c2,
        STRING (48, 0), first row 0, not DS:1290).  Returns (names, first)."""
        if not SL.save_map_allowed(flags, game_start):
            return None
        carry.write_names(self.table.desc)
        return list(self.table.desc), SAVE_FIRST_ROW

    def choose_save(self, carry: RunCarry, entry: int) -> str | None:
        """ovl49:13c2(entry): Cancel (-1) -> None (the caller's three-way redraw: DS:28c6 ?
        ovl60:0000(0) : DS:2a86 ? ovl61:0000(0, 0) : ovl57:0000(0, 0, 0, 1)); else DS:128c =
        DS:1290 = entry and the input box ovl56:0000 (STRING (48, 0..2), limit 15, width 0xa0,
        OK 1463, Cancel ovl34:1434) opens with the slot's description (returned)."""
        if entry == -1:
            return None
        PS._check_slot(entry)
        carry.slot = carry.map_row = entry
        return self.table.desc[entry]

    def save_map(self, carry: RunCarry, desc: str) -> bool:
        """ovl49:1463(desc) for slot DS:128c (`carry.slot`): used = 1, the description strcpy'd,
        MAPINFO.DAT written (1116), then 0d61(RMAPTEMP, RMAP<slot>).  Returns whether the map
        file was written (False: no RMAPTEMP or a failed create; the slot stays marked used).
        The caller then redraws the three ways of 13c2's Cancel.  A description longer than
        `persist.saves.DESC_MAX` (the input box cannot type one) raises ValueError first."""
        if len(desc) > PS.DESC_MAX:
            raise ValueError("description longer than %d characters" % PS.DESC_MAX)
        n = carry.slot
        PS._check_slot(n)
        self.table.used[n] = True
        self.table.desc[n] = desc
        self.write_table()
        return copy_file(self.temp_path(), self.map_path(n))

    # ---------------------------------------------------------------- Load Map 504

    def load_list(self, carry: RunCarry) -> tuple[int, int]:
        """ovl49:128a: the descriptions of the used slots, compacted, into DS:483c (entries past
        them keep an earlier ovl51 list's names, `carry.names`); the list ovl51:0000(12f2,
        STRING (49, 0), first = DS:1290, `carry.map_row`).  Returns (count, first)."""
        names = [d for u, d in zip(self.table.used, self.table.desc) if u]
        carry.write_names(names)
        return len(names), carry.map_row

    def choose_load(self, carry: RunCarry, entry: int) -> int | None:
        """ovl49:12f2(entry): Cancel (-1) -> None (the three-way redraw); else DS:128c = DS:1290
        = entry and 0414(entry, 0, 1) opens FILE.DAT (26, entry): the entry index is the file
        number (register X57, as X45: with used slots 2 and 5 the row of slot 5 opens RMAP1).
        Returns the file number."""
        if entry == -1:
            return None
        PS._check_slot(entry)
        carry.slot = carry.map_row = entry
        return entry

    def read_map(self, n: int) -> dict | None:
        """The open and read of 0414 for FILE.DAT (26, n): the saved part, None when the file
        cannot be opened (the failed open).  Raises ValueError for a file that is not a map of
        this program (as `persist.saves.Saves.read_game`; a saved game in a map file too)."""
        PS._check_slot(n)
        return self._read_part(self.map_path(n), "map file %d" % n)

    def read_temp(self) -> dict | None:
        """SAVE\\RMAPTEMP.DAT's saved part (for checks; no EXE path reads it but 0d61)."""
        return self._read_part(self.temp_path(), "RMAPTEMP")

    def _read_part(self, path: Path, what: str) -> dict | None:
        try:
            text = path.read_text(encoding="utf-8")
        except OSError:
            return None
        try:
            env = json.loads(text)
        except ValueError as e:
            raise ValueError("%s is not a map of this program" % what) from e
        saved = env.get("saved") if isinstance(env, dict) else None
        if (not isinstance(env, dict) or env.get("envelope") != PS.ENVELOPE
                or not isinstance(saved, dict) or not isinstance(saved.get("state"), dict)
                or saved.get("kind") != "map"):
            raise ValueError("%s is not a map of this program" % what)
        return saved

    def load_map(self, carry: RunCarry, n: int, *, rng=None, process=None,
                 alt_names: bool = False, advisor: dict | None = None, saved=False) -> SL.Loaded:
        """ovl49:0414(n, 0, 1) of Load Map, up to its return (`rules.saveload.load_map`): the
        run part of `carry.game` in the same run, else `fresh_run_part(rng, army types of the
        file's SCN 0x161, process=, music=)` (needs `saves`); no AI read, no path-cache clear,
        the 256 overview dice always.  A failed open works on `carry.game` in place, with none
        in memory it raises NoGameInMemory (the host's X47 stand-in) before touching anything.
        A file with SCN 0x120 (never one of 11f3's) writes its SPC / CTY back (`random_write`).
        Afterwards the loaded state and its record are the run's memory (`carry.enter`); the
        caller closes the scroll and calls `finish_load`.  `saved`: the caller's `read_map(n)`
        (False = read it here).  Same-run stream rule and host catches as `Saves.load_game`."""
        live = carry.game
        if live is not None and rng is not None and rng is not live.rng:
            raise ValueError("a same-run load continues the run's stream carry.game.rng, not another")
        if saved is False:
            saved = self.read_map(n)
        if saved is None:
            if live is None:
                raise NoGameInMemory("failed open of map file %d with no game in memory" % n)
            res = SL.load_map(None, None, live_record=carry.record, live=live,
                              descriptions=carry.descriptions)
        else:
            if live is not None:
                run = SL.run_part(live)
            else:
                if self.saves is None:
                    raise ValueError("a fresh-run Load Map needs `saves` (army types, music)")
                run = SL.fresh_run_part(rng, self.saves.army_types(saved, alt_names),
                                        process=process, list_names=carry.names,
                                        music=self.saves.music, **(advisor or {}))
            res = SL.load_map(saved, run, live_record=carry.record, live=live,
                              descriptions=carry.descriptions)
            if res.random_texts is not None and self.random_write is not None:
                self.random_write(res.random_texts)     # 0728 / 07a9, inside 0414
        carry.enter(res.state, res.record)
        return res

    def finish_load(self, loaded: SL.Loaded, n: int) -> None:
        """The rest of ovl49:12f2 after 0414, up to ovl57:0000: 0d61(RMAP<n>, RMAPTEMP) (134e..
        1369; a missing RMAP<n> copies nothing), then `rules.saveload.after_load_map` (recounts,
        cost map).  The host goes on with `rules.saveload.map_setup_entry(state, DS:28c8)`, the
        Setup screen, DS:28c6 = DS:2a86 = 0 and `rules.saveload.map_setup_done`."""
        copy_file(self.map_path(n), self.temp_path())
        SL.after_load_map(loaded.state)
