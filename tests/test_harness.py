"""Debug harness: script steps, captures, recorder (docs/plan.md 3.3, 3.4, 6.1, M1b2)."""
import json
import os
import types

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import cv2  # noqa: E402
import pygame  # noqa: E402
from pygame_screen_record import add_codec  # noqa: E402
import pytest  # noqa: E402

from warlords2 import app as app_mod  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.debug import recorder as recorder_mod, script as script_mod  # noqa: E402
from warlords2.debug.capture import Capture, frame_sha256, png_sha256  # noqa: E402
from warlords2.debug.recorder import Recorder, RecorderError, read_mp4, to_bgr  # noqa: E402
from warlords2.debug.run import run  # noqa: E402
from warlords2.debug.script import Script, ScriptAssertion, ScriptError  # noqa: E402

gamedata = pytest.mark.gamedata
MOUSE = (pygame.MOUSEMOTION, pygame.MOUSEBUTTONDOWN, pygame.MOUSEBUTTONUP)
OURS = (*MOUSE, pygame.KEYDOWN, pygame.KEYUP)
# mp4v stores 4:2:0 chroma: on 16-colour art at 640x480 that alone caps PSNR at about
# 26 dB, so the plan's 40 dB is out of reach for this codec.  The MP4 check is: decoded
# frame k is nearest (highest PSNR) to PNG k among all captured PNGs.  Identity is
# proven on the in-memory frames by SHA-256.


def nearest_png(decoded, pngs: dict) -> object:
    """The key of the PNG with the highest PSNR against a decoded frame."""
    return max(pngs, key=lambda k: cv2.PSNR(to_bgr(pngs[k]), decoded))


@pytest.fixture
def display():
    pygame.display.init()
    pygame.display.set_mode((640, 480))
    pygame.event.clear()
    yield
    pygame.display.quit()


def write_script(tmp_path, steps, args=()):
    p = tmp_path / "s.json"
    p.write_text(json.dumps({"args": list(args), "steps": steps}))
    return p


def fake_app(scale):
    # Input.window at a whole scale is a plain multiply by it (tests/test_display.py)
    from warlords2.ui.input import Input
    return types.SimpleNamespace(input=Input(scale))


def posted(src, frames):
    """Our event types as posted per frame: frame -> [(type, attrs)]."""
    out = {}
    for f in range(frames):
        src.before_frame(f)
        evs = [(e.type, e.dict) for e in pygame.event.get() if e.type in OURS]
        if evs:
            out[f] = evs
    return out


def picture(i):
    """A 640x480 frame that differs per i (16-colour-like flat blocks)."""
    s = pygame.Surface((640, 480), depth=32)
    s.fill((0, 0, 170))
    s.fill((255, 255, 85), (20 * i, 40, 120, 90))
    s.fill((170, 0, 0), (300, 10 * i, 60, 200))
    return s


# --------------------------------------------------------------------------- script steps


def test_steps_post_events_at_their_frame_in_window_px(display, tmp_path):
    p = write_script(tmp_path, [
        [1, {"key": "left alt", "hold": True}],
        [2, {"drag": [[10, 20], [30, 60]], "frames": 2}],
        [5, {"keyup": "left alt"}],
        [6, {"key": "a"}],
        [7, {"click": [5, 6]}],
        [8, {"rclick": [5, 6]}],
        [9, {"move": [7, 9]}],
    ])
    src = script_mod.load(p, fake_app(3), Capture(tmp_path / "shots"))
    assert src.last_frame == 10
    got = posted(src, 11)
    alt = pygame.K_LALT
    assert got == {
        1: [(pygame.KEYDOWN, {"key": alt, "unicode": "", "mod": 0, "scancode": 0})],
        2: [(pygame.MOUSEMOTION, {"pos": (30, 60), "rel": (30, 60), "buttons": (0, 0, 0)}),
            (pygame.MOUSEBUTTONDOWN, {"pos": (30, 60), "button": 1})],
        3: [(pygame.MOUSEMOTION, {"pos": (60, 120), "rel": (30, 60), "buttons": (1, 0, 0)})],
        4: [(pygame.MOUSEMOTION, {"pos": (90, 180), "rel": (30, 60), "buttons": (1, 0, 0)}),
            (pygame.MOUSEBUTTONUP, {"pos": (90, 180), "button": 1})],
        5: [(pygame.KEYUP, {"key": alt, "mod": 0, "scancode": 0})],
        6: [(pygame.KEYDOWN, {"key": pygame.K_a, "unicode": "a", "mod": 0, "scancode": 0}),
            (pygame.KEYUP, {"key": pygame.K_a, "mod": 0, "scancode": 0})],
        7: [(pygame.MOUSEMOTION, {"pos": (15, 18), "rel": (-75, -162), "buttons": (0, 0, 0)}),
            (pygame.MOUSEBUTTONDOWN, {"pos": (15, 18), "button": 1}),
            (pygame.MOUSEBUTTONUP, {"pos": (15, 18), "button": 1})],
        8: [(pygame.MOUSEBUTTONDOWN, {"pos": (15, 18), "button": 3}),
            (pygame.MOUSEBUTTONUP, {"pos": (15, 18), "button": 3})],
        9: [(pygame.MOUSEMOTION, {"pos": (21, 27), "rel": (6, 9), "buttons": (0, 0, 0)})],
    }


def test_steps_at_a_fractional_scale_post_to_window_px_that_map_back(display, tmp_path):
    """--scale 1.5: positions go out at Input.window (the first window px of the logical px)."""
    app = fake_app(1.5)
    src = script_mod.load(write_script(tmp_path, [[0, {"click": [3, 5]}], [1, {"move": [639, 479]}]]),
                          app, Capture(tmp_path / "shots"))
    got = posted(src, 2)
    assert [e[1]["pos"] for e in got[0]] == [(5, 8)] * 3 and got[1][0][1]["pos"] == (959, 719)
    assert {app.input.logical(e[1]["pos"]) for f in got for e in got[f]} == {(3, 5), (639, 479)}
    assert all(isinstance(v, int) for f in got for e in got[f] for v in e[1].get("rel", ()))


@pytest.mark.parametrize("step, match", [
    ({"assert_hash": "ab"}, "M4a"),
    ({"tap": "a"}, "exactly one op"),
    ({"key": "a", "click": [1, 2]}, "exactly one op"),
    ({"key": "a", "frames": 2}, "unknown option"),
])
def test_bad_or_unavailable_steps_fail_at_load(tmp_path, step, match):
    with pytest.raises(ScriptError, match=match):
        script_mod.read(write_script(tmp_path, [[0, step]]))


@pytest.mark.parametrize("step", [{"key": "no such key"}, {"click": [1]}, {"shot": "a/b"},
                                  {"assert_state": {"phase": "x"}}, {"golden": {"ref": "x"}},
                                  {"drag": [[0, 0], [1, 1]], "frames": 0}, {"press_button": "100"},
                                  {"wait_dialog": 3}, {"wait_dialog": "x", "frames": -1}])
def test_bad_step_arguments_fail_at_load(display, tmp_path, step):
    with pytest.raises(ScriptError):
        script_mod.load(write_script(tmp_path, [[0, step]]), fake_app(1))


def test_checks_of_a_frame_run_once_and_before_frame_catches_up(tmp_path):
    src = Script([(0, {"shot": "a"})], fake_app(1), Capture(tmp_path))
    calls = []
    src._shot = lambda f, name: calls.append((f, name))
    src.before_frame(0)
    assert calls == []
    src.before_frame(1)                    # app.run path: nobody called after_frame(0)
    src.after_frame(0)
    assert calls == [(0, "a")]


# --------------------------------------------------------------------------- capture and recorder


def test_png_capture_hash_equals_surface_hash(display, tmp_path):
    cap = Capture(tmp_path, shot_at=[2])
    for f in range(4):
        cap.after_frame(picture(f), f)
    assert [s["name"] for s in cap.shots] == ["frame_2"]
    assert cap.shots[0]["sha256"] == frame_sha256(picture(2)) == png_sha256(tmp_path / "frame_2.png")
    with pytest.raises(ValueError, match="twice"):
        cap.shot(picture(0), "frame_2", 9)


def test_recording_holds_n_distinct_copies_and_mp4_reads_back(display, tmp_path):
    rec = Recorder(tmp_path / "run.mp4", fps=60)
    cap = Capture(tmp_path / "frames")
    live = pygame.Surface((640, 480), depth=32)       # one surface redrawn every frame, like present_surface
    n = 12
    for f in range(n):
        live.blit(picture(f), (0, 0))
        rec.after_frame(live, f)
        cap.shot(live, f"f{f}", f)
    frames = rec.recording.frames
    assert len(frames) == n and len({id(s) for s in frames}) == n and all(s is not live for s in frames)
    assert len({frame_sha256(s) for s in frames}) == n                     # S6: not n references to one frame
    for k, s in enumerate(frames):
        assert frame_sha256(s) == png_sha256(tmp_path / "frames" / f"f{k}.png")
    seg, = rec.close()
    assert seg["frames"] == n and seg["path"] == str((tmp_path / "run_0.mp4").resolve())
    decoded = read_mp4(tmp_path / "run_0.mp4")
    assert len(decoded) == n
    pngs = {k: pygame.image.load(str(tmp_path / "frames" / f"f{k}.png")) for k in range(n)}
    assert [nearest_png(f, pngs) for f in decoded] == list(range(n))
    assert seg["nearest_ok"] and seg["not_nearest"] == [] and len(seg["psnr"]) == n


def test_segments_and_frame_step(display, tmp_path, monkeypatch):
    monkeypatch.setattr(recorder_mod, "SEGMENT", 5)
    rec = Recorder(tmp_path / "demo.mp4", fps=30, every=2)
    for f in range(24):
        rec.after_frame(picture(f), f)
    segs = rec.close()
    assert [(s["first_frame"], s["frames"]) for s in segs] == [(0, 5), (10, 5), (20, 2)]
    assert [len(read_mp4(s["path"])) for s in segs] == [5, 5, 2]
    assert segs[1]["frame_sha256"][0] == frame_sha256(picture(10))


def test_failed_writer_is_detected(display, tmp_path):
    """S7: with the library's own `h264` mapping the writer fails silently."""
    add_codec("mp4", "h264")
    try:
        rec = Recorder(tmp_path / "x.mp4", fps=60)
        rec.after_frame(picture(0), 0)
        with pytest.raises(RecorderError, match="reads back 0"):
            rec.close()
    finally:
        add_codec("mp4", recorder_mod.FOURCC)


# --------------------------------------------------------------------------- through the app


@gamedata
def test_scripted_input_reaches_input_state(tmp_path):
    p = write_script(tmp_path, [
        [1, {"key": "left alt", "hold": True}],
        [2, {"drag": [[100, 100], [300, 200]], "frames": 4}],
        [8, {"keyup": "left alt"}],
        [9, {"key": "x"}],
    ])
    a = app_mod.App(parse_args(["--headless", "--seed", "1", "--user-dir", str(tmp_path / "u"),
                                "--probe", "probe_loop", "--scale", "3"]))
    try:
        src = script_mod.load(p, a, Capture(tmp_path / "shots"))
        seen = {}
        for f in range(src.last_frame + 1):
            src.before_frame(f)
            a.step()
            i = a.input
            seen[f] = (i.pos, set(i.buttons), i.alt, i.dragging, i.text)
        assert seen[1] == ((0, 0), set(), True, False, "")
        assert seen[2] == ((100, 100), {1}, True, False, "")
        assert seen[4] == ((200, 150), {1}, True, True, "")
        assert seen[6] == ((300, 200), set(), True, False, "")
        assert seen[8][2] is False and seen[9][4] == "x"
    finally:
        a.close()


@gamedata
def test_run_records_every_frame_and_shot_k_is_recorded_frame_k(tmp_path, monkeypatch):
    """Frames that change every logical frame: a probe painting the mouse position."""
    def paint(self, fb):
        fb.fill(1)
        x, y = self.app.input.pos
        fb.fill(14, (x, y, 40, 30))
        fb.fill(4, (0, 8 * self.app.frame, 640, 8))
    monkeypatch.setattr("warlords2.debug.probe_states.Loop.paint", paint)
    steps = [[0, {"move": [0, 0]}], [1, {"drag": [[10, 10], [400, 300]], "frames": 20}]]
    steps += [[f, {"shot": f"s{f}"}] for f in range(0, 24, 3)]
    p = write_script(tmp_path, steps, ["--probe", "probe_loop", "--seed", "3"])
    m = run(p, tmp_path / "ev", ["--headless", "--user-dir", str(tmp_path / "u")])
    seg, = m["segments"]
    assert m["frames"] == seg["frames"] == 23 and len(set(seg["frame_sha256"])) == 23
    decoded = read_mp4(seg["path"])
    assert len(decoded) == 23 and seg["nearest_ok"]
    pngs = {sh["frame"]: pygame.image.load(sh["path"]) for sh in m["shots"]}
    for sh in m["shots"]:
        assert seg["frame_sha256"][sh["frame"]] == sh["sha256"] == png_sha256(sh["path"])
        assert nearest_png(decoded[sh["frame"]], pngs) == sh["frame"]
    man = json.loads((tmp_path / "ev" / "manifest.json").read_text())
    assert man["seed"] == 3 and man["error"] is None and len(man["shots"]) == 8


@gamedata
def test_failed_check_still_writes_manifest_and_recording(tmp_path):
    p = write_script(tmp_path, [[2, {"assert_state": {"state": "probe_raise"}}]], ["--probe", "probe_loop"])
    with pytest.raises(ScriptAssertion, match="probe_raise"):
        run(p, tmp_path / "ev", ["--headless", "--user-dir", str(tmp_path / "u")])
    man = json.loads((tmp_path / "ev" / "manifest.json").read_text())
    assert man["error"].startswith("ScriptAssertion") and man["segments"][0]["frames"] == 3


@gamedata
def test_plain_cli_script_run_checks_its_steps(tmp_path, monkeypatch):
    """`python -m warlords2 --script` (app.run) only calls before_frame; checks still run."""
    monkeypatch.setattr(script_mod, "SHOT_ROOT", tmp_path / "shots")
    p = write_script(tmp_path, [[0, {"shot": "first"}], [4, {"assert_state": {"state": "probe_loop"}}]])
    with pytest.raises(ScriptAssertion, match="frame 4"):
        app_mod.main(["--headless", "--seed", "1", "--user-dir", str(tmp_path / "u"),
                      "--probe", "probe_backdrop", "--script", str(p)])
    assert (tmp_path / "shots" / "s" / "first.png").is_file()


def test_nearest_frames_flags_a_swapped_frame(display):
    frames = [picture(i) for i in range(4)]
    digests = [frame_sha256(s) for s in frames]
    decoded = [to_bgr(frames[i]) for i in (0, 2, 1, 3)]
    assert recorder_mod.nearest_frames(frames, digests, decoded)[0] == [True, False, False, True]
    same = [frames[0], frames[0].copy()]                 # equal frames: a tie is nearest
    assert recorder_mod.nearest_frames(same, [digests[0]] * 2, [to_bgr(frames[0])] * 2)[0] == [True, True]


# --------------------------------------------------------------------------- M2a steps


@gamedata
def test_press_button_clicks_the_centre_of_its_rectangle(display, tmp_path, game):
    from warlords2.assets.store import AssetStore
    from warlords2.formats.gamedir import GameDir
    app = types.SimpleNamespace(input=fake_app(2).input, assets=AssetStore(GameDir(game)))
    src = script_mod.load(write_script(tmp_path, [[1, {"press_button": 190}]]), app, Capture(tmp_path))
    assert posted(src, 3) == {1: [                         # BUTTON.DAT 190: (176, 260, 64, 23)
        (pygame.MOUSEMOTION, {"pos": (416, 542), "rel": (416, 542), "buttons": (0, 0, 0)}),
        (pygame.MOUSEBUTTONDOWN, {"pos": (416, 542), "button": 1}),
        (pygame.MOUSEBUTTONUP, {"pos": (416, 542), "button": 1})]}
    with pytest.raises(ScriptError, match="no BUTTON.DAT record"):
        script_mod.load(write_script(tmp_path, [[1, {"press_button": 65000}]]), app, Capture(tmp_path))


@gamedata
def test_press_button_answers_a_confirm_and_wait_dialog_follows_the_stack(tmp_path):
    p = write_script(tmp_path, [
        [0, {"wait_dialog": "message", "frames": 3}],
        [2, {"key": "space"}],
        [3, {"wait_dialog": "message"}],
        [4, {"key": "space"}],
        [5, {"wait_dialog": "confirm", "frames": 0}],
        [6, {"press_button": 190}],
        [7, {"wait_dialog": "confirm", "frames": 0}],
        [8, {"press_button": 189}],
        [9, {"wait_dialog": "help_page", "frames": 0}],
    ], ["--probe", "probe_ui_dialogs", "--seed", "1"])
    m = run(p, tmp_path / "ev", ["--headless", "--user-dir", str(tmp_path / "u")])
    waits = [(c["frame"], c["got"]) for c in m["checks"] if c["op"] == "wait_dialog"]
    assert waits == [(1, "message"), (3, "message"), (5, "confirm"), (7, "confirm"), (9, "help_page")]
    assert m["frames"] == 3 + script_mod.WAIT_FRAMES + 2         # a deadline extends the run
    p = write_script(tmp_path, [[0, {"wait_dialog": "confirm", "frames": 3}]], ["--probe", "probe_ui_dialogs"])
    with pytest.raises(ScriptAssertion, match="wait_dialog 'confirm' since frame 0, top is 'message'"):
        run(p, tmp_path / "ev2", ["--headless", "--user-dir", str(tmp_path / "u")])
    man = json.loads((tmp_path / "ev2" / "manifest.json").read_text())
    assert man["checks"][-1] == {"frame": 3, "op": "wait_dialog", "from": 0, "want": "confirm",
                                 "got": "message", "ok": False}


@gamedata
def test_record_elsewhere_removes_stale_segments_of_its_stem(tmp_path):
    vids = tmp_path / "vids"
    vids.mkdir()
    for name in ("demo_0.mp4", "demo_7.mp4", "demo_final.mp4", "other_0.mp4"):
        (vids / name).write_bytes(b"old")
    p = write_script(tmp_path, [[1, {"shot": "a"}]], ["--probe", "probe_backdrop"])
    m = run(p, tmp_path / "ev", ["--headless", "--user-dir", str(tmp_path / "u"), "--record", str(vids / "demo.mp4")])
    assert sorted(x.name for x in vids.iterdir()) == ["demo_0.mp4", "demo_final.mp4", "other_0.mp4"]
    assert m["segments"][0]["path"] == str((vids / "demo_0.mp4").resolve()) and len(read_mp4(vids / "demo_0.mp4")) == m["frames"] == 3
