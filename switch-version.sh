#!/bin/bash

# Déclare un tableau associatif : version => chemin du JDK
declare -A JAVA_PATHS
JAVA_PATHS["8"]="/c/Program Files/Java/jdk1.8.0_351"
JAVA_PATHS["17"]="/c/Program Files/Java/jdk-17.0.9"

# Vérifie que l'utilisateur a passé un argument (le numéro de version)
if [[ -z "$1" ]]; then
  echo "❌ Usage: source switch_java.sh <version>"
  echo "Exemple: source switch_java.sh 8"
  return 1  # Interrompt le script si aucune version n'est fournie
fi

# Stocke l'argument dans une variable
VERSION=$1

# Récupère le chemin du JDK correspondant à la version demandée
JAVA_HOME_PATH="${JAVA_PATHS[$VERSION]}"

# Vérifie si la version demandée est connue (présente dans le tableau)
if [[ -z "$JAVA_HOME_PATH" ]]; then
  echo "❌ Version $VERSION non reconnue. Versions disponibles : ${!JAVA_PATHS[@]}"
  return 1  # Interrompt le script si la version est invalide
fi

# Met à jour la variable d'environnement JAVA_HOME
export JAVA_HOME="$JAVA_HOME_PATH"

# Met à jour la variable PATH : ajoute le chemin du bin Java au début
export PATH="$JAVA_HOME/bin:$PATH"

# Affiche un message de confirmation
echo "✅ Java $VERSION activé depuis $JAVA_HOME"

# Affiche la version de Java actuellement active (pour vérification)
java -version