#!/usr/bin env zsh
set -e

BREWFILE="$DOTFILES_DIR/Brewfile"
ANTIGEN_DIR="$HOME/.antigen"
ANTIGEN_FILE="$HOME/.antigen.zsh"
ZSHRC="$HOME/.zshrc"

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew to path for Apple Silicon
	# https://docs.brew.sh/Installation#post-installation-steps
  if [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Install Brewfile dependencies
if [[ -f "$BREWFILE" ]]; then
  echo "📦 Installing packages from Brewfile..."
  brew bundle --file="$BREWFILE"
else
  echo "⚠️ Brewfile not found at $BREWFILE"
fi

echo "♻️ Reloading shell..."
source "$ZSHRC"

echo "🎉 Setup complete!"
