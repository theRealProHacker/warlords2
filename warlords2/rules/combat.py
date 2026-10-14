"""Combat: battle set-up, fight order, the battle loop, the advisor and the Attack command.

Sources (re-read by M5a from out/rea/decomp/ and out/asm/; EL = docs/research/exe_logic.md §3):

* attack(x, y)            ovl36:0000 (L 0x67a70), prelude ovl36:0522 (L 0x67f92)
* battle set-up           ovl38:008b (L 0x6a6ab): sides, fight order, strengths (rules/bonuses.py)
* battle loop             ovl36:08a6 (L 0x68316)
* after the battle        ovl36:0a6b (L 0x684db): casualties, hero exp, square owner, city take-over
* advisor                 ovl36:1f19 -> ovl36:2065 (19 runs of ovl36:124a in mode 0)

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
Not modelled (presentation only): the battle display and messages, the view-window update at
the end of ovl36:0522 (SCN 0x175..0x17f), and the recount caches ovl62:03f9 / 02bf / 0372.
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
from .bonuses import (ABOARD_FLAG, SideBonus, battle_class, carried_items, city_bonus, s8,
                      side_bonus, side_total, unit_strength)
from .constants import combat as K
from .constants import movement as KM
from .constants import unverified_allowed
from .engine import IllegalCommand, NotImplementedCommand
from .mapwords import refresh_map
from .movement import armies_at, remove_army, stack_mode, type_flag
from .selection import adopt, select_army_stack
from .visibility import reveal

log = logging.getLogger(__name__)

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
}


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
    Evidence: decomp 06a6ab (ovl38:008b; EL §3.2): value = signed byte SCN[0x60b + row*29 + type];
    on target terrain 2, 3 or 6 the first non-aboard unit whose type flies (DS:45c4) gets +80
    (byte arithmetic) if the side contains a hero (type 0x1c); then a stable insertion sort,
    ascending (strict < comparisons)."""
    vals = [s8(state.fight_order[row][a.type_id]) for a in armies]
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
    ab = side_bonus(state, a_units, c)
    db = side_bonus(state, d_units, c)
    cb = city_bonus(state, x, y, c, tiles[0], ci, owner, ab.cancel_city)
    a_total = side_total(state, ab, db)
    d_total = side_total(state, db, ab, cb)
    a_str = [unit_strength(state, a, a_total, c, terrain) for a in a_units]
    d_str = [unit_strength(state, a, d_total, c, terrain) for a in d_units]
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
        """Evidence: ovl36:124a counts DS:4224[i] != 0 into DS:41d2 (decomp 068cba)."""
        return sum(self.a_alive)

    @property
    def d_survivors(self) -> int:
        """Evidence: ovl36:124a counts DS:422c[i] != 0 into DS:41ce (decomp 068cba)."""
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
    Evidence: ovl36:124a with argument 0 (decomp 068cba): set-up, battle loop, survivor counts
    into DS:41cc..41d2; nothing else changes but the battle arrays (`state.battle_work`; the
    stack is not moved, so land units are not put aboard - the misprediction MAN p.36 mentions)."""
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


def _require_hooks() -> None:
    if unverified_allowed():
        return
    for name, (milestone, target, _, _) in HOOKS.items():
        if _hook(name) is None:
            raise NotImplementedCommand(C.Attack, milestone, target)


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
    instead (TreacheryPrompt pending).  Then ovl36:0522: on Water/Shore a non-flying stack whose
    selected army is not aboard puts every non-flying member without a flight item aboard with
    0 moves; every member pays max(2, DS:1274[t]) (floored at 0), moves onto the target and loses
    its goto.  Set-up ovl38:008b, city +0x30 |= DS:0cbe[p], battle ovl36:08a6, AI memory, map
    refresh ovl62:0000, after-battle ovl36:0a6b (the surviving attackers become the selection),
    army bit, re-selection, medals ovl36:2274(result), quest check ovl01:1ded, capture choice
    (CityCaptured pending).  The group is made the selection first (rules.selection.adopt: the
    original attacks with DS:5e62 / 5e3e).  A stack with < 1 move is not refused: the original
    deselects it (0b62:08b3 at asm ovl36:01a9..01be) and nothing else happens, so that returns
    no events.  A won attack selects the stack of the target square's first army (asm
    ovl36:045b..0490: 0b62:007d into DS:5e62, ovl67:06eb) before the medal call, which reads the
    re-selected DS:5e3e."""
    if not (0 <= cmd.x < MAP_W and 0 <= cmd.y < MAP_H):
        raise IllegalCommand("target off the map")
    armies = _group(state, cmd.group)
    adopt(state, [a.id for a in armies])
    x, y = cmd.x, cmd.y
    w = state.world
    idx = y * MAP_W + x
    t = int(w.terrain(x, y))
    flying = stack_mode(state, armies)[0] == KM.MODE_FLY.value      # DS:5dfc == 2 (0c8c:0529)
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
    if min(s8(a.moves_left) for a in armies) < K.MOVES_NEEDED.value:
        state.selection.selected = -1                   # 0b62:08b3 (asm ovl36:01b1)
        return []
    cost = max(K.ATTACK_COST_MIN.value, cost_t)
    if owner == state.current:
        raise IllegalCommand("own square")
    if t != Terrain.CITY and not w.flags[idx] & MAP_ARMY:
        raise IllegalCommand("nothing to attack")
    _require_hooks()

    events = []
    skipped: list = []
    fx0, fy0 = armies[0].x, armies[0].y
    # ---- prelude ovl36:0522
    if not armies[0].flags & ABOARD_FLAG and t in K.ABOARD_TERRAIN.value and not flying:
        boarded = []
        for a in armies:
            if not type_flag(state, a.type_id, "flag16") and _flight_items(state, a) == 0:
                a.flags |= ABOARD_FLAG
                a.moves_left = 0
                boarded.append(a.id)
        if boarded:
            events.append(E.Embarked({"armies": boarded, "x": fx0, "y": fy0}))
    for a in armies:
        a.moves_left = 0 if s8(a.moves_left) < cost else a.moves_left - cost
        a.x, a.y = x, y
        a.goto = (-1, -1)
    events.append(E.Moved({"group": list(cmd.group), "from": (fx0, fy0), "to": (x, y),
                           "cost": cost, "attack": True}))
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
    captured, take_ran = _after_battle(state, battle, events, skipped, flying)
    if battle.attacker_won:
        w.flags[idx] |= MAP_ARMY                         # asm ovl36:0472
        first = armies_at(state, x, y)                   # asm ovl36:047f (0b62:007d)
        if first:
            events += select_army_stack(state, first[0])  # asm ovl36:0490 (ovl67:06eb)
    events += _call("medals", skipped, [], state, battle)
    result, evs = _call("quest_check", skipped, (0, []), state, battle, captured)
    events += evs
    events.append(E.BattleEnded({"attacker_won": battle.attacker_won, "unopposed": battle.unopposed,
                                 "kills": battle.kills, "captured": captured, "skipped": skipped}))
    if captured and result == 0 and take_ran:
        ev = E.CityCaptured({"city": setup.city, "attacker": setup.attacker, "owner": setup.owner})
        state.pending = ev
        events.append(ev)
    return events


def _after_battle(state, battle: Battle, events: list, skipped: list, flying: bool) -> tuple:
    """ovl36:0a6b (asm ovl36:0a6b..0f8e).  Returns (city taken, take_city hook ran).  The
    surviving attackers in fight order become the moving group and the first of them (or none)
    DS:5e62 (asm ovl36:0afd..0b58).  The types tested are the set-up's arrays DS:424c / 4254
    (`state.battle_work`), not the records, which are freed on the way."""
    s = battle.setup
    by_id = _armies_by_id(state)
    fx, fy = s.tiles[0]
    first_terrain = int(state.world.terrain(fx, fy))
    events += _call("history", skipped, [], state, battle)
    sel = state.selection
    sel.moving = [aid for i, aid in enumerate(s.attackers) if battle.a_alive[i]]
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
