#!/bin/bash

GIT_BASE_URL="git@gitlab.societe.com"

DEST_DIR="$HOME/Projects/societe"

# Projets : groupe/project.git
PROJECTS=(
    "backend/api-service.git"
    "frontend/web-app.git"
    "tools/internal-cli.git"
    "devops/infrastructure.git"
)

echo "📁 Clonage des projets dans : $DEST_DIR"
mkdir -p "$DEST_DIR"
cd "$DEST_DIR" || exit 1

for project in "${PROJECTS[@]}"; do
    PROJECT_PATH="${project%.git}"                        # ex: backend/api-service
    PROJECT_NAME="$(basename "$PROJECT_PATH")"            # ex: api-service
    TARGET_DIR="$DEST_DIR/$PROJECT_NAME"

    if [ -d "$TARGET_DIR/.git" ]; then
        echo "🔄 Projet déjà présent : $PROJECT_NAME (ignoré)"
    else
        echo "➡️  Clonage de : $project"
        git clone "$GIT_BASE_URL:$project" "$TARGET_DIR"
    fi
done

echo "Tous les projets sont prêts."
