---
name: workspace-init
description: Explicitly initialize the User Management multi-repo workspace by cloning missing repositories at dev and checking their Git and API contract state.
disable-model-invocation: true
---

# Workspace Init (Claude Code)

On explicit invocation of `/workspace-init`, **read and follow** the canonical cross-agent skill at `.agents/skills/workspace-init/SKILL.md` from the workspace root.

Use the same existing `scripts/init.sh`. Do not duplicate clone logic, automatically pull/switch existing repositories, or commit application code in the workspace root. Claude Code's built-in `/init` is a different command.
