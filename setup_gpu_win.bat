@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM =======================================================
echo Step 1: Upgrade pip, setuptools, wheel
REM =======================================================
python -m pip install --upgrade pip setuptools wheel

REM =======================================================
echo Step 2: Install Poetry if not installed
REM =======================================================
poetry --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Poetry not found, installing...
    pip install poetry
) ELSE (
    echo Poetry already installed
)

REM =======================================================
echo Step 3: Poetry install base deps from pyproject.toml
REM =======================================================
poetry install

REM =======================================================
echo Step 4: Install CUDA GPU wheel for llama-cpp-python
REM =======================================================
REM Убедись, что wheel находится в относительном пути wheels\
set WHEEL_PATH=wheels\llama_cpp_python-0.3.8+cu128.gemma3-cp312-cp312-win_amd64.whl
IF EXIST "%WHEEL_PATH%" (
    echo Installing llama_cpp_python from %WHEEL_PATH%
    pip install --force-reinstall "%WHEEL_PATH%"
) ELSE (
    echo ERROR: Wheel file not found at %WHEEL_PATH%
    pause
    exit /b 1
)

REM =======================================================
echo Step 5: Verify CUDA support
REM =======================================================
python - <<END
from llama_cpp import llama_print_system_info, Llama
print("System info:")
print(llama_print_system_info())
try:
    m = Llama(model_path="data/models/micro/mudreflex-core.gguf", n_gpu_layers=-1)
    print("GPU inference OK")
except Exception as e:
    print("GPU inference FAILED:", e)
END

echo Setup Completed.
pause
