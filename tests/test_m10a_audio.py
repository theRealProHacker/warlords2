"""M10a: effects, speech, captions and sound settings (docs/plan.md section 4, row M10a).

Runs on the SDL dummy audio driver; game text is compared by digest only."""
import hashlib
import os
from fractions import Fraction
from pathlib import Path
from types import SimpleNamespace

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2 import audio as A  # noqa: E402
from warlords2.audio import effects, mixer, settings, voice  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.formats.sound import Pcm, load_8sn  # noqa: E402
from warlords2.formats.tables import parse_voice_text  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.persist.userdir import UserDir  # noqa: E402
from warlords2.ui import registry  # noqa: E402

gamedata = pytest.mark.gamedata


def stub_app(game, tmp_path, no_voice=False, tick_hz=60):
    return SimpleNamespace(gd=GameDir(game), user=UserDir(tmp_path / "u", Path(game)),
                           cfg=SimpleNamespace(no_voice=no_voice, tick_hz=tick_hz))


# ------------------------------------------------------------------------------ mixer


@gamedata
def test_every_sample_plays_at_11000_hz(game):
    m = mixer.Mixer()
    assert m.available
    root = Path(game)
    files = sorted(p for p in (root / "SOUND").iterdir() if p.suffix.upper() == ".8SN")
    files.append(GameDir(game).path("START/DING0.SND"))
    assert len(files) == 37
    for p in files:
        pcm = load_8sn(p.read_bytes())
        s = m.sound(pcm)
        assert s.get_length() == pytest.approx(len(pcm.samples) / 11000, abs=1e-3), p.name
        m.play_now(pcm)
        assert m.busy()
    m.stop()


def test_wav_wraps_the_samples_unchanged():
    pcm = Pcm(samples=bytes(range(256)))
    w = mixer.wav_bytes(pcm)
    assert w[:4] == b"RIFF" and w.endswith(pcm.samples)
    assert int.from_bytes(w[24:28], "little") == 11000
    with pytest.raises(ValueError):
        mixer.wav_bytes(Pcm(samples=b"\0\0", width=2, signed=True))


def test_no_device_is_a_no_op(monkeypatch):
    def fail():
        raise pygame.error("no audio device")
    monkeypatch.setattr(pygame.mixer, "get_init", lambda: None)
    monkeypatch.setattr(pygame.mixer, "init", fail)
    m = mixer.Mixer()
    assert not m.available
    m.play(Pcm(samples=b"\x80"))
    m.play_now(Pcm(samples=b"\x80"))
    m.stop()
    assert not m.busy()


# ------------------------------------------------------------------------------ settings


def test_options_snd_digits():
    s = settings.parse(b"001", digital=True, no_voice=False)
    assert (s.music, s.effects, s.speech) == (False, False, True)
    s = settings.parse(b"111", digital=False, no_voice=True)       # no device, 'v' switch
    assert (s.music, s.effects, s.speech) == (True, False, False)
    assert settings.parse(b"1", digital=True, no_voice=False).digits() == b"100"  # default "000"
    assert settings.parse(b"110", digital=True, no_voice=False).digits() == b"110"


@gamedata
def test_settings_from_game_then_user_dir(game, tmp_path):
    app = stub_app(game, tmp_path)
    shipped = GameDir(game).read("DATA/OPTIONS.SND")
    a = A.audio(app)
    assert a.settings == settings.parse(shipped, digital=True, no_voice=False)
    before = settings.toggle(app, settings.EFFECTS).effects
    assert app.user.path(settings.FILE).read_bytes() == a.settings.digits()
    assert GameDir(game).read("DATA/OPTIONS.SND") == shipped               # game dir untouched
    assert settings.load(app, digital=True).effects == before
    app2 = stub_app(game, tmp_path, no_voice=True)
    assert not A.audio(app2).settings.speech


# ------------------------------------------------------------------------------ captions


@gamedata
def test_captions_match_their_txt_files(game):
    files = sorted(p for p in (Path(game) / "SOUND").iterdir() if p.suffix.upper() == ".TXT")
    assert len(files) == 27
    for p in files:
        data = p.read_bytes()
        lines = voice.caption_lines(data)
        want = parse_voice_text(data)["lines"]
        assert hashlib.sha256("\n".join(lines).encode()).hexdigest() == \
            hashlib.sha256("\n".join(want).encode()).hexdigest(), p.name
        assert 1 <= len(lines) <= voice.CAPTION_LINES


@gamedata
def test_speech_and_caption_files_exist(game, tmp_path):
    a = A.audio(stub_app(game, tmp_path))
    gd = GameDir(game)
    for g in voice.FILES.values():
        assert gd.path(a.path(g, 0)).suffix.upper() == ".8SN" and gd.path(a.path(g, 0)).is_file()
        assert gd.path(a.path(g, 1)).suffix.upper() == ".TXT" and gd.path(a.path(g, 1)).is_file()
    for g in list(range(40, 59)):
        for i in range(a.members(g)):
            assert gd.path(a.path(g, i)).is_file()
            assert gd.path(a.path(g + voice.CAPTION_OFFSET, i)).is_file()
        assert a.members(g) == a.members(g + voice.CAPTION_OFFSET)
    for name, (g, i) in effects.SAMPLES.items():
        assert gd.path(a.path(g, i)).is_file(), name


# ------------------------------------------------------------------------------ face timing


def run(sp, skip_at=()):
    f, eyes = 0, []
    while sp.step(f in skip_at):
        eyes.append((sp.eye, sp.caption))
        f += 1
    return f + 1, eyes


def test_tick_is_the_bios_timer():
    assert float(voice.TICK_HZ) == pytest.approx(18.2065, abs=1e-4)


def test_blink_timeline():
    eyes, end = voice._timeline(Fraction(10), 40)          # first blink after one tick
    assert eyes == [(1, 0), (3, 1), (5, 2), (7, 3)]
    assert end == 1 + 6 + 3 + 6                              # blink, 3 more ticks, 6-tick wait
    eyes, end = voice._timeline(Fraction(5, 2), 11)          # no blink in 3 ticks
    assert eyes == [] and end == 3 + 6
    sp = voice.Speech(60, 40, sample_ticks=Fraction(10))
    n, seen = run(sp)
    assert n == -(-16 * 60 * 65536 // 1193182)                # first frame at or past tick 16
    assert [e for e, _ in seen][-1] == 3 and None in [e for e, _ in seen]


def test_caption_timeline_and_skip():
    sp = voice.Speech(60, 20, captions=["a", "b"])
    n, seen = run(sp)
    per_line = 40 * 60 / float(voice.TICK_HZ)
    assert abs(n - 2 * per_line) <= 2
    assert {c for _, c in seen} == {"a", "b"} and all(e is None for e, _ in seen)
    n2, _ = run(voice.Speech(60, 20, captions=["a", "b"]), skip_at={5})
    assert abs(n2 - (6 + per_line)) <= 2


@gamedata
def test_speak_plays_or_captions(game, tmp_path, monkeypatch):
    app = stub_app(game, tmp_path)
    a = A.audio(app)
    sp = voice.speak(app, 2, 25)
    pcm = a.pcm(a.path(59, 0))
    assert a.mixer.busy() and sp.caption is None
    assert float(sp.end) >= len(pcm.samples) / 11000 * float(voice.TICK_HZ) + 6
    monkeypatch.setattr(a.mixer, "available", False)
    sp = voice.speak(app, 1, 25)
    assert sp.caption == voice.caption_lines(GameDir(game).read(a.path(61, 1)))[0]
    assert voice.speak(app, 3, 25).step() is False             # face only, no speech: gone
    a.mixer.stop()


# ------------------------------------------------------------------------------ turn advice


def advice_state(cities, bucket=0, mode=0, turn=7, gold=500, heroes=1):
    city = SimpleNamespace(owner=0)
    hero = SimpleNamespace(type_id=28, owner=0)
    return SimpleNamespace(current=0, flags={0x100: mode, 0x108: bucket}, turn=turn,
                           cities=[city] * cities, armies=[hero] * heroes,
                           city_counts=[cities] + [0] * 7,          # DS:5dea (ovl58:02b7 reads it)
                           players=[SimpleNamespace(gold=gold)])


class Rolls:
    def __init__(self, *values):
        self.values, self.calls = list(values), []

    def __call__(self, d, s, a):
        self.calls.append((d, s, a))
        return self.values.pop(0)


def test_turn_advice_win_lose_and_remarks():
    members = lambda g: 2 if g in (47, 77, 55, 85) else 4 if g in (58, 88) else 1   # noqa: E731
    s = advice_state(12, bucket=0)
    r = Rolls(0)
    assert voice.turn_advice(s, True, members, r) == (48, 0)     # 12 cities: bucket 10, vwin10
    assert s.flags == {0x100: 1, 0x108: 10} and r.calls == [(1, 1, -1)]
    s = advice_state(7, bucket=10)
    assert voice.turn_advice(s, False, members, Rolls(0)) == (40 + 1 + 30, 0)   # lose, caption
    assert s.flags == {0x100: 2, 0x108: 5}
    assert voice.turn_advice(advice_state(45), True, members, Rolls()) is None
    s = advice_state(12, bucket=10, turn=8)
    assert voice.turn_advice(s, True, members, Rolls()) is None                # not a 7th turn
    assert voice.turn_advice(advice_state(12, 10, gold=50), True, members, Rolls(0)) == (54, 0)
    assert voice.turn_advice(advice_state(12, 10, gold=3000), True, members, Rolls(1)) == (55, 1)
    assert voice.turn_advice(advice_state(12, 10, heroes=0), True, members, Rolls(0)) == (56, 0)
    assert voice.turn_advice(advice_state(12, 10, heroes=5), True, members, Rolls(0)) == (57, 0)
    r = Rolls(1, 3)
    assert voice.turn_advice(advice_state(12, 10), True, members, r) == (58, 3)
    assert r.calls == [(1, 5, 0), (1, 4, -1)]
    assert voice.turn_advice(advice_state(12, 10), True, members, Rolls(2)) is None
    s = advice_state(3, bucket=0, turn=1)
    assert voice.turn_advice(s, True, members, Rolls(0)) is None               # turn 1: no face
    assert s.flags == {0x100: 0, 0x108: 0}                                      # 0 + 5 > 3


# ------------------------------------------------------------------------------ triggers


@gamedata
def test_event_sounds(game, tmp_path, monkeypatch):
    registry.load_all()
    app = stub_app(game, tmp_path)
    a = A.audio(app)
    a.settings.effects = True
    played = []
    monkeypatch.setattr(a.mixer, "play", lambda pcm: played.append(pcm))
    human = SimpleNamespace(control=0)
    computer = SimpleNamespace(control=1)
    state = SimpleNamespace(current=0, players=[human, computer],
                            armies=[SimpleNamespace(owner=0), SimpleNamespace(owner=0xFF)])
    host = SimpleNamespace(app=app, state=state)

    def fire(ev):
        played.clear()
        for fn in registry.event_sounds(type(ev)):
            fn(host, ev)
        return [next(n for n, gi in effects.SAMPLES.items() if a.pcm(a.path(*gi)) is p) for p in played]

    assert fire(E.Duel({"loser": "attacker"})) == ["army"]
    assert fire(E.Duel({"loser": "defender"})) == ["army2"]
    assert fire(E.SiteSearched({"site": 0, "kind": 2, "hero": 5})) == ["dramatic"]
    assert fire(E.SiteSearched({"site": 0, "kind": 3, "hero": 5})) == []           # sage
    assert fire(E.SiteSearched({"site": 0, "gold": 100})) == []
    assert fire(E.SageOffered({})) == ["dramatic"]
    assert fire(E.GuardianFought({})) == ["orch"]
    assert fire(E.BattleStarted({"attacker": 0})) == ["war"]
    assert fire(E.BattleStarted({"attacker": 1})) == []
    assert fire(E.Sunk({"count": 1})) == ["splash"]
    assert fire(E.ItemDropped({"army": 0, "lost": True})) == ["splash"]
    assert fire(E.ItemDropped({"army": 0, "lost": False})) == []
    assert fire(E.Moved({"no_path": True})) == ["chord"]
    assert fire(E.Moved({})) == []
    assert fire(E.TurnStarted({"human": True})) == ["turn"]                  # ovl68:0415 only
    assert fire(E.TurnStarted({"human": False})) == []
    state.current = 1                                                         # computer side
    assert fire(E.ItemDropped({"army": 1, "lost": True})) == ["splash"]     # dead hero
    assert fire(E.ItemDropped({"army": 0, "lost": True})) == []
    assert fire(E.Moved({"no_path": True})) == [] and fire(E.TurnStarted({"human": True})) == ["turn"]
    assert fire(E.Sunk({"count": 2})) == ["splash"]
    a.settings.effects = False
    assert fire(E.Sunk({"count": 2})) == [] and effects.war(app) == 0


@gamedata
def test_waiting_effects_return_their_length(game, tmp_path):
    app = stub_app(game, tmp_path)
    a = A.audio(app)
    a.settings.effects = True
    n = len(GameDir(game).read(a.path(38, 0)))
    assert effects.war(app) == -(-n * 60 // 11000)
    assert effects.splash(app) == 0 and effects.ding0(app) == 0
    a.mixer.stop()
