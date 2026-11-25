---
name: project-scaffold
description: "Create minimal Python 3 Hello World project structure, src/app.py, and .gitignore for venv/caches."
---

# Skill: project-scaffold (Python)

## When to Apply
Use when initializing a new Variant 2 Python project or checking base directories.

## Inputs
- `project_root`: target workspace directory.
- `app_module` (default: `src/app.py`): entry point module.

## Outputs
- `src/app.py` with `get_greeting() -> str` returning `"Hello, World!"` and `main() -> None`.
- `tests/` directory ready for `pytest` test modules.
- `.gitignore` excluding `.venv/`, `venv/`, `__pycache__/`, `*.pyc`, `.pytest_cache/`, `.idea/`, `.DS_Store`, `Thumbs.db`.

## Verification
- Confirm `python src/app.py` outputs `Hello, World!`.
- Run `git check-ignore .venv/` to confirm virtual environments are excluded from Git.

## Error Handling
If a target file already exists with conflicting content, stop and report the conflict without overwriting user changes.
