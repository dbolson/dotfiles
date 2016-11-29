export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin" # RabbitMQ

export EDITOR=vim

# python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
#source /usr/local/bin/virtualenvwrapper.sh

#export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=$(/usr/bin/javac)
export PATH=${JAVA_HOME}/bin:$PATH

export AWS_PROFILE=e-development-DataEng
export AWS_REGION=us-east-1

#eval "$(rbenv init -)" # rbenv

# aliases
alias be='bundle exec'
alias ll='ls -la'
alias less='less -R'
alias reload='source ~/.bash_profile'
alias sstart='./bin/spring start'
alias sstop='./bin/spring stop'
alias srestart='sstop && sstart'

alias gst='git status'
alias gpr='git pull --rebase'
alias gpp='gpr && git push'

alias sv="cd ~/workspace/server"

alias python=python3

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
export BASH_IT="/Users/$(whoami)/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='minimal'

# Load Bash It
source $BASH_IT/bash_it.sh

function cleanFeatureBranch() {
  git checkout master &&
    if [ "$1" ]
    then
      git branch -D $1
    fi
    git remote prune origin &&
      git pull --rebase
  }

  function updateHomebrew() {
    brew update
    brew doctor
    brew upgrade
    brew cleanup
  }

  function cdGem() {
    cd `bundle show $1`
  }

  function psqlProduction() {
    heroku run bash -c 'psql $DATABASE_URL' --app whistle-server-production
  }

  function downloadYoutubeMP3() {
    cd Desktop/
    youtube-dl --extract-audio --audio-format mp3 $1
    cd -
  }
