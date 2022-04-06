# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERM=xterm-256color

alias npm="pnpm"
alias yarn="pnpm"

export ANDROID_HOME="/Users/zach/Library/Android/sdk"

source $HOME/.aliases

# Auto completion 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit

source ~/.zsh_plugins.sh
# check to see if work.zsh file exists and source it
if [ -f $HOME/.work.zsh ]; then
  source $HOME/.work.zsh
fi

export FZF_DEFAULT_COMMAND='ag -g ""'
export BAT_THEME="OneHalfDark"

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

autoload -U add-zsh-hook

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/zbanducci/.zshrc'
# End of lines added by compinstall
