# debian / ubuntu, not MacOS
if [ -e /etc/debian_version ]
then
  export LS_OPTIONS='--color=auto'
fi

. ~/dotfiles/bash/env
. ~/dotfiles/bash/aliases
. ~/dotfiles/bash/prompt
. ~/dotfiles/bash/utils
