---
name: contract-reference
description: Locate the shared AA and pinned API contract when working from the parent Workspace.
---

# Contract reference

Locate `repos/user-management-contract` and read its `docs/aa/README.md`, `docs/aa/decisions.md`, `docs/aa/auth-design.md`, and `docs/governance/agent-skills-guide.md`.

For Frontend delegate to `repos/user-management-frontend/.agents/skills/frontend-workflow/SKILL.md`.
For Backend delegate to `repos/user-management-backend/.agents/skills/backend-workflow/SKILL.md`.
Both implementations use their own `contract.sha` to pin the actual OpenAPI schema. Do not assume the moving dev HEAD is the approved API.

When a child repo is absent, request explicit Workspace init. Never commit application code in the Workspace root.

Before project setup, read Contract `repos/user-management-contract/docs/aa/tech-stack-proposal.md`, Frontend `repos/user-management-frontend/docs/aa/tech-stack.md`, and Backend `repos/user-management-backend/docs/aa/tech-stack.md`. Treat recommendations as proposed until AA approves DEC-003/004/011. Do not install a stack from Workspace root.
