"""Cities: production slots, buying, choosing and delivering production, capture outcomes,
razing and renaming (EL §6.3, §6.5).

Sources (re-read by M6a from out/asm/ and out/rea/decomp/; EL = docs/research/exe_logic.md):

* slots, defence      ovl44:0000 (slot of a type), ovl44:094f (filled count), ovl44:0930 (defence)
* buying              ovl44:0dae (offer list), ovl44:0978 (target slot), ovl44:0ee3 (buy)
* choosing            ovl44:00c8 / 00ff (set), ovl44:0185 (stop)
* delivery            ovl43:0000 (L 0x6f600): ovl47:0bd9, transit (rules/vectoring.py), then every
                      own city; ovl43:0bff room, ovl43:0d4f placement test, ovl43:0dd7 unit creation;
                      ovl43:06bd restarts the timers of the cities that delivered
* capture             ovl36:0d8d..10cb (the take-over tail of ovl36:0a6b, the `take_city` hook of
                      rules/combat.py); the choice: human ovl31:0000 dialog with ovl31:03fe occupy,
                      046b pillage, 035e sack, 029f raze; computer ovl19:1864 branches 1a2a / 199c / raze
* raze                ovl32:016b (raze a city), ovl32:0061 (raze an own city from the city screen)
* rename              ovl45:2013

Steps that belong to other milestones go through `HOOKS`, resolved by name as in combat.py.
Not modelled (no engine state): messages and redraws (ovl61:10fb, ovl64:006c, ovl63:1fed,
0c8c:10a1 = flat 5c8e:10a1), the city-screen UI words DS:0e86 /
0e9e beyond what the commands carry, and the DGROUP recount caches (rules/economy.py).
"""
from __future__ import annotations

import importlib
import logging

from ..model import commands as C
from ..model import events as E
from ..model.city import Slot
from ..model.ids import (EMPTY_SLOT, MAP_ARMY, MAP_OWNER_MASK, MAP_W, NO_OWNER, Control)
from .bonuses import s8
from .constants import city as K
from .constants import combat as KC
from .constants import movement as KM
from .constants import unverified_allowed
from .economy import add_gold, city_count, s16
from .engine import IllegalCommand, NotImplementedCommand
from .movement import alloc_army, armies_at, remove_army, type_flag
from .pathfinding import rebuild_cost_map
from .visibility import reveal
from .setup import _set_city_owner

log = logging.getLogger(__name__)

# name -> (milestone, "module:function", what it must do, EXE address)
HOOKS = {
    "quest_event": ("M7a", "warlords2.rules.quests:check",
                    "f(state, words) -> (int, list[Event]): ovl01:1ded with its five argument words",
                    "ovl01:1ded from ovl31:029f / 035e / 03fe / 046b"),
    "ai_raze": ("M8b1", "warlords2.ai.base:after_raze",
                "f(state, city) -> None: the computer's bookkeeping after it razes a city",
                "ovl29:1851 at the end of ovl19:1864"),
}

CHOICES = ("occupy", "pillage", "sack", "raze")


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


def _require(cmd_cls, *names) -> None:
    if unverified_allowed():
        return
    for name in names:
        if _hook(name) is None:
            milestone, target, _, _ = HOOKS[name]
            raise NotImplementedCommand(cmd_cls, milestone, target)


def _call(name, default, *args):
    f = _hook(name)
    if f is None:
        milestone, target, _, _ = HOOKS[name]
        log.warning("city step %s (%s, %s) not implemented; skipped", name, target, milestone)
        return default
    return f(*args)


def _idiv(a: int, b: int) -> int:
    """C integer division (truncation toward zero)."""
    q = abs(a) // abs(b)
    return q if (a >= 0) == (b >= 0) else -q


def _city(state, ci: int):
    if not 0 <= ci < len(state.cities):
        raise IllegalCommand("no city %r" % (ci,))
    return state.cities[ci]


def _own_city(state, ci: int):
    c = _city(state, ci)
    if s8(c.owner) != state.current:
        raise IllegalCommand("city %d is not the current player's" % ci)
    return c


# ------------------------------------------------------------------------------- slots


def filled_slots(c) -> int:
    """Number of slot type bytes >= 0 (not necessarily leading).
    Evidence: decomp ovl44:094f."""
    return sum(1 for s in c.slots[:K.SLOTS.value] if s8(s.type) >= 0)


def defence_of(c) -> int:
    """City defence byte +0x14: 1 with fewer than 3 filled slots, else 2.
    Evidence: decomp ovl44:0930."""
    return K.DEFENCE_MANY.value if filled_slots(c) >= K.DEFENCE_MANY_FROM.value else K.DEFENCE_FEW.value


def slot_of(c, type_id: int) -> int:
    """Index of the first slot holding type_id; 0 when none does.
    Evidence: decomp ovl44:0000 (index counter reset to 0 when it reaches 4)."""
    for i, s in enumerate(c.slots[:K.SLOTS.value]):
        if s8(s.type) == s8(type_id):
            return i
    return 0


def buy_offer(state) -> list:
    """Army type ids offered on the buy screen, in ARMYTYPE file order.
    Evidence: decomp ovl44:0dae / 0ee3: records 0..0x1b of the loaded table with w4 (+0x1e) > -1."""
    return [t.type_id for t in state.army_types[:K.BUY_RECORDS.value]
            if s16(t.buy_price) >= K.BUY_PRICE_MIN.value]


def buy_slot(c) -> int:
    """The slot a purchase goes into (DS:0e86 as the buy screen opens).
    Evidence: decomp ovl44:0978: from slot 3 down, the first k with slot k empty and slot k-1
    filled; otherwise 0 (so a full city replaces slot 0 unless the player picks another slot with
    ovl44:1112, which BuyProduction does not carry)."""
    for k in range(K.SLOTS.value - 1, 0, -1):
        if s8(c.slots[k].type) < 0 and s8(c.slots[k - 1].type) >= 0:
            return k
    return 0


def buy_production(state, cmd: C.BuyProduction) -> list:
    """Buy a production slot for an own city.
    Evidence: decomp ovl44:0ee3 with the button states of ovl44:0dae: a type is offered when w4 >= 0,
    disabled when it is already in a slot or when gold < w4.  The slot (ovl44:0978) gets the type
    and w1 time, w2 cost, w0 strength, w3 moves; defence recomputed (ovl44:0930); gold -= w4.  If
    a production is running (+0x2d > 0) and its type is no longer in any slot, production and
    vectoring stop (+0x2d = 0, +0x31 = 0, target -1/-1, +0x2c = 0xff)."""
    c = _own_city(state, cmd.city)
    if cmd.type not in buy_offer(state):
        raise IllegalCommand("type %r is not offered" % (cmd.type,))
    if any(s8(s.type) == cmd.type for s in c.slots):
        raise IllegalCommand("type %d is already produced here" % cmd.type)
    t = state.army_type(cmd.type)
    p = state.current
    if s16(state.players[p].gold) < s16(t.buy_price):
        raise IllegalCommand("not enough gold")
    k = buy_slot(c)
    old = s8(c.current)
    c.slots[k] = Slot(t.type_id, t.turns, t.strength, t.moves, t.cost)
    c.defence = defence_of(c)
    add_gold(state, p, -s16(t.buy_price))
    if s8(c.turns_left) > 0 and not any(s8(s.type) == old for s in c.slots):
        _stop(c)
    return []


def _stop(c) -> None:
    c.turns_left = 0
    c.vectoring = 0
    c.vector_to = K.VECTOR_OFF_TARGET.value
    c.current = K.NO_PRODUCTION.value


def set_production(state, cmd: C.SetProduction) -> list:
    """Choose the production of an own city from a filled slot, or stop it (slot -1 or None).
    Evidence: decomp ovl44:00c8 -> 00ff: +0x2c = slot type, +0x2d = the time of ovl44:0000(type);
    vectoring is kept.  Stop: ovl44:0185: +0x2d = 0, +0x31 = 0, target -1/-1, +0x2c = 0xff.
    An empty slot is refused here: ovl44:00c8 then re-applies the type remembered in DS:0e9e
    (set when the screen opened, ovl45:01d6..01f5), a screen state the command does not carry."""
    c = _own_city(state, cmd.city)
    if cmd.slot is None or cmd.slot == -1:
        _stop(c)
        return []
    if not 0 <= cmd.slot < K.SLOTS.value or s8(c.slots[cmd.slot].type) < 0:
        raise IllegalCommand("slot %r holds no production" % (cmd.slot,))
    t = s8(c.slots[cmd.slot].type)
    c.current = t
    c.turns_left = c.slots[slot_of(c, t)].time
    return []


# ------------------------------------------------------------------------------- squares


def room(state, ci: int):
    """The first square of the city holding fewer than 8 armies, or None.
    Evidence: asm ovl43:0bff..0cad with the flag argument 0, as both delivery calls pass it
    (asm ovl43:0123, 056c): squares (x+DS:0e54[i], y+DS:0e5c[i]) for i = 0..3; the 20 random
    tries of ovl43:0cb8.. run only with the flag set."""
    c = state.cities[ci]
    for dx, dy in zip(K.ROOM_DX.value, K.ROOM_DY.value):
        if len(armies_at(state, c.x + dx, c.y + dy)) < K.SQUARE_FULL.value:
            return c.x + dx, c.y + dy
    return None


def can_place(state, type_id: int, x: int, y: int) -> bool:
    """Whether a unit of this type may appear on (x, y).
    Evidence: asm ovl43:0d4f..0dd3: refused on a city (ovl62:044a) owned by someone other than
    SCN 0x110; else allowed for a flyer (DS:45c4[6t] = low byte of w16), else when the DS:1274
    cost of the square's terrain is > 0."""
    ci = state.city_at(x, y)
    if ci >= 0 and s8(state.cities[ci].owner) != state.current:
        return False
    if type_flag(state, type_id, "flag16"):
        return True
    return KM.TERRAIN_COST.value[int(state.world.terrain(x, y))] > 0


def create_unit(state, ci: int, x: int, y: int, dest: int):
    """Make one unit of the city's current production; returns the army or None (table full).
    `dest` -1 places it at (x, y); otherwise it starts in transit to city `dest`, or to side
    dest-100's standard when dest >= 100.
    Evidence: asm ovl43:0dd7..0f96: type = +0x2c, slot = ovl44:0000(type); allocator 0b62:0309;
    owner = city owner; allowance and moves = slot moves; strength = slot strength, or
    min(+2, 9) when the current player (SCN 0x110) is Enhanced; home = city; +0xa = 0;
    upkeep = slot cost / 2; city +0x2d = 0.  dest -1: transit 0xff and the square's army bit
    (0b62:02e2); else x = -2 for dest >= 100, -1 otherwise, y = -1, +0xf = dest << 1, transit 0x65."""
    c = state.cities[ci]
    t = s8(c.current)
    s = c.slots[slot_of(c, t)]
    a = alloc_army(state)
    if a is None:
        return None
    if dest == K.DIRECT.value:
        a.x, a.y = x, y
    a.type_id = t
    a.owner = c.owner
    a.allowance = a.moves_left = s.moves
    bonus, cap = K.ENHANCED.value
    a.strength = min(s.strength + bonus, cap) if state.players[state.current].enhanced else s.strength
    a.home_city = ci
    a.hero_slot = a.medals = 0
    a.upkeep = _idiv(s8(s.cost), K.UPKEEP_DIVISOR.value)
    c.turns_left = 0
    if dest == K.DIRECT.value:
        a.vector_dest = 0
        a.transit = K.TRANSIT_NONE.value
        state.world.flags[y * MAP_W + x] |= MAP_ARMY
    else:
        a.x = K.TRANSIT_X_STANDARD.value if dest >= K.STANDARD_DEST.value else K.TRANSIT_X_CITY.value
        a.y = K.TRANSIT_Y.value
        a.vector_dest = dest & 0x7F
        a.transit = K.TRANSIT_NEW.value
    return a


def deliver(state) -> list:
    """Start-of-turn production of the current side: standard check, transit, then every own city.
    Evidence: asm ovl43:0000..06bc (L 0x6f600): ovl47:0bd9; the army loop (rules/vectoring.py
    advance_transit); then for cities 0..count-1 owned by SCN 0x110 with +0x2d > 0: +0x2d -= 1;
    when it is < 1: +0x2d = 0 and, only if gold > 0 (signed) and (ovl43:0bff finds room or +0x31 is
    set), ovl43:0dd7 makes a unit: placed in the room square, or in transit to the city at the
    target (ovl62:044a) or to the standard (p + 100) when no city is there.  A city whose timer ran
    out without a unit stays at 0 and produces nothing until a production is chosen again.
    `Produced` events with info["restart"] are the report entries ovl43:06bd restarts."""
    from . import vectoring
    p = state.current
    events = vectoring.cancel_lost_standard(state)
    events += vectoring.advance_transit(state)
    for ci, c in enumerate(state.cities):
        if s8(c.owner) != p or s8(c.turns_left) <= 0:
            continue
        c.turns_left -= 1
        if s8(c.turns_left) >= 1:
            continue
        c.turns_left = 0
        if s16(state.players[p].gold) <= 0:
            events.append(E.ProductionStalled({"city": ci, "reason": "gold"}))
            continue
        loc = room(state, ci)
        if loc is None and not c.vectoring:
            events.append(E.ProductionStalled({"city": ci, "reason": "room"}))
            continue
        if c.vectoring:
            dest = state.city_at(*c.vector_to)
            if dest < 0:
                dest = p + K.STANDARD_DEST.value
        else:
            dest = K.DIRECT.value
        x, y = loc if loc is not None else (K.TRANSIT_X_CITY.value, K.TRANSIT_Y.value)
        a = create_unit(state, ci, x, y, dest)
        events.append(E.Produced({"city": ci, "army": None if a is None else a.id,
                                  "type": s8(c.current), "x": None if a is None else a.x,
                                  "y": None if a is None else a.y, "dest": dest, "restart": True}))
    return events


def restart_production(state, events) -> None:
    """Restart the timer of every city that delivered (the report screen after delivery).
    Evidence: decomp ovl43:06bd: for report entries of kind 1 or 2 (made in a city, vectored or
    not; kind 0 = an arrival), +0x2d = the time of slot ovl44:0000(city, +0x2c).  The human turn
    calls it after ovl43:0000 returns > 0 (asm ovl68:0597..05a0); the computer turn
    (ovl68:01b3) does not, so a computer city produces again only after a new choice."""
    for ev in events:
        if isinstance(ev, E.Produced) and ev.info.get("restart"):
            c = state.cities[ev.info["city"]]
            c.turns_left = c.slots[slot_of(c, s8(c.current))].time


# ------------------------------------------------------------------------------- capture


def _ai_order(army) -> int:
    """Army byte +0xe low nibble.  Not in model.Army: the allocator 0b62:0309 and ovl43 clear it;
    it is set to 1 by AI code (asm ovl19:0ed4, ovl22:075d) and by 0a8b:0254 (asm 0a8b:0363, in
    the resident movement segment: nibble 1 and +0xf = a destination for the eight stack pointers
    at DS:5e5e; caller not traced).  No rule implemented so far writes it, so it is 0 for every
    army here (reported to the coordinator as a needed model field)."""
    return 0


def take_city(state, city: int, attacker: int, owner: int, flying: bool = False) -> list:
    """Take-over after a won battle on a city (the combat `take_city` hook).
    Evidence: asm ovl36:0d8d..10cb.  Loot from the defending owner nibble d: none for 0x0f; else
    gold[d] when d owns <= 1 city, else gold[d] / cities[d] (idiv); loot = max(trunc(loot/2), 0);
    a human attacker sees STRING (0x93, 0) when loot > 0; when d < 8: gold[attacker] += loot,
    gold[d] -= 2 * loot.  City: if its owner is not 0x0f, +0x2f = 0x0f when it equals SCN 0x110,
    else the old owner; +0x30 = 0; owner = attacker; +0x2d = 0.  Squares 3..0: army bit cleared,
    tiles ovl39:0000, owner nibble = attacker, reveal ovl64:1298 (asm ovl36:0f31: (SCN 0x110,
    x, y); `flying` is the attacking stack's move mode DS:5dfc == 2, set at selection
    0c8c:0529).  Cost map rebuilt for SCN 0x110 (asm ovl36:0f69, 0555:0d9e).  +0x31 = 0.  Old
    owner's armies with x == -1, +0xe low nibble 1 and vector destination == this city are freed
    (0b62:03be at ovl36:1002); every city vectoring to this city loses vectoring and production."""
    from . import vectoring
    c = state.cities[city]
    pl = state.players
    events = []
    if owner == NO_OWNER:
        loot = 0
    else:
        g = s16(pl[owner].gold)
        n = city_count(state, owner)
        loot = g if n <= K.LOOT_SINGLE_CITY.value else _idiv(g, n)
    loot = max(_idiv(loot, K.LOOT_DIVISOR.value), 0)
    if pl[attacker].control == Control.HUMAN and loot > 0:
        g_, i_ = K.LOOT_MSG.value
        events.append(E.Msg(group=g_, index=i_, args=(loot,)))
    moved = owner < K.LOOT_OWNER_LIMIT.value
    if moved:
        add_gold(state, attacker, loot)
        add_gold(state, owner, -K.LOOT_LOSS.value * loot)
    events.append(E.Looted({"city": city, "attacker": attacker, "owner": owner, "loot": loot,
                            "paid": moved}))
    if s8(c.owner) != NO_OWNER:
        c.owner2 = NO_OWNER if c.owner2 == state.current else c.owner
    c.attacked_by = 0
    c.owner = attacker
    c.turns_left = 0
    _set_city_owner(state, city, attacker)                       # ovl39:0000 (same tiles x4)
    f = state.world.flags
    for dx, dy in reversed(list(zip(KC.CITY_TILE_DX.value, KC.CITY_TILE_DY.value))):
        x, y = c.x + dx, c.y + dy
        i = y * MAP_W + x
        f[i] &= ~MAP_ARMY & 0xFF
        f[i] = (f[i] & 0xF0) | (attacker & MAP_OWNER_MASK)
        reveal(state, x, y, flying)
    rebuild_cost_map(state)
    c.vectoring = 0
    here = state.city_at(c.x, c.y)
    for a in reversed(state.armies):
        if (a.owner == owner and a.x == K.TRANSIT_X_CITY.value and _ai_order(a) == 1
                and a.vector_dest == here):
            remove_army(state, a)
    vectoring.cancel_vectors_to(state, c.x, c.y)
    return events


def _slot_value(state, type_id: int) -> int:
    if s8(type_id) < 0:
        raise RuntimeError("ovl44:14ac finds no record for an empty slot; the original reads "
                           "uninitialised stack here (ovl31:0834 / 07d0)")
    return abs(s16(state.army_type(type_id).buy_price)) // K.SLOT_VALUE_DIVISOR.value


def pillage_value(state, ci: int) -> int:
    """Gold for pillaging: |w4| / 2 of the type in slot (filled count - 1).
    Evidence: asm ovl31:0834..0885 (0 when no slot is filled)."""
    c = state.cities[ci]
    n = filled_slots(c)
    return 0 if n < 1 else _slot_value(state, c.slots[n - 1].type)


def sack_value(state, ci: int) -> int:
    """Gold for sacking: sum of |w4| / 2 over slots 1 .. filled count - 1.
    Evidence: decomp ovl31:07d0 (0 with fewer than 2 filled slots)."""
    c = state.cities[ci]
    n = filled_slots(c)
    if n < 2:
        return 0
    return sum(_slot_value(state, c.slots[i].type) for i in range(K.SACK_FIRST_SLOT.value, n))


def _pillage_slots(c) -> None:
    """ovl31:0886: slot (filled - 1) emptied (type byte only), defence recomputed."""
    n = filled_slots(c)
    if n > 0:
        c.slots[n - 1].type = EMPTY_SLOT
        c.defence = defence_of(c)


def _sack_slots(c) -> None:
    """ovl31:0941: slots 1 .. filled-1 emptied (type bytes only), defence recomputed."""
    n = filled_slots(c)
    if n > 1:
        for i in range(K.SACK_FIRST_SLOT.value, n):
            c.slots[i].type = EMPTY_SLOT
        c.defence = defence_of(c)


def _infamy(state, roll, add=0) -> int:
    v = state.rng.rnd(*roll) + add
    state.players[state.current].infamy += v
    return v


def raze(state, ci: int) -> list:
    """Raze a city: owner and +0x2f = 0x0f, ruin tiles, vectoring to it cancelled.
    Evidence: decomp ovl32:016b: tile bytes (x,y) = 0xa0 + 2o, (x,y+1) = 0xb0 + 2o, (x+1,y) =
    0xa1 + 2o, (x+1,y+1) = 0xb1 + 2o with o the owner before razing (byte arithmetic); its own
    +0x31 = 0; every city with +0x31 set and target == (x, y): +0x2d = 0, target 0/0, +0x31 = 0,
    +0x2c = 0xff.  Armies, slots and the owner nibble are not touched (ovl62:0000 rebuilds it)."""
    from . import vectoring
    c = state.cities[ci]
    o2 = (c.owner * 2) & 0xFF
    c.owner = NO_OWNER
    c.owner2 = NO_OWNER
    t = state.world.tiles
    b00, b10, b01, b11 = K.RUIN_TILES.value
    for (dx, dy), base in (((0, 0), b00), ((0, 1), b01), ((1, 0), b10), ((1, 1), b11)):
        t[(c.y + dy) * MAP_W + c.x + dx] = (base + o2) & 0xFF
    c.vectoring = 0
    vectoring.cancel_vectors_to(state, c.x, c.y)
    return [E.CityRazed({"city": ci, "player": state.current})]


def capture(state, cmd: C.CaptureChoice) -> list:
    """Answer the capture question: occupy, pillage, sack or raze the city just taken.
    Evidence: human side, ovl31:0000 buttons and handlers: pillage (0x11b) and sack (0x11e) are
    disabled when ovl31:0834 / 07d0 give 0.  Pillage ovl31:046b: v = 0834, gold += v, ovl31:0886,
    infamy += rnd(1,5,0), ovl01:1ded(1,0,v,0,0).  Sack ovl31:035e: v = 07d0, ovl31:0941, gold += v,
    infamy += rnd(1,10,0)+5, ovl01:1ded(1,0,v,0,0).  Raze ovl31:029f: ovl32:016b, infamy +=
    rnd(1,15,0)+10, ovl01:1ded(2,0,0,0,0).  Occupy ovl31:03fe: ovl01:1ded(4,0,0,0x4d,0x3005).
    Computer side, ovl19:1864 branches: pillage ovl19:1a2a (nothing when 0, else gold, slot,
    rnd(1,5,0)); sack ovl19:199c (pillage when 0, else slots, rnd(1,10,0)+5, gold); raze
    ovl32:016b, rnd(1,15,0)+10, ovl29:1851; occupy changes nothing; no quest call."""
    ev = state.pending
    if not isinstance(ev, E.CityCaptured):
        raise IllegalCommand("no capture question pending")
    if cmd.choice not in CHOICES:
        raise IllegalCommand("unknown capture choice %r" % (cmd.choice,))
    ci = ev.info["city"]
    c = state.cities[ci]
    p = state.current
    human = state.players[p].control == Control.HUMAN
    pv, sv = pillage_value(state, ci), sack_value(state, ci)
    if human:
        if (cmd.choice == "pillage" and pv == 0) or (cmd.choice == "sack" and sv == 0):
            raise IllegalCommand("%s would yield nothing (button disabled)" % cmd.choice)
        _require(C.CaptureChoice, "quest_event")
    elif cmd.choice == "raze":
        _require(C.CaptureChoice, "ai_raze")
    state.pending = None
    events = []
    choice = cmd.choice
    if not human and choice == "sack" and sv == 0:
        choice = "pillage"                                       # ovl19:199c
    if choice == "pillage":
        if human or pv != 0:
            add_gold(state, p, pv)
            _pillage_slots(c)
            inf = _infamy(state, K.PILLAGE_INFAMY.value)
            events.append(E.CityPillaged({"city": ci, "player": p, "gold": pv, "infamy": inf}))
        if human:
            events += _quest(state, (K.QUEST_PILLAGE_SACK.value, 0, pv, 0, 0))
    elif choice == "sack":
        if human:
            _sack_slots(c)
            add_gold(state, p, sv)
            inf = _infamy(state, *K.SACK_INFAMY.value)
        else:
            _sack_slots(c)
            inf = _infamy(state, *K.SACK_INFAMY.value)
            add_gold(state, p, sv)
        events.append(E.CitySacked({"city": ci, "player": p, "gold": sv, "infamy": inf}))
        if human:
            events += _quest(state, (K.QUEST_PILLAGE_SACK.value, 0, sv, 0, 0))
    elif choice == "raze":
        events += raze(state, ci)
        inf = _infamy(state, *K.RAZE_INFAMY.value)
        events[-1].info["infamy"] = inf
        if human:
            events += _quest(state, (K.QUEST_RAZE.value, 0, 0, 0, 0))
        else:
            _call("ai_raze", None, state, ci)
    elif human:
        events += _quest(state, K.QUEST_OCCUPY.value)
    return events


def _quest(state, words) -> list:
    _, evs = _call("quest_event", (0, []), state, tuple(words))
    return list(evs)


def raze_own(state, cmd: C.RazeOwnCity) -> list:
    """Raze one of the current side's cities from the city screen.
    Evidence: decomp ovl32:0061: infamy += rnd(1,25,0) + 25, then ovl32:00fe -> ovl32:016b (see
    `raze`), then the recounts ovl62:03f9 / 02bf / 0372."""
    _own_city(state, cmd.city)
    inf = _infamy(state, *K.RAZE_OWN_INFAMY.value)
    events = raze(state, cmd.city)
    events[-1].info["infamy"] = inf
    return events


def rename(state, cmd: C.RenameCity) -> list:
    """Rename one of the current side's cities.
    Evidence: decomp ovl45:2013: the text editor 7b13:0000 edits the name at city +0x04 in place
    with a limit of 15 characters (the 16-byte field ends before +0x14)."""
    c = _own_city(state, cmd.city)
    name = cmd.name
    if not isinstance(name, str) or len(name) > K.NAME_MAX.value or "\0" in name:
        raise IllegalCommand("city name must be at most %d characters" % K.NAME_MAX.value)
    try:
        name.encode(K.NAME_ENCODING.value)
    except UnicodeEncodeError:
        raise IllegalCommand("city name is not representable in %s" % K.NAME_ENCODING.value) from None
    c.name = name
    return []
