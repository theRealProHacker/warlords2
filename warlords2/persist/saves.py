"""Save Game / Load Game files of ovl49 (docs/plan.md M10b, EL §10): the slot table, the save
files and the load sequence around `rules.saveload`.

The file format is ours (plan register X12): the slot table keeps the EXE's line format, the
save file is JSON; their names are the EXE's FILE.DAT entries (4, 0) and (28, n), placed in
the user directory (`persist.userdir`), never in the game directory.

* `SlotTable`: the ten game slots DS:4712 (used) / DS:471c (15-byte descriptions), read once
  at start-up (res_0a4c:0250 -> ovl49:0e5f) and written by every save (ovl49:0f4c).  Where the
  table comes from when the user directory has none yet is register X46 (`SEED_POLICY`).
* `RunCarry`: what the running program keeps across games and loads besides the game: the run's
  game memory (the last `GameState`: its run part, rules.saveload.run_part), the scenario record
  DS:5d64, the ovl49 words DS:128c / 128e / 1290 and the ovl51 list name buffer DS:483c.
* `Saves`: the dialog steps of ovl49 on them: the Save list 093b, its callback 0995, the save
  0a25 -> 0a46; the Load list 026b, its callback 02d3, the load 0414 and the rest of 02d3.

The ovl51 list itself (rows, preselect arithmetic, drawing), the input box ovl56:0000, the
progress scroll and the screen redraws are the user interface's (packages U / G).
"""
from __future__ import annotations

import json
import re
import struct
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from ..formats.tables import StringTable, parse_armytypes
from ..model.army import ArmyType
from ..model.state import GameState, SCN_TERRAIN_SET
from ..rules import saveload as SL
from ..rules.descriptions import DescCache
from ..rules.randmap import RandomRun

N_SLOTS = 10                         # ovl49:0e38 / 0f14 / 026b / 093b: cmp si, 0xa
DESC_BUF = 15                        # DS:471c + 15 i (imul 0xf)
SLOT_FILE = (4, 0)                   # FILE.DAT: the slot table (ovl49:0e6d / 0f5a)
GAME_FILE = 28                       # FILE.DAT (28, n): save file n (ovl49:0a94, 0414)
ARMY_FILE = 21                       # FILE.DAT (21, DS:26c4) % SCN 0x161: the army types
USED = 0x31                          # ovl49:0e9b: used iff the line's first byte is '1'
ENC = "cp437"
ENVELOPE = 1                         # our envelope's version

# Register X46 (D2, OPEN, pending the user): where the slot table comes from while the user
# directory has none (the EXE reads DATA/SAVEINFO.DAT of its own directory at start-up):
#   "copy"         (a) the game's SAVEINFO.DAT as it is;
#   "copy_if_file" (b) its descriptions, but a slot is used only when its save file exists in
#                      the user directory;
#   "empty"        (c) all ten unused, each with the description of the file's first unused
#                      line.
# PENDING: "empty" is provisional until the user rules on X46.
SEED_POLICY = "empty"
SEED_POLICIES = ("copy", "copy_if_file", "empty")


DESC_MAX = DESC_BUF - 1              # ovl56:04c1: a char only while limit (15) - 1 > typed
_SCANF_D = re.compile(rb"[ \t\n\r\f\v]*([+-]?\d+)")


def _rel(s: str) -> str:
    """A FILE.DAT path (backslashes, doubled in the file) as a relative path."""
    return re.sub(r"\\+", "/", s)


# --------------------------------------------------------------------------- slot table


@dataclass
class SlotTable:
    """The game slots: `used[i]` (DS:4712 + i) and `desc[i]` (DS:471c + 15 i, at most 14
    characters plus the NUL)."""
    used: list[bool] = field(default_factory=lambda: [False] * N_SLOTS)
    desc: list[str] = field(default_factory=lambda: [""] * N_SLOTS)

    def any_used(self) -> int:
        """ovl49:0e25: the number of used slots (Load Game 502 and the Game Start button 101
        are live iff it is not 0, ovl61:0519 / ovl60:011e)."""
        return sum(1 for u in self.used if u)

    def to_bytes(self) -> bytes:
        """ovl49:0f4c: per slot sprintf("%%1d%%02d%%-%ds\\n\\r" with strlen) then (used,
        strlen + 1, desc), the description's spaces turned into '_' (0f91..0f97)."""
        out = bytearray()
        for u, d in zip(self.used, self.desc):
            s = d.replace(" ", "_").encode(ENC, "replace")
            out += b"%1d%02d%s\n\r" % (int(u), len(s) + 1, s)
        return bytes(out)

    @classmethod
    def from_bytes(cls, data: bytes) -> SlotTable:
        """ovl49:0e5f (and 1029, the map slots): per slot 1 byte into bp-5 (used iff '1'), 2 bytes
        into the stack buffer bp-0x1c (28 bytes) with a NUL after them (0ebd), sscanf "%d" of
        it into bp-4 (n: leading white space, a sign, digits, junk after them ignored; a field
        it cannot read keeps the previous n, 1 before the first line), n + 1 bytes read over the
        start of the same buffer, the NUL at buf[n - 1] (0eec..0ef4: bp-0x1d + n; outside the
        buffer when n < 1), '_' turned into ' ' in the buffer itself up to its strlen
        (0f03..0f09), the description = the buffer up to its first NUL.  So n = 0 gives the one
        byte read and the field's second digit, n = -1 (count 0) the field itself.
        The three stack variables live across the slots and a read at the end of the file reads
        nothing and leaves its target alone, so a short file gives its later slots the leftovers
        [I: from the asm under DOS read / sscanf semantics, not run]: with the game's 5-line
        MAPINFO.DAT slots 5..9 keep bp-5 = '0' (unused), n = 9 (sscanf of the buffer's first two
        bytes fails), the NUL at 2 cuts slot 4's text after two characters.  Not modelled
        [unverified]: the stack's contents before the first read (zeros here), n < -1 (a read
        of 0xffff-ish bytes onto the stack: the table stops), n > 27 (past the 28-byte buffer:
        the buffer grows), n < 1's NUL outside the buffer (dropped)."""
        t = cls()
        pos, n, b5, buf = 0, 1, 0, bytearray(28)

        def read(k: int) -> bytes:
            nonlocal pos
            got = data[pos:pos + max(k, 0)]
            pos += len(got)
            return got

        for i in range(N_SLOTS):
            got = read(1)
            if got:
                b5 = got[0]
            fld = read(2)
            buf[:len(fld)] = fld
            buf[2] = 0
            m = _SCANF_D.match(bytes(buf[:2]).split(b"\0")[0])
            if m:
                n = int(m.group(1))
            if n < -1:
                break
            body = read(n + 1)
            if len(body) > len(buf):
                buf += bytes(len(body) - len(buf))
            buf[:len(body)] = body
            if 1 <= n <= len(buf):
                buf[n - 1] = 0
            text = bytes(buf).split(b"\0")[0].replace(b"_", b" ")
            # (0f03 also writes the ' ' back into the buffer; not kept: a later slot sees it only
            # through sscanf after a field read at the end of the file, where the n it may change
            # puts its NUL behind the one at buf[2] and nothing more is read)
            t.used[i] = b5 == USED
            t.desc[i] = text.decode(ENC)
        return t


# --------------------------------------------------------------------------- run carry


@dataclass
class RunCarry:
    """What the running program keeps besides the game file (EL §10.4), one per App:

    * `game`: the run's game memory, the last `GameState` of this run (the game on screen, or
      the one left by New Game / the Game Start screen), None in a fresh run.  A load takes its
      run part from it (`rules.saveload.run_part`: dice stream, AI process words, heap buffers,
      DGROUP words, the production report block) and a failed open (D3) works on it in place.
    * `record`: DS:5d64, the SCENARIO.DAT record in memory (the game's, or the scenario the Game
      Setup screen loaded; `formats.scenario.parse_scenario_header` dict), None before any.
    * `slot` DS:128c (the slot being saved / loaded), `row` DS:128e (the preselected row of both
      game lists), `map_row` DS:1290 (the map lists, M11): EXE image zeros.
    * `names`: the ovl51 name buffer DS:483c (32 bytes per entry), shared by every ovl51 list
      (the slot lists, the sage, the place list ...): rows past a list's count draw what an
      earlier list left here.  Empty = BSS zeros.
    * `random_map`: the random-map run words (`rules.randmap.RandomRun`: the site-zone rotor
      DS:02d4 and the Game Start words DS:28c8..28d8), EXE image values in a fresh run.
    * `descriptions`: the city / site description buffer DS:0fc0 / 0fc2 / 4484
      (`rules.descriptions.DescCache`, register X64): read by the city and site dialogs
      through `rules.descriptions.lines`, dropped by New Game and a random-game load.
    * `images`: the map words 1e1d:0000 and the road layer 19d9:0000 as bytes (0x8880, 0x4440)
      when the last writer of them was not a game: the Game Setup screen's scenario loader
      (ovl57:0194, also a generation's), None = the run's last game holds them (`game.world`)
      or a fresh run (zeros).  A generation starts from them (register X62).
    * `pathfinder`: the pathfinder's run memory (`rules.randmap.PathRun`) as the last random-map
      generation left it, None = as the run's last game left it (`game.path_cache` /
      `dist_table`) or a fresh run's.  The next Begin starts with it (X62)."""
    game: GameState | None = None
    record: dict | None = None
    slot: int = 0
    row: int = 0
    map_row: int = 0
    names: list[str] = field(default_factory=list)
    random_map: RandomRun = field(default_factory=RandomRun)
    descriptions: DescCache = field(default_factory=DescCache)
    images: tuple[bytes, bytes] | None = None
    pathfinder: Any = None

    def enter(self, state: GameState, record: dict | None) -> None:
        """A game is the run's memory now (Begin of a new game, a load); its list name buffer
        is the run's (`GameState.list_names` is `names`, so the engine's ovl51:03d9 writes and
        the dialogs' lists share DS:483c); its map images and pathfinder words are the run's
        (`images` / `pathfinder` None)."""
        self.game, self.record = state, record
        self.images = self.pathfinder = None
        state.list_names = self.names

    def run_images(self) -> tuple[bytes | None, bytes | None]:
        """The map words and road layer as the run left them (`images`, else the last game's
        world, else (None, None): a fresh run's zeros)."""
        if self.images is not None:
            return self.images
        if self.game is None or self.game.world is None:
            return None, None
        w = self.game.world
        words = struct.pack("<%dH" % len(w.tiles), *((t & 0xFF) | (f & 0xFF) << 8 for t, f in zip(w.tiles, w.flags)))
        return words, bytes(r & 0xFF for r in w.roads)

    def write_names(self, names: list[str]) -> None:
        """An ovl51 list fills entries 0..len-1 of DS:483c (the rest keep their bytes)."""
        if len(self.names) < len(names):
            self.names += [""] * (len(names) - len(self.names))
        self.names[:len(names)] = list(names)

    def name(self, entry: int) -> str:
        """DS:483c + 32 entry as ovl51:00f3 draws it."""
        return self.names[entry] if 0 <= entry < len(self.names) else ""


def _check_slot(n: int) -> None:
    """A slot / file number: FILE.DAT group 28 has the entries 0..9."""
    if not 0 <= n < N_SLOTS:
        raise ValueError("slot %r outside 0..%d" % (n, N_SLOTS - 1))


class NoGameInMemory(RuntimeError):
    """A failed open (D3) in a run with no game in memory (register X47, open)."""


# --------------------------------------------------------------------------- the files


class Saves:
    """The slot table and the save files of one user directory.  `user`: a
    `persist.userdir.UserDir`; `gd`: the game directory (FILE.DAT names, the seed of the slot
    table, the army types and card files of a fresh-run load); `music`: the run's music words
    (`model.music.MusicWords`, the host's object) a fresh-run load carries into the loaded game
    (`rules.saveload.fresh_run_part(music=)`).  The table is read at once (res_0a4c:0250 ->
    ovl49:0e5f at start-up).  `random_texts`: the reader of RANDOM\\RANDOM.SPC / .CTY as they
    are on disk now, `random_texts() -> {"SPC": bytes, "CTY": bytes}` (package P's RANDOM
    overlay, `persist.randomdir`, plugs in here; register X55): a random-map game's save
    (SCN 0x120 != 0) calls it, any other save does not.  None: such a save is refused
    (ValueError from `rules.saveload.saved_part`).  `random_write`: the writer of a random-map
    game's load, `random_write({"SPC": bytes, "CTY": bytes})` (`persist.randomdir.RandomDir.
    write_texts`: ovl49:0728 / 07a9 write the file's blocks over those files, open mode 9);
    None: not written (tests)."""

    def __init__(self, user, gd, policy: str | None = None, music=None, random_texts=None,
                 random_write=None):
        self.user, self.gd = user, gd
        self.music = music
        self.random_texts = random_texts
        self.random_write = random_write
        self.files = StringTable(gd.read("DATA/FILE.DAT"))
        self.policy = SEED_POLICY if policy is None else policy
        if self.policy not in SEED_POLICIES:
            raise ValueError(self.policy)
        self.table = self.read_table()

    # ---------------------------------------------------------------- paths

    def table_rel(self) -> str:
        return _rel(self.files.get(*SLOT_FILE))

    def game_rel(self, n: int) -> str:
        return _rel(self.files.get(GAME_FILE, n))

    def game_path(self, n: int) -> Path:
        """The user-dir path of FILE.DAT (28, n) (no directory made)."""
        return self.user.root / self.game_rel(n)

    # ---------------------------------------------------------------- the table

    def read_table(self) -> SlotTable:
        """The table at start-up: the user directory's copy, else the seed of `policy` from the
        game's copy (X46).  Nothing is written until the first save (0f4c)."""
        p = self.user.root / self.table_rel()
        if p.is_file():
            return SlotTable.from_bytes(p.read_bytes())
        g = self.gd.path(self.table_rel())
        game = SlotTable.from_bytes(g.read_bytes()) if g.is_file() else SlotTable()
        if self.policy == "copy":
            return game
        if self.policy == "copy_if_file":
            game.used = [u and self.game_path(i).is_file() for i, u in enumerate(game.used)]
            return game
        blank = next((d for u, d in zip(game.used, game.desc) if not u), "")
        return SlotTable(desc=[blank] * N_SLOTS)

    def write_table(self) -> None:
        """ovl49:0f4c (a failed create writes nothing, no message)."""
        try:
            self.user.path(self.table_rel()).write_bytes(self.table.to_bytes())
        except OSError:
            pass

    # ---------------------------------------------------------------- Save Game 501

    def save_list(self, carry: RunCarry) -> tuple[list[str], int]:
        """ovl49:093b: all ten slots, used or not, with their descriptions into DS:483c; the list
        ovl51:0000(0995, STRING (46, 0), first = DS:128e).  Returns (names, first)."""
        carry.write_names(self.table.desc)
        return list(self.table.desc), carry.row

    def choose_save(self, carry: RunCarry, entry: int) -> str | None:
        """ovl49:0995(entry): Cancel (entry < 0) -> None (the caller redraws the game screen,
        ovl61:0000(0, 0)); else DS:128c = DS:128e = entry and the input box opens with the
        slot's description (returned; ovl56:0000 limit 15, width 0xa0).  The words stay set
        when the box is cancelled."""
        if entry < 0:
            return None
        _check_slot(entry)
        carry.slot = carry.row = entry
        return self.table.desc[entry]

    def write_game(self, carry: RunCarry, desc: str | None, state: GameState,
                   record: dict | None = None) -> bool:
        """ovl49:0a25(desc) -> 0a46(desc, 0, NULL) for slot DS:128c (`carry.slot`): with a
        description the slot table first (strcpy, used = 1, 0f4c written), then the file
        FILE.DAT (28, DS:128c); its blocks are `rules.saveload.saved_part(state, record)`
        (record: DS:5d64, default `carry.record`).  A failed open writes nothing more and says
        nothing: the slot stays marked used with the new description (returns False).  The save
        changes no game state.  Refuses (ValueError, before anything is written) what the EXE
        cannot reach: no record, a pending question (the dialogs are modal), a description
        longer than `DESC_MAX` (the editor ovl56:03a6 takes a character only while limit 15 - 1
        > the count typed, ovl56:04c1, so 14 at most fill the 15-byte buffers DS:471c), a
        slot outside 0..9, and a random-map game (SCN 0x120) without the `random_texts`
        reader.  A random-map game's file also holds RANDOM.SPC / .CTY as the reader returns
        them (ovl49:0bbe / 0c46)."""
        rec = carry.record if record is None else record
        if rec is None:
            raise ValueError("no scenario record (DS:5d64) to save")
        if desc is not None and len(desc) > DESC_MAX:
            raise ValueError("description longer than %d characters" % DESC_MAX)
        _check_slot(carry.slot)
        texts = None
        if state.flags.get(SL.K.SCN_RANDOM_MAP.value, 0) and self.random_texts is not None:
            texts = self.random_texts()                 # ovl49:0bbe / 0c46 open them now
        text = json.dumps({"envelope": ENVELOPE, "saved": SL.saved_part(state, rec, random_texts=texts)},
                          separators=(",", ":"))
        n = carry.slot
        if desc is not None:
            self.table.desc[n] = desc
            self.table.used[n] = True
            self.write_table()
        try:
            self.user.path(self.game_rel(n)).write_text(text, encoding="utf-8")
        except OSError:
            return False
        return True

    # ---------------------------------------------------------------- Load Game 502 / 101

    def load_list(self, carry: RunCarry) -> tuple[int, int]:
        """ovl49:026b: the descriptions of the used slots, compacted, into DS:483c (entries past
        them keep what an earlier ovl51 list left, `carry.names`); the list ovl51:0000(02d3,
        STRING (47, 0), first = DS:128e, shared with the Save list).  Returns (count, first);
        the rows draw `carry.name(entry)`.  (DS:4bfc, each entry's slot, is written but not
        read on this path, so it is not kept.)"""
        names = [d for u, d in zip(self.table.used, self.table.desc) if u]
        carry.write_names(names)
        return len(names), carry.row

    def choose_load(self, carry: RunCarry, entry: int) -> int | None:
        """ovl49:02d3(entry): Cancel (-1) -> None (the caller's Cancel path: DS:28c6 ?
        ovl60:0000(0) : DS:2a86 ? ovl61:0000(0, 0) : ovl57:0000(0, 0, 0, 1)); else DS:128e =
        DS:128c = entry and the load 0414(entry, 1, 0) opens FILE.DAT (28, entry): the *entry*
        index is used as the slot (register X45, D1: with used slots 2 and 5 the row of slot 5
        opens save file 1).  Returns the file number to load.  Entries the list cannot hand
        (below -1 or past 9: rows only hold -1..9) raise ValueError."""
        if entry == -1:
            return None
        _check_slot(entry)
        carry.slot = carry.row = entry
        return entry

    def read_game(self, n: int) -> dict | None:
        """The open and read of 0414: the saved part of FILE.DAT (28, n), None when the file
        cannot be opened (the failed open of D3).  Raises ValueError for n outside 0..9 (the EXE
        never passes one) and for any file that is not a save of this program (not UTF-8, not
        JSON, another envelope, no saved part): the host catches ValueError on Load (the EXE
        would read whatever bytes are there; a truncated write ends up here too)."""
        _check_slot(n)
        try:
            text = self.user.root.joinpath(self.game_rel(n)).read_text(encoding="utf-8")
        except OSError:                             # (UnicodeDecodeError is a ValueError)
            return None
        try:
            env = json.loads(text)
        except ValueError as e:
            raise ValueError("save file %d is not a save of this program" % n) from e
        saved = env.get("saved") if isinstance(env, dict) else None
        if (not isinstance(env, dict) or env.get("envelope") != ENVELOPE
                or not isinstance(saved, dict) or not isinstance(saved.get("state"), dict)):
            raise ValueError("save file %d is not a save of this program" % n)
        return saved

    def army_types(self, saved: dict, alt_names: bool = False) -> list[ArmyType]:
        """The run's army type table as a fresh run loads it on first use: FILE.DAT (21, DS:26c4
        = the `s` switch, `--alt-names`) with the loaded SCN 0x161 (the terrain set)."""
        terrain = saved["state"]["flags"][str(SCN_TERRAIN_SET)]
        rel = _rel(self.files.get(ARMY_FILE, int(bool(alt_names)))) % terrain
        return [ArmyType.from_record(r) for r in parse_armytypes(self.gd.read(rel))]

    def load_game(self, carry: RunCarry, n: int, *, where: str = "game", rng=None,
                  process=None, alt_names: bool = False, advisor: dict | None = None,
                  cards=None, saved=False) -> SL.Loaded:
        """ovl49:0414(n, 1, 0), up to its return (the caller then closes the progress scroll
        and calls `finish_load`).  Same run (`carry.game` set): the run part of that game (its
        dice, AI process words, buffers; army types not re-read).  Fresh run: `fresh_run_part`
        with `rng` (the session's one stream, X49), `process` (the App's `AiProcess`, its
        `allocated` 0 draws the ovl25:0519 dice), the army types read with the saved SCN 0x161
        and `advisor` (advisor_talking / advisor_digital / advisor_groups).  The AI read is
        `ai.cards.load_draws(state, cards, run.process)` (`cards`: default the game dir's card
        files).  A failed open runs on `carry.game` in place (D3); with none in memory it
        raises NoGameInMemory (X47 open) before touching anything.  A random-map game's file
        (SCN 0x120) writes its RANDOM.SPC / .CTY back through `random_write` (ovl49:0728 /
        07a9).  Afterwards the loaded game and its record are the run's memory (`carry.enter`).
        The run has one dice stream (DS:3d84): in a same run it is `carry.game.rng`, and an
        `rng` that is another object raises ValueError (joining `states.menu.session_dice` and
        `GameState.rng` into one stream is the host's).
        The host catches: NoGameInMemory, ValueError (a malformed file, `read_game`; a stream
        mismatch) and FileNotFoundError (a fresh run whose army type file is missing).
        `saved`: the caller's `read_game(n)` (the file is read once; False = read it here)."""
        from ..ai.cards import card_reader, load_draws
        live = carry.game
        if live is not None and rng is not None and rng is not live.rng:
            raise ValueError("a same-run load continues the run's stream carry.game.rng, not another")
        if saved is False:
            saved = self.read_game(n)
        if saved is None:
            if live is None:
                raise NoGameInMemory("failed open of save file %d with no game in memory" % n)
            res = SL.load(None, None, where=where, live_record=carry.record, live=live,
                          descriptions=carry.descriptions)
        else:
            if live is not None:
                run = SL.run_part(live)
            else:
                run = SL.fresh_run_part(rng, self.army_types(saved, alt_names), process=process,
                                        list_names=carry.names, music=self.music, **(advisor or {}))
            cards = cards if cards is not None else card_reader(self.gd)
            res = SL.load(saved, run, where=where, live_record=carry.record, live=live,
                          ai_read=lambda st: load_draws(st, cards, run.process),
                          descriptions=carry.descriptions)
            if res.random_texts is not None and self.random_write is not None:
                self.random_write(res.random_texts)     # 0728 / 07a9, inside 0414
        carry.enter(res.state, res.record)
        return res

    def finish_load(self, loaded: SL.Loaded, where: str = "game") -> None:
        """The rest of ovl49:02d3 after 0414 (`rules.saveload.after_load`): recounts, site
        tiles, map words, cost map and the present points of the game screen, the strip, the
        message and the music.  The host sets DS:2a86 = 1 and DS:28c6 = 0.  Returns after_load's
        events (the music ovl58:0000(1) at 040a: [MusicStarted] or [])."""
        return SL.after_load(loaded.state, loaded.rebuilt, where)

    def any_used(self) -> int:
        """ovl49:0e25."""
        return self.table.any_used()
