---
name: workspace-init
description: Set up the User Management multi-repository workspace when explicitly requested. Clone missing Contract, Backend and Frontend repositories at dev using the workspace init script, and safely report branch, Git status and API contract SHA consistency.
disable-model-invocation: true
---

# Workspace Init — User Management

This is the **canonical, cross-agent** project skill for Cursor, Codex, and other agents that support project-local Agent Skills. Claude Code's `.claude/skills/workspace-init/SKILL.md` delegates here.

## Invocation and boundary

Run **only on explicit user request** for workspace initialization. Do not start setup automatically when opening the folder or beginning an agent session. The parent `user-management-workspace` repository contains only setup tooling and agent guidance; it is **not** the application monorepo.

## Steps

1. Identify the `user-management-workspace` root by locating `AGENTS.md`, `user-management.code-workspace` and `scripts/init.sh`. If missing, tell the user to clone `https://github.com/00700lsm/user-management-workspace` and stop.
2. Read `AGENTS.md`, `README.md`, and `docs/getting-started.md`. Confirm `git` and `bash` are available. Do not install or reconfigure dependencies.
3. Inspect `repos/user-management-contract`, `repos/user-management-backend`, and `repos/user-management-frontend` to determine which folders already exist. Never delete, overwrite, reset, clean, or change an existing working copy.
4. **From the workspace root**, run `bash scripts/init.sh`. This existing shared script clones **only missing repositories** using `dev` and tracks `origin/dev`; it skips already cloned repositories unchanged. Do not reproduce its clone logic inside the skill.
5. Inspect each child repository using **read-only checks**:
   - `git -C repos/<name> remote get-url origin`
   - `git -C repos/<name> branch --show-current`
   - `git -C repos/<name> rev-parse --abbrev-ref --symbolic-full-name '@{upstream}'` (if set)
   - `git -C repos/<name> status --short`
   - For Contract, check that `openapi.yaml`, `docs/governance/git-workflow.md`, and `docs/contract-governance.md` exist.
   - For Backend and Frontend, read each `contract.sha` and check that both are valid 40-character commit SHA strings **and equal**. **Never update these automatically.**
6. Summarize the Contract, Backend, and Frontend repository paths, current branches, upstream, uncommitted-change status, and contract SHA alignment. New clones should be on `dev` tracking `origin/dev`. If an existing clone is on another branch, **report it; do not switch**.
7. Tell the user to open `user-management.code-workspace` in Cursor / VS Code. For a separate **explicit** operation to switch and fast-forward update existing clones, point to `bash scripts/use-dev.sh`, but **never run it as part of this skill**.

## Non-negotiable guardrails

- Never commit application code, AA design, API contracts, Frontend or Backend implementation into the **workspace root** repository.
- `repos/user-management-contract` owns the common API and AA documents; `repos/user-management-backend` owns Backend code; `repos/user-management-frontend` owns Frontend code. Each child repository has its own Git history, branches, commits and PRs.
- Do not automatically `git fetch`, `pull`, `switch`, `checkout`, `merge`, `rebase`, `reset`, `commit`, `push`, or alter `contract.sha`. Running `scripts/init.sh` to clone missing repos is the sole intentional modification.
- The shared development branch is `dev` within **each** child repository. Feature branches should be created from `dev` and PRs should target `dev`; no feature branch creation is performed during initialization.
- Each developer owns the same domain's FE and BE: A = Auth, B = User, C = Permission.
- Check current rules in `repos/user-management-contract/docs/governance/git-workflow.md` before implementing features; this skill only initializes the workspace.
- If anything fails, report the exact blocker; do not attempt unsafe or destructive repairs.

## Done when

The workspace includes the three separate repositories (or a clearly reported blocker), their current Git state has been checked without altering existing work, and the user knows which editor workspace file to open. Do not start feature implementation.
