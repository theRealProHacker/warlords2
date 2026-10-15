"""ovl25 (+ ovl29:1851): the computer turn and the AI's hooks into the rules code (ai.md §6, §9).

* `computer_turn` = ovl25:0000, reached from ovl68:01e3 (rules.turn HOOKS ai_turn).  The 19
  phases are called in the listing's order through `PHASES` (name -> "module:function", the
  module and function ai.md §9 assigns); a phase module that does not exist yet raises
  NotImplementedCommand in strict mode (before anything changes: rules.turn's strict check
  calls `computer_turn.require`), and is logged and skipped with --allow-unverified.
* `pre_turn` = ovl25:0386, `hero_city` = ovl25:0919 (rules.heroes HOOKS ai_hero_city),
  `record_battle` = ovl25:09d7 (rules.combat HOOKS ai_memory), `after_raze` = ovl29:1851
  (rules.city HOOKS ai_raze).

Not modelled, because they hold no game state: the debug text ovl25:0dc9 (an empty
function) and 0a4c:0348 (heap statistics sprintf'd into DS:5c88, after 0d28:02c5), the block /
table locks (0d28:069a / 07a9, ovl25:05e6 / 063d).  Present points (rules.present): the shield
strip ovl68:0952(0, 0) at 0064 ("strip"), the progress bar ovl61:131b(n) after the phases
("bar", `BAR_AFTER`), and ovl25:045e at 0380 ("keys": Alt or Shift held, BIOS 0000:0417 &
0x0b -> Settings ovl33:0000(0); the presentation reads the keyboard).  The Shift test at ovl25:0109 is taken as "no key held": it only matters for a human
side, which never runs ovl25:0000 (ovl68:0000 runs for 0x0d0 == 1 only).
"""
from __future__ import annotations

import importlib
import logging

from ..model import commands as C
from ..model.ids import HERO_TYPE, MAP_OWNER_MASK, MAP_W, NO_OWNER, Control, Terrain
from ..rules import diplomacy as D
from ..rules import movement as M
from ..rules import pathfinding as P
from ..model.ai import MEMORY_SIDES
from ..rules.bonuses import s8
from ..rules.economy import s16
from ..rules.constants import unverified_allowed
from ..rules.engine import NotImplementedCommand
from ..rules.heroes import turn
from ..rules.present import present
from .state import block
from .util import DMAP_LIMIT, best_target

log = logging.getLogger(__name__)

# The phases of ovl25:0000 in call order: (debug string at DS:08xx, milestone, target, EXE call).
# `evaluate` takes the side (ovl25:0200 pushes SCN 0x110); the others take no argument.
PHASES = (
    ("Diplomacy", "M8b4", "warlords2.ai.phases.diplomacy:diplomacy", "ovl18:0000 at ovl25:00db"),
    ("move Hero", "M8b3", "warlords2.ai.phases.hero:move_hero", "ovl28:0000 at ovl25:00ee"),
    ("move Search", "M8b3", "warlords2.ai.phases.move:search", "ovl22:0284 at ovl25:0158"),
    ("move Explore", "M8b3", "warlords2.ai.phases.move:explore", "ovl22:0458 at ovl25:018f"),
    ("assault", "M8b4", "warlords2.ai.phases.assault:assault", "ovl19:0000 at ovl25:01aa"),
    ("move #1", "M8b3", "warlords2.ai.phases.move:move", "ovl22:0000 at ovl25:01c5"),
    ("rescue", "M8b3", "warlords2.ai.phases.move:rescue", "ovl22:0888 at ovl25:01e0"),
    ("evaluate", "M8b4", "warlords2.ai.phases.evaluate:evaluate", "ovl21:0000 at ovl25:0205"),
    ("clean city", "M8b2", "warlords2.ai.phases.clean_city:clean_cities", "ovl24:01f1 at ovl25:0221"),
    ("neutral", "M8b3", "warlords2.ai.phases.neutral:neutral", "ovl20:0000 at ovl25:023c"),
    ("move #2", "M8b3", "warlords2.ai.phases.move:move", "ovl22:0000 at ovl25:0257"),
    ("quick attack", "M8b4", "warlords2.ai.phases.quick_attack:quick_attack", "ovl26:04ba at ovl25:0272"),
    ("update hide", "M8b3", "warlords2.ai.phases.evaluate:update_hide", "ovl21:0c1c at ovl25:0292"),
    ("assault XX", "M8b4", "warlords2.ai.phases.assault_xx:assault_xx", "ovl27:0000 at ovl25:02a5"),
    ("specials", "M8b4", "warlords2.ai.phases.move:specials", "ovl22:10e3 at ovl25:02c0"),
    ("rebuilding", "M8b2", "warlords2.ai.phases.rebuilding:rebuilding", "ovl25:0af2 at ovl25:02dd"),
    ("last rescue", "M8b3", "warlords2.ai.phases.move:last_rescue", "ovl22:0b4d at ovl25:02f6"),
    ("production", "M8b2", "warlords2.ai.phases.production:production", "ovl25:06d4 at ovl25:0313"),
    ("vectoring", "M8b2", "warlords2.ai.phases.vectoring:vectoring", "ovl25:085f at ovl25:032e"),
)
HIDDEN_MAP_ONLY = ("move Search", "update hide")      # ovl25:0150 / 028a: SCN 0x124 != 0
# ovl61:131b(n) after each phase (asm ovl25:00f5..0333; none after Diplomacy, quick attack and
# update hide); 10 before the first phase (00c7), 100 after 0a4c:0348 (034e)
BAR_FIRST, BAR_LAST = 10, 100
BAR_AFTER = {"move Hero": 15, "move Search": 20, "move Explore": 25, "assault": 30, "move #1": 40,
             "rescue": 45, "evaluate": 50, "clean city": 55, "neutral": 60, "move #2": 65,
             "assault XX": 70, "specials": 75, "rebuilding": 80, "last rescue": 85,
             "production": 90, "vectoring": 95}
WITH_SIDE = ("evaluate",)
ROLE_FLYER_WANTED, ROLE_FLYER, ROLE_BUILD_UP, ROLE_FULL = 13, 11, 4, 8   # ai.md §3.2
EARLY_TURNS, FIRST_TURN, FLYER_TURNS = 5, 1, 3                          # ovl25:03ed / 041e / 0435
CITY_FLAG_CLEANED = 0x04                                                 # ovl25:044b: &= 0xfb
HERO_CITY_ROLLS = {7: (1, 100, 100), 2: (1, 100, 50), 3: (1, 100, 0)}   # ovl25:0959..0984
RELATION_SELF_CLEAR = 0xF0                                              # ovl25:0032 / 0055
# Words 0000:0000 / 0000:0002 (int 0) that ovl29:1856 reads as x / y through a null DS:5e62: the
# Borland start-up's divide-error handler CS:0174 (res_0000:01b2..01bc).  The segment (where DOS
# loaded the EXE) is unknown; 0 stands for it, never read: x alone is off the map (0555:000a 0042).
IVT_INT0_OFFSET, IVT_INT0_SEGMENT = 0x0174, 0


def _phase(target: str):
    mod, fn = target.split(":")
    try:
        module = importlib.import_module(mod)
    except ModuleNotFoundError as e:
        if not (e.name and mod.startswith(e.name)):
            raise
        return None
    return getattr(module, fn, None)


def _reached(state):
    hidden = bool(state.options.hidden_map)
    return [p for p in PHASES if hidden or p[0] not in HIDDEN_MAP_ONLY]


def require_phases(state, cmd_cls=C.EndTurn) -> None:
    """Strict mode: raise NotImplementedCommand(cmd_cls, milestone, target) for the first phase
    ovl25:0000 would call (in call order; move Search and update hide only with Hidden Map)
    whose module function does not exist yet; ValueError when the AI blocks were never set up.
    Nothing with --allow-unverified.
    Evidence: the call sites of ovl25:0000 (asm ovl25:00db..032e, `PHASES`); no game rule."""
    if unverified_allowed():
        return
    for _, milestone, target, _ in _reached(state):
        if _phase(target) is None:
            raise NotImplementedCommand(cmd_cls, milestone, target)
    if not state.ai.allocated:
        raise ValueError("AI blocks not set up (DS:0832 == 0): rules.setup.new_game(cards=...) "
                         "or ai.cards.load_draws after a load")


def _run_phase(state, name: str, milestone: str, target: str) -> list:
    f = _phase(target)
    if f is None:
        if not unverified_allowed():
            raise NotImplementedCommand(C.EndTurn, milestone, target)
        log.warning("computer phase %s (%s, %s) not implemented; skipped", name, target, milestone)
        return []
    out = f(state, state.current) if name in WITH_SIDE else f(state)
    return list(out or [])


def pre_turn(state) -> None:
    """ovl25:0386: DS:40f2[cur] = AI[+0x38]; for every own city c = count-1..0: role 13 or 11 ->
    4 while max(turn, 1) < 5, else 8; with Quick Start and Hidden Map: role 13 on turn 1, else 11
    while max(turn, 1) < 3; AI[+0x11e + c] &= ~4.  No rnd.
    Evidence: asm ovl25:0386..045d (038a..039e DS:40f2, 03a7 SCN 0x157b loop, 03b9 owner byte
    signed == SCN 0x110, 03d4 / 03e1 roles 0xd / 0xb, 03e8 ovl61:225b < 5, 0407 0x128, 0411
    0x124, 0419 == 1, 0430 < 3, 044b &= 0xfb)."""
    p = state.current
    b = block(state)
    state.ai.solidarity[p] = b.solidarity
    qs_hm = bool(state.options.quick_start) and bool(state.options.hidden_map)
    for c in range(len(state.cities) - 1, -1, -1):
        if s8(state.cities[c].owner) != p:
            continue
        if b.role[c] in (ROLE_FLYER_WANTED, ROLE_FLYER):
            b.role[c] = ROLE_BUILD_UP if turn(state) < EARLY_TURNS else ROLE_FULL
        if qs_hm:
            if turn(state) == FIRST_TURN:
                b.role[c] = ROLE_FLYER_WANTED
            elif turn(state) < FLYER_TURNS:
                b.role[c] = ROLE_FLYER
        b.city_flags[c] &= ~CITY_FLAG_CLEANED & 0xFF


def computer_turn(state) -> list:
    """ovl25:0000(1): the computer side's moves (rules.turn HOOKS ai_turn).  relation[cur][cur]
    bits 0-3 = 0; DS:0836 = 1, the side's block becomes DS:40ee (`AiState.locked`, which
    keeps it after the turn: the unlock 0371 does not clear DS:40ee); pre_turn (0386); the 19 phases
    of `PHASES` in order - move Search with SCN 0x0d0[cur] = 1 for a human side (restored
    after) and only with Hidden Map, update hide only with Hidden Map; DS:0836 = 0; then
    ovl00:1063, the refused de-escalation penalty (rules.diplomacy.penalty through rules.turn
    HOOKS diplomacy_penalty, rnd) and ovl25:045e (keyboard, presentation).  Returns the
    phases' events.  The AI blocks must have been set up (ai.cards.setup_all at Begin or
    load_draws after a load): the original allocates on demand (ovl25:000d -> 04c5(1)), with
    card reads the engine cannot make here, so a state without them is refused.
    Evidence: asm ovl25:0000..0385 (0006 DS:0832, 0015..005b relation byte & 0xf3 & 0xfc,
    0064 ovl68:0952, 006e 05e6, 0071 DS:0836 = 1, 0089 lock, 00c2 0386, phase calls 00db..032e
    (strings DS:0848..08ff), 0109..0172 Shift / 0x0d0 / si flip, 0150 / 028a SCN 0x124, 0339
    0a4c:0348, 0354 DS:0836 = 0, 035c 063d, 0371 unlock, 0379 ovl00:1063, 0380 045e); the bar
    ovl61:131b at 00c7 (10), 00f5, 017b, 0196, 01b1, 01cc, 01e7, 020d, 0228, 0243, 025e, 02ac,
    02c7, 02e2, 02fd, 0318, 0333 (15 .. 95, `BAR_AFTER`) and 034e (100)."""
    require_phases(state)
    if not state.ai.allocated:
        if not unverified_allowed():
            raise ValueError("AI blocks not set up (DS:0832 == 0): rules.setup.new_game(cards=...) "
                             "or ai.cards.load_draws after a load")
        log.warning("computer turn skipped: AI blocks not set up (no card source given)")
        return []
    from ..rules import turn as T                     # rules.turn imports nothing from ai
    p = state.current
    D.set_proposal(state, p, p, 0)
    D.set_current(state, p, p, 0)
    state.ai.turn_active = 1
    state.ai.locked = p                               # 0091 / 0095; never reset (B1)
    events: list = []
    present("strip", at="ovl25:0064")                 # ovl68:0952(0, 0)
    try:
        pre_turn(state)
        present("bar", n=BAR_FIRST)                    # ovl61:131b(10) at 00c7
        for name, milestone, target, _ in PHASES:
            if name == "move Search":
                flipped = state.players[p].control == Control.HUMAN
                if flipped:
                    state.players[p].control = Control.COMPUTER
                try:
                    if state.options.hidden_map:
                        events += _run_phase(state, name, milestone, target)
                finally:
                    if flipped:
                        state.players[p].control = Control.HUMAN
            elif not (name in HIDDEN_MAP_ONLY and not state.options.hidden_map):
                events += _run_phase(state, name, milestone, target)
            if name in BAR_AFTER:
                present("bar", n=BAR_AFTER[name])
        present("bar", n=BAR_LAST)                     # 034e, after 0a4c:0348
    finally:
        state.ai.turn_active = 0
    events += T._call("diplomacy_penalty", [], state)
    present("keys")                                   # ovl25:045e at 0380
    return events


computer_turn.require = require_phases               # rules.turn._require checks it up front


def hero_city(state, city: int) -> int:
    """ovl25:0919(c0): the city for the computer side's new hero (rules.heroes HOOKS
    ai_hero_city).  For every own city c = count-1..0 (owner byte signed == the side on turn):
    with the role byte of the block DS:40ee points at, v = rnd(1,100,100) with role 7,
    rnd(1,100,50) with role 2, rnd(1,100,0) with role 3, else 0 without a draw; the first
    strictly greater than the best so far (from 0) wins; c0 when none.
    DS:40ee is not this side's block: 0919 runs in ovl47:0000 (ovl47:01ed, after the offer)
    at ovl68:019b, before this side's ovl25:0000 at ovl68:01e3 locks its block, so it is the
    block of the last side that ran ovl25:0000, or block 0 after Begin or a load that ran
    ovl25:0519 (`AiState.locked`).
    Evidence: asm ovl25:0919..09aa (0924 best = 0, 0929 SCN 0x157b loop, 093f owner signed ==
    SCN 0x110, 0953 / 0964 / 0975 les bx, DS:40ee, 0959 / 096a / 097b roles, 0984 rnd(1, 100,
    add), 0994 jle); ovl47:01dc..01ed (09ab, then 0919); ovl68:019b (ovl47:0000) before
    ovl68:01e3 (ovl25:0000); the writers of DS:40ee: ovl25:0091 / 0095, 0542 / 0546 (ovl21:0ca9
    unreachable)."""
    p = state.current
    b = state.ai[state.ai.locked]
    best, r = 0, city
    for c in range(len(state.cities) - 1, -1, -1):
        if s8(state.cities[c].owner) != p:
            continue
        roll = HERO_CITY_ROLLS.get(b.role[c])
        v = state.rng.rnd(*roll) if roll is not None else 0
        if v > best:
            best, r = v, c
    return r


def after_raze(state, city: int) -> None:
    """ovl29:1851() after a computer raze (rules.city HOOKS ai_raze, end of ovl19:1864): the
    distance map 0555:1ab9(15, x, y, DS:5dfc, DS:5dfa) from the leader DS:5e62's square with the
    stack's stored mode and mask, then 1885(x, y, 1) in full (15c5 per reachable candidate,
    rnd) on the table T the buffer DS:3f86 then holds (`state.dist_table`).  Its result (the
    next target city or -1), which 1851 passes through in ax and only ovl19:0f1b uses, is kept
    in `state.ai.raze_target` for the assault phase (ai.md §9 raze contract).  `city` (the
    razed city) is not read: 1851 takes no argument.
    Null DS:5e62: ovl19:0f1b razes after 0a8b:0001(..., keep = 0), whose tail 0b62:08b3 makes
    DS:5e62 null (08be), and nothing writes it before 1851 (ovl19:1251, 1864, ovl31:07d0,
    ovl32:016b, ovl24:10a1 do not).  1856 then reads x / y through 0000:0000, the interrupt
    vector table: x = the offset word of int 0, y = its segment.  The Borland start-up sets int 0
    to its divide-error handler CS:0174 (res_0000:01b2..01bc, int 21h AH = 25h AL = 0, DX =
    0x174; no other code of the EXE sets int 0) [I: no resident program or debugger changes it
    afterwards], so x = 0x174 >= 0x70 whatever the segment: 0555:000a returns at 0042..0051
    before T is touched (only DS:3f70 = 15 is written), and 1885 scores the candidates on the
    previous T, the field of the last search (`rules.pathfinding.distance_map` with x off the
    map), with the stale DS:5e00 and the DS:5e3e / 2bda that 08b3 leaves for 15c5.
    Evidence: asm ovl29:1851..1884 (1856 DS:5e62 +0 / +2, 1861..186d 1ab9(0xf, x, y, DS:5dfc,
    DS:5dfa), 1875..187b 1885(x, y, 1), no write of ax); 0b62:08b3..0905 (08be dword DS:5e62 =
    0); 0555:1ab9..1b09, 000a 0031..0056."""
    lead = M._record(state, state.selection.selected)
    x, y = (lead.x, lead.y) if lead is not None else (IVT_INT0_OFFSET, IVT_INT0_SEGMENT)
    sel = state.selection
    dm = P.distance_map(state, DMAP_LIMIT, x, y, sel.mode, sel.mask)
    if dm.field is None:
        raise RuntimeError("ovl29:1851: no search has written the table DS:3f86 yet")
    state.ai.raze_target = best_target(state, 1, dm)


def record_battle(state, battle) -> None:
    """ovl25:09d7(x, y, defenders DS:42e6, attackers DS:42c6): with d = the owner nibble of (x, y)
    not 0x0f, side d's AI block gets, at index a = the owner (signed byte) of the first
    attacker: +0x3bc[a] += dead defenders whose record is a hero (type 0x1c), +0x3cc[a] +=
    dead defenders, +0x3dc[a] += 1, +0x3ec[a] += (dead == defender count), and on a City
    square +0x3fc[a] += 1, +0x40c[a] += the same; 16-bit words, kept signed (model.ai).
    "Dead" = DS:422c[i] == 0 for i < DS:42c5, read before ovl36:0a6b frees the records; no
    defender at all counts as all dead.  No rnd.  a = -1 (owner byte 0xff) would add to the
    word before each row (+0x3ba + 0x10 r); the first attacker is a live army, so it is
    refused as unreachable.
    Evidence: asm ovl25:09d7..0af1: 09e9..09f6 DS:0832 == 0 -> ovl25:04c5(1) (blocks allocated
    on demand; after Begin (ovl25:0519) and after a load (ovl29:0dff) they always are, so the
    engine's blocks are taken as allocated); 09f7..0a1a owner nibble, 0x0f -> return;
    0a1d..0a4c terrain == 10; 0a4f..0a84 loop (0a60 type byte of DS:42e6[i] == 0x1c and
    DS:422c[i] == 0 -> heroes; DS:422c[i] == 0 -> dead); 0a86..0a91 a = cwde(DS:42c6[0] +5);
    0a93..0aa2 wiped; 0aa5 ovl25:056c(d); 0ab3..0ae1 the adds at 2a; 0aea ovl25:05b9(d)."""
    s = battle.setup
    w = state.world
    d = w.flags[s.y * MAP_W + s.x] & MAP_OWNER_MASK
    if d == NO_OWNER:
        return
    if not 0 <= d < len(state.ai):
        raise RuntimeError("ovl25:09d7: owner nibble %d has no AI block (DS:40ca[%d])" % (d, d))
    city = w.terrain(s.x, s.y) == Terrain.CITY
    bw = state.battle_work
    heroes = dead = 0
    for i, aid in enumerate(bw.defenders):
        if not bw.d_alive[i]:
            dead += 1
            if state.armies[aid].type_id == HERO_TYPE:
                heroes += 1
    if not bw.attackers:
        # The set-up's first attacker DS:42c6[0] is a null slot (plan register X38): its owner
        # byte would be 0000:0005 (int 1's offset, high byte); the stand-in adds nothing.
        return
    a = s8(state.armies[bw.attackers[0]].owner)
    if not 0 <= a < MEMORY_SIDES:
        # a = -1 (a freed record, owner 0xff) would make the original add at +0x3ba + 0x10 r
        # (the word before each row); a battle's first attacker is a live army: unreachable.
        raise RuntimeError("ovl25:09d7: first attacker's owner %d is no side" % a)
    wiped = int(dead == len(bw.defenders))
    m = state.ai[d].memory
    adds = [heroes, dead, 1, wiped] + ([1, wiped] if city else [])
    for row, v in enumerate(adds):
        m[row][a] = s16(m[row][a] + v)
