@echo off
setlocal

set DANN_DIR=C:\Git\pnd\dann-of-thursday
set VENV_PYTHON=%DANN_DIR%\.venv\Scripts\python.exe
set UI_DIR=%DANN_DIR%\ui

if not exist "%VENV_PYTHON%" (
    echo ERROR: Virtual environment not found at %DANN_DIR%\.venv
    echo Run: python -m venv .venv ^&^& .venv\Scripts\activate ^&^& pip install -r requirements.txt
    exit /b 1
)

if not exist "%UI_DIR%\node_modules" (
    echo Installing UI dependencies...
    cd /d "%UI_DIR%"
    npm install
)

echo Starting Dann API on http://localhost:8000 ...
if "%1"=="--no-voice" (
    start "Dann API" cmd /k "cd /d %DANN_DIR% && set NO_VOICE=1 && %VENV_PYTHON% -m app.main"
) else (
    start "Dann API" cmd /k "cd /d %DANN_DIR% && %VENV_PYTHON% -m app.main"
)

echo Starting Dann UI on http://localhost:3000 ...
start "Dann UI" cmd /k "cd /d %UI_DIR% && npm run dev"
