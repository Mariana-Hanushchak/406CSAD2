---
name: create-actions
description: "Invoke github-actions skill to create scripts/ci.sh, scripts/ci.bat, and ci.yml."
agent: build-engineer
---

## Preconditions
- Local `pytest -v` passes inside `.venv`.

## Actions
1. Apply skill `.github/skills/github-actions/SKILL.md`.
2. Create `scripts/ci.sh` and `scripts/ci.bat` running `venv` setup, `pip install -r requirements.txt`, `pytest -v`, and `src/app.py`.
3. Create `.github/workflows/ci.yml` with matrix strategy (`ubuntu-latest`, `windows-latest`, `macos-latest`) on `push` and `pull_request` to `develop` and `main`.

## Verification
- Confirm `ci.yml` delegates strictly to `scripts/ci.sh` and `scripts/ci.bat`.
