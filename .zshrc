# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH=$(brew --prefix)/opt/python@3.9/libexec/bin:$PATH
bindkey -e

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERM=xterm-256color

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

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
