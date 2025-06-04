#!/bin/bash

echo "🚀 Initialisation de la configuration Git..."

# 1. Configuration de l'identité
git config --global user.name "Ton Nom"
git config --global user.email "ton.email@exemple.com"

# 2. Couleurs et affichage
git config --global color.ui auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff auto
git config --global core.pager "less -FRX"

# 3. Éditeur par défaut
git config --global core.editor "code --wait"  # Ou nano, vim, etc.

# 4. Gestion des retours chariot
git config --global core.autocrlf input  # input sur mac/linux, true sur Windows
git config --global core.safecrlf true

# 5. Rebase et pull intelligents
git config --global pull.rebase false
git config --global rebase.autoStash true
git config --global merge.ff only

# 6. Ignorer les fichiers système globaux
echo ".DS_Store" >> ~/.gitignore_global
echo "Thumbs.db" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# 7. Alias pratiques
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.last 'log -1 HEAD'
git config --global alias.lg "log --oneline --graph --all --decorate"
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.amend "commit --amend --no-edit"
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

# 8. Push par défaut
git config --global push.default simple

# 9. GPG (optionnel)
# git config --global user.signingkey <gpg-key-id>
# git config --global commit.gpgsign true

# 10. SSH (affichage clé si elle existe)
if [ -f "$HOME/.ssh/id_ed25519.pub" ]; then
  echo "📎 Clé publique SSH détectée :"
  cat ~/.ssh/id_ed25519.pub
else
  echo "🔐 Aucune clé SSH trouvée. Vous pouvez en générer une avec :"
  echo "ssh-keygen -t ed25519 -C \"ton.email@exemple.com\""
fi

# 11. Détection des outils
echo "✅ État des outils :"
command -v git && git --version
command -v code && echo "✔️ VS Code détecté"
command -v gh && echo "✔️ GitHub CLI détecté"

echo "🎉 Configuration Git terminée !"



chmod +x git-setup.sh
./git-setup.sh