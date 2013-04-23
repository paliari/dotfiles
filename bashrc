export DOTDIR=$HOME/.dotfiles
. $DOTDIR/bash/env
. $DOTDIR/bash/aliases
. $DOTDIR/bash/prompt
. $DOTDIR/bash/utils

# debian / ubuntu, not MacOS
if [ -e /etc/debian_version ]; then
    . $DOTDIR/bash/debian
fi

if [[ $(uname) == 'Darwin' ]]; then
	. $DOTDIR/bash/mac
fi
