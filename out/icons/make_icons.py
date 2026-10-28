"""Window-icon candidates from the game's own pictures -> out/icons/ (git-ignored)."""
import math
import os
import sys

os.environ.setdefault("SDL_VIDEODRIVER", "dummy")
REPO = "/home/rharvey/Dokumente/Programmieren/warlords2"
sys.path.insert(0, REPO)

import numpy as np
import pygame

pygame.init()
from warlords2.formats.gamedir import GameDir, default_root
from warlords2.assets.store import AssetStore
from warlords2.assets.sprites import army_cell, tower_cell

OUT = f"{REPO}/out/icons"
store = AssetStore(GameDir(default_root()))


def sheet(rel):
    bm = store.bitmap(rel)
    return np.frombuffer(b"".join(bm.rows), np.uint8).reshape(bm.height, bm.width)


# (name, file, rect (x, y, w, h), key or None, palette)
SP, S0 = "STANDARD.PAL", "START/SCREEN0.PAL"
ONLY = sys.argv[1:]  # optional subset, by name
CANDS = [
    ("shield_red", "TERRAIN0/BSHIELD.PCK", (96, 0, 32, 36), 12, SP),
    ("shield_framed", "TERRAIN0/SHIELDS.PCK", (120, 0, 40, 40), None, SP),
    ("sword_shield", "TERRAIN0/SHIELDS.PCK", (120, 40, 24, 24), None, SP),
    ("dragon", "TERRAIN0/A3.PCK", army_cell(25), 10, SP),
    ("hero", "TERRAIN0/A0.PCK", army_cell(28), 10, SP),
    ("castle", "TERRAIN0/SCENERY1.PCK", (0, 0, 80, 80), None, SP),
    ("tower", "TERRAIN0/ROAD.PCK", tower_cell(3), 1, SP),
    ("title_II", "START/STEXT.PCK", (205, 0, 115, 210), 13, S0),
    ("title_W", "START/STEXT.PCK", (0, 40, 168, 135), 13, S0),
    ("ssg_logo", "START/SSG.PCK", (155, 100, 330, 200), 0, "START/LOGO.PAL"),
    ("cursor_arrow", "STAND.PCK", (0, 0, 16, 16), 10, SP),
    ("cursor_sword", "STAND.PCK", (128, 0, 16, 16), 10, SP),
    ("item_bag", "TERRAIN0/ATRANS2.PCK", (64, 0, 32, 29), 1, SP),
    ("helmet", "PICS/VOICE.PCK", None, 10, SP),
]
if len(sys.argv) > 1 and sys.argv[1] == "--pick":
    keep = sys.argv[2].split(",")
    CANDS = [c for c in CANDS if c[0] in keep]
    CANDS.sort(key=lambda c: keep.index(c[0]))


def rgba(c):
    name, rel, rect, key, pal = c
    a = sheet(rel)
    if name == "title_W":            # blank the 'a' that touches the W: sheet x >= 140, y >= 82
        a = a.copy()
        a[82:, 140:] = key
    if rect:
        x, y, w, h = rect
        a = a[y:y + h, x:x + w]
    p = np.array(store.palette(pal), np.uint8)
    img = np.dstack([p[a], np.full(a.shape, 255, np.uint8)])
    if key is not None:
        img[a == key, 3] = 0
        ys, xs = np.nonzero(a != key)
        img = img[ys.min():ys.max() + 1, xs.min():xs.max() + 1]
    return img


def fit(img, t):
    """Nearest neighbour, aspect kept: integer up-scale when it fills >= 3/4 of the side,
    else the factor t / max(w, h) (pixel-centre sampling); centred, transparent pad."""
    h, w = img.shape[:2]
    m = max(w, h)
    s = t / m
    if s >= 1 and (t // m) * m >= 0.75 * t:
        s = t // m
    nw, nh = max(1, round(w * s)), max(1, round(h * s))
    ys = np.minimum(((np.arange(nh) + 0.5) / s).astype(int), h - 1)
    xs = np.minimum(((np.arange(nw) + 0.5) / s).astype(int), w - 1)
    img = img[ys][:, xs]
    h, w = img.shape[:2]
    out = np.zeros((t, t, 4), np.uint8)
    oy, ox = (t - h) // 2, (t - w) // 2
    out[oy:oy + h, ox:ox + w] = img
    return out


def surf(a):
    return pygame.image.frombytes(np.ascontiguousarray(a).tobytes(), a.shape[1::-1], "RGBA")


icons = []
for n, c in enumerate(CANDS, 1):
    img = rgba(c)
    row = []
    for t in (64, 32, 16):
        s = surf(fit(img, t))
        if t != 16:
            pygame.image.save(s, f"{OUT}/{n}_{c[0]}_{t}.png")
        row.append(s)
    icons.append((n, c[0], row))

# contact sheet: per candidate a column; light half on top, dark half below
font = pygame.font.Font(None, 20)
CW, PAD = 96, 8
BANDH = 24 + 64 + PAD + 32 + PAD + 16 + PAD
W, H = CW * len(icons) + PAD, 2 * BANDH + PAD
sheet_s = pygame.Surface((W, H), pygame.SRCALPHA)
for band, (bg, fg) in enumerate((((236, 236, 232), (30, 30, 30)), ((32, 34, 40), (230, 230, 230)))):
    y0 = band * BANDH
    sheet_s.fill(bg, (0, y0, W, BANDH + (PAD if band else 0)))
    for i, (n, name, (s64, s32, s16)) in enumerate(icons):
        x = PAD + i * CW
        cx = x + (CW - PAD) // 2
        lab = font.render(str(n), True, fg)
        sheet_s.blit(lab, (cx - lab.get_width() // 2, y0 + 6))
        y = y0 + 24
        sheet_s.blit(s64, (cx - 32, y)); y += 64 + PAD
        sheet_s.blit(s32, (cx - 16, y)); y += 32 + PAD
        sheet_s.blit(s16, (cx - 8, y))
pygame.image.save(sheet_s, f"{OUT}/sheet.png")
for n, name, _ in icons:
    print(n, name)
