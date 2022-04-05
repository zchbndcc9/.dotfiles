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

4. Create ssh-key. Instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)

5. Login to gh. Elect to upload the ssh key
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
