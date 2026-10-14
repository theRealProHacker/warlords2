"""Sound effects: the ovl58 sample routines and the engine events that trigger them.

Routines (asm out/asm/ovl58.asm; every one returns at once when effects are off, DS:0bec):

| routine | sample (FILE.DAT) | EXE waits for its end |
|---|---|---|
| ovl58:0181(0) / (1) | army.8SN (64, 0) / army2.8SN (64, 5), preloaded by ovl58:0bc5 | no |
| ovl58:01a9(0) / (1) | dramatic.8SN (37, 0) / orch.8SN (37, 1) | yes (155e:0736) |
| ovl58:0206 | war.8SN (38, 0) | yes |
| ovl58:023d | splash.8SN (39, 0) | no |
| ovl58:0b5f | chord.8SN (64, 2), preloaded | no |
| ovl58:0b79 | ding.8SN (64, 1), preloaded | no |
| ovl58:0b93 | turn.8SN (63, 0) | no |

`play` returns the logical frames the EXE waits after starting the sample (the sample's
length for the waiting ones, else 0; 0 whenever nothing plays), so a caller can hold its
animation as the EXE does.  START.EXE plays START/DING0.SND (its only sample name, string
`start\\ding0.snd`) through the same loader / player pair, which stores frequency 0x2AF8 =
11000 (START.EXE file offsets 0xD23F / 0xD318, then 0000:02bb AX=068Ah / 0000:02ce
AX=068Bh), so it plays at 11000 Hz as well (`ding0`).

Event triggers (call sites; "human" = SCN 0x0D0[side] == 0, as the EXE tests):
* Duel: ovl37:0094 (battle display) per DS:41b5 kill: an attacking unit died -> 0181(0)
  (ovl37:00dd), a defending one -> 0181(1) (ovl37:010c); not after Space skipped the rest
  (the animator's skip, which then also leaves out these calls);
* SiteSearched of a ruin search (info "hero", kind neither temple nor sage) by a human:
  01a9(0) at ovl34:01fe, before the result;
* SageOffered: 01a9(0) at ovl34:0af7 (sage visit, human only);
* GuardianFought with a human hero: 01a9(1) at ovl34:02b1, after the guardian message;
* BattleStarted with a human attacker: 0206 at ovl36:1a28 (ovl36:1836(x, y, 1) from the
  attack ovl36:0275 and ovl36:145a, sound when SCN 0x0D0[0x110] == 0);
* Sunk: 023d at 0b62:11f8 (any side, when at least one army sank);
* ItemDropped with "lost": 023d at ovl36:173b (a dying hero's items on Water, any side) and
  ovl47:09a1 (a drop on Water, human only, ovl25:09ab);
* Moved with "no_path" for a human side: 0b5f at 0a8b:0cac;
* TurnStarted of a human side: 0b93 at ovl68:0415, while the "Turn %d" pop-up shows.
"""
from __future__ import annotations

from ..model import events as E
from ..model.ids import Control, SiteKind
from ..ui import registry

SAMPLES = {"army": (64, 0), "ding": (64, 1), "chord": (64, 2), "army2": (64, 5),
           "dramatic": (37, 0), "orch": (37, 1), "war": (38, 0), "splash": (39, 0),
           "turn": (63, 0)}
WAITS = frozenset({"dramatic", "orch", "war"})   # ovl58:01ff / 0236 call 155e:0736
DING0 = "START/DING0.SND"


def play(app, name: str) -> int:
    """Play effect `name` (a key of SAMPLES) if effects are on; frames the EXE waits."""
    from . import audio
    a = audio(app)
    if not (a.settings.effects and a.mixer.available):
        return 0
    pcm = a.pcm(a.path(*SAMPLES[name]))
    a.mixer.play(pcm)
    return a.frames(pcm) if name in WAITS else 0


def army(app, n: int) -> int:
    """ovl58:0181(n)."""
    return play(app, "army2" if n else "army")


def stinger(app, n: int) -> int:
    """ovl58:01a9(n)."""
    return play(app, "orch" if n else "dramatic")


def war(app) -> int:
    """ovl58:0206."""
    return play(app, "war")


def splash(app) -> int:
    """ovl58:023d."""
    return play(app, "splash")


def chord(app) -> int:
    """ovl58:0b5f."""
    return play(app, "chord")


def ding(app) -> int:
    """ovl58:0b79."""
    return play(app, "ding")


def turn(app) -> int:
    """ovl58:0b93."""
    return play(app, "turn")


def ding0(app) -> int:
    """START.EXE's START/DING0.SND (the intro, M2c)."""
    from . import audio
    a = audio(app)
    if not (a.settings.effects and a.mixer.available):
        return 0
    a.mixer.play(a.pcm(DING0))
    return 0


def _human(state, p: int | None = None) -> bool:
    p = state.current if p is None else p
    return state.players[p].control == Control.HUMAN


# --------------------------------------------------------------------------- event triggers


@registry.event_sound(E.Duel)
def _duel(host, ev) -> None:
    army(host.app, 0 if ev.info.get("loser") == "attacker" else 1)


@registry.event_sound(E.SiteSearched)
def _ruin(host, ev) -> None:
    i = ev.info
    if "hero" in i and i.get("kind") not in (SiteKind.TEMPLE, SiteKind.SAGE) and _human(host.state):
        stinger(host.app, 0)


@registry.event_sound(E.SageOffered)
def _sage(host, ev) -> None:
    stinger(host.app, 0)


@registry.event_sound(E.GuardianFought)
def _guardian(host, ev) -> None:
    if _human(host.state):
        stinger(host.app, 1)


@registry.event_sound(E.BattleStarted)
def _battle(host, ev) -> None:
    if _human(host.state, ev.info.get("attacker", host.state.current)):
        war(host.app)


@registry.event_sound(E.Sunk)
def _sunk(host, ev) -> None:
    splash(host.app)


@registry.event_sound(E.ItemDropped)
def _lost(host, ev) -> None:
    """A dead hero's items (its record is free by now: owner 0xff) splash for any side, a
    living hero's drop only for a human one."""
    if not ev.info.get("lost"):
        return
    a = host.state.armies[ev.info["army"]]
    if a.owner == 0xFF or _human(host.state):
        splash(host.app)


@registry.event_sound(E.Moved)
def _no_path(host, ev) -> None:
    if ev.info.get("no_path") and _human(host.state):
        chord(host.app)


@registry.event_sound(E.TurnStarted)
def _turn(host, ev) -> None:
    if _human(host.state):
        turn(host.app)
