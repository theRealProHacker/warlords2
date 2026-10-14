"""Address conversion between the notations used in docs/research/exe_logic.md.

  ovlNN:OOOO  overlay NN, offset in its code   (original file: ovl.file_off + OOOO)
  SSSS:OOOO   resident load-relative segment   (original file: 0x2000 + SSSS*16 + OOOO)
  flat linear address in out/rea/WARLORD2_flat.exe as rea/Ghidra shows it (load segment 0x1000)

usage: python -I tools/re/addr.py <WARLORD2.EXE> <ovlNN:OOOO | SSSS:OOOO | 0xLINEAR> ...
"""
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
from mz import Exe


def table(e):
    seg = len(e.image) // 16
    out = []
    for o in e.ovls:
        out.append((o, seg))
        seg += (o.code_size + 15) // 16
    return out


def convert(e, s):
    t = table(e)
    if s.startswith("ovl"):
        n, off = s[3:].split(":")
        o, seg = t[int(n)]
        off = int(off, 16)
        return "%s = flat %04x:%04x = linear %#x = orig file %#x" % (s, seg, off, (seg + 0x1000) * 16 + off, o.file_off + off)
    if ":" in s:
        seg, off = (int(x, 16) for x in s.split(":"))
        return "%s = linear %#x = orig file %#x" % (s, (seg + 0x1000) * 16 + off, 0x2000 + seg * 16 + off)
    lin = int(s, 16) - 0x10000
    for o, seg in t:
        if seg * 16 <= lin < seg * 16 + o.code_size:
            return "%s = ovl%02d:%04x = orig file %#x" % (s, o.index, lin - seg * 16, o.file_off + lin - seg * 16)
    return "%s = resident linear, image offset %#x, orig file %#x" % (s, lin, 0x2000 + lin)


if __name__ == "__main__":
    e = Exe(sys.argv[1])
    for a in sys.argv[2:]:
        print(convert(e, a))
