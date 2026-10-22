#!/usr/bin/env python3
"""Read-only static guard for bootstrap-only Workspace repository."""
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
required = [
    "scripts/init.sh", "scripts/use-dev.sh", ".gitignore",
    ".agents/skills/workspace-init/SKILL.md",
    ".claude/skills/workspace-init/SKILL.md",
    "AGENTS.md", "CLAUDE.md", "README.md",
]
failures = []
for rel in required:
    if not (ROOT / rel).is_file():
        failures.append(f"Missing required Workspace file: {rel}")

ignore = (ROOT / ".gitignore").read_text(encoding="utf-8") if (ROOT / ".gitignore").exists() else ""
if "repos/" not in ignore.splitlines():
    failures.append(".gitignore must exclude repos/ containing child repositories")

result = subprocess.run(
    ["git", "-C", str(ROOT), "ls-files", "--", "repos/"],
    text=True, capture_output=True, check=False,
)
if result.returncode != 0:
    failures.append("Cannot inspect tracked git files")
elif result.stdout.strip():
    failures.append(f"Child application files tracked inside Workspace: {result.stdout.strip()}")

for rel in [".agents/skills", ".claude/skills"]:
    folder = ROOT / rel
    names = sorted(x.name for x in folder.iterdir() if x.is_dir()) if folder.is_dir() else []
    if names != ["workspace-init"]:
        failures.append(f"{rel} must contain only workspace-init; found: {names}")

for failure in failures:
    print(f"[FAIL] {failure}")
if failures:
    sys.exit(1)
print("[PASS] Bootstrap scripts, ignore scope and workspace-init Skill structure")
print("[WARN] Static check does not clone remote repositories or prove downstream CI")
