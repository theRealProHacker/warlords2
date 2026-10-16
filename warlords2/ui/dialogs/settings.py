"""The Settings dialog (menu action 498, Game menu item 1): per side human / computer, Enhanced, Observe; music,
effects and speech.

Evidence (asm ovl33; button ids from the jump table 07be:0b0c, positions and strings from DGROUP,
read from the user's EXE):
* open ovl33:0000(1) (menu, 07be:02d9; ovl25:0479 opens it with 0 from the computer-turn
  interrupt, M8b1): ovl17:0000(4) popup type 4, ovl53:056a(9) screen 9 (BUTTON.DAT: 251 close,
  252 + p human, 260 + p enhanced, 268 + p observe, 276 music, 277 effects, 278 speech; no map
  areas), ovl33:0137(-1, 1) draw, DS:166a = 1, ovl33:0067 button states;
* ovl33:0067: 251 and 278 normal; 276 / 277 normal with a music / digital driver (DS:37a3 /
  37a2), else disabled; for a live side (SCN 0x137[p]) 252 + p, 260 + p, 268 + p normal (00ec
  tests a constant, so 268 + p is never disabled), for a dead side the three are removed
  (08a9:03b3);
* ovl33:0137 draw: SetFont(2, SCN 0xa0[0x110], 0xb0[0x110], 3): the column titles DS:0c0c
  right-aligned at DS:0ae4 (ovl59:0103), DS:0c11 / 0c17 / 0c20 centred at
  DS:0ae8 / 0aec / 0af0 (ovl59:00d6); per side p: SetFont(2, 0xa0[p], 0xb0[p], 3), the name
  right-aligned at DS:0af4[p]; SetFont(2, 15, 0, 3); a dead side whose name differs from DS:0c28
  (0000:4a40) gets DS:0c31 at DS:0b34[p] (ovl59:00bf, left), nothing else;
  a live side: check box at DS:0b14[p] = picture 8, source DS:0ad4[0x0d0[p] != 0] (0997:0129,
  opaque), the level name DS:0ac4[3 for a human, else 0x0c0[p]] at DS:0b34[p]; Enhanced box at
  DS:0b54[p], source [0x0f0[p] == 0]; a computer side's Observe box at DS:0b74[p], source
  [0x147[p] == 0]; then music / effects / speech boxes at DS:0bd4 / 0bd8 / 0bdc, sources
  [DS:0bee == 0], [DS:0bec == 0], [DS:26c8], labels DS:0c3b / 0c41 / 0c49 left at DS:0be0 /
  0be4 / 0be8.  Source 0 is the ticked box (the Human box of a
  human side, a set Enhanced / Observe / sound flag);
* buttons (07be:083e..0883): 252 + p -> ovl33:04cc `SetControl`, 260 + p -> 0508 `SetEnhance`,
  268 + p -> 053f `SetObserve` (rules/turn.py); 276 / 277 / 278 -> ovl33:0576(0 / 1 / 2)
  (`audio.settings.toggle`); 251 -> ovl33:0034: ovl17:069c, then from the menu ovl61:011f(0, 0)
  (DS:166a = 0, screen activation, the palette refresh ovl61:0174; no main-loop pass).
Input (DS:166a = 1; `ui.keys.popup_input`): a right press on a button its help, a left press on
a disabled one the chord (07be:0e7b); 251 is in DS:1514 and DS:155c, so Esc and Return close,
'A'..'Z' nothing, any other key the chord.
The titles are drawn once, at the open (ovl33:0137(-1, 1): SetFont with SCN 0x110's colours,
the side on turn then, e.g. the computer side whose turn ovl25:045e interrupted); a side's row
is drawn at the open and again after its toggle (ovl33:0137(p, ..) with its partial restore
ovl17:07e4), so `rows` keeps what was drawn (the loop may run on under the dialog).

Speech (ovl33:05b7, n = 2) toggles DS:26c8, which is both the speech switch of OPTIONS.SND and
the talking advisor's gate that rolls the game's dice at each human turn start (ovl58:0293): the
command `SetSpeech` (rules/turn.py) writes the engine's copy `GameState.advisor_talking`, the
file is written by `audio.settings.toggle`.

The music box (M10c): DS:0bee is the run's `MusicWords.on` (`App.music_words`, the engine's
`GameState.music`), DS:37a3 its `driver` (`--music on` and SOUND.DAT); without a driver
ovl58:0bc5 forces DS:0bee = 0 (0c32..0c45) and ovl33:0079 disables the box.  Box 276 ->
ovl33:0576(0): the command `SetMusic(not on)` (`rules.music.set_music`: the sequence stopped,
DS:0bee toggled, on -> ovl58:0000(1) with its die), then OPTIONS.SND written
(`audio.settings.toggle`, ovl33:05d8..062b); the player stops at once (155e:0782) or sounds
the new track.  A refused command (the engine's IllegalCommand) toggles nothing.  The effects
box shows DS:0bec, which `audio.settings.parse` forces without a digital driver (0c48..0c5b).
"""
from __future__ import annotations

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17
from ...model import commands as C
from ...model.ids import Control
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import DISABLED, NORMAL
from ..widgets import ButtonRow, blit_opaque, kit

POPUP, SCREEN = 4, 9
CLOSE, HUMAN, ENHANCE, OBSERVE = 251, 252, 260, 268
MUSIC_B, EFFECTS_B, SPEECH_B = 276, 277, 278
SIDES = 8
BOX_PICTURE = 8
TITLES = ((0x0AE4, 0x0C0C, "right"), (0x0AE8, 0x0C11, "centre"), (0x0AEC, 0x0C17, "centre"),
          (0x0AF0, 0x0C20, "centre"))
NAME_AT, HUMAN_AT, LEVEL_AT, ENHANCE_AT, OBSERVE_AT = 0x0AF4, 0x0B14, 0x0B34, 0x0B54, 0x0B74
BOXES, LEVELS = 0x0AD4, 0x0AC4
NOT_USED, DECEASED = 0x0C28, 0x0C31
SOUND_AT, SOUND_LABELS = (0x0BD4, 0x0BD8, 0x0BDC), ((0x0BE0, 0x0C3B), (0x0BE4, 0x0C41), (0x0BE8, 0x0C49))
SCN_INK, SCN_SHADOW = 0xA0, 0xB0
INK, SHADOW = 15, 0
HUMAN_LEVEL = 3
MUSIC, EFFECTS, SPEECH = 0, 1, 2                 # ovl33:0576 argument


def music_driver(app) -> bool:
    """DS:37a3 (ovl33:0079 enables box 276 with it)."""
    return bool(app.music_words.driver)


def _pairs(exe, off, n):
    w = ds_words(exe, off, 2 * n)
    return [(w[2 * i], w[2 * i + 1]) for i in range(n)]


class Settings(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        exe = k.exe
        self.box = k.picture(BOX_PICTURE)
        self.box_src = [ds_words(exe, BOXES + 8 * i, 4) for i in range(2)]
        self.titles = [(ds_words(exe, at, 2), ds_str(exe, s), how) for at, s, how in TITLES]
        self.at = {name: _pairs(exe, off, SIDES) for name, off in
                   (("name", NAME_AT), ("human", HUMAN_AT), ("level", LEVEL_AT),
                    ("enhance", ENHANCE_AT), ("observe", OBSERVE_AT))}
        self.levels = [ds_str(exe, o) for o in ds_words(exe, LEVELS, 2 * (HUMAN_LEVEL + 1), signed=False)[0::2]]
        self.not_used, self.deceased = ds_str(exe, NOT_USED), ds_str(exe, DECEASED)
        self.sound_at = [ds_words(exe, o, 2) for o in SOUND_AT]
        self.sound_labels = [(ds_words(exe, at, 2), ds_str(exe, s)) for at, s in SOUND_LABELS]
        self.font = k.fonts[CHANCE17]
        self.build_buttons()
        st = host.state
        f = st.flags
        cur = st.current                       # SCN 0x110 when ovl33:0137(-1, 1) draws the titles
        self.title_colours = (f.get(SCN_INK + 2 * cur, 0), f.get(SCN_SHADOW + 2 * cur, 0))
        self.rows = [self.row_of(st, p) for p in range(SIDES)]
        self.sound = self.sound_of()

    def row_of(self, st, p: int) -> tuple:
        """What ovl33:0137 draws of side p's row (kept until that row is drawn again)."""
        pl, f = st.players[p], st.flags
        return (pl.name, f.get(SCN_INK + 2 * p, 0), f.get(SCN_SHADOW + 2 * p, 0), bool(pl.alive),
                pl.control == Control.HUMAN, pl.level, bool(pl.enhanced), bool(pl.shown))

    def sound_of(self) -> tuple:
        from ...audio import audio
        app = self.host.app
        s = audio(app).settings
        return (bool(app.music_words.on), s.effects, s.speech)        # DS:0bee

    # ovl33:0067
    def build_buttons(self) -> None:
        from ...audio import audio
        st = self.host.state
        layout = self.k.layouts.screen(SCREEN)
        a = audio(self.host.app)
        live = {CLOSE, MUSIC_B, EFFECTS_B, SPEECH_B}
        for p in range(SIDES):
            if st.players[p].alive:
                live |= {HUMAN + p, ENHANCE + p, OBSERVE + p}
        self.row = ButtonRow([b for b in layout.buttons if b.id in live], self.k.picture)
        # DS:37a3; with a question pending the engine refuses SetMusic (not in rules.engine.ANYTIME:
        # whether menu 498 is live under those pop-ups is not established), so the box is off then
        live = music_driver(self.host.app) and st.pending is None
        self.row.state[MUSIC_B] = NORMAL if live else DISABLED
        self.row.state[EFFECTS_B] = NORMAL if a.mixer.available else DISABLED  # DS:37a2

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> None:
        """07be:0836..0883."""
        from ...audio import settings as AS
        g = self.host
        st = g.state
        if id == CLOSE:
            self.close(None)
        elif HUMAN <= id < HUMAN + SIDES:
            p = id - HUMAN
            ctl = Control.HUMAN if st.players[p].control != Control.HUMAN else Control.COMPUTER
            g.command(C.SetControl(p, int(ctl)))
            self.rows[p] = self.row_of(st, p)                                 # ovl33:0137(p, 1)
        elif ENHANCE <= id < ENHANCE + SIDES:
            p = id - ENHANCE
            g.command(C.SetEnhance(p, not st.players[p].enhanced))
            self.rows[p] = self.row_of(st, p)                                 # ovl33:0137(p, 0)
        elif OBSERVE <= id < OBSERVE + SIDES:
            p = id - OBSERVE
            g.command(C.SetObserve(p, not st.players[p].shown))
            self.rows[p] = self.row_of(st, p)                                 # ovl33:0137(p, 0)
        elif id == MUSIC_B:
            self.music()
        elif id in (EFFECTS_B, SPEECH_B):
            s = AS.toggle(g.app, {EFFECTS_B: EFFECTS, SPEECH_B: SPEECH}[id])
            if id == SPEECH_B:
                g.command(C.SetSpeech(bool(s.speech)))                       # DS:26c8 == 0
            self.sound = self.sound_of()

    def music(self) -> None:
        """ovl33:0576(0): SetMusic with the switch toggled; OPTIONS.SND; the player."""
        from ...audio import audio, music_triggers
        from ...audio import settings as AS
        g = self.host
        app = g.app
        words = app.music_words
        if self.row.state[MUSIC_B] != NORMAL:    # disabled (ovl33:0079; a pending question)
            return
        on = not words.on
        events = g.command(C.SetMusic(on))
        if events is None:                       # refused: nothing toggled
            return
        audio(app).settings.music = not on       # the file's digit follows DS:0bee
        AS.toggle(app, MUSIC)
        p = music_triggers.player(app)
        p.stop("settings")                       # 155e:0782: stopped either way
        p.events(events)                         # on: ovl58:0000(1)
        self.sound = self.sound_of()

    # ovl33:0137
    def text(self, fb, x, y, s, how, ink, shadow) -> None:
        w = self.font.width(s)
        dx = {"left": 0, "right": w, "centre": int(w / 2)}[how]
        self.font.draw(fb, x - dx, y, s, ink, shadow)

    def tick(self, fb, at, ticked: bool) -> None:
        blit_opaque(fb, self.box, at, self.box_src[0 if ticked else 1])

    def draw(self, fb) -> None:
        self.k.draw_popup(fb, POPUP)
        for (x, y), s, how in self.titles:
            self.text(fb, x, y, s, how, *self.title_colours)
        for p, (name, ink, shadow, alive, human, level, enhanced, shown) in enumerate(self.rows):
            self.text(fb, *self.at["name"][p], name, "right", ink, shadow)
            if not alive:
                if name != self.not_used:
                    self.text(fb, *self.at["level"][p], self.deceased, "left", INK, SHADOW)
                continue
            self.tick(fb, self.at["human"][p], human)
            self.text(fb, *self.at["level"][p], self.levels[HUMAN_LEVEL if human else level], "left", INK, SHADOW)
            self.tick(fb, self.at["enhance"][p], enhanced)
            if not human:
                self.tick(fb, self.at["observe"][p], shown)
        for at, on in zip(self.sound_at, self.sound):
            self.tick(fb, at, on)
        for (x, y), label in self.sound_labels:
            self.text(fb, x, y, label, "left", INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("settings")
def settings(host, on_close=None):
    return Settings(host, on_close)


@registry.action(registry.MENU_ID["settings"])
def open_settings(host):
    """07be:02d9 -> ovl33:0000(1)."""
    if getattr(host, "state", None) is None:
        return None
    return registry.open_dialog("settings", host, on_close=lambda _: host.settings_closed())
