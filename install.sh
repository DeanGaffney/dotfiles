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
link_file "$DOTFILES_DIR/wezterm.lua" "$HOME/.wezterm.lua"

# Create .aws directory if it doesn't exist
mkdir -p "$HOME/.aws"

# Copy aws-config (not symlinked) so work tools can modify it without affecting the repo
if [ -f "$HOME/.aws/config" ]; then
  echo "Backing up existing AWS config: $HOME/.aws/config -> $HOME/.aws/config.bak"
  mv "$HOME/.aws/config" "$HOME/.aws/config.bak"
fi

cp "$DOTFILES_DIR/aws-config" "$HOME/.aws/config"
echo "Copied AWS config to: $HOME/.aws/config"

# Note: .gitconfig is copied (not symlinked) by the ansible playbook
# and then includes either .gitconfig.personal or .gitconfig.work
