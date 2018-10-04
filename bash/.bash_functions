# system
function updateHomebrew() {
  brew update
  brew doctor
  brew upgrade
  brew cleanup
}

function updateVim {
  vim +PlugClean +qall
  vim +PlugInstall +qall
  vim +PlugUpdate +qall
  vim +PlugUpgrade +qall
  vim +UpdateRemotePlugins +qall
}

function removeOldDockerImages() {
  docker rm -v $(docker ps -aq 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
  docker volume rm $(docker volume ls -f dangling=true -q) 2>/dev/null
}

function downloadYoutubeMP3() {
  cd Desktop/ || exit
  youtube-dl --extract-audio --audio-format mp3 "$1"
  cd - || exit
}

function formatJSON {
  echo "$1" | python -m json.tool
}

# git
function checkoutAndTrack() {
  git checkout -t "origin/$1"
}

function cleanFeatureBranch() {
  git checkout develop &&
    if [ "$1" ]
    then
      git branch -D $1
    fi
    git remote prune origin &&
      git pull --rebase
}

# aws
function printAWSEnvVars {
  env | grep AWS_
}
