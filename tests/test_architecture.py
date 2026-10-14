"""Engine packages (formats, model, rules, ai) import only the standard library and
warlords2 itself, never pygame and friends (docs/plan.md section 1), and only in the
direction formats <- model <- rules <- ai.

The import check runs in a fresh interpreter: modules imported by other tests would
otherwise already sit in sys.modules and hide a forbidden import.
"""
import ast
import json
import subprocess
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parent.parent
PKG = ROOT / "warlords2"
ENGINE = ["formats", "model", "rules", "ai"]          # in allowed dependency order
BLOCKED = ["pygame", "numpy", "cv2", "StateManager", "pygame_screen_record", "PIL"]
PRESENTATION = ["app", "config", "assets", "ui", "states", "audio", "debug"]

ENGINE_FILES = sorted(f for e in ENGINE if (PKG / e).is_dir() for f in (PKG / e).rglob("*.py"))

_PROBE = r"""
import importlib, json, pkgutil, sys
blocked, engine = json.loads(sys.argv[1]), json.loads(sys.argv[2])
sys.path.insert(0, sys.argv[3])
for name in blocked:
    sys.modules[name] = None          # any import of these now raises ImportError
imported = []
for e in engine:
    pkg = importlib.import_module("warlords2." + e)
    imported.append(pkg.__name__)
    for m in pkgutil.walk_packages(pkg.__path__, pkg.__name__ + "."):
        importlib.import_module(m.name)
        imported.append(m.name)
print(json.dumps({"imported": imported,
                  "loaded": sorted(k for k, v in sys.modules.items() if v is not None)}))
"""


def test_engine_packages_exist():
    assert (PKG / "formats" / "__init__.py").is_file()
    assert ENGINE_FILES


def test_engine_imports_with_presentation_libraries_blocked():
    engine = [e for e in ENGINE if (PKG / e).is_dir()]
    r = subprocess.run([sys.executable, "-I", "-c", _PROBE, json.dumps(BLOCKED), json.dumps(engine),
                        str(ROOT)],
                       cwd=ROOT, capture_output=True, text=True)
    assert r.returncode == 0, r.stderr
    out = json.loads(r.stdout)
    modules = {f.relative_to(ROOT).with_suffix("").as_posix().replace("/", ".").removesuffix(".__init__")
               for f in ENGINE_FILES}
    assert modules <= set(out["imported"])
    loaded = set(out["loaded"])
    assert not {m for m in loaded if m.split(".")[0] in BLOCKED}
    assert not {m for m in loaded if m.startswith("warlords2.") and m.split(".")[1] in PRESENTATION}


def _imports(path: Path) -> list[tuple[str, int]]:
    """(absolute module name, line) of every import statement in `path`."""
    mod = path.relative_to(ROOT).with_suffix("").parts
    pkg = mod[:-1]
    out = []
    for node in ast.walk(ast.parse(path.read_text(), str(path))):
        if isinstance(node, ast.Import):
            out += [(a.name, node.lineno) for a in node.names]
        elif isinstance(node, ast.ImportFrom):
            if node.level:
                base = ".".join(pkg[:len(pkg) - node.level + 1])
                out.append((f"{base}.{node.module}" if node.module else base, node.lineno))
            else:
                out.append((node.module, node.lineno))
    return out


@pytest.mark.parametrize("path", ENGINE_FILES, ids=lambda p: p.relative_to(ROOT).as_posix())
def test_engine_imports_stdlib_and_lower_layers_only(path):
    layer = ENGINE.index(path.relative_to(PKG).parts[0])
    allowed = {f"warlords2.{e}" for e in ENGINE[:layer + 1]}
    for name, line in _imports(path):
        top = name.split(".")[0]
        if top == "warlords2":
            assert name == "warlords2" or ".".join(name.split(".")[:2]) in allowed, (
                f"{path.name}:{line} imports {name} (layer {ENGINE[layer]})")
        else:
            assert top in sys.stdlib_module_names or top == "__future__", (
                f"{path.name}:{line} imports non-stdlib {name}")
