"""M4c: human phase, palettes, path marks, move animation, right-click panels.

The game runs the real turn start since M8a (two humans, TUTORIA's Darklords made human: strict
mode cannot play a computer side before M8b1); the fixture dismisses the Turn pop-up and the
tutorial pages, accepts the turn-1 hero offer, closes the turn-1 production screen and marks the
select tutorial pages as shown (SCN byte 0x134 bits 3, 4, 7), so these tests see the M4c screens
alone.  tests/scripts/m4c_tutoria.json shows the first-select page (25, 3).
"""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets import cursors as CU  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model.ids import MAP_W, ROAD_PIECE_MASK, Terrain  # noqa: E402
from warlords2.rules.mapwords import refresh_map  # noqa: E402
from warlords2.rules.movement import alloc_army  # noqa: E402
from warlords2.rules.selection import redraw_palette  # noqa: E402
from warlords2.ui import palettes as PL  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.info import panel_rect, square_centre  # noqa: E402

gamedata = pytest.mark.gamedata


def test_panel_rect_like_ovl46_131a_and_1486():
    assert panel_rect((0, 0)) == (0, 0, 256, 75)
    assert panel_rect((639, 479)) == (384, 404, 256, 75)
    assert panel_rect((300, 200)) == (304 - 128, 200 - 37, 256, 75)
    assert panel_rect((0, 0), (240, 128)) == (0, 0, 240, 128)
    assert panel_rect((639, 479), (240, 128)) == (400, 350, 240, 128)
    assert square_centre((10, 20), 12, 21) == (116, 90)


class _Sel:
    def __init__(self, group, chosen):
        self.palette_group, self.palette_selected = group, chosen


def test_marks_like_ovl66_17e7():
    assert PL.marks(_Sel([0], [1])) == [1]
    assert PL.marks(_Sel([0, 0, 1], [1, 1, 0])) == [1, -1, 0]
    assert PL.marks(_Sel([0, 1, 1], [0, 1, 1])) == [0, 1, -1]
    assert PL.marks(_Sel([0, 1, 2], [1, 1, 0])) == [0, 0, 0]          # not one whole group: no tick


@pytest.fixture
def game(game, tmp_path):
    import pygame
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--user-dir", str(tmp_path / "u")]))
    answer = {"hero_offer": 287, "production": 192}     # accept (ovl47:120c), Done (ovl45)
    for _ in range(120):
        g = a.manager.current_state()
        top = g.dialogs.top if g.dialogs else None
        if top is not None and getattr(top, "dialog_id", "") in answer:
            top.press(answer[top.dialog_id])
            up = []
        else:
            up = [pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))] if g.dialogs else []
        a.step(up)
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            break
    assert a.manager.current_state_str() == "game" and g.phase_name == "human" and not g.dialogs
    g.state.flags[0x134] |= 0x08 | 0x10 | 0x80               # the select pages count as shown
    yield g
    a.close()


def _hero(g):
    """The leader a select of the start square picks: the turn-1 hero (sorted first)."""
    st = g.state
    own = [a for a in st.armies if a.owner == st.current and a.x >= 0]
    return next((a for a in own if a.type_id == 28), own[0])


def _join(g, n):
    """Test set-up: n more armies of the side on the hero's square (engine allocator)."""
    st, h = g.state, _hero(g)
    for _ in range(n):
        a = alloc_army(st)
        a.type_id, a.x, a.y, a.allowance, a.moves_left, a.strength = 1, h.x, h.y, 10, 10, 3
    refresh_map(st)
    return h


@gamedata
def test_select_group_ungroup_via_palette_buttons(game):
    h = _join(game, 2)
    ph = game.phase
    ph.select((h.x, h.y))
    sel = game.state.selection
    assert PL.leader(game.state) is not None and len(sel.palette) == 4    # hero, army 3, two joined
    assert sel.palette_selected.count(1) == 1                       # ovl67:06eb: the leader's group
    ph.button(PL.GROUP_ALL)
    assert all(game.state.selection.palette_selected)
    assert PL.one_group(game.state)
    ph.refresh()
    assert PL.UNGROUP_ALL not in ph.palette.hidden and PL.GROUP_ALL in ph.palette.hidden
    ph.button(PL.UNGROUP_ALL)
    assert game.state.selection.palette_selected == [1, 0, 0, 0]
    ph.button(PL.SELECT_ARMY[1])                                    # join slot 1
    assert game.state.selection.palette_selected[:2] == [1, 1]
    ph.button(PL.SELECT_ARMY[1])                                    # and leave again
    assert game.state.selection.palette_selected[1] == 0
    fb = game.app.screen.fb
    game.paint(fb)                                                 # draws without touching the state
    h0 = game.state.hash()
    game.paint(fb)
    assert game.state.hash() == h0


@gamedata
def test_path_marks_preview_does_not_touch_the_state(game):
    h = _hero(game)
    ph = game.phase
    ph.select((h.x, h.y))
    before = game.state.hash()
    from warlords2.states.phases.human import path_preview
    p = path_preview(game.state, (h.id,), (h.x - 4, h.y - 3))
    assert p is not None and p[0][-1] == (h.x - 4, h.y - 3) and 0 < p[1] <= len(p[0])
    assert game.state.hash() == before
    ph.set_path((h.x - 4, h.y - 3))
    assert game.state.armies[h.id].goto == (h.x - 4, h.y - 3)
    assert ph.display.squares == p[0] and ph.display.marks_left
    assert ph.palette.row.state[PL.MOVE] == 1                       # ovl61:0174: Move live with marks


@gamedata
def test_move_animates_on_a_copy(game):
    h = _hero(game)
    ph = game.phase
    ph.select((h.x, h.y))
    dest = (h.x - 4, h.y - 3)
    ph.move_to(dest)
    st = game.state
    assert (st.armies[h.id].x, st.armies[h.id].y) == dest           # the engine moved at once
    assert ph.animator.busy and ph.display.done < len(ph.display.squares)
    seen = []
    while ph.animator.busy:
        a = ph.animator.scene.armies[h.id]
        seen.append((a.x, a.y))
        ph.step([], 16)
    assert dest in seen and seen[0] != dest
    assert ph.display.done == len(ph.display.squares)


@gamedata
def test_cursors_like_08a9_0896(game):
    h = _hero(game)
    ph = game.phase
    v = game.view
    left, top = v.origin
    at = (16 + (h.x - left) * 40 + 20, 30 + (h.y - top) * 40 + 20)
    assert ph.cursor(at) == CU.TARGET                               # own stack, nothing selected
    assert ph.cursor((500, 100)) == CU.MAGNIFIER                    # overview
    assert ph.cursor((620, 470)) == CU.ARROW
    ph.select((h.x, h.y))
    assert ph.cursor(at) == CU.PATH                                 # DS:1172 while the button is held
    ph.left_release(at)
    assert ph.cursor((at[0] - 120, at[1] - 80)) in (CU.BOOT, CU.SHIP, CU.HAND)


@gamedata
def test_right_click_panels(game):
    from warlords2.ui.info.terrain import texts
    k = game.phase.k
    st = game.state
    w = st.world
    road = next(i for i in range(len(w.roads)) if w.roads[i] & ROAD_PIECE_MASK and not w.flags[i] & 0x80)
    assert texts(k, w, road % MAP_W, road // MAP_W) == (k.text.S(128, 0), k.text.S(129, 0))   # "Road"
    h = _hero(game)
    ph = game.phase
    ph.map_info((h.x, h.y))
    assert game.dialogs.top.dialog_id == "info/army"
    game.dialogs.top.close()
    left, top = game.view.origin
    ph.map_info((left + 1, top + 1))
    assert game.dialogs.top.dialog_id in ("info/terrain", "info/sign", "info/army", "info/tower")
    game.dialogs.top.close()


@gamedata
def test_tower_panel_for_an_enemy_on_a_fortified_square(game):
    st = game.state
    left, top = game.view.origin
    x, y = left + 1, top + 1
    a = alloc_army(st)
    a.owner, a.type_id, a.x, a.y = (st.current + 1) % 8, 1, x, y
    refresh_map(st)
    st.world.flags[y * MAP_W + x] |= 0x20
    game.phase.map_info((x, y))
    assert game.dialogs.top.dialog_id == "info/tower"


@gamedata
def test_stack_palette_help_selectors_registered(game):
    for n in range(37, 45):
        assert registry.help_selector_for(n) is not None
    h = _hero(game)
    game.phase.select((h.x, h.y))
    registry.help_selector_for(37)(game, {"id": 336}, 37)
    assert game.dialogs.top.dialog_id == "info/army_unit"


@gamedata
def test_next_quit_defend(game):
    h = _hero(game)
    ph = game.phase
    ph.button(PL.NEXT)
    assert game.state.selection.selected == h.id
    ph.button(PL.DEFEND)                                            # Next goes on to army 3
    assert game.state.selection.selected not in (-1, h.id) and not game.state.armies[h.id].flags & 1
    ph.select((h.x, h.y))
    ph.button(PL.QUIT_NEXT)
    assert game.state.armies[h.id].flags & 0x40
    assert isinstance(C.Next(), C.Command)


# --------------------------------------------------------------------------- review fixes


def _at(g, x, y):
    """Screen centre of map square (x, y) in the view."""
    left, top = g.view.origin
    return 16 + (x - left) * 40 + 20, 30 + (y - top) * 40 + 20


@gamedata
def test_menu_refresh_like_ovl61_0519(game):
    from warlords2.ui.game_menus import menu_states
    bar = game.bar.bar
    m = registry.MENU_ID
    assert all(game.bar.shown), "1372:132f(0) after 0174: every title drawn enabled"
    assert all(bar.masks)
    assert not bar.host_enabled(*registry.MENU["disband"][1:])        # 0x1fc without a selection
    assert not bar.host_enabled(*registry.MENU["load_game"][1:])      # ovl49:0e25: no saved game
    assert bar.host_enabled(*registry.MENU["save_game"][1:])          # not touched by 0519
    assert bar.host_enabled(*registry.MENU["end_turn"][1:])           # SCN 0x15b clear
    assert not bar.host_enabled(*registry.MENU["history_city"][1:])   # turn 1
    h = _hero(game)
    game.phase.select((h.x, h.y))
    game.phase.left_release(_at(game, h.x, h.y))
    assert bar.host_enabled(*registry.MENU["disband"][1:]) and bar.host_enabled(*registry.MENU["stack"][1:])
    on = menu_states(game.app, game.state, PL.leader(game.state))
    hero = any(a.type_id == 28 and a.owner == game.state.current for a in game.state.armies)
    assert on["hero_inspect"] == on["hero_levels"] == hero              # 05ae..05ea
    for id, action in zip(PL.SHORTCUTS, game.phase.palette.shortcuts):
        a = bar.by_id.get(action)
        want = a is not None and bar.item_enabled(a.menu, a.item)
        assert (game.phase.palette.row.state[id] == 1) == want
    assert m["end_turn"] in bar.by_id


@gamedata
def test_release_without_drag_does_not_move(game):
    h = _hero(game)
    ph = game.phase
    ph.select((h.x, h.y))
    ph.left_release(_at(game, h.x, h.y))
    ph.set_path((h.x - 4, h.y - 3))
    assert game.state.armies[h.id].goto == (h.x - 4, h.y - 3)
    ph.select((h.x, h.y))                                           # DS:1178 = 0
    ph.left_release((500, 470))                                     # off the stack, old 1178 = 0
    a = game.state.armies[h.id]
    assert (a.x, a.y) == (h.x, h.y) and not ph.animator.busy


@gamedata
def test_path_drag_starts_on_the_8th_poll(game):
    h = _hero(game)
    ph = game.phase
    inp = game.app.input
    calls = []
    ph.drag_path = lambda pos: calls.append(ph.poll)
    at = _at(game, h.x, h.y)
    inp.buttons, inp.pos = {1}, at
    ph.poll += 1
    ph.left_press(at)                                               # the dispatch poll: select
    press = ph.poll
    ph.held(inp)                                                    # same poll: no second dispatch
    assert ph.stack_drag == 0 and not calls
    for _ in range(9):
        ph.step([], 16)
    inp.buttons = set()
    assert calls[0] == press + 8                                     # old DS:1178 = 7 > 6
    assert ph.stack_drag == 7


@gamedata
def test_held_left_button_dispatches_every_poll(game):
    ph = game.phase
    inp = game.app.input
    seen = []
    ph.dispatch_left = lambda pos: seen.append(ph.poll)
    inp.buttons, inp.pos = {1}, (500, 200)
    ph.poll += 1
    ph.left_press((500, 200))
    first = ph.poll
    ph.held(inp)
    for _ in range(3):
        ph.step([], 16)
    inp.buttons = set()
    assert seen == [first, first + 1, first + 2, first + 3]


@gamedata
def test_drag_path_like_ovl61_0b3b(game):
    h = _hero(game)
    ph = game.phase
    ph.select((h.x, h.y))
    calls = []
    ph.set_path = lambda sq, refresh=True: calls.append((sq, refresh))
    v = game.view
    left, top = v.origin
    inner = (h.x - 1, h.y) if h.x - 1 > left else (h.x + 1, h.y)
    ph.drag_path(_at(game, *inner))
    ph.drag_path(_at(game, *inner))                                  # same square as the last call
    assert calls == [(inner, False)]
    c0 = (v.cx, v.cy)
    ph.drag_path(_at(game, h.x, h.y))                                # the leader's square
    assert len(calls) == 1 and (v.cx, v.cy) == c0
    ph.drag_last = None
    edge = _at(game, left, top + 4)                                  # left column, middle row
    ph.drag_path(edge)
    assert (v.cx, v.cy) == clamp(c0[0] - 1, c0[1])
    assert len(calls) == 2 and calls[1][0] == v.square_at(edge)      # path after the scroll


def clamp(x, y):
    from warlords2.ui.anim.move import clamp_centre
    return clamp_centre(x, y)


@gamedata
def test_walk_clamps_the_view_centre(game):
    from warlords2.ui.anim.move import _steps
    h = _hero(game)
    ph = game.phase
    scene = game.state.copy()
    it = _steps(game, ph, scene, [scene.armies[h.id]], [(1, 1)], False)
    next(it)
    assert (game.view.cx, game.view.cy) == (4, 4)                    # ovl64:0565 -> 0629


@gamedata
def test_selection_frame_freezes_while_held(game):
    h = _hero(game)
    ph = game.phase
    ph.select((h.x, h.y))
    frozen = (ph.ants_ticks, ph.ants_phase, ph.ants_shown)
    for _ in range(40):
        ph.poll += 1
        ph.ants_poll()
    assert (ph.ants_ticks, ph.ants_phase, ph.ants_shown) == frozen
    ph.left_release(_at(game, h.x, h.y))
    for _ in range(40):
        ph.poll += 1
        ph.ants_poll()
    assert ph.ants_ticks != frozen[0] or ph.ants_phase != frozen[1]


def test_group_of_reads_the_stored_2bda():
    """The commands' group is the stack the order routines see: DS:5e3e (non-null slots) with
    the stored DS:2bda, else DS:5e62 alone; not len(DS:5e3e)."""
    from types import SimpleNamespace
    from warlords2.states.phases.human import group_of as phase_group
    from warlords2.ui.dialogs.search_result import group_of as search_group
    sel = SimpleNamespace(selected=4, moving=[4, 7], group=0)
    st = SimpleNamespace(selection=sel)
    for group_of in (phase_group, search_group):
        sel.moving, sel.group = [4, 7], 0
        assert group_of(st) == (4,)
        sel.moving, sel.group = [4, -1, 7], 1
        assert group_of(st) == (4, 7)


@gamedata
def test_selection_frame_kind_is_the_stored_2bda(game, monkeypatch):
    """ovl64:020a: the group frames (ovl62:0b27) with the stored DS:2bda set, else the single
    army's (0afd)."""
    import pygame
    ph, st, h = game.phase, game.state, _hero(game)
    rows = []
    monkeypatch.setattr(ph, "_ants_frame", lambda sx, sy, c: rows.append(sy) or pygame.Surface((40, 40)))
    fb = pygame.Surface((640, 480))
    left, top = game.view.origin
    for moving, group in (([h.id, h.id + 1], 0), ([h.id], 1)):
        st.selection.moving, st.selection.group = moving, group
        ph.ants(fb, st, h, left, top)
    assert rows == [0, 40]                                    # frames 0-3, then 4-7


@gamedata
def test_selection_frame_colour_is_the_word_table(game):
    from warlords2.assets.exe import ds_word
    ph = game.phase
    exe = ph.k.exe
    assert list(ph.ants_colours) == [ds_word(exe, 0x2B6C + 2 * p) for p in range(8)]
    frame = ph._ants_frame(0, 0, ph.ants_colours[1])
    import pygame
    px = pygame.surfarray.array2d(frame)
    assert ph.ants_colours[1] in px and ph.ants_colours[1] != 0       # the byte read gave 0 for side 1


@gamedata
def test_right_press_on_the_map_frame(game):
    game.phase.right_press((4, 200))
    assert game.dialogs.top.dialog_id == "info/text"
    game.dialogs.top.close()


@gamedata
def test_kind_cell_with_no_selected_army_is_fly(game):
    h = _join(game, 1)
    ph = game.phase
    ph.select((h.x, h.y))
    sel = game.state.selection
    sel.palette_selected = [0] * len(sel.palette)                    # set-up: none selected
    assert PL.kind_cell(game.state) == PL.KIND_FLY                   # 0c8c:07fa all-fly flag starts at 1
    redraw_palette(game.state)                                       # ovl66:0356 -> 070d -> 0912
    assert PL.lowest_moves(game.state) == 100


@gamedata
def test_left_click_hook(game, monkeypatch):
    seen = []
    monkeypatch.setitem(registry._left_click, "advisor", lambda g, sq, mode: seen.append((sq, mode)))
    game.phase._left_hook("advisor", (3, 4), None)
    assert seen == [((3, 4), None)]


def _only_awake(g, keep):
    """Every own army on the map done (0x40) but `keep`, so Next picks `keep`."""
    for a in g.state.armies:
        if a.owner == g.state.current and a.x >= 0 and a is not keep:
            a.flags |= 0x40
    keep.flags = (keep.flags | 1) & ~0x40


def _far_square(g):
    """A free square outside the current view (ovl64:05b4's rectangle)."""
    st = g.state
    left, top = g.view.origin
    taken = {(a.x, a.y) for a in st.armies if a.owner != 0xFF}
    for x in range(MAP_W):
        for y in range(len(st.world.tiles) // MAP_W):
            if not (left <= x < left + 9 and top <= y < top + 9) and (x, y) not in taken \
                    and st.world.terrain_of_tile[st.world.tiles[y * MAP_W + x]] == Terrain.PLAIN:
                if abs(x - left) > 12 or abs(y - top) > 12:
                    return x, y
    raise AssertionError("no far square")


@gamedata
def test_next_scrolls_the_map_to_an_army_off_the_view(game):
    """ovl67:08ef -> ovl64:05b4 -> 0629: Next to an army outside the view centres the shown map
    on it (the engine's words, followed by the view at once)."""
    from warlords2.rules.turn import centre_view
    from warlords2.ui.mapview import view_origin
    g, st = game, game.state
    h = _hero(g)
    h.x, h.y = _far_square(g)
    refresh_map(st)
    _only_awake(g, h)
    g.phase.button(PL.NEXT)
    assert st.selection.selected == h.id
    probe = st.copy()
    centre_view(probe, h.x, h.y)
    assert (st.flags[0x17D], st.flags[0x17F]) == (probe.flags[0x17D], probe.flags[0x17F])
    assert g.view.origin == view_origin(probe.flags[0x17D], probe.flags[0x17F])
    left, top = g.view.origin
    assert left <= h.x < left + 9 and top <= h.y < top + 9


@gamedata
def test_next_to_an_army_in_the_view_keeps_the_map(game):
    g, st = game, game.state
    h = _hero(g)
    _only_awake(g, h)
    origin, words = g.view.origin, (st.flags[0x17D], st.flags[0x17F])
    left, top = origin
    assert left <= h.x < left + 9 and top <= h.y < top + 9
    g.phase.button(PL.NEXT)
    assert st.selection.selected == h.id
    assert g.view.origin == origin and (st.flags[0x17D], st.flags[0x17F]) == words
