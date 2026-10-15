"""Heroes: offers, creation, allies, experience and levels, death, items, the standard, medals.

Sources (re-read by M7a from out/asm/ and out/rea/decomp/; EL = docs/research/exe_logic.md §5):

* offer check            ovl47:0000 (L 0x75330); computer accept ovl47:0301; human dialog ovl47:0d5c,
                         accept ovl47:127e, decline ovl47:12af, rename ovl47:12ce, sex ovl47:12f9
* name pick              ovl47:0c67 (L 0x75f97)
* new hero               ovl47:031b (L 0x7564b) with the room search ovl43:0bff (flag 1)
* price and allies       ovl47:01fc (L 0x7552c), ally type ovl47:1a9b, placement ovl34:12e6
* experience, levels     ovl47:04f1, ovl47:0579, ovl47:0672
* hero death             ovl36:16cd (L 0x6913d)
* items                  take ovl47:08c7, drop ovl47:0943, plant the standard ovl47:09f7,
                         item lists ovl51:03d9 (modes 1 carried + lying, 2 carried, 3 lying)
* medals                 ovl36:2274 (L 0x69ce4), called from ovl36:0498 after the re-selection
                         ovl36:047f..0490 (done by rules.combat.attack)
* news                   ovl41:1244 (the per-side two-entry news record 2c04:13e3)

Randomness only through `state.rng.rnd`, in the original's order.  Presentation (dialogs,
sounds, redraws) is not modelled.  The computer's choice of the city for a new hero
(ovl25:0919) belongs to the AI and goes through `HOOKS`, like combat.py.
"""
from __future__ import annotations

import importlib
import logging

from ..model import commands as C
from ..model import events as E
from ..model.ids import (HERO_TYPE, MAP_ARMY, MAP_H, MAP_OWNER_MASK, MAP_W, ROAD_STANDARD, Control,
                         ItemState, Terrain)
from .bonuses import s8
from .constants import heroes as K
from .constants import movement as KM
from .constants import unverified_allowed
from .economy import add_gold, cached_cities, refresh_cities, refresh_income
from .engine import IllegalCommand, NotImplementedCommand
from .present import present
from .movement import FREE, alloc_army, armies_at, type_flag

log = logging.getLogger(__name__)

# name -> (milestone, "module:function", what it must do, EXE address)
HOOKS = {
    "ai_hero_city": ("M8b1", "warlords2.ai.base:hero_city",
                     "f(state, city) -> int: the computer side's city for a new hero (scores every own "
                     "city with rnd by its AI status byte, starting from the drawn one)", "ovl25:0919"),
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


def _call(name, default, *args):
    f = _hook(name)
    if f is None:
        milestone, target, _, _ = HOOKS[name]
        if not unverified_allowed():
            raise NotImplementedCommand(C.AcceptHero, milestone, target)
        log.warning("hero step %s (%s, %s) not implemented; skipped", name, target, milestone)
        return default
    return f(*args)


# ------------------------------------------------------------------------------- helpers


def turn(state) -> int:
    """The turn number as the rules read it.
    Evidence: ovl61:225b returns max(SCN 0x135, 1) (EL §5.1)."""
    return max(state.turn, 1)


def is_computer(state, p: int | None = None) -> bool:
    """Whether side p (default: the current side) is run by the computer.
    Evidence: ovl25:09ab (asm 09b3..09d5): SCN 0x0d0[0x110] == 1, or DS:0836 != 0.  DS:0836 is 1
    only while the computer turn ovl25:0000 runs (set at ovl25:0071, cleared at 0354; its
    one caller ovl68:01e3 is in ovl68:0000, which ovl61:21cc..21f7 runs only for 0x0d0[0x110]
    == 1), when 0x0d0[0x110] == 1 already, so the test reduces to the control word of the side
    on turn."""
    p = state.current if p is None else p
    return state.players[p].control == Control.COMPUTER


def live(state, aid: int):
    """The army record `aid` when it holds an army (owner byte != 0xff), else None.
    Evidence: free records have owner 0xff (0b62:03be); table index == id."""
    if isinstance(aid, int) and 0 <= aid < len(state.armies) and state.armies[aid].owner != FREE:
        return state.armies[aid]
    return None


def slot_of(state, army):
    """The hero slot of a hero army.
    Evidence: army +0xa (signed byte) indexes the 40 slots (asm ovl47:0504, ovl36:16df)."""
    return state.heroes[s8(army.hero_slot)]


def hero_name(state, army) -> str:
    """Evidence: slot name 2c04:0223 + s*0x14 (asm ovl47:079d, ovl01:0d90)."""
    return slot_of(state, army).name


def add_strength(army, n: int) -> None:
    """Strength + n, capped at 9.
    Evidence: decomp 0b62:0005: +8 += n; if (signed) +8 > 9: +8 = 9."""
    v = s8(army.strength + n)
    army.strength = K.STRENGTH_CAP.value if v > K.STRENGTH_CAP.value else v & 0xFF


def _flat(x: int, y: int) -> int:
    """Index of the map word the original addresses for (x, y) (y*0xe0 + x*2, no bounds); a
    square left or right of the map aliases the neighbouring row.  Outside the map array the
    original reads the army table or below the segment: refused here (deliberate divergence)."""
    i = y * MAP_W + x
    if not 0 <= i < MAP_W * MAP_H:
        raise RuntimeError("map word (%d, %d) outside the map: the original reads other memory" % (x, y))
    return i



def _count_at(state, x: int, y: int) -> int:
    """0b62:007d count (at most 8) of armies on (x, y), any owner (movement.armies_at)."""
    return len(armies_at(state, x, y))


def news(state, p: int, kind: int, a: int, b: int, name: str) -> None:
    """Record one entry in side p's news record: up to two entries; when both are used, the
    one with the larger kind is replaced by a smaller new kind, else nothing changes.
    Evidence: decomp ovl41:1244: count byte 2c04:13e3 + p*0x2b < 2 -> append; else slot =
    (kind[0] <= kind[1]); if kind[slot] <= new kind (signed char) return; kind, words a, b and
    the name (16 bytes) are written to the slot."""
    rec = state.news[p]
    entry = [s8(kind), a & 0xFFFF, b & 0xFFFF, name[:K.NEWS_NAME_MAX.value]]
    if len(rec) < K.NEWS_SLOTS.value:
        rec.append(entry)
        return
    slot = 1 if rec[0][0] <= rec[1][0] else 0
    if rec[slot][0] <= entry[0]:
        return
    rec[slot] = entry


def overview_rolls(state, x: int, y: int) -> list[int]:
    """The dice ovl63:2785 draws when it redraws the overview pixels of (x, y): four rnd(1,3,1)
    when the square's picture is a mountain tile, else none.  The values are pixel colours
    (presentation); they are returned so the overview can use them.
    Evidence: asm ovl63:27f8..28dd: tile = map low byte, or road piece - 1 when the road
    layer (19d9 & 0x1f) is set; 0x50 <= tile < 0x60 -> rnd(1,3,1) for (2x, 2y), (2x+1, 2y),
    (2x, 2y+1), (2x+1, 2y+1)."""
    i = _flat(x, y)
    t = state.world.tiles[i] & 0xFF
    road = state.world.roads[i] & 0x1F
    if road:
        t = road - 1
    lo, hi = K.OVERVIEW_TILES.value
    if not lo <= t < hi:
        return []
    return [state.rng.rnd(*K.OVERVIEW_ROLL.value) for _ in range(K.OVERVIEW_ROLLS.value)]


def selection_flying(state) -> bool:
    """DS:5dfc == 2: the selected stack moves flying (the `flying` argument of ovl64:1298), the
    word as the last selection step stored it (`Selection.mode`), not recomputed: a flight item
    taken since then does not count until the next 0c8c:0529.
    Evidence: asm ovl64:12e5 (cmp word [0x5dfc], 2 inside ovl64:1298; its callers push only
    side, x, y); DS:5dfc is written only by 0c8c:0529 (asm 0c8c:06c0..071e,
    rules.movement.store_selection_words)."""
    return state.selection.mode == KM.MODE_FLY.value


# ------------------------------------------------------------------------------- names


def parse_hero_names(data: bytes) -> list[list]:
    """The `#` entries of a HERONAM file as [female, name], in file order.
    Evidence: ovl47:0c67 (asm 0ce3..0d4a): an entry starts at '#'; the next byte is the sex
    ('0' male, anything else female); the name starts two bytes after it and ends at the
    first byte below 0x20."""
    out = []
    mark, male = K.NAME_MARK.value, K.NAME_MALE.value
    for i, b in enumerate(data):
        if b != mark:
            continue
        sex = data[i + 1] if i + 1 < len(data) else 0
        j = i + 1 + K.NAME_SKIP.value
        k = j
        while k < len(data) and data[k] >= K.NAME_END_BELOW.value:
            k += 1
        out.append([0 if sex == male else 1, data[j:k].decode(K.NAME_ENCODING.value)])
    return out


def load_hero_names(gd, terrain_set: int = 0) -> list[list[list]]:
    """The eight sides' hero-name lists from the game directory.
    Evidence: ovl47:0c67 reads FILE.DAT group 20 formatted with SCN 0x161 (terrain set) and the
    side, i.e. TERRAIN<set>/HERONAM<p>.DAT (tables.md §2)."""
    return [parse_hero_names(gd.read(K.NAME_FILE.value % (terrain_set, p))) for p in range(8)]


def _names(state) -> list:
    names = state.hero_names[state.current] if state.current < len(state.hero_names) else None
    if not names:
        raise ValueError("hero names not loaded (rules.setup.new_game(hero_names=...))")
    return names


def pick_name(state) -> tuple[int, str]:
    """(female, name) for a new hero of the current side.
    Evidence: ovl47:0c67: r = rnd(1,100,0), the r-th '#' entry of the side's file."""
    names = _names(state)
    r = state.rng.rnd(*K.NAME_ROLL.value)
    if r > len(names):
        raise RuntimeError("entry %d past the end of the name file: the original reads past its buffer" % r)
    female, name = names[r - 1]
    return int(female), name


# ------------------------------------------------------------------------------- offers


def hero_counts(state) -> tuple[int, int]:
    """(heroes in the army table, heroes of the current side).
    Evidence: asm ovl47:00aa..00e4: records 0x181-1..0 with type 0x1c; owner byte == SCN 0x110
    (free records have type 0xff)."""
    total = own = 0
    for a in state.armies:
        if a.type_id == HERO_TYPE:
            total += 1
            if a.owner == state.current:
                own += 1
    return total, own


def offer_check(state):
    """Whether the current side is offered a hero now; returns {"city", "price"} or None.
    Evidence: asm ovl47:0000..01fb: price (DS:1110) = 0; nothing while SCN 0x15d is set; turn 1:
    the city at the capital (ovl62:044a), free; else ovl62:03f9 (007b) and cap 5 (6 with
    DS:5dea[p] >= 40, 008c); no offer with
    40 heroes on the map or the cap reached; price rnd(1,600,1000) with own heroes, else
    rnd(1,400,300); no offer if gold < price or rnd(1,30,0) > 6; k = rnd(1,DS:5dea[p],0) (0168) picks the
    k-th own city in table order; a computer side then takes ovl25:0919(city)."""
    p = state.current
    if state.flags.get(0x15D, 0) != 0:
        return None
    pl = state.players[p]
    if turn(state) == 1:
        return {"city": state.city_at(*pl.capital), "price": 0}
    refresh_cities(state)                        # asm ovl47:007b (ovl62:03f9)
    n_cities = cached_cities(state, p)
    cap = K.OFFER_CAP_BIG.value if n_cities >= K.OFFER_BIG_CITIES.value else K.OFFER_CAP.value
    total, own = hero_counts(state)
    if total >= K.OFFER_TOTAL_MAX.value or own >= cap:
        return None
    price = state.rng.rnd(*(K.OFFER_PRICE_MORE.value if own else K.OFFER_PRICE_FIRST.value))
    if s16(pl.gold) < price:
        return None
    if state.rng.rnd(*K.OFFER_ROLL.value) > K.OFFER_ROLL_MAX.value:
        return None
    k = state.rng.rnd(1, n_cities, K.OFFER_CITY_ROLL_ADD.value)
    city, n = -1, 1
    for ci, c in enumerate(state.cities):
        if s8(c.owner) == p:
            city = ci
            if n == k:
                break
            n += 1
    if city < 0:
        return None
    if is_computer(state):
        city = _call("ai_hero_city", city, state, city)
    return {"city": city, "price": price}


def s16(v: int) -> int:
    """Evidence: the gold word is compared signed (asm ovl47:0134..013d jge)."""
    from .economy import s16 as _s16
    return _s16(v)


def human_offer(state) -> list:
    """The human side's hero offer at the start of its turn: the check, then the dialog with a
    drawn name (HeroOffered, pending; answered by AcceptHero or NameHero).
    Evidence: ovl68:04bd -> ovl47:0000, then ovl47:0d5c, which draws the name (ovl47:0c67) on
    opening; buttons accept 0x11f, decline 0x120 (disabled on turn 1), rename 0x121, sex
    0x122 / 0x123 (ovl47:120c); then, still inside 0d5c with the dialog drawn, the tutorial page:
    SCN 0x12e set and SCN byte 0x134 bit 0 clear -> bit 0 set, FILE.DAT (25, 0) through
    ovl61:168d (asm ovl47:11d5..1207; TurnCue "tutorial" after the HeroOffered)."""
    from .constants import turn as KT
    _names(state)
    offer = offer_check(state)
    if offer is None:
        return []
    if offer["city"] < 0:
        raise RuntimeError("no city at the capital for the turn-1 hero")
    female, name = pick_name(state)
    ev = E.HeroOffered({"player": state.current, "city": offer["city"], "price": offer["price"],
                        "name": name, "female": female, "free": turn(state) == 1})
    state.pending = ev
    out = [ev]
    b = KT.SCN_TUTORIAL_BYTE.value
    if state.flags.get(KT.SCN_TUTORIAL_FLAG.value, 0) and not state.flags.get(b, 0) & KT.TUT_OFFER_BIT.value:
        state.flags[b] = state.flags.get(b, 0) | KT.TUT_OFFER_BIT.value
        out.append(E.TurnCue({"kind": "tutorial", "file": KT.TUT_OFFER_FILE.value}))
    return out


def computer_offer(state) -> list:
    """The computer side's hero offer: accepted whenever it comes.
    Evidence: ovl68:019b -> ovl47:0000; when it returns 1, ovl47:0301 = ovl47:0c67 (name) then
    ovl47:031b with that name and sex."""
    _names(state)
    if turn(state) > 1 and not unverified_allowed() and _hook("ai_hero_city") is None:
        milestone, target, _, _ = HOOKS["ai_hero_city"]
        raise NotImplementedCommand(C.AcceptHero, milestone, target)
    offer = offer_check(state)
    if offer is None:
        return []
    if offer["city"] < 0:
        raise RuntimeError("no city at the capital for the turn-1 hero")
    female, name = pick_name(state)
    return create_hero(state, offer["city"], name, female, offer["price"])


def _answer(state):
    ev = state.pending
    if not isinstance(ev, E.HeroOffered):
        raise IllegalCommand("no hero offer pending")
    return ev


def accept_hero(state, cmd: C.AcceptHero) -> list:
    """Answer the offer: yes creates the hero with the drawn name, no declines (refused on
    turn 1, where only accept is enabled).
    Evidence: ovl47:127e (accept -> ovl47:031b(DS:44d2, DS:44d0)), ovl47:12af (decline: nothing),
    ovl47:120c (0x120 disabled when ovl61:225b() == 1)."""
    ev = _answer(state)
    if not cmd.yes:
        if ev.info["free"]:
            raise IllegalCommand("the turn-1 hero cannot be declined")
        state.pending = None
        return _resume(state, ev, [])
    state.pending = None
    return _resume(state, ev, create_hero(state, ev.info["city"], ev.info["name"],
                                          ev.info["female"], ev.info["price"]))


def _resume(state, ev, events) -> list:
    """The dialog's buttons go on with the human turn start: ovl68:04bd(1) (asm ovl47:12a7
    accept, 12c6 decline); `info["resume"]` is set by rules.turn for its offers."""
    if ev.info.get("resume") is None:
        return events
    from . import turn
    return events + turn.resume(state, ev.info["resume"])


def name_hero(state, cmd: C.NameHero) -> list:
    """Accept the offer with the name and sex the player set.  The name may be empty: Return in
    the editor copies its buffer even when it is "" (ovl56:0575) and accept then creates a hero
    named "".  The 15 is the buffer the dialog passes; typing stops at 14 characters (ovl56:
    param - 1) and at the box width, and only 0x20..0x7a are typed - editor rules of the UI.
    Evidence: ovl47:12ce edits DS:44d2 with at most 15 characters (ovl56:03a6), ovl47:12f9 sets
    DS:44d0 to 0 / 1; ovl47:127e then creates the hero; asm ovl56:0575 (strcpy on Return)."""
    ev = _answer(state)
    name = cmd.name
    if not isinstance(name, str) or not 0 <= len(name) <= K.NAME_MAX.value or "\0" in name:
        raise IllegalCommand("hero name must be 0 to %d characters" % K.NAME_MAX.value)
    try:
        name.encode(K.NAME_ENCODING.value)
    except UnicodeEncodeError:
        raise IllegalCommand("hero name is not representable in %s" % K.NAME_ENCODING.value) from None
    state.pending = None
    return _resume(state, ev, create_hero(state, ev.info["city"], name, int(bool(cmd.female)),
                                          ev.info["price"]))


def hero_square(state, ci: int) -> tuple[int, int]:
    """Where a new hero appears.
    Evidence: decomp ovl43:0bff(city, 1): the first of the city's squares (DS:0e54 / 0e5c order)
    holding < 8 armies; else 20 tries x, y = city + rnd(1,3,-2) each, until the map army bit
    0x10 is clear there; the last try is used even when it fails (ovl47:031b ignores the result)."""
    from .constants import city as KC
    c = state.cities[ci]
    for dx, dy in zip(KC.ROOM_DX.value, KC.ROOM_DY.value):
        if _count_at(state, c.x + dx, c.y + dy) < KC.SQUARE_FULL.value:
            return c.x + dx, c.y + dy
    x = y = 0
    for _ in range(K.HERO_PLACE_TRIES.value):
        x = c.x + state.rng.rnd(*K.HERO_PLACE_STEP.value)
        y = c.y + state.rng.rnd(*K.HERO_PLACE_STEP.value)
        if not state.world.flags[_flat(x, y)] & MAP_ARMY:
            break
    return x, y


def create_hero(state, ci: int, name: str, female: int, price: int) -> list:
    """Make the current side's new hero in city `ci`; from turn 2 pay `price` and add allies;
    on turn 1 the side's standard (item p) goes into the hero's hands.
    Evidence: asm ovl47:031b..04f0: first free slot of 40 (+0x543 == 0): name, used, female,
    level/exp byte 0; ovl43:0bff(city, 1); allocator 0b62:0309: x, y, type 0x1c, moves and
    allowance 14, strength 5, +9 = city, +0xa = slot, +0xb = 0; the square's owner nibble =
    SCN 0x110, army bit (0b62:02e2); ovl61:225b() > 1 -> ovl47:01fc; else item p: state 3,
    holder = the army's index; then ovl41:1244(p, 0, city, 0, name)."""
    p = state.current
    s = next((i for i, h in enumerate(state.heroes) if not h.used), len(state.heroes))
    if s >= len(state.heroes):
        raise RuntimeError("no free hero slot: the original writes past the 40 slots")
    h = state.heroes[s]
    h.name, h.used, h.female, h.level, h.exp = name, 1, int(female), 0, 0
    x, y = hero_square(state, ci)
    a = alloc_army(state)
    if a is None:
        raise RuntimeError("army table full: the original writes through a null pointer")
    a.x, a.y = x, y
    a.type_id = HERO_TYPE
    a.moves_left = a.allowance = K.HERO_MOVES.value
    a.strength = K.HERO_STRENGTH.value
    a.home_city = ci & 0xFF
    a.hero_slot = a.medals = s
    a.upkeep = 0
    i = _flat(x, y)
    state.world.flags[i] = (state.world.flags[i] & ~MAP_OWNER_MASK & 0xFF) | (p & MAP_OWNER_MASK) | MAP_ARMY
    events = [E.HeroJoined({"player": p, "army": a.id, "slot": s, "city": ci, "name": name,
                            "female": int(female), "price": price, "x": x, "y": y})]
    if turn(state) > 1:
        events += pay_and_allies(state, a, price)
    elif p < len(state.items):
        it = state.items[p]
        it.state, it.holder = int(ItemState.CARRIED), a.id
        events.append(E.ItemTaken({"item": p, "army": a.id, "standard": True}))
    news(state, p, K.NEWS_HERO.value, ci, 0, name)
    return events


def ally_type(state) -> int:
    """A random army type for allies.
    Evidence: asm ovl47:1a9b..1b05: n = types 0..27 with DS:45c8[6t] (w13) != 0; r = rnd(1,n,-1);
    the r-th such type; 25 when none is found."""
    kinds = [t for t in range(K.ALLY_TYPES.value) if _w13(state, t)]
    r = state.rng.rnd(1, len(kinds), K.ALLY_TYPE_ROLL_ADD.value)
    return kinds[r] if 0 <= r < len(kinds) else K.ALLY_FALLBACK.value


def _w13(state, t: int) -> int:
    try:
        return type_flag(state, t, "special")
    except KeyError:
        return 0


def place_ally(state, type_id: int, x: int, y: int):
    """Create one army of `type_id` for the current side at (x, y) or near it; returns it or None.
    Evidence: asm ovl34:12e6..1433: up to 10 squares: one with < 8 armies whose owner nibble is
    SCN 0x110, or empty, takes it; else x, y += rnd(1,3,-2) each and the count goes down (the
    tenth moved square is not tested).  The army (0b62:0309): x, y, type, owner, +6 = +7 = ARMYTYPE
    w3, +8 = w0 (low bytes, ovl44:14ac), +9 = +0xa = +0xb = 0; army bit and owner nibble set."""
    rec = state.army_type(type_id)
    tries = K.PLACE_TRIES.value
    while True:
        n = _count_at(state, x, y)
        nib = state.world.flags[_flat(x, y)] & MAP_OWNER_MASK
        if n < KM.STACK_MAX.value and (nib == state.current or n == 0):
            break
        x += state.rng.rnd(*K.PLACE_STEP.value)
        y += state.rng.rnd(*K.PLACE_STEP.value)
        tries -= 1
        if tries == 0:
            return None
    a = alloc_army(state)
    if a is None:
        raise RuntimeError("army table full: the original writes through a null pointer")
    a.x, a.y = x, y
    a.type_id = type_id
    a.owner = state.current
    a.allowance = a.moves_left = rec.moves & 0xFF
    a.strength = rec.strength & 0xFF
    a.home_city = a.hero_slot = a.medals = a.upkeep = 0
    i = _flat(x, y)
    state.world.flags[i] = ((state.world.flags[i] | MAP_ARMY) & ~MAP_OWNER_MASK & 0xFF) | (state.current & 0xF)
    return a


def allies(state, type_id: int, n: int, x: int, y: int) -> list:
    """n allies of one type around (x, y); one AlliesJoined event (army None where placement failed).
    Evidence: the ally loops of ovl47:01fc, ovl34:01ab (kind 5) and ovl01:1c02 (case 3) call
    ovl34:12e6 then 0b62:02e2 per ally."""
    placed = [place_ally(state, type_id, x, y) for _ in range(n)]
    return [E.AlliesJoined({"player": state.current, "type": type_id, "count": n,
                            "armies": [a.id for a in placed if a is not None], "x": x, "y": y})]


def pay_and_allies(state, hero, price: int) -> list:
    """Pay for a hired hero and add 1-3 allies at its square.
    Evidence: asm ovl47:01fc..0300: gold -= DS:1110 (word), DS:1110 = 0; nothing more on turn 1;
    t = ovl47:1a9b(); r = rnd(1,100,0): < 70 -> 1, < 95 -> 2, else 3; each ally by ovl34:12e6(t,
    hero x, y).  First the overview ovl63:0000(1, 0, NULL) at 020a (present point "overview";
    with the markers on, DS:2d25, and force 0 it draws nothing)."""
    present("overview", at="ovl47:020a", markers=1, force=0)
    add_gold(state, state.current, -price)
    if turn(state) == 1:
        return []
    t = ally_type(state)
    r = state.rng.rnd(*K.ALLY_COUNT_ROLL.value)
    n = next((c for lim, c in K.ALLY_COUNT_STEPS.value if r < lim), K.ALLY_COUNT_ELSE.value)
    return allies(state, t, n, hero.x, hero.y)


# ------------------------------------------------------------------------------- experience


def add_exp(state, army_id, n) -> list:
    """Experience + n for a hero (other armies: nothing), at most 60.
    Evidence: asm ovl47:04f1..0578: type 0x1c only; e = (byte >> 2 & 0x3f) + n; e >= 0x3c
    (unsigned) -> bits 2-7 = 60, else (e & 0x3f) << 2; the level bits are kept."""
    a = live(state, army_id)
    if a is None or a.type_id != HERO_TYPE:
        return []
    h = slot_of(state, a)
    e = (h.exp & 0x3F) + n
    h.exp = K.EXP_MAX.value if (e & 0xFFFF) >= K.EXP_MAX.value else e & 0x3F
    return [E.HeroExp({"army": a.id, "slot": s8(a.hero_slot), "gain": n, "exp": h.exp})]


def promote(state, army, group: int) -> list:
    """One level up: level + 1, strength + 1 (cap 9), allowance + 2.
    Evidence: asm ovl47:0672..0720: level bits = (level + 1) & 3; 0b62:0005(army, 1); +6 += 2
    (byte); the rest is the human's dialog (STRING `group`, index +6 for a heroine)."""
    h = slot_of(state, army)
    before = s8(army.strength)
    h.level = (h.level + 1) & 3
    add_strength(army, K.PROMOTE_STRENGTH.value)
    army.allowance = (army.allowance + K.PROMOTE_MOVES.value) & 0xFF
    return [E.HeroPromoted({"army": army.id, "slot": s8(army.hero_slot), "level": h.level,
                            "strength": s8(army.strength) - before, "moves": K.PROMOTE_MOVES.value,
                            "group": group, "female": h.female})]


def promote_all(state) -> list:
    """Start-of-turn level check for every hero of the current side: at most one level each.
    Evidence: asm ovl47:0579..0671: records 0x181-1..0 with type 0x1c and owner == SCN 0x110:
    level 0 with exp >= 15, level 1 with >= 30, level 2 with >= 60 -> ovl47:0672."""
    events = []
    for a in reversed(state.armies):
        if a.type_id != HERO_TYPE or s8(a.owner) != state.current:
            continue
        h = slot_of(state, a)
        for lvl, (need, (group, _)) in enumerate(zip(K.LEVEL_NEEDS.value, K.LEVEL_MSG.value)):
            if h.level == lvl and h.exp >= need:
                events += promote(state, a, group)
                break
    return events


# ------------------------------------------------------------------------------- death


def hero_died(state, army_id, x, y) -> list:
    """A hero dies at (x, y): its slot is freed and every item it carries falls there, lost on
    Water; an item whose index is the current side's number (that side's standard) also ends
    that side's vectoring to the standard.  The army record itself is freed by the caller.
    Evidence: asm ovl36:16cd..1835: slot +0x543 = 0; list ovl51:03d9 mode 2; state = 0 when
    there is an item and the terrain at (x, y) is Water (sound), else 1; holder 0, x, y; item ==
    SCN 0x110 -> ovl44:0410(-2) cities: +0x31 = 0, target (-1, -1).  The road bit 0x40 is not
    set, so a dropped standard is not 'planted' (ovl47:0b47).  The splash ovl58:023d at 173b is
    the present point "sound"."""
    from .bonuses import list_carried
    from .constants import city as KC
    a = state.armies[army_id]
    slot_of(state, a).used = 0
    items = list_carried(state, a)                # ovl36:16fd ovl51:03d9(2): the names into DS:483c
    lost = bool(items) and state.world.terrain(x, y) == Terrain.WATER
    if lost:
        present("sound", name="splash", at="ovl36:173b")     # ovl58:023d
    st = int(ItemState.NOT_IN_PLAY) if lost else int(ItemState.ON_MAP)
    for i in items:
        it = state.items[i]
        it.state, it.holder, it.x, it.y = st, 0, x, y
        if i == state.current:
            sx = KC.STANDARD_TARGET.value[0]
            for c in state.cities:
                if c.vectoring and s8(c.owner) == state.current and c.vector_to[0] == sx:
                    c.vectoring = 0
                    c.vector_to = KC.VECTOR_OFF_TARGET.value
    events = [E.HeroDied({"army": army_id, "owner": a.owner, "x": x, "y": y})]
    if items:
        events.append(E.ItemDropped({"items": items, "army": army_id, "x": x, "y": y, "lost": lost}))
    return events


# ------------------------------------------------------------------------------- items


def _own_hero(state, aid):
    a = live(state, aid)
    if a is None or a.type_id != HERO_TYPE or a.owner != state.current:
        raise IllegalCommand("army %r is not a hero of the current side" % (aid,))
    return a


def items_here(state, hero) -> list[int]:
    """The item dialog's list for a hero: carried items, then items lying on its square.
    Evidence: ovl51:03d9 mode 6 (asm ovl40:05b1 push 6; jump table ovl51:06fb -> 0425..052e): state 3 with holder = the army's index,
    then state 1 with x, y = the army's square, each in table order."""
    out = [i for i, it in enumerate(state.items) if it.state == ItemState.CARRIED and it.holder == hero.id]
    out += [i for i, it in enumerate(state.items)
            if it.state == ItemState.ON_MAP and (it.x, it.y) == (hero.x, hero.y)]
    return out


def take(state, cmd: C.TakeItem) -> list:
    """A hero of the current side picks up an item lying on its square.
    Evidence: ovl40 item dialog (heroes of SCN 0x110, ovl40:0000; list ovl51:03d9 mode 6) ->
    ovl40:0e70 -> ovl47:08c7: state 3, holder = the army's index; for items 0..7 (standards) the
    road bit 0x40 of the hero's square is cleared.  Closing the dialog (ovl40:0b2d) refreshes the
    income cache (ovl62:0372 at 0b30, not the upkeep one) and runs the quest check ovl01:1ded(3),
    both done here after every take."""
    hero = _own_hero(state, cmd.hero)
    i = cmd.item
    if not (isinstance(i, int) and 0 <= i < len(state.items)) or i not in items_here(state, hero) \
            or state.items[i].state != ItemState.ON_MAP:
        raise IllegalCommand("item %r is not lying on the hero's square" % (i,))
    it = state.items[i]
    it.state, it.holder = int(ItemState.CARRIED), hero.id
    if i < K.STANDARDS.value:
        state.world.roads[_flat(hero.x, hero.y)] &= ~ROAD_STANDARD & 0xFF
    events = [E.ItemTaken({"item": i, "army": hero.id})]
    refresh_income(state)                        # the dialog's close, asm ovl40:0b30 (ovl62:0372)
    return events + _quest_items(state)


def take_all(state, cmd: C.TakeAll) -> list:
    """The search result's Take (button 293 -> ovl34:186e): every item lying on the square of the
    selected hero (DS:5e5e) goes to it at once, in item-table order (ovl51:03d9 mode 3: state 1
    at the hero's square): holder = the hero's index, state 3 - the road bit 0x40 is *not*
    cleared (unlike `take`, ovl47:08c7); then the stack is selected again (as ovl34:1964,
    `rules.ruins._reselect`; the search already did that for the result's close, so here it runs
    a second time, after the items are taken, as in the EXE) and the item quest check
    ovl01:1ded(3, 0, 0, 0, 0) runs once; the income cache is not refreshed (no ovl62:0372 on
    this path).  One `ItemTaken` per item, in that order.
    Evidence: asm ovl34:186e..1963 (1875..18a3 index of DS:5e5e, 18b5 ovl51:03d9(3, x, y),
    18c1..18f1 +0x17 = index, +0x16 = 3, 1908..1939 0b62:007d / 5e5e / 0b62:09ec / ovl67:06eb,
    1959 ovl01:1ded(3))."""
    from .ruins import _reselect
    hero = _own_hero(state, cmd.hero)
    if cmd.hero != state.selection.hero:
        raise IllegalCommand("take all works on the selected hero (DS:5e5e)")
    x, y = hero.x, hero.y
    from .bonuses import list_lying
    taken = list_lying(state, x, y, K.ITEM_RECORDS.value)      # 18b5 ovl51:03d9(3, x, y)
    events = []
    for i in taken:
        it = state.items[i]
        it.state, it.holder = int(ItemState.CARRIED), hero.id
        events.append(E.ItemTaken({"item": i, "army": hero.id, "all": True}))
    events += _reselect(state, x, y)
    return events + _quest_items(state)


def drop(state, cmd: C.DropItem) -> list:
    """A hero of the current side drops an item it carries: lost on Water, else it lies on the
    hero's square.
    Evidence: ovl40:0d1e -> ovl47:0943: terrain at the army's square == 2 -> state 0 (sound);
    else state 1, holder 0, x, y = the army's square (the road bit 0x40 is not set); then the
    dialog's close ovl40:0b2d: the income cache (ovl62:0372 at 0b30) and the quest check
    ovl01:1ded(3)."""
    hero = _own_hero(state, cmd.hero)
    i = cmd.item
    if not (isinstance(i, int) and 0 <= i < len(state.items)) or state.items[i].state != ItemState.CARRIED \
            or state.items[i].holder != hero.id:
        raise IllegalCommand("the hero does not carry item %r" % (i,))
    it = state.items[i]
    lost = state.world.terrain(hero.x, hero.y) == K.DROP_DESTROY_TERRAIN.value
    if lost:
        it.state = int(ItemState.NOT_IN_PLAY)
    else:
        it.state, it.holder, it.x, it.y = int(ItemState.ON_MAP), 0, hero.x, hero.y
    events = [E.ItemDropped({"items": [i], "army": hero.id, "x": hero.x, "y": hero.y, "lost": lost})]
    refresh_income(state)                        # the dialog's close, asm ovl40:0b30 (ovl62:0372)
    return events + _quest_items(state)


def _quest_items(state) -> list:
    from . import quests
    return quests.check(state, K.QUEST_CHECK_ITEMS.value)[1]


def plant_flag(state, cmd: C.PlantFlag) -> list:
    """Plant the current side's standard (item p, carried by the hero) on the hero's square.
    Evidence: asm ovl47:09f7..0b46 (key 07be:01d7, hero DS:5e5e): nothing on Water, Shore, City
    or Site squares or where the road bit 0x40 is already set; list ovl51:03d9 mode 2; the item
    whose index == SCN 0x110: x, y = the hero's square, state 1, holder 0, road bit 0x40 set."""
    hero = _own_hero(state, cmd.hero)
    if hero.x < 0 or hero.y < 0:
        raise IllegalCommand("the hero is not on the map")
    t = state.world.terrain(hero.x, hero.y)
    i = _flat(hero.x, hero.y)
    if t in K.PLANT_REFUSED_TERRAIN.value or state.world.roads[i] & ROAD_STANDARD:
        raise IllegalCommand("the standard cannot be planted here")
    p = state.current
    from .bonuses import list_carried
    if p not in list_carried(state, hero):        # ovl47:0a89, written also when it is not carried
        raise IllegalCommand("the hero does not carry the side's standard")
    it = state.items[p]
    it.x, it.y, it.state, it.holder = hero.x, hero.y, int(ItemState.ON_MAP), 0
    state.world.roads[i] |= ROAD_STANDARD
    return [E.ItemDropped({"items": [p], "army": hero.id, "x": hero.x, "y": hero.y,
                           "lost": False, "planted": True})]


# ------------------------------------------------------------------------------- medals


def _medal_stack(state) -> list:
    """DS:5e3e[0..7] as ovl36:2274 reads it: the moving group (zero entries skipped)."""
    sel = state.selection
    return [a for a in (live(state, i) for i in sel.moving[:KM.STACK_MAX.value]) if a is not None]


def award_medal(state, battle) -> list:
    """After a battle: maybe one unit of the selected stack gets a medal.  The caller has made
    the winning stack the selection (rules.combat.attack, asm ovl36:045b..0490).
    Evidence: asm ovl36:0498 calls ovl36:2274(result).  ovl36:2274: over DS:5e3e[0..7]
    count units that are not heroes with w13 == 0 (eligible) and note any aboard (0x1000);
    m = own armies (owner SCN 0x110) not heroes, w13 == 0, medals (+0xa) > 0; chance =
    max(12, 40 - 5m); real battle = DS:42c4 >= 2 and DS:42c5 >= 2, or turn < 20 and DS:42c5 >= 1
    and DS:42a4 >= 4; award only when nothing is aboard, result == 1, real, eligible > 0,
    rnd(1,100,0) < chance and DS:5e5e (the stack's hero) is set; k = rnd(1,eligible,-1) picks
    the k-th eligible unit; with < 4 medals: +1 medal and strength >= 15 ? allowance + 1 :
    strength + 1 (cap 9).  DS:5e5e is only tested for null (asm 23e3): after a computer battle
    it still points at a hero that died, so the test is `selection.hero >= 0`, not `live`.
    Then (asm 24a5..24ba) only when SCN 0xd0 + 2 * DS:41fa (the battle's attacking side,
    `battle_work.attacker`) is 0 (human) the pop-up is shown, and it rolls its two lines on the
    game's dice: (158, -1) at 2524 and (160, -1) at 2581 (ovl59:04f0 -> 02bf(1, n, -1)), kept
    in `MedalAwarded.info["text_rolls"]` = (r1, r2)."""
    events: list = []
    s = battle.setup
    stack = _medal_stack(state)
    eligible = [a for a in stack if a.type_id != HERO_TYPE and not _w13(state, a.type_id)]
    aboard = any(a.flags & KM.ABOARD.value for a in stack)
    m = sum(1 for a in state.armies if a.owner == state.current and a.type_id != HERO_TYPE
            and not _w13(state, a.type_id) and s8(a.medals) > 0)
    chance = max(K.MEDAL_FLOOR.value, K.MEDAL_BASE.value - K.MEDAL_STEP.value * m)
    na, nd = len(s.attackers), len(s.defenders)
    real = na >= K.MEDAL_REAL_SIDE.value and nd >= K.MEDAL_REAL_SIDE.value
    if not real and turn(state) < K.MEDAL_EARLY_TURN.value and nd >= 1 \
            and s8(s.d_strength[0]) >= K.MEDAL_EARLY_STRENGTH.value:
        real = True
    result = K.MEDAL_WIN.value if battle.attacker_won else 0
    if aboard or result != K.MEDAL_WIN.value or not real or not eligible:
        return events
    if state.rng.rnd(*K.MEDAL_ROLL.value) >= chance:
        return events
    if state.selection.hero < 0:                 # asm 23e3: DS:5e5e != 0 only (a dead hero counts)
        return events
    k = state.rng.rnd(1, len(eligible), K.MEDAL_PICK_ADD.value)
    a = eligible[k]
    if s8(a.medals) >= K.MEDAL_MAX.value:
        return events
    a.medals = (a.medals + 1) & 0xFF
    if s8(a.strength) >= K.MEDAL_MOVE_FROM.value:
        a.allowance = (a.allowance + 1) & 0xFF
        gain = "moves"
    else:
        add_strength(a, 1)
        gain = "strength"
    info = {"army": a.id, "medals": a.medals, "gain": gain}
    att = s8(state.battle_work.attacker)
    if 0 <= att < len(state.players) and state.players[att].control == K.MEDAL_TEXT_HUMAN.value:
        n158, n160 = K.MEDAL_TEXT_COUNTS.value
        r1 = state.rng.rnd(1, n158, K.MEDAL_PICK_ADD.value)     # asm 2524: (158, -1)
        r2 = state.rng.rnd(1, n160, K.MEDAL_PICK_ADD.value)     # asm 2581: (160, -1)
        info["text_rolls"] = (r1, r2)
    events.append(E.MedalAwarded(info))
    return events
