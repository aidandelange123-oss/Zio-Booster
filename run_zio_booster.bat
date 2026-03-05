@echo off
REM Zio-Booster Application Launcher
REM This script installs dependencies and runs the Zio-Booster application

echo Welcome to Zio-Booster FPS Booster!
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed or not found in PATH.
    echo Please install Python 3.7 or higher and try again.
    pause
    exit /b 1
)

REM Check if virtual environment exists, create if it doesn't
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
    if errorlevel 1 (
        echo Failed to create virtual environment.
        pause
        exit /b 1
    )
)

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install requirements
echo Installing required packages...
if exist "requirements.txt" (
    pip install -r requirements.txt
) else (
    REM If requirements.txt doesn't exist, install the essential packages
    pip install psutil pynvml py-cpuinfo
    pip install customtkinter
)

REM Navigate to the src directory and run the application
echo.
echo Starting Zio-Booster application...
cd src
python modern_main.py

REM Deactivate virtual environment
deactivate

echo.
echo Zio-Booster application closed.
pause