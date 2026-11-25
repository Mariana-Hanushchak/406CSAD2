---
name: create-build
description: "Invoke build-and-test skill to configure requirements.txt, venv, and pytest tests."
agent: build-engineer
---

## Preconditions
- `src/app.py` exists.

## Actions
1. Apply skill `.github/skills/build-and-test/SKILL.md`.
2. Create `requirements.txt` (`pytest>=8.0.0`) and `tests/test_app.py`.
3. Create `.venv`, install dependencies, and run `pytest -v`.

## Verification
- `pytest -v` exits with `0` and all test cases pass.
