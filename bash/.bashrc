#!/usr/bin/env bash

# if not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

ulimit -n 10240

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
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

export BASH_SILENCE_DEPRECATION_WARNING=1 # macos-specific for bash
export PATH="$PATH:$HOME/.local/bin" # lsp binaries
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
# linux
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

if command -v goenv 1>/dev/null 2>&1; then
  eval "$(goenv init -)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/shims:$PATH"
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init >/dev/null; then
  eval "$(pyenv virtualenv-init -)"
  # shellcheck disable=SC1091
  source virtualenvwrapper.sh
fi

eval "$(fnm env --use-on-cd --shell bash)"

#shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

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
