"""Call cross-references with reconstructed constant arguments.

usage: python -I tools/re/xref.py ASMDIR GAMEDIR
Prints every call to the dice roller (ovl59:02bf) and to the string getters
(ovl59:04f0 STRING.DAT, ovl59:0505 FILE.DAT, ovl59:051a ERROR.DAT) with the
arguments that were pushed as constants ('?' = computed at run time).
"""
import glob, os, re, struct, sys

LINE = re.compile(r"^  ([0-9a-f]{4})  ([0-9a-f]+)\s+(.*?)\s*(?:-> (\S+))?\s*(;.*)?$")


def load_tab(path):
    d = open(path, "rb").read()
    n = struct.unpack_from("<H", d, 0)[0] // 4
    out = []
    for g in range(n):
        off, cnt = struct.unpack_from("<HH", d, 4 * g)
        ws = struct.unpack_from("<%dH" % cnt, d, off)
        out.append([d[w:d.index(b"\0", w)].decode("cp437") for w in ws])
    return out


def args_before(lines, i, maxargs=8):
    """Walk back over the pushes directly preceding line i; return list of words (first arg first)."""
    out = []
    j = i - 1
    while j >= 0 and len(out) < maxargs:
        m = LINE.match(lines[j])
        if not m:
            break
        raw, txt = m.group(2), m.group(3)
        if txt in ("nop", "push cs"):
            j -= 1
            continue
        if not txt.startswith("push"):
            break
        op = txt[5:]
        if raw.startswith("6668") or raw.startswith("666a"):
            # 32-bit immediate push (imm32, or imm8 sign-extended): Borland pushes two
            # adjacent int arguments this way
            v = int(op, 16) if op.startswith("0x") else int(op)
            v &= 0xffffffff
            out += [v & 0xffff, v >> 16]
        elif raw.startswith("66"):
            out += ["?", "?"]
        elif re.fullmatch(r"-?(0x[0-9a-f]+|\d+)", op):
            v = int(op, 0) & 0xffff
            out.append(v)
        else:
            out.append("?")
        j -= 1
    return out


def sgn(v):
    return v - 0x10000 if isinstance(v, int) and v >= 0x8000 else v


def main():
    asm, game = sys.argv[1], sys.argv[2]
    tabs = {"ovl59:04f0": load_tab(os.path.join(game, "DATA/STRING.DAT")),
            "ovl59:0505": load_tab(os.path.join(game, "DATA/FILE.DAT")),
            "ovl59:051a": load_tab(os.path.join(game, "DATA/ERROR.DAT"))}
    for f in sorted(glob.glob(os.path.join(asm, "*.asm"))):
        name = os.path.basename(f)[:-4]
        lines = open(f).read().split("\n")
        func = "?"
        for i, l in enumerate(lines):
            if l.endswith("; ENTRY"):
                func = l.split(":")[0]
            m = LINE.match(l)
            if not m or not m.group(4):
                continue
            tgt = m.group(4)
            if tgt == "ovl59:02bf":
                a = [sgn(x) for x in args_before(lines, i, 3)]
                print("RND %s:%s in %s  dice=%s sides=%s add=%s" % (name, m.group(1), func, *(a + ["?"] * 3)[:3]))
            elif tgt in tabs:
                a = args_before(lines, i, 2)
                a = (a + ["?", "?"])[:2]
                t = tabs[tgt]
                s = ""
                if isinstance(a[0], int) and a[0] < len(t):
                    g = t[a[0]]
                    if isinstance(a[1], int) and a[1] < len(g):
                        s = g[a[1]]
                    else:
                        s = "{" + g[0] + " ...}"
                print("STR%s %s:%s in %s  grp=%s idx=%s  %s" % ({"ovl59:04f0": "", "ovl59:0505": "F", "ovl59:051a": "E"}[tgt], name, m.group(1), func, sgn(a[0]), sgn(a[1]), s))


if __name__ == "__main__":
    main()
