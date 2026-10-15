"""Order > Move All (menu 507, key 'm') and Order > Disband (menu 508, key 'q').

Evidence (asm res_07be, res_0c8c, res_0b62, ovl56; DGROUP strings read from the user's EXE):
* key table 07be:0337 'm' -> 07be:01fc -> 0c8c:04c4 (Move All): no dialog.  The engine's
  `MoveAll` (rules.selection.move_all) is the whole routine: the selected stack first when its
  leader has a goto (04ca..04db), then every army ovl67:05c4 finds, each walked by 0c8c:01fd
  (050d) as an ordinary walk; the walks are the command's events, played by the human phase's
  animator; then ovl61:0174 (0522), the palette refresh `Human.apply` ends with.
* 'q' -> 07be:0225 -> 0b62:06bf (Disband): DS:5e62 null -> nothing (06c8..06d0).  The heroes
  test (06d3..0706) and the yes / no box are the engine's `Disband` -> `DisbandPrompt` (info
  "heroes"); its view is the confirmation box ovl56:0088(title DS:2bf8, DS:2c00, DS:2c11,
  DS:2c26, buffer, yes 0b62:076a, no 0b62:075a) (0708..074f): the buffer is DS:2be4 (the empty
  string) or, with a hero in the stack, DS:2be5 (0000:4a70 at 0711 / 0726).  ovl56:01ad counts
  the body lines by their pointers (01e5..0204), and the buffer's pointer is never null, so
  the box always uses the four-line positions, the fourth line empty without heroes.
  `ui.dialogs.confirm` is that box (popup 1, JOIN screen 5, 189 yes / 190 no; DS:166a set, so
  Esc = 190, Return = 189).  Yes -> 076a = `ConfirmDisband(True)`; no -> 075a: ovl61:0000(0, 0)
  (redraw and palette refresh) = `ConfirmDisband(False)`, which only redraws the palette.
  The answer goes through the human phase (`apply`), as the treachery question's.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...model import commands as C
from ...model import events as E
from .. import registry
from ..widgets import kit
from .confirm import Confirm
from .hero_offer import answer, human_phase, wait
from .search_result import group_of

TITLE, LINES, EMPTY, HEROES = 0x2BF8, (0x2C00, 0x2C11, 0x2C26), 0x2BE4, 0x2BE5


def _human(host):
    st = getattr(host, "state", None)
    if st is None or human_phase(host) is None:
        return None
    return st


@registry.action(registry.MENU_ID["move_all"])
def move_all(host):
    """07be:01fc -> 0c8c:04c4."""
    if _human(host) is None:
        return None
    return answer(host, C.MoveAll())


@registry.action(registry.MENU_ID["disband"])
def disband(host):
    """07be:0225 -> 0b62:06bf with the selected stack (nothing without one, 06d0)."""
    st = _human(host)
    if st is None or st.selection.selected < 0:
        return None
    return answer(host, C.Disband(group_of(st)))


def texts(k, heroes: bool) -> tuple[str, list[str]]:
    """Title and the four body lines of 0b62:0708..074f."""
    exe = k.exe
    return ds_str(exe, TITLE), [*(ds_str(exe, o) for o in LINES), ds_str(exe, HEROES if heroes else EMPTY)]


@registry.dialog("disband_confirm")
def disband_confirm(host, heroes: bool, on_close=None):
    k = kit(host.app)
    title, lines = texts(k, heroes)

    def done(yes):
        answer(host, C.ConfirmDisband(bool(yes)))
        if on_close:
            on_close(yes)
    return Confirm(k, title, lines, done, host=host)


@registry.event_view(E.DisbandPrompt)
def disband_prompt(host, ev):
    return wait(registry.open_dialog("disband_confirm", host, heroes=bool(ev.info.get("heroes"))))
