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

# Auto completion 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Key binding config
bindkey -v

#---Plugins (Antibody)---
# If static antibody plugin file doesn't exist, create it
if [[ ! -a ~/.zsh_plugins.sh ]]; then
  echo -e 'Creating static antibody bundle...'
  abundle;
  echo -e 'All set'
fi

source ~/.zsh_plugins.sh

export FZF_DEFAULT_COMMAND='ag -g ""'

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
