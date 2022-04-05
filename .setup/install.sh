#!/bin/bash
echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Pouring some brewskies..."
brew bundle

echo "Installing Zsh..."

sh -c "$(brew --prefix)/opt/fzf/install -y"
chsh -s /bin/zsh

echo "Linking packages..."
sh ./link.sh

echo "Installing Neovim packages..."
sh ./nvim.sh 
