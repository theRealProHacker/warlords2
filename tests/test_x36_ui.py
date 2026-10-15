"""Register X36 (c): how the UI shows an army of type byte 0xff (stored as type -1).

Expected values are read off out/asm/ovl44.asm (14f4), ovl46.asm (0626), ovl66.asm (0e85,
1b9c), ovl64.asm (08be, 239d..23fb), ovl37.asm (0401) and res_0f00.asm (0c4d).
"""
import glob
import os
import sys
from types import SimpleNamespace

os.environ["SDL_VIDEODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "engine"))

from test_bonuses import atype, mk_state, put  # noqa: E402

from warlords2.assets import sprites as S  # noqa: E402
from warlords2.formats.gamedir import EXE_NAME, GameDir  # noqa: E402
from warlords2.model.ids import HERO_TYPE  # noqa: E402
from warlords2.ui import mapview  # noqa: E402
from warlords2.ui.dialog import DialogStack  # noqa: E402
from warlords2.ui.dialogs import stack as SK  # noqa: E402
from warlords2.ui.info import army as IA  # noqa: E402
from warlords2.ui.typename import NAME_BUF, type_name  # noqa: E402

ASM = os.path.join(os.path.dirname(__file__), "..", "out", "asm")


def types():
    """Type 3 with an own (w6) and a stack (w10) bonus for open terrain (battle class 1)."""
    t = [atype(i) for i in range(28)] + [atype(HERO_TYPE, 5)]
    t[3] = atype(3, str_bonus_open=2, stack_bonus_open=1)
    return t


# ----------------------------------------------------------------------------- DS:4468


def test_type_name_of_type_ff_keeps_the_last_name():
    """ovl44:14f4 copies a name into DS:4468 only on an id match (1512..152e); cwde(0xff) = -1
    matches no record, so the buffer keeps the last look-up."""
    st = mk_state(types())
    k = SimpleNamespace(exe=None, type_name_buf="")
    assert type_name(k, st, -1) == ""
    assert type_name(k, st, 3) == "t3"
    assert type_name(k, st, -1) == type_name(k, st, 0xFF) == "t3"
    assert type_name(k, st, HERO_TYPE) == "t28"
    assert type_name(k, st, -1) == "t28"


@pytest.mark.gamedata
def test_name_buffer_starts_empty_and_only_14f4_writes_it(game):
    exe = GameDir(game).read(EXE_NAME)
    k = SimpleNamespace(exe=exe)
    assert type_name(k, mk_state(types()), -1) == ""                   # image bytes: zeros
    if not os.path.isdir(ASM):
        pytest.skip("out/asm listings not generated")
    refs = [(os.path.basename(f), line.split()[0]) for f in glob.glob(os.path.join(ASM, "*.asm"))
            for line in open(f) if "0x%x" % NAME_BUF in line.split(";")[0]]
    assert sorted(refs) == [("ovl44.asm", "1526"), ("ovl44.asm", "153f")]


# ----------------------------------------------------------------------------- stack dialog


def _stack(st, *specs):
    """Palette of armies (type, strength) on (5, 5), all selected, the first one the leader."""
    ids = [put(st, t, 0, 5, 5, strength=s) for t, s in specs]
    sel = st.selection
    sel.selected = ids[0]
    sel.palette, sel.palette_group, sel.palette_selected = ids, [0] * len(ids), [1] * len(ids)
    return sel


def test_stack_strengths_type_ff_after_a_real_army_takes_its_record():
    """ovl66:1b9c: one buffer [bp-0x50]; loop 1 (1c1a) adds type 3's w10 = 1 once (the 0xff
    army's fetch copies nothing, w10 = 1 is not above the maximum); loop 2 (1d5d) gives the 0xff
    army type 3's w6 = 2: min(6 + 2, 9) + 1."""
    st = mk_state(types())
    sel = _stack(st, (3, 4), (-1, 6))
    assert SK.stack_strengths(None, st, sel) == {0: 4 + 2 + 1, 1: 8 + 1}


def test_stack_strengths_type_ff_first_uses_the_stand_in_then_the_carried_record():
    """0xff first: in loop 1 the buffer is stack contents (stand-in zeros, no stack bonus);
    loop 2's first fetch is again nothing, so the buffer is what loop 1 fetched last (type 3)."""
    st = mk_state(types())
    sel = _stack(st, (-1, 6), (3, 4))
    assert SK.stack_strengths(None, st, sel) == {0: 6 + 2 + 1, 1: 4 + 2 + 1}
    st = mk_state(types())
    sel = _stack(st, (-1, 6))
    assert SK.stack_strengths(None, st, sel) == {0: 6}


def test_stack_row_names_carry_the_name_buffer():
    """ovl66:0e85 1106..1145: hero -> slot name, else ovl44:14f4(+4) in row order."""
    st = mk_state(types())
    sel = _stack(st, (-1, 6), (3, 4), (-1, 6))
    k = SimpleNamespace(exe=None, type_name_buf="old")
    d = SimpleNamespace(work=st, sel=sel, k=k)
    assert SK.Stack.row_names(d) == ["old", "t3", "t3"]
    assert k.type_name_buf == "t3"


# ----------------------------------------------------------------------------- army panel


def test_army_panel_of_type_ff_is_nothing():
    """ovl46:0626 returns at 0634..0639 for type -1: no picture, no text; the caller's DS:1174
    still makes the press wait for the release."""
    st = mk_state(types())
    aid = put(st, -1, 0, 5, 5, strength=6)
    app = SimpleNamespace(kit=SimpleNamespace(), input=SimpleNamespace(buttons=1))
    closed = []
    d = IA.army_panel(SimpleNamespace(app=app, state=st), aid, (300, 200), on_close=closed.append)
    assert isinstance(d, IA.Nothing) and not d.hides_pointer
    DialogStack().push(d)
    fb = pygame.Surface((640, 480), depth=8)
    fb.fill(7)
    d.draw(fb)
    assert set(pygame.surfarray.array2d(fb).ravel().tolist()) == {7}
    d.update([], 0)
    assert closed == []
    app.input.buttons = 0
    d.update([], 0)
    assert closed == [None]


# ----------------------------------------------------------------------------- path ghost


def test_ghost_of_type_ff_reads_the_end_of_the_row_above():
    """ovl64:239d..23b8: source (-32, 0); 0f00:0c4d addresses y * stride + (x >> 3), so source
    row j >= 1 is sheet row j - 1 at x 480..511; row 0 (before the buffer) is not drawn."""
    sheet = pygame.Surface((512, 64), depth=8)
    sheet.set_palette([(i, i, i) for i in range(256)])
    for y in range(64):
        for x in range(512):
            sheet.set_at((x, y), (x // 32 * 13 + y) % 200 + 20)
    sheet.set_colorkey(15)
    sp = SimpleNamespace(ashadow=sheet)
    dst = pygame.Surface((360, 360), depth=8)
    dst.set_palette(sheet.get_palette())
    dst.fill(1)
    mapview.draw_ghost(dst, sp, mapview.Ghost(2, 3, -1))
    x0, y0 = 2 * S.TILE + S.GHOST_AT[0], 3 * S.TILE + S.GHOST_AT[1]
    assert all(dst.get_at_mapped((x0 + i, y0)) == 1 for i in range(32))
    for j in range(1, S.GHOST_H):
        for i in range(32):
            assert dst.get_at_mapped((x0 + i, y0 + j)) == sheet.get_at_mapped((480 + i, j - 1))
    assert all(dst.get_at_mapped((x0 + i, y0 + S.GHOST_H)) == 1 for i in range(32))


def test_ghost_type_is_the_sign_extended_byte():
    st = mk_state(types())
    aid = put(st, -1, 0, 5, 5, strength=6)
    st.armies[aid].type_id = 0xFF                      # a freed record's form
    assert mapview.path_ghost(st, 0, 0, aid, (4, 4)).type_id == -1
