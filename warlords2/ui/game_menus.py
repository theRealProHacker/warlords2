"""The in-game menu refresh ovl61:0519 (called at the end of ovl61:0174, ovl61:040d).

Evidence (asm ovl61:0519..0929): 1372:0eab(0, 1) .. 1372:0eab(7, 1) switch every item of
every menu on (0eab(0, on) loops over all menus, 1372:0e17 with item 0 sets the mask to
0xffffff); then 1372:0ef8(id, 0) switches off:
* 502 Load Game when ovl49:0e25 says no saved game, 504 Load Map when ovl49:0e42 says no
  saved map (`menubar.saved_games` / `saved_maps`);
* 503 Save Map when SCN 0x120 == 0 or SCN 0x130 != 0;
* 508 Disband without a selected stack (DS:5e62); 519 Signpost without one or when the
  terrain SCN 0x710[tile] of its square is not 9 (the sign);
* 509 Resign when the side owns no city (DS:5dea[SCN 0x110] == 0);
* 515 Diplomacy report with Diplomacy off (SCN 0x11c == 0);
* 517 Hero Inspect and 520 Hero Levels when no army record of the side has type 0x1c (the
  scan 05ae..05ea runs over all DS:0181 records and tests only +4 / +5);
* 518 Plant Flag unless the selected army is a hero (+4 == 0x1c), item SCN 0x110 (the side's
  standard, 2c04:0ce9 + 0x1d p) is carried (+0x16 == 3) by that army (+0x17), the road-layer
  byte of its square has no standard (bit 0x40) and its terrain is not 10, 11, 2 or 3;
* 521 Hero Search unless there is a selected stack on a site square (the first site record
  at its x, y; terrain 11) that is not searched yet (map word bit 0x4000) and the army is a
  hero or the site's +0x18 is 1;
* 524 Build, 526 Production, 527 Vectoring when the side owns no city (DS:5dea <= 0);
* 529 Stack without a selected stack;
* 530..533 History (city, events, gold, winners) on turn 1 (ovl61:225b = max(SCN 0x135, 1));
* 535 End Turn while SCN 0x15b is set.
Without a selection the square is (0, 0); it only matters for items that need one.  The
title colours change only when 1372:132f repaints them (`menubar.TitleBar.repaint`).
"""
from __future__ import annotations

from ..model.ids import HERO_TYPE, MAP_EXPLORED, MAP_W, ROAD_STANDARD, ItemState, Terrain
from . import registry
from .menubar import saved_games, saved_maps

SCN_SAVE_MAP, SCN_130, SCN_15B = 0x120, 0x130, 0x15B
SIGN, TEMPLE_KIND = int(Terrain.TOWER), 1                  # 0726 cmp di, 9; site +0x18 == 1
NO_FLAG_TERRAIN = (Terrain.CITY, Terrain.SITE, Terrain.WATER, Terrain.SHORE)   # 080d..081f
HISTORY = ("history_city", "history_events", "history_gold", "history_winners")


def menu_states(app, state, lead) -> dict[str, bool]:
    """name -> False for every menu action ovl61:0519 switches off (all others on)."""
    from ..rules import economy
    p = state.current
    w = state.world
    x, y = (lead.x, lead.y) if lead is not None else (0, 0)
    i = y * MAP_W + x
    terrain = w.terrain_of_tile[w.tiles[i] & 0xFF]
    sel = lead is not None
    hero = sel and lead.type_id == HERO_TYPE
    cities = economy.cached_cities(state, p)                 # DS:5dea (0745 / 0886)
    has_hero = any(a.type_id == HERO_TYPE and a.owner == p for a in state.armies)
    site = next((s for s in state.sites if (s.x, s.y) == (x, y)), None) if terrain == Terrain.SITE else None
    std = state.items[p] if p < len(state.items) else None
    off = {
        "load_game": not saved_games(app),
        "load_map": not saved_maps(app),
        "save_map": state.flags.get(SCN_SAVE_MAP, 0) == 0 or state.flags.get(SCN_130, 0) != 0,
        "disband": not sel,
        "signpost": not sel or terrain != SIGN,
        "resign": cities == 0,
        "report_diplomacy": not state.options.diplomacy,           # SCN 0x11c
        "hero_inspect": not has_hero,
        "hero_levels": not has_hero,
        "plant_flag": not (hero and std is not None and std.state == ItemState.CARRIED
                           and std.holder == lead.id and not w.roads[i] & ROAD_STANDARD
                           and terrain not in NO_FLAG_TERRAIN),
        "hero_search": not (site is not None and sel and (hero or site.kind == TEMPLE_KIND)
                            and not w.flags[i] & MAP_EXPLORED),
        "build": cities <= 0, "production": cities <= 0, "vectoring": cities <= 0,
        "stack": not sel,
        "end_turn": state.flags.get(SCN_15B, 0) != 0,
    }
    turn1 = max(state.turn, 1) == 1
    off.update({h: turn1 for h in HISTORY})
    return {name: not o for name, o in off.items()}


def refresh_menus(bar, app, state, lead) -> None:
    """ovl61:0519 on the menu bar's host masks (`menubar.MenuBar`)."""
    bar.enable_menu(None, True)
    for name, on in menu_states(app, state, lead).items():
        if not on:
            bar.enable(registry.MENU_ID[name], False)
