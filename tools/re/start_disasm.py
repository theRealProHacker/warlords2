"""Annotated 16-bit disassembly listing of START.EXE (plain MZ, Borland C++ 1991, no overlay).

usage: python -I tools/re/start_disasm.py START.EXE OUTDIR
Writes OUTDIR/seg_SSSS.asm per code segment (segments = the relocated segment values).
Address notation (docs/research/start_exe.md):
  SSSS:OOOO   load-relative segment:offset; START img = SSSS*16 + OOOO; file off = img + 0xC00
  DS:OOOO     DGROUP, segment 0x109e (img 0x109e0 + OOOO)
Borland FPU emulator interrupts (INT 34h..3Bh = wait + ESC D8..DF, INT 3Dh = fwait) are
decoded as the FPU instruction they stand for.
"""
from __future__ import annotations
import os, struct, sys
import capstone

DGROUP = 0x109E
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_16)
md.detail = True


def load(path):
    d = open(path, "rb").read()
    (sig, lastpg, pages, nrel, hdrpar, _a, _b, ss, sp, _ck, ip, cs, reloff, _ov) = struct.unpack_from("<2s13H", d, 0)
    assert sig == b"MZ"
    end = (pages - 1) * 512 + lastpg if lastpg else pages * 512
    img = bytearray(d[hdrpar * 16:end])
    relocs = set()
    for i in range(nrel):
        off, seg = struct.unpack_from("<HH", d, reloff + 4 * i)
        relocs.add(seg * 16 + off)
    return img, relocs, (cs, ip), (ss, sp)


def cstr(img, off, maxlen=70):
    p = DGROUP * 16 + off
    if p >= len(img):
        return None
    q = p
    while q < len(img) and q - p < maxlen and 32 <= img[q] < 127:
        q += 1
    if q - p >= 3 and q < len(img) and img[q] in (0, 10, 13) and (img[p - 1] == 0 or not 32 <= img[p - 1] < 127):
        return img[p:q].decode("ascii")
    return None


def main():
    exe, out = sys.argv[1], sys.argv[2]
    os.makedirs(out, exist_ok=True)
    img, relocs, (cs, ip), _ = load(exe)
    segs = sorted({struct.unpack_from("<H", img, r)[0] for r in relocs} | {0})
    code_segs = [s for s in segs if s < DGROUP]
    bounds = code_segs + [DGROUP]
    index = []
    for i, s in enumerate(code_segs):
        base, lim = s * 16, bounds[i + 1] * 16
        code = bytes(img[base:lim])
        lines = ["; seg %04x  img %#06x..%#06x  file off %#x" % (s, base, lim, base + 0xC00)]
        pos = 0
        while pos < len(code):
            b0 = code[pos]
            if b0 == 0xCD and pos + 1 < len(code) and 0x34 <= code[pos + 1] <= 0x3B:
                esc = bytes([0xD8 + code[pos + 1] - 0x34]) + code[pos + 2:pos + 12]
                ins = next(md.disasm(esc, pos), None)
                if ins:
                    ln = ins.size + 1
                    lines.append("  %04x:%04x  %-16s %-40s ; emu int %02x" % (s, pos, code[pos:pos + ln].hex(), "f-" + ins.mnemonic + " " + ins.op_str, code[pos + 1]))
                    pos += ln
                    continue
            if b0 == 0xCD and pos + 1 < len(code) and code[pos + 1] == 0x3D:
                lines.append("  %04x:%04x  %-16s %-40s ; emu" % (s, pos, "cd3d", "fwait"))
                pos += 2
                continue
            ins = next(md.disasm(code[pos:pos + 16], pos), None)
            if ins is None:
                lines.append("  %04x:%04x  %-16s db %02x" % (s, pos, "%02x" % b0, b0))
                pos += 1
                continue
            b = code[pos:pos + ins.size]
            note = ""
            if b0 == 0x9A and ins.size == 5:
                off, sg = struct.unpack_from("<HH", b, 1)
                note = "-> %04x:%04x" % (sg, off)
            elif b0 == 0xE8 and ins.size == 3:
                note = "-> %04x:%04x" % (s, (pos + 3 + struct.unpack_from("<h", b, 1)[0]) & 0xFFFF)
            else:
                for o in ins.operands:
                    v = None
                    if o.type == capstone.x86.X86_OP_IMM:
                        v = o.imm & 0xFFFF
                    elif o.type == capstone.x86.X86_OP_MEM and o.mem.base == 0 and o.mem.index == 0:
                        v = o.mem.disp & 0xFFFF
                    if v is not None and v >= 0x40 and not (0x70 <= b0 <= 0x7F) and b0 not in (0xE9, 0xEB):
                        st = cstr(img, v)
                        if st and len(st) >= 3:
                            note += ' ; "%s"' % st
            if any(base + pos + k in relocs for k in range(ins.size)):
                note += " [reloc]"
            if b0 in (0x55,) and code[pos + 1:pos + 3] == b"\x8b\xec":
                lines.append("")
                lines.append("proc_%04x_%04x:" % (s, pos))
            lines.append("  %04x:%04x  %-16s %-40s %s" % (s, pos, b.hex(), ins.mnemonic + " " + ins.op_str, note))
            pos += ins.size
        open(os.path.join(out, "seg_%04x.asm" % s), "w").write("\n".join(lines) + "\n")
        index.append("seg %04x img %#06x size %#x" % (s, base, lim - base))
    open(os.path.join(out, "_segments.txt"), "w").write("entry %04x:%04x\n" % (cs, ip) + "\n".join(index) + "\n")


if __name__ == "__main__":
    main()
