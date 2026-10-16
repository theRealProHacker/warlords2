"""The host's side of the music calls (docs/plan.md M10c): the run's words, the pre-game modes,
the event hook-up and the call log.

* `make_words(app)`: the program run's `model.music.MusicWords`, one per App (DGROUP: kept over
  every game, load and New Game): `on` = OPTIONS.SND digit 0 (ovl58:0bc5, `audio.settings`),
  `driver` = DS:37a3 (`--music on` and SOUND.DAT, 155e:00d5), `on` forced 0 without a driver
  (ovl58:0c32..0c45).  Every game the host enters gets this object as `GameState.music`.
* `pre_game(app, mode, site)`: ovl58:0000 on the screens without a game (no die possible: modes
  0 at ovl60:00fb (every Game Start entry) / ovl57:003a (every Setup entry), 11 at ovl57:0e24
  (Begin)); its MusicStarted sounds at once.
* `MusicStarted` events of a command are sounded when the event animator reaches them
  (`registry.event_view`), so a track starts where its call stands among the pop-ups: e.g.
  the medal (MusicStarted 8, MedalAwarded, MusicStarted 1) plays mode 8 under the pop-up and
  mode 1 when it closes (ovl36:24c9 / 2668).  Calls on the runner thread (ovl61:21d4) are caught
  up from the words at the next present point ("side", `MusicPlayer.sync`).
* the log: every ovl58:0000 call, also the ones that return early (outcome "off": DS:0bee == 0;
  "same": the mode plays already), with its dice, goes to `App.music_log` through an observer
  in `rules.music.OBSERVERS` (only calls on the App's own words: a `GameState.copy` preview is
  not logged); a refused command or a failed run takes its call records back with its dice
  (`MusicLog.roll_back`, `states.game`).
"""
from __future__ import annotations

from ..model import events as E
from ..model.music import MusicWords
from ..rules import music as MU
from ..ui import registry

def make_words(app) -> MusicWords:
    """The run's music words at start-up (see module text)."""
    from . import settings as AS
    driver = AS.music_driver(app)
    on = AS.load(app, digital=False).music                     # digit 0, forced by the driver
    return MusicWords(on=int(bool(on and driver)), driver=int(driver))


def register(app) -> None:
    """Log the ovl58:0000 calls on `app.music_words` (a `rules.music.OBSERVERS` entry, removed by
    `unregister` at App.close; an engine-only run has none)."""
    def observe(words, mode, site, outcome, dice, app=app):
        if words is app.music_words:
            _logged(app, mode, site, outcome, dice)
    app.music_observer = observe
    MU.OBSERVERS.append(observe)


def unregister(app) -> None:
    f = getattr(app, "music_observer", None)
    if f in MU.OBSERVERS:
        MU.OBSERVERS.remove(f)


def _logged(app, mode, site, outcome, dice) -> None:
    rec = {"kind": "call", "frame": app.frame, "site": site, "mode": mode, "outcome": outcome,
           "dice": [list(d) for d in dice]}
    w = app.music_words
    if outcome == "play":
        g, i = w.track
        rec.update(group=g, index=i, loop=w.loop)
        p = getattr(app, "music_player", None)
        if p is not None:
            rec["wav"] = p.stem(g, i) + ".wav"
    app.music_log.add(**rec)


def player(app):
    """The App's one `audio.music.MusicPlayer`, built on first use (main thread)."""
    p = getattr(app, "music_player", None)
    if p is None:
        from . import audio
        from .music import MusicPlayer
        audio(app)                                       # the mixer first (pygame.mixer.init)
        p = app.music_player = MusicPlayer(app)
    return p


def pre_game(app, mode: int, site: str) -> list:
    """ovl58:0000(mode) on a screen without a game (modes 0 / 11), sounded at once."""
    events = MU.start(app.music_words, mode, site)
    player(app).events(events)
    return events


def sounded(app, events) -> None:
    """MusicStarted events that no animator plays (a load's "music" point, Settings)."""
    player(app).events(events)


@registry.event_sound(E.SiteSearched)
def _temple_menu(host, ev):
    """ovl01:0006: the temple menu's first call is the music (mode 5), before the menu the
    SiteSearched {temple_menu} opens; the engine lists its MusicStarted after that event, so it
    sounds here, when the menu's presentation starts (the event itself is then skipped)."""
    app = getattr(host, "app", None)
    if ev.info.get("temple_menu") and getattr(app, "music_words", None) is not None:
        player(app).ahead("ovl01:0006")


@registry.event_view(E.MusicStarted)
def _music_started(host, ev):
    app = getattr(host, "app", None)
    if app is not None and getattr(app, "music_words", None) is not None:
        player(app).events([ev])
    return None
