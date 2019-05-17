echo "Installing brew and formulae..."
sh ./brew.sh

echo "Installing OSX apps..."
sh ./cask.sh

echo "Linking packages..."
sh ./link.sh
