# Dotfiles

Bare git repo: git dir `~/.cfg`, work tree `~`. Managed with [dotbare](https://github.com/kazhala/dotbare).

## New Mac

```sh
curl -fsSL https://raw.githubusercontent.com/zchbndcc9/.dotfiles/master/.setup.zsh | zsh
exec zsh
```

Safe to re-run (`~/.setup.zsh`). It installs Xcode CLT and Homebrew if missing, clones this
repo into `~/.cfg` and checks it out into `~` (pre-existing files are moved to
`~/.dotfiles-backup/`), runs `brew bundle`, installs the kitty cmd+k kitten, and logs in to `gh`.

## Staying in sync

```sh
dotsync                 # pull, commit tracked changes, push
dotsync "msg"           # same, with a commit message
rebundle-brew           # dump installed brew packages to ~/Brewfile, commit + push
```

On another machine, `dotsync` pulls, then `brew bundle --file=~/Brewfile` installs anything new.

dotbare works like git for the dotfiles repo:

```sh
dotbare status
dotbare fedit           # fzf-pick a tracked file to edit
dotbare fadd            # fzf-pick changed files to stage
dotbare commit -m "..." && dotbare push
```

## Tracking a new file

Untracked files are hidden (`status.showUntrackedFiles no`), so add new files explicitly:

```sh
dotbare add ~/.config/foo/config
dotbare commit -m "Track foo config"
dotbare push            # or just: dotsync
```

Never track secrets (tokens, `.env`, `~/.config/gh/hosts.yml`).
