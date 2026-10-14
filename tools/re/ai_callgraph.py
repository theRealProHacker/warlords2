"""Call graph and data cross-references of the computer-player code (docs/research/ai.md).

usage: python -I tools/re/ai_callgraph.py [ASMDIR] [OUTDIR]
       defaults: out/asm  out/re/ai

Reads the capstone listings written by tools/re/disasm.py and writes
  OUTDIR/funcs.tsv        every function: start, end, size, callees, callers
  OUTDIR/callgraph.txt    the tree reachable from the AI entry points (each function once,
                          later occurrences as '= see above'), with rnd() sites marked
  OUTDIR/reach.txt        the reachable set grouped by region, with sizes
  OUTDIR/xref_ds.tsv      DGROUP offsets referenced by reachable functions (R/W per function)
  OUTDIR/xref_2c04.tsv    the same for the scenario image 2c04 (= SCN offsets)
  OUTDIR/xref_ai.tsv      the same for the AI parameter block (far pointer DS:40ee)
  OUTDIR/xref_far.tsv     the same for other far pointers held in DGROUP (es loaded by les [X])
  OUTDIR/ds_exclusive.txt DGROUP / 2c04 offsets touched only by AI-reachable functions

Function starts are the listing's ENTRY labels plus every near-call target.  Segment
registers are tracked per straight-line run: `mov es, reg` after `mov reg, imm16`, and
`les bx, [X]` (directly or through a local that was loaded from [X]).  Array bases are the
displacement of the operand ([bx + 0x40ca] counts as 0x40ca).  This is a tracing aid, not
proof: every statement in ai.md is checked against the listing or the decompile.
"""
import collections, glob, os, re, sys

LINE = re.compile(r"^  ([0-9a-f]{4})  ([0-9a-f]+)\s+(.*?)\s*(?:-> (\S+))?\s*(;.*)?$")
LABEL = re.compile(r"^(\w+)_([0-9a-f]{4}):\s*;\s*(\w+)")
MEM = re.compile(r"(?:(byte|word|dword) ptr )?(?:(es|ss|cs|ds):)?\[([^\]]*)\]")
WRITE_OPS = {"mov", "add", "sub", "inc", "dec", "or", "and", "xor", "shl", "shr", "sar", "sal",
             "neg", "not", "adc", "sbb", "pop", "rol", "ror", "rcl", "rcr", "movsb", "movsw", "stosw"}
RND = "ovl59:02bf"

ENTRIES = [  # AI entry points: the computer turn and every AI hook called from other code
    "ovl25:0000", "ovl25:0519", "ovl25:0919", "ovl25:09d7", "ovl25:09ab", "ovl26:0000",
    "ovl26:0080", "ovl26:038d", "ovl28:0427", "ovl22:15c3", "ovl23:0478", "ovl29:0000",
    "ovl29:0da9", "ovl29:0dff", "ovl29:0fd5", "ovl29:103d", "ovl29:1771", "ovl30:0000",
    "ovl30:0034",
]
CORE = re.compile(r"^ovl(1[89]|2[0-9]|30):")   # the AI overlays


def region_name(fname):
    return os.path.basename(fname)[:-4].replace("res_", "")


def parse(asmdir):
    regions = {}
    for f in sorted(glob.glob(os.path.join(asmdir, "*.asm"))):
        rn = region_name(f)
        ins, labels = [], set()
        for l in open(f).read().split("\n"):
            m = LABEL.match(l)
            if m and m.group(3) == "ENTRY":
                labels.add(int(m.group(2), 16))
            m = LINE.match(l)
            if m:
                ins.append((int(m.group(1), 16), m.group(3), m.group(4)))
        for off, txt, tgt in ins:
            if txt.startswith("call ") and not tgt:
                a = txt[5:].strip()
                if re.fullmatch(r"0x[0-9a-f]+|\d+", a):
                    labels.add(int(a, 0))
        regions[rn] = (ins, sorted(labels))
    return regions


def fname(rn, off):
    return "%s:%04x" % (rn, off)


def split(regions):
    funcs = {}
    for rn, (ins, labels) in regions.items():
        if not labels:
            continue
        cur = None
        li = 0
        for off, txt, tgt in ins:
            while li < len(labels) and labels[li] <= off:
                cur = labels[li]
                li += 1
            if cur is None:
                continue
            funcs.setdefault(fname(rn, cur), []).append((off, txt, tgt))
    return funcs


def analyse(name, body):
    rn = name.split(":")[0]
    calls, rnds, refs = [], [], []
    regval = {}
    es = None
    local_alias = {}
    for off, txt, tgt in body:
        op = txt.split(" ", 1)[0]
        args = txt[len(op):].strip()
        if op in ("call", "lcall"):
            if tgt:
                calls.append((off, tgt))
                if tgt == RND:
                    rnds.append(off)
            elif op == "call" and re.fullmatch(r"0x[0-9a-f]+|\d+", args):
                calls.append((off, fname(rn, int(args, 0))))
            es = None
            regval = {}
            continue
        if op in ("ret", "retf", "jmp") or op.startswith("j"):
            pass
        m = re.fullmatch(r"(\w\w), (0x[0-9a-f]+|\d+)", args) if op == "mov" else None
        if m:
            regval[m.group(1)] = int(m.group(2), 0)
        m = re.fullmatch(r"es, (\w\w)", args) if op == "mov" else None
        if m:
            v = regval.get(m.group(1))
            es = ("%04x" % v) if v is not None else "?"
        if op == "les":
            mm = MEM.search(args)
            inner = mm.group(3) if mm else ""
            if re.fullmatch(r"0x[0-9a-f]+", inner):
                es = "far@%04x" % int(inner, 16)
            elif inner.startswith("bp") and inner in local_alias:
                es = "far@%04x" % local_alias[inner]
            else:
                es = "far?"
        # remember locals loaded from a DGROUP far pointer: mov ax,[X] ; mov [bp-N], ax
        m = re.fullmatch(r"(ax|dx), word ptr \[(0x[0-9a-f]+)\]", args) if op == "mov" else None
        if m:
            regval["src_" + m.group(1)] = int(m.group(2), 16)
        m = re.fullmatch(r"word ptr \[(bp - \w+)\], (ax|dx)", args) if op == "mov" else None
        if m and ("src_" + m.group(2)) in regval:
            src = regval["src_" + m.group(2)]
            # the low word of the far pointer is at the lower address
            local_alias[m.group(1)] = src if m.group(2) == "ax" else src - 2
        for k, mm in enumerate(MEM.finditer(args)):
            seg, inner = mm.group(2), mm.group(3)
            if seg in ("ss", "cs"):
                continue
            if "bp" in inner and seg is None:
                continue
            disp = 0
            dm = re.search(r"(?:^|[+-] )(0x[0-9a-f]+|\d+)$", inner.strip())
            if dm:
                disp = int(dm.group(1), 0)
                if "- " + dm.group(1) in inner:
                    disp = -disp
            if not dm and not re.fullmatch(r"0x[0-9a-f]+", inner):
                disp = 0
            if re.fullmatch(r"0x[0-9a-f]+", inner):
                disp = int(inner, 16)
            if seg == "es":
                space = es or "?"
            else:
                space = "DS"
            w = (k == 0 and op in WRITE_OPS and args.index(mm.group(0)) == 0)
            if op in ("cmp", "test", "push"):
                w = False
            if op == "les" or op == "lea":
                w = False
            refs.append((off, space, disp & 0xffff, "W" if w else "R"))
    return calls, rnds, refs


def main():
    root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    asmdir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(root, "out/asm")
    outdir = sys.argv[2] if len(sys.argv) > 2 else os.path.join(root, "out/re/ai")
    os.makedirs(outdir, exist_ok=True)
    funcs = split(parse(asmdir))
    info = {n: analyse(n, b) for n, b in funcs.items()}
    callers = collections.defaultdict(set)
    for n, (calls, _, _) in info.items():
        for _, t in calls:
            callers[t].add(n)

    def size(n):
        b = funcs[n]
        return b[-1][0] - b[0][0] + 1

    with open(os.path.join(outdir, "funcs.tsv"), "w") as f:
        f.write("func\tsize\tcallees\tcallers\n")
        for n in sorted(funcs):
            cs = sorted({t for _, t in info[n][0]})
            f.write("%s\t%d\t%s\t%s\n" % (n, size(n), ",".join(cs), ",".join(sorted(callers[n]))))

    # reachability; library code is listed but not expanded
    LEAF = re.compile(r"^(0000|1012|1133|116d|11b5|11e2|129d|12bf|1372|14b0|14d0|151d|1553|155e|15de|1704|197c|0d28|0a4c):|^ovl59:|^ovl61:131b|^ovl25:0dc9")
    seen, order = set(), []
    lines = []

    def walk(n, depth):
        tag = ""
        if n in info and info[n][1]:
            tag = "  rnd@" + ",".join("%04x" % o for o in info[n][1])
        if n in seen:
            lines.append("  " * depth + n + "  = see above")
            return
        seen.add(n)
        order.append(n)
        sz = (" [%d]" % size(n)) if n in funcs else " [no listing]"
        lines.append("  " * depth + n + sz + tag)
        if LEAF.match(n) or n not in info:
            return
        done = set()
        for _, t in info[n][0]:
            if t in done:
                continue
            done.add(t)
            walk(t, depth + 1)

    for e in ENTRIES:
        lines.append("== entry %s" % e)
        walk(e, 1)
    open(os.path.join(outdir, "callgraph.txt"), "w").write("\n".join(lines) + "\n")

    byreg = collections.defaultdict(list)
    for n in order:
        byreg[n.split(":")[0]].append(n)
    with open(os.path.join(outdir, "reach.txt"), "w") as f:
        tot = 0
        for r in sorted(byreg):
            s = sum(size(n) for n in byreg[r] if n in funcs)
            tot += s if not LEAF.match(byreg[r][0]) else 0
            f.write("%s  %d funcs  %d bytes\n    %s\n" % (r, len(byreg[r]), s, " ".join(n.split(":")[1] for n in byreg[r])))
        f.write("total non-library bytes reachable: %d\n" % tot)

    reach = {n for n in order if n in info and not LEAF.match(n)}
    tabs = collections.defaultdict(lambda: collections.defaultdict(set))
    alltabs = collections.defaultdict(lambda: collections.defaultdict(set))
    for n, (_, _, refs) in info.items():
        for off, space, disp, rw in refs:
            key = space
            alltabs[key][disp].add(n)
            if n in reach:
                tabs[key][disp].add("%s%s" % (n, rw))
    files = {"DS": "xref_ds.tsv", "2c04": "xref_2c04.tsv", "far@40ee": "xref_ai.tsv"}
    for key, fn in files.items():
        with open(os.path.join(outdir, fn), "w") as f:
            for d in sorted(tabs[key]):
                ws = sorted(tabs[key][d])
                f.write("%04x\t%s\n" % (d, " ".join(ws)))
    with open(os.path.join(outdir, "xref_far.tsv"), "w") as f:
        for key in sorted(tabs):
            if key in files:
                continue
            for d in sorted(tabs[key]):
                f.write("%s\t%04x\t%s\n" % (key, d, " ".join(sorted(tabs[key][d]))))
    core = {n for n in info if CORE.match(n)}
    with open(os.path.join(outdir, "hooks.txt"), "w") as f:
        for n in sorted(core):
            for _, (calls, _, _) in [(n, info[n])]:
                pass
        for n in sorted(info):
            if n in core:
                continue
            for off, t in info[n][0]:
                if t in core:
                    f.write("%s\tcalled from %s (site %04x)\n" % (t, n, off))
    with open(os.path.join(outdir, "ds_exclusive.txt"), "w") as f:
        f.write("# DGROUP / 2c04 offsets referenced only by the AI overlays ovl18-ovl30\n")
        for key in ("DS", "2c04"):
            for d in sorted(alltabs[key]):
                users = alltabs[key][d]
                if users <= core:
                    f.write("%s:%04x\t%s\n" % (key, d, " ".join(sorted(users))))
    print("functions %d, reachable non-library %d" % (len(funcs), len(reach)))


if __name__ == "__main__":
    main()
