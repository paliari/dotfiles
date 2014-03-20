export DOTDIR=$HOME/.dotfiles

# definir o prompt padrão
autoload -Uz promptinit
promptinit
prompt sorin

# corrigir fn+arrow no prompt
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

export PATH="$HOME/bin:$DOTDIR/bin:$PATH"

# trocar alias do l
unalias l
alias l="ls -l"

# git aliases
alias gc=gcm

alias rails_stop='kill -9 $(cat tmp/pids/server.pid)'
alias rails_restart="rails_stop; rails s -d"
alias rails_reload=rails_restart
alias gamend="git commit --amend --no-edit"

# cat key.pem | fingerprint => 84:b8:56:92:2a:5f:43:a5:34:79:e0:62:9d:8d:66:d3:e7:e4:85:31
alias fingerprint="openssl rsa -outform DER -pubout | openssl sha1 -c"

# aws zsh autocomplete
which aws_zsh_completer.sh &>/dev/null && source aws_zsh_completer.sh

export AWS_DEFAULT_REGION=sa-east-1
