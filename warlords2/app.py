"""Boot, asset load and the main loop (docs/plan.md sections 2.1 and 3.1).

pgsm (`StateManager`, 0.0.2) runs state hooks on threads and has no error path for them.
The loop therefore waits for every hook thread after `manager.update`, re-raises an
exception a hook thread stored through `threading.excepthook` (S1), and otherwise checks
that the transition completed.  `dt` is always passed (S9c); the loading state is a no-op
(S9a/b).  Each state's `exit` (pgsm's `set_state`) raises off the main thread (S9d).
"""
from __future__ import annotations

import argparse
import importlib
import os
import sys
import threading
import traceback

import pygame
from StateManager import StateManager

from .assets.store import ERR_MOUSE, ERR_SCENARIO, AssetStore
from .formats.gamedir import EXE_NAME, GameDir
from .persist.userdir import UserDir
from .states.base import BaseState, NoLoading
from .states.boot import Boot, boot_target
from .ui import registry
from .ui.input import Input
from .ui.screen import Screen

# pgsm state name -> "module:class"; a state whose module does not exist yet is absent
STATES = {
    "intro": "warlords2.states.intro:Intro",       # M2c
    "menu": "warlords2.states.menu:Menu",          # M2b
    "setup": "warlords2.states.setup:Setup",       # M2b
    "game": "warlords2.states.game:Game",          # M3
}
MOUSE_FILE = "STAND.PCK"
SETTLE_TIMEOUT = 10.0                     # seconds a pgsm hook thread may take
BANNER_FMT, BANNER_VERSION = 0x27C9, 0x27F8   # res_0a4c:02f3 / 02f7: printf(DS:27c9, DS:27f8)


def discover_states(app: App) -> dict[str, BaseState]:
    out = {}
    for name, target in STATES.items():
        mod, cls = target.split(":")
        try:
            m = importlib.import_module(mod)
        except ModuleNotFoundError as e:
            if e.name != mod:
                raise
            continue
        out[name] = getattr(m, cls)(app)
    return out


class App:
    def __init__(self, cfg: argparse.Namespace):
        self.cfg = cfg
        from .model.ai import AiProcess
        self.ai_process = AiProcess()             # the AI's DGROUP words for this run (model.ai)
        self.capture_tutorial_shown = False       # DS:0a54: once per run (ui.dialogs.capture)
        if getattr(cfg, "allow_unverified", False):
            from .rules.constants import set_allow_unverified
            set_allow_unverified(True)                    # --allow-unverified (plan section 3.2)
        if cfg.headless:
            os.environ["SDL_VIDEODRIVER"] = "dummy"
            os.environ["SDL_AUDIODRIVER"] = "dummy"
        self.gd = GameDir(cfg.data)
        problems = self.gd.verify()
        if not self.gd.path(EXE_NAME).is_file():
            raise SystemExit(problems[0])
        for p in problems:                                    # hash mismatch: reported, not fatal
            print(p, file=sys.stderr)
        self.user = UserDir(cfg.user_dir, cfg.data)
        from .persist.saves import RunCarry, Saves
        self.saves = Saves(self.user, self.gd)        # res_0a4c:0250 -> ovl49:0e5f (the slot table)
        self.run_carry = RunCarry()                   # the run's memory across games (EL §10.4)

        # everything is read here, synchronously, before pgsm exists
        pygame.display.init()
        self.assets = AssetStore(self.gd, app=self)
        if not self.gd.path(MOUSE_FILE).is_file():           # ovl64:003b -> ovl52:0054 -> ovl52:0000
            from .audio import effects
            effects.chord(self)                               # ovl52:002e, before the message
            print(self.assets.error(ERR_MOUSE, MOUSE_FILE), file=sys.stderr)
            raise SystemExit(1)
        if cfg.scenario and not self.gd.path(cfg.scenario).is_dir():
            print(self.assets.error(ERR_SCENARIO, cfg.scenario), file=sys.stderr)
            raise SystemExit(1)
        self.screen = Screen(cfg.scale, self.assets.palette("STANDARD.PAL"))
        pygame.key.start_text_input()                         # once, never stopped
        self.input = Input(cfg.scale)

        self._hook_errors: list[BaseException] = []
        self._closed = False
        self._prev_excepthook = threading.excepthook
        threading.excepthook = self._on_thread_error
        try:
            registry.load_all()                               # dialogs, actions, views register
            states = discover_states(self)
            if cfg.probe:
                from .debug import probe_states
                states.update(probe_states.states(self))
            target, kw = boot_target(cfg, set(states))
            if target not in states:
                raise SystemExit(f"unknown state {target!r}; have {sorted(states)}")
            self.manager = StateManager({"boot": Boot(self, target, kw), **states}, loading_state=NoLoading())
            for name, st in self.manager.states.items():      # pgsm set `exit` per instance
                st.exit = _main_thread_only(name, st.exit)
            self.frame = 0
            self.running = True
            self.clock = pygame.time.Clock()
            self.manager.start("boot")
            self._settle()
        except BaseException:
            self.close()
            raise

    def _on_thread_error(self, args: threading.ExceptHookArgs) -> None:
        manager = getattr(self, "manager", None)
        if self._closed or manager is None or args.thread not in list(manager.threads.values()):
            self._prev_excepthook(args)                    # not one of our hook threads
        else:
            self._hook_errors.append(args.exc_value)

    def _settle(self) -> None:
        """Wait for pgsm's hook threads; a failed hook raises here, on the main thread."""
        cur = self.manager.current_state_str()
        while alive := [t for t in list(self.manager.threads.values()) if t.is_alive()]:
            for t in alive:                                # a failed thread stays listed, dead
                t.join(SETTLE_TIMEOUT)
                if t.is_alive():
                    raise RuntimeError(f"hook thread of the transition to {cur!r} still running "
                                       f"after {SETTLE_TIMEOUT} s")
        if self._hook_errors:
            first, *rest = self._hook_errors
            self._hook_errors = []
            _report(rest)
            raise first
        if self.manager.loading[cur]:
            raise RuntimeError(f"transition to {cur!r} never completed")

    def step(self, events: list[pygame.event.Event] | None = None) -> None:
        """One logical frame."""
        if events is None:
            events = pygame.event.get()
        if any(e.type == pygame.QUIT for e in events):
            self.running = False
        events = self.input.feed(events)
        measured = 0 if self.cfg.headless else self.clock.tick(self.cfg.tick_hz)
        dt = 1000 / self.cfg.tick_hz if self.cfg.fixed_dt else measured
        self.manager.update(events, dt)
        self._settle()
        self.manager.draw(self.screen.fb)
        self.screen.present()
        self.frame += 1

    def run(self, frames: int | None = None) -> None:
        """Until QUIT, `frames` frames, or the end of --script; --shot-at and --record
        capture each presented frame as `debug.run` does (docs/plan.md section 3.1)."""
        cfg = self.cfg
        src = None
        if cfg.script:
            try:
                script = importlib.import_module("warlords2.debug.script")    # M1b2
            except ModuleNotFoundError as e:
                if e.name != "warlords2.debug.script":
                    raise
                raise SystemExit("--script needs warlords2.debug.script (M1b2)") from None
        elif frames is None and cfg.headless:
            raise SystemExit("--headless needs --script or a frame limit, or it never ends")
        capture = recorder = None
        if cfg.shot_at or cfg.script:
            from .debug.capture import Capture
            from .debug.script import SHOT_ROOT
            capture = Capture(SHOT_ROOT / (cfg.script.stem if cfg.script else "run"), cfg.shot_at)
        if cfg.record:
            if cfg.tick_hz % cfg.record_fps:
                raise SystemExit(f"--record-fps {cfg.record_fps} must divide --tick-hz {cfg.tick_hz}")
            from .debug.recorder import Recorder                              # imports cv2
            recorder = Recorder(cfg.record, cfg.record_fps, cfg.tick_hz // cfg.record_fps)
        try:
            if cfg.script:
                src = script.load(cfg.script, self, capture)
                frames = src.last_frame + 1
            while self.running and (frames is None or self.frame < frames):
                f = self.frame
                if src:
                    src.before_frame(f)                      # posts that frame's events
                self.step()
                present = self.screen.present_surface
                if recorder:
                    recorder.after_frame(present, f)
                if capture:
                    capture.after_frame(present, f)
                if src:
                    src.after_frame(f)
        finally:
            if recorder:
                recorder.close()

    def exit_program(self) -> None:
        """0a4c:02b5, the end of the program: back to text mode, music off, vectors and mouse
        released (here: the main loop stops and `close` releases the display), then
        printf(DS:27c9, DS:27f8), the one-line banner with the version, to the console (the
        text from the user's EXE), and exit(0).  Nothing is written.
        Evidence: asm res_0a4c:02b5..030b (02f2..02fa printf, 0302 exit(0))."""
        from .assets.exe import ds_str
        from .assets.text import printf
        exe = self.gd.read(EXE_NAME)
        sys.stdout.write(printf(ds_str(exe, BANNER_FMT), ds_str(exe, BANNER_VERSION)))
        sys.stdout.flush()
        self.running = False

    def close(self) -> None:
        """Release the display and the thread hook (safe to call twice)."""
        if self._closed:
            return
        self._closed = True
        for st in getattr(self.manager, "states", {}).values():   # a turn-loop run parked at a present point
            ab = getattr(st, "abandon_run", None)
            if ab is not None:
                ab()
        if self._hook_errors:                            # raised by no `_settle`
            print("pgsm hook errors not raised before close:", file=sys.stderr)
            _report(self._hook_errors)
            self._hook_errors = []
        if threading.excepthook == self._on_thread_error:
            prev = self._prev_excepthook
            while isinstance(getattr(prev, "__self__", None), App) and prev.__self__._closed:
                prev = prev.__self__._prev_excepthook          # an App closed out of order
            threading.excepthook = prev
        # else a later hook wraps ours; ours now passes everything on to the previous one
        pygame.display.quit()


def _main_thread_only(name: str, exit_):
    def exit(to: str, **kw) -> None:
        if threading.current_thread() is not threading.main_thread():
            raise RuntimeError(f"{name}.exit({to!r}) off the main thread; hooks call request()")
        exit_(to, **kw)
    return exit


def _report(errors: list[BaseException]) -> None:
    for e in errors:
        print("".join(traceback.format_exception(e)), end="", file=sys.stderr)


def main(argv: list[str] | None = None) -> None:
    from .config import parse_args
    app = App(parse_args(argv))
    try:
        app.run()
    finally:
        app.close()
