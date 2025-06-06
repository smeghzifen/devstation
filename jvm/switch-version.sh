#!/bin/bash

# CLI : source switch-version.sh

declare -A JAVA_PATHS
JAVA_PATHS["8"]="/c/Program Files/Java/jdk1.8.0_351"
JAVA_PATHS["17"]="/c/Program Files/Java/jdk-17.0.9"

if [[ -z "$1" ]]; then
  echo "Usage: source switch_java.sh <version>"
  echo "Exemple: source switch_java.sh 8"
  return 1
fi

VERSION=$1
JAVA_HOME_PATH="${JAVA_PATHS[$VERSION]}"


if [[ -z "$JAVA_HOME_PATH" ]]; then
  echo "Version $VERSION non reconnue. Versions disponibles : ${!JAVA_PATHS[@]}"
  return 1
fi

# Met à jour de :
# La variable d'environnement JAVA_HOME
# La variable PATH : ajoute le chemin du bin Java au début
export JAVA_HOME="$JAVA_HOME_PATH"
export PATH="$JAVA_HOME/bin:$PATH"


echo "Java $VERSION activated from $JAVA_HOME"
java -version