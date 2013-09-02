export DOTDIR=$HOME/.dotfiles

if [[ $(uname) == 'Darwin' ]]; then
    . $DOTDIR/bash/mac.sh
else
	. $DOTDIR/bash/debian.sh
fi

source $DOTDIR/bash/paths.sh
source $DOTDIR/bash/env.sh
source $DOTDIR/bash/aliases.sh
source $DOTDIR/bash/prompt.sh
source $DOTDIR/bash/utils.sh
source $DOTDIR/bash/git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# cdnjs auto complete
[[ -s "$DOTDIR/bin/cdnjs" ]] && eval $($DOTDIR/bin/cdnjs _completion -g -p cdnjs)
