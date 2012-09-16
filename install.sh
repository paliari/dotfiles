#!/bin/sh
DOTDIR=$HOME/.dotfiles
if [ ! -e $DOTDIR ]
then
  DOTFILES=$(cd `dirname $0` && pwd)
  ln -sf $DOTFILES $DOTDIR
else
  echo "$DOTDIR already exists"
fi

for f in gemrc gitconfig gitignore vim vimrc
do
  echo "linking $f"
  ln -sf $DOTDIR/$f $HOME/.$f
done

echo "config .ssh"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp $DOTDIR/ssh/authorized_keys ~/.ssh/authorized_keys
chmod 600 ~/.ssh/*

# https://github.com/github/gitignore
echo "global .gitignore"
git config --global core.excludesfile ~/.gitignore

# https://github.com/djl/vcprompt
echo "downloading vcprompt"
curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > $DOTDIR/bin/vcprompt
chmod 755 $DOTDIR/bin/vcprompt

echo "echo '. $DOTDIR/bashrc' >> ~/.bashrc"
