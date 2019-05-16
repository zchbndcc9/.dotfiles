# Install Homebrew
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update HB and any existing formulae
brew update
brew upgrade

# Shell and editor 
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install neovim
brew install git
brew install bat
brew install tree
brew install boxes
brew install fortune
brew install zsh-autosuggestions

# Languages
brew install node
brew install yarn
brew install go
brew install scala
brew install sbt
brew install python
brew install elixir
