"""Presentation registry (docs/plan.md section 1, registry rule).

Features that several milestones extend are wired in here by decorating functions in
the feature's own file; nobody edits another milestone's file.  `load_all()` imports
every module below `ui/dialogs/`, `ui/anim/`, `ui/info/` and `audio/` (packages that do
not exist yet are skipped), which runs those decorators.

Ids
---
Actions share one integer id space with BUTTON.DAT, HLP and UDB (docs/formats/tables.md
sections 6-8): button ids 100..496 come from BUTTON.DAT, menu entries 497..535 from the
menu action table in WARLORD2.EXE (DS:1798, 39 records of `id, menu, item, key`, read by
`ui.menubar`).  `MENU` names those 39 ids (Evidence: EXE DS:1798 rows; entry names follow
the menu position they occupy, rules.md section 9.7).  `menubar.check_menu_ids` compares
the (menu, item) of every name with the user's EXE at start-up.

Menu shortcut keys come from the EXE table (`ui.menubar`).  The keys rules.md section
9.7 lists outside the menus are not declared here: their EXE dispatch is not traced.

An action whose id has no registered callable is drawn greyed and is inert.
"""
from __future__ import annotations

import importlib
import pkgutil
from typing import Callable

# menu action ids (EXE DS:1798): name -> (id, menu number, item number)
MENU = {
    "about": (497, 0, 1),
    "settings": (498, 1, 1), "shortcuts": (499, 1, 2), "new_game": (500, 1, 3),
    "save_game": (501, 1, 4), "load_game": (502, 1, 5), "save_map": (503, 1, 6),
    "load_map": (504, 1, 7), "quit": (505, 1, 8),
    "fight_order": (506, 2, 1), "move_all": (507, 2, 2), "disband": (508, 2, 3),
    "signpost": (519, 2, 4), "resign": (509, 2, 5),
    "report_army": (510, 3, 1), "report_city": (511, 3, 2), "report_gold": (512, 3, 3),
    "report_production": (513, 3, 4), "report_winning": (514, 3, 5),
    "report_diplomacy": (515, 3, 6), "report_quest": (516, 3, 7),
    "hero_inspect": (517, 4, 1), "plant_flag": (518, 4, 2), "hero_levels": (520, 4, 3),
    "hero_search": (521, 4, 4),
    "army_bonus": (522, 5, 1), "items": (523, 5, 2), "build": (524, 5, 3),
    "cities": (525, 5, 4), "production": (526, 5, 5), "vectoring": (527, 5, 6),
    "ruins": (528, 5, 7), "stack": (529, 5, 8),
    "history_city": (530, 6, 1), "history_events": (531, 6, 2), "history_gold": (532, 6, 3),
    "history_winners": (533, 6, 4), "history_triumphs": (534, 6, 5),
    "end_turn": (535, 7, 1),
}
MENU_ID = {name: v[0] for name, v in MENU.items()}

_actions: dict[int, Callable] = {}
_dialogs: dict[str, Callable] = {}
_event_views: dict[type, list[Callable]] = {}
_event_sounds: dict[type, list[Callable]] = {}
_right_click: dict[str, Callable] = {}
_left_click: dict[str, Callable] = {}
_help_selectors: list[tuple[range, Callable]] = []
_button_decor: dict[int, Callable] = {}

PACKAGES = ("warlords2.ui.dialogs", "warlords2.ui.anim", "warlords2.ui.info", "warlords2.audio")


def _put(table: dict, key, fn: Callable, what: str) -> Callable:
    if key in table:
        raise ValueError(f"{what} {key!r} registered twice ({table[key].__module__}, {fn.__module__})")
    table[key] = fn
    return fn


def action(id: int) -> Callable:
    """Register `fn(host, **kw)` as the action of a button / menu entry / key id."""
    return lambda fn: _put(_actions, id, fn, "action")


def dialog(id: str) -> Callable:
    """Register a dialog factory `fn(host, **kw) -> Dialog` under a name."""
    return lambda fn: _put(_dialogs, id, fn, "dialog")


def event_view(cls: type) -> Callable:
    """Register `fn(host, event)` to present an engine event (several per class)."""
    def deco(fn):
        _event_views.setdefault(cls, []).append(fn)
        return fn
    return deco


def event_sound(cls: type) -> Callable:
    """Register `fn(host, event)` to play sound for an engine event (several per class)."""
    def deco(fn):
        _event_sounds.setdefault(cls, []).append(fn)
        return fn
    return deco


def right_click(kind: str) -> Callable:
    """Register `fn(host, id, pos)` for a right click on a kind of thing ('button', ...):
    `id` names the thing under the pointer, `pos` is the pointer in logical px."""
    return lambda fn: _put(_right_click, kind, fn, "right_click")


def left_click(kind: str) -> Callable:
    """Register `fn(host, square, mode)` for a left click on the map under a cursor whose
    action belongs to a later milestone (ovl46:0000, table ovl46:0316): "city" (cursor 3,
    ovl45:0000(mode, x, y), mode 2 for an own city, else 0), "site" (cursor 7, ovl45:0000:
    mode 0 when a city holds the square, else 4) and "advisor" (cursor 9, ovl36:1f19(x, y),
    mode None)."""
    return lambda fn: _put(_left_click, kind, fn, "left_click")


def help_selector(ids: range) -> Callable:
    """Register `fn(host, record, n) -> (title, text)` for HLP records whose word2 lies in
    `ids` (dynamic help, tables.md section 8: 1-4, 5-24, 33-36, 37-44, 45-71)."""
    def deco(fn):
        for r, other in _help_selectors:
            if set(r) & set(ids):
                raise ValueError(f"help selector {ids} overlaps {r} ({other.__module__})")
        _help_selectors.append((ids, fn))
        return fn
    return deco


def button_decor(id: int) -> Callable:
    """Register `fn(fb, button, state)` that draws over a button's picture."""
    return lambda fn: _put(_button_decor, id, fn, "button_decor")


# --------------------------------------------------------------------------- lookups


def has_action(id: int) -> bool:
    return id in _actions


def run_action(id: int, host, **kw):
    """Run a registered action; unregistered ids are inert (return None)."""
    fn = _actions.get(id)
    return fn(host, **kw) if fn else None


def open_dialog(id: str, host, **kw):
    """Build the named dialog, tag it with `dialog_id = id` (the script step `wait_dialog`
    looks for it) and push it on the host's dialog stack."""
    d = _dialogs[id](host, **kw)
    d.dialog_id = id
    return host.dialogs.push(d)


def has_dialog(id: str) -> bool:
    return id in _dialogs


def event_views(cls: type) -> list[Callable]:
    return list(_event_views.get(cls, ()))


def event_sounds(cls: type) -> list[Callable]:
    return list(_event_sounds.get(cls, ()))


def right_click_handler(kind: str) -> Callable | None:
    return _right_click.get(kind)


def left_click_handler(kind: str) -> Callable | None:
    return _left_click.get(kind)


def help_selector_for(word2: int) -> Callable | None:
    for r, fn in _help_selectors:
        if word2 in r:
            return fn
    return None


def decor(id: int) -> Callable | None:
    return _button_decor.get(id)


def load_all() -> list[str]:
    """Import every module of the registering packages; returns the module names."""
    names = []
    for pkg in PACKAGES:
        try:
            p = importlib.import_module(pkg)
        except ModuleNotFoundError as e:
            if e.name != pkg:
                raise
            continue
        for m in pkgutil.walk_packages(p.__path__, pkg + "."):
            importlib.import_module(m.name)
            names.append(m.name)
    return names
