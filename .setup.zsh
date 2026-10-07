#!/usr/bin/env zsh
# Bootstrap a Mac from the dotfiles repo. Safe to re-run.
#   curl -fsSL https://raw.githubusercontent.com/zchbndcc9/.dotfiles/master/.setup.zsh | zsh
set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/zchbndcc9/.dotfiles.git}"
DOTFILES_DIR="$HOME/.cfg"
BACKUP_DIR="$HOME/.dotfiles-backup"

dot() { git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"; }

main() {
  # Xcode Command Line Tools (git, compilers)
  if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools (finish the dialog)..."
    xcode-select --install || true
    until xcode-select -p >/dev/null 2>&1; do sleep 5; done
  fi

  # Homebrew
  if ! command -v brew >/dev/null 2>&1; then
    for prefix in /opt/homebrew /usr/local; do
      [[ -x $prefix/bin/brew ]] && eval "$($prefix/bin/brew shellenv)" && break
    done
  fi
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    for prefix in /opt/homebrew /usr/local; do
      [[ -x $prefix/bin/brew ]] && eval "$($prefix/bin/brew shellenv)" && break
    done
  fi
  # Login shells need brew on PATH too
  if ! grep -qs 'brew shellenv' "$HOME/.zprofile"; then
    echo "eval \"\$($(command -v brew) shellenv)\"" >> "$HOME/.zprofile"
  fi

  # Dotfiles (bare repo, work tree = $HOME)
  if [[ ! -d $DOTFILES_DIR ]]; then
    echo "Cloning dotfiles..."
    git clone --bare "$DOTFILES_REPO" "$DOTFILES_DIR"
    dot config status.showUntrackedFiles no
    # Move pre-existing files that would be overwritten out of the way
    local f
    dot ls-tree -r --name-only HEAD | while IFS= read -r f; do
      if [[ -e $HOME/$f || -L $HOME/$f ]]; then
        mkdir -p "$BACKUP_DIR/${f:h}"
        mv "$HOME/$f" "$BACKUP_DIR/$f"
        echo "Backed up ~/$f -> $BACKUP_DIR/$f"
      fi
    done
    dot checkout
  fi

  # Packages
  brew bundle --file="$HOME/Brewfile"

  # kitty cmd+k kitten (referenced in kitty.conf)
  local kitten="$HOME/.config/kitty/kitty-cmd-k"
  if [[ -d $kitten/.git ]]; then
    git -C "$kitten" pull --ff-only
  else
    git clone https://github.com/shaunchander/kitty-cmd-k "$kitten"
  fi

  gh auth status >/dev/null 2>&1 || gh auth login

  echo "Done. Run: exec zsh"
}

# Under `curl | zsh` stdin is the script, so give prompts the terminal.
main </dev/tty
