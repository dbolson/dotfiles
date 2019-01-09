export EDITOR=nvim
export TERM=xterm-256color
export HISTCONTROL=ignoreboth:erasedups
# respect .agignore
export FZF_DEFAULT_COMMAND='ag -g ""'

export DSASF_HOME="$HOME/workspace/dsa"
export AWS_REGION=us-east-1

# search with up/down arrow keys
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# http://blog.sanctum.geek.nz/better-bash-history/
shopt -s histappend
shopt -s cmdhist
HISTFILESIZE=10000
HISTSIZE=10000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
PROMPT_COMMAND='history -a'

# https://github.com/Bash-it/bash-it
# path to the bash it configuration
BASH_IT="/Users/$(whoami)/.bash_it"
export BASH_IT

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='minimal'

# Load Bash It
# shellcheck source=/dev/null
source "$BASH_IT/bash_it.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ -f ~/.bash_aliases ]; then
   #shellcheck source=/dev/null
  . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
  # shellcheck source=/dev/null
  . ~/.bash_functions
fi

if [ -f ~/.bash_work ]; then
  # shellcheck source=/dev/null
  . ~/.bash_work
fi
