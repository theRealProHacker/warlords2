"""The selected stack, the stack palette and the order commands: select a stack, Next,
Quit & Next, Deselect, Defend, the palette buttons (Select Army, Select Group, Group All,
Ungroup All), Move All and Disband; and the turn-start army bookkeeping (fortify marks, flag
clear, group cleanup) for the turn loop.

Addresses (resident code unless ovlNN; "asm" = capstone listing out/asm/):

* routing     switch 07be:04d8 (jump table 07be:0b0c, command id - 100), hotkeys 07be:0337
              (46 keys, handlers at +0x5c), menu records DS:1798; buttons in ovl61:0ec9..0f26
* square list 0b62:007d (up to 8 armies, table index from the top), sort 0b62:0a03 (via 09ec
              for the square list, 09ce for the moving group)
* select      0b62:0405 (map click), ovl67:06eb (stack of an army), 0c8c:0529 (selection
              step), ovl66:0d30 (palette from the square), ovl67:0955 (wake)
* palette     ovl66:0963 Select Army (224-231), ovl66:0910 Select Group (232-239), ovl66:0a55
              Group All (240, Space), ovl66:0a99 Ungroup All (241); each ends in the apply step
              ovl66:000a, which renumbers +0x11 (free id 0b62:0cde)
* orders      ovl67:019b Next (174; search ovl67:040e), ovl67:0393 Quit & Next (175; 08fb marks
              done), ovl67:03a6 Defend (176), 0b62:08b3 Deselect (178, Del), 0c8c:04c4 Move All
              ('m'; search ovl67:05c4, move 0c8c:01fd), 0b62:06bf / 076a Disband ('q')
* turn start  ovl67:0000 fortify marks, ovl67:0113 flag clear, 0b62:0d85 group cleanup

`GameState.selection` holds the DGROUP words these routines share (model/state.py says which
are kept and why).  Commands that name their group (Defend, LeaveGroup, Disband, Move) make it
the selection first, standing for the player having selected it; the palette commands work on
the palette of the current selection and refuse a palette that no longer matches the map
(armies moved or died since it was built).

Not modelled (presentation only): redraws and sounds (ovl61:0174, ovl66:0356, ovl62:0af3,
ovl64:006c / 0238, ovl58:0b5f "no army left", 0b79), the path display words DS:2eaa / 2ea6 /
2ea8, the view centring of computer stacks (ovl67:08a4..08ef), the palette bracket marks
DS:6832; the tutorial pop-ups of ovl67:01ea..0337 and 0b62:04f7..063f (SCN 0x134 bits 3, 4, 7;
plan X09, M8a); the large-stack dialog (buttons 332-351: ovl66:16c5 / 1704 / 157d / 166f edit
the palette without the apply step, OK / Cancel not traced); the upkeep recount ovl62:02bf after
Disband (DGROUP cache, rules/economy.py).

Events: Disband returns DisbandPrompt (pending; info armies, heroes) and ConfirmDisband the
hero-death events plus nothing else; Move All returns the Moved/Embarked/... events of each
move; selecting a stack on water may return Sunk (ovl67:0728); fortify_marks returns Fortified
(info squares).  The selection itself is read from `state.selection`.
"""
from __future__ import annotations

import importlib
import logging

from ..model import commands as C
from ..model import events as E
from ..model.ids import HERO_TYPE, MAP_FORTIFIED, MAP_H, MAP_W, ROAD_PIECE_MASK, Control
from .bonuses import s8
from .constants import selection as K
from .constants import unverified_allowed
from .engine import IllegalCommand, NotImplementedCommand
from .mapwords import refresh_map
from . import movement as M
from . import pathfinding as P

log = logging.getLogger(__name__)

NO_OWNER_ROW = 8                  # 0b62:0024 / 0a03: owner 0xf uses fight-order row 8

# name -> (milestone, "module:function", what it must do, EXE address)
HOOKS = {
    "hero_died": ("M7a", "warlords2.rules.heroes:hero_died",
                  "f(state, army_id, x, y) -> list[Event], before the army is deleted",
                  "ovl36:16cd from 0b62:078d / 07f1 (Disband)"),
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
        log.warning("disband step %s (%s, %s) not implemented; skipped", name, target, milestone)
        return default
    return f(*args)


# ------------------------------------------------------------------------------- helpers


def _live(state, aid: int):
    """The record `aid` when it holds an army (owner != 0xff), else None."""
    if 0 <= aid < len(state.armies) and state.armies[aid].owner != M.FREE:
        return state.armies[aid]
    return None


def _leader(state):
    """DS:5e62 as a record of the side whose turn it is, else None."""
    a = _live(state, state.selection.selected)
    return a if a is not None and a.owner == state.current and a.x >= 0 else None


def _members(state) -> list:
    """The stack the order routines act on: 5e3e[0..7] when DS:2bda is set, else 5e62 alone
    (asm ovl67:03ba / 090a, 0b62:06d3 / 076f)."""
    sel = state.selection
    ids = sel.moving if len(sel.moving) > 1 else [sel.selected]
    return [a for a in (_live(state, i) for i in ids) if a is not None]


def _row(owner: int) -> int:
    return NO_OWNER_ROW if owner == 0x0F else owner


def _fo(state, row: int, a) -> int:
    """Fight-order byte SCN 0x60b + row*0x1d + type, compared signed (asm 0b62:0b68, ovl67:083f)."""
    return s8(state.fight_order[row][a.type_id])


def _scan(state):
    """Army records from the top index down (the loops from SCN 0x181 - 1 to 0; records above
    the high-water mark are free)."""
    return reversed(state.armies)


def _distance(a, ref) -> int:
    """|dx| + |dy| to DS:3250/3252; 0 counts as 9000 (asm ovl67:049e..04ca)."""
    d = abs(a.x - ref[0]) + abs(a.y - ref[1])
    return d if d else K.NEXT_HERE.value


def square_list(state, x: int, y: int) -> list:
    """The armies on (x, y) in palette order: the square list of 0b62:007d (up to 8, table
    index from the top down) sorted by 0b62:0a03 with its flag 0.
    Evidence: asm 0b62:007d..019d, 0b62:09ec -> 0a03 (call at ovl66:0d72, 0b62:04cd)."""
    lst = M.armies_at(state, x, y)
    sort_stack(state, lst)
    return lst


def sort_stack(state, lst: list) -> None:
    """In place: insertion sort that moves an army up while its +0x11 is greater (unsigned)
    than its predecessor's, or equal with a greater fight-order byte (signed, row of the first
    army's owner, 0xf -> 8).  The flag-1 branch (selected armies first) is never taken by
    the callers modelled here.
    Evidence: asm 0b62:0a03..0cdd (0aa0..0ab4 row, 0abf..0b99 test, 0b99..0bef swap loop)."""
    if not lst:
        return
    row = _row(lst[0].owner)

    def up(i):
        cur, prev = lst[i], lst[i - 1]
        return cur.group > prev.group or (cur.group == prev.group
                                          and _fo(state, row, cur) > _fo(state, row, prev))

    for i in range(1, len(lst)):
        j = i
        while j > 0 and up(j):
            lst[j], lst[j - 1] = lst[j - 1], lst[j]
            j -= 1


# ------------------------------------------------------------------------------- selection


def selection_step(state) -> None:
    """0c8c:0529 on the moving group: hero = the leader if it is a hero, else the first hero
    in group order; every member gets the leader's goto; for a human side with a goto set the
    path is searched (path cache and cost-map patch, as when the original draws it).
    Evidence: asm 0c8c:0529..07f9 (5e5e 0566..0604, goto copy 0723..0766, search 0768..07e9
    with 0555:1868 = leader square, goto, DS:5dfc / 5dfa; ovl25:09ab-style test SCN 0x0D0)."""
    sel = state.selection
    lead = _live(state, sel.selected)
    if lead is None:
        return
    group = [a for a in (_live(state, i) for i in sel.moving) if a is not None]
    sel.hero = lead.id if lead.type_id == HERO_TYPE else -1
    for a in group:
        if sel.hero < 0 and a.type_id == HERO_TYPE:
            sel.hero = a.id
    for a in group:
        a.goto = lead.goto
    if (state.players[state.current].control == Control.HUMAN
            and lead.goto[0] >= 0 and lead.goto[1] >= 0 and group):
        mode, mask = M.stack_mode(state, group)
        P.find_path(state, (lead.x, lead.y), lead.goto, mode, mask)


def build_palette(state) -> None:
    """ovl66:0d30: the palette of the leader's square: armies in square-list order, the
    members of the moving group marked selected, and a palette group index that grows except
    between neighbours with the same nonzero +0x11.  Without DS:2bda the moving group becomes
    the leader alone.
    Evidence: asm ovl66:0d30..0e84 (0d40 2bda, 0d65 0b62:007d, 0d72 sort, 0dcb..0df3 index)."""
    sel = state.selection
    lead = _live(state, sel.selected)
    if lead is None:
        return
    if len(sel.moving) <= 1:
        sel.moving = [lead.id]
    sel.palette, sel.palette_selected, sel.palette_group = [], [], []
    prev, idx = -1, -1
    for a in square_list(state, lead.x, lead.y):
        if not (prev == a.group and a.group != 0 and idx >= 0):
            idx += 1
        sel.palette.append(a.id)
        sel.palette_selected.append(int(a.id in sel.moving))
        sel.palette_group.append(idx)
        prev = a.group


def _wake(state, whole: bool) -> None:
    """ovl67:0955: the stack gets bit 0; DS:5e5e = the hero woken in the lowest group slot."""
    sel = state.selection
    sel.hero = -1
    if not whole:
        a = _live(state, sel.selected)
        if a is not None:
            a.flags |= K.AWAKE.value
            if a.type_id == HERO_TYPE:
                sel.hero = a.id
        return
    for aid in reversed(sel.moving):
        a = _live(state, aid)
        if a is None:
            continue
        a.flags |= K.AWAKE.value
        if a.type_id == HERO_TYPE:
            sel.hero = a.id


def select_army_stack(state, p) -> list:
    """ovl67:06eb(p): select the stack of army p.  A human stack on Water or a port first
    sinks (0b62:0ea0); if anything sank nothing else happens.  Otherwise every own army on p's
    square whose +0x11 equals p's nonzero +0x11, and p itself, gets flag 0x200 and joins the
    moving group (table index from the top); the leader is the member with the highest
    fight-order byte (first found on ties, army 0 when none is above -1); then the selection
    step, the group sort, the palette and the wake of the whole group.
    Evidence: asm ovl67:06eb..08f7 (0715..0736 sink, 077b..0866 members, 087f 5e62, 0888 0c8c:0529,
    088d 0b62:09ce, 0892 ovl66:0000 -> 0d30, 08a0 ovl67:0955(1))."""
    sel = state.selection
    if state.players[state.current].control != Control.COMPUTER:
        sunk = M.sink(state, p.x, p.y)
        if sunk:
            return sunk
    row = _row(state.current)
    g, pos = p.group, (p.x, p.y)
    members, best, leader = [], -1, 0
    for a in _scan(state):
        if (a.x, a.y) != pos or a.owner != state.current:
            continue
        if (a.group == g and g != 0) or a is p:
            a.flags |= K.VISITED.value
            members.append(a.id)
            if _fo(state, row, a) > best:
                best, leader = _fo(state, row, a), a.id
    sel.selected, sel.moving = leader, members
    selection_step(state)
    if len(sel.moving) > 1:                                  # 0b62:09ce
        group = [state.armies[i] for i in sel.moving]
        sort_stack(state, group)
        sel.moving = [a.id for a in group]
    build_palette(state)
    _wake(state, True)
    return []


def adopt(state, ids) -> None:
    """Make the armies `ids` (checked by the caller) the selected stack, as the original has
    them when the player acts on a stack: unchanged when it already is the selection, else
    leader = the first id and moving group = `ids` in that order.
    Evidence: every order routine reads DS:5e62 / 5e3e / 2bda (ovl67:03a6, 08fb, 0b62:06bf,
    0a8b:0c4f); no game rule of its own."""
    sel = state.selection
    current = sel.moving if len(sel.moving) > 1 else [sel.selected]
    if sel.selected in ids and sorted(current) == sorted(ids):
        return
    sel.selected = ids[0]
    sel.moving = list(ids)


def _check_group(state, group) -> list:
    if not group or len(group) > K.PALETTE_SLOTS.value or len(set(group)) != len(group):
        raise IllegalCommand("a group is 1 to 8 distinct armies")
    members = []
    for aid in group:
        a = _live(state, aid) if isinstance(aid, int) else None
        if a is None or a.owner != state.current or a.x < 0 or a.y < 0:
            raise IllegalCommand("army %r is not the current side's on the map" % (aid,))
        members.append(a)
    if len({(a.x, a.y) for a in members}) != 1:
        raise IllegalCommand("the group is not on one square")
    return members


def select_stack(state, cmd: C.SelectStack) -> list:
    """SelectStack(x, y): the first army of the sorted square list and its group become the
    selection (the single-click path of the map click).  Only a square holding an army of the
    side whose turn it is.
    Evidence: asm 0b62:0405 (04b8..04e0: 0b62:007d, 09ec, 5e62 = 5e1e[0], ovl67:06eb); the
    double click on the selected square (0471..04b5) is Group All (`group_all`)."""
    if not (0 <= cmd.x < MAP_W and 0 <= cmd.y < MAP_H):
        raise IllegalCommand("off the map")
    lst = square_list(state, cmd.x, cmd.y)
    if not lst or lst[0].owner != state.current:
        raise IllegalCommand("no army of the current side on %r" % ((cmd.x, cmd.y),))
    return select_army_stack(state, lst[0])


def deselect(state, cmd: C.Deselect) -> list:
    """Deselect: DS:5e62 = null; the moving group, the palette and every army byte stay.
    Evidence: asm 0b62:08b3..0904 (key Del / button 178 via 07be:02f1 and ovl61:0f26)."""
    state.selection.selected = -1
    return []


# ------------------------------------------------------------------------------- palette


def _palette(state) -> list:
    """The palette's records; IllegalCommand unless it still is the leader's square."""
    sel = state.selection
    lead = _leader(state)
    if lead is None or not sel.palette:
        raise IllegalCommand("no stack selected")
    out = []
    for aid in sel.palette:
        a = _live(state, aid)
        if a is None or (a.x, a.y) != (lead.x, lead.y):
            raise IllegalCommand("the stack palette is out of date; select the stack again")
        out.append(a)
    if len(sel.palette_selected) != len(out) or len(sel.palette_group) != len(out):
        raise IllegalCommand("inconsistent stack palette")
    return out


def _free_group_id(state) -> int:
    """0b62:0cde: smallest id 1..254 that no army of the side on the map carries in +0x11,
    0 when none is free; id 1 counts as taken (constants FREE_ID_SLOT1_TAKEN)."""
    used = {a.group for a in _scan(state) if a.owner == state.current and a.x >= 0}
    if K.FREE_ID_SLOT1_TAKEN.value:
        used.add(K.GROUP_DEFENDED.value)
    for g in range(1, K.GROUP_ID_END.value):
        if g not in used:
            return g
    return 0


def apply_palette(state) -> None:
    """ovl66:000a: the selected palette armies, in palette order, become the moving group (the
    first one the leader) and get bit 0; every member gets the leader's goto; then +0x11 is
    renumbered per run of equal palette index: a single army -> 0; a run of two or more whose
    first army has bit 0 clear -> 1; else the ids >= 2 found on the palette (in order of
    appearance) are reused from the last one down, the first never, and after them the
    smallest free id (0b62:0cde, evaluated as the renumbering goes); then the selection step.
    Evidence: asm ovl66:000a..0352 (0033..00bd group, 00c0..00f4 goto, 00f6..0175 id list,
    0177..0209 runs, 0210..025e kinds 0/1/2/3, 0260..02e1 ids, 02e3 0c8c:0529)."""
    sel = state.selection
    pal = [state.armies[i] for i in sel.palette]
    sel.selected, sel.moving = -1, []
    for a, chosen in zip(pal, sel.palette_selected):
        if chosen:
            if sel.selected < 0:
                sel.selected = a.id
            sel.moving.append(a.id)
            a.flags |= K.AWAKE.value
    lead = _live(state, sel.selected)
    if lead is not None:
        for aid in sel.moving[1:]:
            state.armies[aid].goto = lead.goto
    ids = []
    for a in pal:
        if a.group not in (K.GROUP_ALONE.value, K.GROUP_DEFENDED.value) and a.group not in ids:
            ids.append(a.group)
    runs = []                                    # [start, count, first army's bit 0]
    for i, a in enumerate(pal):
        if i == 0 or sel.palette_group[i] != sel.palette_group[i - 1]:
            runs.append([i, 0, a.flags & K.AWAKE.value])
        runs[-1][1] += 1
    left = len(ids)
    for start, count, awake in runs:
        if count == 1:
            g = K.GROUP_ALONE.value
        elif not awake:
            g = K.GROUP_DEFENDED.value
        else:
            left -= 1
            g = ids[left] if left > 0 else _free_group_id(state)
        for a in pal[start:start + count]:
            a.group = g
    selection_step(state)


def sort_palette(state) -> None:
    """Insertion sort of the stack palette (armies, selected flags and index move together):
    an entry moves up while its palette index is lower than the one before it, or equal with a
    greater fight-order byte (signed, the current side's row).  Select Army, Group All and
    Ungroup All run it before the apply step; Select Group and the palette build pass 0 (no sort).
    Evidence: asm ovl66:17e7..1952 (arg 0 -> skip at 1804; row 0b62:0024(SCN 0x110); test
    1813..1866 / 18f3..1944 jl / jg; swap 186e..18ee of DS:6862, 6852, 6842); calls with 1 at
    ovl66:0a3a (0963), 0a7f (0a55), 0abf (0a99), with 0 at ovl66:0949 (0910), 0e79 (0d30)."""
    sel = state.selection
    row = _row(state.current)
    fo = [_fo(state, row, state.armies[i]) for i in sel.palette]

    def before(i):
        g, h = sel.palette_group[i], sel.palette_group[i - 1]
        return g < h or (g == h and fo[i] > fo[i - 1])

    lists = (sel.palette, sel.palette_group, sel.palette_selected, fo)
    for si in range(1, len(sel.palette)):
        c = si
        while c > 0 and before(c):
            for lst in lists:
                lst[c], lst[c - 1] = lst[c - 1], lst[c]
            c -= 1


def _slot(state, aid: int) -> int:
    pal = _palette(state)
    for i, a in enumerate(pal):
        if a.id == aid:
            return i
    raise IllegalCommand("army %r is not on the stack palette" % (aid,))


def _toggle(state, c: int) -> None:
    """ovl66:0963(c): an unselected army joins the palette index of the first selected one; a
    selected army leaves for the lowest unused index, unless it is alone in its index (then
    nothing changes); then the palette sort (ovl66:0a3a) and the apply step."""
    sel = state.selection
    if not sel.palette_selected[c]:
        first = next((i for i, s in enumerate(sel.palette_selected) if s), None)
        if first is None:
            raise IllegalCommand("no selected army on the palette")
        sel.palette_group[c] = sel.palette_group[first]
        sel.palette_selected[c] = 1
    else:
        counts = [0] * K.PALETTE_SLOTS.value
        for g in sel.palette_group:
            counts[g] += 1
        if counts[sel.palette_group[c]] != 1:
            free = next((g for g in range(K.PALETTE_SLOTS.value) if counts[g] == 0),
                        K.PALETTE_SLOTS.value)
            sel.palette_selected[c] = 0
            sel.palette_group[c] = free
    sort_palette(state)
    apply_palette(state)


def group(state, cmd: C.Group) -> list:
    """Group(armies): Select Army on each listed palette army that is not selected, in order
    (each a click with its own apply step).  A listed army that is already selected is refused.
    Evidence: asm ovl66:0963..0977 / 0998..09b5 (buttons 224-231, 07be:0576), apply ovl66:0a45."""
    if not cmd.armies:
        raise IllegalCommand("no army")
    for aid in cmd.armies:
        c = _slot(state, aid)
        if state.selection.palette_selected[c]:
            raise IllegalCommand("army %r is already selected" % (aid,))
        _toggle(state, c)
    return []


def ungroup(state, cmd: C.Ungroup) -> list:
    """Ungroup(armies): Select Army on each listed palette army that is selected, in order; an
    army alone in its palette index stays selected (the original button does nothing to it but
    still runs the apply step).  A listed army that is not selected is refused.
    Evidence: asm ovl66:09b8..0a36 (buttons 224-231), apply ovl66:0a45."""
    if not cmd.armies:
        raise IllegalCommand("no army")
    for aid in cmd.armies:
        c = _slot(state, aid)
        if not state.selection.palette_selected[c]:
            raise IllegalCommand("army %r is not selected" % (aid,))
        _toggle(state, c)
    return []


def select_group(state, cmd: C.SelectGroup) -> list:
    """SelectGroup(army): exactly the palette armies with that army's palette index are
    selected; then the apply step.
    Evidence: asm ovl66:0910..0962 (buttons 232-239, 07be:0584)."""
    c = _slot(state, cmd.army)
    sel = state.selection
    g = sel.palette_group[c]
    sel.palette_selected = [int(x == g) for x in sel.palette_group]
    apply_palette(state)
    return []


def _palette_at(state, x: int, y: int) -> None:
    _palette(state)
    lead = _leader(state)
    if (lead.x, lead.y) != (x, y):
        raise IllegalCommand("the selected stack is not on %r" % ((x, y),))


def group_all(state, cmd: C.GroupAll) -> list:
    """GroupAll(x, y): every palette army index 0 and selected; then the apply step.
    Evidence: asm ovl66:0a55..0a98 (button 240 / Space via 07be:0180, double click 0b62:04b0;
    nothing without DS:5e62)."""
    _palette_at(state, cmd.x, cmd.y)
    sel = state.selection
    sel.palette_group = [0] * len(sel.palette)
    sel.palette_selected = [1] * len(sel.palette)
    sort_palette(state)                          # asm ovl66:0a7f
    apply_palette(state)
    return []


def ungroup_all(state, cmd: C.UngroupAll) -> list:
    """UngroupAll(x, y): palette army i gets index i, only slot 0 stays selected; then the
    apply step.
    Evidence: asm ovl66:0a99..0ad8 (button 241, 07be:0568)."""
    _palette_at(state, cmd.x, cmd.y)
    sel = state.selection
    sel.palette_group = list(range(len(sel.palette)))
    sel.palette_selected = [1] + [0] * (len(sel.palette) - 1)
    sort_palette(state)                          # asm ovl66:0abf
    apply_palette(state)
    return []


# ------------------------------------------------------------------------------- Next


def _search_next(state):
    """ovl67:040e: own armies on the map with bit 0 and without 0x40; the nearest to DS:3250 /
    3252 among those without 0x200, else (cycle reset: 0x200 cleared on every own army) the
    nearest of those with it; the reference square moves to the result."""
    sel = state.selection
    fresh = seen = None
    dfresh = dseen = K.NEXT_NONE.value
    for a in _scan(state):
        if a.owner != state.current or a.x < 0:
            continue
        if not a.flags & K.AWAKE.value or a.flags & K.DONE.value:
            continue
        d = _distance(a, sel.next_ref)
        if a.flags & K.VISITED.value:
            if d < dseen:
                seen, dseen = a, d
        elif d < dfresh:
            fresh, dfresh = a, d
    if fresh is not None:
        sel.next_ref = (fresh.x, fresh.y)
        return fresh
    if seen is None:
        return None
    sel.next_ref = (seen.x, seen.y)
    for a in _scan(state):
        if a.owner == state.current:
            a.flags &= ~K.VISITED.value
    return seen


def _next(state) -> list:
    """ovl67:019b: search; none -> DS:5e62 = null; else select that army's stack."""
    p = _search_next(state)
    if p is None:
        state.selection.selected = -1
        return []
    return select_army_stack(state, p)


def next_stack(state, cmd: C.Next) -> list:
    """Next: the nearest awake own army not done this turn (|dx| + |dy| to the reference
    square, 0 counting 9000; ties to the higher table index) whose stack was not visited in
    this cycle, else a new cycle; its stack becomes the selection and is woken.  Nothing left:
    no selection.
    Evidence: asm ovl61:0ec9 -> ovl67:019b (01af ovl67:040e, 01bf null, 01d5 ovl67:06eb),
    ovl67:040e..05c3."""
    return _next(state)


def leave_group(state, cmd: C.LeaveGroup) -> list:
    """LeaveGroup(group) ("Quit & Next"): the group (made the selection) gets flag 0x40, done
    for this turn; then Next.  An empty group is the button without a selection: Next only.
    Evidence: asm ovl61:0ed7 (no DS:5e62 -> ovl67:019b) -> ovl67:0393 -> 08fb (0911 / 0939 or
    0x40, 0945 DS:2ea6 display word) -> 019b."""
    if cmd.group:
        adopt(state, [a.id for a in _check_group(state, cmd.group)])
        mark_done(state)
    return _next(state)


def mark_done(state) -> None:
    """ovl67:08fb: flag 0x40 on the selected stack (the leader alone without DS:2bda).
    Evidence: asm ovl67:08fb..0953."""
    if _live(state, state.selection.selected) is None:
        return
    for a in _members(state):
        a.flags |= K.DONE.value


def defend(state, cmd: C.Defend) -> list:
    """Defend(group): every member (the group is made the selection) loses bit 0 and gets
    +0x11 = 1; goto, moves and the RNG are untouched; then Next.
    Evidence: asm ovl61:0ef4 -> ovl67:03a6..040d (03a9 null -> nothing, 03ba 2bda, 03c5 / 03ee
    bit 0, 03ca / 03fc +0x11 = 1, 0409 ovl67:019b)."""
    adopt(state, [a.id for a in _check_group(state, cmd.group)])
    for a in _members(state):
        a.flags &= ~K.AWAKE.value
        a.group = K.GROUP_DEFENDED.value
    return _next(state)


# ------------------------------------------------------------------------------- Move All


def _search_move_all(state):
    """ovl67:05c4: like 040e but only armies without 0x200, and no cycle reset."""
    sel = state.selection
    best, dbest = None, K.NEXT_NONE.value
    for a in _scan(state):
        if a.owner != state.current or a.x < 0:
            continue
        if not a.flags & K.AWAKE.value or a.flags & (K.DONE.value | K.VISITED.value):
            continue
        d = _distance(a, sel.next_ref)
        if d < dbest:
            best, dbest = a, d
    if best is not None:
        sel.next_ref = (best.x, best.y)
    return best


def goto_selected(state) -> list:
    """0c8c:01fd(goto of the leader): move the selected stack towards its goto (rules.movement
    move, which for a human side also does the rest of 01fd: palette rebuild, goto clear, done
    mark and deselect on status 2).  Nothing without a selection or with a goto off the map.
    Evidence: asm 0c8c:01fd..041e (020b..0225 checks, 0271 0a8b:0c4f(x, y, 0)).  The original
    takes goto (0, 0) as "the square under the mouse" (022a..026b); here it is the square (0, 0)."""
    lead = _leader(state)
    if lead is None:
        return []
    x, y = lead.goto
    if not (0 <= x < MAP_W and 0 <= y < MAP_H):
        return []
    members = [lead] + [a for a in _members(state) if a is not lead]
    return M.move(state, C.Move(tuple(a.id for a in members), (x, y)))


def move_all(state, cmd: C.MoveAll) -> list:
    """MoveAll: first the selected stack when its leader has a goto; then repeatedly the
    nearest awake own army not done and not yet visited (ovl67:05c4, no cycle reset) gets
    0x200 and, when it has a goto (x >= 0), its stack is selected and moved.  Asleep (bit 0
    clear) and done (0x40) armies never move.
    Evidence: asm 07be:01fc -> 0c8c:04c4..0528 (04ca..04db first stack, 04df..04ed 0x200 and
    goto test, 04f3 ovl67:06eb, 050d 0c8c:01fd, 0513 ovl67:05c4)."""
    events: list = []
    lead = _leader(state)
    if lead is not None and lead.goto[0] >= 0:
        events += goto_selected(state)
    while True:
        p = _search_move_all(state)
        if p is None:
            return events
        p.flags |= K.VISITED.value
        if p.goto[0] < 0:
            continue
        events += select_army_stack(state, p)
        events += goto_selected(state)


# ------------------------------------------------------------------------------- Disband


def disband(state, cmd: C.Disband) -> list:
    """Disband(armies): the group is made the selection and the yes/no question is asked
    (DisbandPrompt, pending; info "heroes" when a hero is in it, the extra line of the
    question).  Refused before anything changes when a hero would die and the hero-death
    step (M7a) is missing, unless unverified steps are allowed.
    Evidence: asm 07be:0225 -> 0b62:06bf..0759 (06d3..0706 hero test over 5e62 or 5e3e[0..5dfe),
    ovl56:0088 yes 0b62:076a / no 0b62:075a)."""
    adopt(state, [a.id for a in _check_group(state, cmd.armies)])
    members = _members(state)
    heroes = any(a.type_id == HERO_TYPE for a in members)
    if heroes:
        _require(C.Disband, "hero_died")
    ev = E.DisbandPrompt({"armies": tuple(a.id for a in members), "heroes": heroes})
    state.pending = ev
    return [ev]


def confirm_disband(state, cmd: C.ConfirmDisband) -> list:
    """ConfirmDisband(yes): no -> nothing.  Yes -> every member is removed (0b62:03be), a hero
    first through the hero-death step (ovl36:16cd, `HOOKS["hero_died"]`); in a group a
    disbanded hero that is the side's active quest hero (2c04:1103 + 0xc*p, +4) ends the
    quest (+0 = 0; the single-army path does not check); then no selection, the map bits are
    rebuilt (ovl62:0000).
    Evidence: asm 0b62:076a..08b2 (076f 2bda, 0781..079b single, 07a4..0878 group, 07f9..085c
    quest, 087d..088f 5e62 / 5e5e / 2bda = 0, 0895 ovl62:0000); 0b62:075a (no)."""
    state.pending = None
    if not cmd.yes:
        return []
    events: list = []
    members = _members(state)
    grouped = len(state.selection.moving) > 1
    if any(a.type_id == HERO_TYPE for a in members):
        _require(C.ConfirmDisband, "hero_died")
    quest = state.players[state.current].quest
    for a in members:
        if a.type_id == HERO_TYPE:
            events += _call("hero_died", [], state, a.id, a.x, a.y)
            if grouped and quest.active != 0 and quest.hero == a.id:
                quest.active = 0
        M.remove_army(state, a)
    sel = state.selection
    sel.selected, sel.hero, sel.moving = -1, -1, []
    refresh_map(state)
    return events


# ------------------------------------------------------------------------------- turn start


def fortify_marks(state) -> list:
    """Fortify marks of the side whose turn it is: under every own army with bit 0 clear
    (asleep: Defend) and moves left >= allowance (signed bytes), a square of terrain Plain,
    Forest, Hills, Bridge, Marsh or Tower, or with a road piece, gets map bit 0x2000.  The bit
    is cleared only where no army stands (0b62:01a7 when a square empties, ovl62:0000 at every
    main-loop pass), on capture (ovl36:0d6f) and at new game (ovl53:0247), never by a turn.
    Armies off the map (x < 0) are skipped (the original indexes the map with them).
    Called by the turn start after the movement refresh: computer ovl68:01c2, human
    ovl68:035b (EL §6.2); M8a wires it.
    Evidence: asm ovl67:0000..0112; writers of the bit: or ovl67:00ff only; and 0xdf at
    0b62:023e, ovl62:02a8, ovl36:0d6f, ovl53:0247 (X28)."""
    squares = []
    w = state.world
    for a in _scan(state):
        if a.owner != state.current or a.flags & K.AWAKE.value:
            continue
        if s8(a.moves_left) < s8(a.allowance) or a.x < 0 or a.y < 0:
            continue
        i = a.y * MAP_W + a.x
        t = w.terrain_of_tile[w.tiles[i]]
        if t in K.FORTIFY_TERRAIN.value or w.roads[i] & ROAD_PIECE_MASK:
            w.flags[i] |= MAP_FORTIFIED
            if (a.x, a.y) not in squares:
                squares.append((a.x, a.y))
    return [E.Fortified({"squares": squares})] if squares else []


def clear_turn_flags(state) -> None:
    """Turn start: flags 0x40 (done) and 0x200 (visited) cleared on every army of the side
    whose turn it is; Next's reference square = the player record's +4 / +6 (capital).
    Called by the computer turn start ovl68:01cc, the human one ovl68:0365 (EL §6.2) and the
    sequence ovl68:022c at 0252 (caller not traced); M8a wires it.
    Evidence: asm ovl67:0113..019a (0147 / 0154, 0174..0193 DS:3250 / 3252)."""
    for a in _scan(state):
        if a.owner == state.current:
            a.flags &= ~(K.DONE.value | K.VISITED.value)
    state.selection.next_ref = tuple(state.players[state.current].capital)


def group_cleanup(state) -> None:
    """Turn start: a group id (+0x11 >= 2) carried by exactly one army of the side on the map
    becomes 0 on that army.
    Called by the computer turn start ovl68:01b8, the human one ovl68:0351 (EL §6.2) and the
    sequence ovl68:022c at 0243 (caller not traced); M8a wires it.  Ids are 2..254 (an id 255
    would make the original count into its saved BP).
    Evidence: asm 0b62:0d85..0e9a (counts 0dda..0e0c, ids 2..254, reset 0e65..0e84)."""
    counts: dict[int, int] = {}
    for a in _scan(state):
        if a.owner == state.current and a.x >= 0 and a.group >= K.GROUP_FIRST_ID.value:
            counts[a.group] = counts.get(a.group, 0) + 1
    for g in range(K.GROUP_FIRST_ID.value, K.GROUP_ID_END.value):
        if counts.get(g) == 1:
            for a in _scan(state):
                if a.owner == state.current and a.x >= 0 and a.group == g:
                    a.group = K.GROUP_ALONE.value
