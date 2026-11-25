# Журнал взаємодії з AI (`docs/ai-log.md`)

**Проєкт:** `406CSAD2` — Лабораторна робота №1 (Проєктування AI-агента для автоматизації розробки та CI/CD)  
**Варіант:** 2 (Python 3, `venv` + скрипт запуску, `pytest`)

## Реєстр сесій та перевірок

| ID | Етап | Запит / Дія | Змінені файли | Статус | Примітки та діагностика |
|---|---|---|---|---|---|
| P-01 | Архітектура | Створення маніфесту `build-engineer.agent.md`, документації `architecture.md`, `usage.md` та початкового журналу `ai-log.md`. | `.github/agents/build-engineer.agent.md`, `docs/architecture.md`, `docs/usage.md`, `docs/ai-log.md` | Успішно | Гілка `develop`: задано роль, правила безпеки `.venv/` та політику Fail-Fast. |
| P-02 | Навички (Skills) | Створення трьох навичок: `project-scaffold`, `build-and-test`, `github-actions` під Python / `venv` / `pytest`. | `.github/skills/*/SKILL.md`, `docs/ai-log.md` | Успішно | Визначено входи, очікувані артефакти, команди перевірки та обробку помилок. |
| P-03 | Команди та Оркестратор | Створення 5 команд (`git-init`, `create-project`, `create-build`, `create-actions`, `check`) та оркестратора `init`. | `.github/prompts/*.prompt.md`, `docs/ai-log.md` | Успішно | Налаштовано послідовне виконання з ідемпотентністю та зупинкою при помилках. |
| P-04 | Проєкт і тести | Генерація `.gitignore`, `requirements.txt`, `pytest.ini`, `src/app.py`, `tests/test_app.py` та перевірка в `.venv`. | `.gitignore`, `requirements.txt`, `pytest.ini`, `src/app.py`, `tests/test_app.py`, `docs/ai-log.md` | Успішно | `2 passed in 0.09s`, вивід `Hello, World!`; `.venv/` ігнорується Git. |
| P-05 | Перевірка тестів (`pytest`) | Виявлено збій `AssertionError` у `tests/test_app.py::test_get_greeting_returns_hello_world` (`assert 'Hello, World!' == 'Hello, Python!'`). | `tests/test_app.py`, `docs/ai-log.md` | Помилка (`1 failed`) | За правилом Fail-Fast конвеєр зупинено до усунення невідповідності в тесті. |
| P-06 | Виправлення тесту та CI | Запит до AI-агента: виправлено очікуване значення в `tests/test_app.py` на `"Hello, World!"`; створено `scripts/ci.sh`, `scripts/ci.bat` та `ci.yml`. | `tests/test_app.py`, `scripts/ci.sh`, `scripts/ci.bat`, `.github/workflows/ci.yml`, `docs/ai-log.md` | Успішно виправлено | `2 passed`, налаштовано матричний CI для Ubuntu, Windows і macOS. |
