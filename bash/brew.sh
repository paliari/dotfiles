# test if brew exists before create php alias
[[ $(which brew) ]] && [[ $(brew --prefix php53 2>/dev/null) ]] && alias php53="$(brew --prefix php53)/bin/php -n"
[[ $(which brew) ]] && [[ $(brew --prefix php54 2>/dev/null) ]] && alias php54="$(brew --prefix php54)/bin/php -n"
[[ $(which brew) ]] && [[ $(brew --prefix php55 2>/dev/null) ]] && alias php55="$(brew --prefix php55)/bin/php -n"

# load brew completion
if [ -f $(brew --prefix 2>/dev/null)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
