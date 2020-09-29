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

VIM_MODE_VICMD_KEY='jj'

source ~/.zsh_plugins.sh

MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

MODE_INDICATOR_VIINS='%F{15}<%F{8}INSERT<%f'
MODE_INDICATOR_VICMD='%F{10}<%F{2}NORMAL<%f'
MODE_INDICATOR_REPLACE='%F{9}<%F{1}REPLACE<%f'
MODE_INDICATOR_SEARCH='%F{13}<%F{5}SEARCH<%f'
MODE_INDICATOR_VISUAL='%F{12}<%F{4}VISUAL<%f'
MODE_INDICATOR_VLINE='%F{12}<%F{4}V-LINE<%f'

export FZF_DEFAULT_COMMAND='ag -g ""'

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
