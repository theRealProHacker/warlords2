import os,re,sys
sys.path.insert(0,'tools/re')
from mz import Exe
from addr import table
e=Exe('original/game/Warlrd2/WARLORD2.EXE')
d='out/rea/decomp'
ents=sorted(int(f[:-2],16) for f in os.listdir(d) if f.endswith('.c'))
for s in sys.argv[1:]:
    n,off=s[3:].split(':')
    lin=(table(e)[int(n)][1]+0x1000)*16+int(off,16)
    ent=max(x for x in ents if x<=lin)
    t=open(os.path.join(d,'%06x.c'%ent)).read()
    for a,b in ((r"\((undefined[124]?|int|char|uint|byte) \*\)", ""), (r"\((int|char|uint)\)", "")):
        t=re.sub(a,b,t)
    open('out/re/ai/scratch19/%s_%s.c'%(s[:5],off),'w').write('// %s ent %x\n'%(s,ent)+t)
