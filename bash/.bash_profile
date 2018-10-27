export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin" # RabbitMQ
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PYTHONPATH=.:$PYTHONPATH

if [ -f ~/.bashrc ]; then
  # shellcheck source=/dev/null
  source ~/.bashrc
fi
