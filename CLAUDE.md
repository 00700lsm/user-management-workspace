# Claude Code in Workspace

Read [AGENTS.md](AGENTS.md) first. The Workspace root is **bootstrap-only**.

- Explicit first-time setup: invoke `/workspace-init`, backed by `.claude/skills/workspace-init/SKILL.md` and `scripts/init.sh`. Never auto-run or auto-Pull.
- For all feature, contract, DB, API, UI or test work, enter the owning `repos/user-management-{contract,backend,frontend}` repository, read its `CLAUDE.md` / `AGENTS.md`, and use its task-specific Skills.
- Do not commit application or AA design changes in Workspace Git.
- Full team development flow and review rules: [Contract README](https://github.com/00700lsm/user-management-contract#전체-개발-프로세스).
