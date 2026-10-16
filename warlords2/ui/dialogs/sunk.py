"""The message after armies sank for lack of a boat (0b62:0ea0, register R18).

Evidence (asm 0b62:11ef..1293, read from the user's EXE): when the count [bp-6] of armies sunk
is above 0: the splash ovl58:023d (11f8, `audio.effects`), the selection cleared (11fd..1228),
the map words rebuilt and the map drawn (ovl62:0000 at 122b, ovl64:006c at 1230), so the
message stands over the map without them; then line 1 = sprintf(DS:5c88, STRING (168, 2) for
one army, else (168, 0), count) (1235..125d: the count stays pushed as the format's argument),
line 2 = STRING (168, 1) (1260..126b), shown by ovl61:1160 (1274: the two-line message, waits
for a key or a mouse release); after it, only when x, y >= 0 (127c..1286), i.e. for the
one-square form (ovl67:0728, a stack selected on Water or a port), the view is centred on
(x, y) (ovl64:0629 at 1288; the engine has written the clamped view words,
`rules.movement.sink`, and carries (x, y) as `square`); the turn-start form (ovl68:0491 passes
(-1, -1)) leaves the view where it is.  ovl68:0491 runs in the human turn start; ovl67:0728
runs only when ovl25:09ab returns 0, and 09ab returns 1 for a side with 2c04:00d0[p] == 1 and
also for any side while DS:0836 != 0 (inside the computer turn); so the message is never
shown for a computer side's stack or during the computer turn.
"""
from __future__ import annotations

from ...model import events as E
from .. import registry
from ..widgets import kit
from .hero_offer import raw, sprintf, wait

GROUP = 168                                # 0b62:1247 / 1260: push 0xa8
ONE, MANY, SECOND = 2, 0, 1                # 0b62:123e / 1245 (count == 1 at 1235), 1260 (0x100a8)


def lines(k, count: int) -> list[str]:
    """0b62:1235..126b."""
    return [sprintf(raw(k, GROUP, ONE if count == 1 else MANY), count), raw(k, GROUP, SECOND)]


def _anim(host):
    return getattr(getattr(host, "phase", None), "animator", None)


def _shown(host, ev):
    anim = _anim(host)
    if anim is not None and anim.scene is not None:
        anim.scene = host.state.copy()     # ovl62:0000 / ovl64:006c before the message
    d = registry.open_dialog("message", host, lines=lines(kit(host.app), ev.info["count"]))
    yield from wait(d)
    x, y = ev.info.get("square", (-1, -1))
    follow = getattr(getattr(host, "view", None), "follow", None)
    if x >= 0 and y >= 0 and follow is not None:   # 0b62:127c..1286
        follow(host.state)                 # ovl64:0629 at 1288 (the view words as the engine left them)


@registry.event_view(E.Sunk)
def sunk(host, ev):
    return _shown(host, ev)
