# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable Mission control(F3) animation
defaults write com.apple.dock expose-animation-duration -float 0.05; killall Dock
