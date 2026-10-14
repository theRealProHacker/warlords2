"""Stack move mode, step costs, moving a stack along its path, per-turn movement points and
sinking.  Path search and reach are in rules/pathfinding.py, the hidden-map view in
rules/visibility.py.

Addresses (resident code unless ovlNN; "decomp" = out/rea/decomp/, "asm" = capstone listing):
selection 0c8c:0529 (mode, mask, goto copied to the group, path), move 0a8b:07f9 with the
step executor 0a8b:04c8, refresh ovl68:05fb, sinking 0b62:0ea0, army removal 0b62:03be.

Selection, stack palette, Next, Defend, Move All and Disband are in rules/selection.py.

Events (info keys):
  Moved     armies, from, to, path (squares entered), cost, status (0 none, 2 out of moves,
            3 stack ahead, 4 map edge, 5 foreign city ahead), ahead (square that stopped it),
            no_path (only when there is no path: the human-side sound of ovl58:0b5f)
  Embarked  armies (now aboard)          Landed  armies (no longer aboard)
  ItemTaken item, army, auto (computer heroes pick up items they walk over, ovl28:0427)
  Sunk      armies, count
"""
from __future__ import annotations

from ..model import events as E
from ..model.army import Army
from ..model.ids import (HERO_TYPE, ItemState, ItemType, MAP_ARMY, MAP_FORTIFIED, MAP_OWNER_MASK,
                         MAP_PORT, MAP_W, N_PLAYERS, Control, Terrain)
from ..model.state import SCN_ARMY_HIGH
from . import pathfinding as P
from . import visibility as V
from .constants import movement as K
from .engine import IllegalCommand

W = MAP_W
FREE = 0xFF                      # owner byte of a free army record (0b62:03be, 0b62:0309)
TYPE_FLAG_WORDS = ("flag16", "flag17", "flag18", "flag19", "special", "cancel_mode")


def _s8(v: int) -> int:
    """Signed byte (army +7 is a char)."""
    return ((v + 0x80) & 0xFF) - 0x80


def _army(state, aid: int):
    """The live record `aid` (table index == id; owner 0xff = free, 0b62:03be)."""
    if isinstance(aid, int) and 0 <= aid < len(state.armies) and state.armies[aid].owner != FREE:
        return state.armies[aid]
    raise IllegalCommand("no army %r" % (aid,))


def type_flag(state, type_id: int, word: str) -> int:
    """The byte the per-type table DS:45c4 holds for ARMYTYPE word `word` of `type_id`.
    Evidence: asm ovl48:0000..0069: for types 0..0x1c (record by ovl44:14ac) DS:45c4 + 6t + 0..3
    = low bytes of w16..w19, +4 = low byte of w13, +5 = low byte of w15."""
    if word not in TYPE_FLAG_WORDS:
        raise KeyError(word)
    return getattr(state.army_type(type_id), word) & 0xFF


def _flies(state, a) -> bool:
    """Per-type flag DS:45c4 + type*6 + 0 = low byte of ARMYTYPE w16 (EL §7, ovl48:0000)."""
    return bool(type_flag(state, a.type_id, "flag16"))


def alloc_army(state):
    """0b62:0309: the first record with owner byte 0xff (indices 0..999), else None.  It gets
    owner = SCN 0x110, +0xc = 1, vector bits (+0xf bits 1-7) = 0, +0x10 = 0xff, +0x11 = 0,
    goto -1/-1, and SCN 0x181 = index + 1 when 0x181 <= index; every other byte keeps what the
    record held (a freed record: type 0xff, x = y = -1, 0 moves).  A record never used before
    is appended with zeros (the BSS image after ovl53:0000 wrote owner 0xff, x = y = -1).
    Evidence: asm 0b62:0309..03bd (byte +0xe low nibble cleared, not modelled)."""
    st = state.armies
    i = next((k for k, a in enumerate(st) if a.owner == FREE), len(st))
    if i >= K.ARMY_TABLE.value:
        return None
    if i == len(st):
        st.append(Army(id=i, type_id=0, owner=FREE, x=-1, y=-1, allowance=0, moves_left=0,
                       strength=0, home_city=0, hero_slot=0, medals=0, upkeep=0, flags=0,
                       vector_dest=0, transit=0, group=0, goto=(-1, -1)))
    a = st[i]
    if state.flags.get(SCN_ARMY_HIGH, 0) <= i:
        state.flags[SCN_ARMY_HIGH] = i + 1
    a.owner = state.current
    a.flags = K.ALLOC_FLAGS.value
    a.vector_dest = 0
    a.transit = K.ALLOC_TRANSIT.value
    a.group = 0
    a.goto = (-1, -1)
    return a


def carried_count(state, a, item_type: int) -> int:
    """Number of items of `item_type` the army carries.
    Evidence: ovl35:08b4 (type 5) / ovl35:0874 (type 6) count the list of ovl51:03d9 mode 2
    (items with state 3 and holder = the army's index)."""
    return sum(1 for it in state.items
               if it.state == ItemState.CARRIED and it.holder == a.id and it.type == item_type)


def armies_at(state, x: int, y: int) -> list:
    """Up to 8 armies on (x, y), any owner, from the highest table index down.
    Evidence: decomp 01b69d (0b62:007d): count only grows while < 8."""
    out = []
    for a in reversed(state.armies):
        if a.x == x and a.y == y and len(out) < K.STACK_MAX.value:
            out.append(a)
    return out


def stack_mode(state, group) -> tuple[int, int]:
    """(mode, mask) of the stack: any member aboard -> (1, 8); else a ship (w19) -> (0, 0);
    else flying (2, 0) when all fly, a hero carries a flight item, or all non-heroes fly and
    one flyer is not aboard; else land (1, mask) with bit 0 for any w18 and bit 1 for any w17.
    Evidence: EL §4.2; decomp 01cde9 (0c8c:0529), flags DS:45c4 + type*6 (w16..w19)."""
    members = [_army(state, i) if isinstance(i, int) else i for i in group]
    all_fly, nonheroes_fly, flyer, flight_item = True, True, False, False
    aboard = ship = hills = woods = False
    for a in members:
        f16, f17, f18, f19 = (type_flag(state, a.type_id, w) for w in TYPE_FLAG_WORDS[:4])
        on_boat = bool(a.flags & K.ABOARD.value)
        if a.type_id == HERO_TYPE and carried_count(state, a, ItemType.FLIGHT):
            flight_item = True
        if not f16 or on_boat:
            all_fly = False
        aboard |= on_boat
        if a.type_id != HERO_TYPE and not f16:
            nonheroes_fly = False
        if f16 and not on_boat:
            flyer = True
        ship |= bool(f19)
        hills |= bool(f18)
        woods |= bool(f17)
    if aboard:
        return K.MODE_LAND.value, K.MASK_ABOARD.value
    if ship:
        return K.MODE_SHIP.value, 0
    if flight_item or all_fly or (nonheroes_fly and flyer):
        return K.MODE_FLY.value, 0
    mask = (K.MASK_HILLS.value if hills else 0) | (K.MASK_WOODS.value if woods else 0)
    return K.MODE_LAND.value, mask


def step_cost(state, group, frm: tuple, to: tuple) -> int:
    """Movement points the stack pays to enter `to` from the neighbouring square `frm`
    (a step that ends a land move on water still costs its own value, see path_costs).
    Evidence: EL §4.3; decomp 016f34 (0555:19e4) on the cached cost map (0555:0d9e)."""
    if max(abs(frm[0] - to[0]), abs(frm[1] - to[1])) != 1:
        raise ValueError("not a step: %r -> %r" % (frm, to))
    mode, mask = stack_mode(state, group)
    return P.entry_cost(P.cached_cost_map(state), to[0], to[1], mode, mask, False)[0]


def _relation_bits(state, a: int, b: int) -> int:
    """2c04:153b[a*8 + b] & 3 read as a flat byte array (asm 0a8b:093d..094e): owners 8..15
    run into the next row; past the 64 bytes lie the city count word 2c04:157b and city 0."""
    k = a * N_PLAYERS + b
    n = N_PLAYERS * N_PLAYERS
    if k < n:
        return state.relations[k // N_PLAYERS][k % N_PLAYERS] & 3
    if k in (n, n + 1):                          # 2c04:157b, little-endian word
        return (len(state.cities) >> (8 * (k - n))) & 3
    off = k - n - 2                              # 2c04:157d: city 0 record (+0 x, +2 y, +4 name)
    c = state.cities[0]
    if off < 4:
        return ((c.x if off < 2 else c.y) >> (8 * (off % 2))) & 3
    name = c.name.encode("cp437", "replace")
    return (name[off - 4] if off - 4 < len(name) else 0) & 3


def _clear_left(state, x: int, y: int) -> None:
    """0b62:01a7: no army left on the square -> clear map bits 0x10 and 0x20."""
    if any(a.x == x and a.y == y for a in state.armies):
        return
    state.world.flags[y * W + x] &= ~(MAP_ARMY | MAP_FORTIFIED) & 0xFF


def _pick_up(state, hero, x: int, y: int) -> list:
    """ovl28:0427: items lying on the square (on a City square: in the 2x2 from it) go to the
    stack's hero; run only for computer sides (ovl25:09ab)."""
    out = []
    city = state.world.terrain(x, y) == Terrain.CITY
    for i in range(len(state.items) - 1, -1, -1):
        it = state.items[i]
        if it.state != ItemState.ON_MAP:
            continue
        here = (x <= it.x <= x + 1 and y <= it.y <= y + 1) if city else (it.x, it.y) == (x, y)
        if here:
            it.state, it.holder = ItemState.CARRIED, hero.id
            out.append(E.ItemTaken({"item": i, "army": hero.id, "auto": True}))
    return out


def _select(state, group) -> list:
    if not group or len(group) > K.STACK_MAX.value or len(set(group)) != len(group):
        raise IllegalCommand("a group is 1 to 8 distinct armies")
    members = [_army(state, i) for i in group]
    pos = (members[0].x, members[0].y)
    for a in members:
        if a.owner != state.current or a.x < 0 or a.y < 0 or (a.x, a.y) != pos:
            raise IllegalCommand("army %d cannot move with this group" % a.id)
    return members


def _hero_of(members):
    """0c8c:0529 DS:1efe: the leader if it is a hero, else the first hero of the group."""
    for a in members:
        if a.type_id == HERO_TYPE:
            return a
    return None


def _execute(state, members, codes: list[int], n: int, mode: int, mask: int) -> tuple[list, int]:
    """0a8b:04c8: move the stack n steps; embark / land at the end; mark the square.  Returns
    (events, DS:5dc4): 1 after boarding (0a8b:078b), 2 after landing (0a8b:06e2), else 0 (reset
    at 0a8b:084a for every move)."""
    events: list = []
    boat = 0
    lead = members[0]
    group = len(members) > 1
    hero = lead if lead.type_id == HERO_TYPE else _hero_of(members)
    computer = state.players[state.current].control == Control.COMPUTER
    x, y = lead.x, lead.y
    for d in codes[:n]:
        ox, oy = x, y
        nxt = P.step(x, y, d)
        if nxt is None:
            break
        x, y = nxt
        for a in (members if group else [lead]):
            a.x, a.y = x, y
        if computer and hero is not None:
            events += _pick_up(state, hero, x, y)
        _clear_left(state, ox, oy)
        V.reveal(state, x, y, mode == K.MODE_FLY.value)
    if mode == K.MODE_LAND.value:
        t = state.world.terrain(x, y)
        if not mask & K.MASK_ABOARD.value:
            if t in K.EMBARK_TERRAIN.value:
                carrier = any(_flies(state, a) for a in members)
                if any(not _flies(state, a) and a.type_id != HERO_TYPE for a in members):
                    carrier = False
                put = [a for a in members if not _flies(state, a)
                       and (a.type_id != HERO_TYPE or not carrier)]
                for a in put:
                    a.flags |= K.ABOARD.value
                if put:
                    boat = K.BOAT_EMBARKED.value
                    events.append(E.Embarked({"armies": tuple(a.id for a in put)}))
        elif t not in K.LAND_KEEP_TERRAIN.value:
            for a in members:
                a.flags &= ~K.ABOARD.value
            boat = K.BOAT_LANDED.value
            events.append(E.Landed({"armies": tuple(a.id for a in members)}))
    i = y * W + x
    state.world.flags[i] = (state.world.flags[i] | MAP_ARMY) & ~MAP_OWNER_MASK & 0xFF
    state.world.flags[i] |= state.current & MAP_OWNER_MASK
    return events, boat


def _boat_stop(members, boat: int) -> None:
    """0a8b:0d1a: after boarding the armies now aboard, after landing the armies not aboard,
    lose their remaining moves (the loop runs over DS:5e5e and DS:5e3e[7..0], the hero and the
    moving group, here `members`)."""
    for a in members:
        aboard = bool(a.flags & K.ABOARD.value)
        if (boat == K.BOAT_EMBARKED.value and aboard) or (boat == K.BOAT_LANDED.value and not aboard):
            a.moves_left = 0


def move(state, cmd) -> list:
    """Move: set the group's goto to `cmd.dest`, find the path and walk as far as this turn
    allows.  The walk stops before a foreign city (status 5) or a stack of a side not at
    peace (relation bits != 0, status 3); squares with more than 8 armies after joining, or
    with a stack of a side at peace, can be crossed but not stopped on.  Every member pays
    the cumulative cost of the last square stopped on (floored at 0); a single army is
    budgeted by its own points, a group by its lowest.
    No path (0555:000a returns 0): nothing moves (the goto stays set) and a Moved event with
    info["no_path"] is returned; the original's only feedback is a sound for a human side (asm
    0a8b:0c93..0cac: SCN 0x0D0[0x110] == 0 -> ovl58:0b5f, which plays sample DS:5978 when sound
    is on, DS:0bec), so the presentation plays it for human sides.
    The group becomes the selection (`rules.selection.adopt`: the original only moves the stack
    DS:5e62 / 5e3e).  A human side's moves all enter through 0c8c:01fd (Move button / key
    07be:0324 / 04ff, map click ovl61:0bd3, map menu ovl46:015a, Move All 0c8c:0452 / 050d),
    which calls 0a8b:0c4f(x, y, 0).  A move that ends by boarding or landing (DS:5dc4, set in
    0a8b:04c8) ends the turn's movement of those armies: 0a8b:0cf2..0cfe calls 0a8b:0d1a (moves 0
    for the boarded / landed members) and returns status 2, for either side.  So for a human
    side the move ends with that path's tail:
    when there was a path the stack palette is rebuilt (0a8b:0d01..0d0f, ovl66:0000), the
    leader's goto is cleared when it stands on it (0c8c:027c..029a), and on status 2 the stack
    is marked done (ovl67:08fb) and deselected (0b62:08b3; 0c8c:02a9..02bc).  A computer side
    moves through 0a8b:0001 -> 0a8b:0c4f(x, y, 1) (AI, M8b1), which has its own tail; that is
    not modelled here.
    Evidence: decomp 01cde9 (0c8c:0529), 01b0a9 + asm 0a8b:07f9..0a79, decomp 01ad78
    (0a8b:04c8), 0555:000a / 18be, 0a8b:0c4f; R11 answered by 0a8b:0911..09c8."""
    members = _select(state, cmd.group)
    from .selection import adopt                         # circular at module level
    adopt(state, [a.id for a in members])                # the original moves DS:5e62 / 5e3e
    dest = tuple(cmd.dest)
    for a in members:
        a.goto = dest
    lead = members[0]
    mode, mask = stack_mode(state, members)
    group = len(members) > 1
    budget = min(_s8(a.moves_left) for a in members) if group else _s8(lead.moves_left)
    src = (lead.x, lead.y)
    codes = P.find_path(state, src, dest, mode, mask) if dest[0] >= 0 and dest[1] >= 0 else None
    if codes is None:                                    # asm 0a8b:0c8f..0cb7
        _tail_01fd(state, lead, None)
        return [E.Moved({"armies": tuple(a.id for a in members), "from": src, "to": src,
                         "path": [], "cost": 0, "status": K.STOP_NONE.value, "ahead": None,
                         "no_path": True})]
    cums = P.path_costs(state, src, codes, mode, mask)
    reach = P.reach_this_turn(state, src, codes, mode, mask, budget)
    status, ahead = K.STOP_NONE.value, None
    done = pending = 0
    x, y = src
    for i in range(reach):
        nxt = P.step(x, y, codes[i])
        if nxt is None:
            status = K.STOP_EDGE.value
            break
        x, y = nxt
        f = state.world.flags[y * W + x]
        owner = f & MAP_OWNER_MASK
        if state.world.terrain(x, y) == Terrain.CITY and owner != state.current:
            status, ahead = K.STOP_CITY.value, (x, y)
            break
        if f & MAP_ARMY and owner != state.current and _relation_bits(state, state.current, owner):
            status, ahead = K.STOP_STACK.value, (x, y)
            break
        there = len(armies_at(state, x, y))
        if len(members) + there <= K.STACK_MAX.value and (not f & MAP_ARMY or owner == state.current):
            done += pending + 1
            pending = 0
        else:
            pending += 1
    events: list = []
    cost = 0
    boat = 0
    if done:
        cost = cums[done - 1]
        events, boat = _execute(state, members, codes, done, mode, mask)
        for a in (members if group else [lead]):
            a.moves_left = 0 if _s8(a.moves_left) < cost else _s8(a.moves_left - cost)
        budget = max(budget - cost, 0) if group else _s8(lead.moves_left)
    nxt_cum = cums[done] if done and done < len(cums) else 0xFF
    if budget < K.MIN_MOVES.value or (done and status not in (K.STOP_CITY.value, K.STOP_STACK.value)
                                      and nxt_cum != 0xFF and budget < nxt_cum):
        status = K.STOP_MOVES.value
    if boat:                                             # asm 0a8b:0cf2..0cfe
        _boat_stop(members, boat)
        status = K.STOP_MOVES.value
    path = P.cells(src, codes[:done])
    events.insert(0, E.Moved({"armies": tuple(a.id for a in members), "from": src,
                              "to": path[-1] if path else src, "path": path, "cost": cost,
                              "status": status, "ahead": ahead}))
    _tail_01fd(state, lead, status)
    return events


def _tail_01fd(state, lead, status) -> None:
    """The end of a human side's move (see `move`): status None = no path (0a8b:0c4f returns 1
    before the palette rebuild)."""
    if state.players[state.current].control != Control.HUMAN:
        return
    from . import selection as S                         # circular at module level
    if status is not None:
        S.build_palette(state)                           # asm 0a8b:0d0a (ovl66:0000)
    if lead.goto == (lead.x, lead.y):                    # asm 0c8c:027c..029a
        lead.goto = (-1, -1)
    if status == K.STOP_MOVES.value:                     # asm 0c8c:02a9..02bc
        S.mark_done(state)
        state.selection.selected = -1


def set_path(state, cmd) -> list:
    """SetPath: the group's goto becomes the last square of `cmd.path` (the original keeps
    only the goto, +0x12/+0x14, and searches again when moving).
    Evidence: decomp 01cde9 (0c8c:0529 copies the leader's goto to every member)."""
    members = _select(state, cmd.group)
    if not cmd.path:
        raise IllegalCommand("empty path")
    dest = tuple(cmd.path[-1])
    for a in members:
        a.goto = dest
    return []


def cancel_path(state, cmd) -> list:
    """CancelPath: goto = (-1, -1) for the group.
    Evidence: EL §7 (+0x12/+0x14 = -1: none); ovl68:05fb writes the same value."""
    for a in _select(state, cmd.group):
        a.goto = (-1, -1)
    return []


def refresh_moves(state, p: int) -> None:
    """Start-of-turn movement points of side p: carry min(left, 2); allowance (20 aboard) +
    carry; goto cleared when reached; every army on the square of a hero with a double-move
    item gets its allowance again (once per such hero); capped at 99.
    Evidence: EL §4.4; decomp 08ce0b (ovl68:05fb), ovl35:0874, 0b62:007d."""
    for a in reversed(state.armies):
        if a.owner != p or a.x < 0:
            continue
        ml = _s8(a.moves_left)
        carry = ml if ml < K.CARRY_MAX.value + 1 else K.CARRY_MAX.value
        base = K.ABOARD_ALLOWANCE.value if a.flags & K.ABOARD.value else a.allowance
        a.moves_left = _s8(base + carry)
        if a.goto == (a.x, a.y):
            a.goto = (-1, -1)
    for h in reversed(state.armies):
        if h.owner == p and h.type_id == HERO_TYPE and carried_count(state, h, ItemType.DOUBLE_MOVE):
            for a in armies_at(state, h.x, h.y):
                a.moves_left = _s8(a.moves_left + a.allowance)
    for a in reversed(state.armies):
        if a.owner == p and _s8(a.moves_left) > K.MOVES_CAP.value:
            a.moves_left = K.MOVES_CAP.value


def remove_army(state, a) -> None:
    """Free an army record in place (it stays in the table, index == id): type and owner 0xff,
    x = y = -1, no vector, transit 0xff, 0 moves; +0x11 (group) and the other bytes are kept.
    Evidence: asm 0b62:03be..0404 (byte +0xe, not modelled, keeps only bit 7; +0x11 not written)."""
    a.type_id, a.owner, a.x, a.y = 0xFF, 0xFF, -1, -1
    a.vector_dest, a.transit, a.moves_left = 0, 0xFF, 0


def stack_flies_07fa(state, armies) -> bool:
    """Whether the armies move as a flying stack.
    Evidence: 0c8c:07fa, the flying test of 0c8c:0529 on a list."""
    all_fly, nonheroes_fly, flyer, item = True, True, False, False
    for a in armies:
        f = _flies(state, a)
        on_boat = bool(a.flags & K.ABOARD.value)
        if a.type_id == HERO_TYPE and carried_count(state, a, ItemType.FLIGHT):
            item = True
        if not f or on_boat:
            all_fly = False
        if a.type_id != HERO_TYPE and not f:
            nonheroes_fly = False
        if f and not on_boat:
            flyer = True
    return item or all_fly or (nonheroes_fly and flyer)


_stack_flies = stack_flies_07fa                  # old name (ui/palettes.py imports it)


def _sink_list(state, armies) -> list:
    if stack_flies_07fa(state, armies):
        return []
    gone = [a for a in armies if not a.flags & K.ABOARD.value and a.type_id != HERO_TYPE
            and not _flies(state, a)]
    for a in gone:
        remove_army(state, a)
    return gone


def sink(state, x: int = -1, y: int = -1) -> list:
    """Sink the side's armies left on water without a boat: on (x, y) if it is Water or has
    the port bit, or on every such square when x or y < 0.  Where the side's armies there
    cannot fly as a stack, every one not aboard, not a hero and not flying is removed.
    Evidence: decomp 01c4c0 + asm 0b62:0ea0..11ef (callers ovl68:0491 at turn start with -1,
    ovl67:0728 for human stacks); the all-squares scan runs over table
    indices 0x181-1 .. 1 in both loops, so army id 0 is never looked at (asm 0b62:11e7, 1169:
    dec / jne); message STRING 168 (R18)."""
    st = state.armies
    w = state.world

    def wet(i, j):
        return w.terrain(i, j) == K.SINK_TERRAIN.value or bool(w.flags[j * W + i] & MAP_PORT)

    gone: list = []
    if x >= 0 and y >= 0:
        if not wet(x, y):
            return []
        gone = _sink_list(state, [a for a in reversed(st)
                                  if a.x == x and a.y == y and a.owner == state.current])
    else:
        scan = [b for b in reversed(st) if b.id != 0]
        for a in scan:
            if a.x < 0 or a.y < 0 or a.owner != state.current or not wet(a.x, a.y):
                continue
            here = [b for b in scan if (b.x, b.y) == (a.x, a.y) and b.owner == state.current]
            gone += _sink_list(state, here)
    if not gone:
        return []
    return [E.Sunk({"armies": tuple(a.id for a in gone), "count": len(gone)})]
