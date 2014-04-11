# bloquear para não carregar duas vezes
# if [[ -n "$DOTDIR" ]]; then return; fi
export DOTDIR=$HOME/.dotfiles

# permitir o uso do ^ fora de aspas, como HEAD^ ao invés de "HEAD^"
setopt NO_NOMATCH

# definir o prompt padrão
autoload -Uz promptinit
promptinit
prompt sorin

# corrigir fn+arrow no prompt
# $key_info[End]
#bindkey "^[[H" beginning-of-line
# $key_info[Home]
#bindkey "^[[F" end-of-line

export PATH="$HOME/bin:$DOTDIR/bin:$PATH"

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
alias gst="git s"
alias gs=gst
alias gd="git d"
alias ga="git a"
alias gc="git c"
alias gamend="git amend"

alias ghost=$(brew --prefix ghostscript 2&> /dev/null)/bin/gs

alias rails_stop='kill -9 $(cat tmp/pids/server.pid)'
alias rails_stop_global='kill -9 $(lsof -i :3000 -t)'
alias rails_restart="rails_stop; rails s -d"
alias rails_reload=rails_restart

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

alias fsize="stat -f %z"

lw() { l $(which $1); }

bkp() { mv "$1" "$1.bak"; lw "$1.bak"; }

# findBySize . +100MB
findBySize() {
    find $1 -type f -size $2 \( ! -name /Volumes/ \) -exec ls -lh {} \; 2> /dev/null | awk '{ print $5 "\t" $9 }'
}

source $DOTDIR/zsh/lab.sh
source $DOTDIR/zsh/osx.sh
