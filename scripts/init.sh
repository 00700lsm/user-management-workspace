#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$ROOT/repos"
mkdir -p "$TARGET"

if ! command -v git >/dev/null 2>&1; then
  echo "[error] Git is required." >&2
  exit 1
fi

clone_repo() {
  local name="$1" path="$TARGET/$1" url="https://github.com/00700lsm/$1.git"
  if [[ -d "$path/.git" ]]; then
    local actual
    actual="$(git -C "$path" remote get-url origin 2>/dev/null || true)"
    if [[ "$actual" == "$url" || "$actual" == "git@github.com:00700lsm/$name.git" || "$actual" == "https://github.com/00700lsm/$name" ]]; then
      echo "[skip] $name already cloned (untouched)"
      return 0
    fi
    echo "[error] $path has unexpected origin: $actual" >&2
    return 1
  fi
  if [[ -e "$path" ]]; then
    echo "[error] $path exists, but is not a Git repository. Not overwriting." >&2
    return 1
  fi
  echo "[clone] $name"
  git clone "$url" "$path"
}

clone_repo user-management-contract
clone_repo user-management-backend
clone_repo user-management-frontend

echo ""
echo "[ready] Initial clone complete. Open:"
echo "  $ROOT/user-management.code-workspace"
echo "This script does not pull, switch branches, install dependencies, or commit."
