"""A human stack walking its path (the Moved event).

Evidence: 0c8c:01fd -> 0a8b:0c4f -> 07f9 -> 0a8b:04c8(path, n) at 0a8b:09f2 (0c8c:01fd is
called from the UI: ovl46:015a, 07be:0324 / 04ff, ovl61:0bd3).  0a8b:0c4f builds the path-mark
list from the stack's square before the move (0a8b:0cb8..0ccd -> 0c8c:0963: DS:6475 squares,
at most 200 (0c8c:09a8), DS:2ea6 count, DS:2ea8 = 0) and 07f9 sets DS:2eaa = 0555:18be(path,
budget) with budget DS:5e00 for a group, the leader's +7 alone (0a8b:0837..0867).  Per step
04c8 (asm 0a8b:04c8..060b): t0 = BIOS ticks (0000:1bcf), one square on (0a8b:0b4d, every
DS:5e3e member with DS:2bda), the old square's bits cleared (0b62:01a7), DS:2ea8 + 1 (05ac),
the reveal ovl64:1298, the view centred on the stack (ovl64:0565 -> 0629: the centre clamped
to 4..0x6b, 4..0x97 and written to SCN 0x17d / 0x17f) and redrawn (ovl64:006c), then a busy
wait (060b..0654) until the tick count passed t0 + 2 (`STEP_TICKS` = 3 ticks after a tick
boundary; the original's real wait is 2..3 ticks depending on where in a tick t0 fell).  The
wait also ends after 10000 (0x2710) polls of 151d:008a, a cap that depends on the CPU speed
and is not modelled.  No sound in 04c8.  The main loop does not run during the walk, so no
selection frame is drawn (077b:005f / 011f are not called).  No path (Moved info "no_path"):
nothing moves and the list is left as it was (0a8b:0c8f..0cb7).  The scene is the state before
the command with the moved group's goto already set to the destination (the human phase sets
it on its copy, as 0a8b:0c4f writes +0x12 / +0x14 before the search).

Computer sides walk through the same steps: 0a8b:0001 (called from the AI overlays ovl19,
ovl20, ovl22, ovl26, ovl28) -> 0c4f -> 07f9 -> 04c8, with the same per-step wait; only the
drawing is skipped when the side is a computer and Observe (SCN 0x159) is off (ovl64:006c,
0083..0098).  `walk` returns None for a computer side: that presentation is M8b's.
"""
from __future__ import annotations

from ...model import events as E
from ...model.ids import Control
from ...rules import pathfinding as P
from ...rules.bonuses import s8
from ...rules.mapwords import refresh_map
from ...rules.movement import stack_mode
from ...rules.visibility import reveal
from .. import registry
from ..animate import wait

STEP_TICKS = 3
MODE_FLY = 2
CENTRE_MIN, CENTRE_MAX = (4, 4), (0x6B, 0x97)  # ovl64:0629


def clamp_centre(x: int, y: int) -> tuple[int, int]:
    """ovl64:0629."""
    return (min(max(x, CENTRE_MIN[0]), CENTRE_MAX[0]), min(max(y, CENTRE_MIN[1]), CENTRE_MAX[1]))


@registry.event_view(E.Moved)
def walk(host, ev):
    phase = getattr(host, "phase", None)
    anim = getattr(phase, "animator", None)
    scene = anim.scene if anim is not None else None
    st = host.state
    if scene is None or ev.info.get("no_path") or st.players[st.current].control != Control.HUMAN:
        return None
    members = [scene.armies[i] for i in ev.info["armies"]]
    src = tuple(ev.info["from"])
    lead = members[0]
    mode, mask = stack_mode(scene, members)
    codes = P.find_path(scene, src, lead.goto, mode, mask)        # the goto the move searched for
    budget = min(s8(a.moves_left) for a in members) if len(members) > 1 else s8(lead.moves_left)
    if codes is not None:
        phase.display.set(P.cells(src, codes), P.reach_this_turn(scene, src, codes, mode, mask, budget))
    return _steps(host, phase, scene, members, ev.info["path"], mode == MODE_FLY)


def _steps(host, phase, scene, members, path, flying):
    for k, (x, y) in enumerate(path):
        for a in members:
            a.x, a.y = x, y
        refresh_map(scene)
        reveal(scene, x, y, flying)
        phase.display.done += 1
        host.view.centre(*clamp_centre(x, y))
        yield from wait(host.app, STEP_TICKS, k * STEP_TICKS)
