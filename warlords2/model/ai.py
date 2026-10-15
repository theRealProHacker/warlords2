"""The computer player's state (ai.md §3): the eight AI blocks of 0x42c bytes (handles at
DS:40ca + 4p, allocated by ovl25:04c5, saved with the game by ovl29:0da9 / read by 0dff,
ai.md §3.4), the 0x4b0-byte neighbour table (DS:40c6, ovl25:05e6, saved after the blocks) and
the DGROUP words of the AI frame that outlive a call (ai.md §3.3).

Field names follow ai.md §3.1 / §3.2 / §6.13 / A.2; the comment of each field is its offset.
Every word is kept as the signed 16-bit value the original stores, every byte as 0..255.

Defaults: ovl25:04c5 allocates the blocks once per run of the program with 0d28:011f, which
does not clear them (ai.md §3.1), and never frees them (DS:0832 has no other writer), and
ovl21:084d leaves +0x02..+0x08, +0x0e, +0x14, +0x3a..+0x46, +0x4e..+0x55, +0x182.. and
+0x1e6.. and most task-force words unwritten.  So the first Begin of a run sees whatever the
heap held there, a later Begin the previous game's values.  The engine's stand-in for a fresh
run is 0 [I]; a later Begin in the same run gets the previous game's blocks through the
`AiProcess` the caller carries (`AiState.attach`).
Unwritten words are read before their first writer: +0x182 + c is read by ovl24:023f itself
(asm 028e, the old value kept in [bp-0x16]; 0548 zeroes that copy when [bp-0x10] > 16) before
023f writes it (030d = 0, 03af += 1); with arg 2 == 0 and [bp-0xa] == 0, a new value equal to
the old one (057f) draws rnd(1, 6, -1) (058c) - so on a side's first clean-city phase
(ovl24:01f1, phase 9) the initial byte decides a die.  ovl28:0a19 / 0c6e / 0f78 (the hero
phase, phase 2, before clean city on the side's first computer turn) read it too, the 0f78
compare (> 4) guarding rnd(1, 20, 0).
The stand-in 0 is therefore an [I] on dice for the first game of a run (ai.md §3.1, §10.2).
The other unwritten fields have not been audited reader by reader.

Process state (not game state).  DS:0832 (allocated), DS:0836 (computer turn running),
DS:40f2 (solidarity copies), DS:40ee (the locked block), DS:40c0 / 07c6 (the neutral chain)
and the raze result are DGROUP words of the running program: ovl29:0da9 saves only the eight
blocks and the neighbour table, so a saved game does not hold them and a load in a fresh run
finds them as the EXE image has them (0, 0, 0, null, 0, 0xffff).  They live in `AiProcess`,
which the caller (the app's session, `App.ai_process`) keeps for the whole run and hands to
every `rules.setup.new_game` and `ai.cards.load_draws`; `AiState` forwards the old attribute
names to it.  model.serialize does not save it and GameState.hash
does not cover it; GameState.copy and serialize.snapshot / restore copy its words (a copy is
a snapshot of game and process).
"""
from __future__ import annotations

import copy
from dataclasses import dataclass, field, fields

N_AI_BLOCKS = 8
N_CITY_BYTES = 100                # the per-city byte arrays +0x56, +0xba, +0x11e, +0x182, +0x1e6
N_TASK_FORCES = 4                 # AI[+0x24c + 0x5c k], k < 4
MEMORY_ROWS = 7                   # words +0x3bc, +0x3cc, +0x3dc, +0x3ec, +0x3fc, +0x40c, +0x41c
MEMORY_SIDES = 8                  # each row w[8], indexed by the attacking side
NB_CITIES, NB_SLOTS = 100, 6      # neighbour table NB[c*6+i] ids, NB[600+c*6+i] distances


def _zeros(n: int):
    return field(default_factory=lambda: [0] * n)


@dataclass
class TaskForce:
    """Task force k: the 0x5c bytes at AI[+0x24c + 0x5c k] (ai.md §6.13, A.2)."""
    age: int = 0                  # +0x00: 0 inactive, 1 at creation, +1 per assault turn
    enemy: int = 0                # +0x02
    staging: int = 0              # +0x04: staging city (role 7)
    sources: list[int] = _zeros(4)       # +0x06: source cities (role 6)
    targets: list[int] = _zeros(6)       # +0x0e: target cities, nearest first
    w1a: list[int] = _zeros(6)           # +0x1a..+0x25: no reader or writer traced
    dists: list[int] = _zeros(6)         # +0x26: graph distances of the targets
    nb_counts: list[int] = _zeros(6)     # +0x32: per target, neighbours owned by the enemy
    leaders: list[int] = _zeros(4)       # +0x3e: group leaders (army indices)
    former: list[int] = _zeros(6)        # +0x46: former staging cities
    w52: list[int] = _zeros(3)           # +0x52..+0x57: no reader or writer traced
    min_moves: int = 0            # +0x58: 8, 12 or 16 (ovl21:01b3)
    flags: int = 0                # +0x5a: 1 raze, 2 sack, 4 pillage; 8 fast, 0x10 medium, 0x20 flyer


@dataclass
class AiBlock:
    """One side's AI block (ai.md §3.1).  `memory[r][a]` is the word +0x3bc + 0x10 r + 2 a: what
    side a's attacks did to this side (ovl25:09d7, ai.md §6.19): r = 0 defending heroes killed,
    1 defenders killed, 2 battles, 3 battles that killed every defender, 4 battles on a city,
    5 city battles that killed every defender, 6 (+0x41c) not written by 09d7."""
    turns_with_cities: int = 0    # +0x00
    own_cities: int = 0           # +0x02
    enemy_cities: int = 0         # +0x04
    neutral_cities: int = 0       # +0x06
    unseen_cities: int = 0        # +0x08
    rebuild_quota: int = 0        # +0x0a
    flags: int = 0                # +0x0c: bit 0 may attack neutral / peaceful sides' cities
    hero_count: int = 0           # +0x0e
    buy_low: int = 0              # +0x10: type bought when gold <= 2000
    buy_high: int = 0             # +0x12: type bought when gold > 2000
    w14: int = 0                  # +0x14: no reader or writer found
    slots_bought: int = 0         # +0x16
    enemy_bonus_human: int = 0    # +0x18: enemy-score bonus when the side on turn is human
    enemy_bonus_l1: int = 0       # +0x1a: ... level 1
    enemy_bonus_l0: int = 0       # +0x1c: ... level 0
    enemy_bonus_l2: int = 0       # +0x1e: ... level 2
    simulations: int = 0          # +0x20: battle simulations per win-odds estimate (10)
    w22: int = 0                  # +0x22: written by ovl22:0284, meaning [U]
    explorers: int = 0            # +0x24: explorer count, gate < 5 [U meaning]
    tf_odds_1: int = 0            # +0x26: task-force style thresholds for flags 1 / 2 / 4 (permil)
    tf_odds_2: int = 0            # +0x28
    tf_odds_4: int = 0            # +0x2a
    tf_city_mult: int = 0         # +0x2c: multiplier of +0x02
    tf_bonus_human: int = 0       # +0x2e: bonus by the level of the side on turn: human / 2 / 1 / 0 (ovl27:06a0)
    tf_bonus_l2: int = 0          # +0x30
    tf_bonus_l1: int = 0          # +0x32
    tf_bonus_l0: int = 0          # +0x34
    tf_bonus_poor: int = 0        # +0x36: bonus when gold < 100
    solidarity: int = 0           # +0x38: copied to DS:40f2[p] each turn (ovl25:0386)
    min_member_strength: int = 0  # +0x3a (ovl21:01b3)
    n_flyer_cities: int = 0       # +0x3c
    n_fast_cities: int = 0        # +0x3e
    n_medium_cities: int = 0      # +0x40
    plunder_early: int = 0        # +0x42
    leader_share: int = 0         # +0x44: share of cities (%) above which a human leads
    quest_city: int = 0           # +0x46: occupy / raze quest target city, else -1
    no_quick_attack: int = 0      # +0x48
    quest_battles: int = 0        # +0x4a
    item_handovers: int = 0       # +0x4c
    b4e: list[int] = _zeros(8)    # +0x4e..+0x55 bytes: no reader found
    role: list[int] = _zeros(N_CITY_BYTES)           # +0x56 + c: city role (§3.2)
    age: list[int] = _zeros(N_CITY_BYTES)            # +0xba + c: turns owned (wraps at 256)
    city_flags: list[int] = _zeros(N_CITY_BYTES)     # +0x11e + c: bit 0 unseen, 1 flying slot, ...
    armies_here: list[int] = _zeros(N_CITY_BYTES)    # +0x182 + c (ovl24:023f)
    keepers: list[int] = _zeros(N_CITY_BYTES)        # +0x1e6 + c (ovl24:023f)
    n_task_forces: int = 0        # +0x24a
    task_forces: list[TaskForce] = field(default_factory=lambda: [TaskForce() for _ in range(N_TASK_FORCES)])
    memory: list[list[int]] = field(
        default_factory=lambda: [[0] * MEMORY_SIDES for _ in range(MEMORY_ROWS)])

    @classmethod
    def from_dict(cls, d: dict) -> AiBlock:
        """Inverse of the serialised form (model.serialize)."""
        kw = {f.name: d[f.name] for f in fields(cls)}
        kw["task_forces"] = [TaskForce(**{k: list(v) if isinstance(v, list) else v for k, v in t.items()})
                             for t in d["task_forces"]]
        kw["memory"] = [list(r) for r in d["memory"]]
        for k, v in kw.items():
            if k not in ("task_forces", "memory") and isinstance(v, list):
                kw[k] = list(v)
        return cls(**kw)


@dataclass
class NeighbourTable:
    """The 0x4b0 bytes at DS:40c6 / 40ea (ai.md §4.2): `ids[c*6+i]` = NB[c*6+i] (0xff empty),
    `dists[c*6+i]` = NB[600 + c*6+i], built by ovl29:0398 at new game."""
    ids: list[int] = _zeros(NB_CITIES * NB_SLOTS)
    dists: list[int] = _zeros(NB_CITIES * NB_SLOTS)


@dataclass
class AiProcess:
    """The AI's DGROUP words of the running program (see the module docstring), kept by the
    caller for the whole run.

    `allocated` is DS:0832: 1 once ovl25:04c5 allocated the blocks (the first Begin or the first
    load of the run); never reset.  `turn_active` is DS:0836 (1 while ovl25:0000 runs).
    `solidarity[p]` is DS:40f2 + 2p, the copy of side p's AI[+0x38] made at p's turns
    (ovl25:0386, the only writer), read by other sides' diplomacy (ovl18:0000, 0a6e).
    `locked` is the side whose block DS:40ee points at: written only by ovl25:0000 at 0091 /
    0095 (the side on turn) and ovl25:0519 at 0542 / 0546 (p = 7..0, so block 0 last); the
    third writer ovl21:0ca9 is unreachable.  0 before any lock: every run reaches 0519 (Begin,
    or the load's ovl29:0dff with DS:0832 == 0) before any reader.  [I] DS:40ee is a far
    pointer kept after the unlock 0d28:07a9; 0d28:0a84 can swap an unlocked block out (only
    with a swap handler at DS:3292) and 069a then locks it at a new address, leaving DS:40ee
    pointing at the old one.  The engine takes the block as not moved.
    `raze_target` is what the last ovl29:1851 (`ai.base.after_raze`) returned in ax, for the
    assault phase's ovl19:0f1b (ai.md §9 raze contract); -1 before any.
    `neutral_source` is DS:40c0 (0 in the EXE image) and `neutral_last` DS:07c6 (0xffff in the
    EXE image: -1): the source city and the last target of the neutral phase's chain, written
    only by ovl20:06c7 (08a3 / 08aa) and read there (085d / 0868 / 0875), kept across calls,
    turns, sides and games.
    `single_view` is DS:3254 (not an AI word, but a DGROUP word of the run like these): 1 while
    a computer side's turn runs with exactly one live human and Hidden Map, written by ovl68:0000
    at 0074 and cleared by the human turn start ovl68:0259 at 0267 (ovl64:1558 saves and restores
    it around its scans, 1560 / 15d3); read by the AI's battle gates ovl36:124a (12e5), which
    decide the view-word write ovl65:0227 at 1474, and by the drawing (ovl64:006c, 1055, ovl63).
    `blocks` is the heap memory of the eight blocks: the live game's `AiState.blocks`.
    Evidence: the EXE image words DS:0832 / 0836 / 40f2[8] / 40c0 = 0, DS:07c6 = 0xffff (file
    offset 0x33250 + DS); writers ovl25:04c9 (0832), 0071 / 0354 (0836), 039e (40f2), 0091 /
    0095 / 0542 / 0546 (40ee), ovl20:08a3 / 08aa (07c6 / 40c0); ovl29:0da9 writes only the
    blocks and the neighbour table (ai.md §3.4)."""
    allocated: int = 0
    turn_active: int = 0
    solidarity: list[int] = _zeros(N_AI_BLOCKS)
    locked: int = 0
    raze_target: int = -1
    neutral_source: int = 0
    neutral_last: int = -1
    single_view: int = 0
    blocks: list | None = field(default=None, repr=False, compare=False)

    def dump(self) -> dict:
        """The words (not the blocks, which are the game's), for serialize.snapshot."""
        return {f.name: list(getattr(self, f.name)) if f.name == "solidarity" else getattr(self, f.name)
                for f in fields(self) if f.name != "blocks"}

    def snapshot(self, blocks: list) -> AiProcess:
        """A copy of the words whose heap blocks are `blocks` (GameState.copy)."""
        return AiProcess(**self.dump(), blocks=blocks)


def _forward(name: str, doc: str):
    return property(lambda self: getattr(self.proc, name),
                    lambda self, v: setattr(self.proc, name, v), doc=doc)


@dataclass
class AiState:
    """`GameState.ai`: the game's AI data (saved with the game).  Indexing, `len` and iteration
    give the eight blocks (DS:40ca[p]).  `proc` is the run's `AiProcess`; `allocated`,
    `turn_active`, `solidarity`, `locked` and `raze_target` are its words."""
    blocks: list[AiBlock] = field(default_factory=lambda: [AiBlock() for _ in range(N_AI_BLOCKS)])
    neighbours: NeighbourTable = field(default_factory=NeighbourTable)

    def __post_init__(self):
        self.proc = AiProcess(blocks=self.blocks)

    allocated = _forward("allocated", "DS:0832 (AiProcess.allocated)")
    turn_active = _forward("turn_active", "DS:0836 (AiProcess.turn_active)")
    solidarity = _forward("solidarity", "DS:40f2[8] (AiProcess.solidarity)")
    locked = _forward("locked", "DS:40ee as a side (AiProcess.locked)")
    raze_target = _forward("raze_target", "the last ovl29:1851 result (AiProcess.raze_target)")
    neutral_source = _forward("neutral_source", "DS:40c0 (AiProcess.neutral_source)")
    neutral_last = _forward("neutral_last", "DS:07c6 (AiProcess.neutral_last)")
    single_view = _forward("single_view", "DS:3254 (AiProcess.single_view)")

    def attach(self, process: AiProcess, carry: bool) -> None:
        """Make `process` this game's run state.  `carry` (a Begin): the blocks start as the
        process's heap blocks of the previous game (deep copy), so whatever ovl21:084d does not
        write keeps the previous game's value; a fresh process (no blocks yet) keeps the zero
        blocks.  Without `carry` (a load) the blocks are the file's.  Either way the process's
        heap blocks become this game's."""
        if carry and process.blocks is not None and process.blocks is not self.blocks:
            self.blocks = copy.deepcopy(process.blocks)
        process.blocks = self.blocks
        self.proc = process

    def __getitem__(self, p: int) -> AiBlock:
        return self.blocks[p]

    def __len__(self) -> int:
        return len(self.blocks)

    def __iter__(self):
        return iter(self.blocks)

    @classmethod
    def from_dict(cls, d: dict) -> AiState:
        """Inverse of the serialised form (model.serialize); a fresh `AiProcess`."""
        nb = d["neighbours"]
        return cls(blocks=[AiBlock.from_dict(b) for b in d["blocks"]],
                   neighbours=NeighbourTable(list(nb["ids"]), list(nb["dists"])))


def new_ai_blocks() -> AiState:
    return AiState()
