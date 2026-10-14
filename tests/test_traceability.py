"""Traceability rules of docs/plan.md sections 0 and 6.1, checked on the source tree.

* every public function in warlords2/rules/ and warlords2/ai/, and every public method of
  a public class there, has an `Evidence:` line in its docstring (section 6.2);
* every `Unverified(name, row)` in warlords2/ names a row of the risk register (section 5);
* no string literal in warlords2/, tests/, tools/ equals a game text longer than 12
  characters, and none contains one of 20 characters or more.  Game texts are STRING.DAT,
  HLP, army and hero names, QUOTES, card descriptions, voice captions and GFX page text,
  read from the user's copy at test time.  Literals are str and bytes (cp437) constants,
  `+` chains of them and the constant parts of f-strings; .md and .txt files under tests/
  and tools/ count line by line.  Dict keys and subscripts that are identifiers, and file
  names, are allowed.

Each check is a function over a list of files, so the tests below can also show that it
fires on a planted file.
"""
import ast
import json
import re
from pathlib import Path

import pytest

from warlords2.formats.gamedir import GameDir
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


def _identifier(node):
    return isinstance(node, ast.Constant) and isinstance(node.value, str) and node.value.isidentifier()


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
    allowed = set()
    for node in ast.walk(tree):
        if isinstance(node, ast.Dict):
            allowed |= {id(k) for k in node.keys if k is not None and _identifier(k)}
        elif isinstance(node, ast.Subscript) and _identifier(node.slice):
            allowed.add(id(node.slice))
    for node in ast.walk(tree):
        if id(node) in allowed:
            continue
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
        elif isinstance(v, dict):                 # identifier keys allowed
            for k, x in v.items():
                if not k.isidentifier():
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


def load_game_texts(gd):
    """Every game text the check knows, from the user's copy."""
    root = gd.root
    texts = {s for g in StringTable(gd.read("DATA/STRING.DAT")).groups for s in g}
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


# --------------------------------------------------------------------------- the tree


def test_rules_and_ai_functions_cite_evidence():
    assert missing_evidence(files("warlords2/rules") + files("warlords2/ai")) == []


def test_unverified_names_a_register_row():
    assert bad_unverified(files("warlords2"), register_rows(PLAN.read_text(encoding="utf-8"))) == []


@pytest.mark.gamedata
def test_no_game_text_in_source(game_texts):
    assert game_text_literals(source_paths(), game_texts) == []


# --------------------------------------------------------------------------- the checks fire


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
        f"E = {{{ident!r}: 1, 'k': x[{ident!r}]}}",          # 5 identifier key/subscript: allowed
        f"F = {entry.encode('cp437')!r}",                    # 6 bytes
        f"G = {long_[:half]!r} + {long_[half:]!r}",          # 7 + chain
        f"H = f{long_[:half]!r}",                            # 8 f-string part, not a game text
        f"I = f'{long_[:half]}{{x}}{long_[half:]}'",         # 9 f-string folded
        f"J = 'see: {long_} here'",                          # 10 substring
        f"K = 'x {short} y'",                                # 11 short substring: allowed
    ]) + "\n", encoding="utf-8")
    assert _lines(game_text_literals([p], texts)) == [1, 2, 3, 6, 7, 9, 10]
    j = tmp_path / "planted.json"
    j.write_text(json.dumps({entry: [entry], ident: f"x {long_}"}), encoding="utf-8")
    assert len(game_text_literals([j], texts)) == 2
    for suffix in (".md", ".txt"):
        d = tmp_path / f"planted{suffix}"
        d.write_text(f"title\n  {entry}  \nsome {long_} inline\n{short}\n", encoding="utf-8")
        assert _lines(game_text_literals([d], texts)) == [2, 3]


@pytest.mark.gamedata
def test_game_texts_cover_every_source(game_texts, game):
    gd = GameDir(game)
    strings = {s for g in StringTable(gd.read("DATA/STRING.DAT")).groups for s in g if s.strip()}
    assert strings <= game_texts and len(game_texts - strings) > 100
