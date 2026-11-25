# Архітектура AI-агента (`build-engineer` — Варіант 2, Python)

## 1. Проблеми, які вирішує агент

Агент **Python Build & CI Automation Engineer** автоматизує повний цикл створення та перевірки кросплатформного Python-проєкту:
- розгортання структури каталогів (`src/`, `tests/`, `scripts/`) та правил `.gitignore` для ізоляції `.venv/` і кешів Python;
- створення мінімального застосунку *Hello World* (`src/app.py`) та модульних тестів на базі `pytest` (`tests/test_app.py`);
- налаштування ізольованого віртуального середовища (`venv`) і кросплатформних скриптів запуску (`scripts/ci.sh`, `scripts/ci.bat`);
- генерація матричного CI workflow у `.github/workflows/ci.yml` для Ubuntu, Windows і macOS;
- контроль цілісності без руйнування існуючих файлів та ведення журналу взаємодії `docs/ai-log.md`.

## 2. Компоненти системи

| Рівень | Назва | Файл | Функція |
|---|---|---|---|
| Manifest | `build-engineer` | `.github/agents/build-engineer.agent.md` | Роль агента, обмеження безпеки, критерії завершення |
| Skill 1 | `project-scaffold` | `.github/skills/project-scaffold/SKILL.md` | Створення `src/app.py`, структури `tests/` і `.gitignore` |
| Skill 2 | `build-and-test` | `.github/skills/build-and-test/SKILL.md` | Конфігурація `requirements.txt`, `venv`, `tests/test_app.py` і запуск `pytest` |
| Skill 3 | `github-actions` | `.github/skills/github-actions/SKILL.md` | Створення `scripts/ci.sh`, `scripts/ci.bat` та `.github/workflows/ci.yml` |
| Command | `git-init` | `.github/prompts/git-init.prompt.md` | Перевірка стану Git та оновлення `.gitignore` |
| Command | `create-project` | `.github/prompts/create-project.prompt.md` | Запуск навички `project-scaffold` |
| Command | `create-build` | `.github/prompts/create-build.prompt.md` | Запуск навички `build-and-test` |
| Command | `create-actions` | `.github/prompts/create-actions.prompt.md` | Запуск навички `github-actions` |
| Command | `check` | `.github/prompts/check.prompt.md` | Незалежна перевірка структури, `pytest` та YAML без модифікації коду |
| Orchestrator | `init` | `.github/prompts/init.prompt.md` | Координація етапів у порядку `git-init` → `create-project` → `create-build` → `create-actions` → `check` |

## 3. Передача даних та обробка помилок (Fail-Fast)

```text
/init (Orchestrator)
  ├─► [1] /git-init        ──► аудит Git + .gitignore (.venv/, __pycache__/, .pytest_cache/)
  ├─► [2] /create-project  ──► project-scaffold ──► src/app.py + каталог tests/
  ├─► [3] /create-build    ──► build-and-test   ──► requirements.txt + tests/test_app.py + pytest
  ├─► [4] /create-actions  ──► github-actions   ──► scripts/ci.sh, scripts/ci.bat, ci.yml
  └─► [5] /check           ──► контрольна перевірка без змін + звіт у docs/ai-log.md
```

У разі будь-якої помилки (збій `pytest`, відсутність інтерпретатора Python, конфлікт файлів або помилка скрипта) оркестратор миттєво зупиняє виконання, фіксує діагностику в `docs/ai-log.md` і блокує перехід до наступних етапів до усунення причини.
