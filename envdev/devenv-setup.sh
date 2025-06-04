#!/bin/bash

# Définir le répertoire de base sur D:
BASE_DIR="/d/Developpement"

echo "📁 Création de la structure dans : $BASE_DIR"
mkdir -p "$BASE_DIR"

# Sous-répertoires principaux et secondaires
mkdir -p "$BASE_DIR/Documentation"
mkdir -p "$BASE_DIR/IDEs/Eclipse"
mkdir -p "$BASE_DIR/IDEs/IntelliJ"
mkdir -p "$BASE_DIR/IDEs/Workspaces"
mkdir -p "$BASE_DIR/Install"
mkdir -p "$BASE_DIR/JDKs"
mkdir -p "$BASE_DIR/Repositories/Client_name"
mkdir -p "$BASE_DIR/Repositories/Opensource"
mkdir -p "$BASE_DIR/Repositories/Own"
mkdir -p "$BASE_DIR/Servers/Jboss"
mkdir -p "$BASE_DIR/Tools"

echo "✅ Structure créée avec succès."

# Vérifier si la commande `tree` est disponible
if command -v tree > /dev/null; then
    echo -e "\n📂 Aperçu de la structure :"
    tree "$BASE_DIR"
else
    echo -e "\n⚠️ La commande 'tree' n'est pas installée. Voici une alternative avec 'find':"
    find "$BASE_DIR"
fi
