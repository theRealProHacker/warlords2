"""M3: sheet cells (G1), view rectangle (G6), map view, overview map, phase machine."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"

import numpy as np  # noqa: E402
import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.assets import sprites as S  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.formats.scenario import SCENARIOS, load_scenario  # noqa: E402
from warlords2.formats.tables import parse_armytypes  # noqa: E402
from warlords2.model.ids import MAP_H, MAP_W, NEUTRAL_OWNER  # noqa: E402
from warlords2.states.phases import NAMES, phase_class  # noqa: E402
from warlords2.ui import mapview as V  # noqa: E402
from warlords2.ui import minimap as M  # noqa: E402


def test_view_origin_clamps_like_ovl65_0227():
    assert V.view_origin(0, 0) == (0, 0)
    assert V.view_origin(4, 4) == (0, 0)
    assert V.view_origin(50, 60) == (46, 56)
    assert V.view_origin(111, 155) == (MAP_W - 9, MAP_H - 9)


def test_cells():
    assert S.tile_cell(0) == (0, (0, 0, 40, 40))
    assert S.tile_cell(0x5F) == (0, (600, 200, 40, 40))
    assert S.tile_cell(0x60) == (1, (0, 0, 40, 40))
    assert S.tile_cell(0x60 + 17) == (1, (40, 40, 40, 40))
    assert S.road_cell(1) == (0, 0, 48, 40)
    assert S.road_cell(14) == (0, 40, 48, 40)
    assert S.road_cell(17) == (144, 40, 48, 40)
    assert S.tower_cell(8) == (576, 40, 48, 40)
    assert S.army_cell(28) == (384, 30, 32, 29)
    assert S.fog_cell(13) == (288, 41, 48, 40)
    assert S.owner_row(NEUTRAL_OWNER) == 8


def test_phase_names():
    assert NAMES[0] == "building"
    assert phase_class("building").name == "building"
    with pytest.raises(ValueError):
        phase_class("nope")


@pytest.fixture(scope="module")
def kit(game):
    pygame.display.init()
    from warlords2.assets.store import AssetStore
    gd = GameDir(game)
    store = AssetStore(gd)
    return gd, store, S.Sprites(store)


def _state(gd, name, seed=1, quests=None):
    import dataclasses
    from warlords2.config import parse_args
    from warlords2.rules.setup import new_game, unused_side_name
    from warlords2.states.boot import new_game_config
    from warlords2.rules.mapwords import refresh_map
    cfg = new_game_config(parse_args(["--scenario", name, "--seed", str(seed)]))
    if quests is not None:
        cfg = dataclasses.replace(cfg, options=dataclasses.replace(cfg.options, quests=quests))
    st = new_game(load_scenario(gd, name), cfg, list(parse_armytypes(gd.read("TERRAIN0/ARMYTYPE.DAT"))),
                  unused_name=unused_side_name(gd.read("WARLORD2.EXE")))
    refresh_map(st)
    return st


def _buf():
    from warlords2.ui.screen import IDENTITY
    b = pygame.Surface((360, 360), depth=8)
    b.set_palette(IDENTITY)
    return b


def _inside(rect, surf):
    x, y, w, h = rect
    return x >= 0 and y >= 0 and x + w <= surf.get_width() and y + h <= surf.get_height()


@pytest.mark.gamedata
@pytest.mark.parametrize("name", SCENARIOS)
def test_every_tile_and_road_maps_into_its_sheet(kit, name):
    gd, _, sp = kit
    raw = load_scenario(gd, name)["_raw"]
    for t in set(v & 0xFF for v in raw["tiles"]):
        sheet, rect = S.tile_cell(t)
        assert _inside(rect, sp.scenery[sheet]), (t, rect)
    roads = set(v & 0x1F for v in raw["roads"]) - {0}
    assert roads <= set(range(1, S.ROAD_MAX + 1))
    for r in roads:
        assert _inside(S.road_cell(r), sp.road)
    for o in range(9):
        assert _inside(S.tower_cell(o), sp.road)


def _crop(surf, rect):
    x, y, w, h = rect
    return pygame.surfarray.array2d(surf)[x:x + w, y:y + h]


@pytest.mark.gamedata
@pytest.mark.parametrize("name", ["DRAGON", "ISLADIA"])
def test_city_draws_its_four_tiles(kit, name):
    gd, _, sp = kit
    st = _state(gd, name)
    c = st.cities[0]
    left, top = V.view_origin(c.x, c.y)
    cells = V.compose(st, left, top, sp)
    t = st.world.tiles[c.y * MAP_W + c.x]
    got = [cells[c.x - left + dx][c.y - top + dy].tile for dy in (0, 1) for dx in (0, 1)]
    assert got == [t, t + 1, t + 16, t + 17]
    for a in st.armies:                       # draw only terrain
        a.x = -1
    buf = _buf()
    V.render(buf, V.compose(st, left, top, sp), sp)
    for k, tile in enumerate(got):
        dx, dy = k % 2, k // 2
        px, py = (c.x - left + dx) * 40, (c.y - top + dy) * 40
        sheet, rect = S.tile_cell(tile)
        assert (_crop(buf, (px, py, 40, 40)) == _crop(sp.scenery[sheet], rect)).all()


@pytest.mark.gamedata
def test_fortified_square_draws_the_tower_and_hides_the_stack(kit):
    gd, _, sp = kit
    st = _state(gd, "DRAGON")
    a = next(a for a in st.armies if a.owner < 8 and a.x >= 0)
    st.world.flags[a.y * MAP_W + a.x] |= V.FORTIFIED
    left, top = V.view_origin(a.x, a.y)
    cells = V.compose(st, left, top, sp)
    cell = cells[a.x - left][a.y - top]
    assert cell.fortified and cell.count >= 1 and cell.owner == a.owner
    buf = _buf()
    V.render(buf, cells, sp)
    px, py = (a.x - left) * 40, (a.y - top) * 40
    tower = pygame.surfarray.array2d(sp.road)
    tx, ty, w, h = S.tower_cell(a.owner)
    src = tower[tx:tx + 40, ty:ty + h]
    opaque = src != 1                         # road.pck key colour (picture table)
    assert opaque.any()
    assert (_crop(buf, (px, py, 40, 40))[opaque] == src[opaque]).all()


@pytest.mark.gamedata
def test_overview_is_224x312_at_2px_per_square(kit):
    gd, _, sp = kit
    st = _state(gd, "ERYTHEA")
    sc = load_scenario(gd, "ERYTHEA")
    out = M.blank()
    colors = S.MapColors.load(kit[1], 0)
    pcts = list(M.build(sc["_raw"]["tiles"], sc["_raw"]["roads"], 0, st.overview_mountain_rolls, colors, out))
    assert out.shape == (224, 312) and pcts == list(range(0, 100, 10))
    remap, col = colors.remaps[0], colors
    for x, y in ((10, 10), (60, 80), (100, 150)):
        i = y * MAP_W + x
        road, tile = sc["_raw"]["roads"][i] & 0x1F, sc["_raw"]["tiles"][i] & 0xFF
        d = road - 1 if road else tile
        if d in M.MOUNTAINS:
            continue
        t = col.roads if road else col.tiles
        assert [out[2 * x, 2 * y], out[2 * x + 1, 2 * y], out[2 * x, 2 * y + 1], out[2 * x + 1, 2 * y + 1]] \
            == [remap[t[q][d]] for q in range(4)]


@pytest.mark.gamedata
def test_loader_rolls_are_the_first_256_of_the_game_stream(kit):
    """The overview the load builds (ovl63:2479) uses the rolls new_game keeps."""
    from warlords2.rules.constants.setup import LOADER_TILE_ROLLS
    from warlords2.rules.rng import Rng
    gd, _, _ = kit
    st = _state(gd, "TUTORIA", seed=11)
    count, roll = LOADER_TILE_ROLLS.value
    rng = Rng(11)
    assert [rng.rnd(*roll) for _ in range(count)] == st.overview_mountain_rolls


@pytest.mark.gamedata
def test_setup_rolls_continue_the_stream(kit):
    """NewGameConfig.setup_rolls are repeated after the loader's 256 (ovl57:0fe8, 20af)."""
    import dataclasses
    from warlords2.config import parse_args
    from warlords2.rules.setup import new_game
    from warlords2.states.boot import new_game_config
    gd, _, _ = kit
    cfg = new_game_config(parse_args(["--scenario", "TUTORIA", "--seed", "5"]))
    types = list(parse_armytypes(gd.read("TERRAIN0/ARMYTYPE.DAT")))
    a = new_game(load_scenario(gd, "TUTORIA"), cfg, types)
    b = new_game(load_scenario(gd, "TUTORIA"), dataclasses.replace(cfg, setup_rolls=((1, 12, 0),)), types)
    assert a.overview_mountain_rolls == b.overview_mountain_rolls and a.rng.state() != b.rng.state()
    c = new_game(load_scenario(gd, "TUTORIA"), dataclasses.replace(cfg, setup_rolls=((1, 0, 3),)), types)
    assert c.rng.state() == a.rng.state()                 # sides 0: no die (ovl59:02bf)


@pytest.mark.gamedata
def test_greatest_sets_scn_0x116_before_begin(kit):
    """NewGameConfig.greatest is the setup screen's 2c04:0116 (ovl57:0ee8), read by the start
    infamy (ovl53:0295: +400 for humans)."""
    import dataclasses
    from warlords2.config import parse_args
    from warlords2.model.ids import Control
    from warlords2.rules.setup import new_game
    from warlords2.states.boot import new_game_config
    gd, _, _ = kit
    cfg = new_game_config(parse_args(["--scenario", "ERYTHEA", "--seed", "5"]))
    types = list(parse_armytypes(gd.read("TERRAIN0/ARMYTYPE.DAT")))
    off = new_game(load_scenario(gd, "ERYTHEA"), dataclasses.replace(cfg, greatest=0), types)
    on = new_game(load_scenario(gd, "ERYTHEA"), dataclasses.replace(cfg, greatest=1), types)
    assert (off.flags[0x116], on.flags[0x116]) == (0, 1)
    for p, q in zip(off.players, on.players):
        assert q.infamy == p.infamy + (400 if p.control == Control.HUMAN else 0)


def _site_rule(site, p, quests):
    """ovl35:0a25..0aa2, written out independently of rules.ruins."""
    if site.kind == 1:
        return 0x0B
    if site.flag_1b == 0:
        return 0x0C
    if (site.shown_mask >> p) & 1 or not quests:
        return 0x0A
    return 0x09


@pytest.mark.gamedata
@pytest.mark.parametrize("quests", [0, 1])
@pytest.mark.parametrize("name", SCENARIOS)
def test_pass_top_rewrites_site_tiles_and_their_overview_squares(kit, name, quests):
    """ovl61:217d ovl35:09f2(SCN 0x110) before the first map frame; with Quests on each site's
    overview square is redrawn by ovl63:2785(0, x, y) from the new tile byte, remap DS:5e72."""
    from warlords2.rules.ruins import site_tiles
    gd, store, sp = kit
    st = _state(gd, name, quests=quests)
    sc = load_scenario(gd, name)
    colors = S.MapColors.load(store, st.flags[0x161])
    loaded = M.blank()
    for _ in M.build(sc["_raw"]["tiles"], sc["_raw"]["roads"], st.flags[0x161], st.overview_mountain_rolls,
                     colors, loaded):
        pass
    mm = M.Minimap(sp, colors, loaded.copy())
    site_tiles(st, st.current)
    mm.redraw_sites(st)
    assert st.sites
    for site in st.sites:
        i = site.y * MAP_W + site.x
        tile = st.world.tiles[i] & 0xFF
        assert tile == _site_rule(site, st.current, quests)
        x, y = site.x, site.y
        got = [mm.pixels[2 * x, 2 * y], mm.pixels[2 * x + 1, 2 * y], mm.pixels[2 * x, 2 * y + 1],
               mm.pixels[2 * x + 1, 2 * y + 1]]
        if quests:
            road = st.world.roads[i] & 0x1F
            t, d = (colors.roads, road - 1) if road else (colors.tiles, tile)
            assert got == [colors.remaps[0][t[q][d]] for q in range(4)]
    if not quests:
        assert (mm.pixels == loaded).all()                   # the loaded tile bytes stay


@pytest.mark.gamedata
def test_overview_freezes_with_hidden_map_on_a_computer_turn(kit):
    """ovl63:0010..0042 / 0ee4..0f16; and a city at x = 0 draws its marker at -8 (clipped)."""
    import dataclasses
    from warlords2.model.ids import Control
    gd, store, sp = kit
    st = _state(gd, "DRAGON")
    assert not M.frozen(st)
    st.options = dataclasses.replace(st.options, hidden_map=1)
    assert not M.frozen(st)
    st.players[st.current].control = Control.COMPUTER
    assert M.frozen(st)
    st.flags[0x159] = 1
    assert not M.frozen(st)
    st.flags[0x159] = 0
    mm = M.Minimap(sp, S.MapColors.load(store, 0))
    fb = pygame.Surface((640, 480), depth=8)
    mm.draw(fb, st, 0, 0)                                  # the first frame is drawn
    before = mm.buf.copy()
    mm.pixels[:] = 7
    mm.draw(fb, st, 0, 0)
    assert (pygame.surfarray.array2d(mm.buf) == pygame.surfarray.array2d(before)).all()
    st.options = dataclasses.replace(st.options, hidden_map=0)
    c = st.cities[0]
    c.x = 0
    st.world.tiles[c.y * MAP_W] = next(t for t, v in enumerate(st.world.terrain_of_tile) if v == 10)
    mm.draw(fb, st, 0, 0)                                  # u = -1: x = -8, shift 7, no error


@pytest.mark.gamedata
def test_planted_standard_slots_and_moving_army(kit):
    """ovl64:213c slots via the picture table; ovl64:2c4d moving army on a fortified square;
    the path ghost (ovl64:238e); MapView.square_at."""
    gd, store, sp = kit
    for i in (0, 8, 9, 10, 14):
        assert sp.standard(i).get_size() == (32, 29) and not sp.is_mask_standard(i)
    assert sp.group8.now is None and sp.group8.shown == {None}   # a store without an App
    for i in (11, 12, 27, 28):                             # cache group 8 empty: nothing (X44)
        dst = pygame.Surface((40, 40), depth=8)
        dst.fill(6)
        assert sp.standard(i) is None
        sp.draw_standard(dst, i, (0, 0))
        assert (pygame.surfarray.array2d(dst) == 6).all()
    for i, name in ((13, "ashadow.pck"), (15, "road.pck")):  # mask records: plane 0 only
        assert sp.is_mask_standard(i) and sp.is_mask_standard(i + 16)
        x, y, w, h = S.STANDARD
        want = pygame.surfarray.array2d(store.picture(name))[x:x + w, y:y + h] == store.entry(name).key
        assert (sp.standard_bit0(i) == want).all()
        dst = pygame.Surface((40, 40), depth=8)
        for fill in (0x0A, 0x0B):                          # bits 1 and 3 set, bit 0 clear / set
            dst.fill(fill)
            sp.draw_standard(dst, i, (4, 3))
            px = pygame.surfarray.array2d(dst)
            cell = px[4:4 + w, 3:3 + h]
            put = ~sp.standard_mask
            assert (cell[~put] == fill).all()              # M = 1: the OS bitmap kept
            assert (cell[put] == np.where(want, 0x0B, 0x0A)[put]).all()   # only bit 0 replaced
            assert (px[:4, :] == fill).all() and (px[:, :3] == fill).all()
        sp.draw_standard(dst, i, (30, 30))                 # clipped, no error
    real = sp.standard_bit0
    try:                                                   # a cleared bit clears bit 0 too
        sp.standard_bit0 = lambda i: np.zeros((32, 29), bool)
        dst.fill(0x0F)
        sp.draw_standard(dst, 15, (0, 0))
        cell = pygame.surfarray.array2d(dst)[:32, :29]
        assert (cell[~sp.standard_mask] == 0x0E).all() and (cell[sp.standard_mask] == 0x0F).all()
    finally:
        sp.standard_bit0 = real
    st = _state(gd, "DRAGON")
    n, a = next((n, a) for n, a in enumerate(st.armies) if a.owner < 8 and a.x >= 0)
    st.world.flags[a.y * MAP_W + a.x] |= V.FORTIFIED
    left, top = V.view_origin(a.x, a.y)
    assert not V.compose(st, left, top, sp)[a.x - left][a.y - top].raised
    cell = V.compose(st, left, top, sp, moving=n)[a.x - left][a.y - top]
    assert cell.raised and cell.army_type == a.type_id and cell.count >= 1
    g = V.path_ghost(st, left, top, n, (left + 1, top + 2))
    assert (g.col, g.row, g.type_id) == (1, 2, a.type_id)
    assert V.path_ghost(st, left, top, n, (left + 9, top)) is None
    buf = _buf()
    V.render(buf, V.compose(st, left, top, sp, moving=n), sp, g)
    view = V.MapView(sp)
    view.centre(a.x, a.y)
    assert view.square_at((16, 30)) == (left, top) and view.square_at((16 + 359, 30 + 41)) == (left + 8, top + 1)
    assert view.square_at((15, 30)) is None and view.square_at((376, 30)) is None


@pytest.mark.gamedata
def test_item_11_can_lie_alone_on_a_planted_square(kit):
    """X44 reachability: Plant (ovl47:09f7 sets road bit 0x40), a computer hero's step
    (ovl28:0427) takes the standard without clearing the bit, a drop (ovl47:0943) of item 11
    there makes ovl64:2d7c draw planted-standard slot 11."""
    from warlords2.model import commands as C
    from warlords2.model.ids import HERO_TYPE, ROAD_STANDARD, ItemState
    from warlords2.rules import heroes, movement
    gd, _, sp = kit
    st = _state(gd, "ERYTHEA")
    p = st.current
    a = next(a for a in st.armies if a.owner == p and a.x >= 0)
    b = next(b for b in st.armies if b.owner != p and b.x >= 0 and b is not a)
    a.type_id = HERO_TYPE
    x, y = next((x, y) for y in range(10, 150) for x in range(10, 100)
                if st.world.terrain(x, y) not in (2, 3, 10, 11) and st.city_at(x, y) < 0
                and not st.world.roads[y * MAP_W + x] & ROAD_STANDARD)
    a.x, a.y = x, y
    for i in (p, 11):
        st.items[i].state, st.items[i].holder = int(ItemState.CARRIED), a.id
    heroes.plant_flag(st, C.PlantFlag(a.id))
    movement._pick_up(st, b, x, y)                         # the computer hero's step
    assert st.items[p].holder == b.id and st.world.roads[y * MAP_W + x] & ROAD_STANDARD
    heroes.drop(st, C.DropItem(a.id, 11))
    left, top = x - 4, y - 4
    assert V.compose(st, left, top, sp)[4][4].standard == 11


@pytest.mark.gamedata
def test_group8_slots_are_15_of_49_and_empty_in_the_image(kit):
    """X44: slots 11 / 12 are the mask / bitmap records of 15 of the 49 group-8 pictures, and
    zero in the image (+0x34 = 0 planes: 0f00:0c4d draws nothing from them)."""
    from warlords2.assets.exe import ds_bytes
    gd, store, sp = kit
    group8 = [e.index for e in store.pictures if e.group == 8]
    assert len(group8) == 49
    share = {S.SLOTS + S.SLOT_STEP * i: kind for i, kind in zip(S.GROUP8_SLOTS, ("mask", "bitmap"))}
    for slot, kind in share.items():
        owners = sp.slot_pictures[slot]
        assert sorted(k for k, _ in owners) == [45, 46, 50, 54, 62, *range(69, 79)]
        assert {kd for _, kd in owners} == {kind} and set(k for k, _ in owners) <= set(group8)
        assert not any(ds_bytes(gd.read("WARLORD2.EXE"), slot, S.SLOT_STEP))
