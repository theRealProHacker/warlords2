"""Numbers of the signpost editor (rules/signs.py).

"asm" = the capstone listings out/asm/ovl13.asm (Order > Signpost, 07be:0268 -> ovl13:01a4) and
out/asm/ovl56.asm (the line editor ovl56:03a6), re-read by the M9b implementer at the addresses
given.
"""
from __future__ import annotations

from . import Const

SIGN_TERRAIN = Const(9, "asm ovl13:01e3: SCN 0x710[tile byte of the selected stack's square] == 9, "
                        "else no dialog (the terrain the scenario calls Terrain.TOWER)")
TYPED_MAX = Const(29, "asm ovl56:04c1..04c7: a key is taken only while si < [bp+0x12] - 1, and "
                      "ovl13:03fc / 0451 pass 0x1e: at most 29 typed characters")
TYPED_CHARS = Const((0x20, 0x7A), "asm ovl56:047f..048e: keys below 0x20 or above 0x7a are not typed")
MAX_WIDTH = Const(0xD8, "asm ovl13:03fc / 0451 pass 0xd8; ovl56:04b6..04cf: a key is taken only "
                        "while the width (11e2:0a8e, font slot 2) of the text typed so far is "
                        "< 216 px -- checked by the editor in the UI, the engine has no font")
