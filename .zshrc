source /opt/homebrew/share/antigen/antigen.zsh
antigen init $HOME/.antigenrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -e

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERM=xterm-256color

source $HOME/.aliases

export PATH="$HOME/.local/bin:$PATH"

# Auto completion 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit

if command -v op >/dev/null 2>&1; then
	eval "$(op completion zsh)"; compdef _op op
fi

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

autoload -U add-zsh-hook

# Setup shell integration for zsh
# https://github.com/junegunn/fzf#setting-up-shell-integration
source <(fzf --zsh)

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/zbanducci/.zshrc'

gh_alias() {
	gh alias set --shell ${1} "cp ~/.config/gh/${1}.hosts.yml ~/.config/gh/hosts.yml && gh auth status"
}

# Mole shell completion
if output="$(mole completion zsh 2>/dev/null)"; then eval "$output"; fi
