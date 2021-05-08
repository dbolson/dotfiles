# system

function update-vim {
  vim +PlugClean +qall
  vim +PlugInstall +qall
  vim +PlugUpdate +qall
  vim +PlugUpgrade +qall
  vim +UpdateRemotePlugins +qall
}

function remove-oldDocker-images() {
  docker rm -v $(docker ps -aq 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
  docker volume rm $(docker volume ls -f dangling=true -q) 2>/dev/null
}

function download-youtube-mp3() {
  cd Downloads/ || exit
  youtube-dl --extract-audio --audio-format mp3 "$1"
  cd - || exit
}

function format-json {
  echo "$1" | python -m json.tool
}

# git
function checkout-and-track() {
  git checkout -t "origin/$1"
}

function clean-feature-branch() {
  git checkout master &&
    if [ "$1" ]
    then
      git branch -D $1
    fi
    git remote prune origin &&
      git pull --rebase
}
