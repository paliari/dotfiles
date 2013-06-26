export DOTDIR=$HOME/.dotfiles

source $DOTDIR/bash/env.sh
source $DOTDIR/bash/paths.sh
source $DOTDIR/bash/aliases.sh
source $DOTDIR/bash/prompt.sh
source $DOTDIR/bash/utils.sh
source $DOTDIR/bash/git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ $(uname) == 'Darwin' ]]; then
    . $DOTDIR/bash/mac.sh
else
	. $DOTDIR/bash/debian.sh
fi
