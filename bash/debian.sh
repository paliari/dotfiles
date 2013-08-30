export LS_OPTIONS='--color=auto'
export LANG=en_US.UTF-8
export LANGUAGE=C
export LC_ALL=C

# mostra os 10 processos ordenados pela utilização de memória (em MB)
alias pstop="ps -Ao rss,comm --sort=rss | awk '{printf \"%.0f %s\n\", \$1/1024, \$2}' | tail"
alias psvtop="ps -Ao vsz,comm --sort=vsz | awk '{printf \"%.0f %s\n\", \$1/1024, \$2}' | uniq -f1 | tail"

# sum memory usage
alias sumrss="ps -e --format rss --no-heading | awk '{tot=tot+\$1} END {print tot}'"
alias sumvsz="ps -e --format vsz --no-heading | awk '{tot=tot+\$1} END {print tot}'"
