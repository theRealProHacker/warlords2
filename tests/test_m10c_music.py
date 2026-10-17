"""M10c package G: the music host (`audio.music`, `audio.music_triggers`, the Settings box 276,
the pre-game modes, the load's mode-1 call, the computer phase's sync / poll) and the script
m10c_music asserted by its music log.  The player runs against a fake backend (what it loads,
plays, stops); the rules' dice are the engine's (tests/engine/test_music.py)."""
import json
import os
from pathlib import Path
from types import SimpleNamespace

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.audio import music as M  # noqa: E402
from warlords2.audio import music_render as R  # noqa: E402
from warlords2.audio import music_triggers as MT  # noqa: E402
from warlords2.audio import settings as AS  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.formats.tables import StringTable  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.music import MusicWords  # noqa: E402
from warlords2.persist.userdir import UserDir  # noqa: E402
from warlords2.rules import music as MU  # noqa: E402
from warlords2.ui import registry  # noqa: E402

pytestmark = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
SCRIPT = Path(__file__).resolve().parent / "scripts" / "m10c_music.json"
REAL_BUNDLED = M.BUNDLED


@pytest.fixture(autouse=True)
def no_bundle(tmp_path, monkeypatch):
    """The tests below see no bundled set unless they put it back (`bundled`): "no cache" means
    no music anywhere, as before the set was shipped."""
    monkeypatch.setattr(M, "BUNDLED", tmp_path / "nobundle")


class Fake:
    def __init__(self):
        self.calls = []

    def play(self, path):
        self.calls.append(("play", Path(path).name))

    def stop(self):
        self.calls.append(("stop",))


def _files(game):
    return StringTable(GameDir(game).read("DATA/FILE.DAT"))


def _stub(game, tmp_path, variant="opl", cache=None, tick_hz=60):
    words = MusicWords(on=1, driver=1)
    cfg = SimpleNamespace(music_variant=variant, music_cache=cache or tmp_path / "nocache", tick_hz=tick_hz,
                          no_voice=True, music="on", fixed_dt=True)
    return SimpleNamespace(gd=GameDir(game), user=UserDir(tmp_path / "u", Path(game)), cfg=cfg, frame=0,
                           music_words=words, music_log=M.MusicLog())


def _player(app, capsys=None):
    p = M.MusicPlayer(app, backend=Fake())
    p.silent = False                                   # the fake plays whatever the cache holds
    return p


def _started(words, mode, group, index, loop):
    words.starts += 1
    words.mode, words.playing, words.loop, words.track = mode, 1, loop, (group, index)
    return E.MusicStarted({"mode": mode, "group": group, "index": index, "loop": loop, "site": "t"})


# ------------------------------------------------------------------ names, cache


def test_variant_names_and_every_music_entry_has_a_stem(game):
    files = _files(game)
    assert M.track_name(files, 9, 1) == "INT21" and M.track_name(files, 8, 0) == "STARTUP"
    assert R.stem("INT21", "opl") == "SINT21" and R.stem("INT21", "gm") == "RINT21"
    names = {R.stem(n, v) for n in R.TRACK_NAMES for v in R.VARIANTS}
    for v in R.VARIANTS:
        stems = M.music_stems(files, v)
        assert set(stems) == {R.stem(n, v) for n in R.TRACK_NAMES if n != "ANIM"}   # 26 entries, INT12 twice
        assert all(s[0] == R.VARIANT_PREFIX[v] for s in stems)
        for g in M.MUSIC_GROUPS:
            for i in range(len(files.groups[g])):
                assert R.stem(M.track_name(files, g, i), v) in stems
    m = R.load_manifest()
    if m is not None:                                  # a local cache: every stem is in it
        assert set(M.music_stems(files, "opl")) | set(M.music_stems(files, "gm")) <= set(m["tracks"])


def test_no_cache_is_silent_with_one_stderr_line(game, tmp_path, capsys):
    app = _stub(game, tmp_path)
    p = M.MusicPlayer(app, backend=Fake())
    err = capsys.readouterr().err
    assert p.silent and err.count("\n") == 1 and R.COMMAND in err
    p.events([_started(app.music_words, 1, 10, 3, 1)])
    assert p.backend.calls == [] and p.current.stem == "SINT9"          # timing kept, nothing heard
    assert app.music_log.records[-1]["wav"] == "SINT9.wav"


def test_no_driver_checks_no_cache(game, tmp_path, capsys):
    app = _stub(game, tmp_path)
    app.music_words.driver = 0
    p = M.MusicPlayer(app, backend=Fake())
    assert not p.silent and capsys.readouterr().err == ""


def test_manifest_mismatch_is_stale(game, tmp_path):
    m = R.load_manifest()
    if m is None:
        pytest.skip("no local music cache (python -m warlords2.audio.music_render)")
    gd = GameDir(game)
    stems = M.music_stems(_files(game), "opl")
    assert R.stale(m, gd, stems) == []
    bad = json.loads(json.dumps(m))
    bad["tracks"]["SINT12"]["source_sha256"] = "0" * 64
    bad["tracks"]["SINT14"]["midpak_ad_sha256"] = "0" * 64
    bad["tracks"]["SINT15"]["renderer_version"] = -1
    if "SANIM" in bad["tracks"]:
        bad["tracks"]["SANIM"]["source_sha256"] = "0" * 64          # the intro's: not checked here
        assert R.stale(bad, gd, ["SANIM"]) == ["SANIM"]
    assert R.stale(bad, gd, stems) == ["SINT12", "SINT14", "SINT15"]
    cache = tmp_path / "c"
    cache.mkdir()
    (cache / R.MANIFEST).write_text(json.dumps(bad))
    for s in stems:
        (cache / f"{s}.wav").symlink_to(R.DEFAULT_OUT / f"{s}.wav")
    p = M.MusicPlayer(_stub(game, tmp_path, cache=cache), backend=Fake())
    assert p.silent and p.cache_problem == ["SINT12", "SINT14", "SINT15"]


@pytest.mark.parametrize("anim_ok", [True, False])
def test_stale_intro_track_mutes_only_the_intro(game, tmp_path, capsys, anim_ok):
    """START\\SANIM.XMI changed (or gone): the game's music still plays, the intro's ANIM is
    logged but not sounded (one stderr line)."""
    m = R.load_manifest()
    if m is None or "SANIM" not in m["tracks"]:
        pytest.skip("no local music cache with ANIM (python -m warlords2.audio.music_render)")
    bad = json.loads(json.dumps(m))
    if not anim_ok:
        bad["tracks"]["SANIM"]["source_sha256"] = "0" * 64
    cache = tmp_path / "c"
    cache.mkdir()
    (cache / R.MANIFEST).write_text(json.dumps(bad))
    for s in {*M.music_stems(_files(game), "opl"), "SANIM"}:
        (cache / f"{s}.wav").symlink_to(R.DEFAULT_OUT / f"{s}.wav")
    app = _stub(game, tmp_path, cache=cache)
    app.cfg.fixed_dt = False
    p = M.MusicPlayer(app, backend=Fake())
    assert not p.silent and p.cache_problem is None and capsys.readouterr().err == ""
    p.play_once("SANIM", "0579:002d")
    err = capsys.readouterr().err
    assert app.music_log.records[-1]["wav"] == "SANIM.wav"                  # logged either way
    assert p.backend.calls == ([("play", "SANIM.wav")] if anim_ok else [])
    assert (err == "") == anim_ok and err.count("\n") == (0 if anim_ok else 1)
    p.stop_once("end")
    p.events([_started(app.music_words, 1, 10, 3, 1)])
    assert p.backend.calls[-1] == ("play", "SINT9.wav")                    # the game's music plays


# ------------------------------------------------------------------ the bundled set


@pytest.fixture
def bundled(monkeypatch):
    monkeypatch.setattr(M, "BUNDLED", REAL_BUNDLED)
    return REAL_BUNDLED


def test_bundled_set_is_current_for_this_copy(game, bundled):
    """warlords2/data/music/: every stem of both variants (ANIM too) as an OGG whose manifest
    entry matches the user's XMI / MIDPAK.AD bytes."""
    m = R.load_manifest(bundled)
    gd = GameDir(game)
    for v in R.VARIANTS:
        stems = [*M.music_stems(_files(game), v), R.stem("ANIM", v)]
        assert R.stale(m, gd, stems, bundled) == []
        assert all(m["tracks"][s]["wav"] == f"{s}.ogg" for s in stems)
    assert sorted(p.name for p in bundled.iterdir()) == sorted([R.MANIFEST, *(e["wav"] for e in m["tracks"].values())])


@pytest.mark.parametrize("variant", ["opl", "gm"])
def test_no_cache_plays_the_bundled_set(game, tmp_path, capsys, bundled, variant):
    """No --music-cache render: the bundled OGGs play, no stderr line; the log still names the
    stem's WAV (the same log as with the cache)."""
    app = _stub(game, tmp_path, variant=variant)
    app.cfg.fixed_dt = False
    p = M.MusicPlayer(app, backend=Fake())
    pre = R.VARIANT_PREFIX[variant]
    assert not p.silent and p.cache_problem is None and p.dir == bundled and capsys.readouterr().err == ""
    p.play_once(pre + "ANIM", "0579:002d")
    p.stop_once("end")
    p.events([_started(app.music_words, 1, 10, 3, 1)])
    assert p.backend.calls == [("play", pre + "ANIM.ogg"), ("stop",), ("play", pre + "INT9.ogg")]
    assert [r.get("wav") for r in app.music_log.records] == [pre + "ANIM.wav", pre + "ANIM.wav", pre + "INT9.wav"]
    assert (bundled / f"{pre}INT9.ogg").is_file()


def test_bundled_set_of_another_game_version_is_silent(game, tmp_path, capsys, monkeypatch):
    """The bundled set is checked like the cache: one XMI of this copy differs from the one it
    was rendered from, so it is not played (silent, one stderr line), as without it."""
    m = R.load_manifest(REAL_BUNDLED)
    m["tracks"]["SINT12"]["source_sha256"] = "0" * 64
    other = tmp_path / "bundle"
    other.mkdir()
    (other / R.MANIFEST).write_text(json.dumps(m))
    for e in m["tracks"].values():
        (other / e["wav"]).symlink_to(REAL_BUNDLED / e["wav"])
    assert R.stale(m, GameDir(game), M.music_stems(_files(game), "opl"), other) == ["SINT12"]
    monkeypatch.setattr(M, "BUNDLED", other)
    p = M.MusicPlayer(_stub(game, tmp_path), backend=Fake())
    err = capsys.readouterr().err
    assert p.silent and p.dir == tmp_path / "nocache" and err.count("\n") == 1 and R.COMMAND in err


def test_current_cache_is_played_before_the_bundled_set(game, tmp_path, bundled):
    m = R.load_manifest()
    if m is None:
        pytest.skip("no local music cache (python -m warlords2.audio.music_render)")
    p = M.MusicPlayer(_stub(game, tmp_path, cache=R.DEFAULT_OUT), backend=Fake())
    p.events([_started(p.words, 1, 10, 3, 1)])
    assert not p.silent and p.dir == R.DEFAULT_OUT and p.backend.calls == [("play", "SINT9.wav")]


# ------------------------------------------------------------------ the player


def test_loop_restarts_at_the_poll_after_its_end(game, tmp_path):
    app = _stub(game, tmp_path)
    p = _player(app)
    p.events([_started(app.music_words, 1, 10, 0, 1)])
    cur = p.current
    ticks = R.load_manifest()["tracks"]["SINT0"]["end_tick"] if R.load_manifest() else None
    from warlords2.formats.xmi import sequence_ticks
    t = sequence_ticks(GameDir(game).read("SOUND/SINT0.XMI"))
    assert ticks in (None, t) and cur.frames == -(-t * 60 // 120)
    assert p.backend.calls == [("play", "SINT0.wav")]
    app.frame = cur.frames - 1
    p.poll()
    assert p.backend.calls == [("play", "SINT0.wav")]                  # not ended yet
    app.frame = cur.frames + 5                                       # the first poll after its end
    p.poll()
    assert p.backend.calls[1:] == [("stop",), ("play", "SINT0.wav")] and p.current.started == cur.frames + 5
    assert app.music_log.records[-1]["kind"] == "restart"


def test_mode2_one_shot_ends_at_the_poll_and_restarts_at_the_next_side(game, tmp_path):
    """155e:02ab stops an ended one-shot (mode 2) track; the EXE re-rolls at the next 21d4.  Under
    X32 O1 the engine finds it "still playing" there (no die), and by the user decision the player
    restarts the same file at that point ("side") instead."""
    app = _stub(game, tmp_path)
    p = _player(app)
    p.events([_started(app.music_words, 2, 11, 1, 0)])
    n = p.current.frames
    app.frame = n // 2
    assert MU.start(app.music_words, 2, "ovl61:21d4", lambda *a: pytest.fail("die")) == []   # same
    p.side()
    p.poll()
    assert p.backend.calls == [("play", "SINT3.wav")]                 # not ended: nothing
    app.frame = n
    p.poll("ovl61:2206")
    assert p.backend.calls[-1] == ("stop",) and p.current.ended          # silent (the Turn pop-up)
    app.frame = n + 50
    p.poll()
    assert len(p.backend.calls) == 2                                     # stays silent at polls
    p.side()
    assert p.backend.calls[-1] == ("play", "SINT3.wav") and p.current.started == n + 50
    assert [r["kind"] for r in app.music_log.records] == ["start", "end", "restart"]
    p2 = _player(_stub(game, tmp_path))                                  # ended unpolled: at side too
    p2.events([_started(p2.words, 2, 11, 1, 0)])
    p2.app.frame = p2.current.frames + 1
    p2.side()
    assert p2.backend.calls == [("play", "SINT3.wav"), ("stop",), ("play", "SINT3.wav")]


def test_new_track_is_a_hard_cut_and_stop_is_immediate(game, tmp_path):
    app = _stub(game, tmp_path)
    p = _player(app)
    w = app.music_words
    p.events([_started(w, 1, 10, 0, 1)])
    app.frame = 7
    p.events([_started(w, 5, 13, 1, 1)])
    assert p.backend.calls == [("play", "SINT0.wav"), ("stop",), ("play", "SINT8.wav")]
    assert p.current.started == 7
    MU.stop(w)                                                       # Quit / Settings off
    p.poll()
    assert p.backend.calls[-1] == ("stop",) and p.current is None


def test_events_after_a_sync_are_not_played_twice(game, tmp_path):
    """The medal's MusicStarted 8 and 1 come from one command: each sounds when the animator
    reaches it; a start the player caught up through `sync` (the runner thread) is not again."""
    app = _stub(game, tmp_path)
    p = _player(app)
    w = app.music_words
    a, b = _started(w, 8, 16, 0, 1), _started(w, 1, 10, 2, 1)
    p.events([a])
    assert p.current.stem == "SINT18"
    p.events([b])
    assert p.current.stem == "SINT6"
    c = _started(w, 2, 11, 0, 0)
    p.sync()
    assert p.current.stem == "SINT2"
    p.events([c])
    assert [x for x in p.backend.calls if x[0] == "play"] == [("play", "SINT18.wav"), ("play", "SINT6.wav"),
                                                               ("play", "SINT2.wav")]


def test_gm_variant_plays_the_r_files(game, tmp_path):
    app = _stub(game, tmp_path, variant="gm")
    p = _player(app)
    p.events([_started(app.music_words, 0, 8, 0, 1)])
    assert p.backend.calls == [("play", "RSTARTUP.wav")]


# ------------------------------------------------------------------ the setting


def test_fresh_user_dir_music_on_only_interactive(game, tmp_path):
    def app(fixed, music="on", user="u"):
        return SimpleNamespace(gd=GameDir(game), user=UserDir(tmp_path / user, Path(game)),
                               cfg=SimpleNamespace(no_voice=False, fixed_dt=fixed, music=music))
    assert AS.load(app(False), digital=True).music                     # interactive: on
    assert not AS.load(app(True), digital=True).music                  # script / headless: the game's "001"
    assert not AS.load(app(False, "off"), digital=True).music          # no driver: forced 0
    a = app(False, user="v")
    a.user.path(AS.FILE).write_bytes(b"001")                           # the user's own file decides
    assert not AS.load(a, digital=True).music
    assert MT.make_words(app(False)) == MusicWords(on=1, driver=1)
    assert MT.make_words(app(False, "off")) == MusicWords(on=0, driver=0)


def _app(tmp_path, *extra, options=None, cache=None):
    user = tmp_path / "u"
    if options is not None:
        user.mkdir(parents=True, exist_ok=True)
        (user / AS.FILE).write_bytes(options)
    args = ["--headless", "--no-intro", "--no-voice", "--seed", "3", "--user-dir", str(user), *extra]
    if cache is not None:
        args += ["--music-cache", str(cache)]
    a = App(parse_args(args))
    a.music_player.backend = Fake()
    a.music_player.silent = False
    return a


def _human(a, n=600):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) in ("human", "over") and not g.dialogs:
            return g
        top = g.dialogs.top if hasattr(g, "dialogs") and g.dialogs else None
        tid = getattr(top, "dialog_id", None)
        if tid == "production":
            top.press(192)
        elif tid == "hero_offer":
            top.press(287)
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message", "level_up", "medal") else [])
    raise AssertionError("no human phase")


def _settle(a, name, n=400):
    for _ in range(n):
        st = a.manager.current_state()
        if a.manager.current_state_str() == name and not st.dialogs and getattr(st, "ready", True):
            return st
        a.step([])
    raise AssertionError("not settled in %s" % name)


def _calls(a):
    return [(r["site"], r["mode"], r["outcome"], len(r["dice"])) for r in a.music_log.records if r["kind"] == "call"]


def test_settings_box_sends_setmusic_and_writes_options(tmp_path, monkeypatch):
    a = _app(tmp_path, "--scenario", "ERYTHEA")
    try:
        g = _human(a)
        assert a.music_words.on == 0 and g.state.music is a.music_words
        seen = []
        real = g.command
        monkeypatch.setattr(g, "command", lambda cmd: (seen.append(cmd), real(cmd))[1])
        d = registry.run_action(registry.MENU_ID["settings"], g)
        assert d.row.state[276] == 1 and d.sound[0] is False
        before = g.state.rng.state()
        d.press(276)
        from warlords2.model import commands as C
        assert seen[-1] == C.SetMusic(True) and a.music_words.on == 1 and d.sound[0] is True
        assert (tmp_path / "u" / AS.FILE).read_bytes()[:1] == b"1"
        assert g.state.rng.state() != before                            # mode 1: its die
        assert a.music_player.current.mode == 1 and a.music_player.backend.calls[-1][0] == "play"
        d.press(276)
        assert seen[-1] == C.SetMusic(False) and a.music_words.on == 0
        assert (tmp_path / "u" / AS.FILE).read_bytes()[:1] == b"0"
        assert a.music_player.current is None and a.music_player.backend.calls[-1] == ("stop",)
        assert _calls(a) == [("ovl68:0529", 4, "off", 0), ("ovl33:05a0", 1, "play", 1)]   # turn 1: the offer
    finally:
        a.close()


def test_music_off_flag_disables_the_box(tmp_path):
    a = _app(tmp_path, "--scenario", "ERYTHEA", "--music", "off", options=b"101")
    try:
        g = _human(a)
        assert a.music_words == MusicWords(on=0, driver=0) and a.music_player.current is None
        d = registry.run_action(registry.MENU_ID["settings"], g)
        assert d.row.state[276] == 2 and d.sound[0] is False
        d.press(276)
        assert a.music_words.on == 0 and not (tmp_path / "u" / AS.FILE).read_bytes().startswith(b"0")
    finally:
        a.close()


def test_pre_game_modes_and_new_game(tmp_path):
    """Music on: Game Start 0 (play), Setup 0 (same), Begin 11 (play), the turn-1 start 4 (the
    hero offer, no die); New Game with mode 4 looping: 0 (play, the cut), 0 (same), 11, 4."""
    a = _app(tmp_path, options=b"101")
    try:
        menu = _settle(a, "menu")
        menu.on_button(103)
        setup = _settle(a, "setup")
        setup.on_button(141)
        g = _human(a)
        first = [("ovl60:00fb", 0, "play", 0), ("ovl57:003a", 0, "same", 0), ("ovl57:0e24", 11, "play", 0),
                 ("ovl68:0529", 4, "play", 0)]
        assert _calls(a) == first
        assert [r["wav"] for r in a.music_log.records if r["kind"] == "start"] == \
            ["SSTARTUP.wav", "SINT22.wav", a.music_player.current.stem + ".wav"]
        registry.run_action(registry.MENU_ID["new_game"], g)
        g.dialogs.top.close(True)
        menu = _settle(a, "menu")
        menu.on_button(103)
        setup = _settle(a, "setup")
        setup.on_button(141)
        g2 = _human(a)
        assert _calls(a)[4:] == first and g2.state.music is a.music_words
    finally:
        a.close()


def test_load_mid_turn_plays_nothing_new_and_quit_stops(tmp_path):
    from test_m10b_host import _load, _save
    a = _app(tmp_path, "--scenario", "ERYTHEA", options=b"101")
    try:
        g = _human(a)
        _save(g, 0)
        g2 = _load(a, g, 0)
        assert _calls(a)[-1] == ("ovl49:040a", 1, "play", 1)           # mode 4 (the offer) before
        g2.dialogs.top.close(None)
        cur = a.music_player.current
        assert cur.mode == 1
        g3 = _load(a, g2, 0)
        assert _calls(a)[-1] == ("ovl49:040a", 1, "same", 0)           # mode 1 looping: no die
        g3.dialogs.top.close(None)
        assert a.music_player.current is cur
        a.exit_program()
        assert a.music_words.playing == 0 and a.music_player.current is None
    finally:
        a.close()


def test_load_from_game_start_plays_mode1_after_the_message(tmp_path):
    from test_m10b_host import _load, _save
    a = _app(tmp_path, "--scenario", "ERYTHEA", options=b"101")
    try:
        _save(_human(a), 0)
    finally:
        a.close()
    b = _app(tmp_path, options=b"101")
    try:
        menu = _settle(b, "menu")
        g = _load(b, menu, 0)
        assert g.state.music is b.music_words                          # fresh_run_part(music=)
        assert _calls(b)[-1] == ("ovl49:040a", 1, "play", 1)
        assert b.music_player.current.mode == 0                         # the message waits first
        g.dialogs.top.close(None)
        assert b.music_player.current.mode == 1
    finally:
        b.close()


def test_end_turn_syncs_mode2_at_side_and_polls_at_loop_check(tmp_path, monkeypatch):
    a = _app(tmp_path, "--scenario", "ERYTHEA", options=b"101")
    try:
        g = _human(a)
        polls = []
        real = a.music_player.poll
        monkeypatch.setattr(a.music_player, "poll", lambda where="idle": (polls.append(where), real(where))[1])
        real_side = a.music_player.side
        monkeypatch.setattr(a.music_player, "side", lambda at: (polls.append("side " + at), real_side(at))[1])
        g.end_turn()
        g = _human(a, 4000)
        sides = [c for c in _calls(a) if c[0] == "ovl61:21d4"]
        assert sides[0] == ("ovl61:21d4", 2, "play", 1) and all(c[2] == "same" for c in sides[1:])
        starts = [r for r in a.music_log.records if r["kind"] == "start"]
        assert [r["mode"] for r in starts[-2:]] == [2, 1] and starts[-2]["via"] == "ovl61:21d4"
        assert polls.count("ovl61:2206") == len(sides) == polls.count("side ovl61:21d4")
    finally:
        a.close()


def test_dice_identical_without_cache(tmp_path):
    """No cache: the driver stays present, the same calls and dice as with the cache."""
    runs = []
    for k, cache in enumerate((None, tmp_path / "empty")):
        a = _app(tmp_path / str(k), "--scenario", "ERYTHEA", options=b"101", cache=cache)
        try:
            g = _human(a)
            g.end_turn()
            g = _human(a, 4000)
            runs.append((_calls(a), g.state.hash(), [(r["kind"], r.get("wav")) for r in a.music_log.records]))
        finally:
            a.close()
    assert runs[0] == runs[1]


# ------------------------------------------------------------------ the script


def _script_log(tmp_path, name):
    from warlords2.debug.run import run
    m = run(SCRIPT, tmp_path / name, ["--headless"], enforce_golden=False)
    assert all(c["ok"] for c in m["checks"] if c["op"].startswith("assert_"))
    lines = (tmp_path / name / "music.jsonl").read_text().splitlines()
    return m, [json.loads(x) for x in lines]


def test_script_music_log(tmp_path):
    m, log = _script_log(tmp_path, "a")
    calls = [(r["site"], r["mode"], r["outcome"], len(r["dice"])) for r in log if r["kind"] == "call"]
    side = ("ovl61:21d4", 2)
    assert calls == [(*side, "off", 0)] * 4 + [                      # Begin: sides 0..3, music off
        ("ovl68:0529", 4, "off", 0),                                  # the turn-1 offer
        ("ovl33:05a0", 1, "play", 1),                                 # Settings 276 on: a die
        ("ovl49:040a", 1, "same", 0),                                 # the load mid-turn: no die
        ("ovl01:0006", 5, "play", 1),                                 # the temple menu
        ("ovl33:05a0", 1, "play", 1),                                 # off, then on: a die again
        (*side, "play", 1)] + [(*side, "same", 0)] * 6 + [            # End Turn: 7 computer sides
        ("ovl68:0546", 1, "play", 1)]                                 # turn 2
    by = {r["frame"]: r for r in log if r["kind"] == "call"}
    starts = [r for r in log if r["kind"] in ("start", "stop")]
    assert [(r["kind"], r.get("mode")) for r in starts] == [
        ("start", 1), ("start", 5), ("stop", None), ("start", 1), ("start", 2), ("start", 1)]
    temple = next(r for r in starts if r.get("mode") == 5)
    assert by[temple["frame"]]["site"] == "ovl01:0006"               # sounds as the menu opens
    assert all(r["wav"][0] == "S" for r in starts if r["kind"] == "start")
    assert m["music"]["records"] == len(log)
    m2, log2 = _script_log(tmp_path, "b")
    assert log2 == log and m2["engine_state_hash"] == m["engine_state_hash"]
    assert m2["music"]["log_sha256"] == m["music"]["log_sha256"]


def test_sound_init_follows_155e_0005(game, tmp_path):
    """155e:0005: sound.dat missing -> "Can't init sound"; NO_SOUND (case-sensitive) clears a
    driver; a missing ADV / MIDPAK.AD / MIDPAK.COM -> its message, then "Can't init sound"."""
    gd = GameDir(game)
    exe = gd.read("WARLORD2.EXE")
    from warlords2.assets.exe import ds_str
    cant, adv, ad, com = (ds_str(exe, o) for o in (AS.CANT_INIT, AS.NO_ADV, AS.NO_AD, AS.NO_MIDPAK))
    have = {"SBLASTER.COM", "SBFM.ADV", "MIDPAK.AD", "MIDPAK.COM"}
    app = SimpleNamespace(gd=SimpleNamespace(path=lambda rel: tmp_path / rel.upper(), read=gd.read),
                          cfg=SimpleNamespace(music="on"))

    def files(sound, present):
        for f in tmp_path.iterdir():
            f.unlink()
        if sound is not None:
            (tmp_path / "SOUND.DAT").write_bytes(sound)
        for n in present:
            (tmp_path / n).write_bytes(b"x")

    def error(sound, present=have):
        files(sound, present)
        with pytest.raises(AS.SoundInitError) as e:
            AS.sound_init(app)
        return e.value.lines

    files(b"SBLASTER.COM SBFM.ADV 1\r\n", have)
    assert AS.sound_init(app) is True
    files(b"SBLASTER.COM NO_SOUND 1", {"SBLASTER.COM"})
    assert AS.sound_init(app) is False
    files(b"NO_SOUND NO_SOUND 0", set())
    assert AS.sound_init(app) is False
    assert error(None) == [cant]
    assert error(b"SBLASTER.COM no_sound 1", {"SBLASTER.COM", "MIDPAK.AD", "MIDPAK.COM"}) == [adv, cant]
    assert error(b"SBLASTER.COM SBFM.ADV 1", have - {"MIDPAK.AD"}) == [ad, cant]
    assert error(b"SBLASTER.COM SBFM.ADV 1", have - {"MIDPAK.COM"}) == [com, cant]
    assert error(b"SBLASTER.COM SBFM.ADV 1", have - {"SBLASTER.COM"}) == [cant]
    files(b"IBMBAK.COM SBFM.ADV 1", have - {"SBLASTER.COM"})
    assert AS.sound_init(app) is True                                  # IBMBAK.COM is not loaded
    app.cfg.music = "off"
    files(None, set())
    assert AS.sound_init(app) is False                                 # the stand-in: no check


def test_app_start_ends_on_sound_init_failure(tmp_path, monkeypatch, capsys):
    def fail(app):
        raise AS.SoundInitError(["first\n", "second\n"])
    monkeypatch.setattr(AS, "sound_init", fail)
    with pytest.raises(SystemExit) as e:
        App(parse_args(["--headless", "--no-intro", "--seed", "1", "--user-dir", str(tmp_path / "u")]))
    out = capsys.readouterr().out
    assert e.value.code == 0 and out.startswith("first\nsecond\n") and len(out) > len("first\nsecond\n")


# ------------------------------------------------------------------ sounds at their pop-ups


def _hero(st):
    return next(a for a in st.armies if a.owner == st.current and s8_slot(a) >= 0)


def s8_slot(a):
    return a.hero_slot if a.hero_slot < 0x80 else a.hero_slot - 0x100


@pytest.fixture
def musical(tmp_path):
    a = _app(tmp_path, "--scenario", "ERYTHEA", options=b"101")
    g = _human(a)
    a.music_player.backend.calls.clear()
    yield a, g
    a.close()


def test_medal_plays_8_under_the_popup_and_1_after_it(musical):
    """ovl36:24c9 mode 8 before the pop-up's text rolls, ovl36:2668 mode 1 after it closed."""
    a, g = musical
    st, w = g.state, a.music_words
    st.battle_work.attacker = st.current                                   # DS:41fa human
    army = next(x for x in st.armies if x.owner == st.current)
    ev = [_started(w, 8, 16, 0, 1),
          E.MedalAwarded({"army": army.id, "medals": 1, "gain": "strength", "text_rolls": (0, 0)}),
          _started(w, 1, 10, 3, 1)]
    w.mode = 1                                                             # (the words end as after 2668)
    g.phase.animator.play(ev, st.copy())
    assert g.dialogs.top.dialog_id == "medal" and a.music_player.current.stem == "SINT18"
    a.step([])
    assert g.dialogs.top.dialog_id == "medal" and a.music_player.current.stem == "SINT18"
    g.dialogs.top.close(None)
    a.step([])
    assert a.music_player.current.stem == "SINT9" and not g.dialogs
    assert [c[1] for c in a.music_player.backend.calls if c[0] == "play"] == ["SINT18.wav", "SINT9.wav"]


def test_sage_music_before_its_dialog(musical):
    """ovl34:0aad mode 6 (INT14) after the list ovl34:1610, before the menu."""
    a, g = musical
    st, w = g.state, a.music_words
    hero = _hero(st)
    st.selection.hero = hero.id
    ev = [_started(w, 6, 14, 0, 1), E.SageOffered({"site": 0, "entries": []})]
    seen = []
    real = registry.open_dialog

    def spy(name, *args, **kw):
        if name == "sage":
            seen.append(a.music_player.current.stem if a.music_player.current else None)
        return real(name, *args, **kw)
    import warlords2.ui.registry as REG
    REG.open_dialog = spy
    try:
        g.phase.animator.play(ev, st.copy())
    finally:
        REG.open_dialog = real
    assert seen == ["SINT14"] and g.dialogs.top.dialog_id == "sage"


def test_promotion_plays_mode_7_with_its_popup(musical):
    """ovl47:0726 mode 7 (INT15), then the level-up pop-up."""
    from warlords2.ui.dialogs import level_up as LU
    a, g = musical
    st, w = g.state, a.music_words
    hero = _hero(st)
    ev = [_started(w, 7, 15, 0, 1),
          E.HeroPromoted({"army": hero.id, "slot": s8_slot(hero), "level": 1, "strength": 1, "moves": 1,
                          "group": LU.FIRST_GROUP, "female": 0})]
    g.phase.animator.play(ev, st.copy())
    assert g.dialogs.top.dialog_id == "level_up" and a.music_player.current.stem == "SINT15"
    assert a.music_log.records[-1]["mode"] == 7 and a.music_log.records[-1]["kind"] == "start"


def test_music_polls_under_event_loop_dialogs_only(musical, monkeypatch):
    """08a9:0081 polls under the button pop-ups (the hero offer, Options, Confirm ...), not under
    the message / tick waits or the line editor ovl56:03a6."""
    a, g = musical
    polls = []
    monkeypatch.setattr(a.music_player, "poll", lambda where="idle": polls.append(where))
    a.step([])
    assert polls == ["idle"]
    registry.open_dialog("message", g, lines=["x"])
    a.step([])
    assert polls == ["idle"]
    g.dialogs.top.close(None)
    d = registry.run_action(registry.MENU_ID["new_game"], g)                # Confirm (ovl56:0088)
    assert d.event_loop
    a.step([])
    assert polls == ["idle", "idle"]
    d.close(False)
    a.step([])
    from warlords2.ui.text_input import InputBox
    from warlords2.ui.widgets import kit
    box = InputBox(kit(a), "t", ["l", "m"], "x", 15, 160)
    assert box.event_loop
    box.editor = object()
    assert not box.event_loop


def test_turn_start_dialogs_poll(tmp_path, monkeypatch):
    """The hero offer of the turn start waits in the event loop: polled (S1); its name editor not."""
    a = _app(tmp_path, "--scenario", "ERYTHEA", options=b"101")
    try:
        polls = []
        for _ in range(600):
            g = a.manager.current_state()
            top = g.dialogs.top if getattr(g, "dialogs", None) else None
            if getattr(top, "dialog_id", None) == "hero_offer":
                break
            a.step([UP] if getattr(top, "dialog_id", None) in ("turn_start", "tutorial_page") else [])
        assert g.phase_name == "turn_start" and g.music_idle()
        monkeypatch.setattr(a.music_player, "poll", lambda where="idle": polls.append(where))
        a.step([])
        assert polls == ["idle"]
        top.press(289)                                                     # Rename: ovl56:03a6
        assert g.dialogs.top.dialog_id == "hero_name" and not g.music_idle()
    finally:
        a.close()


def test_refused_command_and_failed_run_take_their_music_calls_back(musical, monkeypatch):
    import warlords2.rules.engine as ENG
    from warlords2.model import commands as C
    from warlords2.states.game import run_snapshot
    a, g = musical
    st, w = g.state, a.music_words
    MU.stop(w)                                         # the next mode-1 call plays and rolls
    n = len(a.music_log.records)

    def refused(state, cmd):
        MU.play(state, 1, "test:refused")
        raise ENG.IllegalCommand("no")
    monkeypatch.setattr(ENG, "apply", refused)
    assert g.command(C.SetSpeech(True)) is None
    assert all(r.get("site") != "test:refused" for r in a.music_log.records)
    monkeypatch.undo()
    MU.stop(w)                                         # (the fake apply put nothing back)
    g.run_start, g.run_log = run_snapshot(st), a.music_log.mark()
    rng = st.rng.state()
    MU.play(st, 1, "test:run")
    assert a.music_log.records[-1]["site"] == "test:run" and st.rng.state() != rng
    g.run_failed(RuntimeError("x"))
    assert st.rng.state() == rng and all(r.get("site") != "test:run" for r in a.music_log.records)
    assert len([r for r in a.music_log.records[n:] if r["kind"] == "call"]) == 0


def test_observer_only_while_an_app_lives(tmp_path):
    before = list(MU.OBSERVERS)                                          # engine-only: none added
    a = _app(tmp_path)
    assert MU.OBSERVERS == before + [a.music_observer]
    a.close()
    assert MU.OBSERVERS == before
