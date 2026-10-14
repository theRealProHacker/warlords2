"""Battle strength pipeline: battle class, item bonuses, side totals, unit strength.

All of it is the battle set-up `ovl38:008b` (L 0x6a6ab) and its helpers ovl38:0000 (class),
ovl38:0d1a (battle items) and ovl38:0d71 (command items), re-read from the decompilation
(out/rea/decomp/06a6ab.c, 06a620.c, 06b33a.c, 06b391.c) and the listing out/asm/ovl38.asm
(EL §3.3).  The fight order and the per-battle lists are in rules/combat.py.

Byte arithmetic: the EXE keeps unit strengths in signed bytes (DS:429c / DS:42a4) and adds to
them byte-wise, so `s8` wraps each sum as the EXE does; side totals are 16-bit words.
"""
from __future__ import annotations

from dataclasses import dataclass

from ..model.ids import HERO_TYPE, MAP_FORTIFIED, MAP_W, NO_OWNER, ItemState, ItemType
from ..model.state import SCN_BONUS_CAP
from .constants import combat as K

ABOARD_FLAG = 0x1000              # army +0xc "aboard" (EL §3.1, §5.1)


def s8(v: int) -> int:
    """Wrap to a signed byte.
    Evidence: unit strengths are bytes at DS:429c/42a4 compared signed (asm ovl36:08ed, 0901)."""
    return ((v + 0x80) & 0xFF) - 0x80


def cdiv(a: int, b: int) -> int:
    """C integer division (truncates towards zero).
    Evidence: Borland `idiv` as used for the city-bonus halving (decomp 06a6ab)."""
    q = abs(a) // abs(b)
    return q if (a >= 0) == (b > 0) else -q


def battle_class(state, x: int, y: int) -> int:
    """Terrain class of the battle square: 0 city, 1 open, 2 woods, 3 hills.
    Evidence: asm ovl38:0000..007b (EL §3.3): map bit 0x2000 -> 0, else the jump table at
    ovl38:007b on the SCN 0x710 terrain type (Forest 2, Hills/Mountains 3, City/Site 0, else 1)."""
    if state.world.flags[y * MAP_W + x] & MAP_FORTIFIED:
        return K.BATTLE_CLASS_FORTIFIED.value
    t = int(state.world.terrain(x, y))
    return K.BATTLE_CLASS_BY_TERRAIN.value.get(t, K.BATTLE_CLASS_DEFAULT.value)


def carried_items(state, army) -> list[int]:
    """Indices of the items the army carries, in item-table order.
    Evidence: ovl51:03d9 mode 2 (asm ovl51:0531..05b9): items 0..21 with state (+0x16) == 3 and
    holder (+0x17) == the army's table index."""
    return [i for i, it in enumerate(state.items)
            if it.state == ItemState.CARRIED and it.holder == army.id]


def battle_items(state, army) -> int:
    """Sum of the values of carried type-1 (battle) items.
    Evidence: ovl38:0d1a (decomp 06b33a): item +0x14 == 1 -> += signed byte +0x15."""
    return sum(s8(state.items[i].value) for i in carried_items(state, army)
               if state.items[i].type == ItemType.BATTLE)


def command_items(state, army) -> int:
    """Sum of carried type-2 (command) item values plus 1 per type-8 item (standard).
    Evidence: ovl38:0d71 (decomp 06b391)."""
    n = 0
    for i in carried_items(state, army):
        it = state.items[i]
        if it.type == ItemType.COMMAND:
            n += s8(it.value)
        if it.type == ItemType.STANDARD:
            n += 1
    return n


@dataclass
class SideBonus:
    """What one side contributes to the totals (per-side loop of ovl38:008b)."""
    hero_best: int        # best min(9, hero strength + battle items), 0 without heroes
    hero_bonus: int       # HERO_TABLE[hero_best] + sum of command items
    stack_bonus: int      # highest w[9 + class]
    enemy_mod: int        # min(0, w14 of every unit with w14 != 0), applied to the OTHER side
    cancel_city: bool     # some unit has w15 == 1 (only used for side A)
    cancel_hero: bool     # w15 == 2: cancels the other side's hero bonus
    cancel_stack: bool    # w15 == 3: cancels the other side's stack bonus


def side_bonus(state, armies, c: int) -> SideBonus:
    """Hero bonus, highest stack bonus, enemy modifier and cancel flags of one side.
    Evidence: asm ovl38:073b..0867 (side A) / 0876..0981 (side B), decomp 06a6ab: the hero best is
    raised only when a hero's strength + battle items exceeds it (cap 9); the stack bonus is the
    maximum of the nonzero w[9+c] starting at 0; the enemy modifier is the minimum of the nonzero
    w14 starting at 0 (so positive w14 never counts); w15 1/2/3 set the cancel flags."""
    best = 0
    cmd = 0
    stack = 0
    enemy = 0
    flags = set()
    for a in armies:
        t = state.army_type(a.type_id)
        if a.type_id == HERO_TYPE:
            v = s8(a.strength) + battle_items(state, a)
            if v > best:
                best = min(v, K.HERO_BEST_CAP.value)
        flags.add(t.cancel_mode)
        if t.enemy_stack_mod != 0:
            enemy = min(enemy, t.enemy_stack_mod)
        w = _stack_word(t, c)
        if w != 0:
            stack = max(stack, w)
        if a.type_id == HERO_TYPE:
            cmd += command_items(state, a)
    return SideBonus(best, cmd + K.HERO_TABLE.value[best], stack, enemy,
                     K.CANCEL_CITY.value in flags, K.CANCEL_HERO.value in flags,
                     K.CANCEL_STACK.value in flags)


def city_bonus(state, x: int, y: int, c: int, first_tile: tuple, city: int, owner: int,
               cancelled: bool) -> int:
    """Defender's city/defence bonus.
    Evidence: decomp 06a6ab (EL §3.3): only for class 0 and no attacker w15 == 1; 1 if the first
    battle tile (city top-left, else the target) has bit 0x2000, else 2 if the target is terrain
    11, else the city's defence byte (+0x14); halved (C division) when the owner nibble is 0xf."""
    if cancelled or c != 0:
        return 0
    fx, fy = first_tile
    if state.world.flags[fy * MAP_W + fx] & MAP_FORTIFIED:
        b = K.FORTIFIED_BONUS.value
    elif state.world.terrain(x, y) == K.SITE_TERRAIN.value:
        b = K.SITE_BONUS.value
    else:
        if city < 0:
            raise ValueError("battle class 0 without fortify bit, site or city at (%d, %d)" % (x, y))
        b = s8(state.cities[city].defence)
    if owner == NO_OWNER:
        b = cdiv(b, K.NO_OWNER_DIVISOR.value)
    return b


def side_total(state, own: SideBonus, other: SideBonus, city: int = 0) -> int:
    """Bonus added to every unit of a side.
    Evidence: decomp 06a6ab (EL §3.3): (hero bonus unless the other side has w15 == 2) + (stack
    bonus unless the other side has w15 == 3) + city bonus (defender; already 0 when cancelled),
    capped at SCN word 0x112 (signed compare), then the other side's enemy modifier is added."""
    t = 0
    if not other.cancel_hero:
        t = own.hero_bonus
    if not other.cancel_stack:
        t += own.stack_bonus
    t += city
    cap = state.flags[SCN_BONUS_CAP]
    if cap < t:
        t = cap
    return t + other.enemy_mod


def unit_strength(state, army, total: int, c: int, terrain: int) -> tuple[int, bool]:
    """Battle strength of one unit and whether it fights as aboard.
    Evidence: decomp 06a6ab per-unit loops (EL §3.3): aboard (flag 0x1000) on terrain 2/3 -> 4,
    no bonuses; else signed byte s = strength (+8) + total, + battle items for a hero, + own
    w[5+c], then values >= 16 become 15 (no lower bound here)."""
    if army.flags & ABOARD_FLAG and terrain in K.ABOARD_TERRAIN.value:
        return K.ABOARD_STRENGTH.value, True
    t = state.army_type(army.type_id)
    s = s8(army.strength + s8(total))
    if army.type_id == HERO_TYPE:
        s = s8(s + s8(battle_items(state, army)))
    s = s8(s + s8(_own_word(t, c)))
    if s >= K.UNIT_CAP.value + 1:
        s = K.UNIT_CAP.value
    return s, False


def _own_word(t, c: int) -> int:
    return (t.str_bonus_city, t.str_bonus_open, t.str_bonus_woods, t.str_bonus_hills)[c]


def _stack_word(t, c: int) -> int:
    return (t.stack_bonus_city, t.stack_bonus_open, t.stack_bonus_woods, t.stack_bonus_hills)[c]

