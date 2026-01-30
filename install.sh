#!/bin/bash

# dotfiles installer script
# Sets up symbolic links for dotfiles

DOTFILES_DIR="$HOME/works/github.com/kimisaraz/dotfiles"

echo "Setting up dotfiles from: $DOTFILES_DIR"

# Backup and link .emacs.d
if [ -e "$HOME/.emacs.d" ] && [ ! -L "$HOME/.emacs.d" ]; then
  echo "Backing up existing .emacs.d..."
  mv "$HOME/.emacs.d" "$HOME/.emacs.d.backup-$(date +%Y%m%d-%H%M%S)"
fi

if [ ! -e "$HOME/.emacs.d" ]; then
  echo "Creating symlink: ~/.emacs.d -> $DOTFILES_DIR/emacs.d"
  ln -s "$DOTFILES_DIR/emacs.d" "$HOME/.emacs.d"
else
  echo "~/.emacs.d already exists (symlink)"
fi

echo "Done! Dotfiles setup complete."
echo ""
echo "To update from Prelude upstream:"
echo "  cd $DOTFILES_DIR"
echo "  git fetch upstream"
echo "  git merge upstream/master"
