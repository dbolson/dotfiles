export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin" # RabbitMQ
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$MANPATH"
export PYTHONPATH=.:$PYTHONPATH

if [ -f ~/.bashrc ]; then
  # shellcheck source=/dev/null
  source ~/.bashrc
fi
