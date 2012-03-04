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

for f in ssh/authorized_keys
do
  echo "coping $f"
  cp $HOME/dotfiles/$f $HOME/.$f
done

echo "chmod .ssh"
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

# https://github.com/github/gitignore
echo "global .gitignore"
git config --global core.excludesfile ~/.gitignore

# https://github.com/djl/vcprompt
echo "downloading vcprompt"
curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/dotfiles/bin/vcprompt
chmod 755 ~/dotfiles/bin/vcprompt
