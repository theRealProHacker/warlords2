"""Print a compacted Ghidra decompilation from out/rea/decomp for an address.

usage: python -I tools/re/dc.py <ovlNN:OOOO | SSSS:OOOO | 0xLINEAR> [maxchars] [skipchars]
The address may be anywhere inside a function: the nearest dumped entry at or below it is used.
Beware: where Ghidra mis-resolves a Borland switch table the body can contain unrelated code
from other segments; cross-check such functions against the capstone listing.
"""
import os, re, sys
sys.path.insert(0, os.path.dirname(__file__))
from mz import Exe
from addr import table

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def linear(e, s):
    if s.startswith("ovl"):
        n, off = s[3:].split(":")
        return (table(e)[int(n)][1] + 0x1000) * 16 + int(off, 16)
    if ":" in s:
        seg, off = (int(x, 16) for x in s.split(":"))
        return (seg + 0x1000) * 16 + off
    return int(s, 16)


def main():
    e = Exe(os.path.join(ROOT, "original/game/Warlrd2/WARLORD2.EXE"))
    d = os.path.join(ROOT, "out/rea/decomp")
    lin = linear(e, sys.argv[1])
    ents = sorted(int(f[:-2], 16) for f in os.listdir(d) if f.endswith(".c"))
    ent = max(x for x in ents if x <= lin)
    t = open(os.path.join(d, "%06x.c" % ent)).read()
    for a, b in ((r"\((undefined[124]?|int|char|uint|byte) \*\)", ""), (r"\((int|char|uint)\)", ""), (r"\s+", " ")):
        t = re.sub(a, b, t)
    mx = int(sys.argv[2]) if len(sys.argv) > 2 else 6000
    sk = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    print("[entry %#x, %d chars%s]" % (ent, len(t), "" if ent == lin else ", requested %#x" % lin))
    print(t[sk:sk + mx])


if __name__ == "__main__":
    main()
