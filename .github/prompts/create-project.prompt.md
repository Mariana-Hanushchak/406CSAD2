---
name: create-project
description: "Invoke project-scaffold skill to create src/app.py and tests/ directory."
agent: build-engineer
---

## Preconditions
- `.gitignore` excludes `.venv/` and Python cache directories.

## Actions
1. Apply skill `.github/skills/project-scaffold/SKILL.md`.
2. Create `src/app.py` with `get_greeting()` and `main()`.
3. Create `tests/` directory.

## Verification
- Confirm `python src/app.py` outputs `Hello, World!`.
