# Instructions

1. Download brew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Download fzf and dotbare
```sh
brew install dotbare fzf gh
```

3. Create ssh-key. Instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent)

4. Login to gh. Elect to upload the ssh key
```sh
gh auth login
```

4. Initialize this repo with dotbare
```sh
dotbare finit -u git@github.com:zchbndcc9/.dotfiles.git
```

5. Run brew bundle
```sh
brew bundle
```
