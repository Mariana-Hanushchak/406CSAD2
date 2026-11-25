---
name: init
description: "Orchestrator command: sequentially execute git-init, create-project, create-build, create-actions, and check."
agent: build-engineer
---

## Execution Order

Execute each command strictly in order:
1. `/git-init`
2. `/create-project`
3. `/create-build`
4. `/create-actions`
5. `/check`

## Fail-Fast & Safety Rules
- Halt immediately on any error, test failure, or conflict; do not run subsequent dependent steps.
- Ensure repeated runs are idempotent and never destroy existing files or commit `.venv/`.
- Log all prompts, diagnostics, and resolutions in `docs/ai-log.md`.
