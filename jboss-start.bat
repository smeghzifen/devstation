@echo off
REM ----------------------------------------------
REM Script pour démarrer JBoss EAP 7.1.0 en mode standalone
REM avec redirection des logs dans un fichier
REM ----------------------------------------------

REM Définir le chemin d'installation de JBoss
set JBOSS_HOME=C:\jboss-eap-7.1

REM Définir le nom de la configuration
set CONFIGURATION=standalone.xml

REM Définir les options Java
set "JAVA_OPTS=-Xms512m -Xmx1024m -Djava.net.preferIPv4Stack=true"

REM Définir le chemin du fichier de log
set LOG_DIR=%JBOSS_HOME%\log
set LOG_FILE=%LOG_DIR%\jboss-console-%DATE%.log

REM Créer le dossier de logs s'il n'existe pas
if not exist "%LOG_DIR%" (
    mkdir "%LOG_DIR%"
)

REM Aller dans le répertoire bin de JBoss
cd /d %JBOSS_HOME%\bin

REM Démarrer le serveur et rediriger la sortie vers le fichier log
echo Démarrage de JBoss EAP 7.1.0 avec configuration %CONFIGURATION%...
echo Les logs seront enregistrés dans : %LOG_FILE%

REM Supprimer les caractères invalides pour les fichiers dans la date (/, : etc.)
setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set yyyy=%%d
    set mm=%%b
    set dd=%%c
)
set TODAY=!yyyy!-!mm!-!dd!
set LOG_FILE=%LOG_DIR%\jboss-console-!TODAY!.log

standalone.bat -c %CONFIGURATION% >> "%LOG_FILE%" 2>&1

endlocal