@echo off
setlocal

:: Définir le répertoire de base
set "BASE_DIR=D:\Developpement"

echo Création de la structure dans %BASE_DIR%
mkdir "%BASE_DIR%\Documentation"
mkdir "%BASE_DIR%\IDEs\Eclipse"
mkdir "%BASE_DIR%\IDEs\IntelliJ"
mkdir "%BASE_DIR%\IDEs\Workspaces"
mkdir "%BASE_DIR%\Install"
mkdir "%BASE_DIR%\JDKs"
mkdir "%BASE_DIR%\Repositories\clients_name"
mkdir "%BASE_DIR%\Repositories\Opensource"
mkdir "%BASE_DIR%\Repositories\Own"
mkdir "%BASE_DIR%\Servers\Jboss"
mkdir "%BASE_DIR%\Tools"

echo.
echo ✅ Structure créée avec succès.

:: Affichage de la structure
echo.
echo 📂 Aperçu de l'arborescence :
tree "%BASE_DIR%" /F

endlocal
pause