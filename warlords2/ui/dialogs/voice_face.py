"""The talking advisor face (the horned helmet of SHOT 01).

Evidence (register X19): the only user of VOICE.PCK (picture 50) is the speech routine
ovl58:026f(n).  It returns at once when DS:26c8 (no talking advisor, the 'v' switch /
OPTIONS.SND digit 2) is set; otherwise it saves the screen under the face, blits
VOICE.PCK masked (0997:027e) from (0, 0, 352, 442) to (152, 15) (locals set at
ovl58:0277..0289), starts the speech sample of case n (jump table ovl58:0b17; n = 2 ->
FILE.DAT (59, 0) at ovl58:0838, n = 1 -> (61, 0) at ovl58:08b0; with no digital driver
(DS:37a4 = 0) the caption file (59, 1) / (61, 1) through ovl58:0d01 instead), and loops
while the sample plays (155e:075a).  Inside the loop VOICEBIT.PCK (picture 51, the eye
area) rectangles (0, 47), (0, 94), (0, 47), (0, 0), each 160x47, are copied to (232, 261)
with 2-tick waits (ovl59:0000(2)) whenever a counter, started at rnd(1, 30, 10) (one roll
per call, ovl58:094c) and advanced once per 1-tick wait, passes 40; after a blink it
restarts at 0 (ovl58:097d) without a roll.  When the sample ends the saved screen is put
back.  The Game Start screen calls it with n = 2 on every entry that draws the screen
(ovl60:0000(1)); Begin on the Game Setup screen with n = 1 (ovl57:0e2e); Begin on Game
Start with the random map with n = 0 (ovl60:0621); Quit with n = 4 (ovl49:0072).

The timing, the sample or captions and the blink are `audio.voice.Speech` (M10a); this
dialog steps it once per frame and draws what it says.  A caption line is drawn in
SetFont(2, 15, 0, 3) centred at (312, 408) (ovl58:0e36..0ecc, ovl59:00d6); the EXE first
restores the screen under the previous line, which here is not drawing it.  SHOT 01 is
this face during a blink: its eye area matches VOICEBIT (0, 94) (mean error 0.40;
(0, 0) 12.7, (0, 47) 9.4).

Input: only the caption wait reads any.  Each caption line waits in ovl59:015e (called at
ovl58:0ea6), which ends on 11b5:0003 with mask 0xd4: a left or right release or a key
(`widgets.is_dismiss`), never a press; 11b5:010a makes these events from the live button
state against DS:353e, and 11b5:0065 drops the events outside the mask (the press) as it
scans.  So the face goes with the button already up, and the screen under it never sees the
click.  The sample loop (ovl58:0944..0a99: ovl59:0000 tick waits, 155e:075a / 0736) reads no
input, so a sample is never cut short."""
from __future__ import annotations

import pygame

from ...assets.fonts import CHANCE17
from ...assets.store import cache_load
from ...audio import voice
from .. import registry
from ..dialog import Dialog
from ..widgets import is_dismiss, kit, text_centred

VOICE, VOICEBIT = 50, 51
FACE_SRC, FACE_AT = (0, 0, 352, 442), (152, 15)
FRAME_AT, FRAMES = (232, 261), ((0, 47, 160, 47), (0, 94, 160, 47), (0, 47, 160, 47), (0, 0, 160, 47))
CAPTION_INK, CAPTION_SHADOW = 15, 0         # SetFont(2, 15, 0, 3), drawn transparent


class VoiceFace(Dialog):
    event_loop = False                 # ovl58:026f: the face's own ovl59:0000 loop
    def __init__(self, k, speech: voice.Speech, on_close=None):
        super().__init__(on_close)
        self.kit, self.speech = k, speech
        cache_load(k, VOICE)                     # ovl58:081e 027e (X44)

    def update(self, events, dt) -> None:
        if not self.speech.step(any(is_dismiss(e) for e in events)):     # ovl59:015e mask 0xd4
            self.close(None)
        if self.speech.eye is not None:
            cache_load(self.kit, VOICEBIT)       # ovl58:09b0 / 09f1 / 0a32 / 0a70 0129 (X44)

    def draw(self, fb: pygame.Surface) -> None:
        fb.blit(self.kit.picture(VOICE), FACE_AT, FACE_SRC)
        eye = self.speech.eye
        if eye is not None:
            pic = self.kit.picture(VOICEBIT)
            key = pic.get_colorkey()
            pic.set_colorkey(None)               # 0997:0129: opaque copy
            fb.blit(pic, FRAME_AT, FRAMES[eye])
            if key is not None:
                pic.set_colorkey(key)
        if self.speech.caption is not None:
            text_centred(fb, self.kit.fonts[CHANCE17], *voice.CAPTION_AT, self.speech.caption,
                         CAPTION_INK, CAPTION_SHADOW)


@registry.dialog("voice_face")
def voice_face(host, speech: int, blink: int, file: tuple[int, int] | None = None, on_close=None):
    """ovl58:026f(speech) with the face's rnd(1, 30, 10) `blink` (`audio.voice.speak`)."""
    return VoiceFace(kit(host.app), voice.speak(host.app, speech, blink, file=file), on_close)
