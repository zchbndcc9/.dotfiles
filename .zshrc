export EDITOR="nvim"
export VISUAL="$EDITOR"

export TERM="xterm-256color"
export ANDROID_HOME="/Users/zach/Library/Android/sdk"
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
export BAT_THEME="OneHalfDark"

setopt correct
setopt autocd
setopt globdots
setopt histignoredups

git_collaborator() {
  keith="Keith Raymond <raymondke99@gmail.com>"
  aaron="Aaron Van Bokhoven <aaron@realgeeks.com>"
  sam="Sam Livingston-Gray <geeksam@gmail.com>"
  ben="Ben Ward <ben@mauilabs.com>"
  chrisc="Chris Cenatiempo <chrisc@realgeeks.com>"
  sass="Chris Sass <chris@lupinedev.com>"
  almir="Almir Filho <almirflorenciofilho@gmail.com>"
  dakota="Dakota Lorance <dakota@likethestates.com>"
  zach="Zach Banducci <zbducci@gmail.com>"
  unset collaborated_with
  if [ -z ${1+x} ]; then
    collaborated_with=$zach
  else
    case "$1" in
      "keith")
        collaborated_with=$keith
        ;;
      "aaron")
        collaborated_with=$aaron
        ;;
      "sam")
        collaborated_with=$sam
        ;;
      "ben")
        collaborated_with=$ben
        ;;
      "chrisc")
        collaborated_with=$chrisc
        ;;
      "sass")
        collaborated_with=$sass
        ;;
      "almir")
        collaborated_with=$almir
        ;;
      "dakota")
        collaborated_with=$dakota
        ;;
      "zach")
        collaborated_with=$zach
        ;;
      *)
        help="keith: $keith\naaron: $aaron\nsam: $sam\nben: $ben\nchrisc: $chrisc\nsass: $sass"
        ;;
    esac
  fi
  if [ -z ${collaborated_with+x} ]; then
    printf "$help"
  else
    to_copy="Co-authored-by: $collaborated_with"
    echo $to_copy | pbcopy
    echo "$to_copy copied"
  fi
}

function git_pull_current_branch {
  git pull --autostash --rebase origin $(git rev-parse --abbrev-ref HEAD)
}
function git_push_current_branch {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}
function git_force_push_current_branch {
  git push origin $(git rev-parse --abbrev-ref HEAD) --force
}
alias gpull="git_pull_current_branch"
alias gpush="git_push_current_branch"
alias gpush-force="git_force_push_current_branch"

# Ripped from asdf-java set-java-home.zsh script
asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_java_home

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
