@echo off
chcp 65001 >nul
title Vektor GP
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 goto try_python

echo Vektor GP ishga tushmoqda...
node server.js --open
goto end

:try_python
where python >nul 2>nul
if errorlevel 1 goto no_runtime
echo Node.js topilmadi, Python orqali ishga tushirilmoqda...
start "" "http://localhost:5173/"
python -m http.server 5173 --bind 127.0.0.1
goto end

:no_runtime
echo.
echo [XATO] Node.js topilmadi.
echo O'yinni ishga tushirish uchun Node.js o'rnating: https://nodejs.org
echo So'ng shu faylni qayta ishga tushiring.
echo.

:end
pause
