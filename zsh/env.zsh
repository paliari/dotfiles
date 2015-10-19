# homebrew
export PATH="/usr/local/sbin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl --wait'
fi

export GEM_EDITOR=$EDITOR

export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# Disable brew GitHub API rate limit exceeded https://github.com/settings/tokens
export HOMEBREW_GITHUB_API_TOKEN=1fccbbe85d5fa315a1046db8dc9f3e7df176f13c
