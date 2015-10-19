alias g="git"
alias gp="git push"
alias gd="git icdiff"
# alias gs="git status" # conflict with GhostScript
alias gt="git status"
ga() { git add -A $* && git status }
gc() { git commit -m "$*" && git status }
