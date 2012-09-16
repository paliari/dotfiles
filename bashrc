# debian / ubuntu, not MacOS
if [ -e /etc/debian_version ]
then
  export LS_OPTIONS='--color=auto'
fi
export DOTDIR=$HOME/.dotfiles
. $DOTDIR/bash/env
. $DOTDIR/bash/aliases
. $DOTDIR/bash/prompt
. $DOTDIR/bash/utils
