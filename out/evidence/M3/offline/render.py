import os, sys
os.environ["SDL_VIDEODRIVER"]="dummy"
import pygame
from warlords2.formats.gamedir import GameDir
from warlords2.formats.scenario import load_scenario
from warlords2.formats.tables import parse_armytypes
from warlords2.rules.setup import new_game, unused_side_name
from warlords2.states.boot import new_game_config
from warlords2.config import parse_args
from warlords2.rules.combat import refresh_map
from warlords2.rules.visibility import load_view
from warlords2.assets.store import AssetStore
from warlords2.assets.sprites import Sprites
from warlords2.ui.mapview import MapView
from warlords2.ui.minimap import Minimap
from warlords2.ui.screen import Screen
gd=GameDir('original/game/Warlrd2'); pygame.display.init()
a=AssetStore(gd); scr=Screen(1,a.palette('STANDARD.PAL'))
name=sys.argv[1]
cfg=new_game_config(parse_args(['--scenario',name,'--seed','1','--options','0,0,0,%s,0,0,0,0,0,0'%sys.argv[5]]))
st=new_game(load_scenario(gd,name),cfg,list(parse_armytypes(gd.read('TERRAIN0/ARMYTYPE.DAT'))),unused_name=unused_side_name(gd.read('WARLORD2.EXE')))
refresh_map(st)
if sys.argv[5]=='1': load_view(st, st.current)
if len(sys.argv)>6:
  from warlords2.model.ids import MAP_W
  cx0,cy0=st.flags[0x17d],st.flags[0x17f]
  for a_ in st.armies:
    pass
  it=st.items[3]; it.state=1; it.x,it.y=cx0+2,cy0+1
  it=st.items[1]; it.state=1; it.x,it.y=cx0-2,cy0+1; st.world.roads[it.y*MAP_W+it.x]|=0x40
  for k in range(7):
    from warlords2.model.army import Army
    b=st.armies[[i for i,x in enumerate(st.armies) if x.owner==0][0]]
    import copy; c=copy.copy(b); c.id=len(st.armies); c.x,c.y=cx0-3,cy0-2; c.type_id=k+1; st.armies.append(c)
  refresh_map(st); st.world.flags[(cy0-2)*MAP_W+cx0-3]|=0x20
sp=Sprites(a); v=MapView(sp); m=Minimap(sp)
for _ in m.building(st): pass
cx,cy=st.flags[0x17d],st.flags[0x17f]
v.centre(int(sys.argv[2]) or cx,int(sys.argv[3]) or cy)
scr.fb.blit(a.picture('screen.pck'),(0,0)); v.draw(scr.fb,st); m.draw(scr.fb,st,*v.origin); scr.present()
pygame.image.save(scr.present_surface, sys.argv[4])
