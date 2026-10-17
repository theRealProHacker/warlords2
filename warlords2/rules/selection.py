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

The palette draw ovl66:0356 writes DS:5dfe / 5e3e[0] / 5e00 (0c8c:0912): `redraw_palette`, at
the draws that end the selection commands.  Not modelled (presentation only): the rest of the
redraws and sounds (ovl61:0174, ovl66:0356's pictures, ovl62:0af3,
ovl64:006c / 0238, ovl58:0b5f "no army left", 0b79), the path display words DS:2eaa / 2ea6 /
2ea8, the view centring of computer stacks (ovl67:08a4..08ef), the palette bracket marks
DS:6832; the large-stack dialog (buttons 332-351: ovl66:16c5 / 1704 / 157d / 166f edit
the palette without the apply step, OK / Cancel not traced).  Disband refreshes the upkeep cache
(ovl62:02bf, rules/economy.py).

Events: Disband returns DisbandPrompt (pending; info armies, heroes) and ConfirmDisband the
hero-death events plus nothing else; Move All returns the Moved/Embarked/... events of each
move; selecting a stack on water may return Sunk (ovl67:0728); fortify_marks returns Fortified
(info squares).  The selection itself is read from `state.selection`.

Tutorial (SCN 0x12e set; plan X09, added by M8a): SelectStack (0b62:04f7..063f) and Next /
Quit & Next / Defend (all through ovl67:019b, 01ea..0337) set SCN byte 0x134 bits 3, 4, 7 and
return one `TurnCue {"kind": "tutorial", "file": (25, n)}` per page, in the EXE's order
(`tutorial_pages`); `tutorial_after_move` is the same for the tail of 0c8c:01fd.
"""
from __future__ import annotations

import importlib
import logging

from ..model import commands as C
from ..model import events as E
from ..model.ids import HERO_TYPE, MAP_FORTIFIED, MAP_H, MAP_W, ROAD_PIECE_MASK, Control
from .bonuses import s8
from .constants import selection as K
from .constants import turn as KT
from .constants import unverified_allowed
from .economy import refresh_upkeep
from .engine import IllegalCommand, NotImplementedCommand
from .present import present
from .mapwords import refresh_map
from . import movement as M
from . import pathfinding as P
from . import visibility as V

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
    (asm ovl67:03ba / 090a, 0b62:06d3 / 076f: cmp word [0x2bda], the stored word `Selection.group`)."""
    sel = state.selection
    ids = sel.moving if sel.group else [sel.selected]
    return [a for a in (_live(state, i) for i in ids) if a is not None]


def _row(owner: int) -> int:
    return NO_OWNER_ROW if owner == 0x0F else owner


def _fo(state, row: int, a) -> int:
    """Fight-order byte SCN 0x60b + row*0x1d + type, the type byte sign-extended (cwde), compared
    signed: `GameState.fight_order_byte` (type 0xff reads the byte before the row, X36).
    Evidence: asm 0b62:0b56..0b68 / 0b7c..0b8f (sort 0a03), ovl67:0834..083f / 0851..085c
    (leader of 06eb through the 0b62:0024 row pointer), ovl66 palette rows (see callers)."""
    return s8(state.fight_order_byte(row, a.type_id))


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
    M.store_selection_words(state)                       # DS:5dfe / 5e00 / 2bda / 5dfc / 5dfa
    lead = _live(state, sel.selected)
    group = [a for a in (_live(state, i) for i in sel.moving) if a is not None]
    if lead is None and sel.selected != -1:
        return
    sel.hero = lead.id if lead is not None and lead.type_id == HERO_TYPE else -1
    for a in group:
        if sel.hero < 0 and a.type_id == HERO_TYPE:
            sel.hero = a.id
    if lead is None:
        # Null DS:5e62 (ovl29:14d3 with slot 0 empty, ovl22:0c5b at 0e81): 0566 reads the type
        # byte at 0000:0004 and copies the null pointer or 0, both null, so DS:5e5e is the first
        # hero by slot; the goto copy 0723..0766 writes the words 0000:0012 / 0000:0014 (int 4
        # segment, int 5 offset) into every member's goto.  Not modelled: the only such caller,
        # ovl22:0c5b, overwrites every member's goto in 0ae7 (0f0c, kind 1 -> 0c7e) or deletes
        # them all (ovl24:00ca at 0f30) before anything reads it.
        return
    for a in group:
        a.goto = lead.goto
    if (state.players[state.current].control == Control.HUMAN
            and lead.goto[0] >= 0 and lead.goto[1] >= 0 and group):
        mode, mask = M.stack_mode(state, group)
        P.find_path(state, (lead.x, lead.y), lead.goto, mode, mask)


def build_palette(state) -> None:
    """ovl66:0d30: the palette of the leader's square: armies in square-list order, those in
    DS:5e3e[0..DS:5dfe-1] marked selected, and a palette group index that grows except
    between neighbours with the same nonzero +0x11.  With DS:2bda (the stored word) clear,
    DS:5dfe = 1 and DS:5e3e[0] = DS:5e62 first (slots 1..7 stay), as the palette draw does.
    Evidence: asm ovl66:0d30..0e84 (0d40 2bda, 0d47 5dfe = 1, 0d4d..0d51 5e3e[0], 0d65
    0b62:007d, 0d72 sort, 0d85..0db8 membership over slots 0..5dfe-1 (jl), 0dcb..0df3 index)."""
    sel = state.selection
    lead = _live(state, sel.selected)
    if lead is None:
        return
    if not sel.group:
        sel.count = 1
        if sel.moving:
            sel.moving[0] = sel.selected
        else:
            sel.moving = [sel.selected]
    members = sel.moving[:max(sel.count, 0)]
    sel.palette, sel.palette_selected, sel.palette_group = [], [], []
    prev, idx = -1, -1
    for a in square_list(state, lead.x, lead.y):
        if not (prev == a.group and a.group != 0 and idx >= 0):
            idx += 1
        sel.palette.append(a.id)
        sel.palette_selected.append(int(a.id in members))
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
    step, the group sort, the palette and the wake of the whole group.  Then the view: a human
    side (SCN 0x0d0[0x110] == 0, read directly, not through ovl25:09ab) gets ovl64:05b4 (the
    view centred on the leader when it is outside the view rectangle, `M.view_on_selection`);
    a computer side only with SCN 0x159, and then when DS:3254 is clear or the leader's
    square is not hidden in the one human's view (DS:2d56[ovl64:1055(x, y, 1)] != 0x0e,
    `V.hidden_single_view`).  A sunk stack returns before all of this (0736 -> 08f7).
    Evidence: asm ovl67:06eb..08f7 (0715..0736 sink, 077b..0866 members, 087f 5e62, 0888 0c8c:0529,
    088d 0b62:09ce, 0892 ovl66:0000 -> 0d30, 08a0 ovl67:0955(1); 08a4..08bb 0x0d0[p] == 0 -> 08ef,
    08c2 0x159 == 0 -> 08f4, 08ca DS:3254 == 0 -> 08ef, 08d1..08ed 1055(x, y, 1) and 2d56 == 0x0e
    -> 08f4, 08ef lcall ovl64:05b4)."""
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
    if sel.group:                                            # 0b62:09ce (09d1 DS:2bda)
        group = [state.armies[i] for i in sel.moving]
        sort_stack(state, group)
        sel.moving = [a.id for a in group]
    build_palette(state)
    _wake(state, True)
    if state.players[state.current].control == Control.HUMAN:      # 08b5
        M.view_on_selection(state)                                  # 08ef ovl64:05b4
    elif state.flags.get(KT.SCN_VIEWED.value, 0):                    # 08c2
        lead = state.armies[sel.selected]                          # 08d3 DS:5e62
        if not state.ai.proc.single_view or not V.hidden_single_view(state, lead.x, lead.y):
            M.view_on_selection(state)                              # 08ca / 08e8 -> 08ef
    return []


def adopt(state, ids) -> None:
    """Make the armies `ids` (checked by the caller) the selected stack, as the original has
    them when the player acts on a stack: unchanged when it already is the selection, else
    leader = the first id and moving group = `ids` in that order.
    The current stack is the one those routines act on: the non-null DS:5e3e slots when the
    stored DS:2bda is set, else DS:5e62 alone.
    Evidence: every order routine reads DS:5e62 / 5e3e / 2bda (ovl67:03a6 at 03ba, 08fb at 090a,
    0b62:06bf at 06d3 / 076f, 0a8b:0c4f -> 07f9 at 0820); no game rule of its own."""
    sel = state.selection
    current = [i for i in sel.moving if i != -1] if sel.group else [sel.selected]
    if sel.selected in ids and sorted(current) == sorted(ids):
        return
    sel.selected = ids[0]
    sel.moving = list(ids)
    M.store_selection_words(state)          # the select that made them ran 0c8c:0529


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
    events = select_army_stack(state, lst[0])
    redraw_palette(state)                                # asm 0b62:04e8
    return events + tutorial_pages(state, select=True)


def deselect(state, cmd: C.Deselect) -> list:
    """Deselect: DS:5e62 = null; the moving group, the palette and every army byte stay.
    Evidence: asm 0b62:08b3..0904 (key Del / button 178 via 07be:02f1 and ovl61:0f26):
    nothing when DS:5e62 is null (08bc); else DS:5e62 = 0 and, for a human side (0x0d0[0x110]
    == 0, 08f2), the palette draw ovl66:0356 (08fa; without DS:5e62 it writes nothing)."""
    sel = state.selection
    had = sel.selected >= 0
    sel.selected = -1
    if had and state.players[state.current].control == Control.HUMAN:
        redraw_palette(state)                    # asm 0b62:08fa
    return []


# ------------------------------------------------------------------------------- palette


def palette_moves(state) -> int:
    """0c8c:0912(DS:6862, DS:6842, DS:30f6): the lowest signed +7 of the palette entries whose
    selected word is nonzero, from 100 (strict <).  The pointer is read as it is: an entry
    whose record was freed since the palette was built gives that record's +7 (0: a freed
    record has 0 moves, `movement.remove_army`; a record above the table's end the same).
    Evidence: asm 0c8c:0915 (100), 091f..095f (0928 6842[i] != 0, 0938..0958 +7 cwde, jge)."""
    sel, low = state.selection, K.PALETTE_MOVES_START.value
    for aid, chosen in zip(sel.palette, sel.palette_selected):
        if chosen:
            v = s8(state.armies[aid].moves_left) if 0 <= aid < len(state.armies) else 0
            if v < low:
                low = v
    return low


def palette_list(state) -> None:
    """The DS:483c writes of the movement-kind cell ovl66:070d: 0872 0c8c:07fa(DS:6862, DS:6842,
    DS:30f6) runs ovl35:08b4 (0886 -> 08c3 ovl51:03d9 mode 2) for every palette entry whose
    selected word is set and whose type is 0x1c, in palette order; the record is read through
    the pointer as it is.  Called where 070d runs: inside ovl66:0356 (055c, `redraw_palette` and
    the host's 0356 points) and after a human move step (0a8b:0d05, before the palette rebuild
    0d0a).  Not modelled [unverified]: 070d's gate DS:30f8 (0721: set to 1 only by 0356's info
    area branch 05a9, to 0 by its stack branch 03a0); with DS:5e62 set it is 0 at both sites
    (every selection path ends in 0356).
    Evidence: asm ovl66:070d..090f (0721, 0866..0872); 0c8c:07fa..08e0 (0825..0845 pointer and
    flag, 0873 type 0x1c, 0886 ovl35:08b4); res_0a8b:0d01..0d0f; ovl66:055c."""
    from .bonuses import list_carried
    sel = state.selection
    if sel.selected < 0:
        return
    for aid, chosen in zip(sel.palette, sel.palette_selected):
        if chosen and 0 <= aid < len(state.armies) and state.armies[aid].type_id == HERO_TYPE:
            list_carried(state, state.armies[aid])


def redraw_palette(state) -> None:
    """The state writes of the palette draw ovl66:0356, which the original runs at the end of
    the selection commands (Select Stack 0b62:04e8, Next / Quit & Next / Defend ovl67:01e0,
    the palette buttons ovl66:0959 / 0a4a / 0a8f / 0acf / 14f3, Move All 0c8c:04fb, the human
    move 0a8b:0d0f, Disband "no" 0b62:075a -> ovl61:0000(0, 0)): without DS:5e62 nothing
    (the info area ovl66:05a3; DS:30f8 = 1 is display only); else with DS:2bda clear DS:5dfe = 1
    and DS:5e3e[0] = DS:5e62 (slot 0 only), and DS:5e00 = `palette_moves` (ovl66:055c ->
    070d -> 0750 0c8c:0912; 070d's DS:30f8 gate never blocks there, 0356 cleared it at 03a0).
    Each call counts in `GameState.palette_draws` (the user interface redraws its info area).
    Evidence: asm ovl66:035d..0391 (null -> 05a3, exit 0564), 0394..03a0, 03ab..03bc, 055c;
    ovl66:070d 0721 / 0750."""
    state.palette_draws += 1
    sel = state.selection
    if sel.selected < 0:
        return
    palette_list(state)                          # 055c -> 070d (its 08b4 lists into DS:483c)
    if not sel.group:
        sel.count = 1
        if sel.moving:
            sel.moving[0] = sel.selected
        else:
            sel.moving = [sel.selected]
    sel.moves = palette_moves(state)


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


def set_palette(state, cmd: C.SetPalette) -> list:
    """SetPalette(armies, group, selected): the Stack dialog's OK.  The dialog (ovl66:0c9c) edits
    the live palette arrays DS:6862 (army pointers), 6852 (palette index), 6842 (selected) - each
    button sorts them itself (ovl66:157d / 166f -> 17e7) - and OK hands them unchanged to the
    apply step: ovl66:14d3 -> ovl66:000a(0) (`apply_palette`), then ovl66:0356 (palette redraw;
    with DS:2bda clear it sets DS:5dfe = 1 and 5e3e = 5e62, which `apply_palette` already
    leaves).  So the command carries the three arrays in palette order and the engine applies
    them as they are, without a sort.  Refused: a palette that is out of date (`_palette`),
    `armies` not a permutation of the current palette, indices outside 0..7 (the dialog counts
    them in 8 words, ovl66:15d6..1633), flags other than 0 / 1, or no army selected (the dialog
    always keeps one: 157d leaves a selected army alone in its index selected; 000a would then
    run with DS:5e62 null).  Cancel (ovl66:14fd) restores the backup arrays: no command.
    Evidence: asm ovl66:14d3..14fc (14ee call 000a with 0, 14f3 call 0356), 000a 02e8 (the
    argument only picks the redraw), 0356 03ab..03bc, 14fd..157c (Cancel)."""
    sel = state.selection
    _palette(state)
    armies, group, selected = tuple(cmd.armies), tuple(cmd.group), tuple(cmd.selected)
    if not (len(armies) == len(group) == len(selected) == len(sel.palette)) \
            or sorted(armies) != sorted(sel.palette):
        raise IllegalCommand("the arrays are not a permutation of the stack palette")
    if any(not isinstance(g, int) or not 0 <= g < K.PALETTE_INDICES.value for g in group):
        raise IllegalCommand("palette index outside 0..%d" % (K.PALETTE_INDICES.value - 1))
    if any(f not in (0, 1) for f in selected) or not any(selected):
        raise IllegalCommand("selected flags must be 0 / 1 with at least one army selected")
    sel.palette, sel.palette_group, sel.palette_selected = list(armies), list(group), [int(f) for f in selected]
    apply_palette(state)
    redraw_palette(state)                        # asm ovl66:14f3
    return []


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
    redraw_palette(state)                        # asm ovl66:0a4a


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
    redraw_palette(state)                        # asm ovl66:0959
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
    redraw_palette(state)                        # asm ovl66:0a8f
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
    redraw_palette(state)                        # asm ovl66:0acf
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
        state.selection.selected = -1                # 01bf; the draw 01e0 then writes nothing
        return tutorial_pages(state, select=True)
    events = select_army_stack(state, p)
    redraw_palette(state)                            # asm ovl67:01e0
    return events + tutorial_pages(state, select=True)


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
    """ovl67:08fb: flag 0x40 on the selected stack (the leader alone without DS:2bda), then
    DS:2ea6 = 0 (path marks off) and the map draw ovl64:006c (present point "map").
    Evidence: asm ovl67:08fb..0953 (0945 DS:2ea6, 094b ovl64:006c)."""
    if _live(state, state.selection.selected) is None:
        return
    for a in _members(state):
        a.flags |= K.DONE.value
    present("map", at="ovl67:094b")


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


def search_move_all(state):
    """ovl67:05c4: like 040e but only armies without 0x200, and no cycle reset; the nearest
    becomes the reference square.  Callers: Move All 0c8c:0513, the AI's ovl22:026c.
    Evidence: asm ovl67:05c4 (as 040e: |dx| + |dy| to DS:3250 / 3252, 0 -> 9000, from the top
    index down, strict <)."""
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
        p = search_move_all(state)
        if p is None:
            return events
        p.flags |= K.VISITED.value
        if p.goto[0] < 0:
            continue
        events += select_army_stack(state, p)
        redraw_palette(state)                        # asm 0c8c:04fb
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
    quest (+0 = 0; the single-army path does not check); then DS:5e62 / 5e5e null and DS:2bda
    0 (DS:5e3e is left as it was, freed records included), the map bits are rebuilt
    (ovl62:0000).
    Evidence: asm 0b62:076a..08b2 (076f 2bda, 0781..079b single, 07a4..0878 group, 07f9..085c
    quest, 087d..088f 5e62 / 5e5e / 2bda = 0, 0895 ovl62:0000, 089a ovl62:02bf: the upkeep cache,
    not the income one), 0b62:08a7 ovl61:0000(0, 0) (its palette draw ovl66:0356 at 008f); 0b62:075a
    (no: ovl61:0000(0, 0))."""
    state.pending = None
    if not cmd.yes:
        redraw_palette(state)                    # asm 0b62:075a -> ovl61:0000(0, 0) -> 0356
        return []
    events: list = []
    members = _members(state)
    grouped = bool(state.selection.group)                    # 0b62:076f DS:2bda
    if any(a.type_id == HERO_TYPE for a in members):
        _require(C.ConfirmDisband, "hero_died")
    quest = state.players[state.current].quest
    for a in members:
        if a.type_id == HERO_TYPE:
            events += _call("hero_died", [], state, a.id, a.x, a.y)
            if grouped and quest.active != 0 and quest.hero == a.id:
                quest.active = 0
        M.remove_army(state, a)
    sel = state.selection                        # asm 0b62:087d..088f: DS:5e3e keeps the freed ids
    sel.selected, sel.hero, sel.group = -1, -1, 0
    refresh_map(state)
    refresh_upkeep(state)                        # asm 0b62:089a (ovl62:02bf only)
    redraw_palette(state)                        # asm 0b62:08a7 -> ovl61:0000(0, 0) -> 0356 (no DS:5e62)
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


# ------------------------------------------------------------------------------- tutorial


def _tutorial_page(state, bit: int, file) -> list:
    b = KT.SCN_TUTORIAL_BYTE.value
    state.flags[b] = state.flags.get(b, 0) | bit
    return [E.TurnCue({"kind": "tutorial", "file": file})]


def tutorial_pages(state, select: bool) -> list:
    """The tutorial pages after a select (`select`: also the first-select page (25, 3)) or a
    move: (25, 4) when a square around the selected army holds a city of another owner, (25, 5)
    when the selected army is a hero on a site square; each once a game (SCN byte 0x134).
    Without a selection (Next found nothing) only (25, 3): there the EXE reads the army words
    through the null DS:5e62 (0000:0000, the interrupt table), which is not reproducible.
    Evidence: asm 0b62:04f2..063f (select), ovl67:01ea..0337 (Next, also from Quit & Next
    ovl67:0393 and Defend ovl67:0409), 0c8c:02f0..0415 (move, without the (25, 3) part)."""
    if not state.flags.get(KT.SCN_TUTORIAL_FLAG.value, 0):
        return []
    b = KT.SCN_TUTORIAL_BYTE.value
    events = []
    if select and not state.flags.get(b, 0) & KT.TUT_SELECT_BIT.value:
        events += _tutorial_page(state, KT.TUT_SELECT_BIT.value, KT.TUT_SELECT_FILE.value)
    a = _live(state, state.selection.selected)
    if a is None:
        return events
    if not state.flags.get(b, 0) & KT.TUT_CITY_BIT.value:
        for dx, dy in KT.TUT_NEIGHBOURS.value:
            ci = state.city_at(a.x + dx, a.y + dy)
            if ci >= 0 and s8(state.cities[ci].owner) != state.current:
                events += _tutorial_page(state, KT.TUT_CITY_BIT.value, KT.TUT_CITY_FILE.value)
                break
    if not state.flags.get(b, 0) & KT.TUT_SITE_BIT.value \
            and state.world.terrain(a.x, a.y) == KT.TERRAIN_SITE.value and a.type_id == HERO_TYPE:
        events += _tutorial_page(state, KT.TUT_SITE_BIT.value, KT.TUT_SITE_FILE.value)
    return events


def screen_tutorial(state, cmd: C.ScreenTutorial) -> list:
    """ScreenTutorial(close): the tutorial tail of the city / site screen ovl45:0000 (every mode;
    the site screen M7b is mode 4 of the same routine).  Open (close False, ovl45:025d..02da):
    with SCN 0x12e set, byte 0x134 bit 0x02 clear -> set, page (25, 1); then bit 0x20 clear and
    the side's city count DS:5dea[SCN 0x110] >= 2 -> set, page (25, 6).  Close (close True,
    ovl45:02e1 after ovl61:011f, 02f9..0336): bit 0x04 clear -> set, page (25, 2).  One
    `TurnCue {"kind": "tutorial", "file": (25, n)}` per page in this order; the EXE shows each
    through ovl61:168d before it tests the next, which changes no state the next test reads.
    Evidence: asm ovl45:025d..02da, 02f9..0336; DS:5dea = rules.economy.cached_cities."""
    from .economy import cached_cities
    if not state.flags.get(KT.SCN_TUTORIAL_FLAG.value, 0):
        return []
    b = KT.SCN_TUTORIAL_BYTE.value
    if cmd.close:
        if state.flags.get(b, 0) & KT.TUT_SCREEN_CLOSE_BIT.value:
            return []
        return _tutorial_page(state, KT.TUT_SCREEN_CLOSE_BIT.value, KT.TUT_SCREEN_CLOSE_FILE.value)
    events = []
    if not state.flags.get(b, 0) & KT.TUT_SCREEN_OPEN_BIT.value:
        events += _tutorial_page(state, KT.TUT_SCREEN_OPEN_BIT.value, KT.TUT_SCREEN_OPEN_FILE.value)
    if not state.flags.get(b, 0) & KT.TUT_SCREEN_CITIES_BIT.value \
            and cached_cities(state, state.current) >= KT.TUT_SCREEN_CITIES_MIN.value:
        events += _tutorial_page(state, KT.TUT_SCREEN_CITIES_BIT.value, KT.TUT_SCREEN_CITIES_FILE.value)
    return events


def tutorial_after_move(state, status: int) -> list:
    """The tutorial step of 0c8c:01fd after a human move: status 2 (the stack is done and
    deselected) on turn 1 -> page (25, 9) every time; any other status -> the (25, 4) / (25, 5)
    checks of `tutorial_pages` for the selected army.
    Evidence: asm 0c8c:02a1..02db (status 2), 0c8c:02e9..0415 (else).  Not wired yet: the move
    tail lives in rules/movement.py (`_tail_01fd`), whose owner calls this."""
    if not state.flags.get(KT.SCN_TUTORIAL_FLAG.value, 0):
        return []
    if status == KT.MOVE_DONE.value:
        if max(state.turn, 1) == 1:
            return [E.TurnCue({"kind": "tutorial", "file": KT.TUT_DONE_FILE.value})]
        return []
    return tutorial_pages(state, select=False)
