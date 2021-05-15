# if not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

export EDITOR=nvim
export TERM=xterm-256color

# search with up/down arrow keys
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# http://blog.sanctum.geek.nz/better-bash-history/
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoreboth
HISTFILESIZE=10000
HISTIGNORE='ls:bg:fg:history'
HISTSIZE=10000
PROMPT_COMMAND='history -a'

# check the window size after each command and, if necessary
# update the values of LINES and COLUMNS
shopt -s checkwinsize

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

if [ -f ~/.bash_prompt ]; then
  # shellcheck source=/dev/null
  . ~/.bash_prompt
fi
