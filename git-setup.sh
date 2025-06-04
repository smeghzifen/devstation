#!/bin/bash

# This script sets up Git with best practices configuration for a developer.

# Prompt for user name and email
echo "Setting up Git configuration..."
read -p "Enter your name (for Git commits): " GIT_NAME
read -p "Enter your email (for Git commits): " GIT_EMAIL

# Configure user name and email
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

# Set the default text editor for Git
git config --global core.editor "code --wait" # You can replace "code --wait" with your preferred editor (e.g., nano, vim)

# Enable colored output for Git commands
git config --global color.ui auto

# Set up helpful aliases
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.cm "commit"
git config --global alias.df "diff"
git config --global alias.lg "log --oneline --graph --decorate --all"

# Set up default branch name for new repositories
git config --global init.defaultBranch main

# Enable credential caching for HTTPS (adjust cache timeout as needed)
git config --global credential.helper "cache --timeout=3600" # Cache credentials for 1 hour

# Enable automatic rebase for pull
git config --global pull.rebase true

# Optimize Git performance for large repositories
git config --global core.compression 9

# Enable sparse checkout for performance
git config --global core.sparseCheckout true

# Configure Git to handle line endings (use 'input' for macOS/Linux, 'true' for Windows)
git config --global core.autocrlf input

# Add useful merge and diff tools (optional)
git config --global merge.tool vimdiff
git config --global diff.tool vimdiff

# Set up global .gitignore file
read -p "Do you want to set up a global .gitignore file? (y/n): " SETUP_GITIGNORE
if [[ "$SETUP_GITIGNORE" == "y" || "$SETUP_GITIGNORE" == "Y" ]]; then
    GITIGNORE_PATH="$HOME/.gitignore_global"
    echo "*.log" >> $GITIGNORE_PATH
    echo "node_modules/" >> $GITIGNORE_PATH
    echo ".DS_Store" >> $GITIGNORE_PATH
    echo "Thumbs.db" >> $GITIGNORE_PATH
    git config --global core.excludesfile "$GITIGNORE_PATH"
    echo "Global .gitignore file set up at $GITIGNORE_PATH"
fi

# Display the final configuration
echo "Git configuration complete. Here are your global settings:"
git config --list --global