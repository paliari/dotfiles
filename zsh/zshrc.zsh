ts=$(python -c 'import time; print time.time()')

HERE=${0:a:h}

# load zmv batch renamer
autoload -U zmv

# initialize rbenv (hehash is slow)
[[ $(which rbenv) ]] && eval "$(rbenv init - --no-rehash)"

# initialize direnv
[[ $(which direnv) ]] && eval "$(direnv hook zsh)"

# initialize autoenv
# source $(brew --prefix autoenv)/activate.sh

source $HERE/env.zsh
source $HERE/tools.zsh
source $HERE/pdf-tools.zsh
source $HERE/git.zsh

addpath "$HOME/.node/bin"
addpath "$HERE/bin"

# inicializar docker VM fora deste script para não ficar lento
alias docker-boot="source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"
# definir variáveis de ambiente para o comando docker funcionar
alias docker-env='eval "$(docker-machine env default)"'

alias npmglist='npm list -depth 0 -g | \grep @'

# choose oh-my-zsh or prezto, NEVER BOTH
# source $HERE/oh-my-zsh-rc.zsh
source $HERE/preztorc.zsh

te=$(python -c 'import time; print time.time()')
printf "%0.2fs\n" $(($te - $ts))
