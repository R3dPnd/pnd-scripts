@echo off
setlocal

set DANN_DIR=C:\Git\pnd\dann-of-thursday
set VENV_PYTHON=%DANN_DIR%\.venv\Scripts\python.exe

if not exist "%VENV_PYTHON%" (
    echo ERROR: Virtual environment not found at %DANN_DIR%\.venv
    echo Run: python -m venv .venv ^&^& .venv\Scripts\activate ^&^& pip install -r requirements.txt
    exit /b 1
)

cd /d "%DANN_DIR%"
"%VENV_PYTHON%" dann.py %*
