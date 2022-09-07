export PATH=$(brew --prefix)/opt/python@3.9/libexec/bin:$PATH
bindkey -e

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERM=xterm-256color

export ANDROID_HOME="/Users/zach/Library/Android/sdk"

source $HOME/.aliases

source /opt/homebrew/share/antigen/antigen.zsh
antigen init $HOME/.antigenrc

# Auto completion 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit

export FZF_DEFAULT_COMMAND='ag -g ""'
export BAT_THEME="OneHalfDark"

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

autoload -U add-zsh-hook

rebundle_brew() {
  brew bundle --force --file=~/Brewfile dump
  db add ~/Brewfile && db commit -m "Rebundle Brewfile"
  db push
}

gh_alias() {
	gh alias set --shell ${1} "cp ~/.config/gh/${1}.hosts.yml ~/.config/gh/hosts.yml && gh auth status"
}

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

eval "$(op completion zsh)"; compdef _op op
eval $(thefuck --alias --enable-experimental-instant-mode)

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/zbanducci/.zshrc'

. /opt/homebrew/opt/asdf/libexec/asdf.sh
