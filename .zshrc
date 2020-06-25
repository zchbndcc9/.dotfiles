export EDITOR="nvim"
export VISUAL="$EDITOR"

export TERM="xterm-256color"
source $HOME/.aliases
alias tmux="tmux -2"

if [ "$TMUX" = "" ]; then 
  tmux; 
fi

# Colorls configuration (Must be done befor plugins loaded)
. $(brew --prefix asdf)/asdf.sh
source $(dirname $(gem which colorls))/tab_complete.sh

# Auto completion 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

#---Plugins (Antibody)---
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export FZF_DEFAULT_COMMAND='ag -g ""'

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
