"""Main loop, pgsm traps, framebuffer palette and input rules (docs/plan.md 2.1, 3.1, M1b1)."""
import os
import sys
import threading
import traceback
import types

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2 import app as app_mod  # noqa: E402
from warlords2.assets.store import AssetStore  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.debug.probe_states import ProbeError  # noqa: E402
from warlords2.formats.gamedir import REPO_ROOT, GameDir  # noqa: E402
from warlords2.formats.pck import Bitmap, decode_pck  # noqa: E402
from warlords2.persist.userdir import UserDir  # noqa: E402
from warlords2.ui.dialog import Dialog  # noqa: E402
from warlords2.ui.input import Input  # noqa: E402
from warlords2.model.ids import LEVEL_OFF, Control  # noqa: E402
from warlords2.model.newgame import NewGameConfig  # noqa: E402
from warlords2.model.options import GameOptions  # noqa: E402
from warlords2.states.boot import boot_target  # noqa: E402
from warlords2.ui.screen import indexed_surface  # noqa: E402

gamedata = pytest.mark.gamedata


def make_app(tmp_path, game, *flags, probe="probe_loop"):
    return app_mod.App(parse_args(["--headless", "--seed", "1", "--data", game, "--user-dir", str(tmp_path / "user"),
                                   "--probe", probe, *flags]))


@pytest.fixture
def app(tmp_path, game):
    a = make_app(tmp_path, game)
    a.step()                                    # boot requests the probe on its first update
    yield a
    a.close()


def state(app):
    return app.manager.current_state()


# --------------------------------------------------------------------------- pgsm traps


@gamedata
def test_boot_is_start_state_and_enters_target(tmp_path, game):
    a = make_app(tmp_path, game)
    try:
        assert a.manager.current_state_str() == "boot"
        a.step()
        assert a.manager.current_state_str() == "probe_loop"
        assert state(a).log == [("enter", "boot", {})]
    finally:
        a.close()


@gamedata
def test_exception_in_on_enter_fails_within_one_frame_with_original_traceback(app):
    state(app).request("probe_raise")
    with pytest.raises(ProbeError) as e:
        app.step()
    frames = traceback.extract_tb(e.value.__traceback__)
    assert any(f.filename.endswith("probe_states.py") and f.name == "on_enter" for f in frames)


@gamedata
def test_bad_kwarg_fails_the_run(app):
    state(app).request("probe_strict", unexpected=1)
    with pytest.raises(TypeError, match="unexpected"):
        app.step()


@gamedata
def test_kwarg_named_frm_fails_the_run(app):
    state(app).request("probe_loop", frm="x")
    with pytest.raises(TypeError, match="frm"):
        app.step()


@gamedata
def test_system_exit_in_hook_also_reaches_the_main_thread(app, monkeypatch):
    def on_enter(frm, **kw):
        raise SystemExit(3)
    monkeypatch.setattr(app.manager["probe_strict"], "on_enter", on_enter)
    state(app).request("probe_strict")
    with pytest.raises(SystemExit):
        app.step()


@gamedata
def test_unfinished_transition_fails_the_completion_check(app):
    app.manager.loading[app.manager.current_state_str()] = True
    with pytest.raises(RuntimeError, match="never completed"):       # a plain assert dies with -O
        app._settle()


@gamedata
def test_same_object_transition_runs_on_exit_then_on_enter(app):
    s = state(app)
    s.request("probe_loop", load_slot=3)
    app.step()
    assert state(app) is s
    assert s.log[-2:] == [("exit", "probe_loop"), ("enter", "probe_loop", {"load_slot": 3})]


@gamedata
def test_two_requests_in_one_frame_raise(app):
    s = state(app)
    s.request("probe_backdrop")
    with pytest.raises(RuntimeError, match="second transition"):
        s.request("probe_loop")


@gamedata
def test_dialog_takes_input_and_its_callback_requests(app):
    got = []

    class Ask(Dialog):
        def update(self, events, dt):
            got.append(dt)
            self.close("yes")

    s = state(app)
    s.dialogs.push(Ask(on_close=lambda r: s.request("probe_backdrop", answer=r)))
    app.step()
    assert got == [1000 / 60]
    assert app.manager.current_state_str() == "probe_backdrop"
    assert not s.dialogs


@gamedata
def test_excepthook_restored_on_close(tmp_path, game):
    before = threading.excepthook
    a = make_app(tmp_path, game)
    assert threading.excepthook is not before
    a.close()
    assert threading.excepthook is before


# --------------------------------------------------------------------------- script hook and CLI


@gamedata
def test_script_drives_headless_run(tmp_path, monkeypatch, game):
    seen = []

    class Src:
        last_frame = 4

        def before_frame(self, frame):
            seen.append(frame)
            pygame.event.post(pygame.event.Event(pygame.KEYDOWN, key=pygame.K_a, unicode="a"))

        def after_frame(self, frame):
            seen.append(-frame)

    fake = types.ModuleType("warlords2.debug.script")
    fake.SHOT_ROOT = tmp_path / "shots"
    fake.load = lambda path, app, capture=None: Src()
    monkeypatch.setitem(sys.modules, "warlords2.debug.script", fake)
    monkeypatch.setattr(app_mod, "App", _Keep)
    script = tmp_path / "s.json"
    script.write_text("[]")
    app_mod.main(["--headless", "--seed", "1", "--data", game, "--user-dir", str(tmp_path / "u"),
                  "--probe", "probe_backdrop", "--script", str(script)])
    assert seen == [0, 0, 1, -1, 2, -2, 3, -3, 4, -4]
    assert _Keep.last.frame == 5 and _Keep.last.input.text == "a"


class _Keep(app_mod.App):
    last = None

    def __init__(self, cfg):
        super().__init__(cfg)
        _Keep.last = self


@gamedata
def test_script_without_m1b2_module_exits_with_message(tmp_path, monkeypatch, game):
    monkeypatch.setitem(sys.modules, "warlords2.debug.script", None)
    a = make_app(tmp_path, game, "--script", str(tmp_path / "s.json"))
    try:
        with pytest.raises(SystemExit, match="M1b2"):
            a.run()
    finally:
        a.close()


def test_cli_declares_every_flag():
    cfg = parse_args(["--data", "d", "--user-dir", "u", "--scenario", "ERYTHEA", "--controls", "HHCCCCCC",
                      "--levels", "x", "--options", "w", "--seed", "7", "--script", "s.json",
                      "--shot-at", "1,5", "--record", "r.mp4", "--scale", "3", "--headless", "--tick-hz", "30",
                      "--no-intro", "--alt-names", "--no-voice", "--music", "off", "--music-variant", "gm",
                      "--music-cache", "m", "--allow-unverified", "--state-hash-at", "9"])
    assert cfg.shot_at == [1, 5] and cfg.state_hash_at == [9] and cfg.record_fps == 30 and cfg.fixed_dt
    d = parse_args([])
    assert d.scale == 2 and d.tick_hz == 60 and d.music == "on" and d.music_variant == "opl"
    assert d.user_dir == REPO_ROOT / "out" / "user" and not d.fixed_dt and isinstance(d.seed, int)


def test_user_dir_never_inside_game_dir(tmp_path):
    with pytest.raises(ValueError):
        UserDir(tmp_path / "game" / "user", tmp_path / "game")
    u = UserDir(tmp_path / "user", tmp_path / "game")
    assert u.path("saves/1.json").parent.is_dir()
    with pytest.raises(ValueError):
        u.path("../x")


# --------------------------------------------------------------------------- framebuffer and palette


@gamedata
def test_all_16_indices_survive_sprite_blit_and_present_in_standard_pal(app):
    fb = app.screen.fb
    sprite = indexed_surface(Bitmap(16, 1, [bytes(range(16))]))
    fb.fill(0)
    fb.blit(sprite, (8, 8))
    assert [fb.get_at_mapped((8 + i, 8)) for i in range(16)] == list(range(16))
    app.screen.present()
    pal = app.assets.palette("STANDARD.PAL")
    assert [tuple(app.screen.present_surface.get_at((8 + i, 8)))[:3] for i in range(16)] == pal


@gamedata
def test_colour_key_from_picture_table_keeps_indices(app):
    a4 = app.assets.picture("a4.pck")
    assert a4.get_colorkey()[:3] == (11, 11, 11)          # identity palette: index 11
    fb = app.screen.fb
    fb.fill(3)
    fb.blit(a4, (0, 0))
    raw = decode_pck(app.gd.read("TERRAIN0/A4.PCK"))
    for y in range(30):
        for x in range(32):
            want = raw.rows[y][x]
            assert fb.get_at_mapped((x, y)) == (3 if want == 11 else want)


@gamedata
def test_fade_never_changes_fb_bytes(app):
    fb = app.screen.fb
    fb.blit(app.assets.picture("startup.pck"), (0, 0))
    before = bytes(fb.get_buffer().raw)
    black = app.assets.palette("BLACK.PAL")
    app.screen.fade_to(black, 4)
    for _ in range(4):
        app.screen.present()
        assert bytes(fb.get_buffer().raw) == before
    assert not app.screen.fading and app.screen.dac == black
    assert pygame.surfarray.array2d(app.screen.present_surface).max() == 0


@gamedata
def test_backdrop_probe_draws_startup_quadrants(tmp_path, game):
    a = make_app(tmp_path, game, probe="probe_backdrop")
    try:
        a.step()
        fb = a.screen.fb
        for q in range(4):
            raw = decode_pck(a.gd.read(f"PICS/STARTUP{q}.PCK"))
            ox, oy = 320 * (q % 2), 240 * (q // 2)
            for x, y in ((0, 0), (319, 239), (160, 120)):
                assert fb.get_at_mapped((ox + x, oy + y)) == raw.rows[y][x]
    finally:
        a.close()


@gamedata
def test_picture_table_matches_file_dat(game):
    store = AssetStore(GameDir(game))
    assert len(store.pictures) == 79
    assert store.entry("a4.pck").masked and store.entry("a4.pck").key == 11
    assert store.entry("bshield.pck").key == 12 and store.entry("curs.pck").key == 0
    assert not store.entry("advisor.pck").masked                 # key word set, mask bit not
    assert store.entry("scenario.pck").directory == 1 and store.entry("road.pck").directory == 2


# --------------------------------------------------------------------------- input


def ev(t, **kw):
    return pygame.event.Event(t, kw)


def test_alt_held_drag_gives_button_and_modifier_state():
    inp = Input(scale=2)
    # event.mod / event.buttons deliberately lie: state must come from DOWN/UP events only
    out = inp.feed([ev(pygame.KEYDOWN, key=pygame.K_LALT, mod=0, unicode=""),
                    ev(pygame.MOUSEBUTTONDOWN, button=1, pos=(100, 60)),
                    ev(pygame.MOUSEMOTION, pos=(300, 160), rel=(200, 100), buttons=(0, 0, 0))])
    assert inp.alt and not inp.shift and inp.buttons == {1}
    assert inp.drag_start == (50, 30) and inp.pos == (150, 80) and inp.dragging
    assert out[1].pos == (50, 30) and out[2].rel == (100, 50)
    inp.feed([ev(pygame.MOUSEBUTTONDOWN, button=3, pos=(300, 160))])
    assert inp.buttons == {1, 3} and inp.drag_start == (50, 30)
    inp.feed([ev(pygame.MOUSEBUTTONUP, button=1, pos=(300, 160)),
              ev(pygame.MOUSEBUTTONUP, button=3, pos=(300, 160))])
    assert inp.buttons == set() and not inp.dragging and inp.alt
    inp.feed([ev(pygame.KEYUP, key=pygame.K_LALT, mod=pygame.KMOD_ALT)])
    assert not inp.alt


def test_left_and_right_modifier_counted_apart_and_text():
    inp = Input(scale=1)
    inp.feed([ev(pygame.KEYDOWN, key=pygame.K_LSHIFT, unicode=""), ev(pygame.KEYDOWN, key=pygame.K_RSHIFT, unicode=""),
              ev(pygame.KEYUP, key=pygame.K_LSHIFT), ev(pygame.KEYDOWN, key=pygame.K_x, unicode="X")])
    assert inp.shift and inp.text == "X"
    inp.feed([])
    assert inp.text == ""


def test_motion_rel_is_the_logical_delta_and_never_read_from_the_event():
    inp = Input(scale=2)
    out = inp.feed([ev(pygame.MOUSEMOTION, pos=(1, 1)),                      # no rel at all
                    ev(pygame.MOUSEMOTION, pos=(2, 3), rel=(1, 2))])         # 1 // 2 would be 0
    assert out[0].rel == (0, 0) and out[1].rel == (1, 1) and inp.pos == (1, 1)
    out = inp.feed([ev(pygame.MOUSEBUTTONDOWN, button=1, pos=(10, 10)), ev(pygame.MOUSEMOTION, pos=(14, 10))])
    assert out[1].rel == (2, 0)


def test_control_characters_are_not_text():
    inp = Input(scale=1)
    inp.feed([ev(pygame.KEYDOWN, key=pygame.K_RETURN, unicode="\r"), ev(pygame.KEYDOWN, key=pygame.K_TAB, unicode="\t"),
              ev(pygame.KEYDOWN, key=pygame.K_BACKSPACE, unicode="\b"), ev(pygame.KEYDOWN, key=pygame.K_SPACE, unicode=" "),
              ev(pygame.KEYDOWN, key=pygame.K_a, unicode="\xe4")])
    assert inp.text == " \xe4"


def test_focus_loss_releases_everything_held():
    inp = Input(scale=1)
    inp.feed([ev(pygame.KEYDOWN, key=pygame.K_LALT, unicode=""), ev(pygame.KEYDOWN, key=pygame.K_a, unicode="a"),
              ev(pygame.MOUSEBUTTONDOWN, button=1, pos=(5, 5)), ev(pygame.MOUSEMOTION, pos=(9, 9))])
    assert inp.alt and inp.buttons and inp.keys and inp.dragging
    inp.feed([ev(pygame.WINDOWFOCUSLOST)])
    assert not inp.alt and not inp.buttons and not inp.keys and not inp.dragging and inp.drag_start is None


# --------------------------------------------------------------------------- review fixes (M1b1)


def _scenario_cfg(*flags):
    return parse_args(["--seed", "5", "--scenario", "ERYTHEA", *flags])


def test_scenario_flags_become_a_typed_new_game_config():
    _, kw = boot_target(_scenario_cfg("--controls", "hhCCCCCC", "--levels", "01233210",
                                      "--options", "1,0,2,0,0,0,1,0,0,1", "--alt-names"), {"game"})
    c = kw["new_game"]
    assert isinstance(c, NewGameConfig) and c.scenario == "ERYTHEA" and c.seed == 5
    assert c.controls == (Control.HUMAN,) * 2 + (Control.COMPUTER,) * 6
    assert c.levels == (0, 1, 2, LEVEL_OFF, LEVEL_OFF, 2, 1, 0)
    assert c.options == GameOptions.from_words([1, 0, 2, 0, 0, 0, 1, 0, 0, 1]) and c.army_set == 1
    assert c.cards == c.enhanced == (0,) * 8 and c.names is None
    d = boot_target(_scenario_cfg(), {"game"})[1]["new_game"]
    assert d.controls == (Control.HUMAN,) + (Control.COMPUTER,) * 7 and d.levels == (0,) * 8
    assert d.options == GameOptions() and d.army_set == 0
    assert all(type(v) is tuple for v in (d.controls, d.levels, d.cards, d.enhanced))


@pytest.mark.parametrize("flags", [["--controls", "HHC"], ["--controls", "HHXCCCCC"], ["--levels", "44444444"],
                                   ["--options", "1,2"], ["--options", "a,b"]])
def test_bad_scenario_flags_exit_with_a_message(flags):
    with pytest.raises(SystemExit, match=flags[0]):
        boot_target(_scenario_cfg(*flags), {"game"})


@gamedata
def test_settle_waits_and_names_the_state_of_a_hung_hook(app, monkeypatch):
    go = threading.Event()
    monkeypatch.setattr(app.manager["probe_strict"], "on_enter", lambda frm: go.wait(5))
    monkeypatch.setattr(app_mod, "SETTLE_TIMEOUT", 0.05)
    state(app).request("probe_strict")
    try:
        with pytest.raises(RuntimeError, match="'probe_strict' still running"):
            app.step()
    finally:
        go.set()
    monkeypatch.setattr(app_mod, "SETTLE_TIMEOUT", 10.0)
    app._settle()
    assert app.manager.current_state_str() == "probe_strict"


@gamedata
def test_exit_off_the_main_thread_raises(app, monkeypatch):
    s = app.manager["probe_strict"]
    monkeypatch.setattr(s, "on_enter", lambda frm: s.exit("probe_loop"))
    state(app).request("probe_strict")
    with pytest.raises(RuntimeError, match="off the main thread"):
        app.step()


@gamedata
def test_request_from_a_leaving_state_raises_instead_of_firing_next_visit(app, monkeypatch):
    s = state(app)
    monkeypatch.setattr(s, "on_exit", lambda to: s.request("probe_raise"))
    s.request("probe_backdrop")
    with pytest.raises(RuntimeError, match="not the current state"):
        app.step()
    assert s._request is None


@gamedata
def test_stale_request_on_the_target_is_dropped_on_entry(app):
    app.manager["probe_backdrop"]._request = ("probe_raise", {})
    state(app).request("probe_backdrop")
    app.step()
    app.step()
    assert app.manager.current_state_str() == "probe_backdrop"


class _HookArgs:
    def __init__(self, thread, e):
        self.thread, self.exc_type, self.exc_value, self.exc_traceback = thread, type(e), e, e.__traceback__


@gamedata
def test_all_hook_errors_kept_first_raised_rest_reported(app, capsys):
    t = threading.Thread(target=lambda: None)
    t.start()
    t.join()
    app.manager.threads["fake"] = t                        # stands for a failed hook thread
    threading.excepthook(_HookArgs(t, ProbeError("first")))
    threading.excepthook(_HookArgs(t, ProbeError("second")))
    with pytest.raises(ProbeError, match="first"):
        app._settle()
    assert "second" in capsys.readouterr().err
    threading.excepthook(_HookArgs(t, ProbeError("pending")))
    app.close()
    assert "pending" in capsys.readouterr().err


@gamedata
def test_foreign_thread_errors_go_to_the_previous_hook(app, monkeypatch):
    seen = []
    monkeypatch.setattr(app, "_prev_excepthook", lambda args: seen.append(args.exc_value))
    t = threading.Thread(target=lambda: (_ for _ in ()).throw(ProbeError("foreign")))
    t.start()
    t.join()
    assert [str(e) for e in seen] == ["foreign"]
    app._settle()                                          # nothing stored for the loop


@gamedata
def test_excepthooks_restored_when_apps_close_out_of_order(tmp_path, game):
    before = threading.excepthook
    a = make_app(tmp_path, game)
    b = make_app(tmp_path, game)
    a.close()
    assert threading.excepthook == b._on_thread_error
    b.close()
    assert threading.excepthook is before
    a.close()                                              # twice is harmless


@gamedata
def test_store_refuses_other_threads_with_runtime_error(app):
    got = []
    t = threading.Thread(target=lambda: got.append(_catch(lambda: app.assets.picture("a4.pck"))))
    t.start()
    t.join()
    assert isinstance(got[0], RuntimeError) and "main thread" in str(got[0])


def _catch(f):
    try:
        f()
    except BaseException as e:
        return e


@gamedata
def test_picture_lookup_by_table_index(app):
    a = app.assets
    assert a.entry(25).name == a.entry(39).name == "marble.pck"
    assert (a.entry(25).group, a.entry(39).group, a.entry("marble.pck").index) == (1, 8, 39)
    assert a.picture(25) is not a.picture(39) and a.picture(39) is a.picture("marble.pck")
    assert a.entry("abits.pck").flags & 0x10                      # the undocumented bit


def test_closing_a_dialog_twice_is_harmless():
    from warlords2.ui.dialog import DialogStack
    got = []
    d = DialogStack().push(Dialog(on_close=got.append))
    d.close(1)
    d.close(2)
    assert got == [1]


@gamedata
def test_present_surface_has_window_format_and_bad_indices_fail(app):
    w, ps = app.screen.window, app.screen.present_surface
    assert (ps.get_bitsize(), ps.get_masks()) == (w.get_bitsize(), w.get_masks())
    if not __debug__:
        return                                             # the index check is debug only
    app.screen.fb.set_at((3, 4), 16)
    with pytest.raises(ValueError, match=r"index 16 >= 16 at \(3, 4\)"):
        app.screen.present()


def test_unimplemented_flags_say_so(capsys):
    parse_args(["--seed", "1", "--music", "off", "--state-hash-at", "3"])
    err = capsys.readouterr().err
    assert "--music: accepted but not implemented" in err and "--state-hash-at" in err
    parse_args(["--seed", "1", "--shot-at", "1", "--record", "r.mp4", "--no-voice"])
    assert capsys.readouterr().err == ""


@gamedata
def test_headless_run_without_script_or_frame_limit_exits(app):
    with pytest.raises(SystemExit, match="--headless needs --script or a frame limit"):
        app.run()


@gamedata
def test_shot_at_and_record_work_in_the_plain_loop(tmp_path, game, monkeypatch):
    from warlords2.debug import script as script_mod
    from warlords2.debug.recorder import read_mp4
    monkeypatch.setattr(script_mod, "SHOT_ROOT", tmp_path / "shots")
    a = make_app(tmp_path, game, "--shot-at", "1,2", "--record", str(tmp_path / "r.mp4"), probe="probe_backdrop")
    try:
        a.run(frames=4)
    finally:
        a.close()
    assert sorted(p.name for p in (tmp_path / "shots" / "run").iterdir()) == ["frame_1.png", "frame_2.png"]
    assert len(read_mp4(tmp_path / "r_0.mp4")) == 4
