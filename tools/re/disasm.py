"""Annotated 16-bit disassembly listing of WARLORD2.EXE (resident + VROOMM overlays).

usage: python -I tools/re/disasm.py WARLORD2.EXE OUTDIR
Writes OUTDIR/res_SSSS.asm for resident code segments and OUTDIR/ovlNN.asm.
Address notation used throughout the docs:
  SSSS:OOOO      resident code, load-relative segment (file off = 0x2000 + SSSS*16 + OOOO)
  ovlNN:OOOO     overlay NN code offset (file off = ovl.file_off + OOOO)
  DS:OOOO        DGROUP (segment 0x3125; file off = 0x2000 + 0x31250 + OOOO)
"""
from __future__ import annotations
import os, struct, sys
sys.path.insert(0, os.path.dirname(__file__))
from mz import Exe
import capstone

DGROUP = 0x3125
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_16)


def cstr(e, seg, off, maxlen=60):
    p = seg * 16 + off
    img = e.image
    if p >= len(img):
        return None
    q = p
    while q < len(img) and q - p < maxlen and 32 <= img[q] < 127:
        q += 1
    if q - p >= 3 and q < len(img) and img[q] in (0, 10, 13) and (p == 0 or img[p - 1] == 0 or not (32 <= img[p - 1] < 127)):
        return img[p:q].decode("ascii")
    return None


class Region:
    def __init__(self, name, code, base_lin, seg=None, ovl=None, start=0):
        self.name, self.code, self.base, self.seg, self.ovl, self.start = name, code, base_lin, seg, ovl, start
        self.entries = set()
        self.data = {}      # off -> length of jump-table data


def build(e: Exe):
    regs = {}
    segs = []
    for i in range(42):
        s, mx, fl, mn = struct.unpack_from("<4H", e.raw, e.segtab_off + 8 * i)
        segs.append((s, mx, mn))
    for s, mx, mn in segs:
        r = Region("res_%04x" % s, bytes(e.image[s * 16:s * 16 + mx + 1]), s * 16, seg=s, start=mn)
        regs[("r", s)] = r
    for o in e.ovls:
        r = Region("ovl%02d" % o.index, o.code, 0, ovl=o)
        r.entries.update(o.entries)
        r.fix = set(o.fixups)
        regs[("o", o.stub_seg)] = r
    return regs


def far_name(e, regs, seg, off):
    t = e.stub_target(seg, off)
    if t:
        return ("o", t[0].stub_seg), t[1], "ovl%02d:%04x" % (t[0].index, t[1])
    if ("r", seg) in regs:
        return ("r", seg), off, "%04x:%04x" % (seg, off)
    return None, off, "%04x:%04x" % (seg, off)


def sweep(e, regs, r, emit=None):
    code = r.code
    n = len(code)
    pos = r.start
    ents = r.entries
    sorted_e = sorted(ents)
    import bisect
    while pos < n:
        if pos in r.data:
            ln = r.data[pos]
            if emit:
                ws = struct.unpack_from("<%dH" % (ln // 2), code, pos)
                emit(pos, code[pos:pos + ln], "dw " + ",".join("%04x" % w for w in ws), "jump table")
            pos += ln
            continue
        ins = next(md.disasm(code[pos:pos + 16], pos, 1), None)
        if ins is None:
            if emit:
                emit(pos, code[pos:pos + 1], "db %02x" % code[pos], "")
            pos += 1
            continue
        end = pos + ins.size
        k = bisect.bisect_right(sorted_e, pos)
        if k < len(sorted_e) and sorted_e[k] < end:
            # instruction straddles a known entry: emit bytes and resync
            if emit:
                emit(pos, code[pos:sorted_e[k]], "db " + code[pos:sorted_e[k]].hex(), "resync")
            pos = sorted_e[k]
            continue
        nd = [d for d in r.data if pos < d < end]
        if nd:
            if emit:
                emit(pos, code[pos:min(nd)], "db " + code[pos:min(nd)].hex(), "resync")
            pos = min(nd)
            continue
        b = code[pos:end]
        note = ""
        op = b[0]
        if op == 0x9a and len(b) == 5:
            off, seg = struct.unpack_from("<HH", b, 1)
            key, toff, nm = far_name(e, regs, seg, off)
            if key and emit is None:
                regs[key].entries.add(toff)
            note = "-> " + nm
        elif op == 0xe8 and len(b) == 3:
            t = (end + struct.unpack_from("<h", b, 1)[0]) & 0xffff
            if emit is None and t < n:
                ents.add(t)
        elif op == 0x0e and code[end:end + 1] == b"\xe8":
            pass
        elif b[:3] == b"\x2e\xff\xa7" or b[:3] == b"\x2e\xff\xa4" or b[:3] == b"\x2e\xff\xa5":
            tbl = struct.unpack_from("<H", b, 3)[0]
            if emit is None and tbl < n and tbl not in r.data:
                # read plausible table
                q = tbl
                lim = n
                tg = []
                while q + 2 <= lim:
                    w = struct.unpack_from("<H", code, q)[0]
                    if w >= n or w < r.start:
                        break
                    tg.append(w)
                    if w > tbl and w < lim:
                        lim = w
                    q += 2
                    if len(tg) > 512:
                        break
                if tg:
                    r.data[tbl] = 2 * len(tg)
                    ents.update(tg)
                    r.sw = getattr(r, "sw", set()) | set(tg)
        if emit:
            # annotate DGROUP string refs
            txt = "%s %s" % (ins.mnemonic, ins.op_str)
            for o in ins.operands:
                v = None
                if o.type == capstone.x86.X86_OP_IMM:
                    v = o.imm & 0xffff
                elif o.type == capstone.x86.X86_OP_MEM and o.mem.base == 0 and o.mem.index == 0:
                    v = o.mem.disp & 0xffff
                if v is not None and v >= 0x40 and op not in (0xe8, 0xe9, 0x9a) and not (0x70 <= op <= 0x7f) and op != 0xeb:
                    s = cstr(e, DGROUP, v)
                    if s and len(s) >= 4:
                        note += ' ; "%s"' % s
            emit(pos, b, txt, note)
        pos = end


def main():
    exe, out = sys.argv[1], sys.argv[2]
    os.makedirs(out, exist_ok=True)
    e = Exe(exe)
    regs = build(e)
    for _ in range(3):
        for r in regs.values():
            sweep(e, regs, r)
    md.detail = True
    for r in regs.values():
        lines = []
        if r.ovl:
            lines.append("; %s stub %04x file_off %#x size %#x" % (r.name, r.ovl.stub_seg, r.ovl.file_off, r.ovl.code_size))
        else:
            lines.append("; %s file_off %#x" % (r.name, 0x2000 + r.base))

        def emit(pos, b, txt, note, r=r, lines=lines):
            if pos in r.entries:
                tag = "case" if pos in getattr(r, "sw", ()) and r.code[pos:pos+1] != b"\x55" and r.code[pos:pos+1] != b"\xc8" else "ENTRY"
                if tag == "ENTRY":
                    lines.append("")
                lines.append("%s_%04x:  ; %s" % (r.name, pos, tag))
            lines.append("  %04x  %-16s %-40s %s" % (pos, b[:8].hex(), txt, note))
        sweep(e, regs, r, emit)
        open(os.path.join(out, r.name + ".asm"), "w").write("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
