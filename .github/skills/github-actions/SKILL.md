---
name: github-actions
description: "Configure cross-platform scripts (scripts/ci.sh, scripts/ci.bat) and GitHub Actions matrix for Python."
---

# Skill: github-actions (Python CI)

## When to Apply
Use after local `pytest` verification passes to automate CI across Linux, Windows, and macOS.

## Inputs
- `project_root`: repository root with verified `requirements.txt` and `tests/test_app.py`.
- `branches`: `develop`, `main`.

## Outputs
- `scripts/ci.sh`: POSIX script creating `.venv`, installing `requirements.txt`, running `pytest -v`, and executing `src/app.py`.
- `scripts/ci.bat`: Windows batch script performing the identical `venv` + `pytest` + `app.py` flow with `%errorlevel%` propagation.
- `.github/workflows/ci.yml`: single matrix job (`ubuntu-latest`, `windows-latest`, `macos-latest`) that delegates strictly to `scripts/ci.sh` and `scripts/ci.bat`.

## Verification
- Confirm `ci.yml` triggers on `push` and `pull_request` to `develop` and `main`.
- Confirm all 3 OS jobs pass on GitHub Actions.

## Error Handling
If a runner fails due to line endings (CRLF), permissions, or environment setup, halt, record the diagnostic log in `docs/ai-log.md`, and apply a focused fix.
