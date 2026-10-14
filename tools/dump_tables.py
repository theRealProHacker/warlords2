"""Dump the data tables and text resources of Warlords II (1993, DOS, v1.02) to JSON.

usage: python -I tools/dump_tables.py <gamedir> <outdir>

<gamedir> is the directory holding WARLORD2.EXE (read-only); <outdir> receives one JSON
file per resource.  Layouts are documented in docs/formats/tables.md.
"""
# The decoders live in warlords2.formats.tables (SCENARIO.DAT: warlords2.formats.scenario);
# this script only writes JSON.
from __future__ import annotations

import json
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))  # run without installing

from warlords2.formats.tables import (  # noqa: E402
    ENC, parse_area, parse_armytypes, parse_button, parse_card, parse_help, parse_heronames,
    parse_join, parse_mapcolor, parse_options, parse_quotes, parse_slots, parse_sounddat,
    parse_strtab, parse_terrain, parse_udb, parse_voice_text)
from warlords2.formats.scenario import parse_scenario_dat  # noqa: E402


def _read(game, *parts):
    return open(os.path.join(game, *parts), "rb").read()


def strtab_json(data):
    return [{"group": g, "strings": [{"index": i, "text": s} for i, s in enumerate(ss)]}
            for g, ss in enumerate(parse_strtab(data))]


# --------------------------------------------------------------------------- driver


def dump_all(game):
    out = {}
    t0 = os.path.join(game, "TERRAIN0")
    out["armytype"] = parse_armytypes(_read(t0, "ARMYTYPE.DAT"))
    out["armytyp2"] = parse_armytypes(_read(t0, "ARMYTYP2.DAT"))
    out["heronames"] = {str(i): parse_heronames(_read(t0, "HERONAM%d.DAT" % i)) for i in range(8)}
    out["mapcolor"] = parse_mapcolor(_read(t0, "MAPCOLOR.DAT"))
    out["terrain"] = parse_terrain(_read(game, "DATA", "TERRAIN.DAT"))
    out["area"] = parse_area(_read(game, "DATA", "AREA.DAT"))
    out["button"] = parse_button(_read(game, "DATA", "BUTTON.DAT"))
    out["join"] = parse_join(_read(game, "DATA", "JOIN.DAT"))
    for n in ("string", "file", "error"):
        out[n + "s" if n != "string" else "strings"] = strtab_json(_read(game, "DATA", n.upper() + ".DAT"))
    out["options"] = {"options_dat": parse_options(_read(game, "DATA", "OPTIONS.DAT")),
                      "options_snd": _read(game, "DATA", "OPTIONS.SND").decode(ENC)}
    out["mapinfo"] = parse_slots(_read(game, "DATA", "MAPINFO.DAT"), "\r\n")
    out["saveinfo"] = parse_slots(_read(game, "DATA", "SAVEINFO.DAT"), "\n\r")
    out["scenario"] = parse_scenario_dat(_read(game, "DATA", "SCENARIO.DAT"))
    out["quotes"] = parse_quotes(_read(game, "DATA", "QUOTES.DAT"))
    cards = {}
    for f in sorted(os.listdir(os.path.join(game, "CARDS"))):
        if f.upper().endswith(".CRD"):
            cards[f[:-4]] = parse_card(_read(game, "CARDS", f), _read(game, "CARDS", f[:-4] + ".DSC"))
    out["cards"] = cards
    out["udb"] = {"buttons": parse_udb(_read(game, "UDB", "UDB.DAT")),
                  "current": list(struct.unpack_from("<4H", _read(game, "UDB", "UDB.CUR")))}
    out["sound_config"] = {n: parse_sounddat(_read(game, n))
                           for n in ("SOUND.DAT", "SWAP.DAT", "VER102.DAT", "WAR2.INI")}
    out["help"] = parse_help(_read(game, "HELP", "WARLORD2.HLP"))
    txt = {}
    for f in sorted(os.listdir(os.path.join(game, "SOUND"))):
        if f.upper().endswith(".TXT"):
            txt[f[:-4]] = parse_voice_text(_read(game, "SOUND", f))
    out["voice_text"] = txt
    return out


def main(argv):
    if len(argv) != 3:
        print(__doc__)
        return 2
    game, outdir = argv[1], argv[2]
    os.makedirs(outdir, exist_ok=True)
    for name, obj in dump_all(game).items():
        with open(os.path.join(outdir, name + ".json"), "w", encoding="utf-8") as f:
            json.dump(obj, f, indent=1, ensure_ascii=False)
    print("wrote", outdir)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
