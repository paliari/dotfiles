# add .dotfiles bin
export PATH="$DOTDIR/bin:$PATH"

# add mysql to path
[[ -d "/usr/local/mysql/bin" ]] && export PATH="/usr/local/mysql/bin:$PATH"

# add heroku to path
[[ -d "/usr/local/heroku/bin" ]] && export PATH="/usr/local/heroku/bin:$PATH"

# add php53 to path
[[ -f "$(brew --prefix php53 2>/dev/null)/bin/php" ]] && export PATH="$(brew --prefix php53)/bin:$PATH"

# add android SDK
[[ -d "$HOME/android/sdk/tools" ]] 			&& export PATH="$HOME/android/sdk/tools:$PATH"
[[ -d "$HOME/android/sdk/platform-tools" ]] && export PATH="$HOME/android/sdk/platform-tools:$PATH"

# https://smf.sh/
[[ -d "$HOME/.sm/bin" ]] && export PATH="${PATH}:/Users/neves/.sm/bin:/Users/neves/.sm/pkg/active/bin:/Users/neves/.sm/pkg/active/sbin"
