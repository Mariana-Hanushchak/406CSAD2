---
name: build-and-test
description: "Configure Python venv, requirements.txt, pytest test suite (tests/test_app.py), and verify locally."
---

# Skill: build-and-test (Python + venv + pytest)

## When to Apply
Use after `project-scaffold` to configure dependency management (`requirements.txt`), virtual environment (`venv`), and `pytest` unit tests.

## Inputs
- `project_root`: repository root containing `src/app.py`.
- `python_version` (default: `3.12+`): Python interpreter version.

## Outputs
- `requirements.txt` specifying `pytest>=8.0.0`.
- `tests/test_app.py` testing `get_greeting()` and `main()` stdout output via `capsys`.

## Verification
```powershell
python -m venv .venv
.\.venv\Scripts\pip.exe install -r requirements.txt
.\.venv\Scripts\pytest.exe -v
```
Success requires exit code `0` and all tests passing (`0 failed`).

## Error Handling
If `pytest` reports an `AssertionError`, `ImportError`, or missing interpreter, halt immediately, log the traceback in `docs/ai-log.md`, and resolve the root cause before proceeding.
