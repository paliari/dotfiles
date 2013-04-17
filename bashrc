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

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
	. $DOTDIR/bash/mac
	# brew install bash-completion
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
	. $DOTDIR/bash/git-completion.bash
fi
