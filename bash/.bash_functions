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
  git checkout master &&
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

# earnest
function generateAWSToken() {
  case "${1}" in
    development)
      createAWSToken "e-development" ;;
    staging)
      createAWSToken "est-staging" ;;
    production)
      createAWSToken "earnest" ;;
  esac
}

function createAWSToken() {
  role=$1
  cmd="./aws-token.sh --account ${role} --role DataEng"

  cd ~/workspace/aws-sts-token-generator/ || exit
  echo "$cmd"
  export AWS_PROFILE="$1-DataEng"
  $cmd
}

function fixAwsTokenGenerator {
  cd ~/workspace/aws-sts-token-generator/ || exit
  docker run -it --privileged --entrypoint=date earnest/aws-sts-token-generator "-s $(date)"
}
