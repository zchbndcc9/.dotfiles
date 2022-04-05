# Instructions

1. Download brew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Download fzf and dotbare
```sh
brew install dotbare fzf gh
```

3. Create ssh-key. Instructions [here]()

4. Add ssh to github

3. Initialize this repo with dotbare
```sh
dotbare finit -u git@github.com:zchbndcc9/.dotfiles.git
```

4. Run install script
```sh
./.setup/install.sh
```
