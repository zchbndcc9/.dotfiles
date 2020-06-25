#!/bin/bash
echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Pouring some brewskies..."
brew bundle

echo "Installing Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(brew --prefix)/opt/fzf/install -y"
chsh -s /bin/zsh

echo "Linking packages..."
sh ./link.sh

echo "Installing Neovim packages..."
sh ./nvim.sh 

echo "Installing elixir-ls..."
sh -c "$(
  git clone git@github.com:JakeBecker/elixir-ls.git 
  && cd elixir-ls 
  && mkdir rel
  && mix deps.get
  && mix compile
  && mix elixir_ls.release -o rel
)"
