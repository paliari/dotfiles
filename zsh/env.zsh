# homebrew
PATH="/usr/local/sbin:$PATH"

# node bin
PATH="$HOME/.node/bin:$PATH"

# dotfiles bin
PATH="$DOTFILES/bin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl --wait'
fi

export GEM_EDITOR=$EDITOR

export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# Disable brew GitHub API rate limit exceeded https://github.com/settings/tokens
# export HOMEBREW_GITHUB_API_TOKEN=
