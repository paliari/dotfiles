source ~/antigen.zsh
antigen use oh-my-zsh

antigen bundles <<BUNDLES
zsh-users/zsh-syntax-highlighting

# Guess what to install when running an unknown command.
command-not-found
heroku
git
extract
z
zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search
BUNDLES

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
antigen theme ys

antigen apply
