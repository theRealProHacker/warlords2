"""The random-map generator of WARLORD2.EXE (M11): ovl57:10e8's dice, ovl02:0000 and the
pipeline ovl02:011c over the stages ovl09 / 03 / 04 / 07 / 06 / 05 / 08 / 11 / 12 / 09.

Layout (one module per overlay group; the core is this file and `buffer`):

* `random_begin(read, rng, run)` = ovl57:10e8 steps 1-4: the map id (6 dice, DS:5da8), the
  slider arguments (Q1: DS:28d0 only, register X54), then `generate`.  A generator yielding
  the progress percentages of ovl02:01ff; its return value is `Generated`.  `finish(gen)`
  drains one and returns that value.
* `generate(read, rng, run, args)` = ovl02:0000: RANDOM.DAT read whole into a fresh `Buffer`,
  the slider adds, then `pipeline(work)` = ovl02:011c.  Returns the `Work`.
* Stages are functions `stage(work)` of the modules R1-R3 own; each returns None or an
  iterator of the percentages it passes to ovl02:01ff itself (ovl11:003a 70 + k, ovl12
  81..89, ovl09:0014 92..98), which the pipeline yields in place.  A module or function that
  does not exist yet raises NotImplementedError naming the address and package.
* Shared helpers of the core: ovl02:036b `clear_grid`, 0470 `clamp`, 04ae `jitter`; the
  grid test ovl03:11f5 / 117d is `Buffer.nb8`.
* `RandomRun`: the run memory the generator and the Game Start panel share (DS:02d4, the
  Game Start words DS:28c8..28d8), kept by the host for the whole run.
* `PathRun`: the pathfinder's run memory (resident 0555) the road builder searches with.
* `tries(site)`: the loop guard for the EXE's unbounded retries (register X59).
* C helpers of several stages: `sprintf` (0000:4944), `ExeText` (WARLORD2.EXE's DGROUP
  strings).

Screen-only work is not modelled here: the progress frame ovl02:01b5, the bar ovl02:01ff
(its percentages are yielded), the dead 2 x 2 preview ovl02:03aa / 0449 (DS:26c2, no writer).

What the host (package G) passes and takes around a random Begin:

* pass `pathfinder=`: the run's pathfinder memory as the previous game of this run left it,
  `PathRun(path_cache=, dist_table=, cost_map=)` from that game's run part (rules.saveload
  RUN_FIELDS of the same names); None when no game ran in this run (fresh run: 0555:02f2
  allocates and clears the cache at the first 0d9e, 0555:0da6..0dae).  The EXE never clears
  DS:3f7e between a game and a generation (0350 runs only from 02f2 and the load ovl29:0e51).
* take `Generated.work.pathfinder` (always set after a generation): its `path_cache` and
  `dist_table` are the run memory the following Begin's game starts with (BEGIN_FIELDS
  path_cache / dist_table; the Begin's first 0555 call is ovl29:0402, a 0d9e without 0350).
  `cost_map`, `side`, `road_mode` need not be carried: ovl29:0402's 0d9e rebuilds them
  (DS:00e0 := 0, side SCN 0x110).
* pass `map_words=` / `roads=`: the 1e1d / 19d9 images as the run left them (register X62).
* optionally `army_file=` (the ARMYTYPE bytes ovl44:1128 cached for the run, DS:0e88, when a
  game already loaded them) and `army_set=` (DS:26c4, the `s` switch); default: read on first
  use with FILE.DAT (21, army_set) and the template's SCN 0x161.
"""
from __future__ import annotations

import importlib
import re
import struct
from collections.abc import Callable, Iterator, Sequence
from dataclasses import dataclass, field
from typing import TYPE_CHECKING, Any

from ...formats.gamedir import EXE_NAME
from ...model.state import cleared_path_cache
from ..constants import randmap as K
from .buffer import Buffer, MapWords, Region, Roads, s16

if TYPE_CHECKING:
    from .cities import ArmyTable

# --------------------------------------------------------------------------- run memory


@dataclass
class RandomRun:
    """Run memory of the random-map feature: DGROUP words that live as long as the program and
    are never reset by a game, a load or a Begin (M11 G4).

    * `rotor` DS:02d4: the site-zone rotor of ovl11:0a77 (image -1: the first site of the run's
      first random map rolls rnd(1, 16, -1); then + 1 mod 16 per site).
    * `random` DS:28c8: the Game Start random-map flag (button 102, ovl60:05f5).
    * `terrain_set` DS:28ca: the terrain-set index (button 104, ovl60:063a).
    * `allies` DS:28cc: cities may produce allies (button 105, ovl60:0661; read by ovl11:10ef
      and ovl11:174c, and by ovl60).
    * `sliders` DS:28d0[4]: the four slider values 0..6 (106..109, ovl60:0512).
    * `shown` DS:28d8[4]: 1 = the value shows, 0 = the "?" shows (110..113, ovl60:0571); read
      only by ovl60, never by the generator (Q1, register X54)."""
    rotor: int = K.ROTOR_IMAGE.value
    random: int = K.GAME_START_IMAGE.value["random"]
    terrain_set: int = K.GAME_START_IMAGE.value["terrain_set"]
    allies: int = K.GAME_START_IMAGE.value["allies"]
    sliders: list[int] = field(default_factory=lambda: list(K.GAME_START_IMAGE.value["sliders"]))
    shown: list[int] = field(default_factory=lambda: list(K.GAME_START_IMAGE.value["shown"]))


# --------------------------------------------------------------------------- errors, guards


class RandomDataMissing(FileNotFoundError):
    """RANDOM\\RANDOM.DAT could not be opened: the EXE prints DS:0274 and exits (0a4c:02b5)."""


class GeneratorHang(RuntimeError):
    """One of the EXE's unbounded retry loops (city placement ovl11:0331, ridge / forest / marsh
    seeds, signs ovl09:113d) found no square in `K.HANG_TRIES` tries: the original would loop for
    ever there.  Raised instead (register X59, as `rules.movement.MoveLoopHang`); the generation
    is lost, the caller decides what to show.  `site` names the loop's address."""

    def __init__(self, site: str):
        super().__init__("%s retries without end (the EXE would hang here)" % site)
        self.site = site


def tries(site: str) -> Iterator[int]:
    """The counter of an unbounded retry loop of the EXE: yields 0, 1, ... and raises
    `GeneratorHang(site)` after `K.HANG_TRIES` values.  Use as `for _ in tries("ovl11:0331"):`
    with a `break` where the EXE's loop ends.
    Evidence: register X59 (user decision U6 via the coordinator, precedent MoveLoopHang)."""
    for n in range(K.HANG_TRIES.value):
        yield n
    raise GeneratorHang(site)


# --------------------------------------------------------------------------- C helpers


_CONV = re.compile(rb"%(%|[-+ #0]*\d*(?:\.\d+)?l?[dsu])")


def sprintf(fmt: bytes, *args) -> bytes:
    """Borland sprintf with the conversions the generator's formats use: %s, %d and %u with
    flags, width, precision and 'l', %%; `bytes` in and out, one byte per character; an int
    argument is a 16-bit word (%d signed, %u unsigned; %ld / %lu 32-bit).
    Evidence: C library 0000:4944 (ANSI conversions); the formats of ovl11 (DS:02e0..0361,
    RANDOM.DAT +0xed4 templates), ovl09:113d (+0x1888, +0x189c) and ovl09:1001 (DS:02ba)."""
    it = iter(args)

    def conv(m: re.Match) -> bytes:
        spec = m.group(1)
        if spec == b"%":
            return b"%"
        v = next(it)
        long = b"l" in spec
        spec = spec.replace(b"l", b"").decode("latin-1")
        if spec.endswith("s"):
            return (("%" + spec) % bytes(v).decode("latin-1")).encode("latin-1")
        if spec.endswith("u"):
            v = int(v) & (0xFFFFFFFF if long else 0xFFFF)
        else:
            v = int(v)
            v = ((v + 0x80000000) & 0xFFFFFFFF) - 0x80000000 if long else s16(v)
        return (("%" + spec[:-1] + "d") % v).encode("latin-1")

    return _CONV.sub(conv, fmt)


class ExeText:
    """WARLORD2.EXE's DGROUP strings the generator reads (format strings, the template name,
    the direction words), never held in this source: read from the EXE through `read` on first
    use (DS = load segment 0x3125, file offset = MZ header paragraphs * 16 + 0x3125 * 16 + off)
    and kept in `strings` {DS offset: bytes}, which a host or a test may fill first.
    Evidence: EL §1 (DGROUP 0x3125); the rule of `warlords2.assets.exe.ds_str`."""

    def __init__(self, read: Callable[[str], bytes], strings: dict[int, bytes] | None = None):
        self.read = read
        self.strings: dict[int, bytes] = dict(strings or {})
        self._exe: bytes | None = None

    def _image(self) -> tuple[bytes, int]:
        if self._exe is None:
            self._exe = bytes(self.read(EXE_NAME))
        base = struct.unpack_from("<H", self._exe, 8)[0] * 16
        return self._exe, base

    def cstr(self, off: int) -> bytes:
        """The NUL-ended string at DS:off.
        Evidence: EL §1 (DS:OOOO addressing)."""
        s = self.strings.get(off)
        if s is None:
            exe, base = self._image()
            p = base + K.DGROUP.value * 16 + off
            s = self.strings[off] = bytes(exe[p:exe.index(b"\0", p)])
        return s

    def far_cstr(self, off: int) -> bytes:
        """The string the far pointer at DS:off points to (offset word, then segment).
        Evidence: asm ovl09:1393 `push dword [bx + 0x2b7c]` (sprintf %s of a far pointer)."""
        exe, base = self._image()
        o, seg = struct.unpack_from("<HH", exe, base + K.DGROUP.value * 16 + off)
        p = base + seg * 16 + o
        return bytes(exe[p:exe.index(b"\0", p)])


# --------------------------------------------------------------------------- the work


@dataclass
class PathRun:
    """The pathfinder's run memory (resident 0555): `path_cache` DS:3f7e (20 `PathSlot`s),
    `dist_table` the search field DS:3f86 ([] = never written), `cost_map` DS:3f82 ([] = never
    built), `side` DS:3f6c and `road_mode` DS:00e0 as the last 0555:0d9e left them.  A fresh
    one is a fresh run's: the cache as 0555:02f2 / 0350 clear it at the first 0d9e.
    Evidence: asm 0555:0da6..0dae (DS:00de == 0 -> 02f2 -> 034b 0350); EL §10.7."""
    path_cache: list = field(default_factory=cleared_path_cache)
    dist_table: list = field(default_factory=list)
    cost_map: list = field(default_factory=list)
    side: int = 0
    road_mode: bool = False


@dataclass
class Work:
    """Everything the stages read and write.

    * `buf`: the RANDOM.DAT work buffer DS:3f8a (fresh from the file at every generation).
    * `rng`: the run's one dice stream (ovl59:02bf).
    * `run`: the `RandomRun` words (DS:02d4 rotor, DS:28ca terrain set, DS:28cc allies).
    * `read(rel)`: bytes of a game-directory file ('/'-separated relative path) for the files
      the generator reads (WARLORD2.EXE, ERYTHEA.SCN, SCENARIO.DAT, FILE.DAT, ARMYTYPE).
    * `scn`: the SCN image 2c04:0000 (set whole by ovl09:1001).
    * `map`: the map words 1e1d:0000, `roads`: the road layer 19d9:0000, both as the run left
      them (only some bits are rewritten: ovl02:036b keeps road bits 0xe0, ovl09:005c writes low
      bytes; register X62).
    * `files`: the files written, in order, by extension ("SGN", "MAP", "RD", "CTY", "SPC",
      "SCN"; `K.FILES`).
    * `pathfinder`: the pathfinder's run memory the road searches of ovl12 use and leave
      (`PathRun`; None = a fresh run's, made by `roads.pathfinder` at the first search).
    * `army_file`: the ARMYTYPE file bytes (29 records of 0x3e) ovl44:1128 reads once per run
      (cache DS:0e88); None = read on first use: FILE.DAT (21, `army_set`) % SCN 0x161.
    * `army_set`: DS:26c4, the `s` switch (0 ARMYTYPE.DAT, 1 ARMYTYP2.DAT; the two shipped
      files differ only in the names, which ovl11 never reads).
    * `army`: the records and the ovl48:0000 flag table DS:45c4 made from `army_file`
      (`cities.ArmyTable`; None = not made yet).
    * `exe_text`: the EXE's DGROUP strings (`ExeText` over `read`)."""
    buf: Buffer
    rng: Any
    run: RandomRun
    read: Callable[[str], bytes]
    scn: Region = field(default_factory=lambda: Region(K.SCN_SIZE.value, name="SCN"))
    map: MapWords = field(default_factory=MapWords)
    roads: Roads = field(default_factory=Roads)
    files: dict[str, bytes] = field(default_factory=dict)
    pathfinder: PathRun | None = None
    army_file: bytes | None = None
    army_set: int = 0
    army: ArmyTable | None = None
    exe_text: ExeText | None = None

    def __post_init__(self):
        if self.exe_text is None:
            self.exe_text = ExeText(self.read)


@dataclass
class Generated:
    """The result of a random Begin's generation: `id` the 6-character map id (DS:5da8, the
    record's +0x44 field), `files` the written RANDOM.* contents in write order, `work` the
    memory images as the generator left them; `work.pathfinder` is the run's pathfinder memory
    for the game that follows (module docstring)."""
    id: str
    files: dict[str, bytes]
    work: Work


# --------------------------------------------------------------------------- ovl57:10e8


def map_id(rng) -> str:
    """ovl57:10f1..1112: six rnd(1, 0x5a, 0) + 0x20 (chars 0x21..0x7a), the map's id, copied
    to DS:5da8 (record +0x44, the overview compare string) at 1203.
    Evidence: asm ovl57:10f3..1112 (low byte of ax stored, NUL at 6)."""
    d, s, a = K.ID_ROLL.value
    return "".join(chr((rng.rnd(d, s, a) + K.ID_BASE.value) & 0xFF) for _ in range(K.ID_LEN.value))


def slider_args(run: RandomRun, rng) -> list[int]:
    """ovl57:1193..11cc: the arguments of ovl02:0000, in slider order: DS:28d0[i], or
    rnd(1, 7, -1) where it is 7 (unreachable from the panel: ovl60:0512 yields 0..6).  The "?"
    words DS:28d8 are not read (Q1, register X54: the "?" changes nothing).
    Evidence: asm ovl57:119b..11c5."""
    out = []
    for v in run.sliders[:K.N_SLIDERS.value]:
        out.append(rng.rnd(*K.SLIDER_ROLL.value) if v == K.SLIDER_RANDOM.value else v)
    return out


def random_begin(read: Callable[[str], bytes], rng, run: RandomRun, *,
                 map_words: bytes | None = None, roads: bytes | None = None,
                 pathfinder: PathRun | None = None, army_file: bytes | None = None,
                 army_set: int = 0):
    """ovl57:10e8 steps 1-4 (generator): the id dice, then the slider arguments, then
    ovl02:0000.  Yields the progress percentages; returns `Generated`.  The rest of 10e8 (the
    record strings, SCN 0x161, the loader 0194(0), RMAPTEMP via ovl49:11f3) is the host's.
    `map_words` / `roads`: the 1e1d / 19d9 images as the run left them (None: zeros).
    `pathfinder`: the run's `PathRun` as the previous game of the run left it (None: a fresh
    run); the generation searches with it and leaves it in `Generated.work.pathfinder` (the
    module docstring says what the host passes and takes).  `army_file` / `army_set`: see `Work`.
    Evidence: asm ovl57:10f1..11d6 (dice at 10f8, 11aa; ovl02:0000 at 11d6); 0555:0da6..0dae
    (the path cache is cleared only at its allocation and by ovl29:0e51)."""
    ident = map_id(rng)
    args = slider_args(run, rng)
    work = yield from generate(read, rng, run, args, map_words=map_words, roads=roads,
                               pathfinder=pathfinder, army_file=army_file, army_set=army_set)
    return Generated(ident, dict(work.files), work)


def finish(gen) -> Any:
    """Run a generator of this module to its end; its return value.
    Evidence: none needed (iteration helper); no game rule."""
    while True:
        try:
            next(gen)
        except StopIteration as stop:
            return stop.value


# --------------------------------------------------------------------------- ovl02


def load_buffer(read: Callable[[str], bytes]) -> Buffer:
    """ovl02:0015..007c: a 0xa560-byte buffer filled from RANDOM\\RANDOM.DAT (open mode 2,
    read 0xa560, close).  A shorter file leaves the rest as zeros (stand-in X61: the EXE's
    farmalloc memory past the read is unknown; the shipped file is exactly 0xa560 bytes); a
    missing file raises `RandomDataMissing` (the EXE exits).
    Evidence: asm ovl02:001d..007c."""
    try:
        data = read(K.DAT_FILE.value)
    except FileNotFoundError as e:
        raise RandomDataMissing(str(e)) from None
    return Buffer(data)


def apply_sliders(buf: Buffer, args: Sequence[int]) -> None:
    """ovl02:0082..00f2: header word += table word [arg], 16-bit, in the asm's order
    (+0x2a T6e[p2], +0x3c T60[p3], +0x36 / +0x34 T44[p1], +0x38 / +0x3a T52[p0]).
    Evidence: asm ovl02:0082..00f2."""
    for target, table, i in K.SLIDER_ADDS.value:
        buf.set_word(target, buf.word(target) + buf.word(table + 2 * args[i]))


def generate(read: Callable[[str], bytes], rng, run: RandomRun, args: Sequence[int], *,
             map_words: bytes | None = None, roads: bytes | None = None,
             pathfinder: PathRun | None = None, army_file: bytes | None = None,
             army_set: int = 0):
    """ovl02:0000(p0, p1, p2, p3) (generator): load the buffer, the slider adds, the pipeline.
    Yields the percentages; returns the `Work` (its `pathfinder` is the run memory after the
    road searches).  Keyword arguments as `random_begin`.
    Evidence: asm ovl02:0000..011b (00f8 call 011c; the buffer freed after)."""
    work = Work(load_buffer(read), rng, run, read, map=MapWords(map_words), roads=Roads(roads),
                pathfinder=pathfinder, army_file=army_file, army_set=army_set)
    apply_sliders(work.buf, args)
    yield from pipeline(work)
    return work


def clear_grid(work: Work) -> None:
    """ovl02:036b: every grid byte := 2 (water), every road byte &= 0xe0 (x outer, y inner).
    Evidence: asm ovl02:036b..03a9."""
    buf, roads = work.buf, work.roads
    for x in range(K.GRID_W.value):
        for y in range(K.GRID_H.value):
            buf.set_grid(x, y, K.CLEAR_VALUE.value)
            roads.set_at(x, y, roads.at(x, y) & K.ROAD_KEEP.value)


def clamp(x: int, y: int) -> tuple[int, int]:
    """ovl02:0470(&x, &y): x <= 0 -> 0, y <= 0 -> 0, x >= 0x70 -> 0x6f, y >= 0x9c -> 0x9b
    (signed).
    Evidence: asm ovl02:0470..04ad."""
    x, y = s16(x), s16(y)
    if not x > 0:
        x = 0
    if not y > 0:
        y = 0
    if x >= K.GRID_W.value:
        x = K.GRID_W.value - 1
    if y >= K.GRID_H.value:
        y = K.GRID_H.value - 1
    return x, y


def jitter(rng, x: int, y: int, step: int, edge: int) -> tuple[int, int]:
    """ovl02:04ae(&x, &y, step, edge): x += rnd(1, 3, -2) * rnd(1, step, 0), then the same for
    y (the -1..1 die first); then when rnd(1, 100, 0) < 30 and `edge`: with the distances
    dx = x, dy = y, ex = 0x6f - x, ey = 0x9b - y taken once, each that is <= the other three
    snaps its edge (x 0, y 0, x 0x6f, y 0x9b; ties snap both); then `clamp`.  Always 5 calls of
    the roller (rnd(1, 0, 0) is one, without a draw).
    Evidence: asm ovl02:04ae..05ae (04be, 04cc, 04ec, 04fa, 0517; jg tests 054c..0592)."""
    a = rng.rnd(1, 3, -2)
    x = s16(x + s16(a * rng.rnd(1, step, 0)))
    a = rng.rnd(1, 3, -2)
    y = s16(y + s16(a * rng.rnd(1, step, 0)))
    if rng.rnd(1, 100, 0) < 30 and edge != 0:
        dx, dy = x, y
        ex, ey = s16(K.GRID_W.value - 1 - x), s16(K.GRID_H.value - 1 - y)
        if dx <= dy and dx <= ex and dx <= ey:
            x = 0
        if dy <= dx and dy <= ex and dy <= ey:
            y = 0
        if ex <= dy and ex <= dx and ex <= ey:
            x = K.GRID_W.value - 1
        if ey <= dy and ey <= dx and ey <= ex:
            y = K.GRID_H.value - 1
    return clamp(x, y)


# --------------------------------------------------------------------------- the pipeline


def _stage(module: str, func: str, addr: str, package: str) -> Callable[[Work], Any]:
    """A stage call that resolves `module.func` when it runs, so the packages that own the
    stage modules never edit this file; not there yet -> NotImplementedError."""
    def call(work: Work):
        name = "%s.%s" % (__name__, module)
        try:
            mod = importlib.import_module(name)
        except ModuleNotFoundError as e:
            if e.name != name:
                raise
            mod = None
        f = getattr(mod, func, None)
        if f is None:
            raise NotImplementedError("%s: %s.%s (package %s)" % (addr, name, func, package))
        return f(work)
    call.__name__ = func
    call.addr = addr
    return call


# Stage calls of ovl02:011c in order, grouped behind the percentage drawn before them.  The
# functions named here are the frozen interface of packages R1-R3: `module.func(work)`.
PIPELINE: tuple[tuple[int, tuple[Callable[[Work], Any], ...]], ...] = (
    (0, (_stage("files", "template", "ovl09:1001", "R3"),
         clear_grid,                                                      # ovl02:036b
         _stage("land", "continent", "ovl03:0000", "R1"))),
    (10, (_stage("ridges", "ridges", "ovl04:0000", "R1"),)),
    (20, (_stage("ridges", "cuts", "ovl07:0000", "R1"),)),
    (30, (_stage("rivers", "rivers", "ovl06:0000", "R1"),)),
    (40, (_stage("forest", "forests", "ovl05:0000", "R1"),)),
    (50, (_stage("marsh", "marshes", "ovl08:0000", "R1"),)),
    (60, (_stage("cities", "place_cities", "ovl11:0000", "R2"),)),
    (70, (_stage("cities", "place_sites", "ovl11:003a", "R2"),)),
    (80, (_stage("roads", "roads", "ovl12:0000", "R3"),)),
    (90, (_stage("files", "finish", "ovl09:0014", "R3"),)),
)


def pipeline(work: Work) -> Iterator[int]:
    """ovl02:011c: progress 0, ovl09:1001, 036b, ovl03:0000; 10 ovl04:0000; 20 ovl07:0000;
    30 ovl06:0000; 40 ovl05:0000; 50 ovl08:0000; 60 ovl11:0000; 70 ovl11:003a; 80 ovl12:0000;
    90 ovl09:0014; 100.  Yields every percentage, the stages' own ones in place.
    Evidence: asm ovl02:011c..01b4."""
    for pct, calls in PIPELINE:
        yield pct
        for call in calls:
            r = call(work)
            if r is not None:
                yield from r
    yield K.PROGRESS.value[-1]
