"""Traceability rules of docs/plan.md sections 0 and 6.1, checked on the source tree.

* every public function in warlords2/rules/ and warlords2/ai/, and every public method of
  a public class there, has an `Evidence:` line in its docstring (section 6.2);
* every `Unverified(name, row)` in warlords2/ names a row of the risk register (section 5);
* no string literal in warlords2/, tests/, tools/ equals a game text longer than 12
  characters, and none contains one of 20 characters or more.  Game texts are STRING.DAT,
  ERROR.DAT, HLP, army and hero names, QUOTES, card descriptions, voice captions, GFX page
  text and the text WARLORD2.EXE holds itself (the menu titles and items of `ui.menubar`,
  every other NUL-ended string of DGROUP), read from the user's copy at test time.  Literals are str and bytes (cp437) constants,
  `+` chains of them and the constant parts of f-strings, dict keys and subscripts included
  (two identifier-shaped game texts are longer than MIN_TEXT); .md and .txt files under
  tests/ and tools/ count line by line.  File names are allowed.
* no tracked (or untracked, not ignored) file is a sound, picture or other binary: every file
  has one of TEXT_SUFFIXES, apart from the bundled music in warlords2/data/music/ (BUNDLED_MUSIC)
  and the bundle's file icons in packaging/ (BUNDLED_ICON).

Each check is a function over a list of files, so the tests below can also show that it
fires on a planted file.
"""
import ast
import json
import re
from pathlib import Path

import pytest

from warlords2.assets.exe import ds_base
from warlords2.formats.gamedir import EXE_NAME, GameDir
from warlords2.formats.gfxscript import parse_gfx
from warlords2.formats.tables import (ENC, StringTable, parse_armytypes, parse_card, parse_help,
                                      parse_heronames, parse_quotes, parse_voice_text)

ROOT = Path(__file__).resolve().parent.parent
PLAN = ROOT / "docs" / "plan.md"
TEXT_TREES = ["warlords2", "tests", "tools"]
DOC_TREES = ["tests", "tools"]                 # .md and .txt scanned here too
SKIP_DIRS = {"__pycache__", "vendor"}
MIN_TEXT = 12                                  # entries this long or shorter are not checked
MIN_SUBSTRING = 20                             # entries this long must not occur inside a literal
FILE_NAME = re.compile(r"^[\w.~:/\\-]+\.[A-Za-z0-9]{1,3}$")
TEXT_SUFFIXES = {".py", ".md", ".json", ".txt", ".toml", ".sh", ".gitignore", ".yml", ".spec"}
# The first exception to "no assets in the repo": the game's music rendered to Ogg Vorbis (and its
# manifest), shipped as package data.  User decision 2026-10-17, after being told the copyright
# risk; the renderer's inputs (XMI, MIDPAK.AD, the sound font) and the .mid files stay out.
BUNDLED_MUSIC = re.compile(r"^warlords2/data/music/(?:[SR](?:STARTUP|INT\d{1,2}|ANIM)\.ogg|manifest\.json)$")
# The second: the bundle's file icons (the title "W", built by tools/make_icons.py from the user's
# START/STEXT.PCK), needed at build time where CI has no game files.  User decision 2026-10-17.
BUNDLED_ICON = re.compile(r"^packaging/icon\.(?:png|ico|icns)$")
def files(tree, suffixes=(".py",)):
    base = ROOT / tree
    if not base.is_dir():
        return []
    return sorted(p for p in base.rglob("*") if p.suffix in suffixes and p.is_file()
                  and not SKIP_DIRS & set(p.relative_to(base).parts))


def register_rows(plan_text):
    """IDs in the first column of the section-5 tables; `X01b-d` stands for X01b, X01c, X01d."""
    sec = plan_text.split("\n## 5.", 1)[1].split("\n## 6.", 1)[0]
    rows = set()
    for line in sec.splitlines():
        if not line.startswith("| "):
            continue
        for cell in line.split("|")[1].split(","):
            m = re.fullmatch(r"\s*([A-Z]\d+)([a-z])?(?:-([a-z]))?\s*", cell)
            if m:
                base, first, last = m.groups()
                if first:
                    rows |= {base + chr(c) for c in range(ord(first), ord(last or first) + 1)}
                else:
                    rows.add(base)
    return rows


# --------------------------------------------------------------------------- checks


def missing_evidence(paths):
    """Public module-level functions, and public methods of public classes, whose
    docstring has no `Evidence:` line."""
    out = []

    def check(node, name):
        if "Evidence:" not in (ast.get_docstring(node) or ""):
            out.append(f"{p}:{node.lineno} {name}")

    for p in paths:
        for node in ast.parse(p.read_text(encoding="utf-8")).body:
            if node.name.startswith("_") if hasattr(node, "name") else True:
                continue
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                check(node, node.name)
            elif isinstance(node, ast.ClassDef):
                for m in node.body:
                    if isinstance(m, (ast.FunctionDef, ast.AsyncFunctionDef)) and not m.name.startswith("_"):
                        check(m, f"{node.name}.{m.name}")
    return out


def bad_unverified(paths, rows):
    """`Unverified(...)` calls whose row (second argument or `row=`) is not a register row."""
    out = []
    for p in paths:
        for node in ast.walk(ast.parse(p.read_text(encoding="utf-8"))):
            if not isinstance(node, ast.Call):
                continue
            f = node.func
            if (f.id if isinstance(f, ast.Name) else getattr(f, "attr", None)) != "Unverified":
                continue
            row = node.args[1] if len(node.args) > 1 else next(
                (k.value for k in node.keywords if k.arg == "row"), None)
            if not (isinstance(row, ast.Constant) and row.value in rows):
                out.append(f"{p}:{node.lineno} {ast.unparse(row) if row else '<no row>'}")
    return out


def _folded(node):
    """The string a `+` chain of str constants spells, else None."""
    if isinstance(node, ast.Constant) and isinstance(node.value, str):
        return node.value
    if isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
        a, b = _folded(node.left), _folded(node.right)
        if a is not None and b is not None:
            return a + b
    return None


def _py_literals(p):
    tree = ast.parse(p.read_text(encoding="utf-8"))
    for node in ast.walk(tree):
        if isinstance(node, ast.Constant) and isinstance(node.value, str):
            yield node.lineno, node.value
        elif isinstance(node, ast.Constant) and isinstance(node.value, bytes):
            yield node.lineno, node.value.decode(ENC)
        elif isinstance(node, ast.BinOp) and isinstance(node.op, ast.Add):
            v = _folded(node)
            if v is not None:
                yield node.lineno, v
        elif isinstance(node, ast.JoinedStr):
            yield node.lineno, "".join(v.value for v in node.values
                                       if isinstance(v, ast.Constant) and isinstance(v.value, str))


def _json_literals(p):
    def walk(v):
        if isinstance(v, str):
            yield v
        elif isinstance(v, list):
            for x in v:
                yield from walk(x)
        elif isinstance(v, dict):
            for k, x in v.items():
                yield k
                yield from walk(x)
    for v in walk(json.loads(p.read_text(encoding="utf-8"))):
        yield 0, v


def _doc_lines(p):
    for i, line in enumerate(p.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
        yield i, line.strip()


def _literals(p):
    if p.suffix == ".json":
        return _json_literals(p)
    if p.suffix in (".md", ".txt"):
        return _doc_lines(p)
    return _py_literals(p)


def game_text_literals(paths, texts):
    """Literals equal to one of `texts` longer than MIN_TEXT, or containing one of at least
    MIN_SUBSTRING characters; file names excepted."""
    texts = {t.strip() for t in texts}
    exact = {t for t in texts if len(t) > MIN_TEXT}
    long = sorted(t for t in texts if len(t) >= MIN_SUBSTRING)
    out = []
    for p in paths:
        lits = [(line, v) for line, v in _literals(p) if not FILE_NAME.match(v)]
        for line, v in lits:
            if v in exact:
                out.append(f"{p}:{line} literal of length {len(v)}")
        blob = "\0".join(v for _, v in lits)
        for t in long:
            if t in blob:
                for line, v in lits:
                    if t in v and v != t:
                        out.append(f"{p}:{line} literal contains a game text of length {len(t)}")
    return sorted(set(out))


DGROUP_TEXT = re.compile(rb"[\t\n\r\x20-\x7e]{%d,}(?=\x00)" % (MIN_TEXT + 1))


def exe_texts(exe):
    """The text WARLORD2.EXE holds: the menu titles, items and key labels (`ui.menubar`) and
    every NUL-ended printable string of DGROUP longer than MIN_TEXT."""
    from warlords2.ui.menubar import read_menu_tables
    menus, _ = read_menu_tables(exe)
    texts = set()
    for m in menus:
        texts.add(m.title)
        for it in m.items:
            texts |= {it.label, it.key_label or ""}
    base = ds_base(exe)
    texts |= {m.group().decode(ENC) for m in DGROUP_TEXT.finditer(exe[base:base + 0x10000])}
    return texts


def load_game_texts(gd):
    """Every game text the check knows, from the user's copy."""
    root = gd.root
    texts = {s for g in StringTable(gd.read("DATA/STRING.DAT")).groups for s in g}
    texts |= {s for g in StringTable(gd.read("DATA/ERROR.DAT")).groups for s in g}
    texts |= exe_texts(gd.read(EXE_NAME))
    for h in parse_help(gd.read("HELP/WARLORD2.HLP")):
        texts |= {h["title"], h["text"]}
    for name in ("ARMYTYPE.DAT", "ARMYTYP2.DAT"):
        texts |= {r["name"] for r in parse_armytypes(gd.read(f"TERRAIN0/{name}"))}
    for p in root.rglob("*"):
        suf, stem = p.suffix.upper(), p.stem.upper()
        if not p.is_file():
            continue
        if suf == ".DAT" and stem.startswith("HERONAM"):
            texts |= {h["name"] for h in parse_heronames(p.read_bytes())}
        elif suf == ".DSC":
            crd = p.with_suffix(p.suffix[:-3] + ("CRD" if p.suffix.isupper() else "crd"))
            c = parse_card(crd.read_bytes(), p.read_bytes())
            texts |= {c["name"], *c["description"]}
        elif suf == ".TXT" and p.parent.name.upper() == "SOUND":
            texts |= set(parse_voice_text(p.read_bytes())["lines"])
        elif suf == ".GFX":
            texts |= {c[3] for c in parse_gfx(p.read_bytes()) if c[0] in "CLR"}
    for q in parse_quotes(gd.read("DATA/QUOTES.DAT"))["quotes"]:
        texts |= set(q["lines"])
    return {t for t in texts if t.strip()}


@pytest.fixture(scope="module")
def game_texts(game):
    return load_game_texts(GameDir(game))


def source_paths():
    return ([p for t in TEXT_TREES for p in files(t, (".py", ".json"))]
            + [p for t in DOC_TREES for p in files(t, (".md", ".txt"))])


def asset_files(names):
    """Repository-relative names (posix) of files that are not text: a suffix outside
    TEXT_SUFFIXES (a name without one counts by its name, e.g. .gitignore), BUNDLED_MUSIC and
    BUNDLED_ICON excepted."""
    return [n for n in names if (Path(n).suffix or Path(n).name) not in TEXT_SUFFIXES
            and not BUNDLED_MUSIC.match(n) and not BUNDLED_ICON.match(n)]


def repo_files():
    import subprocess
    try:
        out = subprocess.run(["git", "ls-files", "--cached", "--others", "--exclude-standard", "-z"],
                             cwd=ROOT, capture_output=True, check=True).stdout
    except (OSError, subprocess.CalledProcessError):
        pytest.skip("not a git checkout")
    return [n for n in out.decode().split("\0") if n and (ROOT / n).is_file()]


# --------------------------------------------------------------------------- the tree


def test_rules_and_ai_functions_cite_evidence():
    assert missing_evidence(files("warlords2/rules") + files("warlords2/ai")) == []


def test_unverified_names_a_register_row():
    assert bad_unverified(files("warlords2"), register_rows(PLAN.read_text(encoding="utf-8"))) == []


@pytest.mark.gamedata
def test_no_game_text_in_source(game_texts):
    assert game_text_literals(source_paths(), game_texts) == []


def test_no_assets_in_the_repo():
    assert asset_files(repo_files()) == []


# --------------------------------------------------------------------------- the checks fire


def test_asset_check_fires():
    names = ["warlords2/x.py", "README.md", ".gitignore", "warlords2/data/music/SINT12.ogg",
             "warlords2/data/music/RANIM.ogg", "warlords2/data/music/manifest.json",
             "packaging/icon.png", "packaging/icon.ico", "packaging/icon.icns",
             ".github/workflows/build.yml", "packaging/warlords2.spec",
             "warlords2/data/music/SINT12.mid", "warlords2/data/music/SINT12.wav", "warlords2/data/music/x.ogg",
             "warlords2/data/music/sub/SINT0.ogg", "tests/SINT0.ogg", "warlords2/data/SINT0.ogg",
             "warlords2/assets/icon.png", "original/game/Warlrd2/SOUND/SINT0.XMI",
             "packaging/x.png", "packaging/icon.bmp", "packaging/sub/icon.png"]
    assert asset_files(names) == names[11:]


def test_register_rows_parsed():
    rows = register_rows(PLAN.read_text(encoding="utf-8"))
    assert {"R01", "R10a", "R19", "R20", "S1", "T2b", "X01a", "X01b", "X01c", "X01d", "X31"} <= rows
    assert "ID" not in rows and "X01" not in rows


def test_missing_evidence_fires(tmp_path):
    p = tmp_path / "m.py"
    p.write_text('def ok():\n    """Evidence: EL §2"""\n\n\ndef bad():\n    """No tag."""\n\n\n'
                 'def _private():\n    pass\n\n\n'
                 'class C:\n    def __init__(self):\n        pass\n\n    def m_ok(self):\n'
                 '        """Evidence: EL §3"""\n\n    def m_bad(self):\n        pass\n\n'
                 '    def _m(self):\n        pass\n\n\n'
                 'class _Hidden:\n    def m(self):\n        pass\n')
    assert [x.rsplit(" ", 1)[1] for x in missing_evidence([p])] == ["bad", "C.m_bad"]


def test_bad_unverified_fires(tmp_path):
    p = tmp_path / "c.py"
    p.write_text('A = Unverified("a", "R11")\nB = c.Unverified("b", row="R99")\nC = Unverified("c")\n'
                 'D = Unverified("d", ROW)\n')
    assert [int(x.split(":")[-1].split()[0]) for x in bad_unverified([p], {"R11"})] == [2, 3, 4]


def _lines(hits):
    return sorted(int(x.rsplit(":", 1)[1].split()[0]) for x in hits)


def test_game_text_check_fires(tmp_path):
    # made-up texts: the check is a function of its text set
    entry, long_ = "Not a real game text", "A made-up sentence of some length"
    ident, short = "planted_identifier_key", "Twelve chars"
    texts = {entry, long_, ident, short}
    half = len(long_) // 2
    p = tmp_path / "planted.py"
    p.write_text("\n".join([
        f"A = {entry!r}",                                    # 1 exact
        f"B = {{{entry!r}: 1}}",                             # 2 non-identifier key
        f"C = x[{entry!r}]",                                 # 3 non-identifier subscript
        f"D = {short!r}",                                    # 4 too short
        f"E = {{{ident!r}: 1, 'k': x[{ident!r}]}}",          # 5 identifier key/subscript
        f"F = {entry.encode('cp437')!r}",                    # 6 bytes
        f"G = {long_[:half]!r} + {long_[half:]!r}",          # 7 + chain
        f"H = f{long_[:half]!r}",                            # 8 f-string part, not a game text
        f"I = f'{long_[:half]}{{x}}{long_[half:]}'",         # 9 f-string folded
        f"J = 'see: {long_} here'",                          # 10 substring
        f"K = 'x {short} y'",                                # 11 short substring: allowed
    ]) + "\n", encoding="utf-8")
    assert _lines(game_text_literals([p], texts)) == [1, 2, 3, 5, 6, 7, 9, 10]
    j = tmp_path / "planted.json"
    j.write_text(json.dumps({entry: [entry], ident: f"x {long_}"}), encoding="utf-8")
    assert len(game_text_literals([j], texts)) == 3              # entry, the ident key, long_
    for suffix in (".md", ".txt"):
        d = tmp_path / f"planted{suffix}"
        d.write_text(f"title\n  {entry}  \nsome {long_} inline\n{short}\n", encoding="utf-8")
        assert _lines(game_text_literals([d], texts)) == [2, 3]


@pytest.mark.gamedata
def test_game_texts_cover_every_source(game_texts, game):
    gd = GameDir(game)
    strings = {s for g in StringTable(gd.read("DATA/STRING.DAT")).groups for s in g if s.strip()}
    assert strings <= game_texts and len(game_texts - strings) > 100
    exe = gd.read(EXE_NAME)
    from warlords2.assets.exe import ds_str
    from warlords2.ui.menubar import read_menu_tables
    menus = read_menu_tables(exe)[0]
    labels = {it.label for m in menus for it in m.items} | {m.title for m in menus}
    errors = {s for g in StringTable(gd.read("DATA/ERROR.DAT")).groups for s in g if s.strip()}
    assert labels <= game_texts and errors <= game_texts
    assert max(map(len, labels)) > MIN_TEXT                    # a menu label the check now sees
    assert ds_str(exe, 0x25E0) in game_texts                   # a DGROUP text (ovl57:180b)
