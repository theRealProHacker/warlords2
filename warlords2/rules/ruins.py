"""Sites: the Search command, ruins and their guardians, temples, sages, the sites' map tiles.

Sources (re-read by M7a from out/asm/ and out/rea/decomp/; EL = docs/research/exe_logic.md §5.4):

* Search                 ovl34:0000 (L 0x65130)
* ruin search            ovl34:01ab (L 0x652db), guardian ovl34:07ad, allies ovl34:12e6
* result dialog          ovl34:1812; OK 0x124 -> ovl34:1964, take 0x125 -> ovl34:186e
* temple                 menu ovl01:0000 (bless 0x148 -> ovl01:0132, quest 0x149 -> ovl01:011b),
                         blessing ovl34:08a1
* sage                   ovl34:0aa0, list ovl34:1610, menu ovl34:146f; show 0x117 -> ovl34:0bf5 ->
                         list pick -> ovl34:0e85, gem 0x118 -> ovl34:0b1a, map 0x119 -> ovl34:0c50,
                         then a click on the overview map (res_0726:036f) -> ovl34:0cd6
* site map tiles         ovl35:09f2

The Search command acts on the selected stack (DS:5e62 leader, DS:5e5e hero); the group it
names is made the selection first, as when the player presses the key.  The computer's sage
choice (ovl26:0080) belongs to the AI and goes through `HOOKS`.
"""
from __future__ import annotations

import importlib
import logging

from ..model import commands as C
from ..model import events as E
from ..model.ids import (HERO_TYPE, MAP_EXPLORED, MAP_H, MAP_W, Control, ItemState, SiteKind, Terrain)
from .bonuses import battle_items, s8
from .constants import heroes as K
from .constants import unverified_allowed
from .economy import add_gold
from .engine import IllegalCommand, NotImplementedCommand
from . import heroes as H
from .visibility import reveal

log = logging.getLogger(__name__)

# name -> (milestone, "module:function", what it must do, EXE address)
HOOKS = {
    "ai_sage": ("M8b4", "warlords2.ai.phases.quick_attack:sage",
                "f(state, site) -> list[Event]: the computer side's choice at a sage (gem, or the "
                "map view of an area chosen from its AI tables)", "ovl26:0080 from ovl34:015a"),
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


def _require(cmd_cls, name) -> None:
    if not unverified_allowed() and _hook(name) is None:
        milestone, target, _, _ = HOOKS[name]
        raise NotImplementedCommand(cmd_cls, milestone, target)


def _call(name, default, *args):
    f = _hook(name)
    if f is None:
        milestone, target, _, _ = HOOKS[name]
        log.warning("site step %s (%s, %s) not implemented; skipped", name, target, milestone)
        return default
    return f(*args)


# ------------------------------------------------------------------------------- selection


def _select(state, group) -> tuple:
    """Make `group` the selection (rules.selection.adopt); returns (leader, DS:5e5e's record or
    None).  The key 07be:0279 runs ovl34:0000 on DS:5e5e as stored, so a group that already
    is the selection keeps it (after a map select that is ovl67:0955's hero of the lowest
    slot, after a palette apply 0529's); a group that is not stands for a new select and gets
    the hero as 0c8c:0529 sets it (the leader if a hero, else the first hero in slot order).
    Evidence: asm 07be:0279 (no 0529 before ovl34:0000), ovl34:009b (DS:5e5e read),
    0c8c:0566..0604, ovl67:096c..09e0 (slots 8..0, the last hero found wins)."""
    from .movement import _record
    from .selection import _check_group, adopt
    members = _check_group(state, tuple(group))
    sel = state.selection
    before = (sel.selected, list(sel.moving))
    adopt(state, [a.id for a in members])
    lead = H.live(state, sel.selected)
    if (sel.selected, sel.moving) != before:
        ids = sel.moving if sel.group else [sel.selected]          # DS:2bda as stored
        group_ = [a for a in (H.live(state, i) for i in ids) if a is not None]
        hero = lead if lead is not None and lead.type_id == HERO_TYPE else \
            next((a for a in group_ if a.type_id == HERO_TYPE), None)
        sel.hero = hero.id if hero is not None else -1
    return lead, _record(state, sel.hero)


def _members(state) -> list:
    """The stack the blessing walks: 5e3e[0..7] when DS:2bda (the stored word) is set, else
    5e62 alone."""
    sel = state.selection
    ids = sel.moving if sel.group else [sel.selected]
    return [a for a in (H.live(state, i) for i in ids) if a is not None]


def _reselect(state, x: int, y: int) -> list:
    """ovl34:1964 / 186e after a human closes the search result: DS:5e62 = the hero, or the first
    army of the search square (0b62:007d); if the square holds armies, ovl67:06eb."""
    from .selection import select_army_stack
    lst = H.armies_at(state, x, y)
    first = H.live(state, state.selection.hero) or (lst[0] if lst else None)
    if lst and first is not None:
        return select_army_stack(state, first)
    return []


def _site_here(state, x: int, y: int) -> int:
    """ovl34:0000 (0021..0081): terrain 11 and a site record at (x, y) (ovl62:04b5), else -1."""
    if state.world.terrain(x, y) != Terrain.SITE:
        return -1
    return state.site_at(x, y)


# ------------------------------------------------------------------------------- Search


def search(state, cmd: C.Search) -> list:
    """Search with the selected stack on a site square: the group is made the selection, then
    ovl34:0000 (`search_selection`).  Refused (IllegalCommand) where the original does
    nothing: no moves left, no site record on a terrain 11 square, no hero away from a temple,
    a hero on a searched site.
    Evidence: asm ovl34:0017 (moves), 0073..0081 (site record), 00b3..00ce (no hero), 00ef..00fc
    (searched bit); key 07be:0279 -> ovl34:0000."""
    lead, hero = _select(state, cmd.group)
    if lead is None or s8(lead.moves_left) < K.SITE_MOVES_NEEDED.value:
        raise IllegalCommand("the stack has no movement left")
    si = _site_here(state, lead.x, lead.y)
    if si < 0:
        raise IllegalCommand("nothing to search here")
    if hero is None and state.sites[si].kind != SiteKind.TEMPLE:
        raise IllegalCommand("only a hero can search here")
    if hero is not None and state.world.flags[lead.y * MAP_W + lead.x] & MAP_EXPLORED:
        raise IllegalCommand("this site has been searched")
    return search_selection(state, C.Search)


def _computer_now(state) -> bool:
    """ovl25:09ab(): SCN 0x0d0[0x110] == 1 or DS:0836 != 0 (`ai.state.is_computer_now`)."""
    return state.players[state.current].control == Control.COMPUTER or state.ai.turn_active != 0


def search_selection(state, cmd_cls=C.Search) -> list:
    """ovl34:0000, the Search command, on the current selection as it is (DS:5e62 leader, DS:5e5e
    hero, read as the pointers they are: a freed record is not null): no leader, or its moves
    left (signed) <= 0 -> nothing.  Terrain 11 with a site record on the leader's square
    (ovl62:04b5) -> that site; terrain 11 without one counts as not a site.  Without a hero: a
    temple blesses the stack (ovl34:08a1), anything else nothing.  With a hero: not a site, or
    the map's searched bit 0x4000 set -> nothing; a sage: hero + 3 exp (ovl47:04f1), news (6,
    0x65), the computer's sage choice ovl26:0080 (HOOKS ai_sage; a human side the sage dialog,
    SageOffered pending), searched bit; a temple: the blessing for a computer side (ovl25:09ab),
    the temple menu for a human (TempleChoice answers it); any other kind: the ruin search
    ovl34:01ab.  Used by `search` (the player's command) and the AI (ovl22:15c3, ovl20:12eb).
    The sage hook is required for a computer side (NotImplementedCommand of `cmd_cls` in strict
    mode before anything changes, logged and skipped with --allow-unverified).  Not written:
    DS:412a / 4128, the leader's square that 0000 stores at 002a / 0033; their readers are human
    paths only (ovl34:1610 from the human sage dialog 0aa0, ovl34:1964 from res_07be:08ec, and
    ovl34:0e85 at 0f73..10c9, which no call in the listing reaches).
    Evidence: asm ovl34:0000..01aa (0008 DS:5e62, 0017 +7 jg 0, 0021..005f square / terrain,
    006b terrain 0xb, 0073 ovl62:04b5, 0081 none -> 7, 009b DS:5e5e, 00b3..00ce no hero:
    terrain / kind 1 / 08a1, 00d5 terrain, 00ef..00fc 0x40, 0104 kind 3: 0112 ovl47:04f1(hero,
    3), 013c ovl41:1244, 0144 ovl25:09ab, 0152 0aa0 / 015a ovl26:0080, 0171 |= 0x40; 017c kind 1:
    0183 09ab -> 00c9 08a1, else ovl01:0000; 01a1 01ab(site, x, y))."""
    from .movement import _record
    sel = state.selection
    lead = _record(state, sel.selected)
    if lead is None or s8(lead.moves_left) < K.SITE_MOVES_NEEDED.value:
        return []
    x, y = lead.x, lead.y
    si = _site_here(state, x, y)
    hero = _record(state, sel.hero)
    if hero is None:
        if si < 0 or state.sites[si].kind != SiteKind.TEMPLE:
            return []
        return bless(state, si)
    if si < 0:
        return []
    idx = y * MAP_W + x
    if state.world.flags[idx] & MAP_EXPLORED:
        return []
    site = state.sites[si]
    computer = _computer_now(state)
    if site.kind == SiteKind.SAGE:
        if computer:
            _require(cmd_cls, "ai_sage")                 # strict: before anything changes
        events = H.add_exp(state, hero.id, K.EXP_SAGE.value)
        H.news(state, state.current, K.NEWS_SITE.value, K.NEWS_SAGE.value, 0, H.hero_name(state, hero))
        if computer:
            events += _call("ai_sage", [], state, si)
        else:
            events += sage(state, si, x, y)
        state.world.flags[idx] |= MAP_EXPLORED
        return [E.SiteSearched({"site": si, "kind": int(site.kind), "hero": hero.id})] + events
    if site.kind == SiteKind.TEMPLE:
        if computer:
            return bless(state, si)
        return [E.SiteSearched({"site": si, "kind": int(site.kind), "hero": hero.id, "temple_menu": True})]
    return ruin_search(state, si, x, y)


def guardian_kills(state, site, hero) -> bool:
    """The guardian fight: True when the hero dies.
    Evidence: decomp ovl34:07ad: B = signed sum of the hero's type-1 item values (ovl51:03d9 mode
    2), S = armies of any owner on the hero's square (records 0x181-1..0), H = hero +8, M = the
    guardian's strength word 2c04:1007 + 2t; dies when 90 + 3S + 5(H + B - M) < rnd(1,100,0)."""
    base, per_army, per_point = K.RUIN_SURVIVE.value
    s = sum(1 for a in state.armies if (a.x, a.y) == (hero.x, hero.y))
    m = state.monsters[site.guardian_or_ally].strength if site.guardian_or_ally < len(state.monsters) else 0
    r = state.rng.rnd(*K.RUIN_ROLL.value)
    return s * per_army + (s8(hero.strength) + battle_items(state, hero) - m) * per_point + base < r


def _stat(state, p: int, off: int) -> None:
    """inc word 2c04:off + p*0x5a (the side's statistics record, kept in state.flags as SCN words)."""
    _, size = K.STAT_RECORD.value
    k = off + p * size
    state.flags[k] = (state.flags.get(k, 0) + 1) & 0xFFFF


def ruin_search(state, si: int, x: int, y: int) -> list:
    """A hero searches a ruin (site kinds 2, 4, 5; kind 0 gives only the experience).
    Evidence: decomp/asm ovl34:01ab..07ac: hero +3 exp; kinds other than 5 with a guardian
    (+0x1a != 0) fight it (ovl34:07ad): a dead hero gives news (1, -2), statistics 2c04:1167 + 1
    and 2c04:116b + 1 per carried item < 8, ovl36:16cd at the hero's square, 0b62:03be,
    DS:5e5e = 0, ovl62:0000, and the search ends; a beaten guardian is removed (+0x1a = 0).
    Kind 2: the item lies on the square for a human (state 1, holder 0, x, y), the computer's
    hero carries it (state 3); news (6, item); explored bit; kind 0.  Kind 4: gold rnd(3,500,500)
    or rnd(3,1000,1000) with +0x1b; explored bit; news (6, 0x66).  Kind 5: explored bit;
    n = rnd(1,2,0) (+2 with +0x1b) allies of type +0x1a (ovl34:12e6); news (6, 100).  A human
    then closes the result (OK, ovl34:1964: the stack is selected again)."""
    from .movement import remove_army
    from .mapwords import refresh_map
    p = state.current
    human = not H.is_computer(state)
    site = state.sites[si]
    hero = H.live(state, state.selection.hero)
    name = H.hero_name(state, hero)
    events = [E.SiteSearched({"site": si, "kind": int(site.kind), "hero": hero.id})]
    events += H.add_exp(state, hero.id, K.EXP_RUIN.value)
    idx = y * MAP_W + x
    if site.kind != SiteKind.ALLIES_RUIN and site.guardian_or_ally != 0:
        dies = guardian_kills(state, site, hero)
        events.append(E.GuardianFought({"site": si, "hero": hero.id, "guardian": site.guardian_or_ally,
                                        "hero_died": dies}))
        if dies:
            a, b = K.NEWS_RUIN_DEATH.value
            H.news(state, p, a, b, 0, name)
            _stat(state, p, K.STAT_HERO_LOST.value)
            from .bonuses import carried_items
            for i in carried_items(state, hero):
                if i < K.STANDARDS.value:
                    _stat(state, p, K.STAT_STANDARD_LOST.value)
            events += H.hero_died(state, hero.id, hero.x, hero.y)
            remove_army(state, hero)
            state.selection.hero = -1
            refresh_map(state)
            if human:
                events += _reselect(state, x, y)
            return events
        site.guardian_or_ally = 0
    if site.kind == SiteKind.ITEM_RUIN:
        i = site.item
        it = state.items[i]
        if human:
            it.state, it.holder, it.x, it.y = int(ItemState.ON_MAP), 0, x, y
        else:
            it.state, it.holder, it.x, it.y = int(ItemState.CARRIED), hero.id, 0, 0
        H.news(state, p, K.NEWS_SITE.value, i, 0, name)
        state.world.flags[idx] |= MAP_EXPLORED
        site.kind = int(SiteKind.EMPTIED)
        events.append(E.ItemFound({"item": i, "site": si, "hero": hero.id, "carried": not human,
                                   "x": x, "y": y}))
    elif site.kind == SiteKind.GOLD_RUIN:
        gold = state.rng.rnd(*(K.RUIN_GOLD_SPECIAL.value if site.flag_1b else K.RUIN_GOLD.value))
        state.world.flags[idx] |= MAP_EXPLORED
        add_gold(state, p, gold)
        events.append(E.SiteSearched({"site": si, "gold": gold}))
        H.news(state, p, K.NEWS_SITE.value, K.NEWS_GOLD.value, 0, name)
    elif site.kind == SiteKind.ALLIES_RUIN:
        state.world.flags[idx] |= MAP_EXPLORED
        n = state.rng.rnd(*K.RUIN_ALLIES.value)
        if site.flag_1b:
            n += K.RUIN_ALLIES_SPECIAL.value
        events += H.allies(state, site.guardian_or_ally, n, x, y)
        H.news(state, p, K.NEWS_SITE.value, K.NEWS_ALLIES.value, 0, name)
    else:
        return events
    if human:
        events += _reselect(state, x, y)
    return events


# ------------------------------------------------------------------------------- temples


def temple_number(state, si: int) -> int:
    """0..3 for the first four temples in site-table order, else -1.
    Evidence: decomp ovl34:08a1: the scan keeps the first four sites with kind (+0x18) == 1."""
    temples = [i for i, s in enumerate(state.sites) if s.kind == SiteKind.TEMPLE][:K.TEMPLES.value]
    return temples.index(si) if si in temples else -1


def bless(state, si: int) -> list:
    """Bless the selected stack at temple site `si`: each army without this temple's flag gets
    strength + 1 (cap 9) and the flag; a blessed hero also + 1 exp.  Other temples do nothing.
    Evidence: decomp ovl34:08a1: for i in 0..7, army = DS:5e62 when DS:2bda is clear (then only
    one), else DS:5e3e[i]; flags 0x02 / 0x04 / 0x08 / 0x10 for temples 1-4 (army +0xc);
    0b62:0005(army, 1); type 0x1c -> ovl47:04f1(army, 1); message STRING 55 / 56 by count."""
    n = temple_number(state, si)
    blessed, events = [], []
    if n >= 0:
        bit = K.TEMPLE_FLAGS.value[n]
        for a in _members(state):
            if a.flags & bit:
                continue
            H.add_strength(a, K.BLESS_STRENGTH.value)
            a.flags |= bit
            blessed.append(a.id)
            if a.type_id == HERO_TYPE:
                events += H.add_exp(state, a.id, K.EXP_BLESS.value)
    return [E.Blessed({"site": si, "temple": n, "armies": blessed})] + events


def temple_choice(state, cmd: C.TempleChoice) -> list:
    """The human temple menu: "bless" the stack, or ask for a "quest" (enabled only with Quests
    on, no active quest and a hero in the stack).
    Evidence: ovl01:0000 (menu; 0x149 enabled iff SCN 0x11e, 2c04:1103 + 0xc*p == 0 and DS:5e5e);
    bless ovl01:0132 -> ovl34:08a1(site at DS:5e62); quest ovl01:011b -> ovl01:0d7a(0), then the
    quest page ovl01:0167 (`rules.quests.quest_page`: for quest types 2 / 3 the army bits of
    ovl63:158d).  The menu is opened by Search with a hero on a temple (ovl34:018f),
    so the same conditions as Search apply."""
    if cmd.choice not in ("bless", "quest"):
        raise IllegalCommand("unknown temple choice %r" % (cmd.choice,))
    sel = state.selection
    lead = H.live(state, sel.selected)
    hero = H.live(state, sel.hero)
    if lead is None or lead.owner != state.current or H.is_computer(state):
        raise IllegalCommand("no human stack selected")
    if s8(lead.moves_left) < K.SITE_MOVES_NEEDED.value or hero is None:
        raise IllegalCommand("the temple menu needs a hero with movement left")
    si = _site_here(state, lead.x, lead.y)
    if si < 0 or state.sites[si].kind != SiteKind.TEMPLE \
            or state.world.flags[lead.y * MAP_W + lead.x] & MAP_EXPLORED:
        raise IllegalCommand("not at a temple")
    if cmd.choice == "bless":
        return bless(state, si)
    if not state.options.quests or state.players[state.current].quest.active != 0:
        raise IllegalCommand("no quest can be given now")
    from . import quests
    events = quests.assign(state, computer=False)
    return events + quests.quest_page(state)              # ovl01:011b: 0d7a(0), then 0167


# ------------------------------------------------------------------------------- sages


def sage_entries(state, x: int, y: int) -> list[int]:
    """The sage's list of places to show: -1 (nearest gold ruin), -2 (nearest allies ruin), or an
    item index, for sites with +0x1b set, not yet shown to the side, within distance < 35.
    Evidence: decomp ovl34:1610: sites in table order with +0x1b != 0, (+0x1d & 1 << p) == 0 and
    0a8b:0acc(site, sage) < 0x23: kind 4 -> one -1 entry, kind 5 -> one -2 entry, kind 2 -> its
    item (+0x19)."""
    from .setup import distance
    out: list[int] = []
    gold = allies = False
    for s in state.sites:
        if not s.flag_1b or s.shown_mask & (1 << state.current):
            continue
        if distance(s.x, s.y, x, y) >= K.SAGE_SHOW_RANGE.value:
            continue
        if s.kind == SiteKind.GOLD_RUIN and not gold:
            gold = True
            out.append(K.SAGE_GOLD_ENTRY.value)
        elif s.kind == SiteKind.ALLIES_RUIN and not allies:
            allies = True
            out.append(K.SAGE_ALLIES_ENTRY.value)
        elif s.kind == SiteKind.ITEM_RUIN:
            out.append(s.item)
    return out


def sage(state, si: int, x: int, y: int) -> list:
    """The human sage dialog: SageOffered (pending) with the list of places it can show; the gem
    is always offered, the map view only with Hidden Map.
    Evidence: decomp ovl34:0aa0 -> ovl34:1610 (list), ovl34:146f: 0x117 (show) enabled iff the
    list is not empty, 0x118 (gem) always, 0x119 (map) iff SCN 0x124; the close button 0x11a only
    after a choice (ovl34:0b1a, 0e85, 0c50 enable it)."""
    entries = sage_entries(state, x, y)
    ev = E.SageOffered({"site": si, "x": x, "y": y, "entries": entries,
                        "map_view": bool(state.options.hidden_map)})
    state.pending = ev
    return [ev]


def sage_choice(state, cmd: C.SageChoice) -> list:
    """Answer the sage: "gem" (gold), "show_site" (target = index into the offer's entries), or
    "map_view" (target = the (x, y) square clicked on the overview map).
    Evidence: ovl34:0b1a (gem: gold += rnd(3,500,500)); ovl34:0bf5 -> ovl34:0e85 (show);
    ovl34:0c50, then res_0726:036f..038c: square = ((px - 0x50) / 2, (py - 0x3c) / 2) ->
    ovl34:0cd6."""
    ev = state.pending
    if not isinstance(ev, E.SageOffered):
        raise IllegalCommand("no sage question pending")
    if cmd.choice == "gem":
        state.pending = None
        gold = state.rng.rnd(*K.SAGE_GEM.value)
        add_gold(state, state.current, gold)
        return [E.SiteSearched({"site": ev.info["site"], "gem": gold})]
    if cmd.choice == "show_site":
        entries = ev.info["entries"]
        if not isinstance(cmd.target, int) or not 0 <= cmd.target < len(entries):
            raise IllegalCommand("no such entry in the sage's list")
        state.pending = None
        return show_site(state, entries[cmd.target], ev.info["x"], ev.info["y"])
    if cmd.choice == "map_view":
        if not ev.info["map_view"]:
            raise IllegalCommand("the map view needs Hidden Map")
        t = cmd.target
        if not (isinstance(t, (tuple, list)) and len(t) == 2 and all(isinstance(v, int) for v in t)
                and 0 <= t[0] < MAP_W and 0 <= t[1] < MAP_H):
            raise IllegalCommand("map view needs a square (x, y)")
        state.pending = None
        return map_view(state, t[0], t[1])
    raise IllegalCommand("unknown sage choice %r" % (cmd.choice,))


def show_site(state, entry: int, x: int, y: int) -> list:
    """Show one place to the current side: the site of an item, or the nearest qualifying gold
    (-1) or allies (-2) ruin to the sage at (x, y); it is marked shown, revealed, and the sites'
    map tiles are redrawn.
    Evidence: decomp ovl34:0e85: -1 / -2: sites with +0x1b, not shown to p, distance < 35 and kind
    4 / 5, nearest by strict < (first on ties; site 0 when none); item: the first site whose
    +0x19 is the item; +0x1d |= 1 << p; ovl64:1298(site x, y); ovl35:09f2(p); the rest draws."""
    from .setup import distance
    p = state.current
    if entry < 0:
        kind = SiteKind.GOLD_RUIN if entry == K.SAGE_GOLD_ENTRY.value else SiteKind.ALLIES_RUIN
        best, bd = 0, K.SAGE_NO_DISTANCE.value
        for i, s in enumerate(state.sites):
            if not s.flag_1b or s.shown_mask & (1 << p) or s.kind != kind:
                continue
            d = distance(s.x, s.y, x, y)
            if d < K.SAGE_SHOW_RANGE.value and d < bd:
                best, bd = i, d
        si = best
    else:
        si = next((i for i, s in enumerate(state.sites) if s.item == entry), len(state.sites))
        if si >= len(state.sites):
            raise RuntimeError("no site holds item %d: the original reads past the site table" % entry)
    s = state.sites[si]
    s.shown_mask |= 1 << p
    reveal(state, s.x, s.y, H.selection_flying(state))
    site_tiles(state, p)
    return [E.SiteSearched({"site": si, "shown": True, "entry": entry})]


def map_view(state, x: int, y: int) -> list:
    """Reveal an area around (x, y): corner (x - rnd(1,5,8), y - rnd(1,5,8)) clipped at 0, size
    rnd(1,10,15) x rnd(1,10,15) cut so that it ends before column 111 / row 155; every square
    of it goes through the reveal routine (radius 1, 2 when flying or on a City).
    Evidence: asm ovl34:0cd6..0dd3 (rolls dx, dy, w, h in that order; x0 + w >= 0x70 -> w = 0x70 -
    x0 - 1, the same with 0x9c), then ovl64:1298(p, i, j) for i in x0..x0+w-1, j in y0..y0+h-1."""
    dx = state.rng.rnd(*K.SAGE_MAP_BACK.value)
    x0 = x - dx
    dy = state.rng.rnd(*K.SAGE_MAP_BACK.value)
    y0 = y - dy
    w = state.rng.rnd(*K.SAGE_MAP_SIZE.value)
    h = state.rng.rnd(*K.SAGE_MAP_SIZE.value)
    x0, y0 = max(x0, 0), max(y0, 0)
    lx, ly = K.SAGE_MAP_LIMIT.value
    if x0 + w >= lx:
        w = lx - x0 - 1
    if y0 + h >= ly:
        h = ly - y0 - 1
    flying = H.selection_flying(state)
    for i in range(x0, x0 + w):
        for j in range(y0, y0 + h):
            reveal(state, i, j, flying)
    return [E.SiteSearched({"map_view": (x0, y0, w, h)})]


def site_tiles(state, p: int) -> None:
    """Redraw every site's map tile for side p: temple, plain site, or the special-site picture
    (hidden while not shown to p with Quests on).
    Evidence: decomp ovl35:09f2: map low byte = 0x0b for kind 1; +0x1b clear -> 0x0c; +0x1b set,
    bit p of +0x1d clear and SCN 0x11e set -> 0x09; else 0x0a.  With Quests on it also redraws the
    overview pixels (ovl63:2785(0, x, y)), which draw no dice on these tiles unless a road piece
    is there (then the tile tested is the road piece - 1 < 0x20): no dice in either case."""
    tiles = K.SITE_TILE.value
    for s in state.sites:
        if s.kind == SiteKind.TEMPLE:
            b = tiles["temple"]
        elif not s.flag_1b:
            b = tiles["plain"]
        elif not s.shown_mask & (1 << p) and state.options.quests:
            b = tiles["hidden"]
        else:
            b = tiles["shown"]
        state.world.tiles[s.y * MAP_W + s.x] = b
        if state.options.quests:
            H.overview_rolls(state, s.x, s.y)
