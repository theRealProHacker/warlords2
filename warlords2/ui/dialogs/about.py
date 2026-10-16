"""SSG > About (menu 497, key '?'): the version scroll.

Evidence (asm ovl49:0084..019c; key table 07be:0337 '?' -> 07be:029f -> ovl49:0084):
* 008b ovl59:0a1b (a memory probe: 150000 bytes allocated and freed under an error hook);
  009f 0d28:0805(&a, &b, &c): the DOS heap walk; a / 1000, b / 1000, c / 1000 (00a7..0133,
  `div ebx` with ebx = 0x3e8) are printed with 0000:4944 (sprintf) through STRING (139, 4),
  (139, 5), (139, 6) into three stack buffers;
* 0136 ovl17:0000(0x17): BSCROLL.PCK keyed at (160, 55) (`ui.dialogs.progress`);
* 0183 ovl61:1471(S(139, 0), S(139, 1), DS:1292, S(139, 3), buf 4, buf 5, buf 6): line 2 is the
  DGROUP string DS:1292, not STRING (139, 2) (013e..0181); 1471 sets SetFont(2, 0, 7, 1) and,
  the top popup (ovl17:093a) not being 0x0d, takes the 15b9 branch: string 0 is not drawn,
  strings 1..6 are centred (ovl59:00d6) at x 328, y 161 + 20 (k - 1), an empty string skipped
  (15b9..1682) -- the lines of `ui.dialogs.progress`;
* 018e ovl61:10fb(NULL): no popup of its own; DS:166a = 1, the wait ovl59:0142 (a key, or a left
  or right release: `widgets.is_dismiss`), DS:166a = 0; 0196 ovl17:069c closes the scroll.  No
  button, no sound, no ovl61:011f / 0174 (nothing is refreshed).

Register X39 (user decision): the EXE's a, b, c are the DOS heap's free total, largest free
block and the total of the blocks with flag 0x20 (0d28:0805 walks DS:327a .. DS:327e).  This
program has no DOS heap, so `heap_figures` measures analogues of this machine and process, in
bytes: a = the memory available to new allocations (/proc/meminfo MemAvailable, else
SC_AVPHYS_PAGES * SC_PAGE_SIZE), b = the largest single allocation this process may make (a,
capped by the soft RLIMIT_AS / RLIMIT_DATA when they are finite), c = this process's resident
memory (/proc/self/status VmRSS, else the peak ru_maxrss); 0 for what the platform does not tell.
Each is held as the EXE's dword (saturated at 0xffffffff) and printed as a / 1000 with `%lu`.
With a fixed time step (`--headless` / `--script`, the deterministic runs) `FIXED` is printed
instead, so frames and evidence do not depend on the machine.
"""
from __future__ import annotations

import os

import pygame

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17
from .. import registry
from ..dialog import Dialog
from ..widgets import is_dismiss, kit, text_centred
from .hero_offer import raw, sprintf
from .progress import INK, LINE_DY, LINE_X, LINE_Y0, POPUP, SHADOW
from ...assets.store import cache_load

GROUP = 139
VERSION = 0x1292                       # DS:1292, line 2 (ovl49:0160)
FIGURES = (4, 5, 6)                    # STRING (139, 4..6): the heap lines
KB = 1000                              # ovl49:00ab / 00da / 010a: mov ebx, 0x3e8
FIXED = (0, 0, 0)                      # X39: the figures of the deterministic runs
DWORD = 0xFFFFFFFF                     # a, b, c are dwords ([bp-4], [bp-8], [bp-0xc])


def _meminfo(path: str, key: str) -> int | None:
    """A "key: n kB" line of a /proc file, in bytes."""
    try:
        with open(path) as f:
            for line in f:
                if line.startswith(key + ":"):
                    return int(line.split()[1]) * 1024
    except (OSError, ValueError, IndexError):
        pass
    return None


def _available() -> int:
    v = _meminfo("/proc/meminfo", "MemAvailable")
    if v is not None:
        return v
    try:
        return os.sysconf("SC_AVPHYS_PAGES") * os.sysconf("SC_PAGE_SIZE")
    except (AttributeError, ValueError, OSError):
        return 0


def _largest(avail: int) -> int:
    try:
        import resource
    except ImportError:
        return avail
    out = avail
    for lim in ("RLIMIT_AS", "RLIMIT_DATA"):
        try:
            soft = resource.getrlimit(getattr(resource, lim))[0]
        except (AttributeError, ValueError, OSError):
            continue
        if soft != resource.RLIM_INFINITY and soft >= 0:
            out = min(out, soft)
    return out


def _resident() -> int:
    v = _meminfo("/proc/self/status", "VmRSS")
    if v is not None:
        return v
    try:
        import resource
        return resource.getrusage(resource.RUSAGE_SELF).ru_maxrss * 1024
    except (ImportError, AttributeError, ValueError, OSError):
        return 0


def heap_figures() -> tuple[int, int, int]:
    """(a, b, c) in bytes: the analogues of 0d28:0805's free total, largest free block and
    flag-0x20 total (X39)."""
    a = _available()
    return a, _largest(a), _resident()


def figures(app) -> tuple[int, int, int]:
    """What the box prints: FIXED in the deterministic runs, else `heap_figures`, as dwords."""
    v = FIXED if getattr(app.cfg, "fixed_dt", False) else heap_figures()
    return tuple(min(max(int(x), 0), DWORD) for x in v)


def lines(k, heap=FIXED) -> list[str]:
    """The seven strings ovl49:0183 passes to ovl61:1471."""
    out = [raw(k, GROUP, 0), raw(k, GROUP, 1), ds_str(k.exe, VERSION), raw(k, GROUP, 3)]
    out += [sprintf(raw(k, GROUP, i), v // KB) for i, v in zip(FIGURES, heap)]
    return out


class About(Dialog):
    event_loop = False                 # ovl49:0084 waits in ovl61:10fb
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        self.k = kit(host.app)
        cache_load(self.k, 70)                         # popup 0x17 BSCROLL: ovl17:0000 at 05b8 (X44)
        self.lines = lines(self.k, figures(host.app))

    def update(self, events, dt) -> None:
        if any(is_dismiss(e) for e in events):
            self.close(None)

    def draw(self, fb: pygame.Surface) -> None:
        k = self.k
        f = k.fonts[CHANCE17]
        k.draw_popup(fb, POPUP)
        for i, s in enumerate(self.lines[1:7]):
            if s:
                text_centred(fb, f, LINE_X, LINE_Y0 + LINE_DY * i, s, INK, SHADOW)


@registry.dialog("about")
def about(host, on_close=None):
    return About(host, on_close)


@registry.action(registry.MENU_ID["about"])
def open_about(host):
    """07be:029f -> ovl49:0084."""
    return registry.open_dialog("about", host)
