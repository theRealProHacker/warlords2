"""ovl21:084d / 0d7b and ovl25:0519 (ai.md §4.1, EL §6.8): the AI blocks at Begin and when a
game is loaded before any Begin.

The card (`CARDS\\<K|L|W><nnn>.CRD`, 103 bytes) is read by ovl48:006a from the game directory
each time 0d7b runs for a computer side.  The engine reads no files: the caller hands in
`cards(level, number) -> bytes` (`card_reader(gd)` builds one from a `formats.gamedir.GameDir`).
A card that does not open leaves the original's stack buffer uninitialised (ovl48:006a skips
the read when 070b:0006 fails, 0091), so the reader must raise rather than invent bytes.
"""
from __future__ import annotations

import struct

from ..model.ids import Control
from ..rules.constants import setup as KS

CARD_SIZE = 0x67                          # ovl48:006a reads 0x67 bytes (push 0x67 at 0093)
FIGHT_ORDER_OFF, FIGHT_ORDER_LEN = 0x0E, 0x1D   # card +0x0e..+0x2a -> 2c04:060b + 29p (0d7b 10d3..10ef)
LETTERS_DS, FORMAT_DS, EXT_DS = 0x2616, 0x261A, 0x262A   # "KLW", "CARDS\%c%03d.%s", "CRD" (ovl57:21c1)

# ovl21:0d7b defaults per personality 0 / 1 / 2 (asm 0da0..0f9e): (word offset, value) in the
# order written; ("rnd", off, sides) is rnd(1, sides, 0) stored at off; ("or", off, v) ORs.
_DEFAULTS = {
    0: [(0x0a, 30), (0x48, 1), ("rnd", 0x18, 4), ("rnd", 0x1e, 4), ("rnd", 0x1a, 4), (0x24a, 1),
        (0x38, 0), (0x10, 3), (0x12, 3), (0x26, 0), (0x28, 0), (0x2a, 0), (0x2c, 0), (0x2e, 0),
        (0x30, 0), (0x32, 0), (0x34, 0), (0x36, 0), (0x42, 0), (0x44, 80)],
    1: [(0x0a, 20), (0x48, 0), ("rnd", 0x18, 4), ("rnd", 0x1e, 4), ("rnd", 0x1c, 8), ("or", 0x0c, 1),
        (0x38, 0), (0x24a, 2), (0x10, 6), (0x12, 18), (0x26, 5), (0x28, 10), (0x2a, 20), (0x2c, 1),
        (0x2e, 5), (0x34, 0), (0x32, 0), (0x30, 0), (0x36, 0), (0x42, 0), (0x44, 35)],
    2: [(0x0a, 10), (0x48, 0), ("rnd", 0x18, 10), ("rnd", 0x1a, 8), ("rnd", 0x1c, 6), (0x24a, 4),
        (0x38, 1), ("or", 0x0c, 1), (0x10, 7), (0x12, 0), (0x26, 5), (0x28, 10), (0x2a, 20),
        (0x2c, 5), (0x2e, 50), (0x34, 0), (0x32, 0), (0x30, 0), (0x36, 50), (0x42, 1), (0x44, 35)],
}

# AI word offset -> AiBlock field (ai.md §3.1)
_WORD = {0x0a: "rebuild_quota", 0x0c: "flags", 0x10: "buy_low", 0x12: "buy_high",
         0x18: "enemy_bonus_human", 0x1a: "enemy_bonus_l1", 0x1c: "enemy_bonus_l0",
         0x1e: "enemy_bonus_l2", 0x26: "tf_odds_1", 0x28: "tf_odds_2", 0x2a: "tf_odds_4",
         0x2c: "tf_city_mult", 0x2e: "tf_bonus_human", 0x30: "tf_bonus_l2", 0x32: "tf_bonus_l1",
         0x34: "tf_bonus_l0", 0x36: "tf_bonus_poor", 0x38: "solidarity", 0x42: "plunder_early",
         0x44: "leader_share", 0x48: "no_quick_attack", 0x24a: "n_task_forces"}

# ovl21:0d7b card part (asm 0fda..10b2): the four die sizes in draw order, then the copies
# (card word offset -> AI word offset) in the order written.
_CARD_DICE = ((0x55, 0x18), (0x59, 0x1a), (0x57, 0x1c), (0x5b, 0x1e))
_CARD_COPIES = ((0x08, 0x24a), (0x65, 0x38), (0x2b, 0x48), (0x2d, 0x10), (0x2f, 0x12), (0x31, 0x0a),
                (0x45, 0x26), (0x47, 0x28), (0x49, 0x2a), (0x4b, 0x2c), (0x4d, 0x2e), (0x53, 0x30),
                (0x51, 0x32), (0x4f, 0x34), (0x5f, 0x36), (0x61, 0x42))
CARD_FLAG_WORD = 0x0a                     # card word +0x0a != 0 -> AI[+0x0c] |= 1 (1045..104b)
CARD_SHARE_WORD = 0x63                    # AI[+0x44] = word +0x63 * 10 + rnd(1,10,0) (10b6..10cf)
SHARE_MUL, SHARE_DIE = 10, 10


def _s16(v: int) -> int:
    return ((v + 0x8000) & 0xFFFF) - 0x8000


def _card_word(card: bytes, off: int) -> int:
    return struct.unpack_from("<h", card, off)[0]


def _ds_str(exe: bytes, off: int) -> str:
    o = KS.DGROUP_FILE_OFFSET.value + off
    return exe[o:exe.index(b"\0", o)].decode("cp437")


def card_name(exe: bytes, level: int, number: int) -> str:
    """The file ovl48:006a opens for a side: sprintf(DS:261a, DS:2616[level], number, DS:262a).
    Evidence: asm ovl48:006a..0077 -> ovl57:21c1(p, 1, DS:5c38): letter = byte DS:2616 + SCN
    0x0c0[p] ("KLW"), number = SCN 0x0e0[p], extension DS:262a (flag 1) ("CRD")."""
    letters = _ds_str(exe, LETTERS_DS)
    if not 0 <= level < len(letters):
        raise ValueError("level %d has no card letter (DS:2616)" % level)
    return (_ds_str(exe, FORMAT_DS).replace("%c", letters[level]).replace("%03d", "%03d" % number)
            .replace("%s", _ds_str(exe, EXT_DS)))


def card_reader(gd):
    """`cards(level, number) -> bytes` reading the card files of the game directory `gd`
    (formats.gamedir.GameDir).
    Evidence: ovl48:006a (070b:0006 open, 070b:006d read 0x67 bytes, 070b:003a close)."""
    from ..formats.gamedir import EXE_NAME
    exe = gd.read(EXE_NAME)

    def read(level: int, number: int) -> bytes:
        return gd.read(card_name(exe, level, number).replace("\\", "/"))
    return read


def personality(state, p: int) -> int:
    """The personality ovl21:084d passes to 0d7b: the level (SCN 0x0c0[p]) for a computer side
    (SCN 0x0d0[p] != 0) at level 0 or 1, else 2 (every human, every level-2 computer).
    Evidence: asm ovl21:0935..096a."""
    pl = state.players[p]
    if pl.control != Control.HUMAN and pl.level in (0, 1):
        return pl.level
    return 2


def _set(b, off: int, v: int) -> None:
    setattr(b, _WORD[off], _s16(v))


def apply_card(state, p: int, personality: int, cards) -> None:
    """ovl21:0d7b(personality, p) on side p's block: the defaults of the personality (three
    rnd(1, n, 0) draws each), then, only for a live (SCN 0x137[p] != 0) computer side (SCN
    0x0d0[p] == 1), the card: four rnd(1, card word, 0) draws (+0x55 -> +0x18, +0x59 -> +0x1a,
    +0x57 -> +0x1c, +0x5b -> +0x1e), the word copies, AI[+0x0c] |= 1 when card word +0x0a != 0
    (an OR: personalities 1 and 2 keep the default bit), AI[+0x44] = card word +0x63 * 10 +
    rnd(1, 10, 0), and the 29 fight-order bytes card +0x0e.. into SCN 0x60b + 29p.  All card
    fields are little-endian 16-bit words at the (odd) offsets the listing reads.
    Evidence: asm ovl21:0d7b..10f4 (0d83 di = p, 0d86 personality; defaults 0da0..0f9e: 0 ->
    0da0, 1 -> 0e4d, 2 -> 0ef5, +0x44 = 0x50 at 0e44 for 0 and 0x23 at 0f9e for 1 and 2;
    0fad 0x137, 0fc1 0x0d0 == 1; 0fd2 ovl48:006a(p, bp-0x68); dice 0fdc..102e; copies
    1036..10b2; 10b6..10cf +0x44; 10d3..10ef fight order)."""
    b = state.ai[p]
    rnd = state.rng.rnd
    for step in _DEFAULTS.get(personality, ()):
        if step[0] == "rnd":
            _set(b, step[1], rnd(1, step[2], 0))
        elif step[0] == "or":
            _set(b, step[1], getattr(b, _WORD[step[1]]) | step[2])
        else:
            _set(b, step[0], step[1])
    pl = state.players[p]
    if not pl.alive or pl.control != Control.COMPUTER:
        return
    card = bytes(cards(pl.level, pl.card))
    if len(card) < CARD_SIZE:
        raise ValueError("card %d/%d: %d bytes, ovl48:006a reads %d" % (pl.level, pl.card, len(card), CARD_SIZE))
    for c_off, a_off in _CARD_DICE:
        _set(b, a_off, rnd(1, _card_word(card, c_off), 0))
    for c_off, a_off in _CARD_COPIES:
        _set(b, a_off, _card_word(card, c_off))
    if _card_word(card, CARD_FLAG_WORD) != 0:
        b.flags = _s16(b.flags | 1)
    r = rnd(1, SHARE_DIE, 0)
    _set(b, 0x44, _card_word(card, CARD_SHARE_WORD) * SHARE_MUL + r)
    state.fight_order[p] = list(card[FIGHT_ORDER_OFF:FIGHT_ORDER_OFF + FIGHT_ORDER_LEN])


def init_block(state, p: int, cards) -> None:
    """ovl21:084d(p): side p's block at Begin.  Words +0x4a, +0x00, +0x22, +0x24, +0x0c, +0x16,
    +0x18..+0x1e, +0x4c, +0x26..+0x36 = 0, +0x20 = 10; for the cities count-1..0: role = 4
    with Quick Start else 0, age = 0, flags = 1 with Hidden Map else 0 (bytes past the city
    count are not touched); then 0d7b(personality, p) (`apply_card`); task forces 3..0: word
    +0 = 0; battle memory: all seven rows of index 7..0 = 0.
    Evidence: asm ovl21:084d..09ce (0857..08ce words, 08d9..0933 city loop on SCN 0x157b,
    0935..096e personality and 0d7b, 0974..0990 TF ages, 0992..09cb memory incl. +0x41c)."""
    b = state.ai[p]
    for name in ("quest_battles", "turns_with_cities", "w22", "explorers", "flags",
                 "slots_bought", "enemy_bonus_human", "enemy_bonus_l1", "enemy_bonus_l0",
                 "enemy_bonus_l2", "item_handovers", "tf_odds_1", "tf_odds_2", "tf_odds_4",
                 "tf_city_mult", "tf_bonus_human", "tf_bonus_l2", "tf_bonus_l1", "tf_bonus_l0",
                 "tf_bonus_poor"):
        setattr(b, name, 0)
    b.simulations = 10
    quick, hidden = bool(state.options.quick_start), bool(state.options.hidden_map)
    for c in range(len(state.cities) - 1, -1, -1):
        b.role[c] = 4 if quick else 0
        b.age[c] = 0
        b.city_flags[c] = 1 if hidden else 0
    apply_card(state, p, personality(state, p), cards)
    for k in range(len(b.task_forces) - 1, -1, -1):
        b.task_forces[k].age = 0
    for row in b.memory:
        for a in range(len(row) - 1, -1, -1):
            row[a] = 0


def setup_all(state, cards) -> None:
    """ovl25:0519: allocate the blocks if needed (ovl25:04c5(0)), then ovl21:084d(p) for p =
    7..0 (`init_block`), each with its block locked into DS:40ee, which keeps block 0 after
    the loop (`AiState.locked` = 0).  rnd per side: the personality's 3 default draws, then for
    a live computer side the card's 5 (ai.md §4.1).  Called by rules.setup at Begin (HOOKS
    ai_setup).
    Evidence: asm ovl25:0519..056b (051d DS:0832, 052b..0567 p = 7..0: 053a lock, 0542 / 0546
    DS:40ee, 054a 084d, 055a unlock);
    ovl25:04c5 (04c9 DS:0832 = 1)."""
    for p in range(len(state.ai) - 1, -1, -1):
        state.ai.locked = p                       # 0542 / 0546: DS:40ee = block p
        init_block(state, p, cards)
    state.ai.allocated = 1


def load_draws(state, cards, process=None, run_allocated: bool | None = None) -> None:
    """The AI part of loading a saved game (the load ovl49:0414 -> ovl29:0dff at 08a4), to run
    after the saved state is in place (`rules.saveload.load` calls it as its `ai_read`).  (The
    save is ovl49:0a46 -> ovl29:0da9; 0dff reads with 070b:006d, 0da9 writes with 004e.)  `process` is the run's `model.ai.AiProcess` (None: a fresh run); it
    becomes the state's (`AiState.attach`, the blocks stay the file's).  In the original the
    first ovl25:056c of 0dff finds DS:0832 == 0 when no Begin, no New Game and no load happened
    before in this run of the program and runs ovl25:04c5(1) -> 0519 -> 084d / 0d7b for p = 7..0 on the
    loaded SCN (its 0x0d0, 0x0c0, 0x0e0, 0x137 and city count), with their rnd draws, before
    the file's blocks overwrite the blocks; 0519 leaves DS:40ee on block 0.  In a run that
    had a game before, nothing is drawn and DS:40ee, DS:40f2 and the raze result keep that
    game's values.  The neighbour table and the saved blocks stay as loaded; the fight-order
    rows 0d7b copied from the cards into the SCN image (already read at ovl49:063c) stay
    copied.  The path-cache clear 0555:0350 at the end of 0dff is the caller's
    (`rules.saveload.load`).  `run_allocated` (older callers) overrides `process.allocated`.
    Evidence: asm ovl29:0dff..0e59 (0e0f ovl25:056c(0) first, 0e21 / 0e44 070b:006d reads,
    0e51 0555:0350), ovl25:056c..0580 (0573 DS:0832 == 0 -> 04c5(1)), ovl25:04c5..0516 (050b
    flag -> 0519), ovl25:0542 / 0546 (DS:40ee), ovl49:063c (SCN read) before ovl49:08a4
    (0dff); res_070b:004e (ah=40h) / 006d (ah=3Fh); ai.md §3.4."""
    from ..model.ai import AiProcess
    proc = process if process is not None else AiProcess()
    allocated = proc.allocated if run_allocated is None else run_allocated
    state.ai.attach(proc, carry=False)
    if not allocated:
        saved = state.ai.blocks
        state.ai.blocks = [type(b)() for b in saved]
        try:
            setup_all(state, cards)
        finally:
            state.ai.blocks = saved
            proc.blocks = saved
    state.ai.allocated = 1
