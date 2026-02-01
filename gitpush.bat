@echo off
REM Quick git push helper (batch)
REM Usage: gitpush.bat "commit message"  OR  gitpush.bat
if "%~1"=="" (
  for /f %%i in ('powershell -NoProfile -Command "(Get-Date).ToString('yyyy_MM_dd')"') do set MSG=%%i
) else set MSG=%~1
echo git add .
git add .
echo git commit -m "%MSG%"
git commit -m "%MSG%"
if errorlevel 1 (
  echo Commit failed or nothing to commit.
  exit /b 1
) else (
  echo git push
  git push
)
