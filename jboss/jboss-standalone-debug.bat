@echo off
REM ----------------------------------------------
REM Script de démarrage JBoss EAP 7.1.0 - standalone
REM avec log console, debug et vérification de port
REM ----------------------------------------------

REM === Configuration de base ===
set JBOSS_HOME=C:\jboss-eap-7.1
set CONFIGURATION=standalone.xml
set HTTP_PORT=8080
set DEBUG_PORT=8787
set START_TIMEOUT=30

REM === Options Java ===
set "JAVA_OPTS=-Xms512m -Xmx1024m -Djava.net.preferIPv4Stack=true"

REM === Logs ===
set LOG_DIR=%JBOSS_HOME%\log
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

REM === Date propre pour nom de fichier ===
setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set yyyy=%%d
    set mm=%%b
    set dd=%%c
)
set TODAY=!yyyy!-!mm!-!dd!
set LOG_FILE=%LOG_DIR%\jboss-console-!TODAY!.log

REM === Aller dans le dossier bin ===
cd /d %JBOSS_HOME%\bin

echo ====================================================
echo Lancement de JBoss EAP 7.1.0 en mode standalone
echo Configuration : %CONFIGURATION%
echo Debug activé sur le port %DEBUG_PORT%
echo Log console : %LOG_FILE%
echo ====================================================

REM === Lancer en mode debug JPDA ===
start "JBoss EAP" cmd /c "call standalone.bat --debug %DEBUG_PORT% -c %CONFIGURATION% >> \"%LOG_FILE%\" 2>&1"

REM === Attendre le démarrage et vérifier si le port 8080 est ouvert ===
echo.
echo Attente du démarrage de JBoss (max %START_TIMEOUT% secondes)...
set i=0

:check_loop
timeout /t 1 >nul
set /a i+=1

REM Vérifie si le port 8080 est ouvert via netstat
netstat -an | findstr ":%HTTP_PORT%" >nul
if %errorlevel%==0 (
    echo JBoss est démaré et écoute sur le port %HTTP_PORT%.
    goto end
)

if %i% GEQ %START_TIMEOUT% (
    echo [ERREUR] Le serveur ne répond pas sur le port %HTTP_PORT% après %START_TIMEOUT% secondes.
    goto end
)

goto check_loop

:end
endlocal