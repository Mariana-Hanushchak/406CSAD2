@echo off
python -m venv .venv
if errorlevel 1 exit /b %errorlevel%
.venv\Scripts\python.exe -m pip install --upgrade pip
if errorlevel 1 exit /b %errorlevel%
.venv\Scripts\pip.exe install -r requirements.txt
if errorlevel 1 exit /b %errorlevel%
.venv\Scripts\pytest.exe -v
if errorlevel 1 exit /b %errorlevel%
.venv\Scripts\python.exe src\app.py
exit /b %errorlevel%
