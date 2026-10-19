---
name: workspace-init
description: Initialize this User Management multi-repository workspace by cloning missing Contract, Backend, and Frontend repositories on dev, then safely checking Git branches and contract SHA alignment. Use when a developer explicitly requests first-time workspace setup.
disable-model-invocation: true
---

# User Management Workspace — Initialization

Run **only when explicitly invoked** as `/workspace-init`. This is not a replacement for Claude Code's built-in `/init`.

## Goal

Prepare the local workspace using the existing, versioned `scripts/init.sh`; verify readiness without taking ownership of any developer's Git changes.

## Procedure

1. Locate the **user-management-workspace root** containing `scripts/init.sh`, `user-management.code-workspace`, and `AGENTS.md`. Work from that root. If the workspace is not cloned locally, give the user the clone instructions from `README.md` and stop.
2. Read `AGENTS.md` and `docs/getting-started.md`. Confirm Git and Bash are available. Do not install tools or change Git configuration automatically.
3. Check whether `repos/user-management-contract`, `repos/user-management-backend`, and `repos/user-management-frontend` already exist. Do **not** delete, reset, checkout, or overwrite any existing working directory.
4. Run exactly `bash scripts/init.sh` from the Workspace root. This only clones **missing** repos with `dev` checked out and tracking `origin/dev`; existing repos are left unchanged.
5. Inspect each child repository **read-only**:
   - its `origin` remote URL
   - checked-out branch (expect `dev` for newly cloned repositories)
   - upstream tracking branch (expect `origin/dev` for new clones)
   - `git status --short` for existing local changes
   - whether `repos/user-management-contract/openapi.yaml` and governance documents exist
   - whether Frontend/Backend `contract.sha` files refer to the same nonempty 40-character commit SHA.
6. Report a compact summary for Contract, Backend, and Frontend: path, current branch/upstream, status, and whether `contract.sha` is aligned. Note any missing tools or unexpected repositories. If files already existed on a different branch, **report without switching**.
7. Tell the user to open `user-management.code-workspace` with Cursor or VS Code. For deliberate checkout/fast-forward Pull later, refer to `bash scripts/use-dev.sh` but **do not run it in this skill**.

## Safety and source-of-truth rules

- The Workspace root is a **setup repository**, not a monorepo. Never commit feature code, API contracts, or app code to its Git history.
- Contract/API/AA documents belong to `repos/user-management-contract`; backend changes to `repos/user-management-backend`; frontend changes to `repos/user-management-frontend`. Commits/PRs must be per repository.
- Do not run automatic `git pull`, `fetch`, `checkout`, `switch`, `merge`, `rebase`, `reset`, `commit`, `push`, or dependency installation as part of this skill. `scripts/init.sh` handles the initial clone only.
- Never auto-update `contract.sha`. If the SHA differs or seems stale, **report the mismatch** and refer to the approval process in `repos/user-management-contract/docs/contract-governance.md`.
- For ongoing development, read the shared rules in `repos/user-management-contract/docs/governance/git-workflow.md`. Feature branches are based on `dev`; domain ownership is A=Auth FE+BE, B=User FE+BE, C=Permission FE+BE.
- If cloning or validation fails, stop and show the exact blocker. Do not silently repair Git state.

## Expected result

```text
user-management-workspace/
└── repos/
    ├── user-management-contract/  # dev (new clones)
    ├── user-management-backend/   # dev (new clones)
    └── user-management-frontend/  # dev (new clones)
```

Give the user the next manual step; do not start application implementation.
