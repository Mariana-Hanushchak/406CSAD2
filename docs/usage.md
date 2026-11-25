# Інструкція запуску AI-агента та локальної перевірки (`406CSAD2`)

## 1. Запуск AI-агента у VS Code

1. Відкрийте папку `406CSAD2` у Visual Studio Code із підключеним **GitHub Copilot Chat**.
2. Оберіть агента **`build-engineer`** (`.github/agents/build-engineer.agent.md`).
3. Для повного розгортання проєкту виконайте команду-оркестратор:
   ```text
   /init
   ```
4. Окремі команди для точкового запуску:
   - `/git-init` — перевірка Git та оновлення `.gitignore`;
   - `/create-project` — генерація `src/app.py` та каталогів проєкту;
   - `/create-build` — створення `requirements.txt`, `tests/test_app.py` та запуск `pytest`;
   - `/create-actions` — генерація `scripts/ci.sh`, `scripts/ci.bat` та `.github/workflows/ci.yml`;
   - `/check` — перевірка проєкту, тестів і конфігурацій без внесення змін.

## 2. Локальний запуск проєкту та тестів

### Windows (PowerShell / CMD)
```powershell
.\scripts\ci.bat
```
або вручну через `venv`:
```powershell
python -m venv .venv
.\.venv\Scripts\pip.exe install -r requirements.txt
.\.venv\Scripts\pytest.exe -v
.\.venv\Scripts\python.exe src\app.py
```

### Linux / macOS
```bash
chmod +x scripts/ci.sh
./scripts/ci.sh
```

## 3. Очікуваний результат

- Віртуальне середовище `.venv/` створюється локально та ігнорується Git;
- Усі модульні тести `tests/test_app.py` проходять у `pytest` (`2 passed`);
- Застосунок `src/app.py` виводить у консоль `Hello, World!`.
