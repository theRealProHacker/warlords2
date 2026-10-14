"""Vectoring: sending a city's production to another own city or to the side's standard (EL §6.4).

Sources (re-read by M6a from out/asm/ and out/rea/decomp/):

* set                ovl44:028b (L 0x7082b), destination from ovl62:0651 (nearest own city to the
                     click, or p + 100 when the standard ovl47:0b47 is nearer)
* sources counted    ovl44:0410 (L 0x709b0)
* standard square    ovl47:0b47 (L 0x75e77): item p on the map with the road-layer item bit
* lost standard      ovl47:0bd9: vectoring to the standard switched off when it is not on the map
* transit, arrival   the army loop of ovl43:0000 (asm ovl43:0029..04b8)
* cancelled          ovl36:1016..10b1 (city taken) and ovl32:016b (city razed)

Army +0xf holds the destination in bits 1-7 (`Army.vector_dest` here, bit 0 not modelled);
+0x10 the transit state 0x65 / 0x66 / 0xff.  Not modelled: ovl44:021d, a second way to target
the standard that writes (-2, -1) without the source count (its button was not traced).
"""
from __future__ import annotations

from ..model import commands as C
from ..model import events as E
from ..model.ids import MAP_W, ROAD_STANDARD
from .bonuses import s8
from .city import can_place, room
from .movement import armies_at, remove_army
from .constants import city as K
from .engine import IllegalCommand


def standard_square(state, p: int):
    """Square of side p's standard when it lies on the map, else None.
    Evidence: decomp ovl47:0b47: item p (2c04:0ce9 + p*0x1d) with state +0x16 == 1 and road-layer
    bit 0x40 set at its +0x19 / +0x1b square."""
    if p >= len(state.items):
        return None
    it = state.items[p]
    if it.state != K.STANDARD_ITEM_STATE.value or not 0 <= it.x < MAP_W:
        return None
    if not state.world.roads[it.y * MAP_W + it.x] & ROAD_STANDARD:
        return None
    return it.x, it.y


def vector_count(state, dest: int) -> int:
    """Cities already vectoring to `dest`.
    Evidence: decomp ovl44:0410: dest -2 or > 99: cities with +0x31 set, owner == SCN 0x110 and
    target x == -2; else cities (any owner) with +0x31 set and target == dest's x, y."""
    if dest == -2 or dest >= K.STANDARD_DEST.value:
        sx = K.STANDARD_TARGET.value[0]
        return sum(1 for c in state.cities
                   if c.vectoring and s8(c.owner) == state.current and c.vector_to[0] == sx)
    d = state.cities[dest]
    return sum(1 for c in state.cities if c.vectoring and tuple(c.vector_to) == (d.x, d.y))


def set_vector(state, cmd: C.SetVector) -> list:
    """Vector an own city's production to `dest`: an own city index, the city itself (switches
    vectoring off), or 100 + current player for the standard.
    Evidence: decomp ovl44:028b: nothing unless a production is running (+0x2d >= 1); destination
    = the city itself -> +0x31 = 0, target -1/-1; refused when ovl44:0410 counts more than 3
    (a fifth source); else +0x31 = 1 and target = the city's x, y, or (-2, -2) for >= 100.  The
    destination comes from ovl62:0651, so only own cities (ovl62:04fa owner filter) or p + 100
    while the standard is on the map (ovl47:0b47)."""
    if not 0 <= cmd.city < len(state.cities):
        raise IllegalCommand("no city %r" % (cmd.city,))
    c = state.cities[cmd.city]
    p = state.current
    if s8(c.owner) != p:
        raise IllegalCommand("city %d is not the current player's" % cmd.city)
    if s8(c.turns_left) < 1:
        raise IllegalCommand("no production running")
    dest = cmd.dest
    if dest == p + K.STANDARD_DEST.value:
        if standard_square(state, p) is None:
            raise IllegalCommand("the standard is not on the map")
    elif not (0 <= dest < len(state.cities) and s8(state.cities[dest].owner) == p):
        raise IllegalCommand("destination %r is not an own city" % (dest,))
    if dest == cmd.city:
        c.vectoring = 0
        c.vector_to = K.VECTOR_OFF_TARGET.value
        return []
    if vector_count(state, dest) > K.VECTOR_MAX_OTHERS.value:
        raise IllegalCommand("four cities already vector there")
    c.vectoring = 1
    if dest < K.STANDARD_DEST.value:
        c.vector_to = (state.cities[dest].x, state.cities[dest].y)
    else:
        c.vector_to = K.STANDARD_TARGET.value
    return []


def cancel_lost_standard(state) -> list:
    """Switch off vectoring to the standard when the current side's standard is not on the map.
    Evidence: decomp ovl47:0bd9 (first call of ovl43:0000): own cities with +0x31 set and target
    x == -2 get +0x31 = 0 (target and production kept)."""
    if standard_square(state, state.current) is not None:
        return []
    sx = K.STANDARD_TARGET.value[0]
    for c in state.cities:
        if s8(c.owner) == state.current and c.vectoring and c.vector_to[0] == sx:
            c.vectoring = 0
    return []


def cancel_vectors_to(state, x: int, y: int) -> None:
    """Every city vectoring to the city at (x, y) loses vectoring and its production.
    Evidence: asm ovl36:1016..10b1 and decomp ovl32:016b: +0x31 set and target == (x, y) ->
    target 0/0, +0x31 = 0, +0x2d = 0, +0x2c = 0xff (cities of every owner)."""
    for c in state.cities:
        if c.vectoring and tuple(c.vector_to) == (x, y):
            c.vector_to = K.CANCELLED_TARGET.value
            c.vectoring = 0
            c.turns_left = 0
            c.current = K.NO_PRODUCTION.value


def _place(a, x: int, y: int) -> None:
    a.x, a.y = x, y
    a.vector_dest = 0                       # +0xf &= 1 (bit 0 not modelled)
    a.transit = K.TRANSIT_NONE.value        # +0xe &= 0xf0 (not modelled), +0x10 = 0xff


def _home(state, a, events, x_reset: bool) -> None:
    if x_reset:
        a.x = K.TRANSIT_X_CITY.value
    a.vector_dest = a.home_city & 0x7F
    a.transit = K.TRANSIT_NEW.value
    events.append(E.VectorRerouted({"army": a.id, "home": a.home_city, "deleted": False}))


def advance_transit(state) -> list:
    """Move the current side's vectored units one step: 0x65 -> 0x66, 0x66 -> arrival.
    Evidence: asm ovl43:0029..04b8, armies from the top index down, owner == SCN 0x110:
    (-1|-2, -1) with 0x65 -> 0x66.  (-1, -1) with 0x66: ovl43:0bff room in the destination city and
    ovl43:0d4f there -> placed (+0xf &= 1, transit 0xff); otherwise deleted (0b62:03be) when the
    destination is its home city (+9), else rerouted home (+0xf = home << 1, 0x65).  (-2, -1) with
    0x66: placed on the standard square (ovl47:0b47) when it exists, holds < 8 armies (0b62:007d)
    and passes ovl43:0d4f; otherwise x = -1 and rerouted home.  So a unit arrives two turns after
    it was made.  Placement does not set the map army bit (ovl62:0000 rebuilds it)."""
    p = state.current
    new, on_way = K.TRANSIT_NEW.value, K.TRANSIT_ON_WAY.value
    xc, xs, ty = K.TRANSIT_X_CITY.value, K.TRANSIT_X_STANDARD.value, K.TRANSIT_Y.value
    events = []
    for a in reversed(state.armies):
        if a.owner != p:
            continue
        if a.y == ty and a.x in (xc, xs) and a.transit == new:
            a.transit = on_way
        elif (a.x, a.y) == (xc, ty) and a.transit == on_way:
            d = a.vector_dest & 0x7F
            loc = room(state, d)
            if loc is not None and can_place(state, a.type_id, *loc):
                _place(a, *loc)
                events.append(E.VectorArrived({"army": a.id, "city": d, "x": a.x, "y": a.y}))
            elif s8(a.home_city) == d:
                remove_army(state, a)
                events.append(E.VectorRerouted({"army": a.id, "home": a.home_city, "deleted": True}))
            else:
                _home(state, a, events, x_reset=False)
        elif (a.x, a.y) == (xs, ty) and a.transit == on_way:
            loc = standard_square(state, p)
            if (loc is not None and len(armies_at(state, *loc)) < K.SQUARE_FULL.value
                    and can_place(state, a.type_id, *loc)):
                _place(a, *loc)
                events.append(E.VectorArrived({"army": a.id, "city": None, "x": a.x, "y": a.y}))
            else:
                _home(state, a, events, x_reset=True)
    return events
