"""M2c: START.EXE's intro and credits pages (`states.intro`, docs/research/start_exe.md).

* the schedule of `program` on the frame clock, at 60 and 70 Hz, against the waits read from
  the listing (no game data);
* a headless run of the whole intro: digests of the presented frames (8-bit framebuffer +
  DAC) at the key points, with structural checks beside them (no pixels or text stored);
* the skip keys at several points, other keys and the mouse ignored;
* the music log (ANIM once, the cut) and the DING; `--no-intro`; the menu's first frame;
* frames rebuilt here, not from digests: the sparkle steps from SPARKLE.PCK and the raw
  DS:040a / 0488 tables, the credits pages through `ui.gfxpage.render`; the slot rule; Alt+D;
* a game copy without the START files boots to the menu.
Frame numbers are intro frames (0 = the intro's first `step`, app frame `Intro.first`)."""
import hashlib
import math
import os
from fractions import Fraction
from types import SimpleNamespace

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.audio import audio, effects  # noqa: E402
from warlords2.audio.voice import TICK_HZ  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.formats.pal import parse_pal  # noqa: E402
from warlords2.formats.pck import decode_pck  # noqa: E402
from warlords2.states import intro as I  # noqa: E402

gamedata = pytest.mark.gamedata
END = 2637                                    # the intro's last frame at 60 Hz (black)
FIRST = 1                                     # app frame of intro frame 0 (boot takes frame 0)


def schedule(tick_hz):
    io = I.IntroIO()
    io.sparkle_table = ((88, 59),) * 24 + ((-1, -1),) * 7
    io.sparkle_sx = (0,) * 7
    t = I.Timeline(io, tick_hz)
    f = 0
    while t.done is None:
        t.advance(f)
        f += 1
    return t, {label: frame for frame, label in io.log}, io.log


def tick_frame(ticks, hz):
    """First frame at or past BIOS tick `ticks` (frame 0 on a tick edge)."""
    return math.ceil(ticks * Fraction(hz) / TICK_HZ)


@pytest.mark.parametrize("hz", [60, 70])
def test_timeline_follows_the_waits(hz):
    """0579:0000: wipes of 60 ticks (wait(1) after iterations 0, 4, .. 236, 04f8), wait(10),
    wait(20), 35 + 5 lettering steps of delay(20) (first frame >= 20 ms on), DING, 31 sparkle
    steps of wait(1), wait(20), 7 pages of wait(60) + wait(5), the last wipe, palette 2."""
    t, at, log = schedule(hz)
    f = lambda ticks: tick_frame(ticks, hz)
    assert at["music"] == at["wipe ssg"] == 0 and [lb for _, lb in log[:3]] == ["music", "palette 2", "palette 0"]
    assert at["wiped ssg"] == f(60) and at["wipe black"] == f(70) and at["wiped black"] == f(130)
    assert [(fr, lb) for fr, lb in log if lb.startswith("palette")][2:4] == [(f(130), "palette 2"), (f(130), "palette 1")]
    assert at["wiped start"] == f(190)
    step = math.ceil(Fraction(I.DELAY_MS * hz, 1000))
    letters = [fr for fr, lb in log if lb.startswith("letter")]
    assert letters == [f(210) + step * k for k in range(40)]
    assert [lb for _, lb in log if lb.startswith("letter")][34:36] == ["letter 1 210", "letter 2 6"]
    ding = f(210) + 40 * step
    assert at["ding"] == ding == at["sparkle 0"]
    t0 = int(ding * Fraction(TICK_HZ) / hz)
    assert [fr for fr, lb in log if lb.startswith("sparkle ")] == [ding] + [f(t0 + k) for k in range(1, 31)]
    assert at["sparkles done"] == f(t0 + 31)
    base = t0 + 31 + 20
    for n in range(7):
        assert at[f"page {n}"] == f(base + 65 * n) and at[f"erased {n}"] == f(base + 65 * n + 60)
    assert at["wipe end"] == f(base + 7 * 65)
    assert at["end"] == at["exit"] == t.done == f(base + 7 * 65 + 60) and log[-3:][0][1] == "palette 2"
    assert t.done == {60: END, 70: 3061}[hz] and not t.skipped


def test_skip_bytes_and_polls():
    """0579:0438 reads one byte per check: a skip byte behind another byte needs a second
    check; the polls in wait() read them all.  Only 0x20 / 0x1b / 0x0d skip."""
    assert I.SKIP == {0x20, 0x1B, 0x0D}
    assert I.key_bytes(0x0D) == (0x0D,) and I.key_bytes(0x120) == (0, 0x20)
    for byte, skips in ((0x20, True), (0x1B, True), (0x0D, True), (0x61, False), (0x0A, False), (0, False)):
        io = I.IntroIO()
        io.typed.append(byte)
        try:
            io.key_check()
            assert not skips and not io.typed
        except I.Skipped:
            assert skips
    io = I.IntroIO()
    io.typed.extend((0x61, 0x20))
    io.key_check()
    with pytest.raises(I.Skipped):
        io.poll()


@pytest.mark.parametrize("frame, want", [(0, 0), (100, 100), (230, 230), (694, 695), (2000, 2000)])
def test_timeline_skip_frame(frame, want):
    """A skip byte typed at `frame` ends the intro there, except inside delay(20) (no poll):
    at the next lettering step's key_check."""
    io = I.IntroIO()
    io.sparkle_table, io.sparkle_sx = ((88, 59),) * 31, (0,) * 7
    t = I.Timeline(io, 60)
    f = 0
    while t.done is None:
        if f == frame:
            io.typed.append(0x20)
        t.advance(f)
        f += 1
    assert t.skipped and t.done == want and io.log[-2:] == [(want, "palette 2"), (want, "skip")]


def test_wait_polls_on_entry():
    """0579:04bb jumps to 04dc, whose test loops to 04bd's key_check before the first time
    read: 'a', Space typed during the last lettering delay -> the sparkle step's check reads
    'a' at 773, the poll as its wait(1) begins reads Space at once."""
    io = I.IntroIO()
    io.sparkle_table, io.sparkle_sx = ((88, 59),) * 31, (0,) * 7
    t = I.Timeline(io, 60)
    f = 0
    while t.done is None:
        if f == 772:
            io.typed.extend((0x61, 0x20))
        t.advance(f)
        f += 1
    assert t.skipped and t.done == 773


# --------------------------------------------------------------------------- the real run


def fb_digest(a):
    s = a.screen
    return hashlib.sha1(pygame.image.tobytes(s.fb, "P") + bytes(c for rgb in s.dac for c in rgb)).hexdigest()


def make(game, tmp_path, *more):
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1",
                           "--user-dir", str(tmp_path / "u"), *more]))


def key(k, uni=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=uni, mod=0, scancode=0)


def run(a, until, events=None, dacs=None):
    """Step `a`; returns {intro frame: digest} of each presented frame while the intro or the
    first menu frame shows (`dacs` gets each frame's DAC).  `events` maps intro frames to
    event lists."""
    out = {}
    while True:
        f = a.frame - FIRST                   # the intro frame this step makes (boot is frame 0)
        a.step((events or {}).get(f, []))
        if f < 0:
            continue
        assert a.manager["intro"].first == FIRST
        out[f] = fb_digest(a)
        if dacs is not None:
            dacs[f] = a.screen.dac
        if until(a, f):
            return out


_, AT, _ = schedule(60)
SPARKLE_AT = {i: AT[f"sparkle {i}"] for i in range(31)}
PAGE_AT = {n: AT[f"page {n}"] for n in range(7)}
KEEP = {198, 771, END, *SPARKLE_AT.values(), *PAGE_AT.values(), *(f - 1 for f in PAGE_AT.values())}


@pytest.fixture(scope="module")
def full(game, tmp_path_factory):
    a = make(game, tmp_path_factory.mktemp("full"))
    keep = {}

    def until(a, f):
        if f in KEEP:
            keep[f] = (pygame.image.tobytes(a.screen.fb, "P"), a.screen.dac)
        return a.manager.current_state_str() == "menu"
    hashes = run(a, until)
    st = a.manager["intro"]
    yield SimpleNamespace(app=a, hashes=hashes, kept=keep, log=list(st.log), first=st.first,
                          music=list(a.music_log.records))
    a.close()


# intro frame -> digest: mid SSG wipe, SSG done, mid BLACK wipe, START done, lettering phase 1
# half way (s = 108), at rest, 7 sparkles (step 10), each page shown, the first gap, black
DIGESTS = {
    99: "71dd6cafd37d76c15d1bf1f37e717c013aed0acc",
    198: "619e608a8f885f3ccd66aba2bc8ff1d3f3b56004",
    330: "7e3723ad748773ccd2bf627de9600f82b9382590",
    627: "38898dc9410cde5c63784ec9a2d4a3c0835798d1",
    727: "9abd69d0b1f33dcb02148e95c9b698376f3d4378",
    771: "7442c011b7a773a6cdca8eafb20d658d80749735",
    805: "452710fbaece44a899370d6ea63570a14fe53a29",
    941: "04e774d00cad43ef63c74ce25487ba711d672c74",
    1155: "81bd116bcf4809a5ced908e9febc8b7a89603e9a",
    1369: "93f953ded0737783b7d449cd60922e7808e9e465",
    1583: "652ba76c565e9c1140dad1b707a9f3d599c9388a",
    1798: "d00b5c38727140b3c4ef9743d26169c0c215f514",
    2012: "1654ba586d662417a27aafe8d0035ef5a1fdbcdb",
    2226: "9da57e35201191c085063c4e2c0affa57b3d9cc8",
    1140: "7442c011b7a773a6cdca8eafb20d658d80749735",
    END: "ef9278222c428fa9d8a12705fe006e1b8a631cf1",
}


@gamedata
def test_frames(full, game):
    from warlords2.formats.gamedir import GameDir
    gd = GameDir(game)
    assert full.first == 1 and max(full.hashes) == END + 1     # boot frame 0, the menu after END
    assert {f: full.hashes[f] for f in DIGESTS} == DIGESTS
    assert full.hashes[1140] == full.hashes[771] == full.hashes[940 - 1]     # a gap: the clean rest frame
    assert len({full.hashes[f] for f in DIGESTS}) == len(DIGESTS) - 1
    ssg = decode_pck(gd.read("START/SSG.PCK"))
    fb, dac = full.kept[198]
    assert fb == b"".join(ssg.rows) and dac == parse_pal(gd.read("START/LOGO.PAL"))
    start, text = decode_pck(gd.read("START/START.PCK")), decode_pck(gd.read("START/STEXT.PCK"))
    want = bytearray(b"".join(start.rows))
    for y in range(210):
        for x in range(480):
            c = text.rows[y][x]
            if c != I.KEY:
                want[(30 + y) * 640 + 80 + x] = c
    fb, dac = full.kept[771]
    assert fb == bytes(want) and dac == parse_pal(gd.read("START/SCREEN0.PAL"))
    fb, dac = full.kept[END]
    assert set(dac) == {(0, 0, 0)} and set(fb) == {0}


@gamedata
def test_music_and_ding(full):
    """ANIM (S prefix: --music-variant opl) starts at intro frame 0, once, no loop, and is cut
    at the end; the DING at the end of the lettering; the menu's own call follows."""
    first = full.first
    intro = [r for r in full.music if r.get("via") == "intro" or r.get("why") in ("end", "skip")]
    assert intro == [
        {"kind": "start", "frame": first, "mode": None, "group": None, "index": None, "wav": "SANIM.wav",
         "loop": 0, "site": "0579:002d", "via": "intro"},
        {"kind": "stop", "frame": first + END, "wav": "SANIM.wav", "why": "end"}]
    assert full.music.index(intro[1]) == 1 and full.music[2]["site"] == "ovl60:00fb"
    assert [f for f, lb in full.log if lb == "ding"] == [773]


@gamedata
def test_menu_follows_and_looks_as_without_intro(full, game, tmp_path):
    a = full.app
    assert a.manager.current_state_str() == "menu" and a.screen.dac == a.assets.palette("STANDARD.PAL")
    b = make(game, tmp_path, "--no-intro")
    try:
        b.step([])
        assert b.manager.current_state_str() == "menu" and b.frame == 1   # boot -> menu, row 225
        assert fb_digest(b) == full.hashes[END + 1]
    finally:
        b.close()


SKIPS = [("space", pygame.K_SPACE, " ", 300), ("escape", pygame.K_ESCAPE, "\x1b", 99),
         ("return", pygame.K_RETURN, "\r", 1500), ("kp enter", pygame.K_KP_ENTER, "\r", 805),
         ("space", pygame.K_SPACE, " ", 0), ("space", pygame.K_SPACE, " ", 694)]


@gamedata
@pytest.mark.parametrize("name, k, uni, at", SKIPS, ids=lambda v: str(v))
def test_skip_keys(game, tmp_path, name, k, uni, at):
    """Space / Esc / Return (keypad Enter: also 0x0d) end the whole intro: that frame black
    (palette 2, 0579:0457), the music cut, the Game Start screen on the next frame.  Inside
    the lettering's delay(20) the key waits for the next step (694 -> 695)."""
    a = make(game, tmp_path)
    try:
        dacs = {}
        hashes = run(a, lambda a, f: a.manager.current_state_str() == "menu", {at: [key(k, uni)]}, dacs)
        st = a.manager["intro"]
        done = st.timeline.done
        assert done == (at + 1 if at == 694 else at) and st.timeline.skipped and max(hashes) == done + 1
        assert st.log[-1] == (done, "skip")
        assert dacs[done] == [(0, 0, 0)] * 16 and (done == 0 or dacs[done - 1] != dacs[done])
        assert dacs[done + 1] == a.assets.palette("STANDARD.PAL")
        stops = [r for r in a.music_log.records if r["kind"] == "stop"]
        assert stops == [{"kind": "stop", "frame": st.first + done, "wav": "SANIM.wav", "why": "skip"}]
    finally:
        a.close()


@gamedata
def test_other_keys_and_mouse_do_nothing(full, game, tmp_path):
    a = make(game, tmp_path)
    try:
        down = pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(640, 480))
        up = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(640, 480))
        ev = {100: [key(pygame.K_a, "a")], 230: [down, up], 700: [key(pygame.K_F1)], 800: [key(pygame.K_TAB, "\t")]}
        hashes = run(a, lambda a, f: f == 950, ev)
        assert a.manager.current_state_str() == "intro" and a.manager["intro"].timeline.done is None
        assert hashes == {f: full.hashes[f] for f in hashes}
    finally:
        a.close()


@gamedata
@pytest.mark.parametrize("extra, wav", [(("--music-variant", "gm"), "RANIM.wav"), (("--music", "off"), None)])
def test_music_variant_and_off(game, tmp_path, extra, wav):
    a = make(game, tmp_path, *extra)
    try:
        a.step([])
        a.step([])
        got = [r["wav"] for r in a.music_log.records if r.get("via") == "intro"]
        assert got == ([wav] if wav else [])
    finally:
        a.close()


@gamedata
def test_ding0_ignores_the_effects_setting(game, tmp_path, monkeypatch):
    """START.EXE reads no OPTIONS.SND (D4): DING0 plays with effects off, not in a scripted /
    headless run (`fixed_dt`)."""
    from warlords2.formats.gamedir import GameDir
    from warlords2.persist.userdir import UserDir
    from pathlib import Path
    played = []
    for fixed in (False, True):
        app = SimpleNamespace(gd=GameDir(game), user=UserDir(tmp_path / f"u{fixed}", Path(game)),
                              cfg=SimpleNamespace(no_voice=True, tick_hz=60, fixed_dt=fixed))
        a = audio(app)
        a.settings.effects = False
        if not a.mixer.available:
            pytest.skip("no mixer")
        monkeypatch.setattr(a.mixer, "play", lambda pcm: played.append((fixed, pcm.rate)))
        assert effects.ding0(app) == 0
    assert played == [(False, 11000)]


# --------------------------------------------------------------------------- structure, not digests


def ds_raw(exe, off, fmt):
    """DS:off of START.EXE read straight from the file: DGROUP 0x109e (0000:0000) above the
    MZ header (header paragraphs at byte 8)."""
    import struct
    base = struct.unpack_from("<H", exe, 8)[0] * 16 + 0x109E * 16
    return struct.unpack_from(fmt, exe, base + off)


def ds_name(exe, off):
    import struct
    base = struct.unpack_from("<H", exe, 8)[0] * 16 + 0x109E * 16 + off
    return exe[base:exe.index(b"\0", base)].decode("cp437")


class Blits(I.IntroIO):
    """Records each sparkle's masked blit per step: (cell x, x, y) in drawing order."""

    def __init__(self):
        super().__init__()
        self.steps, self.cur = [], []

    def mblit(self, src, sx, sy, w, h, dst, dx, dy):
        if src == "sparkle":
            self.cur.append((sx, dx, dy))

    def load(self, key):
        return key

    def mark(self, label):
        super().mark(label)
        if label.startswith("sparkle "):
            self.steps.append(self.cur)
            self.cur = []


def test_sparkle_slots_lowest_free_and_freed_after_seven():
    """0579:065b..0739: a new sparkle takes the lowest free of the 20 slots; slots are drawn
    in slot order, cell x = DS:0488[age]; a slot is freed after drawing age 6.  Entry 7 reuses
    slot 0 (freed at step 6) and so is drawn before entries 1..6."""
    io = Blits()
    io.sparkle_sx = (96, 64, 32, 0, 32, 64, 96)
    io.sparkle_table = tuple((80 + j, 30) for j in range(24)) + ((-1, -1),) * 7
    t = I.Timeline(io, 60)
    f = 0
    while t.done is None:
        t.advance(f)
        f += 1
    steps = [[(sx, x) for sx, x, y in s] for s in io.steps]
    assert len(steps) == 31
    assert steps[0] == [(96, 0)] and steps[1] == [(64, 0), (96, 1)]
    assert steps[6] == [(96, 0), (64, 1), (32, 2), (0, 3), (32, 4), (64, 5), (96, 6)]
    assert steps[7] == [(96, 7), (96, 1), (64, 2), (32, 3), (0, 4), (32, 5), (64, 6)]   # entry 0 gone
    assert steps[8][:2] == [(64, 7), (96, 8)]                                # slot 1 freed, reused
    assert steps[29] == [(96, 23)] and steps[30] == []                       # the sentinels add none


@gamedata
def test_start_tables_read_raw(game):
    """DS:0486 = 31 entries at DS:040a: 24 positions, 7 times (-1, -1); every 32x41 cell at
    (px - 80, py - 30) lies inside the 480x210 work area; DS:0488 the 7 cell offsets."""
    from warlords2.formats.gamedir import GameDir
    exe = GameDir(game).read("START.EXE")
    n, = ds_raw(exe, 0x486, "<h")
    xy = ds_raw(exe, 0x40A, f"<{2 * n}h")
    pairs = list(zip(xy[::2], xy[1::2]))
    assert n == 31 and pairs[24:] == [(-1, -1)] * 7
    assert all(0 <= px - 80 <= 480 - 32 and 0 <= py - 30 <= 210 - 41 for px, py in pairs[:24])
    assert ds_raw(exe, 0x488, "<7h") == (96, 64, 32, 0, 32, 64, 96)
    assert I.start_tables(exe) == (tuple(pairs), (96, 64, 32, 0, 32, 64, 96))


def sparkle_frame(rest, cells, pairs, step):
    """The screen after sparkle step `step`, computed here: the saved rest area, then the live
    slots (lowest free of 20, freed after age 6) drawn in slot order keyed on 13."""
    slots = [None] * 20
    work = None
    for i in range(step + 1):
        px, py = pairs[i]
        if px >= 0 and py >= 0:
            slots[slots.index(None)] = [px - 80, py - 30, 0]
        work = bytearray(rest)
        for k, v in enumerate(slots):
            if v is None:
                continue
            cx = (96, 64, 32, 0, 32, 64, 96)[v[2]]
            for y in range(41):
                for x in range(32):
                    c = cells.rows[y][cx + x]
                    if c != 13:
                        work[(30 + v[1] + y) * 640 + 80 + v[0] + x] = c
            v[2] += 1
            if v[2] == 7:
                slots[k] = None
    return bytes(work)


@gamedata
@pytest.mark.parametrize("step", [0, 6, 7, 10, 23, 30])
def test_sparkle_frames_from_the_cells(full, game, step):
    from warlords2.formats.gamedir import GameDir
    gd = GameDir(game)
    exe = gd.read("START.EXE")
    xy = ds_raw(exe, 0x40A, "<62h")
    pairs = list(zip(xy[::2], xy[1::2]))
    cells = decode_pck(gd.read("START/SPARKLE.PCK"))
    rest, _ = full.kept[771]
    f = SPARKLE_AT[step]
    fb, dac = full.kept[f]
    assert dac == parse_pal(gd.read("START/SCREEN0.PAL"))
    assert fb == sparkle_frame(rest, cells, pairs, step)


@gamedata
@pytest.mark.parametrize("n", [0, 3, 6])
def test_credits_page_is_gfxpage_over_the_rest_frame(full, game, n):
    """Page n (0579:0399.., file name DS:PAGES[n]) = `ui.gfxpage.render` at (80, 260) over the
    clean rest frame."""
    from warlords2.formats.gamedir import GameDir
    from warlords2.ui.gfxpage import render
    from warlords2.ui.screen import IDENTITY
    from warlords2.ui.widgets import kit
    gd = GameDir(game)
    name = ds_name(gd.read("START.EXE"), I.PAGES[n])
    rest, _ = full.kept[771]
    s = pygame.image.frombytes(rest, (640, 480), "P")
    s.set_palette(IDENTITY)
    render(s, gd.read(name), (80, 260), kit(full.app).fonts, None)
    want = pygame.image.tobytes(s, "P")
    assert want != rest and full.kept[PAGE_AT[n]][0] == want
    assert full.kept[PAGE_AT[n] - 1][0] == rest                              # erased before


@gamedata
@pytest.mark.parametrize("letter, skips", [(pygame.K_d, True), (pygame.K_a, False)])
def test_alt_d_skips(game, tmp_path, letter, skips):
    """Alt+D gives getch 0 then 0x20 (scan code of D): the second byte skips.  Alt+A
    (0, 0x1e) does not.  Both bytes are read by the poll of the wipe's wait at once."""
    a = make(game, tmp_path)
    try:
        alt = pygame.event.Event(pygame.KEYDOWN, key=pygame.K_LALT, unicode="", mod=0, scancode=0)
        run(a, lambda a, f: a.manager.current_state_str() == "menu" or f == 320, {300: [alt, key(letter)]})
        st = a.manager["intro"]
        assert (st.timeline.done, st.timeline.skipped) == ((300, True) if skips else (None, False))
    finally:
        a.close()


def _copy_without(game, dst, drop):
    """A game directory of symlinks to `game`, without the entries of `drop` (upper case
    paths relative to the root; a directory in `drop` keys its own entries)."""
    from pathlib import Path

    def link(src, out, rel):
        out.mkdir()
        for e in sorted(src.iterdir()):
            r = f"{rel}{e.name.upper()}"
            if r in drop:
                continue
            if e.is_dir() and any(d.startswith(r + "/") for d in drop):
                link(e, out / e.name, r + "/")
            else:
                (out / e.name).symlink_to(e)
    link(Path(game), dst, "")
    return dst


@gamedata
@pytest.mark.parametrize("drop", [{"START.EXE"}, {"START"}, {"START/SSG.PCK"}, {"START/TESTING2.GFX"}],
                         ids=lambda d: "-".join(sorted(d)))
def test_missing_start_files_boot_to_the_menu(game, tmp_path, drop):
    """No START.EXE or a START file it names: boot goes on to the menu (WAR2.BAT would go on
    to WARLORD2.EXE), as with --no-intro."""
    d = _copy_without(game, tmp_path / "g", drop)
    a = make(str(d), tmp_path)
    try:
        a.step([])
        assert a.manager.current_state_str() == "menu" and a.frame == 1
    finally:
        a.close()
    b = make(game, tmp_path / "full")
    try:
        assert b.manager["intro"].playable()
    finally:
        b.close()
