# Workspace Agent Instructions

This repository is an **init/setup shell**, not the application source repository.

## Required scope
- **Never commit application, API or domain changes in the Workspace root.**
- Commit/Open PR in the owning Git repository under `repos/`: Contract, Backend, or Frontend.
- Only maintain bootstrap, editor workspace config, and environment guidance in the Workspace root Git repository.
- All three child repositories normally work from `dev` / `origin/dev`. Branch features from `dev`, and target PRs to `dev`.
- Read the Contract repository's `docs/governance/git-workflow.md` before editing app code and honor `contract.sha` in FE/BE.
- Domain allocation is aligned full-stack: A=Auth FE+BE, B=User FE+BE, C=Permission FE+BE.

## Initial setup / syncing
- `bash scripts/init.sh`: clone absent repositories at `dev`. Existing clones are never switched or pulled.
- `bash scripts/use-dev.sh`: explicit command to switch/fast-forward pull `dev` on all three child repositories. Never run it automatically when an editor or Agent session starts.
- Never reset, rebase, force-push or overwrite a developer's local changes without explicit agreement.
- Work only within the appropriate Git working directory when running Git commands.
- Ask before pushing, opening PRs or merging if permission/scope is unclear.

See [README.md](./README.md) and [getting started](./docs/getting-started.md).

## Initialization skill

Claude Code users can explicitly run `/workspace-init` from this root. See `.claude/skills/workspace-init/SKILL.md`. Never auto-run it; it only clones missing repositories and checks their state.

## Cross-agent skill

Canonical project-local init skill: `.agents/skills/workspace-init/SKILL.md` (Cursor, Codex, compatible agents). Claude Code's `.claude/skills/workspace-init/SKILL.md` is an adapter. Invoke only on explicit request, reusing `scripts/init.sh`.

## Development skills
- Canonical Contract guide: `repos/user-management-contract/docs/governance/agent-skills-guide.md`
- Shared AA reference: `.agents/skills/contract-reference/SKILL.md`
- Frontend workflow: `.agents/skills/frontend-workflow/SKILL.md` (delegates to `repos/user-management-frontend/.agents/skills/frontend-workflow/SKILL.md`)
- Backend workflow: `.agents/skills/backend-workflow/SKILL.md` (delegates to `repos/user-management-backend/.agents/skills/backend-workflow/SKILL.md`)
- FE/BE must use their approved `contract.sha` and commit only in the owning repository.
