# shell
alias ls="ls -GFv $LS_OPTIONS"
alias l="ls -lah"
alias ll="ls -l"
alias mkp="mkdir -p"
alias ns="netstat -panel"
alias fgrep="fgrep -R"
alias grep="grep -i"

# git
alias gits="git status"
alias gitc="git commit -m "
alias gita="git add -A . && gits"
gitacp() { gita && gitc "gitacp $1" && git push $2; }
