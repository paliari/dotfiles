# initialize fasd without cache: https://github.com/clvv/fasd
# [[ $(which fasd) ]] && eval "$(fasd --init auto)"

fasd_cache="$HOME/.fasd-init-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
