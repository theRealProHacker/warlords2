"""M11 package G: the host wiring of random maps and Save / Load Map (`states.menu`, `states.setup`,
`states.game`, `states.host`, `app`), in a headless App with a temporary user directory.  Game
text is never compared literally (STRING.DAT, QUOTES.DAT and the EXE are read at test time)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.rules import randmap as RM  # noqa: E402
from warlords2.rules.rng import Rng  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

pytestmark = pytest.mark.gamedata
FACE, ID_DIE, LOADER = (1, 30, 10), (1, 90, 0), (1, 3, 1)


def key(k, ch=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


def until(app, pred, n=3000):
    for _ in range(n):
        if pred():
            return
        app.step([])
    raise AssertionError("not reached: %s" % app.manager.current_state_str())


def make_app(game, tmp_path, *more):
    return App(parse_args(["--data", game, "--headless", "--seed", "11", "--user-dir", str(tmp_path / "u"), *more]))


def at_menu(a):
    until(a, lambda: a.manager.current_state_str() == "menu" and not a.manager.current_state().dialogs)
    return a.manager.current_state()


def random_setup(a):
    """Game Start -> Random Map 102 -> Begin 103 -> the Setup screen of a generated map."""
    m = at_menu(a)
    registry.run_action(102, m)
    m.on_button(103)
    until(a, lambda: a.manager.current_state_str() == "setup" and a.manager.current_state().ready)
    return a.manager.current_state()


# ------------------------------------------------------------------ the dice of a random Begin


def test_random_begin_dice_order_is_el_9_8(game, tmp_path, monkeypatch):
    """EL §9.8 with the talking advisor on: face(2), Begin's face(0), the map id's 6 rnd(1, 90, 0),
    the generator's stages (ovl02:011c, the same rolls as `random_begin` from that point), the
    loader's 256 rnd(1, 3, 1) (ovl63:2479), the quotation (ovl57:0fe8), Begin's face(1); the game
    then goes on from the stream before the 256 (one stream: `NewGameConfig.rng_state`)."""
    log, real = [], Rng.rnd

    def rnd(self, *a):
        log.append((id(self), a))
        return real(self, *a)
    monkeypatch.setattr(Rng, "rnd", rnd)
    a = make_app(game, tmp_path)
    try:
        until(a, lambda: a.manager.current_state().dialogs)          # the greeting face
        m = a.manager.current_state()
        while m.dialogs:
            a.step([])
        session = a.session_dice
        registry.run_action(102, m)
        m.on_button(103)
        assert m.dialogs.top.dialog_id == "voice_face"
        before_id = None
        while a.manager.current_state_str() == "menu":
            if before_id is None and len(log) == 2:
                before_id = session.state()
            a.step([])
        until(a, lambda: a.manager.current_state().ready)
        s = a.manager.current_state()
        start_256 = s.rng_state
        s.on_button(141)
        until(a, lambda: a.manager.current_state_str() == "game" and a.manager.current_state().state is not None)
        mine = [args for who, args in log if who == id(session)]
        assert mine[:2] == [FACE, FACE] and mine[2:8] == [ID_DIE] * 6
        # the generator's rolls, recomputed from the stream after the faces
        replay, got = Rng.from_state(before_id), []
        monkeypatch.setattr(Rng, "rnd", lambda self, *a: got.append(a) or real(self, *a))
        gen = RM.finish(RM.random_begin(a.gd.read, replay, RM.RandomRun()))
        monkeypatch.setattr(Rng, "rnd", rnd)
        n = len(got)
        assert got[:6] == [ID_DIE] * 6 and mine[2:2 + n] == got
        assert gen.id == a.run_carry.record["str_44"]
        k = kit(a)
        count = int(k.store.read(k.files.get(2, 0))[:2])
        assert mine[2 + n:] == [LOADER] * 256 + [(1, count, 0), FACE]
        # the game's stream: from the state before the 256, those rolls again, then Begin's
        st = a.manager.current_state().state
        game_rolls = [args for who, args in log if who == id(st.rng)]
        assert game_rolls[:256 + 2] == [LOADER] * 256 + [(1, count, 0), FACE]
        assert st.rng is a.session_dice and st.flags[0x120] == 1
        replay = Rng.from_state(start_256)
        for args in [LOADER] * 256 + [(1, count, 0), FACE]:
            real(replay, *args)
        assert replay.state() == session.state()                    # the same stream, replayed
    finally:
        a.close()


# ------------------------------------------------------------------ DS:28c8, one word (review U S1)


def test_random_flag_is_one_word(game, tmp_path):
    a = make_app(game, tmp_path, "--no-voice")
    try:
        m = at_menu(a)
        run = a.run_carry.random_map
        registry.run_action(102, m)                                  # 05f5
        assert run.random == 1 and m.random
        m.redraw_screen()                                            # ovl60:0000(0): 0029 never clears
        assert run.random == 1 and m.random
        m.choose(m.index)                                            # 06b8: the one clear
        assert run.random == 0 and not m.random
        registry.run_action(102, m)
        m.choose(None)                                               # Cancel: no 06b8
        assert run.random == 1
        a.run_carry.random_map.random = 0                            # a fresh run's word ...
        a.run_carry.record = dict(a.run_carry.record, str_3c="random")   # ... and a random game's record
        m.redraw_screen()                                            # 0029: DS:5da0 == "random"
        assert run.random == 1 and m.random
    finally:
        a.close()


# ------------------------------------------------------------------ Return / Esc (07be:00cc..012e)


def test_return_presses_begin_and_esc_main_menu(game, tmp_path, monkeypatch):
    from warlords2.audio import effects
    chords = []
    monkeypatch.setattr(effects, "chord", lambda app: chords.append(1))
    a = make_app(game, tmp_path, "--no-voice")
    try:
        m = at_menu(a)
        a.step([key(pygame.K_ESCAPE, "\x1b")])                       # no DS:1514 button on Game Start
        assert chords == [1] and a.manager.current_state_str() == "menu"
        a.step([key(pygame.K_RETURN, "\r")])                         # DS:155c: 103
        until(a, lambda: a.manager.current_state_str() == "setup" and a.manager.current_state().ready)
        s = a.manager.current_state()
        assert m is not s and chords == [1]
        a.step([key(pygame.K_ESCAPE, "\x1b")])                       # DS:1514: 142 Main Menu
        until(a, lambda: a.manager.current_state_str() == "menu")
        assert chords == [1]
    finally:
        a.close()


# ------------------------------------------------------------------ the generated map's Setup screen


@pytest.fixture(scope="module")
def gen_app(game, tmp_path_factory):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "11",
                        "--user-dir", str(tmp_path_factory.mktemp("u"))]))
    random_setup(a)
    yield a
    a.close()


def test_generation_files_snapshot_and_record(gen_app):
    a = gen_app
    s = a.manager.current_state()
    rd, carry = a.random_dir, a.run_carry
    for name in ("SGN", "MAP", "RD", "CTY", "SPC", "SCN"):
        assert rd.user_path(name).is_file()
    assert a.gd.path("RANDOM/RANDOM.SCN") == rd.user_path("SCN")      # the overlay serves it
    word = "random"
    assert carry.record["str_3c"] == carry.record["dir"] == word and len(carry.record["str_44"]) == 6
    temp = a.maps.read_temp()
    assert temp["record"] == carry.record and temp["state"]["flags"][str(0x120)] == 0   # 11f3 before 007f
    assert s.sides.get(0x120) == 1 and rd.read("SCN")[0x120] == 0                       # 007f vs the file
    assert carry.pathfinder is not None and carry.images[0] == rd.read("MAP")


def test_save_map_gate_on_the_generated_setup(gen_app):
    """review U S2: Save Map on the Setup screen sees SCN 0x120 = DS:28c8 (007f), not the file's 0."""
    s = gen_app.manager.current_state()
    assert gen_app.title_bar.bar.item_enabled(*_item(gen_app, "save_map"))
    d = registry.run_action(503, s)
    assert d is not None and d.dialog_id == "sage_list"
    d.close(-1)
    gen_app.step([])


def _item(app, name):
    a = app.title_bar.bar.by_id[registry.MENU_ID[name]]
    return a.menu, a.item


def test_failed_create_ends_the_program(game, tmp_path, monkeypatch, capsys):
    """ovl09:027c: a failed create of RANDOM.MAP goes to ovl52:0000 (the chord, the message,
    0a4c:02b5); the files after it are not written."""
    from warlords2.audio import effects
    from warlords2.persist import randomdir
    chords = []
    monkeypatch.setattr(effects, "chord", lambda app: chords.append(1))
    real = randomdir.RandomDir._write
    monkeypatch.setattr(randomdir.RandomDir, "_write", lambda self, n, d: False if n == "MAP" else real(self, n, d))
    a = make_app(game, tmp_path, "--no-voice")
    try:
        m = at_menu(a)
        registry.run_action(102, m)
        m.on_button(103)
        until(a, lambda: not a.running)
        out = capsys.readouterr().out
        rd = a.random_dir
        assert chords == [1] and rd.user_path("SGN").is_file() and not rd.user_path("RD").exists()
        assert a.assets.error((1, 0), rd.names["MAP"]) in out
    finally:
        a.close()


# ------------------------------------------------------------------ descriptions (X64)


def test_descriptions_read_through_the_run_cache(game, tmp_path, monkeypatch):
    from warlords2.ui.dialogs import city_info
    a = make_app(game, tmp_path, "--no-voice")
    try:
        at_menu(a)
        reads = []
        real = a.gd.read
        monkeypatch.setattr(a.gd, "read", lambda rel: reads.append(rel) or real(rel))
        lines = city_info.description(a, "Erythea", 0)
        assert any(lines) and a.run_carry.descriptions.kind == 1
        n = len(reads)
        assert city_info.description(a, "Quorvel", 0) == lines and len(reads) == n   # keyed by kind only
        from warlords2.ui.dialogs.ruins import site_text
        assert site_text(a, "Erythea", 0) and a.run_carry.descriptions.kind == 2
        fatal = []
        monkeypatch.setattr(a, "fatal", lambda e, name: fatal.append((e, name)))
        monkeypatch.setattr(a.gd, "read", lambda rel: (_ for _ in ()).throw(FileNotFoundError(rel)))
        assert city_info.description(a, "Erythea", 0) == ["", "", ""]
        assert fatal and fatal[0][0] == (1, 0)
    finally:
        a.close()


def test_new_game_drops_the_description_cache(game, tmp_path):
    a = make_app(game, tmp_path, "--no-voice", "--scenario", "ERYTHEA")
    try:
        until(a, lambda: getattr(a.manager.current_state(), "state", None) is not None)
        g = a.manager.current_state()
        from warlords2.ui.dialogs import city_info
        city_info.description(a, "Erythea", 0)
        assert a.run_carry.descriptions.kind == 1
        g.new_game_confirmed()
        assert a.run_carry.descriptions.kind == 0 and a.run_carry.descriptions.buffer is None
    finally:
        a.close()


# ------------------------------------------------------------------ Load Map from the game and the Setup screen


def _play(a, pred, n=4000):
    """Steps until `pred`, answering the turn start, the hero offer and the production screen."""
    for _ in range(n):
        if pred():
            return
        g = a.manager.current_state()
        top = g.dialogs.top if getattr(g, "dialogs", None) else None
        tid = getattr(top, "dialog_id", None)
        if tid == "hero_offer":
            top.press(287)
        elif tid == "production":
            top.press(192)
        a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))]
               if tid in ("turn_start", "message") else [])
    raise AssertionError("not reached: %s" % a.manager.current_state_str())


def _load_map(a, host):
    old = a.run_carry.game
    d = registry.run_action(504, host)
    d.press(114)
    d.press(123)
    _play(a, lambda: a.run_carry.game is not old and a.manager.current_state_str() == "setup"
          and a.manager.current_state().ready and a.manager.current_state().begin_state is a.run_carry.game)
    return a.manager.current_state()


def test_load_map_from_the_game_and_from_the_setup_screen(game, tmp_path):
    """`map_loaded` of the game (the loaded memory becomes the run's, then ovl57:0000(0, 1, 0, 1))
    and of the Setup screen (setup -> setup); Begin from there starts from that memory."""
    a = make_app(game, tmp_path, "--no-voice")
    try:
        s = random_setup(a)
        d = registry.run_action(503, s)
        d.press(114)
        d.press(123)
        a.step([])
        s.dialogs.top.close("one")                                   # the input box's OK (1463)
        a.step([])
        assert a.maps.any_used() == 1
        for p in range(2, 8):
            s.sides.set(0xC0, p, 3)
        s.on_button(141)
        _play(a, lambda: getattr(a.manager.current_state(), "phase_name", None) == "human"
              and not a.manager.current_state().dialogs)
        g = a.manager.current_state()
        s = _load_map(a, g)
        st = a.run_carry.game
        assert st is s.begin_state and g.state is st                  # on_exit kept the loaded memory
        assert s.sides.get(0x130) == 1 and s.sides.get(0x120) == 1
        assert registry.run_action(503, s) is None                    # 1214: SCN 0x130 = 1 after 0414
        s2 = _load_map(a, s)                                         # setup -> setup
        assert s2 is s and a.run_carry.game is not st
        for p in range(2, 8):
            s2.sides.set(0xC0, p, 3)
        s2.on_button(141)
        _play(a, lambda: getattr(a.manager.current_state(), "phase_name", None) == "human"
              and not a.manager.current_state().dialogs)
        g = a.manager.current_state()
        assert g.state is a.run_carry.game and g.state.flags[0x120] == 1 and g.state.flags[0x130] == 0
        assert a.run_carry.record["str_3c"] == "random"
    finally:
        a.close()


# ------------------------------------------------------------------ a second generation after a game (X62)


def _begin_human(a, s):
    for p in range(2, 8):
        s.sides.set(0xC0, p, 3)
    s.on_button(141)
    _play(a, lambda: getattr(a.manager.current_state(), "phase_name", None) == "human"
          and not a.manager.current_state().dialogs)
    return a.manager.current_state()


def test_second_generation_starts_from_the_game(game, tmp_path, monkeypatch):
    """A random game -> New Game -> Game Start (ovl60:0029 sets DS:28c8 again: DS:5da0 is
    "random") -> Begin: the generator starts from the game's memory (`Setup._generate`: the map
    words and road layer of `game.world`, its path cache / search field / cost map), the game's
    cache is the generation's afterwards (`_generated`), and the next Begin starts with it."""
    import copy
    import struct
    calls, real = [], RM.random_begin

    def spy(read, rng, run, **kw):
        calls.append((rng.state(), copy.deepcopy(run), copy.deepcopy(kw)))
        out = yield from real(read, rng, run, **kw)
        calls[-1] += (out,)
        return out
    monkeypatch.setattr(RM, "random_begin", spy)
    a = make_app(game, tmp_path, "--no-voice")
    try:
        g1 = _begin_human(a, random_setup(a)).state
        assert len(calls) == 1 and calls[0][2]["pathfinder"] is None            # a fresh run's
        cache, dist, cost = copy.deepcopy(g1.path_cache), list(g1.dist_table), list(g1.cost_map)
        assert dist and cost and any(s.valid for s in cache)                    # the game searched
        a.manager.current_state().new_game_confirmed()
        m = at_menu(a)
        w = g1.world                                                            # as New Game left it
        words = struct.pack("<%dH" % len(w.tiles), *((t & 0xFF) | (f & 0xFF) << 8 for t, f in zip(w.tiles, w.flags)))
        roads = bytes(r & 0xFF for r in w.roads)
        carry = a.run_carry
        assert m.random and carry.game is g1 and carry.images is None and carry.pathfinder is None
        m.on_button(103)
        until(a, lambda: a.manager.current_state_str() == "setup" and a.manager.current_state().ready)
        assert len(calls) == 2
        state, run, kw, gen = calls[1]
        pf = kw["pathfinder"]
        assert kw["map_words"] == words and kw["roads"] == roads                # game.world (run_images)
        assert pf.path_cache == cache and pf.dist_table == dist and pf.cost_map == cost
        assert carry.pathfinder is gen.work.pathfinder
        assert g1.path_cache is carry.pathfinder.path_cache                     # _generated
        assert g1.dist_table == carry.pathfinder.dist_table
        # the carried memory decides the output: replayed from it, the same files; from a fresh
        # run's memory on the same dice and run words, other files
        same = RM.finish(real(a.gd.read, Rng.from_state(state), copy.deepcopy(run), **copy.deepcopy(kw)))
        fresh = RM.finish(real(a.gd.read, Rng.from_state(state), copy.deepcopy(run),
                               army_set=kw["army_set"]))
        assert same.files == gen.files and fresh.files != gen.files
        g2 = _begin_human(a, a.manager.current_state()).state
        assert g2 is carry.game and g2 is not g1 and g2.flags[0x120] == 1
        assert g2.path_cache is gen.work.pathfinder.path_cache                  # the next Begin (X62)
    finally:
        a.close()
