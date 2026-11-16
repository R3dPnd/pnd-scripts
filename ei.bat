@echo off
setlocal

rem Endless Illusion launcher: "ei" opens the desktop app, "ei --web" the browser setup.
rem Any flags pass through to pnd.py (see: ei --help).

set EI_DIR=C:\Git\pnd\endless-illusion

if not exist "%EI_DIR%\pnd.py" (
    echo ERROR: pnd.py not found in %EI_DIR%
    exit /b 1
)

where python >nul 2>nul
if errorlevel 1 (
    echo ERROR: python not found on PATH
    exit /b 1
)

if /i "%~1"=="--help" (
    cd /d "%EI_DIR%"
    python pnd.py --help
    exit /b
)

rem Run in its own minimized console so this prompt comes straight back.
rem Closing the app window (or that console) stops everything; on a failure the console stays open.
echo Starting Endless Illusion...
start "Endless Illusion" /min cmd /c "cd /d "%EI_DIR%" && python pnd.py %* || pause"
