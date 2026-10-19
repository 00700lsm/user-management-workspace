# Claude Code — Multi-repository Workspace

Start by reading [AGENTS.md](./AGENTS.md).

The Workspace root owns only initialization tooling and documentation. **Do not commit feature code from the Workspace root.** Choose one of the independent repositories under `repos/` and use that repository's Git history and feature branches based on `dev`.

Project design and API contract are authoritative in `repos/user-management-contract/`, especially `docs/governance/git-workflow.md` and `openapi.yaml`. Backend and Frontend must use their approved `contract.sha` and maintain separate commits/PRs.

Running the editor or Agent must not automatically fetch, pull, or change branches. Init clones new repos at `dev`; existing repos can be switched/pulled only by explicit `bash scripts/use-dev.sh`.

## Initialization

Invoke `/workspace-init` explicitly for first-time repository cloning and read-only checks. The skill is `.claude/skills/workspace-init/SKILL.md`; do not auto-run it or mistake it for the built-in `/init`.

## Development skills
Use `/contract-reference`, `/frontend-workflow`, or `/backend-workflow` from Workspace root. These read `.agents/skills/` wrappers and the owning child repository's detailed Skill. Shared authoring rules: `repos/user-management-contract/docs/governance/agent-skills-guide.md`. Never commit application changes at Workspace root.
