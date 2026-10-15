"""Stack move mode, step costs, moving a stack along its path, per-turn movement points and
sinking.  Path search and reach are in rules/pathfinding.py, the hidden-map view in
rules/visibility.py.

Addresses (resident code unless ovlNN; "decomp" = out/rea/decomp/, "asm" = capstone listing):
selection 0c8c:0529 (mode, mask, goto copied to the group, path), move 0a8b:07f9 with the
step executor 0a8b:04c8, refresh ovl68:05fb, sinking 0b62:0ea0, army removal 0b62:03be.

Selection, stack palette, Next, Defend, Move All and Disband are in rules/selection.py.  The
computer's move executor (0a8b:0001 / 0c4f / 0254 / 0476) is at the end ("computer moves").

Events (info keys):
  Moved     armies, from, to, path (squares entered), cost, status (0 none, 2 out of moves,
            3 stack ahead, 4 map edge, 5 foreign city ahead; 1 no path from `walk_selection`),
            ahead (square that stopped it), no_path (only when there is no path: the human-side
            sound of ovl58:0b5f)
  Embarked  armies (now aboard)          Landed  armies (no longer aboard)
  ItemTaken item, army, auto (computer heroes pick up items they walk over, ovl28:0427)
  Sunk      armies, count
"""
from __future__ import annotations

import importlib
import logging
from typing import NamedTuple

from ..model import commands as C
from ..model import events as E
from ..model.army import Army
from ..model.ids import (HERO_TYPE, ItemState, ItemType, MAP_ARMY, MAP_FORTIFIED, MAP_H,
                         MAP_OWNER_MASK, MAP_PORT, MAP_W, N_PLAYERS, Control, Terrain)
from ..model.state import SCN_ARMY_HIGH
from . import pathfinding as P
from . import visibility as V
from .constants import movement as K
from .constants import turn as KT
from .constants import unverified_allowed
from .engine import IllegalCommand, NotImplementedCommand
from .present import present

log = logging.getLogger(__name__)

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
    goto -1/-1, +0xe bits 0-3 = 0, and SCN 0x181 = index + 1 when 0x181 <= index; every other
    byte keeps what the record held (a freed record: type 0xff, x = y = -1, 0 moves).  A record
    never used before is appended with zeros (the BSS image after ovl53:0000 wrote owner 0xff,
    x = y = -1).
    Evidence: asm 0b62:0309..03bd (+0xe &= 0xf0, | 0 at 0396..039b)."""
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
    a.order &= K.ALLOC_ORDER_KEEP.value
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
    """ovl28:0427 for the hero record `hero` (DS:5e5e): items lying on the square (on a City
    square: in the 2x2 from it) go to it; 0a8b:04c8 runs it per step only for computer sides
    (ovl25:09ab)."""
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


def pick_up(state, x: int, y: int) -> list:
    """ovl28:0427(x, y): with a stack hero (DS:5e5e) every item lying on (x, y) - on a City
    square every one in the 2x2 block (x..x+1, y..y+1) - gets state 3 (carried) with the hero
    as holder.  Nothing without DS:5e5e.  Returns ItemTaken events (auto).
    Evidence: asm ovl28:0427..056c: [bp-4] = terrain(x, y) == 10 (0435..0463); DS:5e5e null ->
    return (0466..046e); items cx = 21..0 (0471, 055f..0566) with state byte 2c04:0cff == 1:
    not a city -> x == +3 and y == +5 (0492..04b7), a city -> x <= +3 <= x + 1 and
    y <= +5 <= y + 1 (signed, 04c0..0505); state = 3 (0511); holder +1 = the index of the
    record DS:5e5e among 0..SCN 0x181-1 (051c..055a; a live record allocated by 0b62:0309
    always lies there, so it is the hero's id).  Callers: 0a8b:0001 (0064, before every
    0a8b:0c4f with the leader's square) and 0a8b:04c8 (0598, after every step of a computer
    side)."""
    h = state.selection.hero
    if not 0 <= h < len(state.armies):
        return []
    return _pick_up(state, state.armies[h], x, y)


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


def centre_on_selection(state) -> None:
    """ovl64:0565: the view centred on DS:5e62's square, or on the view words themselves when
    DS:5e62 is null, through ovl64:0629 (the centre clamped to 4..0x6b / 4..0x97, the view
    rectangle from it; then its map draw ovl64:006c, display only).
    Evidence: asm ovl64:0565..05b3 (056b / 0588 DS:5e62 null -> SCN 0x17d / 0x17f, 05ac call
    0629); ovl64:0629..0722 (rules.turn.centre_view)."""
    from .turn import centre_view                        # circular at module level
    lead = _record(state, state.selection.selected)
    if lead is not None:
        x, y = lead.x, lead.y
    else:
        cx, cy = KT.SCN_VIEW.value[4:]
        x, y = state.flags.get(cx, 0), state.flags.get(cy, 0)
    centre_view(state, x, y)


def _execute(state, members, codes: list[int], n: int, mode: int, mask: int,
             hero, group: bool) -> tuple[list, int]:
    """0a8b:04c8: move the stack n steps (every `members` record with DS:2bda `group`, else the
    leader); embark / land at the end; mark the square.  `hero` is
    the record DS:5e5e (or None) that a computer side's per-step pick-up uses.  Returns
    (events, DS:5dc4): 1 after boarding (0a8b:078b), 2 after landing (0a8b:06e2), else 0 (reset
    at 0a8b:084a for every move).  For a computer side each step ends with ovl64:0565 (05f2):
    the view words follow DS:5e62 (`centre_on_selection`) and the map is drawn (present point
    "step", whose presentation also holds the step wait 05f7..0654); a reveal redraws the
    overview around the square (ovl63:1fed at 05ea, point "overview_square").  A human side's
    walk gets the same words from its presentation's SetView commands (ui.anim.move), so the
    engine leaves them alone there.
    Evidence: asm 0a8b:04c8..07f8; 05d1 ovl64:1298, 05db / 05ea ovl63:1fed, 05f2 ovl64:0565."""
    events: list = []
    boat = 0
    lead = members[0]
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
        if V.reveal(state, x, y, mode == K.MODE_FLY.value) and computer:
            present("overview_square", x=x, y=y)          # ovl63:1fed(x, y, 1) at 05ea
        if computer:
            centre_on_selection(state)                    # ovl64:0565 at 05f2 (view words, 006c)
            present("step", x=x, y=y)                     # 006c inside 0629; the wait 05f7..0654
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
    lose their remaining moves.  The loop runs over DS:5e3e[7..0] only (asm 0d1d..0d71: dx =
    0x5e5e, `sub dx, 4` before each of the 8 rounds, so DS:5e5e itself and DS:5e62 are never
    read): `members` is the moving group DS:5e3e."""
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
    budgeted by its own points, a group (stored DS:2bda) by the stored DS:5e00; mode and mask
    are the stored DS:5dfc / 5dfa (`store_selection_words`, written when the selection changes).
    No path (0555:000a returns 0): nothing moves (the goto stays set) and a Moved event with
    info["no_path"] is returned; the original's only feedback is a sound for a human side (asm
    0a8b:0c93..0cac: SCN 0x0D0[0x110] == 0 -> ovl58:0b5f, which plays sample DS:5978 when sound
    is on, DS:0bec), so the presentation plays it for human sides.
    The group becomes the selection (`adopt_selection`: the original only moves the stack
    DS:5e62 / 5e3e).  A human side's moves all enter through 0c8c:01fd (Move button / key
    07be:0324 / 04ff, map click ovl61:0bd3, map menu ovl46:015a, Move All 0c8c:0452 / 050d),
    which calls 0a8b:0c4f(x, y, 0).  A move that ends by boarding or landing (DS:5dc4, set in
    0a8b:04c8) ends the turn's movement of those armies: 0a8b:0cf2..0cfe calls 0a8b:0d1a (moves 0
    for the boarded / landed members) and returns status 2, for either side.  So for a human
    side the move ends with that path's tail:
    when there was a path the stack palette is rebuilt (0a8b:0d01..0d0f, ovl66:0000), the
    leader's goto is cleared when it stands on it (0c8c:027c..029a), and on status 2 the stack
    is marked done (ovl67:08fb) and deselected (0b62:08b3; 0c8c:02a9..02bc); last come the
    tail's tutorial pages (TurnCue events of `rules.selection.tutorial_after_move`, 0c8c:02c4..
    0415; status 1 for no path).  A computer side moves through 0a8b:0001 -> 0a8b:0c4f(x, y, 1)
    (`execute_move`, `walk_selection`), which has its own tail.
    Evidence: decomp 01cde9 (0c8c:0529), 01b0a9 + asm 0a8b:07f9..0a79, decomp 01ad78
    (0a8b:04c8), 0555:000a / 18be, 0a8b:0c4f; R11 answered by 0a8b:0911..09c8."""
    members = _select(state, cmd.group)
    adopt_selection(state, [a.id for a in members])      # the original moves DS:5e62 / 5e3e
    dest = tuple(cmd.dest)
    for a in members:
        a.goto = dest
    lead = members[0]
    sel = state.selection
    group = bool(sel.group)                              # the stored words, asm 0a8b:0820..0847
    walkers = members if group else [lead]
    budget = sel.moves if group else _s8(lead.moves_left)
    src = (lead.x, lead.y)
    codes = (P.find_path(state, src, dest, sel.mode, sel.mask)        # 0555:1868 DS:5dfc / 5dfa
             if dest[0] >= 0 and dest[1] >= 0 else None)
    if codes is None:                                    # asm 0a8b:0c8f..0cb7
        events = [E.Moved({"armies": tuple(a.id for a in walkers), "from": src, "to": src,
                           "path": [], "cost": 0, "status": K.STOP_NONE.value, "ahead": None,
                           "no_path": True})]
        return events + _tail_01fd(state, lead, None)
    hero = lead if lead.type_id == HERO_TYPE else _hero_of(members)
    status, _, events = _walk(state, lead, walkers, members, src, codes, sel.mode, sel.mask,
                              group, sel.count if group else 1, budget, hero)
    return events + _tail_01fd(state, lead, status)


def adopt_selection(state, ids) -> bool:
    """`rules.selection.adopt` for a command's group, plus the selection step's words when the
    selection changed: the player selects a stack through ovl67:06eb or the palette apply
    ovl66:000a, both of which call 0c8c:0529 (`store_selection_words`), and the command stands
    for that selection.  An unchanged selection keeps the stored words, stale or not.  Returns
    whether the selection changed.
    Evidence: asm ovl67:0888 and ovl66:02e3 (the human 0529 call sites); the human move
    0c8c:01fd and attack ovl36:0000 call no 0529 themselves (asm 0c8c:01fd..041b,
    ovl36:0000..04f6)."""
    from .selection import adopt                         # circular at module level
    sel = state.selection
    before = (sel.selected, list(sel.moving))
    adopt(state, ids)
    changed = (sel.selected, list(sel.moving)) != before
    if changed:
        store_selection_words(state)
    return changed


def _walk(state, lead, members, boat_members, src, codes, mode, mask, group: bool, n: int,
          budget: int, hero):
    """0a8b:07f9 on a found path, its 0a8b:04c8 and 0a8b:0c4f's 0d1a step: `members` is the
    stack that moves (DS:5e3e with DS:2bda, else DS:5e62 alone), `group` DS:2bda, `n` the
    stack size of the stop test (DS:5dfe with DS:2bda, else 1), `budget` DS:5e00 or the
    leader's points, `boat_members` the DS:5e3e list 0d1a runs over, `hero` DS:5e5e.  With
    DS:2bda the walk's cost also lowers the stored DS:5e00 (floored at 0).  Returns (status,
    square that stopped it (DS:5dc8 / 5dc6) or None, events: Moved first)."""
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
        if n + there <= K.STACK_MAX.value and (not f & MAP_ARMY or owner == state.current):
            done += pending + 1
            pending = 0
        else:
            pending += 1
    events: list = []
    cost = 0
    boat = 0
    if done:
        cost = cums[done - 1]
        events, boat = _execute(state, members, codes, done, mode, mask, hero, group)
        for a in (members if group else [lead]):
            a.moves_left = 0 if _s8(a.moves_left) < cost else _s8(a.moves_left - cost)
        if group:                                        # asm 0a8b:09ff..0a11
            budget = max(budget - cost, 0)
            state.selection.moves = budget
        else:
            budget = _s8(lead.moves_left)
    nxt_cum = cums[done] if done and done < len(cums) else 0xFF
    if budget < K.MIN_MOVES.value or (done and status not in (K.STOP_CITY.value, K.STOP_STACK.value)
                                      and nxt_cum != 0xFF and budget < nxt_cum):
        status = K.STOP_MOVES.value
    if boat:                                             # asm 0a8b:0cf2..0cfe
        _boat_stop(boat_members, boat)
        status = K.STOP_MOVES.value
    path = P.cells(src, codes[:done])
    events.insert(0, E.Moved({"armies": tuple(a.id for a in members), "from": src,
                              "to": path[-1] if path else src, "path": path, "cost": cost,
                              "status": status, "ahead": ahead}))
    return status, ahead, events


def _tail_01fd(state, lead, status) -> list:
    """The end of a human side's move (see `move`): status None = no path (0a8b:0c4f returns 1
    before the palette rebuild).  Returns the tutorial pages of the tail
    (`rules.selection.tutorial_after_move`: asm 0c8c:02c4..02f0 after the done mark and the
    deselect on status 2, 0c8c:02fe..0415 after the redraw ovl61:0174 otherwise)."""
    if state.players[state.current].control != Control.HUMAN:
        return []
    from . import selection as S                         # circular at module level
    if status is not None:
        S.build_palette(state)                           # asm 0a8b:0d0a (ovl66:0000)
        S.redraw_palette(state)                          # asm 0a8b:0d0f (ovl66:0356)
    if lead.goto == (lead.x, lead.y):                    # asm 0c8c:027c..029a
        lead.goto = (-1, -1)
    if status == K.STOP_MOVES.value:                     # asm 0c8c:02a9..02bc
        S.mark_done(state)
        state.selection.selected = -1
    return S.tutorial_after_move(state, K.STATUS_NO_PATH.value if status is None else status)


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
    x = y = -1, no vector, +0xe only bit 7 kept, transit 0xff, 0 moves; +0x11 (group) and the
    other bytes are kept.
    Evidence: asm 0b62:03be..0404 (+0xe &= 0x8f at 03d9, then &= 0xf0 | 0 at 03f0..03f5; +0x11
    not written)."""
    a.type_id, a.owner, a.x, a.y = 0xFF, 0xFF, -1, -1
    a.order &= K.FREE_ORDER_KEEP.value
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
    cannot fly as a stack, every one not aboard, not a hero and not flying is removed.  When
    anything sank the selection is cleared: DS:5e5e, DS:5e62 and DS:5e3e[0..7] null, DS:2bda
    and DS:5dfe 0 (DS:5e00, 5dfc / 5dfa and the palette stay); then the map words are rebuilt
    (ovl62:0000) and, for the one-square form, the view is centred on (x, y) (ovl64:0629, SCN
    0x175..0x17f) after the message.
    Evidence: decomp 01c4c0 + asm 0b62:0ea0..11ef (callers ovl68:0491 at turn start with -1,
    ovl67:0728 for human stacks); the all-squares scan runs over table
    indices 0x181-1 .. 1 in both loops, so army id 0 is never looked at (asm 0b62:11e7, 1169:
    dec / jne); 11ef count [bp-6] > 0 -> 11fd..1228 the clear, 122b ovl62:0000, 1230 ovl64:006c
    (drawing), 124a..1274 message STRING 168 (R18), 127c..128e ovl64:0629(x, y) when x, y >= 0
    (only ovl67:0728's call; ovl68:0491 passes -1, -1)."""
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
    sel = state.selection                                # asm 0b62:11fd..1228
    sel.hero, sel.selected, sel.moving = -1, -1, []
    sel.group = sel.count = 0
    from .mapwords import refresh_map
    refresh_map(state)                                   # asm 0b62:122b (ovl62:0000)
    if x >= 0 and y >= 0:                                # asm 0b62:127c..128e, after the message
        from .turn import centre_view                    # circular at module level
        centre_view(state, x, y)                         # ovl64:0629
    return [E.Sunk({"armies": tuple(a.id for a in gone), "count": len(gone)})]


# ------------------------------------------------------------------------------- computer moves
#
# The resident move executor the computer phases call (ai.md §7a.1, §7a.2, §7a.6): 0a8b:0001
# (`execute_move`) with 0a8b:0c4f(x, y, 1) (`walk_selection`), 0a8b:0476 (`attack_stack`) and
# 0a8b:0254 (`attack_order_city`), on the current selection DS:5e62 / 5e3e that AI code sets
# with `set_selection` (0c8c:0529).  Where they call AI code or read / write the AI block
# (DS:40ee), they go through `HOOKS` (warlords2.ai.*, M8b).

# name -> (milestone, "module:function", what it must do, EXE address)
HOOKS = {
    "ai_quest_city": ("M8b1", "warlords2.ai.state:quest_city",
                      "f(state) -> int: AI[+0x46] of the side on turn (occupy / raze quest city or -1)",
                      "0a8b:0318..0320 (DS:40ee +0x46)"),
    "ai_set_role": ("M8b1", "warlords2.ai.state:set_city_role",
                    "f(state, city, role) -> None: AI[+0x56 + city] = role (byte) for the side on turn",
                    "0a8b:02f8..02fe (DS:40ee +0x56 + city = 1)"),
    "ai_retarget": ("M8b3", "warlords2.ai.util:retarget",
                    "f(state, city, x, y) -> int: ovl29:1771(city, x, y), the city to go for (draws rnd)",
                    "ovl29:1771 at 0a8b:0331"),
    "ai_search_on_arrival": ("M8b3", "warlords2.ai.phases.move:search_on_arrival",
                             "f(state, army, site) -> list[Event]: ovl22:15c3(army, site)",
                             "ovl22:15c3 at 0a8b:01c8"),
    "ai_captured": ("M8b4", "warlords2.ai.phases.quick_attack:captured",
                    "f(state, city, old_owner) -> list[Event]: ovl26:0000(city, old_owner)",
                    "ovl26:0000 at 0a8b:0416"),
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


def _require_executor() -> None:
    """Strict mode: every hook 0a8b:0001 may reach (its own and the battle's) must exist before
    anything changes."""
    if unverified_allowed():
        return
    for name, (milestone, target, _, _) in HOOKS.items():
        if _hook(name) is None:
            raise NotImplementedCommand(C.EndTurn, milestone, target)
    from . import combat                                 # circular at module level
    combat.require_ai_battle_hooks()


def _call(name, default, *args):
    f = _hook(name)
    if f is None:
        milestone, target, _, _ = HOOKS[name]
        if not unverified_allowed():
            raise NotImplementedCommand(C.EndTurn, milestone, target)
        log.warning("move executor step %s (%s, %s) not implemented; skipped", name, target, milestone)
        return default
    return f(*args)


def _record(state, aid: int):
    """The army record a far pointer DS:5e62 / 5e3e[i] / 5e5e (id) stands for, or None (null)."""
    return state.armies[aid] if 0 <= aid < len(state.armies) else None


def _group_records(state) -> list:
    """The non-null entries of DS:5e3e[0..7] in slot order."""
    return [a for a in (_record(state, i) for i in state.selection.moving[:K.STACK_MAX.value])
            if a is not None]


class SelectionValues(NamedTuple):
    """The stored selection words (`state.selection`) as 0c8c:0529 last left them, with the
    later writes listed at `store_selection_words`."""
    count: int            # DS:5dfe: non-null DS:5e3e entries
    moves: int            # DS:5e00: lowest moves left (signed), from 100
    group: int            # DS:2bda: count > 1
    hero: int             # DS:5e5e as an army id, -1 = null
    mode: int             # DS:5dfc
    mask: int             # DS:5dfa


def store_selection_words(state) -> None:
    """The words 0c8c:0529 writes from DS:5e3e[0..7] (every non-null entry, slot order): DS:5dfe
    = their count, DS:5e00 = their lowest signed moves left starting from 100, DS:2bda = count
    > 1, DS:5dfc / 5dfa = `stack_mode` (no entry: mode 2 as coded, allfly stays 1).  The
    original keeps them as words; whatever changes the armies afterwards (a picked-up flight
    item, boarding, a battle) does not reach them until the next 0529, so the readers here use
    the stored values.  A freed record in DS:5e3e (type 0xff) would make 0529 read the flag
    bytes past the type table; no caller leaves one there [I: `set_selection` refuses them,
    the other callers fill DS:5e3e from live armies], and `stack_mode` raises on it.
    0529 is called only by ovl67:06eb (`rules.selection.select_army_stack`), ovl66:000a
    (palette apply, `rules.selection.apply_palette`), 0a8b:0476 (`attack_stack`) and the AI's
    ovl19:0996, ovl22:0c5b, ovl28:07ea, ovl29:0ae7 (M8b, through `set_selection`); all of them
    reach it through `rules.selection.selection_step`, which calls this first.  DS:5dfc / 5dfa
    have no other writer; the other words do: 0a8b:07f9 (0a11, `_walk`), ovl36:0522 (061d /
    0641, `rules.combat._prelude`) and ovl36:0a6b (0afd..0b47 count, `rules.combat._after_battle`)
    here, 0c8c:0912 (DS:5e00 of the palette draw ovl66:0356, which also writes DS:5dfe:
    `rules.selection.redraw_palette`), and 0b62:0ea0 (11f8..1228, DS:2bda / 5dfe = 0 when
    anything sank, `sink`), and
    ovl29:14d3 (`select_list`), ovl66:0d30 (DS:5dfe = 1 with DS:2bda clear,
    `rules.selection.build_palette`), 0b62:06bf at 088f (DS:2bda = 0 with DS:5e62 null,
    `rules.selection.confirm_disband`); not modelled, as they store what the next 0529
    stores or what 0529 just stored: ovl66:000a at 00ab / 00bd (it calls 0529 next) and
    ovl67:0955 at 0969 (DS:2bda = its argument when DS:5e3e[1] is not null, else 0; its one
    call ovl67:08a0 passes 1 after 0529 at 0888; equal there, as 06eb fills DS:5e3e without
    holes).  Every reader takes the stored words (DS:2bda as `Selection.group`).
    Evidence: grep of the listing: DS:5dfc / 5dfa are written only at 0c8c:06c0..071e; 0529
    0555..0723 (055a 5dfe = 0, 0560 5e00 = 100, 05cf / 05d3..05db per entry, 06af..06bd 2bda,
    06c0..071e mode / mask; ai.md §7a.5); callers: every `lcall 0c8c:0529` in out/asm."""
    sel = state.selection
    ms = _group_records(state)
    moves = K.SELECT_MOVES_START.value
    for a in ms:
        moves = min(moves, _s8(a.moves_left))
    sel.count, sel.moves, sel.group = len(ms), moves, int(len(ms) > 1)
    sel.mode, sel.mask = stack_mode(state, ms)


def _trim(slots: list) -> list:
    """DS:5e3e[0..7] as `Selection.moving` keeps it: trailing null slots dropped."""
    out = list(slots)
    while out and out[-1] == -1:
        out.pop()
    return out


def set_selection(state, leader: int, members) -> None:
    """Make army `leader` DS:5e62 (-1 = null) and `members` (up to 8 entries by slot, -1 = a
    null slot, kept in place) DS:5e3e, then run the selection step 0c8c:0529 (stored words,
    hero DS:5e5e, every member's goto = the leader's).  What the AI's 0529 callers (ovl19:0996,
    ovl22:0c5b, ovl28:07ea, ovl29:0ae7) have in DS:5e62 / 5e3e when they call it; ovl29:14d3,
    which some of them call first, does not call 0529 itself (`select_list`).  A null leader is
    what ovl29:0ae7 keeps when no entry's fight-order byte beats -1 after ovl29:14d3 left one
    (unreachable with the shipped fight orders, whose bytes are 0..28).
    Evidence: asm 0c8c:0529..07f9 reads DS:5e62 and DS:5e3e[0..7] only (ai.md §7a.5;
    rules.selection.selection_step); no game rule of its own."""
    ids = list(members)
    live = [i for i in ids if i != -1]
    if len(ids) > K.STACK_MAX.value or len(set(live)) != len(live):
        raise IllegalCommand("DS:5e3e holds up to 8 distinct armies")
    for aid in live + ([leader] if leader != -1 else []):
        if _record(state, aid) is None or state.armies[aid].owner == FREE:
            raise IllegalCommand("no live army record %r" % (aid,))
    sel = state.selection
    sel.selected, sel.moving = leader, _trim(ids)
    from .selection import selection_step              # circular at module level
    selection_step(state)


def select_list(state, ids) -> None:
    """ovl29:14d3(list): the AI's list selection without the selection step.  DS:2bda = 0, DS:5dfe
    = 0, DS:5e00 = 100, DS:5e62 = null; DS:5e3e[0..7] = null; per list entry (up to 8, -1 =
    none): DS:5e00 = min(DS:5e00, the army's signed +7), DS:5dfe += 1; one entry: DS:5e3e[0] =
    list[0]; more: DS:2bda = 1 and DS:5e3e[i] = list[i] in place (a -1 entry leaves slot i
    null, also before live ones); then DS:5e62 = DS:5e3e[0] (null when slot 0 is).  DS:5dfc /
    5dfa and DS:5e5e are not written: the mode and mask stay those of the last 0529 until the
    caller runs it (ovl22:0e61 -> 0e81 and ovl28:0a62 -> 0a6a do; ovl20:073a and ovl28:0a04 do
    not).  One entry that is not in slot 0 makes DS:5e3e[0] = DS:5e62 the pointer computed
    from list[0] = -1, 1e1d:886a, "record -1" (the last 22 bytes of the map word layer, squares
    (101..111, 155)), and leaves the entry itself out of DS:5e3e; the engine keeps slot 0 and
    DS:5e62 null there, which only ovl20:06c7's next 15c5 reads before 0ae7 rewrites them
    (plan register X38).
    Evidence: asm ovl29:14d3..15c4 (14d6..14e8, 14f5..1551 loop, 1553 count 0 -> return,
    155a..157c one entry, 157e..15b9 more, 15bb..15bf DS:5e62)."""
    ids = list(ids)[:K.STACK_MAX.value]
    live = [i for i in ids if i != -1]
    if len(set(live)) != len(live):
        raise IllegalCommand("ovl29:14d3 list with a repeated army: %r" % (ids,))
    for aid in live:
        if _record(state, aid) is None:
            raise IllegalCommand("no army record %r" % (aid,))
    sel = state.selection
    sel.group, sel.count, sel.moves = 0, 0, K.SELECT_MOVES_START.value
    sel.selected, sel.moving = -1, []
    for aid in live:
        sel.moves = min(sel.moves, _s8(state.armies[aid].moves_left))
        sel.count += 1
    if sel.count == 0:
        return
    if sel.count == 1:
        sel.moving = _trim(ids[:1])                       # list[0]; -1: record -1 (see above)
    else:
        sel.group = 1
        sel.moving = _trim(ids)
    sel.selected = sel.moving[0] if sel.moving else -1


def selection_values(state) -> SelectionValues:
    """The stored DS:5dfe, 5e00, 2bda, 5e5e, 5dfc, 5dfa (see `store_selection_words`).
    Evidence: asm 0555:18ae..18b8 (0555:1868 copies DS:5dfc / 5dfa into the path record),
    0a8b:0820..0847 (07f9 reads DS:2bda / 5dfe / 5e00)."""
    sel = state.selection
    return SelectionValues(sel.count, sel.moves, sel.group, sel.hero, sel.mode, sel.mask)


def walk_selection(state, x: int, y: int):
    """0a8b:0c4f(x, y, 1): the selected stack's leader gets goto (x, y), the path is searched
    from its square (mode / mask of 0c8c:0529) and walked as far as this turn allows (07f9 /
    04c8; computer sides pick up items on every step, ovl28:0427 with DS:5e5e); boarding or
    landing zeroes the moves of DS:5e3e (0d1a) and gives status 2.  Unlike `move` nothing is
    adopted: the walk is DS:5e3e[0..7] with DS:2bda, else DS:5e62 alone, budgeted by DS:5e00 or
    the leader's points.  Mode, mask, DS:2bda, DS:5dfe and DS:5e00 are the stored words
    (`store_selection_words`), not recomputed: a flight item the hero picked up since the
    last 0529 (0a8b:0001 picks up before every round) does not make the stack fly.  Returns (status, square that stopped it (DS:5dc8 / 5dc6) or None,
    events): 1 no path (Moved with no_path), 2 out of moves / boarded / landed, 3 a stack of a
    side not at peace ahead, 4 path end, 5 a foreign city ahead, 0 otherwise.  quiet = 1: no
    path display, no palette rebuild.
    Evidence: asm 0a8b:0c4f..0d19 (0c5b..0c69 goto, 0c79 0555:1868, 0c87 0555:000a, 0cb1 1,
    0cd7..0cdf display words, 0cea 07f9, 0cf2..0cfe 0d1a and 2, 0d01 quiet); 07f9 0820..0847
    (count / budget), 09f8..0a75 (charge)."""
    sel = state.selection
    lead = _record(state, sel.selected)
    if lead is None:
        raise IllegalCommand("0a8b:0c4f needs a selected stack (DS:5e62)")
    lead.goto = (x, y)
    ms = _group_records(state)
    v = selection_values(state)
    members = ms if v.group else [lead]
    src = (lead.x, lead.y)
    codes = P.find_path(state, src, (x, y), v.mode, v.mask)
    if codes is None:
        return K.STATUS_NO_PATH.value, None, [E.Moved({
            "armies": tuple(a.id for a in members), "from": src, "to": src, "path": [], "cost": 0,
            "status": K.STATUS_NO_PATH.value, "ahead": None, "no_path": True})]
    budget = v.moves if v.group else _s8(lead.moves_left)
    return _walk(state, lead, members, ms, src, codes, v.mode, v.mask, bool(v.group),
                 v.count if v.group else 1, budget, _record(state, v.hero))


def attack_stack(state, x: int, y: int):
    """0a8b:0476(x, y): the real battle ovl36:124a(x, y, 1) (`rules.combat.ai_battle`); n = the
    non-null DS:5e3e entries it left (the survivors); n > 0 -> the selection step 0c8c:0529.
    Returns (n, events).
    With SCN 0x159 the view is centred on DS:5e62 first (ovl64:0565 at 0489).
    Evidence: asm 0a8b:0476..04c7 (0481..0489 SCN 0x159 -> ovl64:0565, 0496 124a, 049e..04b8
    count over DS:5e3e[7..0], 04be 0529)."""
    from . import combat                                 # circular at module level
    from .selection import selection_step
    _view_before_battle(state)
    events = combat.ai_battle(state, x, y)
    n = len(_group_records(state))
    if n:
        selection_step(state)
    return n, events


def _viewed(state) -> bool:
    return bool(state.flags.get(KT.SCN_VIEWED.value, 0))


def _view_before_battle(state) -> None:
    """0a8b:0292..029a / 03d5..03dd / 0481..0489: with SCN 0x159, ovl64:0565 (view words on
    DS:5e62, map drawn)."""
    if _viewed(state):
        centre_on_selection(state)
        present("map", at="0a8b:0565")


def _view_after_battle(state) -> None:
    """0a8b:02b4..02d0 / 0423..043f: with SCN 0x159, ovl64:0565 when DS:5e62 is set, else the
    map draw ovl64:006c and the selection frame 077b:005f."""
    if not _viewed(state):
        return
    if _record(state, state.selection.selected) is not None:
        centre_on_selection(state)
        present("map", at="0a8b:0565")
    else:
        present("map", at="0a8b:006c")
        present("frame", at="077b:005f")


def _clear_orders(state, keep_low: int, set_low: int = 0, city: int | None = None) -> None:
    """DS:5e3e[7..0]: +0xe = (+0xe & keep_low) | set_low; +0xf = (+0xf & 1) | (city & 0x7f) << 1."""
    for a in reversed(_group_records(state)):
        a.order = (a.order & keep_low) | set_low
        a.vector_dest = (city & K.ORDER_CITY_MASK.value) if city is not None else 0


def attack_order_city(state, c: int, x: int, y: int, goto: tuple):
    """0a8b:0254(c, x, y, &gx, &gy): the walk toward order city c was stopped by the foreign
    city square (x, y).  c neutral: battle on (x, y), a taken c gets AI role 1, orders
    cleared, 0.  c own: orders cleared, 0.  Else t = c when c is the AI's quest city (AI[+0x46])
    and a hero is selected, otherwise ovl29:1771(c, x, y); t != c: every DS:5e3e member gets
    order kind 1 and order city t, the goto becomes t's square, 1; t == c: battle on (x, y),
    a taken c goes to ovl26:0000(c, owner before), orders cleared, 0.  Orders cleared = +0xe
    &= 0xf0, +0xf &= 1 on DS:5e3e[7..0].  Returns (result, goto, events).
    Evidence: asm 0a8b:0254..0475 (0274..027d owner byte / cwde, 0285 == 0x0f, 02a7 124a,
    02e3..02fe cwde == SCN 0x110 -> AI +0x56 + c = 1, 030e byte == 0x110 -> 0444, 0318..0339
    AI +0x46 / DS:5e5e / ovl29:1771, 033f..0385 redirect, 0387..03af goto = city t +0 / +2,
    03c9 return 1, 03ea 124a, 0400..0416 cwde == 0x110 -> ovl26:0000(c, [bp-4]), 0444..046d
    clear, 046f [bp-2] = 0).  With SCN 0x159 the view words follow DS:5e62 before each battle
    (ovl64:0565 at 029a / 03dd) and after it (02c4 / 0433 when DS:5e62 is set, else the map
    draw 006c and 077b:005f at 02cb / 043a): `_view_before_battle` / `_view_after_battle`."""
    from . import combat                                 # circular at module level
    events: list = []
    city = _order_city(state, c)
    o_byte, o = city.owner & 0xFF, _s8(city.owner)
    if o_byte == K.NEUTRAL_OWNER.value:
        _view_before_battle(state)
        events += combat.ai_battle(state, x, y)
        _view_after_battle(state)
        if _s8(state.cities[c].owner) == state.current:
            _call("ai_set_role", None, state, c, K.ROLE_NEW_CITY.value)
        _clear_orders(state, K.ORDER_CLEAR_KEEP.value)
        return 0, goto, events
    if o_byte == state.current & 0xFF:
        _clear_orders(state, K.ORDER_CLEAR_KEEP.value)
        return 0, goto, events
    if _call("ai_quest_city", -1, state) == c and _record(state, state.selection.hero) is not None:
        t = c
    else:
        t = _call("ai_retarget", c, state, c, x, y)
    if t != c:
        _clear_orders(state, K.ORDER_CLEAR_KEEP.value, K.ORDER_CITY.value, t)
        tc = state.cities[t]
        return 1, (tc.x, tc.y), events
    _view_before_battle(state)
    events += combat.ai_battle(state, x, y)
    if _s8(state.cities[c].owner) == state.current:
        events += _call("ai_captured", [], state, c, o)
    _view_after_battle(state)
    _clear_orders(state, K.ORDER_CLEAR_KEEP.value)
    return 0, goto, events


def _order_city(state, c: int):
    """City record c (2c04:157d + 0x41 c).  An order city beyond the live table would read an
    unused record in the original; here it raises (no such state is known to arise)."""
    if not 0 <= c < len(state.cities):
        raise RuntimeError("order city %d beyond the city table (%d cities)" % (c, len(state.cities)))
    return state.cities[c]


def _fingerprint(state) -> tuple:
    """Everything one round of 0a8b:0001 reads (no rnd is drawn in a round without a battle)."""
    return (tuple((a.x, a.y, a.moves_left, a.goto, a.flags, a.order, a.vector_dest)
                  for a in state.armies),
            tuple(state.world.flags), tuple(state.cost_map),
            tuple((p.valid, p.mode, p.mask, p.src, p.dst, tuple(p.codes)) for p in state.path_cache),
            tuple((it.state, it.holder) for it in state.items),
            state.selection.selected, tuple(state.selection.moving), state.selection.hero,
            tuple(selection_values(state)))


class MoveLoopHang(RuntimeError):
    """0a8b:0001 would loop for ever (ai.md §7a.1): a status-5 round with the side's own order
    city and the stale DS:5e3e count n != 0 left everything it reads unchanged (`_fingerprint`:
    armies, map words, cost map, path cache, items, selection and its stored words), so every
    later round is the same.  The original hangs there; `execute_move` raises this instead,
    with the state as that round left it (the side's turn cannot go on as the EXE's would).
    The caller (the computer turn, M8b) decides what to do; engine.apply rolls back like for
    any exception.  A subclass of RuntimeError, so code that caught that still does.
    Evidence: asm 0a8b:0001..024b (DI = n zeroed only at 000e; 0101..0110 own c -> 0131 tests
    the stale DI; nothing in such a round changes what the next one reads)."""


def execute_move(state, x: int, y: int, keep: int = 0):
    """0a8b:0001(x, y, keep): move the selected stack toward (x, y) until it stops, fighting on
    the way.  Each round: the hero picks up items on the leader's square (ovl28:0427), the walk
    0c4f(x, y, 1); the leader standing on its goto -> status 4 and goto (-1, -1); then by status:
    2 the stack is marked done (ovl67:08fb); 3 the stack ahead is attacked (0476) and survivors
    go on; 4 with order kind 3 (k, the leader's +0xe & 0xf read once on entry) and a hero
    (DS:5e5e): ovl22:15c3(hero, site) for a site on the hero's square, then +0xe &= 0x80 on
    DS:5e3e; 5 with the goto on a City square: when the order city c (leader's +0xf >> 1, re-read
    after a round that goes on) is not the side's, 0254 attacks or redirects (it may change the
    goto (x, y)); the stack goes on when n != 0.  n is one register for 0476's and 0254's
    results, zeroed only on entry: with c the side's own, a round of status 5 goes on when an
    earlier round left n != 0 (ai.md §7a.1).  Such a round that changes nothing repeats for
    ever in the original; here a round equal to the one before raises `MoveLoopHang`
    (deliberate divergence, as in rules.combat.fight).  keep == 0 at the end: done mark and
    deselect (0b62:08b3).  No leader or (x, y) off the map: (0, []) before anything changes
    (also before the keep test).  Returns (last status, events).
    Evidence: asm 0a8b:0001..024b: 0009 loop = 1, 000e DI = 0, 0010..0027 c / k from DS:5e62,
    002a..0053 early return 0, 0054 loop = 0, 0059..0064 ovl28:0427(L.x, L.y), 0076 0c4f(x, y,
    1), 007f..00a2 status 4, jump table 024c (2 -> 00bb, 3 -> 0206, 4 -> 0150, 5 -> 00c3);
    00bb ovl67:08fb; 0206..021c DI = 0476(DS:5dc8, DS:5dc6), loop when DI; 0150..0204 (k == 3,
    DS:5e5e, records SCN 0x181-1..0, ovl62:04b5(hero x, y), ovl22:15c3(index, site), DS:5e3e
    [0..7] +0xe &= 0xf0 then &= 0x8f); 00c3..00ef terrain(x, y) == 10, 0101..0110 owner byte
    of c == SCN 0x110 byte -> 0131, 0129 DI = 0254(c, DS:5dc8, DS:5dc6, &x, &y), 0131..014a
    DI != 0 -> loop, c re-read; 022a..023d keep == 0 -> ovl67:08fb, 0b62:08b3(1, 1, 1);
    0245 return the status; 0b62:08b3..0904 (DS:5e62 null -> nothing; 08cd ovl62:0af3, 08d8
    ovl64:006c, present points "frame_off" and "map")."""
    sel = state.selection
    lead = _record(state, sel.selected)
    if lead is None or not (0 <= x < W and 0 <= y < MAP_H):
        return 0, []
    _require_executor()
    from .selection import mark_done                     # circular at module level
    c = lead.vector_dest & K.ORDER_CITY_MASK.value
    k = lead.order & K.ORDER_KIND_MASK.value
    loop, r, n = True, 0, 0
    events: list = []
    last = None
    while loop:
        loop = False
        L = _record(state, sel.selected)
        events += pick_up(state, L.x, L.y)
        r, ahead, ev = walk_selection(state, x, y)
        events += ev
        if L.goto == (L.x, L.y):
            r = K.STATUS_ARRIVED.value
            L.goto = (-1, -1)
        if r == K.STOP_MOVES.value:
            mark_done(state)
        elif r == K.STOP_STACK.value:
            n, ev = attack_stack(state, *ahead)
            events += ev
            loop = n != 0
        elif r == K.STATUS_ARRIVED.value:
            if k == K.ORDER_SITE.value and _record(state, sel.hero) is not None:
                high = min(state.flags.get(SCN_ARMY_HIGH, len(state.armies)), len(state.armies))
                if sel.hero < high:
                    h = state.armies[sel.hero]
                    site = state.site_at(h.x, h.y)                   # ovl62:04b5
                    if site != -1:
                        events += _call("ai_search_on_arrival", [], state, sel.hero, site)
                for a in _group_records(state):
                    a.order &= K.ARRIVED_ORDER_KEEP.value
        elif r == K.STOP_CITY.value and state.world.terrain(x, y) == Terrain.CITY:
            stale = (_order_city(state, c).owner & 0xFF) == (state.current & 0xFF)
            if not stale:
                n, (x, y), ev = attack_order_city(state, c, ahead[0], ahead[1], (x, y))
                events += ev
            if n:
                loop = True
                c = state.armies[sel.selected].vector_dest & K.ORDER_CITY_MASK.value
                if stale:
                    fp = _fingerprint(state)
                    if fp == last:
                        raise MoveLoopHang("0a8b:0001 never ends: status 5 with the side's own order "
                                           "city %d and the stale n = %d repeats unchanged" % (c, n))
                    last = fp
                    continue
        last = None
    if keep == 0:
        mark_done(state)
        if sel.selected >= 0:                            # 0b62:08b3(1, 1, 1)
            sel.selected = -1
            present("frame_off", at="0b62:08cd")          # ovl62:0af3
            present("map", at="0b62:08d8")                # ovl64:006c
    return r, events
