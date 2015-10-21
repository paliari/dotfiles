alias g="git"
alias gp="git push"
alias gd="git icdiff"
# alias gs="git status" # conflict with GhostScript
alias gt="git status"

# utilizar alias gs apenas se não estiver instalado o GhostScript
unalias gs
[[ $(which gs) ]] || alias gs="git status"

unalias gc
gc() { git commit -m "$*" && git status }

unalias ga
ga() { git add -A $* && git status }
