"""compare.py BEFORE AFTER [AFTER2]: per script, shots / frame / state hashes; for every
changed shot, whether the diff lies inside DS:2a94 outside the screen-0 button rects and
whether the after pixels there equal MARBLE (0, 0, 224, 114) through the frame's colours."""
import json, os, sys
os.environ["SDL_VIDEODRIVER"] = "dummy"
import numpy as np
import pygame

sys.path.insert(0, "/home/rharvey/Dokumente/Programmieren/warlords2")
pygame.display.init(); pygame.display.set_mode((1, 1))
from warlords2.app import App
from warlords2.config import parse_args
from warlords2.ui.widgets import kit

a = App(parse_args(["--headless", "--no-voice"]))
k = kit(a)
R = (400, 355, 224, 114)
mask = np.zeros((640, 480), bool)
FULL = len(sys.argv) > 4
mask[400:624, 355:469] = True
for b in k.layouts.screen(0).buttons:
    x, y, w, h = b.rect
    mask[x:x + w, y:y + h] = False
marble = pygame.surfarray.array2d(k.picture(25))[0:224, 0:114]

before, after = sys.argv[1], sys.argv[2]
after2 = sys.argv[3] if len(sys.argv) > 3 else None


def man(d, n):
    p = os.path.join(d, n, "manifest.json")
    return json.load(open(p)) if os.path.exists(p) else None


def frames(m):
    out = {}
    for seg in m["segments"]:
        for i, h in enumerate(seg["frame_sha256"]):
            out[seg["first_frame"] + i * seg["frame_step"]] = h
    return out


def states(m):
    return [(c.get("label"), c.get("hash"), c.get("ok")) for c in m["checks"] if c["op"] == "state_hash"]


names = sorted(x for x in os.listdir(before) if os.path.isdir(os.path.join(before, x)) and not x.startswith("_"))
for n in names:
    mb, ma = man(before, n), man(after, n)
    line = [n]
    if after2:
        m2 = man(after2, n)
        same = ([s["sha256"] for s in ma["shots"]] == [s["sha256"] for s in m2["shots"]]
                and frames(ma) == frames(m2) and ma["engine_state_hash"] == m2["engine_state_hash"]
                and states(ma) == states(m2) and [c["ok"] for c in ma["checks"]] == [c["ok"] for c in m2["checks"]])
        line.append("repeat=%s" % ("same" if same else "DIFF"))
    line.append("state=%s" % ("same" if mb["engine_state_hash"] == ma["engine_state_hash"] and states(mb) == states(ma) else "DIFF"))
    line.append("checks_ok=%s" % all(c["ok"] for c in ma["checks"] if c["op"] != "golden"))
    fb, fa = frames(mb), frames(ma)
    line.append("frames %d/%d changed" % (sum(fb[f] != fa.get(f) for f in fb), len(fb)))
    ch = []
    for sb, sa in zip(mb["shots"], ma["shots"]):
        if sb["sha256"] == sa["sha256"]:
            continue
        pb = pygame.surfarray.array3d(pygame.image.load(sb["path"])).astype(int)
        pa = pygame.surfarray.array3d(pygame.image.load(sa["path"])).astype(int)
        d = (pb != pa).any(axis=2)
        outside = int((d & ~mask).sum())
        # the after pixels under the mask, compared with marble through the after frame's colours:
        # the same marble index must give the same RGB, and each RGB one index
        reg = pa[400:624, 355:469]
        m = d[400:624, 355:469]
        ok = True
        lut = {}
        for idx, rgb in zip(marble[m].tolist(), map(tuple, reg[m].tolist())):
            if lut.setdefault(idx, rgb) != rgb:
                ok = False
                break
        inj = len(set(lut.values())) == len(lut)
        ch.append("%s:%dpx%s%s" % (sb["name"], int(d.sum()), "" if outside == 0 else " OUTSIDE=%d" % outside,
                                   "" if ok and inj else " NOT-MARBLE"))
    line.append("shots %d/%d changed %s" % (len(ch), len(mb["shots"]), " ".join(ch)))
    gb = [c for c in mb["checks"] if c["op"] == "golden"]
    ga = [c for c in ma["checks"] if c["op"] == "golden"]
    if gb != ga and any(x.get("mae") != y.get("mae") for x, y in zip(gb, ga)):
        line.append("golden mae changed")
    print("  ".join(line))
