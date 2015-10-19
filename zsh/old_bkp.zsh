# bloquear para não carregar duas vezes
# if [[ -n "$DOTDIR" ]]; then return; fi
export DOTDIR=$HOME/.dotfiles

# permitir o uso do ^ fora de aspas, como HEAD^ ao invés de "HEAD^"
setopt NO_NOMATCH

# definir o prompt padrão
autoload -Uz promptinit
promptinit
prompt sorin

autoload -U zmv
alias zmv="noglob zmv"

# TODO add check test
# brew install php-version # gerenciar versoes do php
source $(brew --prefix php-version)/php-version.sh && php-version 5

# corrigir fn+arrow no prompt
# $key_info[End]
#bindkey "^[[H" beginning-of-line
# $key_info[Home]
#bindkey "^[[F" end-of-line

export PATH="$HOME/bin:$DOTDIR/bin:$PATH"
# passar para rails generate
export NO="--no-assets --no-helper --no-jbuilder --no-test-framework"
# trocar alias do l
unalias l &> /dev/null
unalias gls &> /dev/null
unalias gl &> /dev/null

# brew install coreutils para funcionar --group-directories-first
alias gls="gls --color=auto --group-directories-first"
alias l="ls -lh"
alias gl="gls -l"
alias gl="gls -l"
alias gla="gl -a"

# git aliases
unalias gs &> /dev/null
unalias gd &> /dev/null
alias gu="git up"
alias gst="git s"
alias gs=gst
alias gd="clear; git d"
alias ga="git a"
alias gc="git c"
alias gamend="git amend"
alias gx="gitx"
alias gp="git push -v"

unalias gf &> /dev/null
gf() { g dev && gco -b "feature/$1"; }

# não precisa, pasta utilizar \gs ou unalias gs
#alias ghost=$(brew --prefix ghostscript 2&> /dev/null)/bin/gs

alias rails_stop='kill -9 $(cat tmp/pids/server.pid) && echo Rails Stopped'
alias rails_restart="rails_stop; rails s -d; rake log:clear tmp:clear &;"
alias rr=rails_restart
alias rails_reload=rails_restart
alias rc="rails c"

# open file with firefox oor chrome
alias firefox="open -a Firefox"
alias chrome="open -a 'Google Chrome'"

# cat key.pem | fingerprint => 84:b8:56:92:2a:5f:43:a5:34:79:e0:62:9d:8d:66:d3:e7:e4:85:31
alias fingerprint="openssl rsa -outform DER -pubout | openssl sha1 -c"

# gulp with coffee-script
alias gulpc="gulp --require coffee-script"

# aws zsh autocomplete
which aws_zsh_completer.sh &>/dev/null && source aws_zsh_completer.sh
# http://direnv.net/
which direnv &>/dev/null && eval "$(direnv hook zsh)"

export AWS_DEFAULT_REGION=sa-east-1

# http://docs.docker.io/en/latest/installation/mac/
export DOCKER_HOST=tcp://localhost:4243

# android SDK HOME
export ANDROID_HOME=/usr/local/opt/android-sdk

# utilizar o sublime como editor padrão
export EDITOR=subl

source $DOTDIR/zsh/lab.sh
source $DOTDIR/zsh/osx.sh
