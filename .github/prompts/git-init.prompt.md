---
name: git-init
description: "Verify Git repository state and configure .gitignore for Python venv and caches."
agent: build-engineer
---

## Preconditions
- Workspace directory is readable.

## Actions
1. Inspect `git status` without altering existing Git history.
2. Create or update `.gitignore` to exclude `.venv/`, `venv/`, `__pycache__/`, `*.pyc`, `.pytest_cache/`, `.idea/`, `.DS_Store`, `Thumbs.db`.

## Verification
- Confirm `.gitignore` exists and `git check-ignore .venv/` matches `.venv/`.
