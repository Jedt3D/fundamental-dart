@echo off
REM Run `dart pub get && dart test` for every exNN-* lesson.
setlocal enabledelayedexpansion

set "ROOT=%~dp0.."
pushd "%ROOT%"

set /a pass=0
set /a fail=0
set "failed="

for /d %%D in (ex??-*) do (
    echo.
    echo -------- %%D --------
    pushd "%%D"
    call dart pub get --suppress-analytics >nul 2>&1
    call dart test
    if errorlevel 1 (
        set /a fail+=1
        set "failed=!failed! %%D"
    ) else (
        set /a pass+=1
    )
    popd
)

echo.
echo ========================================
echo   Passed: %pass% lesson(s^)
echo   Failed: %fail% lesson(s^)
if not "%failed%"=="" echo   Failing lessons:%failed%
echo ========================================

popd
if %fail% gtr 0 (exit /b 1) else (exit /b 0)
