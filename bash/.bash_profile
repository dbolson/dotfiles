export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin" # RabbitMQ
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PYTHONPATH=.:$PYTHONPATH

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ -f ~/.bashrc ]; then
  # shellcheck source=/dev/null
  source ~/.bashrc
fi

export PATH="$HOME/.poetry/bin:$PATH"
