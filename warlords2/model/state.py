"""The whole game state.

`flags` holds SCN words keyed by SCN offset: the header 0x0A0..0x182 and the player-record
words not modelled in `Player`, verbatim unless a rule changes them (plan register S1), plus
words of the runtime regions that the set-up writes (0x10f3[p]).  Words with a known role
have names below.  Bytes 0x100..0x10f and 0x134 are stored as byte values.
"""
from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass, field
from typing import Any

from .ai import AiBlock, new_ai_blocks
from .army import NO_TYPE, NO_TYPE_ID, Army, ArmyType
from .city import City
from .hero import HeroSlot
from .item import Item
from .player import Player
from .site import Site
from .world import World

# SCN words with a known role (EL §6.1, §6.7, §6.9, §7).
SCN_CURRENT_PLAYER = 0x110
SCN_BONUS_CAP = 0x112
SCN_HUMAN_INFAMY = 0x116          # +400 start infamy for humans when set (EL §6.6, X29)
SCN_TUTORIAL = 0x12E
SCN_VICTORY = 0x15B
SCN_SURRENDER_OFFERED = 0x15D
SCN_TERRAIN_SET = 0x161
SCN_TURN_ORDER = 0x163            # 8 words
SCN_ROUND_COMPLETE = 0x118        # EL §9.2
SCN_TURN_POS = 0x173              # position in the turn order (EL §9.1)
SCN_ARMY_HIGH = 0x181             # army-table high-water mark (EL §9.2)


@dataclass
class Monster:
    """Ruin guardian: name 2c04:0f67 + t*0x10, strength 2c04:1007 + t*2 (EL §5.1)."""
    name: str
    strength: int


N_PATH_SLOTS = 20                 # 0555:0350 clears slots 19..0; 0x10b8 bytes = 20 x 0xd6
PATH_SLOT_CODES = 200             # +0x0e..+0xd5 (0555:146c, 165c, 1595 count to 0xc8)


@dataclass
class PathSlot:
    """One record of the path cache 0555 allocates at 0555:02f2 (0xd6 bytes each): +0 validity
    word, +2 mode, +4 mask, +6/+8 source, +0xa/+0xc destination, +0xe 200 direction codes.  A
    cleared slot (0555:146c) is all zero: source and destination (0, 0), 200 codes 0."""
    valid: int = 0
    mode: int = 0
    mask: int = 0
    src: tuple[int, int] = (0, 0)
    dst: tuple[int, int] = (0, 0)
    codes: list[int] = field(default_factory=lambda: [0] * PATH_SLOT_CODES)


def cleared_path_cache() -> list[PathSlot]:
    return [PathSlot() for _ in range(N_PATH_SLOTS)]


@dataclass
class Selection:
    """The selected stack and the stack palette (DGROUP words of the original, all zero in the
    EXE image and at new game).  Every field changes what a later command does, so all are
    game state (serialised and hashed); display-only words are not kept: DS:6832 (palette
    bracket marks), DS:2eaa / 2ea6 / 2ea8 (path display), DS:30f6 = len(palette).  DS:5dfe,
    5e00, 2bda, 5dfc, 5dfa are kept as stored words (zero in the EXE image) and read as
    stored.  Army ids stand for the original's far pointers
    (-1 = null).
    `moving` is DS:5e3e[0..7] slot by slot: entry i is slot i, -1 a null slot, slots past the
    end are null (trailing nulls are not stored).  The AI's ovl29:14d3 / 0ae7 copy a list with
    -1 entries in place, so a null slot can stand before live ones (a hole); every reader
    skips null slots as the original does (0c8c:0529, 0a8b:04c8 / 07f9 / 0d1a / 0476,
    ovl67:08fb, ovl24:0000), except the battle set-up ovl38:0293..02ea, which copies slots
    0..DS:5dfe-1 as they are (rules.combat.selection_group, plan register X38)."""
    selected: int = -1                    # DS:5e62, the stack's leader
    moving: list[int] = field(default_factory=list)   # DS:5e3e[0..7] by slot, -1 = null
    hero: int = -1                        # DS:5e5e, the group's hero (set by 0c8c:0529, ovl67:0955)
    next_ref: tuple[int, int] = (0, 0)    # DS:3250 / 3252, Next's reference square
    palette: list[int] = field(default_factory=list)            # DS:6862[i], square list order
    palette_selected: list[int] = field(default_factory=list)   # DS:6842[i], in the moving group
    palette_group: list[int] = field(default_factory=list)      # DS:6852[i], palette group index
    # The words the selection step 0c8c:0529 stores (rules.movement.store_selection_words); the
    # original keeps them, so they go stale when the armies change before the next 0529:
    count: int = 0                        # DS:5dfe: non-null DS:5e3e entries
    moves: int = 0                        # DS:5e00: lowest moves left (signed), from 100
    group: int = 0                        # DS:2bda: count > 1 (the stack moves as a group)
    mode: int = 0                         # DS:5dfc: 0 ship, 1 land, 2 flying
    mask: int = 0                         # DS:5dfa: bonus / aboard bits of the path search


@dataclass
class ReportEntry:
    """One slot of the production report block DS:4464 (ovl43:076d allocates 0x321 bytes: 100
    slots of +0x000 kind, +0x064 army type, +0x0c8 city, +0x12c destination, +0x190 far pointer
    to the army record, +0x320 the count).  All bytes are read signed (cwde, ovl43:095b..09ef).
    kind 0 = a vectored army that arrived (city = its home +9, dest = its destination city, or
    100 + side for the standard); kind 1 = made in a vectoring city (dest = the vector target
    city, or 100 + side); kind 2 = made and placed (dest = -1).  `army` stands for the far
    pointer: written (ovl43:021b / 03d7 / 063c) and never read; None for a failed allocation."""
    kind: int
    type: int
    city: int
    dest: int
    army: int | None = None


REPORT_SIZE = 0x321               # ovl43:0778..0786: 0d28:011f(0x321)
REPORT_SLOTS = 100
REPORT_KIND, REPORT_TYPE, REPORT_CITY, REPORT_DEST, REPORT_PTR, REPORT_COUNT = (
    0x000, 0x064, 0x0c8, 0x12c, 0x190, 0x320)
ARMY_SEG, ARMY_BASE, ARMY_SIZE = 0x1E1D, 0x8880, 0x16   # army record i = 1e1d:8880 + 0x16 i


def _s8(b: int) -> int:
    return b - 0x100 if b & 0x80 else b


class ProductionReport:
    """The production report block DS:4464 as its 0x321 bytes, written the way ovl43:0000
    writes it, read the way ovl43:07e5 / 086e / 06bd read it.  A sequence of `ReportEntry`
    (entries 0 .. count - 1, decoded from the bytes); `append` / `clear` / `[:] = entries`
    write the bytes.
    Each append (asm ovl43:01ee..02b2 / 03aa..04ac arrivals, 05d1..068b units made) re-reads
    the count byte +0x320 (signed, cwde) for every field: kind at +count, the far pointer
    (segment word at +0x192 + 4 count, then offset word at +0x190 + 4 count), then type, city
    and dest at +0x64 / +0xc8 / +0x12c + count, then `inc byte` +0x320.  There is no bound
    check, so the 101st entry (count 100) writes its kind byte over type[0] and its pointer's
    offset word over +0x320..0x321: the count becomes the low byte of the record's offset (army
    record i at 1e1d:8880 + 0x16 i, a NULL record 0000:0000) and type / city / dest land at
    that count; past 127 the count byte turns negative and the fields land before the
    block.  Bytes the EXE writes outside the 0x321 bytes (the pointer's other three bytes for
    count 100, every pointer of count > 100, writes at a negative count) hit other heap memory
    of the original machine and are not kept here (plan register X40, stand-in); every read
    of a count 0..127 stays inside the block.  The block's bytes at allocation are taken as
    zero (0d28:011f; only bytes written in the same run are ever read)."""

    def __init__(self, data: bytes | None = None):
        self.data = bytearray(data if data is not None else REPORT_SIZE)

    def _put(self, off: int, byte: int) -> None:
        if 0 <= off < REPORT_SIZE:
            self.data[off] = byte & 0xFF

    def _put_word(self, off: int, word: int) -> None:
        self._put(off, word)
        self._put(off + 1, word >> 8)

    @property
    def count(self) -> int:
        """Signed count byte +0x320 (ovl43:07ef..07f8: cwde)."""
        return _s8(self.data[REPORT_COUNT])

    def append(self, e: ReportEntry) -> None:
        self._put(self.count + REPORT_KIND, e.kind)
        off, seg = (0, 0) if e.army is None else (ARMY_BASE + ARMY_SIZE * e.army, ARMY_SEG)
        self._put_word(REPORT_PTR + 4 * self.count + 2, seg)
        self._put_word(REPORT_PTR + 4 * self.count, off)
        self._put(REPORT_TYPE + self.count, e.type)
        self._put(REPORT_CITY + self.count, e.city)
        self._put(REPORT_DEST + self.count, e.dest)
        self.data[REPORT_COUNT] = (self.data[REPORT_COUNT] + 1) & 0xFF

    def clear(self) -> None:
        """ovl43:0016: only the count byte is reset; the slots keep their bytes."""
        self.data[REPORT_COUNT] = 0

    def entry(self, i: int) -> ReportEntry:
        """Slot i as ovl43:086e / 06bd read it (signed bytes); the pointer (never read by the
        EXE) gives the army index when it lies inside the block and names an army record."""
        d = self.data
        army = None
        if REPORT_PTR + 4 * i + 3 < REPORT_SIZE:
            p = REPORT_PTR + 4 * i
            off, seg = d[p] | d[p + 1] << 8, d[p + 2] | d[p + 3] << 8
            if seg == ARMY_SEG and off >= ARMY_BASE and (off - ARMY_BASE) % ARMY_SIZE == 0:
                army = (off - ARMY_BASE) // ARMY_SIZE
        return ReportEntry(_s8(d[REPORT_KIND + i]), _s8(d[REPORT_TYPE + i]),
                           _s8(d[REPORT_CITY + i]), _s8(d[REPORT_DEST + i]), army)

    def __len__(self) -> int:
        return max(self.count, 0)

    def __getitem__(self, i):
        if isinstance(i, slice):
            return [self.entry(k) for k in range(len(self))[i]]
        if i < 0:
            i += len(self)
        if not 0 <= i < len(self):
            raise IndexError(i)
        return self.entry(i)

    def __iter__(self):
        return (self.entry(k) for k in range(len(self)))

    def __setitem__(self, i, entries) -> None:
        """`report[:] = entries`: the block after a reset and these appends (the only form)."""
        if i != slice(None):
            raise TypeError("only report[:] = entries is supported")
        entries = list(entries)
        self.clear()
        for e in entries:
            self.append(e)

    def __eq__(self, other) -> bool:
        if isinstance(other, ProductionReport):
            return self.data == other.data
        return list(self) == list(other)

    def __repr__(self) -> str:
        return "ProductionReport(%r)" % (list(self),)

    def copy(self) -> ProductionReport:
        return ProductionReport(self.data)


BATTLE_A_SLOTS = 8               # DS:424c / 4274 / 429c: 8 bytes each
BATTLE_D_SLOTS = 32               # DS:422c / 4254 / 427c / 42a4: 32 bytes each (4 squares x 8)


@dataclass
class BattleWork:
    """The DGROUP battle arrays of the last ovl38:008b set-up (DS:41fa..436a, EL §7), written
    by every set-up, also the advisor's trial battles (ovl36:2065 -> 124a), and read after the
    battle by ovl36:0a6b (types; for defender i the byte DS:424c[i], ovl36:0c8e) and
    ovl01:1ded (quest check).  `a_types` / `d_types` are the whole arrays: a set-up writes
    only the first count bytes (asm ovl38:06e5..072d), so the bytes past a side's count are
    the previous set-up's.  The area is zero in the EXE image (file offset 0x33250 + 0x41fa),
    hence the zero defaults.  Army ids stand for the far pointers DS:42c6 / 42e6; the alive
    lists hold the current counts only (nothing reads past them).  Also kept here: the attack
    cost word DS:4160 (zero in the EXE image, file offset 0x33250 + 0x4160) that every prelude
    ovl36:0522 charges."""
    attacker: int = 0                     # DS:41fa
    owner: int = 0                        # DS:41fb
    attackers: list[int] = field(default_factory=list)   # DS:42c6[0..42c4)
    defenders: list[int] = field(default_factory=list)   # DS:42e6[0..42c5)
    a_alive: list[int] = field(default_factory=list)     # DS:4224[0..42c4)
    d_alive: list[int] = field(default_factory=list)     # DS:422c[0..42c5)
    a_types: list[int] = field(default_factory=lambda: [0] * BATTLE_A_SLOTS)   # DS:424c[8]
    d_types: list[int] = field(default_factory=lambda: [0] * BATTLE_D_SLOTS)   # DS:4254[32]
    attack_cost: int = 0                  # DS:4160: written only by the human attack ovl36:0000
    #                                       (0211), read by every prelude ovl36:0522, also the
    #                                       computer's (124a at 1466): 0 in the EXE image


@dataclass
class GameState:
    world: World
    players: list[Player]
    cities: list[City]
    sites: list[Site]
    items: list[Item]
    armies: list[Army]
    heroes: list[HeroSlot]
    monsters: list[Monster]
    army_types: list[ArmyType]            # ARMYTYPE.DAT or ARMYTYP2.DAT, file order
    fight_order: list[list[int]]          # SCN 0x60B, 9 rows x 29 (EL §3.2)
    options: Any                          # GameOptions
    turn: int                             # SCN 0x135
    current: int                          # SCN 0x110
    relations: list[list[int]]            # 2c04:153b[a*8+b] bytes (EL §6.6)
    rng: Any                              # rules.rng.Rng
    history: list = field(default_factory=list)
    pending: Any = None                   # pending question event, or None
    flags: dict[int, int] = field(default_factory=dict)
    reveal_at_first_human_turn: int = 0   # DS:16a6, cleared at ovl68:026d (EL §9.2)
    overview_mountain_rolls: list[int] = field(default_factory=list)  # ovl63:232b's 256 rnd(1,3,1), the
    #                                     overview map's mountain colours (per pixel ovl63:2785; EL §9.1)
    cost_map: list[int] = field(default_factory=list)         # 0555:0d9e buffer DS:3f82, [] = not built
    path_cache: list[PathSlot] = field(default_factory=cleared_path_cache)   # DS:3f7e, 20 slots
    # The search field T of 0555:000a, heap buffer DS:3f86 (0x8880 bytes, 0555:02f2), as the last
    # search left it: indexed y * 112 + x here (x * 0x9c + y there), [] = not written yet.  Only
    # 000a writes it (08bf init, 011c / 0168 the target word, 0373 flood): every path search that
    # is not a cache hit or a direct step, and every distance map 0555:1ab9 that is on the map;
    # 117b reads it, and the AI reads it through 0555:1b0a (ovl21:0a85, ovl22:0f3c, ovl29:1885).
    # A distance map off the map leaves it as it was (rules.pathfinding.distance_map).
    dist_table: list[int] = field(default_factory=list)
    selection: Selection = field(default_factory=Selection)   # selected stack and stack palette
    hero_names: list = field(default_factory=list)  # per side [female, name] in file order, from
    #                                     TERRAIN<set>/HERONAM<p>.DAT (ovl47:0c67), given to rules.setup.new_game
    news: list = field(default_factory=lambda: [[] for _ in range(8)])  # 2c04:13e3 + p*0x2b, up to two
    #                                     [kind, a, b, name] per side (ovl41:1244; rules.heroes.news)
    battle_work: BattleWork = field(default_factory=BattleWork)   # last battle's DGROUP arrays
    # The talking advisor (ovl58:026f(5), rules.turn.advice): it writes SCN bytes 0x100 / 0x108
    # and rolls the game's dice, so its switches are game state.  Session settings in the
    # original, set by the caller (presentation) from the sound settings; off by default.
    advisor_talking: int = 0              # DS:26c8 == 0 (OPTIONS.SND digit 2, ovl33:05b7 toggle)
    advisor_digital: int = 0              # DS:37a4 != 0: sample groups, else caption groups (+30)
    advisor_groups: dict = field(default_factory=dict)   # FILE.DAT group -> number of entries
    #                                     (ovl59:052f picks a random one), for the advisor's groups
    ai: list[AiBlock] = field(default_factory=new_ai_blocks)   # AI blocks DS:40ca[p] (model/ai.py)
    # The DGROUP caches of income and upkeep, one signed word per side: DS:5dca[8] (written only
    # by ovl62:0372) and DS:5dda[8] (only by ovl62:02bf); every reader indexes them by SCN 0x110
    # (rules/economy.py: refreshes and readers).  They stay stale between refreshes (new units,
    # disbands without 0b62:089a, purchases, items taken by a search).  The EXE save does not
    # hold them (its DGROUP block is DS:5d64, 0x54 bytes, ovl49:0ad1 / read 0623) and a load recomputes them
    # (ovl49:0361..036b, 136f..1379); snapshot / restore / copy keep the stale values.  Zero
    # (DGROUP start) until the first refresh: no new-game path calls 0372 / 02bf.
    income_cache: list[int] = field(default_factory=lambda: [0] * 8)
    upkeep_cache: list[int] = field(default_factory=lambda: [0] * 8)
    # The DGROUP city counts DS:5dea[8], one signed word per side, written only by ovl62:03f9
    # (`rules.economy.refresh_cities`, its call sites listed there) and read wherever the EXE
    # asks how many cities a side owns (`rules.economy.cached_cities`).  Stale in between: the
    # burning of Resign and the raze of a captured city (ovl32:016b) change owners without
    # 03f9.  Not in the EXE save either (DS:5d64 + 0x54 ends below it); the loads recount it
    # (ovl49:0361, 136f).  Zero (DGROUP start) until the first 03f9: the new game calls none
    # before the first main-loop pass.
    city_counts: list[int] = field(default_factory=lambda: [0] * 8)

    def __post_init__(self):
        # The production report list (Report > Production, ovl43): the block DS:4464
        # (`ProductionReport`, a sequence of `ReportEntry`s in block order), refilled by every side's start-of-turn production ovl43:0000 (count reset at
        # 0016; rules.city.deliver), read by ovl43:07e5 / 086e (rules.reports.production_list).
        # Heap memory of the running program, not game state: the block (handle DS:0e4c) is
        # allocated once per run (ovl43:076d, count zeroed only then, 07aa) and no save or load
        # touches it (only ovl43 reads or writes DS:4464 / 0e4c: grep of out/asm), so a plain attribute,
        # not a field: model.serialize does not save it, GameState.hash does not cover it, a
        # load starts empty (a fresh run: the first ovl43:07e5 allocates, count 0) and
        # serialize.restore leaves it as it is; GameState.copy and rules.engine.apply's
        # rollback keep it.  In one EXE run a loaded or new game shows the previous game's
        # list until the next ovl43:0000 (`rules.saveload.RunPart.production_report` carries
        # the block into a loaded game).
        self.production_report = ProductionReport()
        # How often the palette draw ovl66:0356 ran on this state (`rules.selection.redraw_palette`
        # counts it): presentation bookkeeping for the user interface, which keeps the info area
        # as 0356 last drew it (`ui.palettes.Painter`).  Not game state: not saved, not hashed.
        self.palette_draws = 0

    def army_type(self, type_id: int) -> ArmyType:
        """The record with this id; the game scans for type_id (tables.md §1, ovl44:14ac).
        Type byte 0xff (stored as -1 by rules.city.create_unit, 0xff by a freed record) gives
        `NO_TYPE`: its six DS:45c4-table flags are what the EXE reads for it (all 0), its other
        words are 0 where the EXE keeps a stale buffer (model/army.py, register X36)."""
        for t in self.army_types:
            if t.type_id == type_id:
                return t
        if isinstance(type_id, int) and type_id & 0xFF == NO_TYPE_ID:
            return NO_TYPE
        raise KeyError(type_id)

    def fight_order_byte(self, row: int, type_id: int) -> int:
        """SCN byte 0x60b + row * 29 + type with the type byte sign-extended, as every reader
        indexes it (asm ovl38:04c6..04d8 / 051a..0527, 0b62:0140..0151 / 0b56..0b68 /
        0c8e..0ca0, ovl64:2b1e..2b2b: mov al,[+4]; cwde; add).  For type 0xff that is the byte
        before the row: the previous row's type-28 entry, or for row 0 SCN 0x60a, the
        level/exp byte 2c04:05e3 + 39 of hero slot 39 (bits 0-1 level, 2-7 exp; EL §5.1)."""
        off = row * 29 + (type_id & 0xFF) - ((type_id & 0x80) << 1)
        if off >= 0:
            return self.fight_order[off // 29][off % 29]
        if off == -1:
            h = self.heroes[39]
            return ((h.exp & 0x3F) << 2 | (h.level & 3)) & 0xFF
        raise IndexError((row, type_id))

    def city_at(self, x: int, y: int) -> int:
        """Index of the city whose 2x2 block covers (x, y), else -1 (ovl62:044a)."""
        for i, c in enumerate(self.cities):
            if c.x in (x, x - 1) and c.y in (y, y - 1):
                return i
        return -1

    def site_at(self, x: int, y: int) -> int:
        """Index of the site at (x, y), else -1 (sites are looked up by x, y: EL §5.4)."""
        for i, s in enumerate(self.sites):
            if (s.x, s.y) == (x, y):
                return i
        return -1

    def hash(self) -> str:
        """SHA-256 of the canonical serialised state (incl. RNG state): what a save holds, so
        not the AI's process words (model.ai.AiProcess)."""
        from .serialize import dump
        blob = json.dumps(dump(self), sort_keys=True, separators=(",", ":"))
        return hashlib.sha256(blob.encode()).hexdigest()

    def copy(self) -> GameState:
        """A snapshot: the game and a copy of its AI process words."""
        from .serialize import dump, load
        new = load(dump(self))
        new.ai.proc = self.ai.proc.snapshot(new.ai.blocks)
        new.production_report = self.production_report.copy()
        return new
