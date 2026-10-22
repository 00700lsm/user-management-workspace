# Workspace Agent Instructions — bootstrap only

This repository **only owns initial clone, editor workspace configuration, and safe explicit dev sync**. It is not an AA design authority or an application repository.

- Never create or commit Auth/User/Permission code, OpenAPI, DB design, domain handoffs, or feature PRs in this root.
- For any development task, move into the owning independent Git repository under `repos/` and read **that repository's** `AGENTS.md`/Skills. Frontend work additionally requires `design.md`.
- Contract owns requirements, architecture, external OpenAPI, shared AA decisions and Git/PR policy. FE/BE use their pinned `contract.sha` instead of assuming Contract `dev` HEAD.
- A owns Auth FE+BE; B owns User FE+BE; C owns Permission FE+BE. All implementation PRs target the owning repository's `dev`.
- `bash scripts/init.sh` clones **only missing** child repos at `dev`; it never changes existing clones.
- `bash scripts/use-dev.sh` is an **explicit opt-in** fast-forward pull of clean child repositories. Never auto-run Git Pull/branch changes on editor or Agent startup.
- No reset, rebase, force push, or overwriting local work without explicit authorization.
- This repository's **only Agent Skill** is `.agents/skills/workspace-init/SKILL.md`; Claude's `.claude/skills/workspace-init/SKILL.md` is the adapter. Neither runs automatically.

See [Workspace setup](README.md) and [canonical development flow](https://github.com/00700lsm/user-management-contract#전체-개발-프로세스).
