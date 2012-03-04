#!/bin/sh
if [ ! -e ~/dotfiles ]
then
  DOTFILES=$(cd `dirname $0` && pwd)
  ln -sf $DOTFILES ~/dotfiles
else
  echo "~/dotfiles already exists"
fi

for f in gemrc gitconfig gitignore
do
  echo "linking $f"
  ln -sf $HOME/dotfiles/$f $HOME/.$f
done

echo "config .ssh"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp ~/dotfiles/ssh/authorized_keys ~/.ssh/authorized_keys
chmod 600 ~/.ssh/*

# https://github.com/github/gitignore
echo "global .gitignore"
git config --global core.excludesfile ~/.gitignore

# https://github.com/djl/vcprompt
echo "downloading vcprompt"
curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/dotfiles/bin/vcprompt
chmod 755 ~/dotfiles/bin/vcprompt
