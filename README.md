# Instructions

1. Download brew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Download 1password
```sh
brew install --cask 1password
```

3. Download fzf, gh, and dotbare
```sh
brew install dotbare fzf gh

```

5. Login to gh. Elect to upload the ssh key. This will  generate an ssh key for you and upload it to GH
```sh
gh auth login
```

6. Initialize this repo with dotbare
```sh
dotbare finit -u git@github.com:zchbndcc9/.dotfiles.git
```

7. Run brew bundle
```sh
brew bundle
```

8. Download vim-plug to setup neovim
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'```
