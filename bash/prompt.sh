. $DOTDIR/bash/git-prompt.sh

_temp() {
    local NO_COLOR='\[\e[0m\]' #disable any colors
    # regular colors
    local BLACK='\[\e[0;30m\]'
    local RED='\[\e[0;31m\]'
    local GREEN='\[\e[0;32m\]'
    local YELLOW='\[\e[0;33m\]'
    local BLUE='\[\e[0;34m\]'
    local MAGENTA='\[\e[0;35m\]'
    local CYAN='\[\e[0;36m\]'
    local WHITE='\[\e[0;37m\]'
    # emphasized (bolded) colors
    local EBLACK='\[\e[1;30m\]'
    local ERED='\[\e[1;31m\]'
    local EGREEN='\[\e[1;32m\]'
    local EYELLOW='\[\e[1;33m\]'
    local EBLUE='\[\e[1;34m\]'
    local EMAGENTA='\[\e[1;35m\]'
    local ECYAN='\[\e[1;36m\]'
    local EWHITE='\[\e[1;37m\]'
    # underlined colors
    local UBLACK='\[\e[4;30m\]'
    local URED='\[\e[4;31m\]'
    local UGREEN='\[\e[4;32m\]'
    local UYELLOW='\[\e[4;33m\]'
    local UBLUE='\[\e[4;34m\]'
    local UMAGENTA='\[\e[4;35m\]'
    local UCYAN='\[\e[4;36m\]'
    local UWHITE='\[\e[4;37m\]'
    # background colors
    local BBLACK='\[\e[40m\]'
    local BRED='\[\e[41m\]'
    local BGREEN='\[\e[42m\]'
    local BYELLOW='\[\e[43m\]'
    local BBLUE='\[\e[44m\]'
    local BMAGENTA='\[\e[45m\]'
    local BCYAN='\[\e[46m\]'
    local BWHITE='\[\e[47m\]'

    local U=$CYAN
    local D=$RED
    local W=$EGREEN
    local G=$YELLOW
    local m=$RED
    local b=$GREEN
    local u=$CYAN
    local a=$BLUE
    local A=$MAGENTA
    local I=$WHITE

    __DIR__() {
      basename "$(dirname "$PWD")"
    }
	
	# PS1="\n$(uname):$U\u$D#$W\w $G\$(vcprompt --format-git '($m%m$b%b$u%u$a%a$G) ')\n$a\$(__DIR__)/\$(basename \"\$PWD\")$A>$I"
	
	export GIT_PS1_SHOWDIRTYSTATE=1
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	export GIT_PS1_SHOWUPSTREAM="verbose"
	PS1="\n$(uname -ns):$U\u$D#$W\w $G\$(__git_ps1 '(%s)')\n$a\$(__DIR__)/\$(basename \"\$PWD\")$A>$I"
}
_temp

unset -f _temp
