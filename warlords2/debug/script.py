"""Frame-indexed input scripts (docs/plan.md section 3.3).

A script file is JSON, either a list of steps or `{"args": [cli flags], "steps": [...]}`;
`args` (e.g. `["--probe", "probe_backdrop"]`) are what `debug.run` starts the app with.
A step is `[frame, {op: value, option: value, ...}]` in logical frames and logical px:

| op | value | options | posted / checked |
|---|---|---|---|
| `key` | pygame key name | `text` (unicode), `hold` | KEYDOWN, then KEYUP unless `hold` |
| `keyup` | pygame key name | | KEYUP |
| `click`, `rclick` | `[x, y]` | | MOUSEMOTION (if moved), button 1 / 3 DOWN and UP |
| `move` | `[x, y]` | | MOUSEMOTION |
| `drag` | `[[x0, y0], [x1, y1]]` | `frames` (default 1), `button` (1) | DOWN at `frame`, one MOUSEMOTION per frame, UP at `frame + frames` |
| `press_button` | BUTTON.DAT id | | `click` at the centre of the button's rectangle (`Layouts.find_button`) |
| `shot` | name | | PNG `<name>.png` of `present_surface` |
| `assert_state` | `{"state": name, "dialog": class name or null}` | | pgsm state, top dialog |
| `golden` | `{"ref": file, "regions": {name: [x, y, w, h]}, "max_mae": n}` | | `debug.golden.compare` |
| `wait_dialog` | registry dialog id | `frames` (default 60) | the top dialog was opened as that id (`registry.open_dialog`) at `frame` or within `frames` frames after it |
| `state_hash` | a label | `want` (hex digest) | records the engine state hash (`GameState.hash`) of the presented frame in the results; with `want` it must equal it |

Input steps are posted into pygame's queue by `before_frame(frame)`, before that frame's
`pygame.event.get()`; positions become window px (`Input.window`: through the window's view,
scaled and, in full screen, offset) because `Input.feed` turns window px back into logical px.  Check steps look at the frame after it has been
presented (`after_frame(frame)`); `before_frame(frame + 1)` runs them if nobody else
did, so a plain `python -m warlords2 --script` run checks them too, and `last_frame` is
one past the last step (a `wait_dialog` counts up to its deadline).  Absolute frames of
later steps do not move when a `wait_dialog` is met early.
"""
from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path
from typing import TYPE_CHECKING, Any

import pygame

from . import golden
from .capture import Capture
from ..ui.screen import H, W

if TYPE_CHECKING:
    from ..app import App

SHOT_ROOT = Path("out/shots")
UNAVAILABLE = {                                # plan steps whose subject does not exist yet
    "assert_hash": "the engine state hash needs the game state (M3, M4a); state_hash records it",
}
OPTIONS = {"key": {"text", "hold"}, "keyup": set(), "click": set(), "rclick": set(), "move": set(),
           "drag": {"frames", "button"}, "press_button": set(), "shot": set(), "assert_state": set(),
           "golden": set(), "wait_dialog": {"frames"}, "state_hash": {"want"}}
CHECKS = {"shot", "assert_state", "golden", "state_hash"}
WAIT_FRAMES = 60
TEXT = {"space": " ", "return": "\r", "tab": "\t"}
BUTTONS = {"click": 1, "rclick": 3}


class ScriptError(ValueError):
    """The script file is malformed."""


class ScriptAssertion(AssertionError):
    """A check step failed."""


def read(path: str | Path) -> tuple[list[str], list[tuple[int, dict]]]:
    data = json.loads(Path(path).read_text())
    args, steps = ([], data) if isinstance(data, list) else (data.get("args", []), data.get("steps"))
    if not isinstance(steps, list) or not all(isinstance(a, str) for a in args):
        raise ScriptError(f"{path}: expected a list of steps or {{'args': [str], 'steps': [...]}}")
    out = []
    for i, st in enumerate(steps):
        if not (isinstance(st, list) and len(st) == 2 and isinstance(st[0], int) and st[0] >= 0
                and isinstance(st[1], dict)):
            raise ScriptError(f"{path} step {i}: expected [frame >= 0, {{op: value}}], got {st!r}")
        ops = [k for k in st[1] if k in OPTIONS or k in UNAVAILABLE]
        if len(ops) != 1:
            raise ScriptError(f"{path} step {i}: exactly one op of {sorted(OPTIONS)} needed, got {sorted(st[1])}")
        op = ops[0]
        if op in UNAVAILABLE:
            raise ScriptError(f"{path} step {i}: {op} not available yet: {UNAVAILABLE[op]}")
        extra = set(st[1]) - {op} - OPTIONS[op]
        if extra:
            raise ScriptError(f"{path} step {i}: unknown option(s) {sorted(extra)} for {op}")
        out.append((st[0], st[1]))
    return args, out


def key_code(name: str) -> int:
    try:
        return pygame.key.key_code(name)
    except ValueError:
        raise ScriptError(f"unknown key name {name!r} (pygame.key.name spelling)") from None


def _point(v: Any) -> tuple[int, int]:
    if not (isinstance(v, list) and len(v) == 2 and all(isinstance(c, int) for c in v)):
        raise ScriptError(f"expected [x, y] in logical px, got {v!r}")
    return v[0], v[1]


class Script:
    def __init__(self, steps: list[tuple[int, dict]], app: App, capture: Capture, enforce_golden: bool = True):
        self.app, self.capture, self.enforce_golden = app, capture, enforce_golden
        self.events: dict[int, list[tuple[int, dict]]] = defaultdict(list)    # logical px
        self.checks: dict[int, list[dict]] = defaultdict(list)
        self.waits: list[tuple[int, int, str]] = []          # (from, deadline, dialog id)
        self.results: list[dict] = []
        self._checked: set[int] = set()
        self._pos = (0, 0)
        for frame, st in sorted(steps, key=lambda s: s[0]):
            op = next(k for k in st if k in OPTIONS)
            if op in CHECKS:
                self._check_arg(op, st[op])
                self.checks[frame].append(st)
            else:
                getattr(self, f"_{op}")(frame, st)
        ends = [f for f, _ in steps] + [d for _, d, _ in self.waits]
        self.last_frame = max(ends, default=-1) + 1

    # ------------------------------------------------------------------ compile input

    def _motion(self, frame: int, pos: tuple[int, int], buttons=(0, 0, 0)) -> None:
        rel = (pos[0] - self._pos[0], pos[1] - self._pos[1])
        self.events[frame].append((pygame.MOUSEMOTION, {"pos": pos, "rel": rel, "buttons": buttons}))
        self._pos = pos

    def _button(self, frame: int, kind: int, button: int) -> None:
        self.events[frame].append((kind, {"pos": self._pos, "button": button}))

    def _key(self, frame: int, st: dict) -> None:
        name = st["key"]
        code = key_code(name)
        text = st.get("text", name if len(name) == 1 else TEXT.get(name, ""))
        self.events[frame].append((pygame.KEYDOWN, {"key": code, "unicode": text, "mod": 0, "scancode": 0}))
        if not st.get("hold"):
            self._keyup(frame, {"keyup": name})

    def _keyup(self, frame: int, st: dict) -> None:
        self.events[frame].append((pygame.KEYUP, {"key": key_code(st["keyup"]), "mod": 0, "scancode": 0}))

    def _click(self, frame: int, st: dict) -> None:
        op = "click" if "click" in st else "rclick"
        pos = _point(st[op])
        if pos != self._pos:
            self._motion(frame, pos)
        self._button(frame, pygame.MOUSEBUTTONDOWN, BUTTONS[op])
        self._button(frame, pygame.MOUSEBUTTONUP, BUTTONS[op])

    _rclick = _click

    def _press_button(self, frame: int, st: dict) -> None:
        from ..ui.widgets import kit
        id = st["press_button"]
        if not isinstance(id, int):
            raise ScriptError(f"press_button needs a BUTTON.DAT id, got {id!r}")
        try:
            _, b = kit(self.app).layouts.find_button(id)
        except KeyError:
            raise ScriptError(f"press_button: no BUTTON.DAT record with id {id}") from None
        x, y, w, h = b.rect
        self._click(frame, {"click": [x + w // 2, y + h // 2]})

    def _wait_dialog(self, frame: int, st: dict) -> None:
        name, n = st["wait_dialog"], st.get("frames", WAIT_FRAMES)
        if not (isinstance(name, str) and name and isinstance(n, int) and n >= 0):
            raise ScriptError(f"wait_dialog needs a dialog id and frames >= 0, got {name!r}, {n!r}")
        self.waits.append((frame, frame + n, name))

    def _move(self, frame: int, st: dict) -> None:
        self._motion(frame, _point(st["move"]))

    def _drag(self, frame: int, st: dict) -> None:
        v = st["drag"]
        if not (isinstance(v, list) and len(v) == 2):
            raise ScriptError(f"drag needs [[x0, y0], [x1, y1]], got {v!r}")
        (x0, y0), (x1, y1) = _point(v[0]), _point(v[1])
        n, button = st.get("frames", 1), st.get("button", 1)
        if not (isinstance(n, int) and n >= 1 and button in (1, 2, 3)):
            raise ScriptError(f"drag: frames >= 1 and button 1-3 needed, got {n!r}, {button!r}")
        held = tuple(int(b == button) for b in (1, 2, 3))
        if (x0, y0) != self._pos:
            self._motion(frame, (x0, y0))
        self._button(frame, pygame.MOUSEBUTTONDOWN, button)
        for i in range(1, n + 1):
            self._motion(frame + i, (x0 + (x1 - x0) * i // n, y0 + (y1 - y0) * i // n), held)
        self._button(frame + n, pygame.MOUSEBUTTONUP, button)

    # ------------------------------------------------------------------ checks

    @staticmethod
    def _check_arg(op: str, v: Any) -> None:
        if op == "shot":
            ok = isinstance(v, str) and v and "/" not in v
        elif op == "assert_state":
            ok = isinstance(v, dict) and v and set(v) <= {"state", "dialog"}
        elif op == "state_hash":
            ok = isinstance(v, str) and bool(v)
        else:
            ok = (isinstance(v, dict) and set(v) == {"ref", "regions", "max_mae"}
                  and isinstance(v["max_mae"], (int, float)) and isinstance(v["regions"], dict)
                  and all(isinstance(r, list) and len(r) == 4 and all(isinstance(c, int) for c in r)
                          for r in v["regions"].values()))
        if not ok:
            raise ScriptError(f"bad {op} argument {v!r} (see warlords2/debug/script.py)")

    def _shot(self, frame: int, name: str) -> None:
        self.capture.shot(self.app.screen.present_surface, name, frame)

    def _assert_state(self, frame: int, want: dict) -> None:
        top = self.app.manager.current_state().dialogs.top
        got = {"state": self.app.manager.current_state_str(), "dialog": type(top).__name__ if top else None}
        got = {k: got[k] for k in want}
        self.results.append({"frame": frame, "op": "assert_state", "want": want, "got": got, "ok": got == want})
        if got != want:
            raise ScriptAssertion(f"frame {frame}: assert_state wants {want}, got {got}")

    def _state_hash(self, frame: int, label: str, want: str | None = None) -> None:
        st = getattr(self.app.manager.current_state(), "state", None)
        got = st.hash() if st is not None else None
        ok = want is None or got == want
        self.results.append({"frame": frame, "op": "state_hash", "label": label, "hash": got,
                             "want": want, "ok": ok})
        if not ok:
            raise ScriptAssertion(f"frame {frame}: state_hash {label!r} wants {want}, got {got}")

    def _golden(self, frame: int, g: dict) -> None:
        mae = golden.compare(self.app.screen.present_surface, g["ref"], {k: tuple(r) for k, r in g["regions"].items()})
        bad = {k: v for k, v in mae.items() if v > g["max_mae"]}
        self.results.append({"frame": frame, "op": "golden", "ref": g["ref"], "max_mae": g["max_mae"],
                             "mae": mae, "ok": not bad})
        if bad and self.enforce_golden:
            raise ScriptAssertion(f"frame {frame}: golden {g['ref']} over {g['max_mae']}: {bad}")

    # ------------------------------------------------------------------ per frame

    def before_frame(self, frame: int) -> None:
        if frame > 0:
            self.after_frame(frame - 1)
        v = self.app.input.view
        for kind, d in self.events.get(frame, ()):
            d = dict(d)
            if "pos" in d:
                d["pos"] = self.app.input.window(d["pos"])
            if "rel" in d:
                d["rel"] = (d["rel"][0] * v.w // W, d["rel"][1] * v.h // H)   # unread by Input.feed
            pygame.event.post(pygame.event.Event(kind, d))

    def after_frame(self, frame: int) -> None:
        """Run the check steps of `frame` (once), on the presented frame."""
        if frame in self._checked:
            return
        self._checked.add(frame)
        for st in self.checks.get(frame, ()):
            op = next(k for k in st if k in CHECKS)
            if op == "state_hash":
                self._state_hash(frame, st[op], st.get("want"))
            else:
                getattr(self, f"_{op}")(frame, st[op])
        for w in [w for w in self.waits if w[0] <= frame]:
            start, deadline, name = w
            top = self.app.manager.current_state().dialogs.top
            got = getattr(top, "dialog_id", None)
            if got == name or frame >= deadline:
                self.waits.remove(w)
                self.results.append({"frame": frame, "op": "wait_dialog", "from": start, "want": name,
                                     "got": got, "ok": got == name})
                if got != name:
                    raise ScriptAssertion(f"frame {frame}: wait_dialog {name!r} since frame {start}, top is {got!r}")


def load(path: str | Path, app: App, capture: Capture | None = None, enforce_golden: bool = True) -> Script:
    _, steps = read(path)
    return Script(steps, app, capture or Capture(SHOT_ROOT / Path(path).stem), enforce_golden)
