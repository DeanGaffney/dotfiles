#!/usr/bin/env bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to create symlink safely
link_file() {
  local source="$1"
  local target="$2"

  if [ -L "$target" ]; then
    echo "Symlink already exists: $target"
    return 0
  elif [ -f "$target" ]; then
    echo "Backing up existing file: $target -> $target.bak"
    mv "$target" "$target.bak"
  fi

  ln -s "$source" "$target"
  echo "Created symlink: $target -> $source"
}

# Create symlinks
link_file "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/gitconfig.personal" "$HOME/.gitconfig.personal"
link_file "$DOTFILES_DIR/wezterm.lua" "$HOME/.wezterm.lua"
