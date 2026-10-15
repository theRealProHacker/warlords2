"""Diplomacy: proposals, the proposal marks, the resolution at a side's turn start, the infamy
for refused proposals, treachery and the diplomatic rating (EL §6.6).

Sources (re-read by M9a from out/asm/; EL = docs/research/exe_logic.md):

* proposal        ovl00:0a69 (the Diplomatic Action buttons): proposal bits of [0x110][b]
* marks           ovl00:0cc7 (main-loop pass ovl61:219c): bits 4 / 5 of [p][p]
* resolution      ovl00:0db3 (computer turn ovl68:0153, human turn ovl68:02f4)
* penalty         ovl00:1063 (human End Turn ovl61:2087)
* treachery       the question of ovl36:0000 (rules/combat.py, STRING 140 via ovl56:0088), its
                  buttons ovl36:20a8 (go ahead) and ovl36:2262 (redraw only)
* rating          ovl00:0aed (called by the Diplomatic Report ovl00:0039)

The relation byte 2c04:153b[a*8+b] is `state.relations[a][b]`: bits 0-1 the current state of a
towards b, bits 2-3 a's proposal to b (0 peace, 1 neutral, 2 war), bits 4-5 of the diagonal byte
[p][p] the marks of ovl00:0cc7, bits 6-7 kept.  ovl25:09ab ("show the message"), which the
resolution and treachery test, is rules.heroes.is_computer: SCN 0x0d0[0x110] == 1, or DS:0836
!= 0, which is 1 only while ovl25:0000 runs (set at ovl25:0071, cleared at ovl25:0354), i.e. while
a computer side is on turn.
Not modelled (presentation only): the redraws ovl61:011f and the message boxes ovl61:11d1; the
messages are `Msg` events.  News entries go through rules.heroes.news (ovl41:1244).  For the
kinds 8, 9 and 10 the original pushes a NULL far pointer as the name (`push 0` dword at
ovl00:0f0d / 101f, ovl36:2240) and ovl41:1244 strcpy's (0000:4a70, asm ovl41:130d..1324) the
bytes at 0000:0000 (the interrupt vector table) into the entry's name field: garbage, but never
displayed, since the news texts of these kinds print only the two side names (cases ovl41:1633,
164f, 166b format the records 2c04:0 + side * 0x14).  The name is recorded as "" here.
"""
from __future__ import annotations

from ..model import commands as C
from ..model import events as E
from ..model.ids import MAP_OWNER_MASK, MAP_W, NO_OWNER, Relation
from . import heroes as H
from .constants import diplomacy as K
from .constants import turn as KT
from .present import present
from .economy import s16
from .engine import IllegalCommand

N_SIDES = 8


def _msg(group_index, name) -> E.Msg:
    """A STRING.DAT message formatted with a side's name (sprintf 0000:4944 into DS:5c88)."""
    group, index = group_index
    return E.Msg(group=group, index=index, args=(name,))


# ------------------------------------------------------------------------------- the byte


def current(state, a: int, b: int) -> int:
    """Current state of a towards b.
    Evidence: asm ovl00:0dda..0ddf: byte 2c04:153b[a*8+b] & 3."""
    return state.relations[a][b] & K.CURRENT_MASK.value


def proposal(state, a: int, b: int) -> int:
    """a's proposal to b.
    Evidence: asm ovl00:0dee..0df6: (byte 2c04:153b[a*8+b] >> 2) & 3."""
    return (state.relations[a][b] >> K.PROPOSAL_SHIFT.value) & K.CURRENT_MASK.value


def set_current(state, a: int, b: int, v: int) -> None:
    """Evidence: asm ovl00:0e58..0e5e: and 0xfc, or v."""
    m = K.CURRENT_MASK.value
    state.relations[a][b] = (state.relations[a][b] & ~m & 0xFF) | (v & m)


def set_proposal(state, a: int, b: int, v: int) -> None:
    """Evidence: asm ovl00:0ee0..0ee9: and 0xf3, or v << 2."""
    m, s = K.CURRENT_MASK.value, K.PROPOSAL_SHIFT.value
    state.relations[a][b] = (state.relations[a][b] & ~(m << s) & 0xFF) | ((v & m) << s)


MSG_WAIT = 0x14                     # ovl00:0f5f / ovl36:2232: ovl61:11d1(msg, 0x14)


def _present_msg(ev, wait: int) -> None:
    """The message through ovl61:11d1(msg, wait) (present point "message")."""
    present("message", group=ev.group, index=ev.index, args=ev.args, wait=wait)


def _shown(state) -> bool:
    """ovl25:09ab and SCN 0x159 (asm ovl00:0f1d..0f34)."""
    return bool(state.flags.get(KT.SCN_VIEWED.value, 0)) and H.is_computer(state)


# ------------------------------------------------------------------------------- proposals


def propose(state, cmd: C.Propose) -> list:
    """The side on turn proposes `relation` to side `other` (the Diplomatic Action buttons).
    Evidence: asm ovl00:0a69..0aec: proposal bits of [0x110][b] = relation & 3 (and 0xf3, shl 2,
    or); a human side's dialog lists the other sides without itself, so the button index cx is
    raised by one from the own column on (0a80..0a94: SCN 0x0d0[0x110] == 0 and 0x110 <= cx ->
    cx + 1).  `cmd.other` here is the real side index, already past that shift: the M9b
    Diplomatic Action dialog converts its button index b to b + (b >= own side); then the
    dialog is redrawn (0ad6..0ae6).  The dialog opens only with Diplomacy on (ovl00:0346 tests
    SCN 0x11c); 0a69 itself tests nothing else (a dead side's column is drawn empty, ovl00:052c)."""
    p = state.current
    if not state.options.diplomacy:
        raise IllegalCommand("Diplomacy is off")
    if not (isinstance(cmd.other, int) and 0 <= cmd.other < N_SIDES) or cmd.other == p:
        raise IllegalCommand("no other side %r" % (cmd.other,))
    if cmd.relation not in tuple(Relation):
        raise IllegalCommand("unknown relation %r" % (cmd.relation,))
    set_proposal(state, p, cmd.other, int(cmd.relation))
    return []


def mark_proposals(state) -> None:
    """Marks on the diagonal byte of the side on turn p: bit 4 when some side b != p has a
    proposal to p that differs from its current state, bit 5 when every such proposal is more
    peaceful than the current state (the action-palette diplomacy button, X31).
    Evidence: asm ovl00:0cc7..0db2: [p][p] &= ~0x10, ~0x20; for b in 0..7, b != p, byte [b][p]:
    proposal < current -> di = 1, proposal > current -> [bp-2] = 1; di or [bp-2] -> |= 0x10;
    di and not [bp-2] -> |= 0x20.  (Correction to the turn.py hook text, which had "more
    hostile": proposal < current is the peaceful case.)"""
    p = state.current
    friendly = hostile = False
    for b in range(N_SIDES):
        if b == p:
            continue
        cur, prop = current(state, b, p), proposal(state, b, p)
        if cur == prop:
            continue
        if prop < cur:
            friendly = True
        else:
            hostile = True
    v = state.relations[p][p] & ~(K.MARK_PENDING.value | K.MARK_FRIENDLY.value) & 0xFF
    if friendly or hostile:
        v |= K.MARK_PENDING.value
    if friendly and not hostile:
        v |= K.MARK_FRIENDLY.value
    state.relations[p][p] = v


def resolve(state, a) -> list:
    """Side a's proposals take effect at the start of its turn: a proposal more hostile than the
    current state at once in both directions (b's own proposal raised to it when lower); a more
    peaceful one only when b's proposal to a is at least as peaceful, else nothing.
    Evidence: asm ovl00:0db3..1062 (a = SCN 0x110), for b = 0..7, b != a, current(a, b) !=
    proposal(a, b) = q: current < q (0e2b): current(a, b) = current(b, a) = q; proposal(b, a) <
    current(b, a) -> proposal(b, a) = current(b, a) (0eb9..0ee9); q == 2: ovl41:1244(a, 9, a, b,
    NULL), and with SCN 0x159 and ovl25:09ab STRING (111, 1) with b's name.  current > q (0f70):
    proposal(b, a) <= q (0f9e) -> current(a, b) = current(b, a) = q; q == 0: ovl41:1244(a, 10,
    a, b, NULL), message STRING (111, 0) under the same test."""
    events = []
    for b in range(N_SIDES):
        if b == a:
            continue
        cur, q = current(state, a, b), proposal(state, a, b)
        if cur == q:
            continue
        if cur < q:
            set_current(state, a, b, q)
            set_current(state, b, a, q)
            if proposal(state, b, a) < current(state, b, a):
                set_proposal(state, b, a, current(state, b, a))
            events.append(E.RelationChanged({"a": a, "b": b, "relation": q, "agreed": False}))
            if q == K.WAR.value:
                H.news(state, a, K.NEWS_WAR.value, a, b, "")
                if _shown(state):
                    events.append(_msg(K.MSG_WAR.value, state.players[b].name))
                    _present_msg(events[-1], MSG_WAIT)
        elif proposal(state, b, a) <= q:
            set_current(state, a, b, q)
            set_current(state, b, a, q)
            events.append(E.RelationChanged({"a": a, "b": b, "relation": q, "agreed": True}))
            if q == K.PEACE.value:
                H.news(state, a, K.NEWS_PEACE.value, a, b, "")
                if _shown(state):
                    events.append(_msg(K.MSG_PEACE.value, state.players[b].name))
                    _present_msg(events[-1], MSG_WAIT)
    return events


def penalty(state) -> list:
    """Infamy of the side ending its turn for each side that answers a more peaceful proposal
    with a more hostile one: peace proposed while neutral rnd(1,2,0)+1, peace while at war
    rnd(1,10,0)+10, neutral while at war rnd(1,2,0)+1.
    Evidence: asm ovl00:1063..11bc (p = SCN 0x110), for b = 0..7, b != p: proposal(p, b) <
    current(p, b) (10a9) and proposal(p, b) < proposal(b, p) (10de); then the three cases
    (10fc..1197); infamy word 2c04:10e3[p] += the roll (11ab).  The other pairs roll nothing.
    Nothing is shown, so no events."""
    p = state.current
    cases = {(K.PEACE.value, K.NEUTRAL.value): K.PENALTY_PEACE_FROM_NEUTRAL.value,
             (K.PEACE.value, K.WAR.value): K.PENALTY_PEACE_FROM_WAR.value,
             (K.NEUTRAL.value, K.WAR.value): K.PENALTY_NEUTRAL_FROM_WAR.value}
    for b in range(N_SIDES):
        if b == p:
            continue
        q, cur = proposal(state, p, b), current(state, p, b)
        if not (q < cur and q < proposal(state, b, p)):
            continue
        case = cases.get((q, cur))
        if case is None:
            continue
        roll, add = case
        v = state.rng.rnd(*roll) + add
        state.players[p].infamy = s16(state.players[p].infamy + v)
    return []


# ------------------------------------------------------------------------------- treachery


def treachery(state, x: int, y: int) -> list:
    """The side on turn breaks its peace or neutrality with the owner of (x, y): infamy
    rnd(1,100,0)+100 from peace, rnd(1,15,0)+10 from neutral (nothing at war), war in both
    directions (current and proposal); a human side's attack is then made; news entry kind 8.
    Evidence: asm ovl36:20a8..2261: o = owner nibble of the map word at (DS:415e, DS:415c), 0x0f
    -> nothing; current(p, o) == 0 -> rnd(1,100,0) + 100, == 1 -> rnd(1,15,0) + 10, infamy
    2c04:10e3[p] += it (2146); [p][o] and [o][p]: current 2, proposal 2 (215f..21c9); not
    ovl25:09ab (a human side): redraw and ovl36:0000(x, y) again (21cf..21ee); ovl25:09ab and
    SCN 0x159: STRING (111, 2) with o's name (21f4..2238); ovl41:1244(p, 8, p, o, NULL) (2257).
    The attack uses the selection (DS:5e62 / 5e3e), which the question left as the group.  The
    capture question (ovl31:0000) is answered inside that nested ovl36:0000 before 21f4 runs; here
    the attack returns with CityCaptured pending (the only question it can leave there: combat.py
    raises TreacheryPrompt only before the relation is war), so the kind-8 entry goes into the
    event's info["news_after"] and rules.city.capture writes it after the answer's own entries.
    Between 21ee and 2257 a human side writes nothing else (21f4 tests ovl25:09ab)."""
    from . import combat
    w = state.world
    o = w.flags[y * MAP_W + x] & MAP_OWNER_MASK
    if o == NO_OWNER:
        return []
    p = state.current
    rel = current(state, p, o)
    events = []
    v = 0
    if rel in (K.PEACE.value, K.NEUTRAL.value):
        roll, add = (K.TREACHERY_FROM_PEACE if rel == K.PEACE.value else K.TREACHERY_FROM_NEUTRAL).value
        v = state.rng.rnd(*roll) + add
        state.players[p].infamy = s16(state.players[p].infamy + v)
    for a, b in ((p, o), (o, p)):
        set_current(state, a, b, K.WAR.value)
        set_proposal(state, a, b, K.WAR.value)
    events.append(E.Treachery({"player": p, "other": o, "from": rel, "infamy": v, "x": x, "y": y}))
    news = [p, K.NEWS_TREACHERY.value, p, o, ""]
    if not H.is_computer(state):
        group = tuple(state.selection.moving)
        events += combat.attack(state, C.Attack(group, x, y))
        if isinstance(state.pending, E.CityCaptured):
            # The capture dialog is modal inside the nested ovl36:0000, so what its answer
            # writes (a quest entry via ovl01:1ded) comes before 2257: rules.city.capture
            # writes this entry after the answer.
            state.pending.info["news_after"] = news
            return events
    elif state.flags.get(KT.SCN_VIEWED.value, 0):
        events.append(_msg(K.MSG_TREACHERY.value, state.players[o].name))
        _present_msg(events[-1], MSG_WAIT)                 # ovl61:11d1(.., 0x14) at 2238
    H.news(state, *news)
    return events


def confirm_treachery(state, cmd: C.ConfirmTreachery) -> list:
    """Answer to the attack-without-war question (TreacheryPrompt): yes makes the treachery
    and the attack, no changes nothing.
    Evidence: ovl36:0000 shows the yes / no dialog ovl56:0088 with the far handlers 3024:006b ->
    ovl36:20a8 (`treachery`) and 3024:0070 -> ovl36:2262 (ovl61:011f redraw only), then returns
    (asm ovl36:010c..0170)."""
    ev = state.pending
    if not isinstance(ev, E.TreacheryPrompt):
        raise IllegalCommand("no treachery question pending")
    state.pending = None
    if not cmd.yes:
        return []
    return treachery(state, ev.info["x"], ev.info["y"])


# ------------------------------------------------------------------------------- rating


def rating(state) -> list:
    """The diplomatic rating: the live sides in rank order (least infamy first, ties in side
    order) with the STRING 106 title index of each rank.
    Evidence: asm ovl00:0aed..0cb6: list of live sides (0x137) in index order; insertion sort
    ascending by the signed word 2c04:10e3[side] with a strict < (0b92..0b9b, stable); titles
    from the jump table ovl00:0cb7 indexed by count - 1 (cases 0bb9..0c82).  Returns [(side,
    title)]; empty without live sides (the jump-table index is out of range there).  The inner
    loop compares infamy[list[cx]] with infamy[list[cx - 1]] before its cx > 0 test (0b66..0b9b),
    so at cx = 0 it reads the word before the list (a stack word); the cx test then stops the
    loop either way, so the read changes nothing."""
    sides = [p.index for p in state.players if p.alive]
    sides.sort(key=lambda s: s16(state.players[s].infamy))
    titles = K.RATING_TABLE.value.get(len(sides), ())
    return list(zip(sides, titles))
