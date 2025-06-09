#!/bin/bash

###############################################################################
# Script : sparse-checkout-maven.sh
#
# Description :
# Ce script permet d'utiliser la fonctionnalité "sparse-checkout" de Git
# sur un dépôt Maven multi-modules. Il clone le dépôt sans extraire
# l'ensemble des fichiers, puis ne récupère que certains modules spécifiés
# (par exemple : `module-core/` et `module-api/`).
#
# Ce fonctionnement est utile pour travailler efficacement sur de gros
# monorepos, sans télécharger ou compiler tous les modules.
#
# Une fois le travail terminé, le script permet de désactiver le mode
# sparse-checkout pour retrouver l'intégralité du dépôt.
#
# Prérequis :
# - Git ≥ 2.25
# - Accès SSH au dépôt Git
# - Commande 'tree' installée (facultatif, pour l'affichage)
###############################################################################

# Configuration du dépôt Git
REPO_URL="git@gitlab.societe.com:myteam/monorepo-maven.git"
CLONE_DIR="$HOME/Projects/monorepo-maven"
BRANCHE="main"

# Étape 1 : Clonage du dépôt sans extraire les fichiers
echo "📥 Clonage du dépôt sans extraction complète..."
git clone --filter=blob:none --no-checkout "$REPO_URL" "$CLONE_DIR"
cd "$CLONE_DIR" || exit 1

# Étape 2 : Initialisation du mode sparse-checkout (mode "cone", optimisé pour les dossiers)
echo "🛠️ Initialisation du sparse-checkout (mode cone)..."
git sparse-checkout init --cone

# Étape 3 : Définition des modules à inclure dans l’arborescence de travail
echo "📁 Inclusion uniquement des modules sélectionnés..."
git sparse-checkout set pom.xml module-core/ module-api/

# Étape 4 : Récupération de la branche cible
echo "🔀 Passage à la branche : $BRANCHE"
git checkout "$BRANCHE"

# Étape 5 : Affichage de la structure résultante
echo -e "\n✅ Sparse-checkout terminé. Contenu du dossier :"
tree -L 2

# Pause facultative pour simuler un travail effectué sur les modules sélectionnés
echo -e "\n🧑‍💻 Vous pouvez maintenant travailler sur les modules sélectionnés..."
read -p "Appuyez sur Entrée pour désactiver le sparse-checkout et retrouver tout le dépôt... " _

# Étape 6 : Désactivation du sparse-checkout pour restaurer l'intégralité du dépôt
echo "🚫 Désactivation du sparse-checkout, restauration complète du dépôt..."
git sparse-checkout disable

# Étape 7 : Affichage final de la structure complète
echo -e "\n📦 Dépôt complet maintenant disponible :"
tree -L 2
