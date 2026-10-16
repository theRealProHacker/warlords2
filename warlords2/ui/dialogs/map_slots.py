"""Save Map and Load Map of the Game menu (ovl49, docs/plan.md M11, prep §4), the dialog side.  The
files and the slot table are `persist.maps.Maps`, the engine transform `rules.saveload.load_map`;
the Game Setup screen a Load Map ends on is the host's (`map_loaded`).

Evidence (asm ovl49, ovl51, ovl56, ovl34:1434; texts STRING.DAT, read from the user's copy):
* Save Map, menu 503 / Alt+M (07be:02bd) -> ovl49:1214: nothing unless SCN 0x130 == 0, SCN 0x120
  != 0 and DS:28c6 == 0 (121d..1234, `rules.saveload.save_map_allowed`); else DS:482e = 10, the
  ten slot descriptions DS:467c + 15 i into DS:483c, ovl51:0000(13c2, STRING (48, 0), first row
  0) (the list `sage.SageList`);
* 13c2(e): e == -1 -> the three-way redraw (DS:28c6 ? ovl60:0000(0) : DS:2a86 ? ovl61:0000(0,
  0) : ovl57:0000(0, 0, 0, 1), `save_load.back`); else DS:128c = DS:1290 = e and ovl56:0000(STRING
  (48, 0), (48, 1), (48, 2), the slot's description, ok 1463, cancel ovl34:1434, 1, 15, 0xa0)
  (`ui.text_input.InputBox`, the same box as Save Game);
* 1463(text): the slot used, the description, MAPINFO.DAT (1116), the copy 0d61(RMAPTEMP,
  RMAP<slot>) (`Maps.save_map`), then the three-way redraw (14d5..1503);
* Load Map, menu 504 / Alt+Z (07be:02e3) -> ovl49:128a: the used slots' descriptions compacted
  into DS:483c, ovl51:0000(12f2, STRING (49, 0), first DS:1290);
* 12f2(e): e == -1 -> the three-way redraw; else DS:128c = DS:1290 = e, 0414(e, 0, 1) (the entry
  index is the file number, register X57), its scroll as Load Game's (`save_load.load_work`:
  popup 0x17, 0 and 10 before the open, the pointer hidden at 0606, 20 .. 70 after a good open,
  80, 90; the percentages are not gated by the game flag [bp + 8]) but with STRING group 134
  (game 0), then ovl63:232b always (group 137, 0 .. 90) and 100; then 134e..139e (0d61 RMAP<e> ->
  RMAPTEMP, the recounts, the cost map: `Maps.finish_load`) and ovl57:0000(0, 1, 0, 1) (the
  host's `map_loaded`).  12f2 does not test 0414's result: a failed open goes on the same way.
"""
from __future__ import annotations

import logging
from typing import Callable, NamedTuple

from ...assets.store import cache_unload
from .. import registry
from ..widgets import kit
from .hero_offer import raw
from .save_load import (BUILD_GROUP, DESC_LIMIT, DESC_WIDTH, DONE, STEPS_AFTER, STEPS_BEFORE_OPEN,
                        STEPS_READ, advisor_words, back, build_work, run_carry, saves, where_of)

log = logging.getLogger(__name__)

SAVE_MAP_TEXT, LOAD_MAP_TEXT = 48, 49           # STRING.DAT (ovl49:126d push 0x30, 12d4 0x31)
MAP_LOAD_GROUP = 134                            # 0414 with game 0


def maps(app):
    """The run's `persist.maps.Maps` (`App.maps`, made at start-up: res_0a4c:0255 -> ovl49:1029;
    made here on first use for a host without one, with the RANDOM overlay's reader / writer
    when it has `random_dir`)."""
    m = getattr(app, "maps", None)
    if m is None:
        from ...persist.maps import Maps
        rd = getattr(app, "random_dir", None)
        m = app.maps = Maps(app.user, app.gd, saves=saves(app),
                            random_texts=getattr(rd, "texts", None), random_write=getattr(rd, "write_texts", None))
    return m


def scn_flags(host) -> dict:
    """The SCN words in memory that 1214 tests (0x130, 0x120): the game's, else the Setup
    screen's SCN image (`states.setup.Setup.sides`, whose 0x120 ovl57:007f set to DS:28c8 at the
    screen's entry; after Load Map its 0x130 is 0414's 1), else the run's last game's."""
    from ...rules.constants.saveload import SAVE_MAP_GATE
    st = getattr(host, "state", None)
    if st is not None:
        return st.flags
    sides = getattr(host, "sides", None)
    if sides is not None:
        return {off: sides.get(off) for off in SAVE_MAP_GATE.value}
    game = run_carry(host.app).game
    return game.flags if game is not None else {}


# --------------------------------------------------------------------------- Save Map


@registry.action(registry.MENU_ID["save_map"])
def save_map(host):
    """ovl49:1214."""
    k, carry = kit(host.app), run_carry(host.app)
    got = maps(host.app).save_list(carry, scn_flags(host), where_of(host) == "game_start")
    if got is None:
        return None
    names, first = got
    return registry.open_dialog("sage_list", host, title=raw(k, SAVE_MAP_TEXT, 0), names=names, first=first,
                                buffer=carry, on_close=lambda e: _save_chosen(host, e))


def _save_chosen(host, e) -> None:
    """ovl49:13c2(e)."""
    k = kit(host.app)
    desc = maps(host.app).choose_save(run_carry(host.app), e if e is not None else -1)
    if desc is None:
        return back(host)
    registry.open_dialog("input_box", host, title=raw(k, SAVE_MAP_TEXT, 0),
                         lines=[raw(k, SAVE_MAP_TEXT, 1), raw(k, SAVE_MAP_TEXT, 2)], text=desc,
                         limit=DESC_LIMIT, width=DESC_WIDTH, on_close=lambda t: _save_typed(host, t))


def _save_typed(host, text) -> None:
    """ovl49:1463 (ok) / ovl34:1434 (cancel); both end in the three-way redraw."""
    if text is not None:
        try:
            if not maps(host.app).save_map(run_carry(host.app), text):
                log.info("Save Map: no SAVE\\RMAPTEMP.DAT or a failed create, the slot is marked used")
        except ValueError as e:
            log.error("Save Map refused: %s", e)
    back(host)


# --------------------------------------------------------------------------- Load Map


@registry.action(registry.MENU_ID["load_map"])
def load_map(host):
    """ovl49:128a."""
    k, carry = kit(host.app), run_carry(host.app)
    count, first = maps(host.app).load_list(carry)
    names = [carry.name(i) for i in range(count)]
    return registry.open_dialog("sage_list", host, title=raw(k, LOAD_MAP_TEXT, 0), names=names, first=first,
                                buffer=carry, on_close=lambda e: _load_chosen(host, e))


class MapLoadResult(NamedTuple):
    loaded: object               # rules.saveload.Loaded
    overview: object             # the strategic bitmap ovl63:232b built (it always runs here)
    failed: bool                 # the open failed (0414 jumped to 08b1)
    n: int                       # the file number


def _load_chosen(host, e) -> None:
    """ovl49:12f2(e): Cancel -> `back`; else the scroll, `Maps.finish_load`, then the host's
    `map_loaded(MapLoadResult)` (ovl57:0000(0, 1, 0, 1) and the rest of 12f2)."""
    fn = getattr(host, "map_loaded", None)
    if fn is None and e is not None and e != -1:      # checked before anything is touched (review U M1)
        log.error("Load Map: the host has no map_loaded; nothing loaded")
        return back(host)
    n = maps(host.app).choose_load(run_carry(host.app), e if e is not None else -1)
    if n is None:
        return back(host)

    def done(r: MapLoadResult) -> None:
        maps(host.app).finish_load(r.loaded, r.n)
        fn(r)
    open_load_map(host, n, done)


def load_map_work(app, n: int, advisor: dict | None = None, hide: Callable[[], None] | None = None):
    """ovl49:0414(n, 0, 1) up to its 90 as a `"progress"` generator (group 134); returns
    (Loaded, failed), or (None, False) when the load was refused (logged: a failed open with no
    game in memory, register X47 open; a file that is not a map of this program).  The dice: the
    run's one stream (`save_load.load_work`'s rule, register X49)."""
    from ...persist.saves import NoGameInMemory
    from ...states.menu import session_dice
    carry, mp = run_carry(app), maps(app)
    if advisor is None:
        advisor = advisor_words(app)
    for p in STEPS_BEFORE_OPEN:
        yield p
    if hide is not None:
        hide()
    rng = carry.game.rng if carry.game is not None else session_dice(app)
    try:
        saved = mp.read_map(n)
        failed = saved is None
        res = mp.load_map(carry, n, rng=rng, process=getattr(app, "ai_process", None),
                          alt_names=bool(getattr(app.cfg, "alt_names", False)), advisor=advisor, saved=saved)
    except (NoGameInMemory, ValueError, FileNotFoundError) as e:
        log.error("Load Map refused: %s", e)
        return None, False
    if not failed:
        for p in STEPS_READ:
            yield p
    for p in STEPS_AFTER:
        yield p
    if not res.rebuilt:
        yield DONE
    return res, failed


def open_load_map(host, n: int, done: Callable[[MapLoadResult], None],
                  refused: Callable[[], None] | None = None) -> None:
    """Load Map's scroll on `host` (the screen it came from): group 134 for the read, group 137 for
    the map build, then `done(MapLoadResult)`; a refused load calls `refused()` (default `back`)."""
    app = host.app

    def read_done(r) -> None:
        res, failed = r
        if res is None:
            return (refused or (lambda: back(host)))()
        if not res.rebuilt:
            return done(MapLoadResult(res, None, failed, n))
        from .. import minimap
        pixels = minimap.blank()
        registry.open_dialog("progress", host, group=BUILD_GROUP, work=build_work(app, res.state, pixels),
                             on_close=lambda _: done(MapLoadResult(res, pixels, failed, n)))

    cache_unload(app)                            # ovl49:0449 0997:0066 (X44)
    hide = getattr(host, "hide_pointer", None)
    registry.open_dialog("progress", host, group=MAP_LOAD_GROUP, work=load_map_work(app, n, hide=hide),
                         on_close=read_done)
