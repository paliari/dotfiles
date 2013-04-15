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

download_bin() {
	echo "downloading $1"
	curl -sL $2 > $DOTDIR/bin/$1
	chmod 755 $DOTDIR/bin/$1	
}

# https://github.com/djl/vcprompt
download_bin vcprompt "https://github.com/djl/vcprompt/raw/master/bin/vcprompt"
download_bin dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"

echo "echo '. $DOTDIR/bashrc' >> ~/.bashrc"
