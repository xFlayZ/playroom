@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js wurde nicht gefunden. Bitte zuerst Node.js 20+ installieren:
  echo https://nodejs.org/
  pause
  exit /b 1
)
echo.
echo ==========================================
echo      PLAYROOM - 13 Multiplayer-Spiele
 echo ==========================================
echo.
echo Oeffne http://localhost:3000 im Browser.
echo Mit STRG+C beendest du den Server.
echo.
start "" "http://localhost:3000"
node server.js
pause
