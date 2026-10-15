"""Combat: battle set-up, fight order, the battle loop, the advisor and the Attack command.

Sources (re-read by M5a from out/rea/decomp/ and out/asm/; EL = docs/research/exe_logic.md §3):

* attack(x, y)            ovl36:0000 (L 0x67a70), prelude ovl36:0522 (L 0x67f92)
* battle set-up           ovl38:008b (L 0x6a6ab): sides, fight order, strengths (rules/bonuses.py)
* battle loop             ovl36:08a6 (L 0x68316)
* after the battle        ovl36:0a6b (L 0x684db): casualties, hero exp, square owner, city take-over
* advisor                 ovl36:1f19 -> ovl36:2065 (19 runs of ovl36:124a in mode 0)
* computer battle         ovl36:124a(x, y, 1) (`ai_battle`, ai.md §7a.7), from 0a8b:0254 / 0476

Randomness: only `state.rng.rnd(1, die, 0)`, two calls per roll pair, defender's roll first
(asm ovl36:0918..095f), so a Borland generator reproduces the original sequence.

Steps of the after-battle path that belong to other milestones are called through `HOOKS`
(resolved by name, like the engine dispatch).  A missing hook makes `attack` raise
`NotImplementedCommand` before anything changes; with unverified values allowed
(`--allow-unverified`) it is skipped with a warning and listed in `BattleEnded.info["skipped"]`.
The selection follows the original: the attacking group is adopted, the survivors become the
moving group after the battle (ovl36:0afd) and a won attack re-selects the target square's
stack (ovl67:06eb, ovl36:0490).  The set-up writes the battle arrays of `state.battle_work`
(also during advisor trials).
The move mode, the group flag, the count and the lowest moves are the stored selection words
of 0c8c:0529 (`state.selection`, rules.movement.store_selection_words), not recomputed.
Not modelled (presentation only): the battle display and messages, and the recount caches
ovl62:03f9 / 02bf / 0372.
"""
from __future__ import annotations

import importlib
import logging
from dataclasses import dataclass, field

from ..model import commands as C
from ..model import events as E
from ..model.ids import (HERO_TYPE, MAP_ARMY, MAP_FORTIFIED, MAP_H, MAP_OWNER_MASK, MAP_W,
                         NO_OWNER, Control, ItemType, Terrain)
from ..model.state import BATTLE_A_SLOTS, BATTLE_D_SLOTS, SCN_TUTORIAL
from .bonuses import (ABOARD_FLAG, RecordBuffer, SideBonus, battle_class, carried_items,
                      city_bonus, s8, side_bonus, side_total, unit_strength)
from .constants import combat as K
from .constants import movement as KM
from .constants import unverified_allowed
from .engine import IllegalCommand, NotImplementedCommand
from .mapwords import refresh_map
from .present import present
from .constants import turn as KT
from .economy import refresh as refresh_caches
from .economy import refresh_cities
from .movement import adopt_selection, armies_at, remove_army, type_flag
from .selection import select_army_stack
from .visibility import reveal

log = logging.getLogger(__name__)

AI_SIDES = 8                      # ovl36:1294 / 12c8: d < 8 (a side, not neutral)
MAX_STACK = 8                     # DS:5e3e holds 8 far pointers (ovl36:0522 loops 8)

# name -> (milestone, "module:function", what it must do, EL / EXE address)
HOOKS = {
    "ai_memory": ("M8b1", "warlords2.ai.base:record_battle",
                  "f(state, battle) -> None: per-side attack memory", "ovl25:09d7"),
    "history": ("M9a", "warlords2.rules.history:record_battle",
                "f(state, battle) -> list[Event]: battle statistics and city-history entries",
                "ovl36:1aff, ovl41:1244 calls in ovl36:0a6b"),
    "hero_died": ("M7a", "warlords2.rules.heroes:hero_died",
                  "f(state, army_id, x, y) -> list[Event], before the army is deleted", "ovl36:16cd"),
    "add_exp": ("M7a", "warlords2.rules.heroes:add_exp",
                "f(state, army_id, n) -> list[Event]", "ovl47:04f1 (EL §5.3)"),
    "take_city": ("M6a", "warlords2.rules.city:take_city",
                  "f(state, city, attacker, owner, flying) -> list[Event]: loot, owner, vectors, transit",
                  "ovl36:0d2f..0f8e (EL §6.5)"),
    "medals": ("M7a", "warlords2.rules.heroes:award_medal",
               "f(state, battle) -> list[Event]; battle.attacker_won is the caller argument",
               "ovl36:2274 (EL §5.8), argument = battle result (asm ovl36:0498)"),
    "quest_check": ("M7a", "warlords2.rules.quests:after_battle",
                    "f(state, battle, captured) -> (int, list[Event]); nonzero skips the capture prompt",
                    "ovl01:1ded (asm ovl36:04b7/04d7)"),
    "ai_after_battle": ("M8b4", "warlords2.ai.phases.quick_attack:after_battle",
                        "f(state, x, y) -> list[Event]: the computer's quest-city bookkeeping",
                        "ovl26:038d at ovl36:16a3"),
}
# The hooks each battle path reaches (ovl36:0000 / ovl36:124a(x, y, 1)).
ATTACK_HOOKS = ("ai_memory", "history", "hero_died", "add_exp", "take_city", "medals", "quest_check")
AI_BATTLE_HOOKS = ATTACK_HOOKS + ("ai_after_battle",)


# ------------------------------------------------------------------------------- set-up


@dataclass
class Setup:
    """The battle arrays of ovl38:008b (DS:41fa..436a)."""
    x: int
    y: int
    attacker: int                 # DS:41fa = SCN 0x110
    owner: int                    # DS:41fb, owner nibble of the target square
    terrain: int                  # SCN 0x710 type of the target square
    battle_class: int             # ovl38:0000
    city: int                     # city index for a type-10 target, else -1 (DS:41dd)
    tiles: list                   # DS:41e9/41e1: city 2x2 squares, or the target
    first_fortified: bool         # bit 0x2000 of DS:41f2 (first square word at set-up)
    attackers: list               # army ids in fight order (DS:42c6)
    defenders: list               # army ids in fight order (DS:42e6)
    a_order: list
    d_order: list
    a_strength: list              # DS:429c
    d_strength: list              # DS:42a4
    a_aboard: list                # DS:41fc
    d_aboard: list                # DS:4204
    a_bonus: SideBonus
    d_bonus: SideBonus
    city_bonus: int
    a_total: int
    d_total: int


def _armies_by_id(state) -> dict:
    return {a.id: a for a in state.armies}




def fight_order(state, row: int, armies: list, terrain: int) -> list:
    """Armies of one side in fighting order, with their order values.
    Evidence: decomp 06a6ab (ovl38:008b; EL §3.2): value = signed byte SCN[0x60b + row*29 + type]
    with the type byte sign-extended (asm ovl38:04c6..04d8 side B, 051a..0527 side A: mov al,
    [+4]; cwde), i.e. `GameState.fight_order_byte` (type 0xff: the byte before the row, X36);
    on target terrain 2, 3 or 6 the first non-aboard unit whose type flies (DS:45c4) gets +80
    (byte arithmetic) if the side contains a hero (type 0x1c); then a stable insertion sort,
    ascending (strict < comparisons)."""
    vals = [s8(state.fight_order_byte(row, a.type_id)) for a in armies]
    if terrain in K.FLYER_SHIFT_TERRAIN.value and any(a.type_id == HERO_TYPE for a in armies):
        for i, a in enumerate(armies):
            if not a.flags & ABOARD_FLAG and type_flag(state, a.type_id, "flag16"):
                vals[i] = s8(vals[i] + K.FLYER_SHIFT.value)
                break
    idx = sorted(range(len(armies)), key=lambda i: vals[i])        # stable = insertion sort
    return [(vals[i], armies[i]) for i in idx]


def defenders_at(state, x: int, y: int) -> list:
    """Armies defending (x, y) in set-up scan order.
    Evidence: decomp 06a6ab: army table scanned from the top index down; every army whose owner
    byte differs from the attacker (SCN 0x110) on the square, or on the city's 2x2 squares when
    the target is terrain 10."""
    cur = state.current
    if state.world.terrain(x, y) == Terrain.CITY:
        ci = state.city_at(x, y)
        if ci < 0:
            raise IllegalCommand("city square (%d, %d) without a city record" % (x, y))
        cx, cy = state.cities[ci].x, state.cities[ci].y
        inside = lambda a: cx <= a.x <= cx + 1 and cy <= a.y <= cy + 1
    else:
        inside = lambda a: a.x == x and a.y == y
    return [a for a in sorted(state.armies, key=lambda a: a.id, reverse=True)
            if a.owner != cur and inside(a)]


def prepare(state, group, x: int, y: int) -> Setup:
    """Build both sides of a battle at (x, y): fight order, bonuses, unit strengths; record the
    set-up in `state.battle_work` (the DGROUP arrays later readers use).
    Evidence: ovl38:008b (decomp 06a6ab, asm ovl38:008b..0d19; EL §3.2-3.3).  Side A is `group`
    in its given order (DS:5e3e); defender row of the fight order = min(owner nibble, 8).
    DS:41fa / 41fb, the sorted pointers DS:42c6 / 42e6, alive DS:4224 / 422c = 1 for the
    counts (asm ovl38:042d), and the type bytes DS:424c[i] / 4254[i] = army +4 for i below the
    side's count only (asm ovl38:06e5..072d); the bytes past it keep the previous set-up's.
    More than 32 defenders (the original writes past DS:4254 into the hit arrays) raise
    RuntimeError (deliberate divergence)."""
    by_id = _armies_by_id(state)
    w = state.world
    c = battle_class(state, x, y)
    owner = w.flags[y * MAP_W + x] & MAP_OWNER_MASK
    terrain = int(w.terrain(x, y))
    if terrain == Terrain.CITY:
        ci = state.city_at(x, y)
        if ci < 0:
            raise IllegalCommand("city square (%d, %d) without a city record" % (x, y))
        cx, cy = state.cities[ci].x, state.cities[ci].y
        tiles = [(cx + dx, cy + dy) for dx, dy in zip(K.CITY_TILE_DX.value, K.CITY_TILE_DY.value)]
    else:
        ci, tiles = -1, [(x, y)]
    fx, fy = tiles[0]
    att = fight_order(state, state.current, [by_id[i] for i in group], terrain)
    dfn = fight_order(state, min(owner, K.FIGHT_ORDER_ROWS.value - 1), defenders_at(state, x, y), terrain)
    a_units = [a for _, a in att]
    d_units = [a for _, a in dfn]
    _record_setup(state, a_units, d_units, owner)
    buf = RecordBuffer()                     # [bp-0x70], shared by the four loops below
    ab = side_bonus(state, a_units, c, buf)                                # asm 073b
    db = side_bonus(state, d_units, c, buf)                                # asm 0876
    cb = city_bonus(state, x, y, c, tiles[0], ci, owner, ab.cancel_city)
    a_total = side_total(state, ab, db)
    d_total = side_total(state, db, ab, cb)
    a_str = [unit_strength(state, a, a_total, c, terrain, buf) for a in a_units]   # asm 0a9d
    d_str = [unit_strength(state, a, d_total, c, terrain, buf) for a in d_units]   # asm 0bdc
    return Setup(x, y, state.current, owner, terrain, c, ci, tiles,
                 bool(w.flags[fy * MAP_W + fx] & MAP_FORTIFIED),
                 [a.id for a in a_units], [a.id for a in d_units],
                 [v for v, _ in att], [v for v, _ in dfn],
                 [s for s, _ in a_str], [s for s, _ in d_str],
                 [b for _, b in a_str], [b for _, b in d_str],
                 ab, db, cb, a_total, d_total)


def _record_setup(state, a_units: list, d_units: list, owner: int) -> None:
    """The DS:41fa..436a writes of ovl38:008b (see `prepare`)."""
    if len(a_units) > BATTLE_A_SLOTS or len(d_units) > BATTLE_D_SLOTS:
        raise RuntimeError("%d attackers / %d defenders: ovl38:008b writes past its arrays"
                           % (len(a_units), len(d_units)))
    bw = state.battle_work
    bw.attacker, bw.owner = state.current, owner
    bw.attackers = [a.id for a in a_units]
    bw.defenders = [a.id for a in d_units]
    bw.a_alive = [1] * len(a_units)
    bw.d_alive = [1] * len(d_units)
    bw.a_types[:len(a_units)] = [a.type_id & 0xFF for a in a_units]
    bw.d_types[:len(d_units)] = [a.type_id & 0xFF for a in d_units]


# ------------------------------------------------------------------------------- battle loop


@dataclass
class Battle:
    setup: Setup
    attacker_won: bool
    unopposed: bool               # DS:41b2: a side was empty
    a_alive: list                 # DS:4224
    d_alive: list                 # DS:422c
    a_hits: list                  # DS:4274 (final; a unit dies below 0)
    d_hits: list                  # DS:427c
    kills: list                   # DS:41b5 log: 1 = an attacking unit died, 0 = a defending one
    duels: list = field(default_factory=list)   # one dict per duel (pairing until a death)
    rolls: int = 0                # roll pairs drawn

    @property
    def a_survivors(self) -> int:
        """Evidence: ovl36:124a (mode 0) counts DS:4224[i] != 0 into DS:4132 (asm ovl36:133d..134c;
        decomp 068cba names the same word DAT_451b_01d2)."""
        return sum(self.a_alive)

    @property
    def d_survivors(self) -> int:
        """Evidence: ovl36:124a (mode 0) counts DS:422c[i] != 0 into DS:412e (asm ovl36:1357..1366;
        decomp 068cba names the same word DAT_451b_01ce)."""
        return sum(self.d_alive)


def die_size(state) -> int:
    """Evidence: asm ovl36:091f..092c: 24 with Intense Combat (2c04:0126), else 20."""
    return K.DIE_INTENSE.value if state.options.intense_combat else K.DIE.value


def fight(state, setup: Setup) -> Battle:
    """Run the battle loop on a prepared set-up; consumes `state.rng` and leaves the alive
    flags in `state.battle_work` (DS:4224 / 422c).
    Evidence: asm ovl36:08a6..0a6a (EL §3.4).  Each duel pairs the current unit of each side with
    sa = max(1, strength); per roll pair r1 (defender) then r2 (attacker) = rnd(1, die, 0); when
    the duel's counter was already > 10000 the pair is forced to (0, 100).  r1 <= sd and r2 > sa:
    the attacker loses a hit, unless the tutorial flag SCN 0x12e is set, the attacking unit is a
    hero, the attacker is human (SCN 0xd0) and the owner nibble is 0xf; r1 > sd and r2 <= sa: the
    defender loses a hit; otherwise roll again.  Hits start at 1, a unit dies below 0 and the next
    unit of its side steps up; hits carry over between duels; the counter resets per duel.
    Deliberate divergence: once the counter passes 10000 against an immune tutorial hero every
    pair is the forced (0, 100), a defender hit the immunity ignores, so ovl36:08a6 never returns
    (the original hangs); here that raises RuntimeError instead."""
    na, nd = len(setup.attackers), len(setup.defenders)
    b = Battle(setup, True, False, [True] * na, [True] * nd,
               [K.HITS_START.value] * na, [K.HITS_START.value] * nd, [])
    if na == 0 or nd == 0:
        b.unopposed = True
        return b
    die = die_size(state)
    a_types = [_type_of(state, i) for i in setup.attackers]
    immune_side = (state.flags.get(SCN_TUTORIAL, 0) != 0
                   and state.players[setup.attacker].control == Control.HUMAN
                   and setup.owner == NO_OWNER)
    limit = K.ROLL_LIMIT.value
    forced_d, forced_a = K.FORCED_ROLLS.value
    si = di = 0
    while True:
        sd = max(K.MIN_DUEL_STRENGTH.value, setup.d_strength[di])
        sa = max(K.MIN_DUEL_STRENGTH.value, setup.a_strength[si])
        duel = {"attacker": setup.attackers[si], "defender": setup.defenders[di],
                "a_strength": sa, "d_strength": sd, "hits": [], "rolls": 0}
        counter = 0
        while True:
            r1 = state.rng.rnd(1, die, 0)
            r2 = state.rng.rnd(1, die, 0)
            forced = counter > limit
            counter += 1
            b.rolls += 1
            duel["rolls"] += 1
            if forced:
                r1, r2 = forced_d, forced_a
            d_ok, a_ok = r1 <= sd, r2 <= sa
            if d_ok == a_ok:
                continue
            if d_ok:                                       # defender scores
                if immune_side and a_types[si] == HERO_TYPE:
                    if forced:
                        raise RuntimeError("ovl36:08a6 never ends: forced roll against an immune "
                                           "tutorial hero")
                    continue
                duel["hits"].append("attacker")
                b.a_hits[si] -= 1
                if b.a_hits[si] < 0:
                    b.a_alive[si] = False
                    b.kills.append(1)
                    duel["loser"] = "attacker"
                    si += 1
                    break
            else:                                          # attacker scores
                duel["hits"].append("defender")
                b.d_hits[di] -= 1
                if b.d_hits[di] < 0:
                    b.d_alive[di] = False
                    b.kills.append(0)
                    duel["loser"] = "defender"
                    di += 1
                    break
        b.duels.append(duel)
        if di == nd or si == na:
            b.attacker_won = di == nd
            state.battle_work.a_alive = [int(v) for v in b.a_alive]
            state.battle_work.d_alive = [int(v) for v in b.d_alive]
            return b


def _type_of(state, army_id: int) -> int:
    return _armies_by_id(state)[army_id].type_id


def resolve(state, group, x: int, y: int) -> Battle:
    """Set up and fight a battle; changes only the RNG and `state.battle_work`.
    Evidence: ovl38:008b then ovl36:08a6, as called from ovl36:0000 / ovl36:124a."""
    return fight(state, prepare(state, tuple(group), x, y))


def simulate(state, group, x: int, y: int) -> tuple:
    """(defenders, defender survivors, attackers, attacker survivors) of one trial battle.
    Evidence: ovl36:124a with argument 0 (asm ovl36:130f..1376; decomp 068cba, where they appear
    as 451b:01cc..01d2): set-up, battle loop, counts into DS:412c (defenders), 412e (defender
    survivors), 4130 (attackers), 4132 (attacker survivors); nothing else changes but the
    battle arrays (`state.battle_work`; the stack is not moved, so land units are not put
    aboard - the misprediction MAN p.36 mentions)."""
    b = resolve(state, group, x, y)
    return len(b.d_alive), b.d_survivors, len(b.a_alive), b.a_survivors


def odds(state, group, x: int, y: int) -> int:
    """Military Advisor verdict index 0..9 for attacking (x, y) with `group`.
    Evidence: ovl36:2065 (asm ovl36:2065..20a7), called by the advisor ovl36:1f19 when SCN 0x12c
    is set: 19 trial battles (ovl36:124a mode 0) on the game's RNG; count those with an attacker
    survivor; return count / 2.  Consumes `state.rng` exactly as the original does."""
    wins = sum(1 for _ in range(K.ADVISOR_RUNS.value) if simulate(state, group, x, y)[3] > 0)
    return wins // K.ADVISOR_DIVISOR.value


# ------------------------------------------------------------------------------- hooks


def _hook(name):
    milestone, target, _, _ = HOOKS[name]
    mod, fn = target.split(":")
    try:
        module = importlib.import_module(mod)
    except ModuleNotFoundError as e:
        if not (e.name and mod.startswith(e.name)):
            raise
        return None
    return getattr(module, fn, None)


def _require_hooks(names=ATTACK_HOOKS, cmd_cls=C.Attack) -> None:
    if unverified_allowed():
        return
    for name in names:
        milestone, target, _, _ = HOOKS[name]
        if _hook(name) is None:
            raise NotImplementedCommand(cmd_cls, milestone, target)


def require_ai_battle_hooks() -> None:
    """Strict mode: raise NotImplementedCommand (for the computer turn, EndTurn) unless every
    hook the computer battle reaches exists; nothing changes before.
    Evidence: ovl36:124a(x, y, 1) calls ovl25:09d7 (1502), ovl36:0a6b (1543: ovl36:1aff /
    ovl41:1244, 16cd, ovl47:04f1, 0d2f..0f8e), 2274 (1686), ovl01:1ded (1697), ovl26:038d (16a3)."""
    _require_hooks(AI_BATTLE_HOOKS, C.EndTurn)


def _call(name, skipped: list, default, *args):
    f = _hook(name)
    if f is None:
        milestone, target, _, _ = HOOKS[name]
        log.warning("after-battle step %s (%s, %s) not implemented; skipped", name, target, milestone)
        if name not in skipped:
            skipped.append(name)
        return default
    return f(*args)


# ------------------------------------------------------------------------------- map words


def _set_owner(state, x: int, y: int, owner: int) -> None:
    i = y * MAP_W + x
    state.world.flags[i] = (state.world.flags[i] & 0xF0) | (owner & MAP_OWNER_MASK)


# ------------------------------------------------------------------------------- Attack


def _group(state, ids) -> list:
    by_id = _armies_by_id(state)
    ids = tuple(ids)
    if not 1 <= len(ids) <= MAX_STACK or len(set(ids)) != len(ids):
        raise IllegalCommand("attack needs 1..8 distinct armies")
    if any(i not in by_id for i in ids):
        raise IllegalCommand("unknown army in %r" % (ids,))
    armies = [by_id[i] for i in ids]
    if any(a.owner != state.current for a in armies):
        raise IllegalCommand("armies not owned by the current player")
    if len({(a.x, a.y) for a in armies}) != 1 or armies[0].y < 0:
        raise IllegalCommand("armies not on one map square")
    return armies


def _flight_items(state, army) -> int:
    return sum(1 for i in carried_items(state, army) if state.items[i].type == ItemType.FLIGHT)


def relation_byte(state, a: int, b: int) -> int:
    """The byte 2c04:153b[a*8 + b] as the EXE reads it.
    Evidence: decomp 067a70 reads 2c04:153b + cur*8 + owner with owner up to 8 (neutral): for
    b = 8 that is the next row's first byte, and for a = 7 the low byte of the city count
    2c04:157b which follows the 64-byte table (EL §6.1)."""
    flat = a * 8 + b
    if flat < 64:
        return state.relations[flat // 8][flat % 8]
    if flat == 64:
        return len(state.cities) & 0xFF
    raise IllegalCommand("relation byte beyond the table (%d, %d)" % (a, b))


def attack(state, cmd: C.Attack) -> list:
    """Attack (x, y) with a stack.
    Evidence: ovl36:0000 (decomp 067a70; EL §3.1, §3.5): refused when the square cannot be entered
    (DS:1274 cost < 1, no road, stack not flying), when the stack has < 1 move, when the square's
    owner nibble is the attacker, or when a non-city square has no army; with Diplomacy on and a
    peace relation (or relation 1 and city index > 0, as coded) the treachery question is asked
    instead (TreacheryPrompt pending).  "Flying" is the stored DS:5dfc == 2 (asm 003f), the
    move test the stored DS:5e00 with DS:2bda, else the leader's +7 (0189..01a7).  Then
    ovl36:0522 (`_prelude`): on Water/Shore a non-flying stack whose
    selected army is not aboard puts every non-flying member without a flight item aboard with
    0 moves; every member pays max(2, DS:1274[t]) (floored at 0), moves onto the target and loses
    its goto; that cost stays in DS:4160 (`state.battle_work.attack_cost`), which the computer's
    battle `ai_battle` charges; the view words are updated for the leader's old square.
    DS:4160 is written at 0211, before the own-square (0237) and nothing-to-attack (026c)
    refusals; here those raise IllegalCommand and write nothing.  The difference cannot be
    observed: the EXE calls ovl36:0000 only for a square whose owner nibble is not the side's
    and that is a City or carries the army bit - 0c8c:041f (046a) after 0c8c:01fd returned 3 or
    5 (0a8b:07f9 sets those only for such squares, 08e9..0966), the map menu ovl46:0177 for the
    cursors 8 / 10 of 08a9:0896 (0b29..0b45 test exactly that), and ovl36:20a8's second call
    (21ee) on the square of a first call that passed 08a9 or 07f9 - so a refused call never
    happens there; only a command naming such a square can ask for one.
    Set-up ovl38:008b, city +0x30 |= DS:0cbe[p], battle
    ovl36:08a6, AI memory, map refresh ovl62:0000, after-battle ovl36:0a6b (the surviving
    attackers become the selection), army bit, re-selection, medals ovl36:2274(result), quest
    check ovl01:1ded, capture choice
    (CityCaptured pending).  The group is made the selection first (rules.movement.adopt_selection: the
    original attacks with DS:5e62 / 5e3e).  A stack with < 1 move is not refused: the original
    deselects it (0b62:08b3 at asm ovl36:01a9..01be) and nothing else happens, so that returns
    no events.  A won attack selects the stack of the target square's first army (asm
    ovl36:045b..0490: 0b62:007d into DS:5e62, ovl67:06eb) before the medal call, which reads the
    re-selected DS:5e3e.  Text rolls (register X33): a won attack on a City square without
    defenders (DS:41b2) draws the line of STRING 0x8d, rnd(1, 4, -1) at ovl36:0316 (after the
    map refresh 02ee, before 0a6b at 043c), into BattleEnded info "fled_text"; the capture
    choice ovl31:0000 (ovl36:04f7, after the quest check; for a human with a completed quest
    after the reward dialog, still after its rolls) draws STRING 0x42 then 0x43, rnd(1, 4, -1)
    and rnd(1, 3, -1) at ovl31:0039 / 005a, into CityCaptured info "texts" = [i42, i43]."""
    if not (0 <= cmd.x < MAP_W and 0 <= cmd.y < MAP_H):
        raise IllegalCommand("target off the map")
    armies = _group(state, cmd.group)
    adopt_selection(state, [a.id for a in armies])
    sel = state.selection
    x, y = cmd.x, cmd.y
    w = state.world
    idx = y * MAP_W + x
    t = int(w.terrain(x, y))
    flying = sel.mode == KM.MODE_FLY.value              # stored DS:5dfc == 2 (asm ovl36:003f)
    cost_t = KM.TERRAIN_COST.value[t]
    if not flying and cost_t < 1 and w.road(x, y) == 0:
        raise IllegalCommand("target square cannot be entered")
    ci = state.city_at(x, y)
    owner = w.flags[idx] & MAP_OWNER_MASK
    if state.options.diplomacy and owner != NO_OWNER:
        rel = relation_byte(state, state.current, owner) & 3
        if rel == 0 or (ci > 0 and rel == 1):
            ev = E.TreacheryPrompt({"attacker": state.current, "other": owner, "x": x, "y": y,
                                    "group": list(cmd.group), "city": ci})
            state.pending = ev
            return [ev]
    lead = state.armies[sel.selected]                   # DS:5e62 (adopted: one of `armies`)
    if (sel.moves if sel.group else s8(lead.moves_left)) < K.MOVES_NEEDED.value:   # 0189..01a7
        state.selection.selected = -1                   # 0b62:08b3 (asm ovl36:01b1)
        return []
    cost = max(K.ATTACK_COST_MIN.value, cost_t)
    if owner == state.current:
        raise IllegalCommand("own square")
    if t != Terrain.CITY and not w.flags[idx] & MAP_ARMY:
        raise IllegalCommand("nothing to attack")
    _require_hooks()
    state.battle_work.attack_cost = cost                # DS:4160 (asm ovl36:0211)

    events = _prelude(state, lead, x, y, t, cost, list(cmd.group), (lead.x, lead.y))
    skipped: list = []
    # ---- set-up and battle
    setup = prepare(state, tuple(cmd.group), x, y)
    if setup.city >= 0:
        state.cities[setup.city].attacked_by |= K.OWNER_BITS.value[state.current]
    events.append(E.BattleStarted({"x": x, "y": y, "attacker": setup.attacker, "owner": setup.owner,
                                   "attackers": setup.attackers, "defenders": setup.defenders,
                                   "a_strength": setup.a_strength, "d_strength": setup.d_strength}))
    battle = fight(state, setup)
    events += [E.Duel(d) for d in battle.duels]
    _call("ai_memory", skipped, None, state, battle)
    refresh_map(state)                                  # asm ovl36:02ee
    fled = None
    if battle.attacker_won and t == Terrain.CITY and battle.unopposed:     # asm ovl36:02f3..0314
        fled = state.rng.rnd(1, K.FLED_GROUP_COUNT.value, K.TEXT_ROLL_ADD.value)   # 0316
    captured, take_ran = _after_battle(state, battle, events, skipped)
    if battle.attacker_won:
        w.flags[idx] |= MAP_ARMY                         # asm ovl36:0472
        first = armies_at(state, x, y)                   # asm ovl36:047f (0b62:007d)
        if first:
            events += select_army_stack(state, first[0])  # asm ovl36:0490 (ovl67:06eb)
    events += _call("medals", skipped, [], state, battle)
    result, evs = _call("quest_check", skipped, (0, []), state, battle, captured)
    events += evs
    end = {"attacker_won": battle.attacker_won, "unopposed": battle.unopposed,
           "kills": battle.kills, "captured": captured, "skipped": skipped}
    if fled is not None:
        end["fled_text"] = fled
    events.append(E.BattleEnded(end))
    if captured and result == 0 and take_ran:
        texts = [state.rng.rnd(1, n, K.TEXT_ROLL_ADD.value)            # ovl31:0039, 005a
                 for n in K.CAPTURE_GROUP_COUNTS.value]
        ev = E.CityCaptured({"city": setup.city, "attacker": setup.attacker, "owner": setup.owner,
                             "texts": texts})
        state.pending = ev
        events.append(ev)
    return events


def _prelude(state, lead, x: int, y: int, t: int, cost: int, group_ids, view_from) -> list:
    """ovl36:0522(x, y, vx, vy) on the selection: the leader DS:5e62 not aboard, the target Water
    / Shore and the stored DS:5dfc != 2: every DS:5e3e[0..7] army that does not fly and holds no
    flight item goes aboard with 0 moves, and DS:5e00 = 0 (061d, also when nobody boarded);
    then with DS:2bda DS:5e00 = max(0, DS:5e00 - `cost`) (0641) and every DS:5e3e member, else
    DS:5e62 alone, pays `cost` (DS:4160, floored at 0), stands on (x, y) and loses its goto.
    `view_from` = (vx, vy), the leader's square before the move, from the human attack; None
    for the computer's (vx = -1, 124a passes -1L), which skips the view update `_attack_view`.
    Evidence: asm ovl36:0522..08a5 (0530..053c vx == -1, 053f..05a0 aboard / terrain 3, 2,
    05a3 DS:5dfc, 05aa..061b board loop over slots 0..7 (05d5 DS:45c4 flag, 05e9 ovl35:08b4),
    061d, 0623 DS:2bda, 062d..0641 DS:5e00, 0644..06d3 slots 7..0, 06d8..0712 single, 0718
    view)."""
    from .movement import _group_records                # DS:5e3e[0..7] records
    sel = state.selection
    events = []
    fx0, fy0 = lead.x, lead.y
    board = _group_records(state)
    if (not lead.flags & ABOARD_FLAG and t in K.ABOARD_TERRAIN.value
            and sel.mode != KM.MODE_FLY.value):
        boarded = []
        for a in board:
            if not type_flag(state, a.type_id, "flag16") and _flight_items(state, a) == 0:
                a.flags |= ABOARD_FLAG
                a.moves_left = 0
                boarded.append(a.id)
        sel.moves = 0                                   # asm ovl36:061d
        if boarded:
            events.append(E.Embarked({"armies": boarded, "x": fx0, "y": fy0}))
    if sel.group:
        sel.moves = max(sel.moves - cost, 0)            # asm ovl36:062d..0641
    for a in (board if sel.group else [lead]):
        a.moves_left = 0 if s8(a.moves_left) < cost else a.moves_left - cost
        a.x, a.y = x, y
        a.goto = (-1, -1)
    if view_from is not None:
        _attack_view(state, view_from, x, y)
    events.append(E.Moved({"group": group_ids, "from": (fx0, fy0), "to": (x, y),
                           "cost": cost, "attack": True}))
    return events


def _attack_view(state, frm, x: int, y: int) -> None:
    """The end of ovl36:0522 for the human attack: the view words SCN 0x175 top, 0x177 left,
    0x179 bottom, 0x17b right, 0x17d / 0x17f centre.  `frm` (vx, vy) = the leader's square
    before the move.  Unless it lies strictly inside the view (left < vx < right and top < vy
    < bottom, signed) the view is recentred on it: centre = (vx, vy), left / top = max(0, v - 4),
    right = min(vx + 4, 0x70), bottom = min(vy + 4, 0x9c) - its own clamp, not ovl64:0629's
    (rules.turn.centre_view clamps the centre to 4..107 / 4..151 and the edges to 0x6f / 0x9b)
    nor ovl65:0227's (rules.turn.set_view keeps 8 squares).  Otherwise it scrolls one square
    toward the target (x, y), each axis on its own: x > vx and centre x + 1 < x and right <
    0x6f -> centre x, left, right + 1; x < vx and centre x > x and left > 0 -> all three - 1;
    the same for y with centre y, top, bottom and 0x9b.  Nothing is redrawn here.
    Evidence: asm ovl36:0718..08a2 (071c skip when vx == -1; 0721..0748 inside test; 074b..07c8
    recentre: 0750 / 0757 centre, 075c..0771 top, 0775..078a left, 078e..07a7 right (cap 0x70),
    07ab..07c4 bottom (cap 0x9c); 07cb..0801 x up, 0801..0836 x down, 0836..086d y up, 086d..08a2
    y down)."""
    f = state.flags
    top, left, bottom, right, cx, cy = KT.SCN_VIEW.value
    vx, vy = frm
    m = K.ATTACK_VIEW_MARGIN.value
    xcap, ycap = K.ATTACK_VIEW_CAP.value
    xlim, ylim = K.ATTACK_SCROLL_LIMIT.value
    g = lambda k: f.get(k, 0)                                       # noqa: E731
    if not (g(left) < vx < g(right) and g(top) < vy < g(bottom)):
        f.update({cx: vx, cy: vy, top: max(vy - m, 0), left: max(vx - m, 0),
                  right: min(vx + m, xcap), bottom: min(vy + m, ycap)})
        return
    if x > vx and g(cx) + 1 < x and g(right) < xlim:
        f[cx], f[left], f[right] = g(cx) + 1, g(left) + 1, g(right) + 1
    if x < vx and g(cx) > x and g(left) > 0:
        f[cx], f[left], f[right] = g(cx) - 1, g(left) - 1, g(right) - 1
    if y > vy and g(cy) + 1 < y and g(bottom) < ylim:
        f[cy], f[top], f[bottom] = g(cy) + 1, g(top) + 1, g(bottom) + 1
    if y < vy and g(cy) > y and g(top) > 0:
        f[cy], f[top], f[bottom] = g(cy) - 1, g(top) - 1, g(bottom) - 1


def selection_group(state, null_leader_ok: bool = False) -> list:
    """The attacking side ovl38:008b takes from the current selection: slots 0..DS:5dfe-1 of
    DS:5e3e as they are when the stored DS:2bda is set, else DS:5e62 alone (both stored words,
    written by 0c8c:0529, rules.movement.store_selection_words; DS:5dfe also by ovl36:0a6b).
    DS:5dfe counts the non-null slots, so with a hole (a null slot before a live one, left by
    the AI's ovl29:14d3 / 0ae7) the copy takes the null slot and leaves the last live ones out;
    the latter is reproduced.  A null attacker is not: the set-up and the battle would read
    its fields through 0000:0000 (type byte 0000:0004 = int 1's offset, flags 0000:000c, the
    strength byte 0000:0008 ...), values of the machine's interrupt vector table; the engine
    leaves the null slot out of the attacking side (plan register X38, stand-in), so the side
    may be empty (ovl36:08a6's empty-side rule then applies, as for any count 0).  The same
    stand-in holds for a null DS:5e62 without DS:2bda, which the AI's 15c5 can meet
    (`null_leader_ok`, from `simulate_selection`); the Military Advisor's caller refuses it
    (IllegalCommand, nothing selected).
    Evidence: asm ovl38:0293..02ea (DS:42c4 = DS:5dfe or 1, DS:42c6[i] = DS:5e3e[i] or
    DS:5e62, no null test), 0505..0551 / 05a7..05ef / 075a.. (fields read through DS:42c6[i]);
    0c8c:0529 058f..0597 (DS:5dfe counts non-null slots)."""
    sel = state.selection
    if sel.group:
        slots = sel.moving[:min(sel.count, MAX_STACK)]
        return [aid for aid in slots if aid != -1]
    if sel.selected == -1 and null_leader_ok:
        return []
    if not 0 <= sel.selected < len(state.armies):
        raise IllegalCommand("no selected stack (DS:5e62)")
    return [sel.selected]


def simulate_selection(state, x: int, y: int) -> tuple:
    """`simulate` for the current selection: what ovl36:124a(x, y, 0) computes when the AI's
    win odds ovl29:15c5 call it (ai.md §7, §5.12).
    Evidence: asm ovl36:130f (ovl38:008b(x, y) on the selection, `selection_group`),
    1319..1376 (flag 0)."""
    return simulate(state, selection_group(state, True), x, y)


def ai_battle_gates(state, x: int, y: int) -> tuple[bool, bool, bool]:
    """(show, show2, view) of ovl36:124a(x, y, 1): d = the owner nibble of (x, y), human(p) =
    SCN 0x0d0[p] == 0; show = SCN 0x159 or (d < 8 and human(d)); show2 = (SCN 0x159 and d < 8)
    or (d < 8 and human(d)); view = 0; DS:3254 and road bit 7 of (x, y) clear -> show = show2
    = 0; more than one live human side (0x137 and human) and Hidden Map -> view = show, show =
    show2 = 0.  Read before the set-up ovl38:008b moves anything.
    Evidence: asm ovl36:1281..12a8 (show), 12ab..12dd (show2), 12e5..130c (DS:3254, 19d9 bit
    0x80), 1379..13d5 (multi, SCN 0x124)."""
    w = state.world
    d = w.flags[y * MAP_W + x] & MAP_OWNER_MASK
    viewed = bool(state.flags.get(KT.SCN_VIEWED.value, 0))
    human_d = d < AI_SIDES and state.players[d].control == Control.HUMAN
    show = viewed or human_d
    show2 = (viewed and d < AI_SIDES) or human_d
    view = False
    if state.ai.proc.single_view and not w.roads[y * MAP_W + x] & KM.ROAD_PORT_VIEW.value:
        show = show2 = False
    multi = sum(1 for p in state.players if p.alive and p.control == Control.HUMAN) > 1
    if multi and state.options.hidden_map:
        view, show, show2 = show, False, False
    return show, show2, view


def set_view_words(state, x: int, y: int) -> None:
    """ovl65:0227(x, y): the view words for the centre (x, y) as given (rules.turn.set_view).
    Evidence: asm ovl65:0529..05df (see rules.turn.set_view)."""
    from .turn import set_view                         # circular at module level
    set_view(state, C.SetView(x, y))


def ai_battle(state, x: int, y: int) -> list:
    """The computer's real battle ovl36:124a(x, y, 1) on the current selection (`selection_group`),
    as 0a8b:0254 / 0476 call it.  In order: set-up ovl38:008b *before* the stack moves; for a
    city target with Diplomacy on, an owner (byte != 0x0f) and the relation side -> owner not
    war, the treachery ovl36:20a8 (rules.diplomacy.treachery, no question); city +0x30 |=
    DS:0cbe[2 * side]; the prelude ovl36:0522 (`_prelude`, no view update) charging the stale
    DS:4160 (the last human attack's cost, 0 before any), with the stored words DS:5dfc /
    2bda / 5e00 of the last 0c8c:0529; battle ovl36:08a6; ovl25:09d7 (HOOKS ai_memory); ovl36:0a6b
    (casualties, survivors become DS:5e3e / 5e62, take-over); army bit on (x, y) when the
    attacker won; medals ovl36:2274(result); map refresh ovl62:0000; quest check
    ovl01:1ded(0, 0, 0, 0, 0) (result unused); ovl26:038d(x, y) (HOOKS ai_after_battle).  No
    re-selection of the target square and no capture question (human path only); the music
    roll of a completed quest is skipped for the computer (ovl01:2723..272e).  Rolls rnd in
    20a8, 08a6, 2274, 1ded only (ai.md §7a.7).  The display (ovl36:1836, ovl65, the messages
    through ovl61:11d1 / ovl36:16b3 (DS:0cf8), ovl37, ovl62:0af3, ovl63) is presentation.
    Events as `attack` (Moved, BattleStarted, Duel..., BattleEnded) plus those of the steps.
    Evidence: asm ovl36:124a..16b2: 1274..1278 DS:415e / 415c, 1311 ovl38:008b, 1319 flag,
    13d8..141c DS:41dd / 2c04:011c / +0x15 != 0x0f / relation & 3 != 2 -> 1420 call 20a8,
    1423..1437 +0x30, 1466 0522(x, y, -1L), 14f2 08a6, 1502 ovl25:09d7(x, y, DS:42e6, DS:42c6),
    1543 0a6b(r, x, y), 1549..1560 r == 1 -> map +1 |= 0x10, 1686 2274(r), 168a ovl62:0000,
    1697 ovl01:1ded(0, 0, 0, 0, 0), 16a3 ovl26:038d(x, y), 16ab return 0; DS:4160 written only
    at ovl36:0211 (ovl36:0000).  The display gates `ai_battle_gates` decide one state write,
    the view words ovl65:0227(x, y) at 1474 when `show` (`set_view_words`), and the present
    points (rules.present): "battle_mark" 1836(x, y, 1) at 1454; "battle_before" 147c..14eb
    (STRING 0x94 / 0x95 through 11d1(.., 5) and DS:0cf8); "battle_window" 150a..1538 (window,
    ovl59:0000(5), the kills ovl37:0094); "battle_result" 157b..161f (the line, 16b3 with
    DS:0cf8, the window line, ovl59:0000(10), 04f6); "battle_after" 162d..167e (1836(x, y, 0),
    ovl62:0af3, ovl65:05ec with DS:3254 and Hidden Map, ovl63:0000)."""
    if not (0 <= x < MAP_W and 0 <= y < MAP_H):
        raise IllegalCommand("target off the map")
    require_ai_battle_hooks()
    from . import diplomacy                             # circular at module level
    from .movement import _group_records               # DS:5e3e[0..7] records
    sel = state.selection
    group = selection_group(state)
    lead = state.armies[sel.selected] if 0 <= sel.selected < len(state.armies) else None
    if lead is None:
        raise IllegalCommand("no selected stack (DS:5e62)")
    movers = _group_records(state) if sel.group else [lead]          # stored DS:2bda
    w = state.world
    t = int(w.terrain(x, y))
    events: list = []
    skipped: list = []
    d = w.flags[y * MAP_W + x] & MAP_OWNER_MASK
    show, show2, view = ai_battle_gates(state, x, y)
    setup = prepare(state, tuple(group), x, y)
    if setup.city >= 0:
        c = state.cities[setup.city]
        if (state.options.diplomacy and c.owner & 0xFF != NO_OWNER
                and relation_byte(state, state.current, s8(c.owner)) & 3 != K.WAR_BITS.value):
            events += diplomacy.treachery(state, x, y)
        c.attacked_by |= K.OWNER_BITS.value[state.current]
    if show:
        present("battle_mark", x=x, y=y)                   # ovl36:1836(x, y, 1) at 1454
    events += _prelude(state, lead, x, y, t, state.battle_work.attack_cost,
                       [a.id for a in movers], None)
    if show:
        set_view_words(state, x, y)                         # ovl65:0227(x, y) at 1474
    present("battle_before", x=x, y=y, owner=d, show=show, show2=show2, view=view)   # 147c..14eb
    events.append(E.BattleStarted({"x": x, "y": y, "attacker": setup.attacker, "owner": setup.owner,
                                   "attackers": setup.attackers, "defenders": setup.defenders,
                                   "a_strength": setup.a_strength, "d_strength": setup.d_strength}))
    battle = fight(state, setup)
    events += [E.Duel(d_) for d_ in battle.duels]
    _call("ai_memory", skipped, None, state, battle)
    if show2 or view:                                       # 150a..1538
        present("battle_window", x=x, y=y, battle=battle, owner=setup.owner, attacker=setup.attacker)
    captured, _ = _after_battle(state, battle, events, skipped)
    if battle.attacker_won:
        w.flags[y * MAP_W + x] |= MAP_ARMY               # asm ovl36:1560
    if show or show2 or view:                               # 157b..161f
        present("battle_result", x=x, y=y, won=battle.attacker_won, show=show, show2=show2, view=view)
    if show:                                                # 162d..167e
        present("battle_after", x=x, y=y)
    events += _call("medals", skipped, [], state, battle)
    refresh_map(state)                                  # asm ovl36:168a
    _, evs = _call("quest_check", skipped, (0, []), state, battle, False)   # words (0, 0, 0, 0, 0)
    events += evs
    events += _call("ai_after_battle", skipped, [], state, x, y)
    events.append(E.BattleEnded({"attacker_won": battle.attacker_won, "unopposed": battle.unopposed,
                                 "kills": battle.kills, "captured": captured, "skipped": skipped}))
    return events


def _after_battle(state, battle: Battle, events: list, skipped: list) -> tuple:
    """ovl36:0a6b (asm ovl36:0a6b..0f8e).  Returns (city taken, take_city hook ran).  The
    surviving attackers in fight order become the moving group, DS:5dfe their count (DS:2bda
    and the other stored words are not touched) and the first of them (or none) DS:5e62 (asm
    ovl36:0afd..0b58).  The types tested are the set-up's arrays DS:424c / 4254
    (`state.battle_work`), not the records, which are freed on the way.  The reveal (ovl64:1298
    reads DS:5dfc itself, 12e5) and the take-over get the stored mode.  After the casualties
    the recounts ovl62:03f9 / 02bf / 0372 refresh the income and upkeep caches (0cb5..0cbf)."""
    s = battle.setup
    flying = state.selection.mode == KM.MODE_FLY.value       # stored DS:5dfc
    by_id = _armies_by_id(state)
    fx, fy = s.tiles[0]
    first_terrain = int(state.world.terrain(fx, fy))
    events += _call("history", skipped, [], state, battle)
    sel = state.selection
    sel.moving = [aid for i, aid in enumerate(s.attackers) if battle.a_alive[i]]
    sel.count = len(sel.moving)                                  # asm ovl36:0afd, 0b47
    sel.selected = sel.moving[0] if sel.moving else -1
    bw = state.battle_work
    a_types, d_types = bw.a_types, bw.d_types
    for i, aid in enumerate(s.attackers):                        # asm ovl36:0b61..0c12
        if not battle.a_alive[i]:
            if a_types[i] == HERO_TYPE:
                events += _call("hero_died", skipped, [], state, aid, s.x, s.y)
            remove_army(state, by_id[aid])                       # asm ovl36:0bcb (0b62:03be)
        elif a_types[i] == HERO_TYPE:
            n = K.EXP_CITY.value if first_terrain == Terrain.CITY else K.EXP_FIELD.value
            events += _call("add_exp", skipped, [], state, aid, n)
    for i, aid in enumerate(s.defenders):                        # asm ovl36:0c1a..0cb2
        if not battle.d_alive[i]:
            if d_types[i] == HERO_TYPE:
                events += _call("hero_died", skipped, [], state, aid, s.x, s.y)
            remove_army(state, by_id[aid])                       # asm ovl36:0c84 (0b62:03be)
        elif _attacker_type_slot(bw, i) == HERO_TYPE:
            events += _call("add_exp", skipped, [], state, aid, K.EXP_DEFENDER.value)
    refresh_cities(state)                                        # asm ovl36:0cb5
    refresh_caches(state)                                        # asm ovl36:0cba / 0cbf
    if not battle.attacker_won:                                  # asm ovl36:0cc4..0cf6
        _set_owner(state, fx, fy, s.owner)
        refresh_map(state)
        return False, False
    _set_owner(state, fx, fy, s.attacker)                        # asm ovl36:0cfc..
    reveal(state, fx, fy, flying)                                # asm ovl36:0d35 (ovl64:1298)
    if s.first_fortified:
        state.world.flags[s.y * MAP_W + s.x] &= ~MAP_FORTIFIED
    if first_terrain != Terrain.CITY:
        return False, False
    ran = _hook("take_city") is not None
    events += _call("take_city", skipped, [], state, s.city, s.attacker, s.owner, flying)
    return True, ran


def _attacker_type_slot(bw, i: int) -> int:
    """DS:424c[i] as read for defender i at asm ovl36:0c8e: the attacker type array (8 bytes;
    past the attacker count the previous set-up's bytes), then the defender types DS:4254."""
    return (bw.a_types + bw.d_types)[i]


# ------------------------------------------------------------------------------- fight order


def set_fight_order(state, cmd: C.SetFightOrder) -> list:
    """Replace the current player's fight-order row.
    Evidence: the fight-order dialog ovl38:0de1..1475 (decomp 06b401..06ba95) only swaps values
    within the row SCN[0x60b + p*29] (ovl38:11af, 1294, 1379), resets it to the neutral row
    SCN 0x6f3 (ovl38:116a) or restores the copy taken on opening (ovl38:111c); so a legal row is
    a permutation of the current row or of row 8."""
    order = [int(v) for v in cmd.order]
    row = state.fight_order[state.current]
    if len(order) != len(row) or (sorted(order) != sorted(row)
                                  and sorted(order) != sorted(state.fight_order[-1])):
        raise IllegalCommand("fight order must permute the current or the neutral row")
    state.fight_order[state.current] = order
    return []
