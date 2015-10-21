zstyle ':prezto:*:*' color 'yes'

  # 'environment' \
  # 'terminal' \
  # 'spectrum' \
  # 'directory' \
zstyle ':prezto:load' pmodule \
  'completion' \
  'syntax-highlighting' \
  'history-substring-search' \
  'history' \
  'utility' \
  'editor' \
  'prompt' \
  'git'

# zstyle ':prezto:module:prompt' theme 'sorin'
# zstyle ':prezto:module:prompt' theme 'kylewest'
# zstyle ':prezto:module:prompt' theme 'pure'
# zstyle ':prezto:module:prompt' theme 'powerline'
zstyle ':prezto:module:prompt' theme 'paradox'

source $HOME/.zprezto/init.zsh

# Save history to DropBox (after to not be overritten)
HISTFILE=$HOME/Dropbox/osx/zsh/.zhistory
