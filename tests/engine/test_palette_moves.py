"""The palette draw's writes (rules.selection.redraw_palette): ovl66:0356 with DS:5e62 set
writes DS:5dfe = 1 / DS:5e3e[0] = DS:5e62 when DS:2bda is clear (03ab..03bc) and, through
070d -> 0c8c:0912 (0750), DS:5e00 = the lowest signed +7 of the selected palette entries
from 100.  The selection commands end in that draw; the human move draws after the palette
rebuild (0a8b:0d0a / 0d0f).  0b62:0ea0 clears the selection when anything sank (11f8..1228).

Synthetic states of test_bonuses (all Plain); side 0 is human."""
from warlords2.model import commands as C
from warlords2.model.ids import MAP_PORT, MAP_W, Terrain
from warlords2.rules import engine
from warlords2.rules import movement as M
from warlords2.rules import selection as S
from warlords2.rules.bonuses import ABOARD_FLAG

from test_bonuses import army, mk_state, put, set_terrain
from test_move_executor import ready


def _sel(st, lead, *ids, group=None):
    s = st.selection
    s.selected, s.moving = lead, list(ids)
    M.store_selection_words(st)
    if group is not None:
        s.group = group


def test_0912_min_of_the_selected_entries_from_100():
    st = mk_state()
    a, b, c = (put(st, 1, 0, 5, 5, moves=m) for m in (30, 12, 7))
    s = st.selection
    s.selected, s.palette, s.palette_selected = a, [a, b, c], [1, 1, 0]
    assert S.palette_moves(st) == 12                     # c not selected
    s.palette_selected = [0, 0, 0]
    assert S.palette_moves(st) == 100                    # 0c8c:0915
    army(st, b).moves_left = 0xF0                        # signed byte (0938 cwde)
    s.palette_selected = [1, 1, 0]
    assert S.palette_moves(st) == -16


def test_0912_reads_a_freed_record_as_it_is():
    """No liveness test in 0912: a selected entry whose record was freed gives its +7 (0)."""
    st = mk_state()
    a, b = put(st, 1, 0, 5, 5, moves=30), put(st, 1, 0, 5, 5, moves=20)
    s = st.selection
    s.palette, s.palette_selected = [a, b], [1, 1]
    M.remove_army(st, army(st, b))
    assert S.palette_moves(st) == 0


def test_draw_without_leader_writes_nothing():
    st = mk_state()
    a = put(st, 1, 0, 5, 5, moves=30)
    s = st.selection
    s.palette, s.palette_selected, s.moves, s.count = [a], [1], 55, 3
    S.redraw_palette(st)
    assert (s.moves, s.count) == (55, 3)                 # ovl66:035d -> 05a3


def test_draw_without_group_flag_replaces_slot_0_only():
    """ovl66:03ab..03bc: DS:2bda clear -> DS:5dfe = 1, DS:5e3e[0] = DS:5e62."""
    st = mk_state()
    a, b, c = (put(st, 1, 0, 5, 5, moves=m) for m in (30, 12, 7))
    s = st.selection
    s.selected, s.moving, s.group, s.count = c, [a, b], 0, 2
    s.palette, s.palette_selected = [a, b, c], [0, 0, 1]
    S.redraw_palette(st)
    assert (s.moving, s.count, s.moves) == ([c, b], 1, 7)
    s.group, s.count, s.moving = 1, 2, [a, b]
    S.redraw_palette(st)
    assert (s.moving, s.count) == ([a, b], 2)


def test_single_army_move_stores_the_leaders_moves_left():
    """2bda clear: the walk leaves DS:5e00 (0a8b:09f8), the draw 0a8b:0d0f then stores the
    leader's new +7 (palette of the new square, the leader alone selected)."""
    st = mk_state()
    a = put(st, 1, 0, 10, 10, moves=20)
    put(st, 1, 0, 10, 10, moves=5)
    ready(st)
    _sel(st, a, a)
    st.selection.moves = 77                              # stale stored word
    engine.apply(st, C.Move((a,), (13, 10)))
    assert army(st, a).x == 13
    assert st.selection.moves == army(st, a).moves_left == 14


def test_group_move_stores_the_min_of_the_members_not_the_stale_budget():
    """With 2bda the walk writes max(0, DS:5e00 - cost) (0a11); the draw then recomputes from
    the members' +7, so a stale DS:5e00 does not survive the move."""
    st = mk_state()
    a, b = put(st, 1, 0, 10, 10, moves=20), put(st, 1, 0, 10, 10, moves=30)
    ready(st)
    _sel(st, a, a, b)
    st.selection.moves = 25                              # stale: the +7 are 20 / 30
    engine.apply(st, C.Move((a, b), (12, 10)))
    assert [army(st, i).moves_left for i in (a, b)] == [16, 26]
    assert st.selection.moves == 16


def test_group_move_that_boards_stores_0():
    """0a8b:0d1a zeroes the boarded members' +7 without touching DS:5e00; the draw at 0d0f
    reads the zeros (then status 2 deselects: 0b62:08b3 writes no DS:5e00)."""
    st = mk_state()
    for x in range(13, 20):
        set_terrain(st, x, 10, Terrain.WATER)
    st.world.flags[10 * MAP_W + 12] |= MAP_PORT
    a, b = put(st, 1, 0, 10, 10, moves=40), put(st, 1, 0, 10, 10, moves=40)
    ready(st)
    _sel(st, a, a, b)
    engine.apply(st, C.Move((a, b), (16, 10)))
    boarded = [i for i in (a, b) if army(st, i).flags & ABOARD_FLAG]
    assert boarded and all(army(st, i).moves_left == 0 for i in boarded)
    assert st.selection.moves == 0


def test_select_stack_and_palette_buttons_end_in_the_draw():
    st = mk_state()
    a, b = put(st, 1, 0, 5, 5, moves=30), put(st, 1, 0, 5, 5, moves=12)
    engine.apply(st, C.SelectStack(5, 5))
    s = st.selection
    assert s.moves == S.palette_moves(st)
    engine.apply(st, C.GroupAll(5, 5))
    assert (s.moves, s.count) == (12, 2)
    engine.apply(st, C.UngroupAll(5, 5))
    assert (s.count, s.moves) == (1, army(st, s.selected).moves_left)


def test_disband_no_draws_yes_does_not():
    """0b62:075a: ovl61:0000(0, 0) -> 0356 with DS:5e62 set; the yes path nulls DS:5e62 first
    (087d) so its draw (08a7) writes nothing."""
    st = mk_state()
    a, b = put(st, 1, 0, 5, 5, moves=30), put(st, 1, 0, 5, 5, moves=12)
    engine.apply(st, C.SelectStack(5, 5))
    s = st.selection
    lead = s.selected
    army(st, lead).moves_left = 3
    engine.apply(st, C.Disband((lead,)))
    engine.apply(st, C.ConfirmDisband(False))
    assert s.moves == 3
    engine.apply(st, C.Disband((lead,)))
    s.moves = 44
    engine.apply(st, C.ConfirmDisband(True))
    assert s.selected == -1 and s.moves == 44
