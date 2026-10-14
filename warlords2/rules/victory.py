"""Elimination, the end states, the surrender offer and its answers, the victory screen and
Resign (EL §6.7).

Sources (re-read by M9a from out/asm/; EL = docs/research/exe_logic.md):

* elimination        ovl61:18ab (round end, ovl61:1825)
* end states         ovl61:1aed (round end, ovl61:182a)
* victory screen     ovl61:1fbd (from ovl68:04e3 and ovl61:1e4e), its button 0x1e3 -> ovl61:2004
* surrender offer    ovl61:1f68 (from ovl68:0502), buttons 0x1e5 -> ovl61:1e4e (accept) and
                     0x1e6 -> ovl61:1ecd (decline, its screen's button 0x1e4 -> ovl61:2046)
* Resign             ovl49:150d (Order > Resign), buttons 0x1e7 -> ovl49:1608(0) (graciously),
                     0x1e8 -> ovl49:1608(1), 0x1e9 -> ovl49:1832 (don't: redraw only)

The button ids come from the button dispatcher res_07be:04d9 (id - 100 indexes the jump table
07be:0b0c).  The victory and decline screens have a single button, so the engine runs its
handler at once: `Victory` / `TurnCue{"kind": "surrender_declined"}` mark the screen for the
presentation, and the events after them are the handler's continuation (ovl68:04bd(0)).
Not modelled (presentation only): music ovl58:0000, pictures ovl53:056a, message boxes
ovl61:10fb / 11d1 / 1160 (their texts are events), redraws ovl61:011f, ovl64:15da, ovl63:2200.
"""
from __future__ import annotations

import dataclasses

from ..model import commands as C
from ..model import events as E
from ..model.ids import HERO_TYPE, MAP_H, MAP_W, ROAD_SEEN, Control, Terrain
from ..model.state import SCN_ARMY_HIGH, SCN_SURRENDER_OFFERED, SCN_VICTORY
from . import diplomacy as D
from . import economy as EC
from . import heroes as H
from . import movement as M
from .constants import diplomacy as K
from .constants import turn as KT
from .engine import IllegalCommand
from .mapwords import refresh_map

N_SIDES = 8


def _msg(group_index, name) -> E.Msg:
    """A STRING.DAT message formatted with a side's name (sprintf 0000:4944 into DS:5c88)."""
    group, index = group_index
    return E.Msg(group=group, index=index, args=(name,))


HUMAN, COMPUTER = Control.HUMAN, Control.COMPUTER


def _remove_side_armies(state, p: int) -> list:
    """Every army of side p deleted from the top record down, heroes first through the
    hero-death step with SCN 0x110 = p (asm ovl61:191f..19de, ovl49:16e9..177b)."""
    events = []
    high = min(state.flags.get(SCN_ARMY_HIGH, len(state.armies)), len(state.armies))
    for i in range(high - 1, -1, -1):
        a = state.armies[i]
        if a.owner != p:
            continue
        if a.type_id == HERO_TYPE:
            cur, state.current = state.current, p
            try:
                events += H.hero_died(state, i, a.x, a.y)
            finally:
                state.current = cur
        M.remove_army(state, a)
    return events


def eliminate(state) -> list:
    """Every live side without a city is out, whatever armies it has: its armies are deleted
    (heroes through the hero-death step), news kind 4, one of the STRING 11 messages at random,
    alive = 0, gold = 0, and all its relations in both directions become neutral (current and
    proposal 1).
    Evidence: asm ovl61:18ab..1aec: ovl62:03f9; di = a live human exists (18b8..18f1); for p in
    0..7 with 0x137[p] and DS:5dea[p] == 0: armies 0x181-1..0 with owner p: type 0x1c ->
    ovl36:16cd(army, x, y) with 0x110 = p, then 0b62:03be; ovl41:1244(p, 4, p, 0, ""); the text
    ovl59:04f0(11, -1) (rnd(1, n, -1)) formatted with p's name, shown timed (ovl61:11d1) for a
    computer side when no human lives, else waiting (ovl61:10fb); 0x137[p] = 0, gold 0
    (1a5f / 1a71); [p][q] and [q][p] for q in 0..7: proposal 1, current 1 (1a89..1ad1)."""
    events = []
    live_human = any(pl.alive and pl.control == HUMAN for pl in state.players)
    group, n = K.ELIMINATED_MSG.value
    for p in range(N_SIDES):
        pl = state.players[p]
        if not pl.alive or EC.city_count(state, p) != 0:
            continue
        events += _remove_side_armies(state, p)
        H.news(state, p, K.NEWS_ELIMINATED.value, p, 0, "")
        index = state.rng.rnd(1, n, -1)
        events.append(E.PlayerEliminated({"player": p, "timed": pl.control == COMPUTER and not live_human}))
        events.append(_msg((group, index), pl.name))
        pl.alive = 0
        pl.gold = 0
        for q in range(N_SIDES):
            for a, b in ((p, q), (q, p)):
                D.set_proposal(state, a, b, K.NEUTRAL.value)
                D.set_current(state, a, b, K.NEUTRAL.value)
    return events


def check(state) -> list:
    """The end states at the round end: no side alive (the original quits); humans gone (the
    dead humans become computer sides, the war goes on); one live human, no computer and more
    than half of the intact cities -> victory; no human and one computer -> that computer wins
    and becomes a human side; one human against computers, no offer yet, more than half of
    all city records and more than the best computer + records / 8 -> surrender offer.
    Evidence: asm ovl61:1aed..1e4d: n = cities with terrain 10 at x, y (1aff..1b52); sides 7..0
    (1b60..1c03): live -> not "none alive"; human and dead -> d0 = 1, di = 1; live human -> di
    = 1, humans += 1, h = side; live computer -> computers += 1.  None alive: STRING 12 and exit
    0a4c:02b5 (1c06..1c55).  Not 0x15b, no live human, di: STRING 13 (1c5a..1cb7).  Not 0x15b,
    humans 1, computers 0, DS:5dea[h] > n / 2: 0x15b = 1, ovl41:1244(h, 7, h, 0, "") (1cba..1d04).
    Not 0x15b, humans 0, computers 1: 0x15b = 1, w = the first live side, STRING (15, 0) with its
    name, d0[w] = 0, ovl41:1244(w, 7, w, 0, "") (1d07..1d96).  Not 0x15b, humans 1, computers >= 1,
    not 0x15d: best = largest DS:5dea of a live computer; DS:5dea[h] > records / 2 and > best +
    records / 8 -> 0x15d = 1 (1d99..1e43); records = city count word 2c04:157b."""
    f = state.flags
    n_intact = sum(1 for c in state.cities if state.world.terrain(c.x, c.y) == Terrain.CITY)
    none_alive, seen, humans, h, computers = True, False, 0, -1, 0
    switched = []
    for p in range(N_SIDES - 1, -1, -1):
        pl = state.players[p]
        if pl.alive:
            none_alive = False
        if pl.control == HUMAN and not pl.alive:
            seen = True
            pl.control = COMPUTER
            switched.append(p)
        if pl.alive and pl.control == HUMAN:
            seen = True
            humans += 1
            h = p
        if pl.alive and pl.control == COMPUTER:
            computers += 1
    if none_alive:
        return [E.NoPlayersLeft({"msg": K.MSG_NO_PLAYERS.value})]
    events = []
    if not f.get(SCN_VICTORY, 0) and humans == 0 and seen:
        events.append(E.NoHumansLeft({"switched": switched, "msg": K.MSG_NO_HUMANS.value}))
    if not f.get(SCN_VICTORY, 0) and humans == 1 and computers == 0 \
            and EC.city_count(state, h) > n_intact // K.WIN_SHARE_DIV.value:
        f[SCN_VICTORY] = 1
        H.news(state, h, K.NEWS_VICTORY.value, h, 0, "")
    if not f.get(SCN_VICTORY, 0) and humans == 0 and computers == 1:
        f[SCN_VICTORY] = 1
        w = next((p for p in range(N_SIDES) if state.players[p].alive), N_SIDES)
        events.append(_msg(K.MSG_WINNER.value, state.players[w].name))
        state.players[w].control = HUMAN
        H.news(state, w, K.NEWS_VICTORY.value, w, 0, "")
    if not f.get(SCN_VICTORY, 0) and humans == 1 and computers >= 1 \
            and not f.get(SCN_SURRENDER_OFFERED, 0):
        best = 0
        for p in range(N_SIDES):
            pl = state.players[p]
            if pl.alive and pl.control == COMPUTER:
                best = max(best, EC.city_count(state, p))
        records = len(state.cities)
        mine = EC.city_count(state, h)
        if mine > records // K.SURRENDER_SHARE_DIV.value \
                and mine > best + records // K.SURRENDER_MARGIN_DIV.value:
            f[SCN_SURRENDER_OFFERED] = 1
    return events


# ------------------------------------------------------------------------------- the screens


def victory_screen(state) -> list:
    """The victory screen of the side on turn (ovl68:04bd when 0x15b is set and 0x157 not):
    0x157 = 1; its button switches Hidden Map off and the turn start goes on.
    Evidence: asm ovl61:1fbd..2003 (music 3, picture 0x20, button 0x1e3, 0x157 = 1 at 1ff6);
    button 0x1e3 -> ovl61:2004..2045: 0x124 = 0 (2026), redraw ovl61:011f(1, 1, 1),
    ovl68:04bd(0) (203e)."""
    from . import turn
    state.flags[KT.SCN_ACK_VICTORY.value] = 1
    events = [E.Victory({"player": state.current})]
    state.options = dataclasses.replace(state.options, hidden_map=0)
    return events + turn.resume(state, 0)


def surrender_offer(state) -> list:
    """The surrender offer to the side on turn (ovl68:04bd when 0x15d is set and 0x15f not):
    0x15f = 1 and the question is pending (AcceptSurrender answers it).
    Evidence: asm ovl61:1f68..1fbc: music 9, picture 0x1e, STRING 17 dialog, buttons 0x1e5 /
    0x1e6 enabled, 0x15f = 1 (1faf)."""
    state.flags[KT.SCN_ACK_SURRENDER.value] = 1
    ev = E.SurrenderOffered({"player": state.current, "text": 17})
    state.pending = ev
    return [ev]


def accept_surrender(state, cmd: C.AcceptSurrender) -> list:
    """Answer to the surrender offer.  Accept: every live computer side is out of the game (its
    cities and armies stay on the map), the side on turn has won (news kind 7) and the victory
    screen follows.  Decline: every live side's word 0x10f3 becomes the side on turn (read by the
    computer players; meaning in docs/research/ai.md), a screen with one button, and the turn
    start goes on.
    Evidence: accept, button 0x1e5 -> asm ovl61:1e4e..1ecc: 0x137[d] = 0 for live d with d0 == 1
    (1e55..1e8b); 0x15b = 1 (1e92); ovl41:1244(0x110, 7, 0x110, 0, "") (1eaf); ovl61:1fbd (1ec3).
    Decline, button 0x1e6 -> ovl61:1ecd..1f67: music 0xa, picture 0x1f, button 0x1e4; for every
    live c and every live human: 0x10f3[c] = 0x110 (1f0a..1f63); button 0x1e4 -> ovl61:2046..2073:
    redraw ovl61:011f(0, 0, 0), ovl68:04bd(0)."""
    from . import turn
    if not isinstance(state.pending, E.SurrenderOffered):
        raise IllegalCommand("no surrender offer pending")
    state.pending = None
    p = state.current
    if cmd.yes:
        for pl in state.players:
            if pl.alive and pl.control == COMPUTER:
                pl.alive = 0
        state.flags[SCN_VICTORY] = 1
        H.news(state, p, K.NEWS_VICTORY.value, p, 0, "")
        return victory_screen(state)
    if any(pl.alive and pl.control == HUMAN for pl in state.players):
        for c in range(N_SIDES):
            if state.players[c].alive:
                state.flags[K.SCN_ENEMY.value + 2 * c] = p
    return [E.TurnCue({"kind": "surrender_declined"})] + turn.resume(state, 0)


# ------------------------------------------------------------------------------- Resign


def resign(state, cmd: C.Resign) -> list:
    """Resign the side on turn (graciously or not, the result is the same): every own city is
    razed, every own army deleted (heroes through the hero-death step), with Hidden Map the
    whole map becomes seen, the selection is cleared.  The side stays alive until the round end
    finds it without cities (`eliminate`).  Nothing happens for a side without cities.
    Evidence: asm ovl49:150d..1607: DS:5dea[0x110] == 0 -> return (151c); else the STRING 165
    dialog with buttons 0x1e7 / 0x1e8 / 0x1e9.  ovl49:1608(di): di == 0 -> STRING 165 entries 6-10
    (1619..168f); cities 0..records-1 with owner byte == 0x110: ovl32:016b(x, y, 0) (1694..16e7);
    armies 0x181-1..0 of 0x110: type 0x1c -> ovl36:16cd, then 0b62:03be (16e9..177b); SCN 0x124:
    road-layer bit 0x20 on all 112 x 156 squares, ovl63:2200 (177d..17c0); DS:5e5e, 5e62, 5e3e[8]
    = 0 (17c1..17e5); ovl62:0000 (17e7); di == 1 -> STRING 165 entries 4-5 (1801..182b)."""
    from . import city as CT
    p = state.current
    pl = state.players[p]
    if pl.control != HUMAN or not pl.alive:
        raise IllegalCommand("Resign: side %d is not a human side on turn" % p)
    if EC.city_count(state, p) == 0:
        return []
    events = [E.Resigned({"player": p, "graceful": bool(cmd.graceful)})]
    for ci, c in enumerate(state.cities):
        if c.owner == p:
            events += CT.raze(state, ci)
    events += _remove_side_armies(state, p)
    if state.options.hidden_map:
        roads = state.world.roads
        for i in range(MAP_W * MAP_H):
            roads[i] |= ROAD_SEEN
    sel = state.selection
    sel.hero, sel.selected, sel.moving = -1, -1, []
    refresh_map(state)
    return events
