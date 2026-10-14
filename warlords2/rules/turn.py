"""The turn loop: the main-loop pass, the turn starts of computer and human sides, End Turn,
side rotation and the round end (EL §6.2, §9.1).

Sources (re-read by M8a from out/asm/ and out/rea/decomp/; EL = docs/research/exe_logic.md):

* main loop       ovl61:2123: per pass ovl35:09f2(0x110) site tiles (217d), ovl62:0000 map words
                  (2183), 0555:0d9e(0x110, 1) cost map (2194), ovl00:0cc7 proposal marks (219c),
                  ovl68:089d boats in cities (21a1), ovl36:10d7(0x110) view capital (21b0),
                  ovl64:175c Hidden Map lifted (21b6); then a computer side (0x0d0 == 1) runs
                  ovl68:0000 (21f7) and ovl61:17f6 (2203) and the loop goes on; a human side
                  runs ovl68:0259 (2221) and the loop returns to the command loop.  It ends
                  when 0x15b and 0x157 are both set (2245..2252).
* computer turn   ovl68:0000(p)
* human turn      ovl68:0259(p), then ovl68:04bd(0); ovl68:04bd(1) again from the hero-offer
                  buttons (ovl47:12a7 accept, 12c6 decline), ovl68:04bd(0) from the victory /
                  surrender buttons (ovl61:203e / 206c)
* End Turn        ovl61:2074 (button, 07be:02af), then ovl61:17f6 and ovl61:2123
* side rotation   ovl61:17f6; turn order ovl61:1732 (also at every round end)

Steps owned by other milestones go through `HOOKS` (signature-checked, resolved by name as in
combat.py); in strict mode (no --allow-unverified) a missing one raises NotImplementedCommand
before anything changes.

Not modelled (presentation only): the shield strip ovl68:0952, the message boxes and progress
bar of the computer turn (ovl61:11d1 / 1291 / 131b), the "Turn %d" screen (ovl68:03a9..0444),
fog and view drawing (ovl63:2200, ovl63:0000, ovl64:006c, ovl61:0aeb, ovl61:0a6e), button
states (ovl61:0174, ovl61:0418, ovl66:0356, ovl62:0af3), DS:325e / DS:2ade (written, never
read), DS:3254 (derived where read, rules/quests.py), the DGROUP recount caches (rules/economy.py),
the music ovl58:0000 (see `run`).  ovl68:022c (production, recount, group cleanup, refresh,
settlement, flag clear; no fortify) has no caller in the listing and is not wired.

Events: TurnStarted {player, turn, human} at the side's announcement (computer ovl68:011a,
human ovl68:03a9); TurnEnded {player} when the side's turn is over; TurnCue {kind, ...} for a
presentation step of the sequence: "advice" {file (FILE.DAT group, index), blink} (ovl58:026f(5)),
"city_screen" {city} (turn 1, ovl68:0588 ovl45:0000(2, capital)), "tutorial" {file}
(ovl68:05ef ovl61:168d); Msg(18, 0) when Hidden Map is lifted; plus the events of every step.
"""
from __future__ import annotations

import dataclasses
import importlib
import logging

from ..model import commands as C
from ..model import events as E
from ..model.ids import HERO_TYPE, MAP_W, NO_OWNER, Control, Terrain
from ..model.state import (SCN_ROUND_COMPLETE, SCN_SURRENDER_OFFERED, SCN_TURN_ORDER, SCN_TURN_POS,
                           SCN_TUTORIAL, SCN_VICTORY)
from . import city as CT
from . import economy as EC
from . import heroes as H
from . import movement as M
from . import pathfinding as P
from . import quests as Q
from . import ruins as RU
from . import selection as S
from . import visibility as V
from .bonuses import s8
from .constants import turn as K
from .constants import unverified_allowed
from .engine import IllegalCommand, NotImplementedCommand
from .mapwords import refresh_map

log = logging.getLogger(__name__)

# name -> (milestone, "module:function", what it must do, EXE address)
HOOKS = {
    "diplomacy_marks": ("M9a", "warlords2.rules.diplomacy:mark_proposals",
                        "f(state) -> None: relation byte [p][p] (2c04:153b + 9p): clear bits 4, 5; "
                        "bit 4 when some b != p has proposal [b][p] != current, bit 5 when all such "
                        "proposals are more peaceful", "ovl00:0cc7 at ovl61:219c"),
    "diplomacy_resolve": ("M9a", "warlords2.rules.diplomacy:resolve",
                          "f(state, a) -> list[Event]: resolution of side a's proposals (EL §6.6)",
                          "ovl00:0db3 at ovl68:0153 (computer), ovl68:02f4 (human)"),
    "diplomacy_penalty": ("M9a", "warlords2.rules.diplomacy:penalty",
                          "f(state) -> list[Event]: infamy for refused de-escalations of SCN 0x110 "
                          "(EL §6.6, rolls rnd)", "ovl00:1063 at ovl61:2087 (human End Turn)"),
    "ai_turn": ("M8b1", "warlords2.ai.base:computer_turn",
                "f(state) -> list[Event]: the computer side's moves (phases of EL §6.8)",
                "ovl25:0000(1) at ovl68:01e3"),
    "eliminate": ("M9a", "warlords2.rules.victory:eliminate",
                  "f(state) -> list[Event]: every live side with 0 cities is eliminated (EL §6.7)",
                  "ovl61:18ab at ovl61:1825"),
    "end_check": ("M9a", "warlords2.rules.victory:check",
                  "f(state) -> list[Event]: end states, no humans left, victory, surrender offer "
                  "flags (EL §6.7)", "ovl61:1aed at ovl61:182a"),
    "history_round": ("M9a", "warlords2.rules.history:record_round",
                      "f(state) -> list[Event]: the per-round history record (turn 2 starts it, "
                      "nothing from turn 0xca on)", "ovl41:0d60 at ovl61:1837"),
    "victory_screen": ("M9a", "warlords2.rules.victory:victory_screen",
                       "f(state) -> list[Event]: sets SCN 0x157; its button 0x1e3 (ovl61:2004) "
                       "continues with rules.turn.resume(state, 0)", "ovl61:1fbd at ovl68:04e3"),
    "surrender_screen": ("M9a", "warlords2.rules.victory:surrender_offer",
                         "f(state) -> list[Event]: sets SCN 0x15f and SurrenderOffered pending; "
                         "AcceptSurrender (buttons 0x1e5 ovl61:1e4e / 0x1e6 ovl61:1ecd, then "
                         "ovl61:2004 / 2046) continues with rules.turn.resume(state, 0)",
                         "ovl61:1f68 at ovl68:0502"),
}


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


def _require(state, cmd_cls) -> None:
    """Strict mode: every hook the loop may reach must exist before anything changes."""
    if unverified_allowed():
        return
    for name, (milestone, target, _, _) in HOOKS.items():
        if _hook(name) is None:
            raise NotImplementedCommand(cmd_cls, milestone, target)
    if any(p.alive and p.control == Control.COMPUTER for p in state.players) \
            and H._hook("ai_hero_city") is None:
        milestone, target, _, _ = H.HOOKS["ai_hero_city"]
        raise NotImplementedCommand(cmd_cls, milestone, target)


def _call(name, default, *args):
    f = _hook(name)
    if f is None:
        milestone, target, _, _ = HOOKS[name]
        if not unverified_allowed():
            raise NotImplementedCommand(C.EndTurn, milestone, target)
        log.warning("turn step %s (%s, %s) not implemented; skipped", name, target, milestone)
        return default
    return f(*args)


def _flag(state, off) -> int:
    return state.flags.get(off, 0)


def _live_humans(state) -> int:
    return sum(1 for p in state.players if p.alive and p.control == Control.HUMAN)


def _clear_selection(state) -> None:
    """DS:5e3e[0..7], DS:5e62 and DS:5e5e = 0 (the palette words are left)."""
    sel = state.selection
    sel.selected, sel.hero, sel.moving = -1, -1, []


# ------------------------------------------------------------------------------- side rotation


def turn_order(state) -> None:
    """Turn order for the coming round: order[i] = i; with Random Turns 20 swaps of two
    positions drawn rnd(1,8,-1) twice; position 0x173 = 0.
    Evidence: asm ovl61:1732..17f5 (SCN 0x122 test 173f, order words 0x163 + 2i, swap 177e..17e0,
    0x173 = 0 at 17eb).  Called at new game (rules.setup) and at every round end (ovl61:1814)."""
    n = K.SIDES.value
    order = list(range(n))
    if state.options.random_turns:
        for _ in range(K.TURN_SWAPS.value):
            a = state.rng.rnd(*K.TURN_SWAP_ROLL.value)
            b = state.rng.rnd(*K.TURN_SWAP_ROLL.value)
            order[a], order[b] = order[b], order[a]
    for i, p in enumerate(order):
        state.flags[SCN_TURN_ORDER + 2 * i] = p
    state.flags[SCN_TURN_POS] = 0


def active_neutrals(state) -> list:
    """Active neutral cities at the round end: every intact neutral city that was attacked
    counts its production down and makes the unit at 0; a city not busy with a production and
    holding fewer than 4 armies chooses a kind-2 production.
    Evidence: asm ovl39:025a..0380 (SCN 0x11a >= 2; cities count-1..0 with owner 0x0f, terrain 10
    at x, y and +0x30 != 0: +0x2d != 0 -> -1, at 0 ovl39:0381; ovl29:0fd5 = +0x2d != 0 and
    != the time of slot ovl44:0000(+0x2c); 0b62:007d < 4 -> ovl29:103d(c, 2, -1, 0)); ovl39:0381
    (asm 0381..0417: ovl43:0dd7(c, x, y, -1), +7 = 0, +0x2c = 0xff, +0x2d = 0, map bit 0x10);
    ovl29:103d / 0e5a (decomp: the best slot of the kind, refused when gold[0x110] < slot cost
    + 30 and the turn > 5; else +0x2c = type, +0x2d = slot time, +0x31 = 0)."""
    from .setup import _choose_production
    if state.options.neutral_cities < K.ACTIVE_NEUTRALS.value:
        return []
    events = []
    for ci in range(len(state.cities) - 1, -1, -1):
        c = state.cities[ci]
        if s8(c.owner) != NO_OWNER or state.world.terrain(c.x, c.y) != Terrain.CITY \
                or not c.attacked_by:
            continue
        if c.turns_left & 0xFF:
            c.turns_left = (c.turns_left - 1) & 0xFF
            if not c.turns_left:
                a = CT.create_unit(state, ci, c.x, c.y, -1)
                if a is not None:
                    a.moves_left = 0
                    events.append(E.Produced({"city": ci, "army": a.id, "type": a.type_id,
                                              "x": a.x, "y": a.y, "dest": -1, "restart": False}))
                c.current, c.turns_left = 0xFF, 0     # the map bit: ovl43:0dd7 (0b62:02e2)
        busy = c.turns_left and c.turns_left != c.slots[CT.slot_of(c, s8(c.current))].time
        if busy or len(M.armies_at(state, c.x, c.y)) >= K.ACTIVE_ARMY_CAP.value:
            continue
        pick = _choose_production(state, c, K.ACTIVE_KIND.value)
        if pick < 0:
            continue
        slot = c.slots[CT.slot_of(c, pick)]
        if EC.s16(state.players[state.current].gold) < s8(slot.cost) + K.PRODUCTION_RESERVE.value \
                and H.turn(state) > K.PRODUCTION_FREE_TURNS.value:
            continue
        c.current, c.turns_left, c.vectoring = pick, slot.time, 0
    return events


def next_side(state) -> list:
    """Make the next live side in turn order current; a completed round first ends: turn + 1,
    new turn order, elimination and end states, Active neutrals, history.
    Evidence: asm ovl61:17f6..18aa: repeat { if 0x118: turn += 1 (180e), ovl61:1732 (1814),
    0x118 = 0, ovl61:18ab (1825), ovl61:1aed (182a), ovl30:0034 (an empty function), ovl39:025a
    (1832), ovl41:0d60 (1837), ovl68:0952(1) (shield strip); 0x110 = order[0x173]; 0x173 += 1;
    0x173 >= 8 -> 0x118 = 1 } until 0x137[0x110] != 0.  With no live side the original never
    leaves the loop (ovl61:1aed has quit the program by then); here it stops after three passes
    over the order."""
    events = []
    n = K.SIDES.value
    for _ in range(3 * n):
        if _flag(state, SCN_ROUND_COMPLETE):
            state.turn += 1
            turn_order(state)
            state.flags[SCN_ROUND_COMPLETE] = 0
            events += _call("eliminate", [], state)
            events += _call("end_check", [], state)
            events += active_neutrals(state)
            events += _call("history_round", [], state)
        pos = _flag(state, SCN_TURN_POS)
        state.current = _flag(state, SCN_TURN_ORDER + 2 * pos)
        pos += 1
        state.flags[SCN_TURN_POS] = pos
        if pos >= n:
            state.flags[SCN_ROUND_COMPLETE] = 1
        if state.players[state.current].alive:
            return events
    return events


# ------------------------------------------------------------------------------- main-loop pass


def land_in_cities(state) -> None:
    """Armies of the side on turn that stand in a city are no longer aboard.
    Evidence: asm ovl68:089d..092e (records 0x181-1..0, owner == 0x110, flags word != 0,
    ovl62:044a(x, y) >= 0 -> +0xc &= ~0x1000); main loop ovl61:21a1."""
    p = state.current
    for a in reversed(state.armies):
        if s8(a.owner) == p and a.flags and state.city_at(a.x, a.y) >= 0:
            a.flags &= ~M.K.ABOARD.value


def update_capital(state, p: int) -> None:
    """Side p's capital square (player record +4 / +6, `Player.capital`): the first capital
    while it is p's intact city, else the own city nearest to the current one; unchanged when
    p owns no city, and the first capital with only one live side.
    Evidence: decomp ovl36:10d7 (main loop ovl61:21b0): p > 7 -> nothing; one live side -> first;
    ovl62:044a(first capital, record +0x10 / +0x12), not terrain 10 there -> none; cities[p] != 0
    and (none or owner != p) -> ovl62:04fa(+4, +6, p, 0): none -> unchanged, else that city's
    x, y; otherwise the first capital."""
    if p >= K.SIDES.value:
        return
    pl = state.players[p]
    base = K.SCN_FIRST_CAPITAL.value + K.PLAYER_REC_LEN.value * p
    first = (EC.s16(_flag(state, base)), EC.s16(_flag(state, base + 2)))
    if sum(1 for q in state.players if q.alive) != 1:
        ci = state.city_at(*first)
        if ci >= 0 and state.world.terrain(state.cities[ci].x, state.cities[ci].y) != Terrain.CITY:
            ci = -1
        if EC.city_count(state, p) and (ci < 0 or s8(state.cities[ci].owner) != p):
            from .setup import _nearest_city
            best = _nearest_city(state, pl.capital[0], pl.capital[1], lambda c: s8(c.owner) == p, False)
            if best >= 0:
                pl.capital = (state.cities[best].x, state.cities[best].y)
            return
    pl.capital = first


def lift_hidden_map(state) -> list:
    """With Hidden Map: when every live side has explored all four squares of every intact
    city, Hidden Map is switched off for the rest of the game (message STRING (18, 0)).
    Evidence: decomp ovl64:175c (main loop ovl61:21b6): dead-side mask OR the explored bytes
    DS:126c at (x, y), (x+1, y), (x, y+1), (x+1, y+1) of each city with terrain 10 must be 0xff;
    then 0x124 = 0, ovl64:15da (display table), ovl61:11d1 with ovl59:04f0(0x12, 0) (asm
    ovl64:18c7..18d6)."""
    if not state.options.hidden_map:
        return []
    dead = 0
    for q in range(K.SIDES.value):
        if not state.players[q].alive:
            dead |= 1 << q
    ex = state.world.explored
    for c in state.cities:
        if state.world.terrain(c.x, c.y) != Terrain.CITY:
            continue
        i = c.y * MAP_W + c.x
        if (ex[i] | ex[i + 1] | ex[i + MAP_W] | ex[i + MAP_W + 1] | dead) & 0xFF != K.ALL_SEEN.value:
            return []
    state.options = dataclasses.replace(state.options, hidden_map=0)
    g, i = K.HIDDEN_LIFTED_MSG.value
    return [E.Msg(group=g, index=i)]


def pass_top(state) -> list:
    """The steps at the top of every main-loop pass, for the side whose turn comes (SCN 0x110).
    Evidence: asm ovl61:2173..21b6: ovl35:09f2(0x110), ovl62:0000, 0555:0d9e(0x110, 1),
    ovl00:0cc7, ovl68:089d, ovl36:10d7(0x110), ovl64:175c."""
    p = state.current
    RU.site_tiles(state, p)
    refresh_map(state)
    P.rebuild_cost_map(state)
    _call("diplomacy_marks", None, state)
    land_in_cities(state)
    update_capital(state, p)
    return lift_hidden_map(state)


# ------------------------------------------------------------------------------- computer turn


def computer_turn(state) -> list:
    """The whole turn of a computer side, start to end.
    Evidence: asm ovl68:0000..022b: 0x159 = 0x147[p] (0028); no live human -> 0x159 = 1 (0080);
    > 1 live human with Hidden Map and 0x147[p] == 0 -> 0x159 = 0 (00af); with Hidden Map
    ovl64:0d39 + 1558 (00c8 / 00cd); ovl00:0db3 (0153); ovl62:03f9 and cities[p] <= 0 -> done
    (0166..0198: no view store, no selection clear); ovl47:0000 / 0301 offer (019b / 01a4);
    ovl47:0579 levels (01a9); ovl68:0827 settlement (01b0); ovl43:0000 production (01b3, no
    ovl43:06bd); 0b62:0d85 (01b8); ovl68:05fb (01bf); ovl67:0000 (01c2); ovl67:0113 (01cc);
    ovl01:1ded(-1) (01d9); ovl25:0000(1) (01e3); DS:5e3e[8], 5e62, 5e5e = 0 (01e9..020f); with
    Hidden Map ovl64:0e68 (0223)."""
    p = state.current
    pl = state.players[p]
    humans = _live_humans(state)
    hidden = bool(state.options.hidden_map)
    state.flags[K.SCN_VIEWED.value] = pl.shown
    if humans == 0:
        state.flags[K.SCN_VIEWED.value] = 1
    if humans > 1 and hidden and not pl.shown:
        state.flags[K.SCN_VIEWED.value] = 0
    if hidden:
        V.load_view(state, p)
    events = [E.TurnStarted({"player": p, "turn": state.turn, "human": False})]
    events += _call("diplomacy_resolve", [], state, p)
    if EC.city_count(state, p) <= 0:
        return events + [E.TurnEnded({"player": p})]
    events += H.computer_offer(state)
    events += H.promote_all(state)
    events += EC.settle(state)
    events += CT.deliver(state)
    S.group_cleanup(state)
    M.refresh_moves(state, p)
    events += S.fortify_marks(state)
    S.clear_turn_flags(state)
    events += Q.check(state, (-1, 0, 0, 0, 0))[1]
    events += _call("ai_turn", [], state)
    _clear_selection(state)
    if hidden:
        V.store_view(state, p)
    return events + [E.TurnEnded({"player": p})]


# ------------------------------------------------------------------------------- human turn


def centre_view(state, x: int, y: int) -> None:
    """Centre the map view on (x, y): SCN 0x17d / 0x17f and the view rectangle.
    Evidence: decomp ovl64:0629 (x clamped to 4..107, y to 4..151; left/top = centre - 4,
    right/bottom = centre + 4 capped at 0x6f / 0x9b); human turn start ovl68:039c / 047c."""
    x = min(max(x, K.VIEW_X.value[0]), K.VIEW_X.value[1])
    y = min(max(y, K.VIEW_Y.value[0]), K.VIEW_Y.value[1])
    m = K.VIEW_MARGIN.value
    top, left, bottom, right, cx, cy = K.SCN_VIEW.value
    xmax, ymax = K.VIEW_MAX.value
    state.flags.update({top: max(y - m, 0), left: max(x - m, 0), right: min(x + m, xmax),
                        bottom: min(y + m, ymax), cx: x, cy: y})


def advice_file(state, digital: bool, members, roll):
    """The talking advisor's turn remark up to the face, for the current side p: the FILE.DAT
    (group, index) to speak (`digital`) or show as captions, or None for no face.  Writes SCN
    bytes 0x100[p] / 0x108[p].
    Evidence: asm ovl58:02ab..0718.  c = cities of p (DS:5dea, ovl62:03f9 at ovl68:02fe);
    c >= 40: nothing.  h = armies of type 0x1c owned by p (records SCN 0x181 - 1 .. 0).
    Losing, bucket 0x108[p] > c: 0x100[p] = 2, 0x108[p] = t = c / 5 * 5, group LOSE[t + 5]
    (else 46).  Winning, 0x108[p] + 5 <= c: 0x100[p] = 1, 0x108[p] = t, group WIN[t] (else
    47).  Otherwise only every 7th turn (ovl61:225b % 7 == 0): gold < 100 -> 54, gold > 2800
    -> 55, h <= 0 -> 56, h >= 5 -> 57, else rnd(1, 5, 0) == 1 -> 58, else nothing.  The group
    is the sample group, or + 30 for the caption group without speech; its index is -1:
    ovl59:052f rolls rnd(1, members, -1).  Turn 1 (ovl58:070e): no face (the bytes stay
    written).  (Both halves of the lose / win tests at 0305..036b and 049d..0502 test the
    same, whatever 0x100[p] holds.)
    `members(group)` = FILE.DAT group size; `roll(dice, sides, add)` = the game's roller.
    Rolls, in order: rnd(1, 5, 0) in the remark branch only, then rnd(1, n, -1) for the pick.
    (Moved here from audio/voice.py, which re-exports it as `turn_advice`.)"""
    p = state.current
    f = state.flags
    c = EC.city_count(state, p)
    if c >= K.ADVICE_CITY_MAX.value:
        return None
    heroes = sum(1 for a in state.armies if a.type_id == HERO_TYPE and a.owner == p)
    mode_b, bucket_b = K.ADVICE_MODE_BYTE.value, K.ADVICE_BUCKET_BYTE.value
    bucket = s8(f.get(bucket_b + p, 0))
    step = K.ADVICE_BUCKET.value
    t = c // step * step
    if bucket > c:
        f[mode_b + p], f[bucket_b + p] = 2, t & 0xFF
        group = K.ADVICE_LOSE.value.get(t + step, K.ADVICE_LOSE_ELSE.value)
    elif bucket + step <= c:
        f[mode_b + p], f[bucket_b + p] = 1, t & 0xFF
        group = K.ADVICE_WIN.value.get(t, K.ADVICE_WIN_ELSE.value)
    else:
        if H.turn(state) % K.ADVICE_EVERY.value:
            return None
        gold = state.players[p].gold
        (low, g_low), (high, g_high) = K.ADVICE_GOLD.value
        (none, h_none), (many, h_many) = K.ADVICE_HEROES.value
        if gold < low:
            group = g_low
        elif gold > high:
            group = g_high
        elif heroes <= none:
            group = h_none
        elif heroes >= many:
            group = h_many
        elif roll(*K.ADVICE_REMARK_ROLL.value) == 1:
            group = K.ADVICE_REMARK.value
        else:
            return None
    if not digital:
        group += K.ADVICE_CAPTION.value
    n = members(group)
    index = min(roll(1, n, K.ADVICE_PICK_ADD.value), n - 1)
    if H.turn(state) == K.FIRST_TURN.value:
        return None
    return group, index


def advice(state) -> list:
    """ovl58:026f(5) at the human turn start: nothing unless the talking advisor is on
    (`GameState.advisor_talking`); else the remark of `advice_file`, and for a face the blink
    counter rnd(1, 30, 10).  All of it rolls the game's dice, so it is engine state.
    Evidence: asm ovl58:0293 (DS:26c8 set -> return), ovl58:02a2..0718, ovl58:094c (blink roll
    once per face); call ovl68:04ab."""
    if not state.advisor_talking:
        return []
    groups = state.advisor_groups

    def members(g):
        if g not in groups:
            raise RuntimeError("GameState.advisor_groups lacks FILE.DAT group %d" % g)
        return groups[g]

    picked = advice_file(state, bool(state.advisor_digital), members, state.rng.rnd)
    if picked is None:
        return []
    blink = state.rng.rnd(*K.ADVICE_BLINK_ROLL.value)
    return [E.TurnCue({"kind": "advice", "file": picked, "blink": blink})]


def human_turn(state) -> list:
    """The start of a human side's turn, up to its first command (or a pending question).
    Evidence: asm ovl68:0259..04bc: DS:16a6 set -> cleared and 0x147[q] = 1 for live q (026d);
    0x159 = 1 (02ed); ovl00:0db3 (02f4); ovl64:0d39 (02f9, always) and ovl64:1558 with Hidden
    Map (031a); ovl61:0aeb (display); 0b62:0d85 (0351); ovl68:05fb (0358); ovl67:0000 (035b);
    ovl68:0827 (0362); ovl67:0113 (0365); ovl64:0629(record +4, +6) (039c or 047c); the turn
    screen (03a9..0444); 0b62:0ea0(-1, -1) (0491); ovl01:1ded(-1) (04a1); ovl58:026f(5) (04ab);
    ovl68:04bd(0) (04b5)."""
    p = state.current
    if state.reveal_at_first_human_turn:
        state.reveal_at_first_human_turn = 0
        for q in state.players:
            if q.alive:
                q.shown = 1
    state.flags[K.SCN_VIEWED.value] = 1
    events = _call("diplomacy_resolve", [], state, p)
    V.load_view(state, p, fill=bool(state.options.hidden_map))
    S.group_cleanup(state)
    M.refresh_moves(state, p)
    events += S.fortify_marks(state)
    events += EC.settle(state)
    S.clear_turn_flags(state)
    centre_view(state, *state.players[p].capital)
    events.append(E.TurnStarted({"player": p, "turn": state.turn, "human": True}))
    events += M.sink(state)
    events += Q.check(state, (-1, 0, 0, 0, 0))[1]
    events += advice(state)
    return events + resume(state, 0)


def resume(state, stage: int) -> list:
    """The rest of a human turn start from `stage`: 0 from the turn start and after the
    victory / surrender screens, 1 after the hero offer was answered.
    Evidence: asm ovl68:04bd..05fa: 0x15b and not 0x157 -> ovl61:1fbd, return; 0x15d and not
    0x15f -> ovl61:1f68, return; stage <= 0: ovl47:0579 levels, ovl47:0000 offer -> ovl47:0d5c
    dialog and return (its buttons call 04bd(1)); stage <= 1 and turn 1: ovl45:0000(2, capital)
    (the production screen) and return; stage <= 2: ovl43:0000 production, ovl43:06bd restart
    when it reported something; then the turn-2 tutorial page when SCN 0x12e is set and byte
    0x134 bit 0x40 clear (bit set, FILE.DAT (25, 7) through ovl61:168d).  (Music ovl58:0000(4)
    before the dialog / (1) without one: see `run`.)"""
    t = H.turn(state)
    if _flag(state, SCN_VICTORY) and not _flag(state, K.SCN_ACK_VICTORY.value):
        return _call("victory_screen", [], state)
    if _flag(state, SCN_SURRENDER_OFFERED) and not _flag(state, K.SCN_ACK_SURRENDER.value):
        return _call("surrender_screen", [], state)
    events = []
    if stage <= 0:
        events += H.promote_all(state)
        offer = H.human_offer(state)
        if offer:
            state.pending.info["resume"] = 1
            return events + offer
    if stage <= 1 and t == K.FIRST_TURN.value:
        p = state.players[state.current]
        return events + [E.TurnCue({"kind": "city_screen", "city": state.city_at(*p.capital)})]
    if stage <= 2:
        made = CT.deliver(state)
        CT.restart_production(state, made)
        events += made
    if _flag(state, SCN_TUTORIAL) and t == K.TUTORIAL_TURN.value:
        b = K.SCN_TUTORIAL_BYTE.value
        if not _flag(state, b) & K.TUTORIAL_BIT.value:
            state.flags[b] = _flag(state, b) | K.TUTORIAL_BIT.value
            events.append(E.TurnCue({"kind": "tutorial", "file": K.TUTORIAL_FILE.value}))
    return events


# ------------------------------------------------------------------------------- the loop


def run(state, max_sides: int | None = None) -> list:
    """The main loop from the current side on: computer sides play their whole turn and the
    next side follows, until a human side's turn has started (its commands come next), a
    question is pending, the victory was acknowledged (0x15b and 0x157), no side is alive, or
    `max_sides` computer turns were played (for a game without humans; None = no limit).
    Called once after `rules.setup.new_game` (the original enters the loop from ovl61:0000) and
    by End Turn.  Not modelled: the music of ovl58:0000 (mode 2 per computer turn at 21d4, 1 or
    4 at the human turn start), which also rolls the game's dice for a random track, but only
    when the requested mode differs from the playing one or the track has ended
    (ovl58:0011..0020) -- a wall-clock condition; music never rolls here (plan §5 R15).
    Evidence: asm ovl61:2123..225a; ovl68:0000 at 21f7, ovl61:17f6 at 2203, ovl68:0259 at 2221."""
    _require(state, C.EndTurn)
    events = []
    played = 0
    while state.pending is None:
        if _flag(state, SCN_VICTORY) and _flag(state, K.SCN_ACK_VICTORY.value):
            break
        if not any(p.alive for p in state.players):
            break
        events += pass_top(state)
        if state.players[state.current].control == Control.HUMAN:
            events += human_turn(state)
            break
        if max_sides is not None and played >= max_sides:
            break
        events += computer_turn(state)
        played += 1
        events += next_side(state)
    return events


def end_turn(state, cmd: C.EndTurn) -> list:
    """End Turn of the human side on turn: nothing once the victory flag is set; else the
    refused-proposal infamy, the side's explored view stored, the selection cleared, the next
    side made current and the main loop run.
    Evidence: asm ovl61:2074..2122 (button 07be:02af): 0x15b set -> return; ovl00:1063 (2087);
    ovl61:0418 (buttons); ovl64:0e68 (2095, also without Hidden Map); DS:5e5e, 5e62, 5e3e[8] = 0
    (209a..20be); display (20c0..2110); ovl61:17f6 (2119); ovl61:2123 (211e)."""
    p = state.current
    if state.players[p].control != Control.HUMAN or not state.players[p].alive:
        raise IllegalCommand("End Turn: side %d is not a human side on turn" % p)
    if _flag(state, SCN_VICTORY):
        return []
    _require(state, C.EndTurn)
    events = _call("diplomacy_penalty", [], state)
    V.store_view(state, p)
    _clear_selection(state)
    events.append(E.TurnEnded({"player": p}))
    events += next_side(state)
    return events + run(state)
