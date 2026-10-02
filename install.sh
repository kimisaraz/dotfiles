#!/bin/bash

# dotfiles installer script
# Sets up symbolic links for dotfiles with GNU Stow
#
#   common/  - packages for all environments
#   darwin/  - packages for macOS
#   omarchy/ - packages for Omarchy Linux

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v stow >/dev/null 2>&1; then
  echo "stow is not installed."
  echo "  macOS:   brew install stow"
  echo "  Omarchy: sudo pacman -S stow"
  exit 1
fi

# Stow every package under the given group directory
stow_all() {
  local group="$DOTFILES_DIR/$1"
  local pkg

  for pkg in "$group"/*/; do
    [ -d "$pkg" ] || continue
    pkg="$(basename "$pkg")"
    echo "Stowing: $1/$pkg"
    stow -d "$group" -t "$HOME" --restow "$pkg"
  done
}

echo "Setting up dotfiles from: $DOTFILES_DIR"

stow_all common

case "$(uname -s)" in
  Darwin)
    stow_all darwin
    ;;
  Linux)
    if [ -d "$HOME/.local/share/omarchy" ]; then
      stow_all omarchy
    fi
    ;;
esac

echo "Done! Dotfiles setup complete."
