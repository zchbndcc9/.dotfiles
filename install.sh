echo "Setting up install..."
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Pouring some brewskies..."
brew bundle

echo "Installing Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo "Linking packages..."
sh ./link.sh

echo "Installing Neovim packages..."
sh ./nvim.sh 

