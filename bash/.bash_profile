#!/usr/bin/env bash

if [ -f ~/.bashrc ]; then
  # shellcheck source=/dev/null
  source ~/.bashrc
fi

export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
. "$HOME/.local/share/bob/env/env.sh"
