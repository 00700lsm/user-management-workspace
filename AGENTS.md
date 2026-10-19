# Agent entrypoint — User Management Workspace

Scope: top-level setup repository only. The three implementation/contract repositories below `repos/` are independently version-controlled.

## Before working
1. Read `README.md` and `docs/getting-started.md`.
2. Read the authoritative documents under `repos/user-management-contract/docs/` and `repos/user-management-contract/openapi.yaml` when those repositories have been initialized.
3. If the working copies are absent, request that the user run `bash scripts/init.sh` (or receive explicit permission to run it).

## Guardrails
- Workspace repository owns **initial clone and editor workspace configuration only**. Do not add automatic Git pull/fetch, branch changes, or repository-wide commits during editor startup.
- Work in the relevant Git repository. Do not treat the parent Workspace as a monorepo.
- Backend and Frontend `contract.sha` must point to the approved shared API contract commit.
- Do not change the API contract solely to match implementation. Propose and review contract changes first.
- Do not automatically switch, reset, rebase, merge, force-push, or overwrite uncommitted developer work.
- Each domain owner handles matching FE+BE: A Auth, B User, C Permission.
- Ask before pushing, opening a PR, merging, or modifying other repositories when authority is unclear.

For more detailed, current governance rules refer to the Contract repository rather than duplicating them here.
