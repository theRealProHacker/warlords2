"""Save Game, Load Game, New Game and Quit of the Game menu (ovl49), the dialog side (docs/plan.md
M10b, EL "Save / Load / Quit (ovl49)").  The files are `persist.saves`, the engine transform
`rules.saveload`; the host glue (the game state entered with a load, the exit, the run memory
kept across games) is the host's.

Evidence (asm ovl49, ovl51, ovl56, ovl34:1434; texts STRING.DAT, read from the user's copy):
* Save Game, menu 501 / Alt+S (07be:02cb) -> ovl49:093b: DS:482e = 10, the ten slot
  descriptions DS:471c + 15 i into DS:483c, ovl51:0000(0995, STRING (46, 0), DS:128e) (the list
  `sage.SageList`, popup 3, screen 2); 0995(e): e < 0 -> ovl61:0000(0, 0) (the game screen,
  `game_screen`); else DS:128c = DS:128e = e and ovl56:0000(STRING (46, 0), (46, 1), (46, 2),
  the slot's description, ok 0a25, cancel ovl34:1434, 1, 15, 0xa0) (`ui.text_input.InputBox`);
  0a25(text): 0a46(text, 0, NULL) (`persist.saves.Saves.write_game`: the table, then the file;
  its NULL test is on the pointer, so "" also marks the slot used), then ovl61:0000(0, 0);
* Load Game, menu 502 / Alt+L (07be:02b6) and the Game Start button 101 (ovl60:05e3) ->
  ovl49:026b: the used slots' descriptions compacted into DS:483c (entries past them keep what
  an earlier ovl51 list left), ovl51:0000(02d3, STRING (47, 0), DS:128e); 02d3(-1) -> ovl34:1434's
  three ways (`back`); 02d3(e): DS:128e = DS:128c = e, 0414(e, 1, 0) (the entry index is the
  file number, register X45) and the rest of 02d3 (the host's, `rules.saveload.after_load`);
* the load's scroll inside 0414: popup 0x17 with STRING group 133 (ovl61:1471), the bar
  ovl02:01b5, ovl02:01ff at 0 (05cc), 10 (05db), the open (0612; a failed open jumps to 08b1),
  20 (0646), 30 (0672), 40 (06a9), 50 (071d), 60 (079e), 70 (081f), 80 (08b3), 90 (08dd); when
  ovl63:232b runs (08fe) its own scroll text STRING group 137 (ovl63:237a..23ea, ovl17:070b
  over the old text) and 0 .. 90 (`ui.minimap.build`); then 100 (091c), close (0922), no tick
  wait;
* the message of 02d3: sprintf(STRING (47, 1), side name 2c04:0000 + 0x14 SCN 0x110) ->
  ovl61:10fb (popup 5, waits for a release or a key) (03c3..03f8);
* New Game, menu 500 / Alt+N -> ovl49:019d: ovl56:0088(STRING (45, 0), (45, 1..4), yes 0203, no
  ovl34:1434); 0203 is the host's (`rules.saveload.new_game`, ovl60:0000(1), ovl25:0519);
* Quit, menu 505 / Ctrl+Q -> ovl49:0000: DS:2a86 == 0 -> 0072 at once; else ovl56:0088(STRING
  (44, 0), (44, 1..4), yes 0072, no ovl34:1434); 0072: the talking face ovl58:026f(4), then
  0a4c:02b5 (the end of the program, the host's `exit_program`);
* ovl34:1434 (and 02d3(-1)): DS:28c6 ? ovl60:0000(0) (the Game Start screen again, no face) :
  DS:2a86 ? ovl61:0000(0, 0) (the game screen: map, overview, info cell, palette refresh
  ovl61:0174 -> 0519, bar, the info area ovl66:0356) : ovl57:0000(0, 0, 0, 1) (the Game Setup
  screen again).
The ovl51 name buffer DS:483c is one per program run (`persist.saves.RunCarry.names`, App
`run_carry`); every user-interface writer goes through `list_names`: the slot lists (persist),
the sage's entries (ovl34:1610, 1735), the scenario list (ovl60:058d, 05bf: record +0x14), the
hero panel's items (ovl51:03d9 mode 6 from ovl40:05b3) and the Setup Side leaders
(ovl51:03d9 mode 7 from ovl57:1773).
"""
from __future__ import annotations

import logging
from typing import Callable, NamedTuple

from .. import registry
from ..text_input import InputBox
from ..widgets import kit
from .hero_offer import raw, sprintf

log = logging.getLogger(__name__)

SAVE_TEXT, LOAD_TEXT, QUIT_TEXT, NEW_TEXT = 46, 47, 44, 45
LOAD_GROUP, BUILD_GROUP = 133, 137
DESC_LIMIT, DESC_WIDTH = 15, 0xA0               # ovl49:09b4 push 0xa0000f
LOAD_GAME_BUTTON = 101
QUIT_SPEECH = 4                                 # ovl49:0075
STEPS_BEFORE_OPEN = (0, 10)                     # ovl49:05cc, 05db
STEPS_READ = (20, 30, 40, 50, 60, 70)           # 0646, 0672, 06a9, 071d, 079e, 081f
STEPS_AFTER = (80, 90)                          # 08b3, 08dd (also after a failed open)
DONE = 100                                      # 091c


# --------------------------------------------------------------------------- run memory


def run_carry(app):
    """The run's `persist.saves.RunCarry` (App `run_carry`; made on first use)."""
    c = getattr(app, "run_carry", None)
    if c is None:
        from ...persist.saves import RunCarry
        c = app.run_carry = RunCarry()
    return c


def saves(app):
    """The run's `persist.saves.Saves` (App `saves`; made on first use: the slot table read as
    res_0a4c:0250 -> ovl49:0e5f does at start-up)."""
    s = getattr(app, "saves", None)
    if s is None:
        from ...persist.saves import Saves
        s = app.saves = Saves(app.user, app.gd)
    return s


def list_names(app, names: list[str]) -> None:
    """An ovl51 list's names into entries 0.. of DS:483c (the rest keep their bytes)."""
    run_carry(app).write_names(list(names))


# --------------------------------------------------------------------------- where we are


def where_of(host) -> str:
    """"game_start" (DS:28c6, the Game Start screen), "game" (DS:2a86: a game screen is up,
    set by ovl61:0000; not yet in the game state's building phase) or "setup" (neither)."""
    from ...states.menu import Menu
    if isinstance(host, Menu):
        return "game_start"
    if getattr(host, "state", None) is not None and getattr(host, "phase_name", None) not in (None, "building"):
        return "game"
    return "setup"


def game_screen(host) -> None:
    """ovl61:0000(0, 0): the host's `redraw_game_screen` when it has one, else the palette
    refresh ovl61:0174 (-> 0519) and the info area ovl66:0356."""
    redraw = getattr(host, "redraw_game_screen", None)
    if redraw is not None:
        return redraw()
    for name in ("settings_closed", "palette_drawn"):
        fn = getattr(host, name, None)
        if fn is not None:
            fn()


def back(host) -> None:
    """ovl34:1434 / ovl49:02d3(-1): the screen the dialog came from, drawn again."""
    w = where_of(host)
    if w == "game":
        return game_screen(host)
    redraw = getattr(host, "redraw_screen", None) or getattr(host, "refresh", None)
    if redraw is not None:                       # ovl60:0000(0) / ovl57:0000(0, 0, 0, 1)
        redraw()


# --------------------------------------------------------------------------- Save Game


@registry.dialog("input_box")
def input_box(host, title: str, lines: list[str], text: str, limit: int, width: int,
              cancel_live: bool = True, on_close=None):
    return InputBox(kit(host.app), title, lines, text, limit, width, cancel_live, on_close, host=host)


@registry.action(registry.MENU_ID["save_game"])
def save_game(host):
    """ovl49:093b."""
    if getattr(host, "state", None) is None:
        return None
    k, carry, sv = kit(host.app), run_carry(host.app), saves(host.app)
    names, first = sv.save_list(carry)
    return registry.open_dialog("sage_list", host, title=raw(k, SAVE_TEXT, 0), names=names, first=first,
                                buffer=carry, on_close=lambda e: _save_chosen(host, e))


def _save_chosen(host, e) -> None:
    """ovl49:0995(e)."""
    k, carry, sv = kit(host.app), run_carry(host.app), saves(host.app)
    desc = sv.choose_save(carry, e if e is not None else -1)
    if desc is None:
        return game_screen(host)
    registry.open_dialog("input_box", host, title=raw(k, SAVE_TEXT, 0),
                         lines=[raw(k, SAVE_TEXT, 1), raw(k, SAVE_TEXT, 2)], text=desc,
                         limit=DESC_LIMIT, width=DESC_WIDTH, on_close=lambda t: _save_typed(host, t))


def _save_typed(host, text) -> None:
    """ovl49:0a25 (ok) / ovl34:1434 (cancel)."""
    if text is None:
        return back(host)
    carry, sv = run_carry(host.app), saves(host.app)
    try:
        sv.write_game(carry, text, host.state)
    except (ValueError, NotImplementedError) as e:
        log.error("Save Game refused: %s", e)
    game_screen(host)


# --------------------------------------------------------------------------- Load Game


@registry.action(registry.MENU_ID["load_game"])
@registry.action(LOAD_GAME_BUTTON)
def load_game(host):
    """ovl49:026b (menu 502, Alt+L; the Game Start button 101 via ovl60:05e3)."""
    k, carry, sv = kit(host.app), run_carry(host.app), saves(host.app)
    count, first = sv.load_list(carry)
    names = [carry.name(i) for i in range(count)]
    return registry.open_dialog("sage_list", host, title=raw(k, LOAD_TEXT, 0), names=names, first=first,
                                buffer=carry, on_close=lambda e: _load_chosen(host, e))


def _load_chosen(host, e) -> None:
    """ovl49:02d3(e): Cancel -> `back`; else the game state is entered with the file number
    (`Game.on_enter(load_slot=n)`), which runs `open_load` and the rest of 02d3."""
    n = saves(host.app).choose_load(run_carry(host.app), e if e is not None else -1)
    if n is None:
        return back(host)
    host.request("game", load_slot=n)


class LoadResult(NamedTuple):
    loaded: object               # rules.saveload.Loaded
    overview: object             # the strategic bitmap ovl63:232b built, None when it did not run
    failed: bool                 # the open failed (0414 jumped to 08b1, register X47)


def load_work(app, n: int, where: str, advisor: dict | None = None):
    """ovl49:0414(n, 1, 0) up to its 90 as a `"progress"` generator (group 133); returns
    (Loaded, failed), or (None, failed) when the load was refused (logged: a failed open with
    no game in memory, register X47 open; a file that is not a save of this program; a missing
    army type file).  `advisor`: advisor_talking / advisor_digital / advisor_groups for a
    fresh-run load (`persist.saves.Saves.load_game`).  The dice: the run's one stream, the
    game's in a run with a game in memory, else the session's (`states.menu.session_dice`,
    register X49)."""
    from ...persist.saves import NoGameInMemory
    from ...states.menu import session_dice
    carry, sv = run_carry(app), saves(app)
    if advisor is None:
        advisor = advisor_words(app)
    for p in STEPS_BEFORE_OPEN:
        yield p
    rng = carry.game.rng if carry.game is not None else session_dice(app)
    try:
        failed = sv.read_game(n) is None
        res = sv.load_game(carry, n, where=where, rng=rng, process=app.ai_process,
                           alt_names=bool(getattr(app.cfg, "alt_names", False)), advisor=advisor)
    except (NoGameInMemory, ValueError, FileNotFoundError) as e:
        log.error("Load Game refused: %s", e)
        return None, False
    if not failed:
        for p in STEPS_READ:
            yield p
    for p in STEPS_AFTER:
        yield p
    if not res.rebuilt:
        yield DONE
    return res, failed


def advisor_words(app) -> dict:
    """DS:26c8 / 37a4 and the FILE.DAT group sizes, as `states.game.Game.start_engine` reads them."""
    from ...audio import audio
    from ...states.game import advice_groups
    snd = audio(app)
    return {"advisor_talking": int(snd.settings.speech), "advisor_digital": int(snd.mixer.available),
            "advisor_groups": {g: snd.members(g) for g in sorted(advice_groups())}}


def build_work(app, state, pixels):
    """ovl63:232b inside the load (its 0 .. 90 over the loaded map with the rolls the load
    drew), then the load's 100 (091c)."""
    from ...assets.sprites import MapColors
    from ...model.state import SCN_TERRAIN_SET
    from .. import minimap
    t = state.flags[SCN_TERRAIN_SET]
    colors = MapColors.load(app.assets, t)
    w = state.world
    yield from minimap.build(w.tiles, w.roads, t, state.overview_mountain_rolls, colors, pixels)
    yield DONE


def open_load(host, n: int, where: str, done: Callable[[LoadResult], None], advisor: dict | None = None,
              refused: Callable[[], None] | None = None) -> None:
    """The load's scroll on `host`: group 133 for the read, group 137 for the map build when
    232b runs (the second scroll opens as the first closes, as `states.setup.load_scroll`);
    then `done(LoadResult)`.  The caller goes on with `persist.saves.Saves.finish_load` (the
    rest of 02d3) and `load_message`.  A refused load (`load_work`) calls `refused()` instead
    (default `back(host)`)."""
    app = host.app

    def read_done(r) -> None:
        res, failed = r
        if res is None:
            return (refused or (lambda: back(host)))()
        if not res.rebuilt:
            return done(LoadResult(res, None, failed))
        from .. import minimap
        pixels = minimap.blank()
        registry.open_dialog("progress", host, group=BUILD_GROUP, work=build_work(app, res.state, pixels),
                             on_close=lambda _: done(LoadResult(res, pixels, failed)))

    registry.open_dialog("progress", host, group=LOAD_GROUP, work=load_work(app, n, where, advisor),
                         on_close=read_done)


def load_message(host, state, on_close=None):
    """ovl49:03c3..03f8: STRING (47, 1) with the current side's name, ovl61:10fb (waits)."""
    k = kit(host.app)
    text = sprintf(raw(k, LOAD_TEXT, 1), state.players[state.current].name)
    return registry.open_dialog("message", host, lines=[text], on_close=on_close)


# --------------------------------------------------------------------------- New Game, Quit


@registry.action(registry.MENU_ID["new_game"])
def new_game(host):
    """ovl49:019d: the confirmation; yes is ovl49:0203, the host's `new_game_confirmed`."""
    k = kit(host.app)
    t = k.text.group(NEW_TEXT)

    def answer(yes) -> None:
        if not yes:
            return back(host)
        fn = getattr(host, "new_game_confirmed", None)
        if fn is None:
            log.error("New Game: the host has no new_game_confirmed")
            return back(host)
        fn()
    return registry.open_dialog("confirm", host, title=t[0], lines=t[1:5], on_close=answer)


def exit_program(app) -> None:
    """0a4c:02b5: the App's `exit_program` (the console banner, the end of the run)."""
    fn = getattr(app, "exit_program", None)
    if fn is not None:
        return fn()
    app.running = False


def quit_game(host) -> None:
    """ovl49:0000 (menu 505, Ctrl+Q).  Without a game screen (DS:2a86 == 0) ovl49:0072 at
    once; else the confirmation, yes -> 0072, no -> ovl34:1434.  0072: the talking face
    ovl58:026f(4), whose die comes from the run's one stream (the game's dice in a game,
    the session's before), then the exit."""
    from ...states.host import face
    from ...states.menu import session_dice
    app = host.app
    st = getattr(host, "state", None)
    roll = getattr(host, "roll", None) or (st.rng.rnd if st is not None else session_dice(app).rnd)

    def leave() -> None:
        face(host, QUIT_SPEECH, roll, lambda: exit_program(app))
    if where_of(host) != "game":
        return leave()
    t = kit(app).text.group(QUIT_TEXT)
    registry.open_dialog("confirm", host, title=t[0], lines=t[1:5],
                         on_close=lambda yes: leave() if yes else back(host))
