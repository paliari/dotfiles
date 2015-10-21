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

zstyle ':prezto:module:prompt' theme 'sorin'

source $HOME/.zprezto/init.zsh

# Save history to DropBox (after to not be overritten)
HISTFILE=$HOME/Dropbox/osx/zsh/.zhistory
