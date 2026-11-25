---
name: check
description: "Validate Python project structure, venv/pytest execution, and CI workflow without modifying files."
agent: build-engineer
---

## Preconditions
- `src/app.py`, `tests/test_app.py`, `requirements.txt`, `scripts/ci.sh`, `scripts/ci.bat`, and `.github/workflows/ci.yml` exist.

## Actions
1. Verify required files exist and `.venv/` is ignored by Git (`git check-ignore .venv/`).
2. Run `pytest -v` in `.venv` and confirm `src/app.py` runs cleanly.
3. Inspect `scripts/ci.sh` (`sh -n scripts/ci.sh` if available) and `.github/workflows/ci.yml` without modifying any files.

## Verification
- Report exact exit codes and test counts; fail immediately if any check fails.
