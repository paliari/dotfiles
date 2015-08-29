#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

prompt kylewest
export PROMPT="$PROMPT
=> "

eval "$(direnv hook zsh)"
source /usr/local/opt/autoenv/activate.sh

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/neves/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

DOTFILES=$(dirname ${BASH_SOURCE:-$0})
source $DOTFILES/tools.sh

export GEM_EDITOR=subl
export EDITOR=subl
