"""The capture question after a human side takes a city: occupy, pillage, sack or raze.

Evidence (asm ovl31; called as ovl31:0000(DS:4148, DS:4134, owner DS:41fb, city) from ovl36:04f7
when the quest check ovl01:1ded at ovl36:04e2 returned 0; positions and the button lists are
DGROUP data read from the user's EXE):
* ovl31:0000: DS:0a3e = 1, DS:0a3a = the owner (0x0f -> SCN 0x110), DS:0a3c = the city;
  line 1 = STRING (0x42, rnd) with DS:4148 (the hero or side name, `ui.dialogs.fight.battle_names`),
  line 2 = (0x43, rnd) with DS:4134 (the city name) - both ovl59:04f0 with index -1, which
  draws ovl59:02bf(1, n, -1) on the game's dice (0x42 first); popup type 7 (DS:06a8:
  (160, 90, 320, 200), victory.pck); SetFont(1, 15, 0, 3) (0x41, 0) centred at DS:0a40;
  SetFont(2, 15, 0, 3) line 1 at DS:0a44, line 2 at DS:0a48, (0x41, 1) at DS:0a4c, (0x41, 2) at
  DS:0a50 (ovl59:00d6); screen 11 (BUTTON.DAT: 285 occupy, 283 pillage, 286 sack, 284 raze),
  DS:166a = 1.
* The Return list DS:155c (07be:0001(old, new) replaces the first `old`): 284, 283, 286 -> 285
  (occupy); with Quests on (SCN 0x11e) and an active quest (2c04:1103 + 12 p) whose hero
  (+0x1107) is DS:5e5e: type 5 with the target (+0x1109) this city -> 285 -> 284 (raze); type 6
  -> 285 -> 286 when the sack value ovl31:07d0 is not 0, else 285 -> 283 when the pillage value
  ovl31:0834 is not 0.  Esc uses DS:1514 (which holds 285).  Keys 07be:0064 with DS:166a set
  (`ui.keys`): Esc / Return press the first live button of their list; 'A'..'Z' nothing;
  every other key, Del included, the chord.  A left press on a disabled button (283 / 286
  without a value) chords (07be:0e7b); a right press over a button opens its HLP record
  (ovl15:0000; 283-286 have records; 285's title is shown as the HLP file has it, the
  pillage title on the occupy button).
* States (08a9:066e): 285 and 284 normal, 283 normal when ovl31:0834 is not 0 else disabled, 286
  the same with ovl31:07d0 (`rules.city.pillage_value` / `sack_value`).
* With the tutorial flag SCN 0x12e and DS:0a54 == 0 (once per program run): DS:0a54 = 1 and the
  page FILE.DAT (25, 10) (ovl59:0505(0x19, 0x0a), ovl61:168d) over the question.  DS:0a54 is
  a DGROUP word of the run (0 in the EXE image, never reset), so it lives on the App
  (`App.capture_tutorial_shown`), not in the game state and not in this module.
* 285 (07be:08a6 -> ovl31:03fe): ovl17:069c, ovl61:011f(0, 0, 1), DS:0a3e = 0, ovl01:1ded(4, 0,
  0, 0x4d, 0x3005); when it returns 0 (no quest done: no QuestCompleted event) ovl31:043a opens
  the city's production screen ovl45:0000(2, x, y) (M6b's dialog "production").
* 283 (08b6 -> ovl31:046b) / 286 (08ae -> 035e): the gold and the slots (ovl31:0886 / 0941),
  for a human side the result popup ovl31:0508(0 / 1), ovl61:011f(0, 0, 1), the infamy roll,
  the quest call (`rules.city.capture`).
* ovl31:0508(kind): popup type 12 (DS:06a8: (176, 60, 288, 300), marble); SetFont(1) (0x44, kind)
  centred at (0x140, 0x40); SetFont(2) (0x45, kind) with the city name at (0x140, 0x73), (0x46,
  0) with the gold DS:4114 at (0x140, 0x87), (0x47, DS:4118 != 1) with DS:4118 (the emptied
  slots) at (0x140, 0xa5), (0x48, DS:4116 != 1) with DS:4116 (pillage: filled - 1, sack: 1) at
  (0x140, 0xb9); the frames 14d0:02e5((0xb8, 0xdc, 0x110, 0x82), 4, 2) and ((0xb9, 0xdd, 0x10e,
  0x80), 2, 4); (0x44, 2) left (ovl59:00bf) at (0xc0, 0xe6), (0x44, 3) at (0x170, 0xe6); emptied
  slot i (DS:411a type, DS:410e value = |w4| / 2): ovl64:08be(type, SCN 0x110, 0xd0, 0xfa + 30 i,
  ring 1), its name (ovl44:14ac) left at (0xf8, 0x100 + 30 i), the format DS:0a66 with the value at (0x170,
  0x100 + 30 i); slots DS:4118 .. 2 get the empty icon (type -1, ring 1); ovl61:10fb(0); both
  popups close (ovl17:069c twice).
* 284 (08be -> ovl31:029f): the format DS:0a56 with the city name through ovl61:10fb
  (popup type 5, `message`), ovl64:006c, ovl32:016b, ovl17:069c, ovl61:011f(1, 1, 0), DS:0a3e =
  0, the infamy roll and the quest call (`rules.city.capture`).
Every branch ends with ovl61:011f, which redraws the map (raze) or the palette; here the map is
drawn from the state after the choice.

The two text rolls are the engine's (rules.combat.attack draws them after the quest check,
CityCaptured info "texts").
"""
from __future__ import annotations

import logging

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...model import events as E
from ...model.ids import Control
from ...rules import city as RC
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import DISABLED, NORMAL
from ..palettes import painter_for
from ..widgets import ButtonRow, is_dismiss, kit, text_centred
from . import fight as F

log = logging.getLogger(__name__)

POPUP, RESULT_POPUP, SCREEN = 7, 12, 11
PILLAGE, RAZE, OCCUPY, SACK = 283, 284, 285, 286
TITLE, VICTOR, PLACE = 0x41, 0x42, 0x43
TITLE_AT, LINES_AT = 0x0A40, (0x0A44, 0x0A48, 0x0A4C, 0x0A50)
RETURN_LIST, ESC_LIST = 0x155C, 0x1514
RUINS_FMT, GP_FMT = 0x0A56, 0x0A66
SCN_TUTORIAL = 0x12E                             # SCN 0x11e Quests: model.options
RAZE_QUEST, GOLD_QUEST = 5, 6
TUTORIAL_GROUP, TUTORIAL_PAGE = 25, 10           # ovl31:0283
PRODUCTION_OWN = 2                               # ovl31:045f
INK, SHADOW = 15, 0
# ovl31:0508
R_TITLE, R_CITY, R_GOLD, R_LOST, R_LEFT = 0x44, 0x45, 0x46, 0x47, 0x48
R_TITLE_Y, R_CITY_Y, R_GOLD_Y, R_LOST_Y, R_LEFT_Y, R_X = 0x40, 0x73, 0x87, 0xA5, 0xB9, 0x140
R_FRAMES = (((0xB8, 0xDC, 0x110, 0x82), 4, 2), ((0xB9, 0xDD, 0x10E, 0x80), 2, 4))
R_HEADS = ((2, (0xC0, 0xE6)), (3, (0x170, 0xE6)))
R_ICON_X, R_ICON_Y, R_STEP, R_NAME_X, R_TEXT_Y, R_GP_X, R_ROWS = 0xD0, 0xFA, 0x1E, 0xF8, 0x100, 0x170, 3

_return_list: list | None = None                 # DS:155c as 07be:0001 leaves it


def ds_list(exe, off: int) -> list[int]:
    out = []
    while (v := ds_words(exe, off + 2 * len(out), 1)[0]) != 0:
        out.append(v)
    return out


def replace(lst: list, old: int, new: int) -> None:
    """07be:0001(old, new)."""
    if old in lst:
        lst[lst.index(old)] = new


def bevel(fb, rect, a: int, b: int) -> None:
    """14d0:02e5(rect, a, b): top and left lines in a, right and bottom in b; a > b draws b
    first (02fc..0389), else a first (038c..0419), so the two corners take the later colour."""
    x, y, w, h = rect
    first = [(b, (x + w - 1, y, 1, h)), (b, (x, y + h - 1, w, 1))]
    second = [(a, (x, y, w, 1)), (a, (x, y, 1, h))]
    for c, r in (first + second if a > b else second + first):
        fb.fill(c, r)


def roll(state, k, group: int) -> int:
    """ovl59:052f with index -1: ovl59:02bf(1, n, -1)."""
    return state.rng.rnd(1, len(k.text.group(group)), -1)


class Capture(Dialog):
    def __init__(self, host, event, on_close=None):
        global _return_list
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        st = host.state
        info = event.info
        self.city = info["city"]
        names = list(F.battle_names(host))
        if names[0] is None:                       # no battle window filled DS:4148 / 4134
            names = [st.players[info["attacker"]].name, st.cities[self.city].name]
        texts = info["texts"]                      # ovl31:0039 / 005a, drawn by the engine
        exe = k.exe
        self.title = k.text.S(TITLE, 0)
        self.lines = [k.text.S(VICTOR, texts[0], names[0]), k.text.S(PLACE, texts[1], names[1]),
                      k.text.S(TITLE, 1), k.text.S(TITLE, 2)]
        self.title_at = ds_words(exe, TITLE_AT, 2)
        self.lines_at = [ds_words(exe, o, 2) for o in LINES_AT]
        self.pillage, self.sack = RC.pillage_value(st, self.city), RC.sack_value(st, self.city)
        self.row = ButtonRow(list(k.layouts.screen(SCREEN).buttons), k.picture)
        self.row.state[PILLAGE] = NORMAL if self.pillage else DISABLED
        self.row.state[SACK] = NORMAL if self.sack else DISABLED
        if _return_list is None:
            _return_list = ds_list(exe, RETURN_LIST)
        for old in (RAZE, PILLAGE, SACK):
            replace(_return_list, old, OCCUPY)
        q = st.players[st.current].quest
        if st.options.quests and q.active and q.hero == st.selection.hero:
            if q.type == RAZE_QUEST and q.target == self.city:
                replace(_return_list, OCCUPY, RAZE)
            elif q.type == GOLD_QUEST:
                if self.sack:
                    replace(_return_list, OCCUPY, SACK)
                elif self.pillage:
                    replace(_return_list, OCCUPY, PILLAGE)
        self.esc_list = ds_list(exe, ESC_LIST)
        self.choice: str | None = None
        self.events: list | None = None

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press, esc=self.esc_list, ret=_return_list)

    def press(self, id: int) -> None:
        st, k = self.host.state, self.k
        if id == OCCUPY:
            self.choose("occupy")
        elif id in (PILLAGE, SACK):
            kind = 0 if id == PILLAGE else 1
            lost = lost_slots(st, self.city, kind)
            n = RC.filled_slots(st.cities[self.city])
            left = n - 1 if kind == 0 else 1             # DS:4116 (ovl31:08aa / 0954)
            name = st.cities[self.city].name
            if self.choose("pillage" if kind == 0 else "sack", close=False) is None:
                return
            registry.open_dialog("capture/result", self.host, kind=kind, city=name, lost=lost,
                                 left=left, on_close=lambda _: self.close(self.choice))
        elif id == RAZE:
            text = ds_str(k.exe, RUINS_FMT).replace("%s", st.cities[self.city].name)
            registry.open_dialog("message", self.host, lines=[text],
                                 on_close=lambda _: self.choose("raze"))

    def choose(self, choice: str, close: bool = True):
        """Apply the CaptureChoice (the human phase plays its events)."""
        apply = getattr(self.host.phase, "apply", None)
        events = apply(C.CaptureChoice(choice)) if apply is not None else self.host.command(C.CaptureChoice(choice))
        if events is None:
            log.error("CaptureChoice(%r) refused", choice)
            return None
        self.choice, self.events = choice, list(events)
        if close:
            self.close(choice)
        return events

    def draw(self, fb) -> None:
        k = self.k
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *self.title_at, self.title, INK, SHADOW)
        for (x, y), s in zip(self.lines_at, self.lines):
            text_centred(fb, k.fonts[CHANCE17], x, y, s, INK, SHADOW)
        self.row.draw(fb)


def lost_slots(state, ci: int, kind: int) -> list[tuple[int, int]]:
    """(type, gold) of the slots ovl31:0886 (pillage: the last filled) / 0941 (sack: 1 .. filled
    - 1) empty, DS:411a / DS:410e."""
    c = state.cities[ci]
    n = RC.filled_slots(c)
    idx = ([n - 1] if n >= 1 else []) if kind == 0 else list(range(1, n))
    return [(c.slots[i].type, RC._slot_value(state, c.slots[i].type)) for i in idx]


class CaptureResult(Dialog):
    """ovl31:0508(kind)."""

    def __init__(self, host, kind: int, city: str, lost: list, left: int, on_close=None):
        super().__init__(on_close)
        self.host, self.kind = host, kind
        k = self.k = kit(host.app)
        st = host.state
        n = len(lost)
        T = k.text
        gold = sum(v for _, v in lost)                              # DS:4114
        self.title = T.S(R_TITLE, kind)
        self.texts = [(R_CITY_Y, T.S(R_CITY, kind, city)), (R_GOLD_Y, T.S(R_GOLD, 0, gold)),
                      (R_LOST_Y, T.S(R_LOST, int(n != 1), n)),
                      (R_LEFT_Y, T.S(R_LEFT, int(left != 1), left))]
        self.lost = lost
        self.player = st.current
        self.gp = ds_str(k.exe, GP_FMT)
        self.names = [st.army_type(t).name for t, _ in lost]
        self.painter = painter_for(host)

    def update(self, events, dt) -> None:
        if any(is_dismiss(e) for e in events):
            self.close(None)

    def draw(self, fb) -> None:
        k = self.k
        T = k.text
        k.draw_popup(fb, RESULT_POPUP)
        text_centred(fb, k.fonts[CHANCE36], R_X, R_TITLE_Y, self.title, INK, SHADOW)
        f = k.fonts[CHANCE17]
        for y, s in self.texts:
            text_centred(fb, f, R_X, y, s, INK, SHADOW)
        for rect, a, b in R_FRAMES:
            bevel(fb, rect, a, b)
        for i, at in R_HEADS:
            f.draw(fb, *at, T.S(R_TITLE, i), INK, SHADOW)
        for i in range(max(R_ROWS, len(self.lost))):
            y = R_ICON_Y + R_STEP * i
            if i < len(self.lost):
                t, v = self.lost[i]
                self.painter.army(fb, t, self.player, R_ICON_X, y, ring=1)
                f.draw(fb, R_NAME_X, R_TEXT_Y + R_STEP * i, self.names[i], INK, SHADOW)
                f.draw(fb, R_GP_X, R_TEXT_Y + R_STEP * i, self.gp.replace("%d", str(v)), INK, SHADOW)
            else:
                self.painter.army(fb, -1, self.player, R_ICON_X, y, ring=1)


@registry.dialog("capture")
def capture(host, event, on_close=None):
    return Capture(host, event, on_close)


@registry.dialog("capture/result")
def capture_result(host, kind: int, city: str, lost: list, left: int, on_close=None):
    return CaptureResult(host, kind, city, lost, left, on_close)


@registry.event_view(E.CityCaptured)
def captured(host, ev):
    st = host.state
    if st.players[ev.info["attacker"]].control != Control.HUMAN:
        return None                                 # the computer chooses in ovl19:1864 (M8b)
    d = registry.open_dialog("capture", host, event=ev)
    app = host.app
    if st.flags.get(SCN_TUTORIAL, 0) and not app.capture_tutorial_shown:      # DS:0a54
        app.capture_tutorial_shown = True
        registry.open_dialog("tutorial_page", host, index=TUTORIAL_PAGE)
    return _after(host, d)


def _after(host, d):
    while d.stack is not None:
        yield None
    anim = getattr(host.phase, "animator", None)
    if anim is not None and anim.scene is not None:
        anim.scene = host.state.copy()              # ovl61:011f
    if d.choice == "occupy" and not any(isinstance(e, E.QuestCompleted) for e in d.events or ()):
        if registry.has_dialog("production"):        # ovl31:043a
            p = registry.open_dialog("production", host, city=d.city, mode=PRODUCTION_OWN)
            while p.stack is not None:
                yield None
        else:
            log.warning("occupied city %s: production screen ovl45:0000(2, x, y) (dialog "
                        "'production', M6b) not implemented; not shown", d.city)
