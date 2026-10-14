"""Minimal JSON-RPC client for `rea --mcp` (stdio): one Ghidra session, many queries.

usage: python -I tools/re/rea_mcp.py tools                      # list tool names + input schemas
       python -I tools/re/rea_mcp.py dump <exe> <outdir> [addr ...]
dump: opens <exe> with the ghidra provider and writes the decompilation of each address
(or of every listed procedure when no address is given) to <outdir>/<addr>.c.
"""
from __future__ import annotations
import json, os, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class Rea:
    def __init__(self):
        self.p = subprocess.Popen([os.path.join(ROOT, "tools", "rea.sh"), "--mcp"], stdin=subprocess.PIPE,
                                  stdout=subprocess.PIPE, stderr=open(os.path.join(ROOT, "out", "rea", "mcp.err"), "w"))
        self.id = 0
        self.call("initialize", {"protocolVersion": "2024-11-05", "capabilities": {},
                                 "clientInfo": {"name": "rea_mcp.py", "version": "0"}})
        self.send({"jsonrpc": "2.0", "method": "notifications/initialized"})

    def send(self, o):
        self.p.stdin.write((json.dumps(o) + "\n").encode())
        self.p.stdin.flush()

    def call(self, method, params):
        self.id += 1
        self.send({"jsonrpc": "2.0", "id": self.id, "method": method, "params": params})
        while True:
            line = self.p.stdout.readline()
            if not line:
                raise RuntimeError("rea closed the pipe")
            try:
                m = json.loads(line)
            except ValueError:
                continue
            if m.get("id") == self.id:
                if "error" in m:
                    raise RuntimeError(json.dumps(m["error"])[:2000])
                return m["result"]

    def tool(self, name, args):
        r = self.call("tools/call", {"name": name, "arguments": args})
        if r.get("structuredContent") is not None:
            return r["structuredContent"]
        txt = "".join(c.get("text", "") for c in r.get("content", []))
        try:
            return json.loads(txt)
        except ValueError:
            return {"text": txt, "isError": r.get("isError")}

    def close(self):
        try:
            self.p.stdin.close()
            self.p.wait(timeout=60)
        except Exception:
            self.p.kill()


def _addresses(o, acc=None):
    """Collect every '0x...' value stored under an address-like key of the procedure list."""
    acc = set() if acc is None else acc
    if isinstance(o, dict):
        for k, v in o.items():
            if k in ("address", "entry", "entry_address", "start") and isinstance(v, str) and v.startswith("0x"):
                acc.add(v)
            else:
                _addresses(v, acc)
    elif isinstance(o, list):
        for v in o:
            _addresses(v, acc)
    return acc


def _text(o):
    if isinstance(o, dict):
        for k in ("normalized_result", "raw_result", "value", "text"):
            if k in o:
                t = _text(o[k])
                if t:
                    return t
        return ""
    return o if isinstance(o, str) else ""


def main():
    r = Rea()
    try:
        if sys.argv[1] == "tools":
            want = sys.argv[2:]
            for t in r.call("tools/list", {})["tools"]:
                if not want:
                    print(t["name"])
                elif t["name"] in want:
                    print(t["name"], json.dumps(t.get("inputSchema"))[:3000])
        elif sys.argv[1] == "dump":
            exe, out = os.path.abspath(sys.argv[2]), sys.argv[3]
            os.makedirs(out, exist_ok=True)
            print(json.dumps(r.tool("open_binary", {"path": exe, "provider_id": "ghidra"}))[:300], flush=True)
            addrs = sys.argv[4:]
            if not addrs:
                procs = r.tool("list_procedures", {})
                json.dump(procs, open(os.path.join(out, "_procedures.json"), "w"))
                addrs = sorted(_addresses(procs), key=lambda a: int(a, 16))
                print(len(addrs), "procedures", flush=True)
            for i, a in enumerate(addrs):
                f = os.path.join(out, "%06x.c" % int(a, 16))
                if os.path.exists(f):
                    continue
                try:
                    res = r.tool("procedure_pseudo_code", {"procedure": a})
                    txt = _text(res)
                except Exception as ex:           # keep going, record the failure
                    txt = "/* rea error: %s */\n" % str(ex)[:500]
                open(f, "w").write(txt)
                if i % 100 == 0:
                    print(i, a, flush=True)
            r.tool("close_binary", {})
        elif sys.argv[1] == "raw":
            print(json.dumps(r.tool(sys.argv[2], json.loads(sys.argv[3])))[:6000])
    finally:
        r.close()


if __name__ == "__main__":
    main()
