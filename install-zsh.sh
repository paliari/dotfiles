# INSTALAR CONFIGURAÇÕES PARA ZSH E DOTFILES

# baixar dotfiles
git clone https://github.com/neves/dotfiles.git ~/.dotfiles

# zsh http://skwp.github.io/dotfiles/
sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"

# autoload .dotfiles
echo '[[ -s "$HOME/.dotfiles/zsh/init.zsh" ]] && source "$HOME/.dotfiles/zsh/init.zsh"' >> ~/.zshrc

# trocar o shell padrão pelo zsh
chsh -s /bin/zsh

# linkar gitconfig e gitignore
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore ~/.gitignore
