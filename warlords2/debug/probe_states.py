"""Test-only pgsm states that exercise the traps of docs/plan.md section 2.1, show the
backdrop, and host the M2a UI kit for scripted runs.  Selected with `--probe NAME` or
injected by tests; never part of the game."""
from __future__ import annotations

import pygame

from ..states.base import BaseState
from ..ui import registry
from ..ui.keys import left_press, right_help
from ..ui.layout import DISABLED, NORMAL, PRESSED
from ..ui.menubar import MenuBar, with_codes
from ..ui.widgets import ButtonRow, draw_button, draw_pointer, kit


class ProbeError(RuntimeError):
    pass


class Backdrop(BaseState):
    """Main-menu backdrop: STARTUP0-3 as quadrants (graphics.md section 3)."""

    def paint(self, fb: pygame.Surface) -> None:
        fb.blit(self.app.assets.picture("startup.pck"), (0, 0))


class RaiseOnEnter(BaseState):
    def on_enter(self, frm: str, **kw) -> None:
        raise ProbeError(f"probe: on_enter from {frm}")


class StrictEnter(BaseState):
    """`on_enter` takes no kwargs, so any kwarg kills pgsm's hook thread."""

    def on_enter(self, frm: str) -> None:
        self.frm = frm


class Loop(BaseState):
    """Logs its hooks; `game -> game` style same-object transitions."""

    def __init__(self, app):
        super().__init__(app)
        self.log: list[tuple] = []

    def on_enter(self, frm: str, **kw) -> None:
        self.log.append(("enter", frm, kw))

    def on_exit(self, to: str) -> None:
        self.log.append(("exit", to))


class UiHost(BaseState):
    """A screen of the M2a kit: backdrop picture, the live buttons of one JOIN screen, a
    menu bar with this screen's enable mask, the dialog stack and the pointer on top.

    Input while no dialog is open: a left press on a title opens its menu, else the
    buttons take it (a press on a disabled or pressed one chords, 07be:0e7b) and a release
    over one runs its registered action; a right press over a button opens its help
    (`ui.keys.right_help`: not while a left press is held on a button, 08a9:0143); a key
    goes to the menu bar, none while a button is held (07be:006f).  Events after the one that opened a dialog wait for the next frame."""

    backdrop = "startup.pck"
    screen: int | None = None               # JOIN screen whose buttons are live
    only_quit = False                       # setup / map building: Quit alone enabled

    def __init__(self, app):
        super().__init__(app)
        self.bar: MenuBar | None = None
        self.buttons: ButtonRow | None = None

    def _ready(self):
        """Built on first use, on the main thread (pictures; pgsm hooks run on threads)."""
        k = kit(self.app)
        if self.bar is None:
            self.bar = MenuBar(k.menus, k.menu_actions, k.fonts[0])
            if self.only_quit:                 # ovl57:0564: all off, Quit (505) on
                self.bar.enable_menu(None, False)
                self.bar.enable(registry.MENU_ID["quit"], True)
            lay = k.layouts.screen(self.screen) if self.screen is not None else None
            self.buttons = ButtonRow(lay.buttons if lay else [], k.picture)
        return k

    def step(self, events, dt):
        self._ready()
        for e, code in with_codes(events, self.app.input):
            if self.dialogs:
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                right_help(self, self.buttons, e.pos)
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.bar.press(self, e.pos):
                continue
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                left_press(self.app, self.buttons, e)
            elif e.type in (pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
                hit = self.buttons.event(e)
                if hit is not None:
                    registry.run_action(hit, self)
            elif code is not None and self.buttons.held is None:     # 07be:006f DS:166c
                self.bar.key(self, code)

    def paint(self, fb):
        self._ready()
        fb.blit(self.app.assets.picture(self.backdrop), (0, 0))
        self.buttons.draw(fb)
        self.bar.draw(fb)

    def draw(self, s):
        """BaseState.draw, then the pointer above the dialogs (12bf:098d)."""
        super().draw(s)
        draw_pointer(self.app, s, self.dialogs)


class UiStart(UiHost):
    """Game Start screen: JOIN screen 1, every menu enabled (1372:1286), SHOT 00."""
    screen = 1


class UiSetup(UiHost):
    """The menu bar of the Game Setup screen (SHOT 09); its widgets are M2b's.  ovl57:0564
    also enables 502-504 when ovl49:0e25 / 0e42 / a save flag say so; not modelled."""
    only_quit = True


class UiProgress(UiHost):
    """The map-building scroll over the game frame (SHOT 03-07): the work reports 0, 10,
    ... 90 %, each for `HOLD` frames, like ovl63:232b's tenths."""
    backdrop = "screen.pck"
    only_quit = True
    GROUP, HOLD = 137, 6

    def __init__(self, app):
        super().__init__(app)
        self.started = False

    def step(self, events, dt):
        if not self.started:
            self.started = True
            registry.open_dialog("progress", self, group=self.GROUP, work=self.work())
            return
        super().step(events, dt)

    def work(self):
        for pct in range(0, 100, 10):
            yield pct
            for _ in range(self.HOLD - 1):
                yield None


class UiDialogs(UiHost):
    """The common dialogs one after the other over the game frame; the next opens when the
    last has closed.  Texts are STRING.DAT (group, index) of this copy."""
    backdrop = "screen.pck"
    only_quit = True

    def __init__(self, app):
        super().__init__(app)
        self.shown = 0

    def demos(self):
        t = kit(self.app).text
        quit_, war = t.group(44), t.group(140)
        return [("message", {"lines": [t.S(18, 0)]}), ("message", {"lines": t.group(16)}),
                ("confirm", {"title": quit_[0], "lines": quit_[1:5]}),
                ("confirm", {"title": war[0], "lines": war[1:5]}),
                ("help_page", {}), ("help_items", {}),
                *(("tutorial_page", {"index": i}) for i in range(11))]

    def step(self, events, dt):
        self._ready()
        demos = self.demos()
        if self.shown < len(demos):
            name, kw = demos[self.shown]
            self.shown += 1
            registry.open_dialog(name, self, **kw)
            return
        super().step(events, dt)


class Cursors(BaseState):
    """The 12 pointers with a colour-12 dot on each hotspot, over the Game Start buttons
    drawn pressed, normal and disabled in turn."""

    def paint(self, fb):
        k = kit(self.app)
        fb.blit(self.app.assets.picture("startup.pck"), (0, 0))
        for i, b in enumerate(k.layouts.screen(1).buttons):
            draw_button(fb, b, (PRESSED, NORMAL, DISABLED)[i % 3], k.picture)
        for n in range(len(k.cursors.cells)):
            pos = (360 + 24 * (n % 6), 40 + 30 * (n // 6))
            k.cursors.draw(fb, pos, n)
            fb.fill(12, (*pos, 1, 1))


PROBES = {"probe_backdrop": Backdrop, "probe_raise": RaiseOnEnter,
          "probe_strict": StrictEnter, "probe_loop": Loop,
          "probe_ui_start": UiStart, "probe_ui_setup": UiSetup, "probe_ui_progress": UiProgress,
          "probe_ui_dialogs": UiDialogs, "probe_cursors": Cursors}


def states(app) -> dict[str, BaseState]:
    return {name: cls(app) for name, cls in PROBES.items()}
