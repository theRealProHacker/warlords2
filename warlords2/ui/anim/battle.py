"""The battle display of a human attack, played from the Attack command's events.

Evidence: the human attack ovl36:0000 (asm ovl36:026f..0445):
1836(x, y, 1) map mark and war sample; 0522 prelude; ovl38:008b set-up; 08a6 battle loop;
ovl25:09d7; 12bf:07a5; ovl37:0160(0) window; ovl37:0094 kills; 12bf:0757; ovl62:0000; the
result lines (02f3..042d); 0a6b after-battle (casualties, hero exp, loot line 0x93 via
ovl37:04c5 at ovl36:0e32); ovl37:04f6 wait and close; then the re-selection, medals ovl36:2274,
ovl61:011f(1, 0x10001) (map, overview and palette redrawn), the quest check and the capture
question ovl36:04f7 (`ui.dialogs.capture`).

Kills (ovl37:0094, asm 00a6..0157), one per DS:41b5 entry = one `Duel` event (each ends with a
death, rules.combat.fight): fast = 0 at the start; per kill, first one key is taken off the
keyboard buffer (0000:38dc / 3708; a space bar -> fast for the rest); unless fast the army sample
ovl58:0181(0) for a dying attacker (00dd) / (1) for a dying defender (010c); the explosion
ovl37:0000 waits ovl59:0000(5) (fast: 2); then ovl59:0000(3) and, unless fast, ovl59:0000(5)
(0133..0145).  So a kill takes 13 BIOS ticks, 5 when fast.  After the last kill the keyboard is
flushed (ovl59:01f1).

The view of `BattleStarted` opens the window (dialog "fight") and returns the battle's timeline.
That timeline takes the `Duel` events off the animator's queue itself and plays their registered
sounds (audio.effects, ovl58:0181) when their kill starts, unless the space bar switched to fast
(the "animator's skip" audio.effects names); it then shows the result lines and presents the
after-battle events of 0a6b (`INSIDE`: their sounds and views as the animator would, the loot
`Msg` (STRING 0x93) as a window line); a human then dismisses the window (ovl61:10fb(0)).  Every
later event (re-selection, medals, quest, `BattleEnded`) comes after the window has closed.
When it closes the overview is drawn from the state (ovl63:0000 at ovl36:0453, `window_closed`);
the map mark stays until the original's ovl61:011f redraw at ovl36:04a9 (`MapRedraw`, before the
quest check's events, else `BattleEnded`), which drops it and shows the state and the view
after the command.  Keys typed after the kills' flush (ovl59:01f1 at ovl37:0157) stay in the
keyboard buffer, so the first ends the window's wait ovl61:10fb at once (ovl59:0142).  The window stays the top dialog while it plays and steps the
animator itself (the host's phase does not step while a dialog is open).

A computer side's battle ovl36:124a(x, y, 1) is not played from events: the engine stops at its
display steps (present points "battle_mark" .. "battle_after", rules.combat.ai_battle) and
`states.phases.computer` draws them from the state then.

The unopposed-capture line STRING (0x8d, rnd) (ovl36:0316) shows the engine's roll (BattleEnded
info "fled_text", rules.combat.attack).
"""
from __future__ import annotations

import logging

from ...model import events as E
from ...model.ids import Control
from .. import registry
from ..animate import frames, wait
from ..dialogs import fight as F

log = logging.getLogger(__name__)

BLAST, BLAST_FAST = 5, 2            # ovl37:0054 / 0058
PAUSE, PAUSE_SLOW = 3, 5            # ovl37:0133 / 013f (fast: 0143 3 only)
SPACE = 0x20                        # ovl37:00c9
FLED, HERO_WON_CITY, WON_CITY = 0x8D, 0x8E, 0x8F       # ovl36:0316, 03a0, 03c2
HERO_WON, WON, LOST, LOOT = 0x90, 0x91, 0x92, 0x93      # ovl36:03e5 / 040d, 0415, 041d, 0e18
# the after-battle steps of ovl36:0a6b: history (1aff, news), hero deaths and their items (16cd),
# hero experience (ovl47:04f1), the loot line (0e32) and the loot itself
INSIDE = (E.HeroDied, E.ItemDropped, E.HeroExp, E.Msg, E.Looted)


def _anim(host):
    return getattr(getattr(host, "phase", None), "animator", None)


def _human(state, p: int) -> bool:
    return state.players[p].control == Control.HUMAN


def war_frames(app) -> int:
    """Frames of ovl58:0206's wait (155e:0736: until the sample has played; nothing without
    effects); the sample itself is started by audio.effects on BattleStarted."""
    from ...audio import audio
    from ...audio.effects import SAMPLES
    a = audio(app)
    if not (a.settings.effects and a.mixer.available):
        return 0
    return a.frames(a.pcm(a.path(*SAMPLES["war"])))


@registry.event_view(E.BattleStarted)
def battle_started(host, ev):
    anim = _anim(host)
    st = host.state
    if anim is None or anim.scene is None:
        return None
    if not _human(st, ev.info["attacker"]):
        return None                                         # states.phases.computer
    d = registry.open_dialog("fight", host, battle=ev, scene=anim.scene, anim=anim)
    return timeline(host, d, anim)


def timeline(host, d, anim):
    app = host.app
    for _ in range(war_frames(app)):
        yield None
    d.phase = "kills"                                       # ovl37:0160(0)
    yield from kills(host, d, anim)
    d.keys.clear()                                          # ovl59:01f1
    d.phase = "result"
    result_lines(host, d, anim)
    yield from inside(host, d, anim)
    if d.human:                                             # ovl37:04f6
        if d.keys:                                          # typed after the flush: ovl59:0142
            d.keys.popleft()                                # takes it at once
        else:
            d.phase = "wait"
            while d.phase == "wait":
                yield None
    d.close_window()
    window_closed(host, anim)


def kills(host, d, anim, t: int = 0):
    """ovl37:0094: the kills of the queued Duel events."""
    app = host.app
    while anim.queue and isinstance(anim.queue[0], E.Duel):
        duel = anim.queue.popleft()
        if not d.fast and d.poll_key():                    # 00ae..00ce
            d.fast = True
        if not d.fast:
            for fn in registry.event_sounds(E.Duel):
                fn(host, duel)
        d.blast = d.slot(duel)
        n = BLAST_FAST if d.fast else BLAST
        yield from wait(app, n, t)
        t += n
        d.dead.add(d.blast)                                 # ovl17:07e4
        d.blast = None
        yield from wait(app, PAUSE, t)
        t += PAUSE
        if not d.fast:
            yield from wait(app, PAUSE_SLOW, t)
            t += PAUSE_SLOW


def inside(host, d, anim):
    """The after-battle steps of ovl36:0a6b (`INSIDE`), with the window up or (d None) not."""
    while anim.queue and isinstance(anim.queue[0], INSIDE):
        ev = anim.queue.popleft()
        if isinstance(ev, E.Msg) and ev.group == LOOT:
            if d is not None:
                d.say(d.k.text.S(ev.group, ev.index, *ev.args))  # ovl36:0e18..0e32
            continue
        for fn in registry.event_sounds(type(ev)):
            fn(host, ev)
        for fn in registry.event_views(type(ev)):
            it = fn(host, ev)
            if it is not None:
                yield from it


class MapRedraw:
    """Not an engine event: where ovl61:011f(1, 0x10001) runs after the window (asm
    ovl36:04a9), after the re-selection and the medals ovl36:2274, before the quest check
    ovl01:1ded (04bf / 04e2), whose first event is always QuestCompleted or QuestFailed."""


def window_closed(host, anim) -> None:
    """ovl36:0445..0453: the window closed, then the overview ovl63:0000(1, 1, NULL) from the
    state as it is now (its view box from the view words the prelude ovl36:0522 left); the map
    keeps the mark until `MapRedraw`, which goes before the quest check's first event, or
    `BattleEnded` when there is none."""
    anim.overview = host.state.copy()
    q = anim.queue
    end = next((i for i, e in enumerate(q) if isinstance(e, E.BattleEnded)), None)
    if end is None:
        return
    at = next((i for i in range(end) if isinstance(q[i], (E.QuestCompleted, E.QuestFailed))), None)
    if at is not None:
        q.insert(at, MapRedraw())


def _battle_end(anim):
    return next((e for e in anim.queue if isinstance(e, E.BattleEnded)), None)


def result_lines(host, d, anim) -> None:
    """ovl36:02f3..042d."""
    T = d.k.text
    scene = anim.scene
    end = _battle_end(anim)
    won = bool(end and end.info["attacker_won"])
    sel = scene.selection
    hero = None
    if sel.hero >= 0:                                       # DS:5e5e
        h = scene.armies[sel.hero]
        hero = scene.heroes[h.hero_slot].name
    if not won:
        d.say(T.S(LOST, 0))
        return
    if not d.city:
        if hero is not None:
            d.say(T.S(HERO_WON, 0, hero))
            d.say(T.S(HERO_WON, 1))
        else:
            d.say(T.S(WON, 0))
        return
    if end.info.get("unopposed"):
        d.say(T.S(FLED, end.info["fled_text"]))           # ovl36:0316, drawn by the engine
    ci = scene.city_at(d.x, d.y)                            # ovl62:044a
    names = F.battle_names(host)
    names[0] = hero if hero is not None else scene.players[d.attacker].name
    names[1] = scene.cities[ci].name if ci >= 0 else ""
    d.say(T.S(HERO_WON_CITY, 0, hero) if hero is not None else T.S(WON_CITY, 0))


@registry.event_view(MapRedraw)
def map_redraw(host, ev):
    """ovl61:011f(1, 0x10001) at ovl36:04a9: the mark gone, the map, the overview and the
    info area drawn from the state, the view read back from its words (SCN 0x17d / 0x17f)."""
    anim = _anim(host)
    for dlg in list(host.dialogs):
        if isinstance(dlg, F.Fight):
            dlg.close(None)
            if anim is not None:
                if anim.scene is not None:
                    anim.scene = host.state.copy()
                anim.overview = None
            follow = getattr(getattr(host, "view", None), "follow", None)
            if follow is not None:
                follow(host.state)
    return None


@registry.event_view(E.BattleEnded)
def battle_ended(host, ev):
    """The same redraw when the quest check had no event (`MapRedraw` not queued)."""
    return map_redraw(host, ev)


def duel_ticks(fast_from: int | None, n: int) -> list[int]:
    """BIOS ticks of each of n kills when the space bar is seen at kill `fast_from` (None:
    never): 13 each, 5 from that kill on."""
    return [BLAST_FAST + PAUSE if fast_from is not None and k >= fast_from else BLAST + PAUSE + PAUSE_SLOW
            for k in range(n)]


__all__ = ["timeline", "result_lines", "war_frames", "duel_ticks", "frames"]
