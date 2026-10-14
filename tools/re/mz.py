"""MZ + Borland VROOMM (FBOV) loader for WARLORD2.EXE.

Pure analysis helper: loads the resident image, applies MZ relocations with
load segment 0, locates the overlay stub segments (INT 3Fh headers) and reads
each overlay's code + fixups from the FBOV area appended to the EXE.
"""
from __future__ import annotations
import struct
from dataclasses import dataclass, field


@dataclass
class Ovl:
    index: int
    stub_seg: int          # load-relative segment of the stub header
    file_off: int          # absolute file offset of the overlay code
    code_size: int
    fix_size: int
    nentries: int
    entries: list = field(default_factory=list)   # entry offsets inside the overlay code
    code: bytes = b""
    fixups: list = field(default_factory=list)


class Exe:
    def __init__(self, path):
        self.raw = open(path, "rb").read()
        d = self.raw
        (sig, lastpg, pages, nrel, hdrpar, _mina, _maxa, self.ss, self.sp, _ck,
         self.ip, self.cs, reloff, _ov) = struct.unpack_from("<2s13H", d, 0)
        assert sig == b"MZ"
        self.hdr = hdrpar * 16
        self.img_end = (pages - 1) * 512 + lastpg if lastpg else pages * 512
        self.image = bytearray(d[self.hdr:self.img_end])
        self.relocs = []
        for i in range(nrel):
            off, seg = struct.unpack_from("<HH", d, reloff + 4 * i)
            self.relocs.append(seg * 16 + off)       # linear, load base 0
        self.relocset = set(self.relocs)
        self.fbov = self.img_end
        self.ovls: list[Ovl] = []
        if d[self.fbov:self.fbov + 4] == b"FBOV":
            self.ov_size, self.segtab_off, self.nsegs = struct.unpack_from("<III", d, self.fbov + 4)
            self._find_stubs()

    # -- overlays ---------------------------------------------------------
    def _find_stubs(self):
        img = self.image
        base = self.fbov + 16      # overlay offsets are relative to the end of the 16-byte FBOV header
        seg = 0
        idx = 0
        while seg * 16 + 0x20 <= len(img):
            p = seg * 16
            if img[p:p + 4] == b"\xcd\x3f\x00\x00":
                fileoff, codesz, fixsz, nent = struct.unpack_from("<IHHH", img, p + 4)
                absoff = base + fileoff
                if 0 < codesz and absoff + codesz + fixsz <= len(self.raw) and nent < 2000:
                    o = Ovl(idx, seg, absoff, codesz, fixsz, nent)
                    for k in range(nent):
                        e = p + 0x20 + 5 * k
                        if img[e:e + 2] != b"\xcd\x3f":
                            break
                        o.entries.append(struct.unpack_from("<H", img, e + 2)[0])
                    code = bytearray(self.raw[absoff:absoff + codesz])
                    o.fixups = list(struct.unpack_from("<%dH" % (fixsz // 2), self.raw, absoff + codesz))
                    # Overlay fixups: the word on disk is a byte offset into the VROOMM
                    # segment table (8-byte entries); replace it by that entry's segment.
                    for f in o.fixups:
                        v = struct.unpack_from("<H", code, f)[0]
                        if v % 8 == 0 and v // 8 < self.nsegs:
                            struct.pack_into("<H", code, f, struct.unpack_from("<H", self.raw, self.segtab_off + v)[0])
                    o.code = bytes(code)
                    self.ovls.append(o)
                    idx += 1
                    seg += (0x20 + 5 * nent + 15) // 16
                    continue
            seg += 1

    def stub_target(self, seg, off):
        """Resolve a far call seg:off that lands in an overlay stub -> (Ovl, code offset)."""
        for o in self.ovls:
            if o.stub_seg == seg:
                k, r = divmod(off - 0x20, 5)
                if r == 0 and 0 <= k < len(o.entries):
                    return o, o.entries[k]
        return None

    def lin(self, seg, off):
        return seg * 16 + off

    def file_off_res(self, lin):
        return self.hdr + lin


if __name__ == "__main__":
    import sys
    e = Exe(sys.argv[1])
    print("hdr %#x img_end %#x entry %04x:%04x relocs %d" % (e.hdr, e.img_end, e.cs, e.ip, len(e.relocs)))
    print("fbov size %#x segtab %#x nsegs %d" % (e.ov_size, e.segtab_off, e.nsegs))
    tot = 0
    for o in e.ovls:
        tot += o.code_size + o.fix_size
        print("ovl%02d stub %04x file %#07x code %#06x fix %#05x ents %d(%d)" % (
            o.index, o.stub_seg, o.file_off, o.code_size, o.fix_size, o.nentries, len(o.entries)))
    print(len(e.ovls), hex(tot))
