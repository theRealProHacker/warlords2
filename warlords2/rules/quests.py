"""Quests: assignment at a temple, the per-event check, completion and the reward.

Sources (re-read by M7a from out/asm/ — Ghidra lost the switch tables of all three):

* assignment             ovl01:0d7a (L 0x4a4ba), jump table ovl01:1512
* check                  ovl01:1ded (L 0x4b52d), jump table ovl01:2745 indexed by event + 1
* reward                 ovl01:1909 (choice), ovl01:1c02 (apply, jump table ovl01:1de5)
* human reward dialog    ovl01:1520, closed by ovl01:18a1 (re-selection, then the continuation
                         DS:3f64 the caller passed in words 4-5)

Callers of the check and their words (event, w1, value, continuation offset, segment):
start of turn -1 (ovl68:01d9 computer, ovl68:04a1 human; M8a), battle 0 (ovl36:04b7 / 04d7, via
`after_battle`), pillage / sack 1 with the gold (ovl31:03f3 / 04fd), raze 2 (ovl31:0354),
items 3 (ovl40:0b4f item dialog, ovl34:1959 search result), occupy 4 (ovl31:0427), and the AI
(ovl26:04af, ovl36:1697).  Events 0, 1, 2 and 4 test the quest hero against the attackers of the
last battle set-up (DS:42c6), kept in `state.battle_work`, which rules.combat writes at every
set-up (ovl38:008b, also the advisor's trial battles).
"""
from __future__ import annotations

from ..model import events as E
from ..model.ids import HERO_TYPE, NO_OWNER, Control, ItemState, Terrain
from .bonuses import s8
from .constants import heroes as K
from . import heroes as H

CITY = Terrain.CITY


# ------------------------------------------------------------------------------- helpers


def item_location(state, i: int):
    """(x, y) of item i, or None when it is not in play.
    Evidence: asm ovl35:0b36..0c18: state 0 -> 0 (x, y untouched); 1 -> its +0x19 / +0x1b; 2 ->
    the site +0x17's x, y; 3 -> the army +0x17's x, y."""
    it = state.items[i]
    if it.state == ItemState.NOT_IN_PLAY or it.state > ItemState.CARRIED:
        return None
    if it.state == ItemState.ON_MAP:
        return it.x, it.y
    if it.state == ItemState.IN_SITE:
        s = state.sites[it.holder]
        return s.x, s.y
    a = state.armies[it.holder]
    return a.x, a.y


def special(item) -> bool:
    """Evidence: ovl35:08f4: type 6, 5 or 8, or type 2 with signed value > 1."""
    return item.type in (5, 6, 8) or (item.type == 2 and s8(item.value) > 1)


def _city_intact(state, ci: int) -> bool:
    c = state.cities[ci]
    return state.world.terrain(c.x, c.y) == CITY


def _city_owner(state, ci: int) -> int:
    return s8(state.cities[ci].owner)


def _human(state) -> bool:
    return state.players[state.current].control == Control.HUMAN


# ------------------------------------------------------------------------------- assignment


def assign(state, computer: bool) -> list:
    """Give the current side a quest for its selected hero (DS:5e5e).
    Evidence: asm ovl01:0d7a..1511: news (3, 0, 0, name); then attempts: the hero's index;
    a human draws the type from DS:00a0[rnd(1,10,-1)], the computer tries 4 (rnd(1,5,-1) != 0)
    or 5, then 3, then 6 (6 again on later attempts); record +0 = 1, +4 = hero, +2 = type; an
    infeasible type starts a new attempt.  0: a random enemy hero (count, k = rnd(1,n,0), the
    k-th from the top index).  1: an item that is not special within |dx|, |dy| < 50 (30 for the
    computer) of the hero: counted with state 2, picked (k = rnd(1,n,0)) among state != 0; the
    item's square is revealed (ovl64:1298), a site there is marked shown and its overview pixels
    redrawn (ovl63:2785).  2: up to 5 types from ovl47:1a9b until an enemy army of it stands on
    the map.  3: not while SCN 0x15b; up to 200 sides rnd(1,8,-1) other and alive (found on the
    200th try still fails), +8 = rnd(1,12,10), +0xa = 0.  4 / 5: not while SCN 0x15b; up to 200
    cities rnd(1,count,-1) not own and intact, within 60 (4: 40 for the computer) or after 100
    tries (found on the 200th still fails).  6: +6 = 0, +0xa = 0, +8 = rnd(3,300,500).
    Without any city record rnd(1,0,-1) = -1 and the original reads record -1; here such a try
    fails (deliberate divergence)."""
    from .setup import distance
    p = state.current
    q = state.players[p].quest
    hero = H.live(state, state.selection.hero)
    if hero is None:
        raise ValueError("no hero selected (DS:5e5e)")
    H.news(state, p, K.NEWS_QUEST.value, 0, 0, H.hero_name(state, hero))
    rnd = state.rng.rnd
    attempt, qtype = 0, None
    while True:
        attempt += 1
        if computer:
            if attempt == 1:
                qtype = 4 if rnd(*K.QUEST_AI_FIRST.value) != 0 else 5
            elif attempt <= len(K.QUEST_AI_ORDER.value):
                qtype = K.QUEST_AI_ORDER.value[attempt - 1]
        else:
            qtype = K.QUEST_TABLE.value[rnd(*K.QUEST_TABLE_ROLL.value)]
        q.active, q.hero, q.type = 1, hero.id, qtype
        if qtype == 0:
            enemies = [a for a in reversed(state.armies) if a.type_id == HERO_TYPE and s8(a.owner) != p]
            if not enemies:
                continue
            q.target = enemies[rnd(1, len(enemies), 0) - 1].id
            break
        if qtype == 1:
            lim = K.QUEST_ITEM_RANGE.value[1 if computer else 0]

            def near(i):
                loc = item_location(state, i)
                return loc is not None and not special(state.items[i]) \
                    and abs(hero.x - loc[0]) < lim and abs(hero.y - loc[1]) < lim
            n = sum(1 for i in range(len(state.items))
                    if near(i) and state.items[i].state == ItemState.IN_SITE)
            if n == 0:
                continue
            k = rnd(1, n, 0)
            picks = [i for i in range(len(state.items)) if near(i)]
            q.target = picks[k - 1]
            x, y = item_location(state, q.target)
            from .visibility import reveal
            reveal(state, x, y, H.selection_flying(state))
            si = state.site_at(x, y)
            if si >= 0:
                state.sites[si].shown_mask |= 1 << p
                H.overview_rolls(state, x, y)
            break
        if qtype == 2:
            found = False
            for _ in range(K.QUEST_TYPE_TRIES.value):
                t = H.ally_type(state)
                found = any(a.type_id == t and s8(a.owner) != p and a.x >= 0 and a.y >= 0
                            for a in state.armies)
                if found:
                    break
            if not found:
                continue
            q.target = t
            break
        if qtype == 3:
            if state.flags.get(0x15B, 0):
                continue
            tries, found, d = 0, False, 0
            while not found and tries < K.QUEST_SIDE_TRIES.value:
                d = rnd(*K.QUEST_SIDE_ROLL.value)
                found = d != p and bool(state.players[d].alive)
                tries += 1
            if tries >= K.QUEST_SIDE_TRIES.value:
                continue
            q.target = d
            q.amount = rnd(*K.QUEST_KILLS.value)
            q.progress = 0
            break
        if qtype in (4, 5):
            if state.flags.get(0x15B, 0):
                continue
            if qtype == 4:
                lim = K.QUEST_OCCUPY_RANGE.value[1 if computer else 0]
            else:
                lim = K.QUEST_RAZE_RANGE.value
            tries, found, ci = 0, False, 0
            while not found and tries < K.QUEST_CITY_TRIES.value:
                ci = rnd(1, len(state.cities), K.QUEST_CITY_ROLL_ADD.value)
                c = state.cities[ci] if 0 <= ci < len(state.cities) else None
                if c is not None and _city_owner(state, ci) != p and _city_intact(state, ci):
                    if distance(hero.x, hero.y, c.x, c.y) <= lim or tries >= K.QUEST_CITY_ANY_FROM.value:
                        found = True
                tries += 1
            if tries >= K.QUEST_CITY_TRIES.value:
                continue
            q.target = ci
            break
        q.target, q.progress = 0, 0
        q.amount = rnd(*K.QUEST_GOLD.value)
        break
    return [E.QuestAssigned({"player": p, "hero": q.hero, "type": q.type, "target": q.target,
                             "amount": q.amount, "attempts": attempt})]


# ------------------------------------------------------------------------------- check


def _fail(state, reason: str) -> tuple:
    q = state.players[state.current].quest
    q.active = 0
    return 0, [E.QuestFailed({"player": state.current, "reason": reason,
                              "group": K.QUEST_FAIL_MSG.value[reason], "message": _human(state)})]


def _in_attackers(state, hero_id: int) -> bool:
    """[bp-2] of ovl01:1ded: the quest hero is one of DS:42c6[0..42c4) of the last battle."""
    return hero_id in state.battle_work.attackers


def check(state, words) -> tuple:
    """Check the current side's quest after an event; returns (1 when it was completed, events).
    Evidence: asm ovl01:1ded..2744 (words = event, w1, value, continuation offset, segment):
    no active quest -> 0; the hero record's owner (signed) != SCN 0x110 -> failure (STRING 32).
    -1: occupy (4) or raze (5) target no longer terrain 10 -> failure 33; 4 / 5 and the target
    city owned by the side -> 42; 0 and the target army no longer a hero -> 41; 3 and the target
    side dead -> 39; 1 and the item out of play -> 40.  0 (battle, hero among the attackers):
    3 and the defending owner (DS:41fb) is the target: + dead defenders, done at the amount;
    2: a dead defender of the target type; 0: the target among the dead defenders.  4 (occupy):
    4 and the target own and intact: done with the hero among the attackers, else failure 34
    (returns at once); 5 and the target own and intact -> failure 35.  1 (pillage / sack): 4 / 5
    and the target own and intact -> failure 36; 6 with the hero among the attackers: + value,
    done at the amount.  2 (raze): 5, target owner 0x0f, not intact and the hero's square in it
    (ovl62:044a): done with the hero among the attackers, else failure 37 (returns at once);
    4 and the target not intact -> failure 38.  3 (items): 1 and the item carried by the hero:
    the item leaves play (state 0), done.  Failure clears +0; a human gets the message (group
    as listed, ovl61:1160).  Done: +0 = 0, DS:3f64 = the continuation, ovl01:1909 / 1c02 reward;
    a human hears it (ovl58:0000(3)) and sees ovl01:1520, closed by ovl01:18a1, which selects
    the stack at DS:5e5e's square again (0b62:007d, 0b62:09ec, ovl67:06eb)."""
    ev = int(words[0])
    value = int(words[2])
    p = state.current
    q = state.players[p].quest
    if not q.active:
        return 0, []
    hero = state.armies[q.hero] if 0 <= q.hero < len(state.armies) else None
    if hero is None or s8(hero.owner) != p:
        return _fail(state, "hero")
    t = q.type
    done = False
    bw = state.battle_work
    if ev == -1:
        if t == 4 and not _city_intact(state, q.target):
            return _fail(state, "razed")
        if t == 5 and not _city_intact(state, q.target):
            return _fail(state, "razed")
        if t in (4, 5) and _city_owner(state, q.target) == p:
            return _fail(state, "owned")
        if t == 0 and state.armies[q.target].type_id != HERO_TYPE:
            return _fail(state, "hero_target_dead")
        if t == 3 and not state.players[q.target].alive:
            return _fail(state, "side_dead")
        if t == 1 and state.items[q.target].state == ItemState.NOT_IN_PLAY:
            return _fail(state, "item_lost")
    elif ev == 0:
        if _in_attackers(state, q.hero):
            dead = [i for i, alive in enumerate(bw.d_alive) if not alive]
            if t == 3 and bw.owner == q.target:
                q.progress = (q.progress + len(dead)) & 0xFFFF
                done = s16(q.progress) >= s16(q.amount)
            elif t == 2:
                done = any(bw.d_types[i] == q.target for i in dead)
            elif t == 0:
                done = any(bw.defenders[i] == q.target for i in dead)
    elif ev == 4:
        inside = _in_attackers(state, q.hero)
        if t == 4 and _city_owner(state, q.target) == p and _city_intact(state, q.target):
            if not inside:
                return _fail(state, "without_hero")
            done = True
        if t == 5 and _city_owner(state, q.target) == p and _city_intact(state, q.target):
            return _fail(state, "occupied")
    elif ev == 1:
        inside = _in_attackers(state, q.hero)
        if t in (4, 5) and _city_owner(state, q.target) == p and _city_intact(state, q.target):
            return _fail(state, "plundered")
        if inside and t == 6:
            q.progress = (q.progress + value) & 0xFFFF
            done = s16(q.progress) >= s16(q.amount)
    elif ev == 2:
        inside = _in_attackers(state, q.hero)
        if t == 5 and _city_owner(state, q.target) == NO_OWNER and not _city_intact(state, q.target) \
                and state.city_at(hero.x, hero.y) == q.target:
            if not inside:
                return _fail(state, "raze_without_hero")
            done = True
        if t == 4 and not _city_intact(state, q.target):
            return _fail(state, "razed_target")
    elif ev == 3:
        it = state.items[q.target] if t == 1 else None
        if it is not None and it.state == ItemState.CARRIED and it.holder == q.hero:
            it.state = int(ItemState.NOT_IN_PLAY)
            done = True
    if not done:
        return 0, []
    q.active = 0
    kind, v = reward(state)
    events = [E.QuestCompleted({"player": p, "hero": q.hero, "type": t, "target": q.target,
                                "reward": kind, "value": v})]
    events += apply_reward(state, kind, v)
    if _human(state):
        events += _reselect(state)
    return 1, events


def s16(v: int) -> int:
    """Evidence: quest words are compared signed (asm ovl01:21a6 / 24ea jge)."""
    from .economy import s16 as _s16
    return _s16(v)


def _reselect(state) -> list:
    """ovl01:18a1: DS:5e62 = the first army on DS:5e5e's square (0b62:007d); if any, the square
    list is sorted (0b62:09ec) and ovl67:06eb selects it."""
    from .selection import select_army_stack
    hero = H.live(state, state.selection.hero)
    if hero is None:
        return []
    lst = H.armies_at(state, hero.x, hero.y)
    return select_army_stack(state, lst[0]) if lst else []


def after_battle(state, battle, captured) -> tuple:
    """The quest check after a battle (combat HOOKS["quest_check"]); returns (skip, events):
    skip is nonzero when the capture choice must not be asked.
    Evidence: asm ovl36:04b1..04f3: without a taken city ovl01:1ded(0, 0, 0, 0, 0); with one
    ovl01:1ded(0, 0, 0, 0x75, 0x3024) and, when it returns 0, ovl36:04f7 (the capture choice).
    When the quest is done the continuation 3024:0075 = ovl36:04f7 is called by ovl01:18a1, the
    close of the human reward dialog ovl01:1520, so a human still gets the capture choice after
    the reward and a computer side does not get it.  The battle arrays it reads are the ones
    the set-up left in `state.battle_work` (rules.combat.prepare / fight)."""
    words = K.QUEST_CHECK_CAPTURE.value if captured else K.QUEST_CHECK_BATTLE.value
    done, events = check(state, words)
    skip = 1 if (done and captured and not _human(state)) else 0
    return skip, events


# ------------------------------------------------------------------------------- reward


def reward(state) -> tuple:
    """The reward for a completed quest: (kind, value) with kind "item" (item index), "site"
    (site index), "gold" (amount) or "allies" (count).
    Evidence: asm ovl01:1909..1c01: cities < 10 and turn > 15 -> allies rnd(1,3,5).  Else with
    gold >= 100: n = items with state 0 that are special (ovl35:08f4) and index > 7 or == p;
    m = sites with +0x1b, not shown to p and kind != 0; n > 0 and rnd(1,3,0) == 1 -> the
    rnd(1,n,0)-th such item; n == 0, m > 0 and rnd(1,3,0) < 3 -> the site nearest to the quest
    hero by max(|dx|, |dy|) (strict <, 0x2710 start); otherwise rnd(1,2,0) == 1 -> allies
    rnd(1,3,2).  Everything else (also gold < 100): gold rnd(2,1000,1000)."""
    p = state.current
    rnd = state.rng.rnd
    from .economy import city_count
    if city_count(state, p) < K.REWARD_FEW_CITIES.value and H.turn(state) > K.REWARD_LATE_TURN.value:
        return "allies", rnd(*K.REWARD_ALLIES_MANY.value)
    if s16(state.players[p].gold) >= K.REWARD_GOLD_MIN.value:
        items = [i for i, it in enumerate(state.items) if it.state == ItemState.NOT_IN_PLAY
                 and special(it) and (i >= K.STANDARDS.value or i == p)]
        sites = [i for i, s in enumerate(state.sites)
                 if s.flag_1b and not s.shown_mask & (1 << p) and s.kind != 0]
        if items and rnd(*K.REWARD_TRY.value) == 1:
            return "item", items[rnd(1, len(items), 0) - 1]
        if not items and sites and rnd(*K.REWARD_TRY.value) < 3:
            hero = state.armies[state.players[p].quest.hero]
            best, bd = 0, K.SAGE_NO_DISTANCE.value
            for i in sites:
                s = state.sites[i]
                d = max(abs(s.x - hero.x), abs(s.y - hero.y))
                if d < bd:
                    best, bd = i, d
            return "site", best
        if rnd(*K.REWARD_ALLIES_TRY.value) == 1:
            return "allies", rnd(*K.REWARD_ALLIES.value)
    return "gold", rnd(*K.REWARD_GOLD.value)


def apply_reward(state, kind: str, v: int) -> list:
    """Hand out the reward, then news (2, 0, 0, name) and +10 exp for the quest hero.
    Evidence: asm ovl01:1c02..1de4: gold += v; item v: state 3, holder = the quest hero; site
    v: +0x1d |= 1 << p, and when (SCN 0x159 and not DS:3254) or the side is human: ovl64:1298
    at the site, ovl35:09f2(p); allies: v armies of type 0x13 by ovl34:12e6 at the quest hero.
    DS:3254 is 1 during a computer turn with Hidden Map and exactly one live human (written at
    ovl68:0074), else 0."""
    from .economy import add_gold
    p = state.current
    q = state.players[p].quest
    hero = state.armies[q.hero]
    events: list = []
    if kind == "gold":
        add_gold(state, p, v)
    elif kind == "item":
        it = state.items[v]
        it.state, it.holder = int(ItemState.CARRIED), q.hero
        events.append(E.ItemFound({"item": v, "hero": q.hero, "carried": True, "reward": True}))
    elif kind == "site":
        s = state.sites[v]
        s.shown_mask |= 1 << p
        if (state.flags.get(0x159, 0) and not _view_word(state)) or _human(state):
            from .visibility import reveal
            from .ruins import site_tiles
            reveal(state, s.x, s.y, H.selection_flying(state))
            site_tiles(state, p)
    else:
        events += H.allies(state, K.REWARD_ALLY_TYPE.value, v, hero.x, hero.y)
    H.news(state, p, K.NEWS_QUEST_DONE.value, 0, 0, H.hero_name(state, hero))
    events += H.add_exp(state, q.hero, K.EXP_QUEST.value)
    return events


def _view_word(state) -> int:
    """DS:3254 as the computer turn start ovl68:0000 leaves it: 1 with Hidden Map and exactly one
    live human side (asm ovl68:002c..0074), 0 otherwise; humans read it only in this test."""
    if _human(state):
        return 0
    humans = sum(1 for pl in state.players if pl.alive and pl.control == Control.HUMAN)
    return int(humans == 1 and bool(state.options.hidden_map))
