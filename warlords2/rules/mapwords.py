"""Map-word bookkeeping shared by several rules: the rebuild of owner nibbles and army bits.

Each main-loop pass starts with ovl35:09f2(SCN 0x110) (ovl61:217d, `rules.ruins.site_tiles`), then
ovl62:0000 (ovl61:2183, `refresh_map`), then the cost map 0555:0d9e (ovl61:2194), also on the
pass before the first map frame.  ovl62:0000 also runs before the side's turn starts in ovl68
and inside the battle path (ovl36:02ee, after-battle ovl36:0a6b, load ovl49).
`rules.setup.new_game` calls neither: the original reaches them only through the main loop, so
the turn sequence (M8a) calls `rules.ruins.site_tiles`, `refresh_map` and then
`rules.pathfinding.rebuild_cost_map` at the top of each pass; engine tests do the same.
"""
from __future__ import annotations

from ..model.ids import MAP_ARMY, MAP_FORTIFIED, MAP_H, MAP_OWNER_MASK, MAP_W, NO_OWNER
from .bonuses import s8
from .constants import combat as K

def refresh_map(state) -> None:
    """Recompute owner nibbles, army bits and stale fortify bits of the whole map.
    Evidence: ovl62:0000 (decomp 0824f0): every square army bit cleared and owner 0xf; armies with
    y >= 0 from the top table index down set bit 0x10 and their owner (so the lowest index wins);
    cities whose owner is not 0xf set their 2x2 owner; bit 0x20 is cleared where no army stands.
    `rules.ruins.site_tiles` runs before it in the main loop (ovl61:217d)."""
    f = state.world.flags
    for i in range(MAP_W * MAP_H):
        f[i] = (f[i] & ~MAP_ARMY & 0xF0) | NO_OWNER
    for a in reversed(state.armies):
        if a.y >= 0:
            i = a.y * MAP_W + a.x
            f[i] = (f[i] & 0xF0) | MAP_ARMY | (a.owner & MAP_OWNER_MASK)
    for c in reversed(state.cities):
        if s8(c.owner) != NO_OWNER:
            for dx, dy in zip(K.CITY_TILE_DX.value, K.CITY_TILE_DY.value):
                i = (c.y + dy) * MAP_W + c.x + dx
                f[i] = (f[i] & 0xF0) | (c.owner & MAP_OWNER_MASK)
    for i in range(MAP_W * MAP_H):
        if f[i] & MAP_FORTIFIED and not f[i] & MAP_ARMY:
            f[i] &= ~MAP_FORTIFIED


def army_bits(state) -> None:
    """The map part of ovl63:158d (the army markers of a map page): clear bit 0x10 on every
    square, then set it on the square of every army record with x >= 0 and y >= 0 (any owner,
    table order; the drawing filters of the arguments do not touch the bits).  With Hidden Map
    (SCN 0x124), a computer side to move (SCN 0xd0[SCN 0x110] != 0) and SCN 0x159 == 0 the
    routine returns before it.  Callers: the quest page ovl01:0320 for quest types 2 and 3
    (ovl01:0845, `rules.quests.quest_page`) and Report > Armies ovl42:0143 (ovl42:0160, case
    DS:0df6 == 0).  Unlike ovl62:0000 (`refresh_map`) owner nibbles and bit 0x20 stay.
    Evidence: asm ovl63:158d..1816 (159a..15c5 gate, 15fb..1625 clear 0xef over 112 x 156,
    1627..1810 armies 0..SCN 0x181 - 1: 1656 / 165f x, y >= 0, 1675 bit already set -> next,
    1698 or 0x10)."""
    from .constants import heroes as KH
    from ..model.ids import Control
    # SCN 0x124 is GameOptions.hidden_map (KH.ARMY_BITS_SKIP_HIDDEN)
    if (state.options.hidden_map
            and state.players[state.current].control != Control.HUMAN
            and not state.flags.get(KH.ARMY_BITS_SKIP_UNLESS.value, 0)):
        return
    f = state.world.flags
    for i in range(MAP_W * MAP_H):
        f[i] &= ~MAP_ARMY & 0xFF
    for a in state.armies:
        if a.x >= 0 and a.y >= 0:
            f[a.y * MAP_W + a.x] |= MAP_ARMY
