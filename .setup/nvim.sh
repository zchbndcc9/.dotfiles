if [[ "$OSTYPE" == "linux"* ]]; then
  sudo apt-get install neovim
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install neovim
fi

echo "Installing vim-plugged..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

if [[ "$OSTYPE" == "darwin"* ]]; then
  curl -s https://api.github.com/repos/qvacua/vimr/releases/latest \
  | grep "browser_download_url.*deb" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -
fi
