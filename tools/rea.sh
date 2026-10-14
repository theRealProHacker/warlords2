#!/usr/bin/env bash
# Runs the rea CLI (https://github.com/morluto/rea) against the locally vendored Ghidra + JDK.
# Usage: tools/rea.sh <rea-command> [args...]   e.g. tools/rea.sh inspect "$PWD/original/game/Warlrd2/WARLORD2.EXE" --provider ghidra --json
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export GHIDRA_INSTALL_DIR="$ROOT/tools/vendor/ghidra_12.1.4_PUBLIC"
export JAVA_HOME="$ROOT/tools/vendor/jdk21"
export PATH="$JAVA_HOME/bin:$PATH"
export REA_GHIDRA_STARTUP_TIMEOUT_MS="${REA_GHIDRA_STARTUP_TIMEOUT_MS:-1800000}"
export GHIDRA_HEADLESS_MAXMEM="${GHIDRA_HEADLESS_MAXMEM:-4G}"
exec npx -y rea-agents@6.4.0 "$@"
