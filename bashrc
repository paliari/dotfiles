export DOTDIR=$HOME/.dotfiles

. $DOTDIR/bash/env.sh
. $DOTDIR/bash/paths.sh
. $DOTDIR/bash/aliases.sh
. $DOTDIR/bash/prompt.sh
. $DOTDIR/bash/utils.sh

# debian / ubuntu, not MacOS
if [ -e /etc/debian_version ]; then
    . $DOTDIR/bash/debian.sh
fi

if [[ $(uname) == 'Darwin' ]]; then
    . $DOTDIR/bash/mac.sh
fi
