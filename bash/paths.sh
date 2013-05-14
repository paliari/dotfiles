# change default mac path: /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# to put /usr/local/bin before the others
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# add .dotfiles bin
export PATH="$DOTDIR/bin:$PATH"

# add mysql to path
[[ -d "/usr/local/mysql/bin" ]] && export PATH="/usr/local/mysql/bin:$PATH"

# add heroku to path
[[ -d "/usr/local/heroku/bin" ]] && export PATH="/usr/local/heroku/bin:$PATH"

# add php53 to path
[[ -d "$(brew --prefix php53 2>/dev/null)/bin" ]] && export PATH="$(brew --prefix php53)/bin:$PATH"

# https://smf.sh/
[[ -d "$HOME/.sm/bin" ]] && export PATH="${PATH}:/Users/neves/.sm/bin:/Users/neves/.sm/pkg/active/bin:/Users/neves/.sm/pkg/active/sbin"
