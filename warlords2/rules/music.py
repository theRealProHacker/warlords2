"""The music call ovl58:0000(mode) and the Settings music switch ovl33:0576(0) (docs/plan.md
M10c; EL §9.8 addition "Music"; register X32 closed as model O1).

ovl58:0000 is engine work because a random track rolls the game's dice (ovl59:052f
rnd(1, n, -1) for a negative FILE.DAT index, and mode 2's rnd(1, 100, 0)) in the one stream,
and because DS:2632 (the last mode) decides whether a later call rolls.  Its words are the
program run's (`model.music.MusicWords`, `GameState.music`): outside the dump and the hash.

    0007  DS:0bee == 0 (music off)         -> return (no die, DS:2632 not written)
    0011  mode == DS:2632 and 155e:04a8()  -> return (still playing: no die)
    0028  DS:2632 = mode
    002c  155e:04a8() -> 155e:0466 stop
    003f  (group, index) by mode; mode 2: 0096..011d; 0046 ovl59:0505(group, index) [052f die
          when index < 0], ovl59:0505(7, 0); 155e:032f load; 155e:0412(0, repeat flag)

155e:04a8 asks MIDPAK whether the sequence still plays: a wall-clock answer.  `still_playing`
is that seam; model O1 (user decision, X32): "started and not stopped since" - stopped only by
the Settings switch (and Quit, which ends the program).  It differs from the EXE only for a
same-mode call after the EXE's sequence has ended unpolled (mode 2 after a computer phase
longer than the track; a looping track ending inside a modal wait); the player then restarts
the same track without a die (audio only).

Events: MusicStarted {mode, group, index, loop, site} when a sequence starts: `group`, `index`
the FILE.DAT entry of the track name (index resolved), `loop` the repeat flag (1 for every mode
but 2), `site` the caller's EXE address.  Nothing when the call returns early.  A call on a
runner thread is seen by the player through `MusicWords.starts` / `track` at the next present
point (21d4 is followed by "side").
"""
from __future__ import annotations

from ..model import commands as C
from ..model import events as E
from ..model.ids import Control
from ..model.music import MusicWords
from .constants import music as K
from .engine import IllegalCommand


def still_playing(words: MusicWords) -> bool:
    """155e:04a8 under register X32 model O1: the sequence registered by the last start has not
    been stopped since (the playing flag), and a music driver is loaded.
    Evidence: asm res_155e:04a8..04b2 (DS:37a3 == 0 -> 0; else MIDPAK INT 66h 0x70c), 0412
    (DS:379e = seq), 0466 (DS:379e = -1, DS:37a9 = 0); user decision O1 (plan X32)."""
    return bool(words.driver and words.playing)


def stop(words: MusicWords) -> None:
    """155e:0466: stop the sequence (MIDPAK stop), DS:379e = -1, DS:37a9 = 0; nothing without a
    music driver.  The host calls it at Quit (0a4c:02b5 -> 155e:02a0) if it keeps the words.
    Evidence: asm res_155e:0466..048b (0466 DS:37a3 test, 046e 0000:0c8b, 047f / 0485)."""
    if words.driver:
        words.playing, words.loop = 0, 0


def _live_human(state) -> bool:
    return any(p.alive and p.control == Control.HUMAN for p in state.players[:8])


def _pick(mode: int, live_human, roll) -> tuple[int, int]:
    """(group, index) of ovl58:003f..011d with the index resolved (ovl59:052f)."""
    if mode == K.MODE2.value:
        if live_human():
            group = K.MODE2_HUMAN_GROUP.value
        else:
            r = roll(*K.MODE2_ROLL.value)
            (low, g_low), (high, g_high) = K.MODE2_LOW.value, K.MODE2_HIGH.value
            group = g_low if r < low else g_high if r >= high else K.MODE2_MID_GROUP.value
        index = -1
    else:
        group, index = K.TRACKS.value[mode]
    if index < 0:
        n = K.GROUP_SIZES.value[group]
        index = min(roll(1, n, K.PICK_ADD.value), n - 1)
    return group, index


# Observers of every ovl58:0000 call (the host's music log, audio.music_triggers): callables
# f(words, mode, site, outcome, dice) with outcome "off" (0007), "same" (0011), "silent" (no
# driver: 155e:032f / 0412 do nothing) or "play", and dice the [dice, sides, add, value] of the
# call's rolls.  Empty unless a host registers one; they observe only, nothing they return is used.
OBSERVERS: list = []


def start(words: MusicWords, mode: int, site: str, roll=None, live_human=None) -> list:
    """ovl58:0000(mode) on the run's music words.  `roll(dice, sides, add)` is the game's roller
    (`state.rng.rnd`), `live_human()` mode 2's side scan; `play` passes both.  Without them (the
    pre-game screens, which have no game: modes 0 at ovl60:00fb / ovl57:003a and 11 at
    ovl57:0e24) only modes with a fixed FILE.DAT entry are possible; a mode that would draw a
    die raises ValueError.  Returns [MusicStarted] or [].
    Evidence: raw ovl58:0000..017f (file offset 0x73b40): 0007 DS:0bee, 0011 DS:2632, 0017
    155e:04a8, 0028 DS:2632 = mode, 002c..003a 04a8 / 0466, 003f..017b the mode table
    (rules.constants.music), 0046 / 00fc ovl59:0505, 005d / 0113 155e:032f, 0065 / 011b the
    repeat flag, 0069 155e:0412; res_155e:0412 (no driver -> nothing)."""
    if not OBSERVERS:
        return _start(words, mode, site, roll, live_human)[0]
    dice = []
    rolled = None
    if roll is not None:
        def rolled(n, sides, add):
            v = roll(n, sides, add)
            dice.append([n, sides, add, v])
            return v
    events, outcome = _start(words, mode, site, rolled, live_human)
    for f in list(OBSERVERS):
        f(words, mode, site, outcome, dice)
    return events


def _start(words, mode, site, roll, live_human) -> tuple[list, str]:
    if not isinstance(mode, int) or isinstance(mode, bool):
        raise ValueError("music mode %r" % (mode,))
    if not words.on:                                     # 0007
        return [], "off"
    if mode == words.mode and still_playing(words):      # 0011..0020
        return [], "same"
    if not 0 <= mode < K.MODES.value:
        raise ValueError("music mode %d has no caller (ovl58:017e)" % mode)
    if roll is None and (mode == K.MODE2.value or K.TRACKS.value[mode][1] < 0):
        raise ValueError("music mode %d draws a die: call rules.music.play with the game" % mode)
    words.mode = mode                                   # 0028
    if still_playing(words):                             # 002c..003a
        stop(words)
    group, index = _pick(mode, live_human, roll)         # 003f..0046, 00fc (ovl59:052f)
    if not words.driver:                                 # 155e:032f / 0412 do nothing
        return [], "silent"
    loop = K.MODE2_LOOP_FLAG.value if mode == K.MODE2.value else K.LOOP_FLAG.value
    words.playing, words.loop, words.track = 1, loop, (group, index)
    words.starts += 1
    return [E.MusicStarted({"mode": mode, "group": group, "index": index, "loop": loop, "site": site})], "play"


def play(state, mode: int, site: str) -> list:
    """ovl58:0000(mode) from a game: `start` on `state.music` with the game's dice
    (`state.rng.rnd`) and mode 2's scan for a live human side (SCN 0x137[p] != 0 and
    0x0d0[p] == 0, p < 8).  `site` is the caller's address (e.g. "ovl61:21d4").
    Evidence: raw ovl58:0096..00c9 (cx = 1; the scan; cx = 0 with a live human), ovl59:02bf
    (state.rng, EL §2); the callers listed in rules.constants.music."""
    return start(state.music, mode, site, state.rng.rnd, lambda: _live_human(state))


def set_music(state, cmd: C.SetMusic) -> list:
    """The Settings music box 276: the sequence stopped (155e:0782, then 0775 loads the driver
    flag again), DS:0bee = the new value, and when it is on, ovl58:0000(1) (which then always
    starts and rolls: the stop cleared the playing flag, whatever DS:2632 holds).  Disabled
    without a music driver (ovl33:0079: DS:37a3 == 0 -> the box is not enabled).  The button
    toggles (058e..0596 DS:0bee = !DS:0bee): `cmd.on` must be the opposite of the switch, and
    a value equal to it is refused (no click of the EXE sets the switch to what it is; on ->
    on would roll a die no EXE run draws).  Not legal while a question is pending (not in
    `rules.engine.ANYTIME`): the pending questions are modal pop-ups (DS:166a set: hero offer
    ovl47:0d70, victory ovl61:1fcd, surrender offer 1f70, sage ovl34:155a, ...), and the
    command loop 07be:0064 skips the menu keys while DS:166a is set (00a9), so Settings (menu
    498) does not open under them.  OPTIONS.SND is written by the dialog.
    Evidence: asm 07be -> ovl33:0576(0): 0584 155e:0782 (res_155e:0782..079a: DS:37a6 == 0 ->
    04a8 / 0466, DS:37a3 = 0), 0589 155e:0775 (DS:37a3 = 1), 058e..0596 DS:0bee = !DS:0bee,
    0599..05a2 on -> ovl58:0000(1); ovl33:0079 (the box gate)."""
    w = state.music
    if not w.driver:
        raise IllegalCommand("SetMusic: no music driver (the box is disabled)")
    if bool(cmd.on) == bool(w.on):
        raise IllegalCommand("SetMusic: the box toggles; the music is %s already" % ("on" if w.on else "off"))
    stop(w)
    w.on = int(bool(cmd.on))
    if w.on:
        return play(state, K.SETTINGS_MODE.value, "ovl33:05a0")
    return []
