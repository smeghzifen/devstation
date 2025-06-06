@echo off
REM  "free-port.bat 8080"
setlocal

if "%1"=="" (
    echo Usage: free-port.bat [port]
    exit /b 1
)

set PORT=%1

REM "Trouver le PID écoutant sur le port"
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :%PORT% ^| findstr LISTENING') do (
    set PID=%%a
)

if defined PID (
    echo Port %PORT% utilisé par le processus PID %PID%
    echo Tentative de terminaison du processus...
    taskkill /F /PID %PID%
    echo Processus %PID% tué avec succès.
) else (
    echo Aucun processus n'écoute sur le port %PORT%
)

endlocal
