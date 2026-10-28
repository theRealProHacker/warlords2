import os, sys
os.environ["SDL_VIDEODRIVER"] = "dummy"; os.environ["SDL_AUDIODRIVER"] = "dummy"
sys.path.insert(0, ".")
import tempfile, pathlib, pygame
from warlords2.app import App
from warlords2.config import parse_args
from warlords2.rules.movement import alloc_army
from warlords2.rules.mapwords import refresh_map
from warlords2.ui import palettes as PL
out = pathlib.Path("out/evidence/M4c/palette_group"); out.mkdir(parents=True, exist_ok=True)
a = App(parse_args(["--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA", "--user-dir", tempfile.mkdtemp()]))
for _ in range(60):
    a.step([]); g = a.manager.current_state()
    if getattr(g, "phase_name", None) == "human": break
st = g.state
h = next(x for x in st.armies if x.owner == st.current and x.x >= 0)
for t in (1, 3, 9):   # test set-up only: extra armies on the hero's square (no production before M8a)
    r = alloc_army(st); r.type_id, r.x, r.y, r.allowance, r.moves_left, r.strength = t, h.x, h.y, 10, 7 + t, 3
refresh_map(st); g.loop_pass()
ph = g.phase
def shot(name):
    a.step([]); pygame.image.save(a.screen.present_surface, str(out / f"{name}.png"))
ph.select((h.x, h.y)); ph.left_release((0, 0)); shot("1_selected")
ph.button(PL.GROUP_ALL); shot("2_group_all")
ph.button(PL.UNGROUP_ALL); shot("3_ungroup_all")
ph.button(PL.SELECT_ARMY[2]); shot("4_add_slot2")
ph.button(PL.SELECT_GROUP[1]); shot("5_select_group_slot1")
a.close()
