# Claude Code — Multi-repository Workspace

Start by reading [AGENTS.md](./AGENTS.md).

The Workspace root owns only initialization tooling and documentation. **Do not commit feature code from the Workspace root.** Choose one of the independent repositories under `repos/` and use that repository's Git history and feature branches based on `dev`.

Project design and API contract are authoritative in `repos/user-management-contract/`, especially `docs/governance/git-workflow.md` and `openapi.yaml`. Backend and Frontend must use their approved `contract.sha` and maintain separate commits/PRs.

Running the editor or Agent must not automatically fetch, pull, or change branches. Init clones new repos at `dev`; existing repos can be switched/pulled only by explicit `bash scripts/use-dev.sh`.

## Initialization

Invoke `/workspace-init` explicitly for first-time repository cloning and read-only checks. The skill is `.claude/skills/workspace-init/SKILL.md`; do not auto-run it or mistake it for the built-in `/init`.

## Development guidance (not Workspace skills)

The only Workspace skill is `/workspace-init`.

For application work, read the owning repository's `CLAUDE.md`, `AGENTS.md` and detailed skill:
- Frontend: choose the task-specific `implement-ui-screen`, `create-shared-ui-component`, `validate-frontend-ui` or `test-frontend-integration` Skill in `repos/user-management-frontend/`. **Always read `repos/user-management-frontend/design.md` before UI/CSS work.**
- Backend: read `repos/user-management-backend/CLAUDE.md`; use one of its four task-specific skills: `implement-api-operation`, `create-db-migration`, `validate-backend-api`, `test-auth-integration`.
- Shared source of truth: `repos/user-management-contract/docs/aa/README.md`, `docs/governance/agent-skills-guide.md`, and the implementation repository's pinned `contract.sha`.

No automatic Git operations. Commit implementation only in the owning child repository.
