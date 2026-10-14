"""Dump the compacted Ghidra decompilation of every function of the AI overlays.

usage: python -I tools/re/ai_dump.py [OUTDIR]     (default out/re/ai/dc)
Writes OUTDIR/ovlNN.c for NN in 18..30 (every out/rea/decomp entry inside the overlay, in
address order, each headed by its ovlNN:OOOO name) and OUTDIR/res_SSSS.c for the resident
segments the AI calls into (0555 pathfinder, 0a8b/0b62/0c8c stack helpers).
"""
import os, re, sys
sys.path.insert(0, os.path.dirname(__file__))
from mz import Exe
from addr import table

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OVLS = range(18, 31)
RES = (0x0555, 0x0a8b, 0x0b62, 0x0c8c)


def compact(t):
    for a, b in ((r"\((undefined[124]?|int|char|uint|byte) \*\)", ""), (r"\((int|char|uint)\)", ""), (r"\s+", " ")):
        t = re.sub(a, b, t)
    return t


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "out/re/ai/dc")
    os.makedirs(out, exist_ok=True)
    e = Exe(os.path.join(ROOT, "original/game/Warlrd2/WARLORD2.EXE"))
    d = os.path.join(ROOT, "out/rea/decomp")
    ents = sorted(int(f[:-2], 16) for f in os.listdir(d) if f.endswith(".c"))
    ranges = []
    for o, seg in table(e):
        if o.index in OVLS:
            base = (seg + 0x1000) * 16
            ranges.append(("ovl%02d" % o.index, base, base + o.code_size))
    segs = sorted(RES)
    for s in segs:
        base = (s + 0x1000) * 16
        ranges.append(("res_%04x" % s, base, base + 0x10000))
    for name, lo, hi in ranges:
        with open(os.path.join(out, name + ".c"), "w") as f:
            for x in ents:
                if lo <= x < hi:
                    t = compact(open(os.path.join(d, "%06x.c" % x)).read())
                    if name.startswith("res_") and not re.search(r"FUN_%04x_%04x" % (int(name[4:], 16) + 0x1000, x - lo), t):
                        continue   # entry belongs to a later segment
                    f.write("// %s:%04x (L %#x)\n%s\n\n" % (name.replace("res_", ""), x - lo, x, t))


if __name__ == "__main__":
    main()
