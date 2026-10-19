#!/usr/bin/env bash
# Explicit, safe operation: checkout dev and fast-forward pull for all three child repos.
# Never called automatically by init.sh or the editor workspace.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$ROOT/repos"
NAMES=(user-management-contract user-management-backend user-management-frontend)

# Preflight all repositories BEFORE switching any branch.
for name in "${NAMES[@]}"; do
  repo="$TARGET/$name"
  [[ -d "$repo/.git" ]] || { echo "[error] Missing $name. Run bash scripts/init.sh first." >&2; exit 1; }
  actual="$(git -C "$repo" remote get-url origin 2>/dev/null || true)"
  expected="https://github.com/00700lsm/$name.git"
  if [[ "$actual" != "$expected" && "$actual" != "git@github.com:00700lsm/$name.git" && "$actual" != "https://github.com/00700lsm/$name" ]]; then
    echo "[error] Unexpected origin for $name: $actual" >&2
    exit 1
  fi
  if [[ -n "$(git -C "$repo" status --porcelain)" ]]; then
    echo "[error] Uncommitted changes exist in $name. Commit/stash first; no branch was switched." >&2
    exit 1
  fi
done

for name in "${NAMES[@]}"; do
  repo="$TARGET/$name"
  echo "===== $name ====="
  git -C "$repo" fetch origin dev
  if git -C "$repo" show-ref --verify --quiet refs/heads/dev; then
    git -C "$repo" switch dev
    git -C "$repo" branch --set-upstream-to=origin/dev dev
  else
    git -C "$repo" switch --track -c dev origin/dev
  fi
  git -C "$repo" pull --ff-only
  echo "[ok] $name on dev (tracking origin/dev)"
done

echo "[ready] Explicit dev fast-forward sync completed."
