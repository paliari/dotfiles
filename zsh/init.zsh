
# definir o prompt padrão
autoload -Uz promptinit
promptinit
prompt sorin

# corrigir fn+arrow no prompt
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

export PATH="$HOME/bin:$PATH"

# trocar alias do l
unalias l
alias l="ls -l"

# git aliases
alias gc=gcm

alias rails_stop='kill -9 $(cat tmp/pids/server.pid)'
alias rails_restart="rails_stop; rails s -d"
alias rails_reload=rails_restart
alias gamend="git commit --amend --no-edit"
