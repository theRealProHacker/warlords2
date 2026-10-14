"""Flatten the Borland VROOMM overlay of WARLORD2.EXE into a plain MZ image.

usage: python -I tools/re/flatten_overlay.py <WARLORD2.EXE> <out.exe> [report.json]

Layout facts this relies on (all checked at run time, the script aborts otherwise):
  * the MZ load image ends at the 'FBOV' header: 'FBOV', u32 size, u32 file offset of the
    VROOMM segment table, u32 number of 8-byte entries (u16 seg, u16 maxoff, u16 flags, u16 minoff);
  * every overlay has a resident stub segment: CD 3F 00 00, u32 offset (relative to FBOV+16),
    u16 code size, u16 fixup size, u16 entry count, padding to 0x20, then 5-byte entries
    CD 3F <u16 target offset> 00;
  * overlay data = code followed by u16 fixup offsets; the word at each fixup offset is a byte
    offset into the segment table, i.e. the wanted segment is segtab[word/8].seg.

Transformation: the resident image is kept byte-identical except that each stub entry becomes
`JMP FAR newseg:target` (EA off16 seg16).  Each overlay's code is appended as its own
paragraph-aligned segment after the resident image, its fixup words are replaced by the real
(load-relative) segment values, and an MZ relocation is added for every fixup and every patched
stub entry.  The original file is only read.
"""
from __future__ import annotations
import hashlib, json, os, struct, sys
sys.path.insert(0, os.path.dirname(__file__))
from mz import Exe


def flatten(src, dst, report=None):
    e = Exe(src)
    raw = e.raw
    assert raw[e.fbov:e.fbov + 4] == b"FBOV"
    segtab = [struct.unpack_from("<4H", raw, e.segtab_off + 8 * i) for i in range(e.nsegs)]
    ovl_entries = [s for s in segtab if s[2] & 2]
    assert len(ovl_entries) == len(e.ovls), (len(ovl_entries), len(e.ovls))
    assert [s[0] for s in ovl_entries] == [o.stub_seg for o in e.ovls]
    # overlays are stored in stub order, never overlapping; the padding between one overlay's
    # fixup list and the next overlay (1..76 bytes in this file) is all zero, and the last
    # overlay (plus zero padding) ends at FBOV+16+size == end of file.
    pos = e.fbov + 16
    for o in e.ovls:
        assert o.file_off >= pos and not any(raw[pos:o.file_off]), (o.index, hex(o.file_off), hex(pos))
        assert len(o.entries) == o.nentries
        pos = o.file_off + o.code_size + o.fix_size
    assert not any(raw[pos:]) and e.fbov + 16 + e.ov_size == len(raw), (hex(pos), hex(len(raw)))

    image = bytearray(e.image)
    new_relocs = list(e.relocs)        # linear addresses, load base 0
    assert len(image) % 16 == 0
    seg = len(image) // 16
    rep = {"overlays": []}
    for o in e.ovls:
        code = bytearray(raw[o.file_off:o.file_off + o.code_size])
        for f in o.fixups:
            v = struct.unpack_from("<H", code, f)[0]
            assert v % 8 == 0 and v // 8 < e.nsegs, (o.index, hex(f), hex(v))
            struct.pack_into("<H", code, f, segtab[v // 8][0])
            new_relocs.append(seg * 16 + f)
        base = o.stub_seg * 16
        assert image[base:base + 4] == b"\xcd\x3f\x00\x00"
        for k, tgt in enumerate(o.entries):
            p = base + 0x20 + 5 * k
            assert image[p:p + 2] == b"\xcd\x3f" and image[p + 4] == 0 and tgt < o.code_size
            image[p:p + 5] = b"\xea" + struct.pack("<HH", tgt, seg)
            new_relocs.append(p + 3)
        rep["overlays"].append({"index": o.index, "stub_seg": "%04x" % o.stub_seg, "new_seg": "%04x" % seg,
                                "ghidra_linear_base": "%#x" % ((seg + 0x1000) * 16),
                                "file_off": o.file_off, "code_size": o.code_size,
                                "fixups": len(o.fixups), "entries": len(o.entries)})
        image += code + bytes(-len(code) % 16)
        seg += (len(code) + 15) // 16
    assert len(set(new_relocs)) == len(new_relocs)

    hdr_len = (0x40 + 4 * len(new_relocs) + 511) & ~511
    total = hdr_len + len(image)
    hdr = bytearray(raw[:0x20] + bytes(0x20))   # keep MZ fields + TLINK tag, clear the rest (0x3c must not look like e_lfanew)
    struct.pack_into("<HH", hdr, 2, total % 512, (total + 511) // 512)
    struct.pack_into("<H", hdr, 6, len(new_relocs))
    struct.pack_into("<H", hdr, 8, hdr_len // 16)
    struct.pack_into("<H", hdr, 0x18, 0x40)
    out = bytearray(hdr)
    for l in new_relocs:
        # express every relocation as seg:off with off < 16 where possible
        out += struct.pack("<HH", l & 0xf, l >> 4)
    out += bytes(hdr_len - len(out))
    out += image
    os.makedirs(os.path.dirname(os.path.abspath(dst)), exist_ok=True)
    open(dst, "wb").write(out)
    rep.update({
        "source_sha256": hashlib.sha256(raw).hexdigest(), "source_size": len(raw),
        "flat_sha256": hashlib.sha256(out).hexdigest(), "flat_size": len(out),
        "resident_image_bytes": len(e.image), "fbov_offset": e.fbov, "fbov_size": e.ov_size,
        "segtab_file_offset": e.segtab_off, "segtab_entries": e.nsegs,
        "overlay_count": len(e.ovls), "overlay_code_bytes": sum(o.code_size for o in e.ovls),
        "overlay_fixups": sum(len(o.fixups) for o in e.ovls),
        "stub_entries_patched": sum(len(o.entries) for o in e.ovls),
        "relocs_before": len(e.relocs), "relocs_after": len(new_relocs),
        "flat_header_bytes": hdr_len, "first_overlay_seg": rep["overlays"][0]["new_seg"],
    })
    if report:
        json.dump(rep, open(report, "w"), indent=1)
    return rep


if __name__ == "__main__":
    r = flatten(*sys.argv[1:4])
    print({k: v for k, v in r.items() if k != "overlays"})
