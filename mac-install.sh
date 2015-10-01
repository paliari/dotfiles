# ls -la ~
# .CFUserTextEncoding
# .Trash
# .bash_history
# .bash_sessions
# Applications
# Desktop
# Documents
# Downloads
# Library
# Movies
# Music
# Pictures
# Public

# executar primeiro as instalações com prompt ou que precisam interação (osx defaults e brew)

# OSX config

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
# Disable Mission control(F3) animation
defaults write com.apple.dock expose-animation-duration -float 0.05
killall Dock
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

# install brew and Xcode-Tools + Git (5min) Click Install and accept Terms on new screen 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
# http://caskroom.io/
brew install caskroom/cask/brew-cask
brew update
# add beta versions of softwares: https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions
# install latest iterm2: http://iterm2.com/version3.html
brew cask install iterm2-beta
open -a iTerm && exit

# passwordless sudo
sudo mkdir -p /private/etc/sudoers.d
echo '%wheel ALL=(ALL) NOPASSWD: ALL' | sudo tee /private/etc/sudoers.d/passwordless
sudo dscl . append /Groups/wheel GroupMembership neves

# automatiza brew update todo dia as 11:00
mkdir -p $HOME/Library/LaunchAgents
curl -L https://github.com/mkalmes/brewupdate/raw/develop/brewupdate-install.sh | bash

# configurar para baixar apenas a pasta osx
brew cask install dropbox

brew cask install sublime-text3
# linkar a pasta do DropBox para User do sublime
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -fs ~/Dropbox/osx/sublime3 ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
open -a 'Sublime Text'
# instalar package control e aguardar update: https://packagecontrol.io/installation

# link .ssh
ln -s ~/Dropbox/osx/ssh ~/.ssh

# essential
brew install wget bash-completion ssh-copy-id sqlite3

# essential tools
brew cask install google-chrome firefox evernote rowanj-gitx sequel-pro lightpaper
brew cask --appdir=/Applications install megasync
brew cask install box-sync
open -a 'Google Chrome' # Ligar Avisar Antes de Sair CMD+Q
open -a Dropbox
open -a Evernote

# repositório com várias softwares Unix GNU
brew tap homebrew/dupes
# repositório com várias versões do PHP
brew tap homebrew/versions
brew tap josegonzalez/homebrew-php


# node
brew install node

brew install git-ftp
# colored diff side by side http://www.jefftk.com/icdiff
brew install icdiff

# pdf/image
brew install imagemagick ghostscript
brew cask install xquartz
brew install poppler webp
brew install swftools --with-xpdf --with-jpeg
brew install https://raw.github.com/quantiverge/homebrew-binary/pdftk/pdftk.rb

# ruby tools
brew install direnv autoenv heroku-toolbelt

# other tools
brew install gist ffmpeg youtube-dl

# extras
unrar nginx p7zip composer

# configurar qual app abre qual extensão
brew install duti

# Versão GNU de comandos Unix
# http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
brew install coreutils

# dev
brew install mysql sqlitebrowser ngrok

# start mysql at login
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

# ainda nao sei qual o melhor, java6 ou java7
brew cask install java6
brew cask install phpstorm rubymine
brew cask install vagrant virtualbox
brew cask install mysqlworkbench

# git UI
brew cask install sourcetree

# Docker UI
brew cask install kitematic

# mobile
brew install android-sdk ant ios-sim

# pessoal.  Dash: license.dash-license no DropBox
brew cask install vlc subtitle-master transmission transmission-remote-gui unrar dash teamviewer asepsis android-file-transfer

# audio processing
brew install sox

# mac tools
brew cask install spectacle ibettercharge audioslicer

# RUBY
brew install rbenv ruby-build
rbenv install 2.2.1
rbenv global 2.2.1
# auto rbenv rehash
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# CPDF
wget -O /usr/local/bin/cpdf http://github.com/coherentgraphics/cpdf-binaries/raw/master/OSX-Intel/cpdf
chmod +x /usr/local/bin/cpdf

# internet explorer WindowsXP VirtualBox
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="6 7 8" bash

# repositório público de chaves ssh
https://github.com/progrium/keychain.io

# ============================ OLD =============================

# mac virgem 10GB ((9.0Gi with df -h))

# instalar autoload do Apache (-w permanent, reload after reboot)
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
# habilitar o apache
sudo defaults write /System/Library/LaunchDaemons/org.apache.httpd Disabled -bool false

# neves/dotfiles
git clone https://github.com/neves/dotfiles.git ~/.dotfiles
echo "source ~/.dotfiles/bashrc" >> ~/.bash_profile
source ~/.bash_profile
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
cp ~/.dotfiles/gitconfig.user ~/.gitconfig.user
ln -sf ~/.dotfiles/gitignore ~/.gitignore

# brew (install xcode tools and git)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# pip para instalar pacotes python
sudo chown -R $USER /Library/Python/2.7/site-packages
easy_install pip
pip install slugify
pip install pygments

# brew packages
brew install composer wget bash-completion git-flow unrar node gist ffmpeg ssh-copy-id youtube-dl sqlite3 nginx p7zip imagemagick coreutils duti direnv heroku-toolbelt

# repositório com várias softwares Unix GNU
brew tap homebrew/dupes

# repositório com várias versões do PHP
brew tap josegonzalez/homebrew-php
brew install php56 --with-apache
brew link php56

# http://caskroom.io/
# instalar softwares desktop para o Mac
brew install phinze/cask/brew-cask

# forçar sudo
sudo -v
# principais
# desligar criação dos arquivos .DS_Store
brew cask install deathtodsstore
open -a DeathToDSStore --args -silent
# outra alternative é redirecionar os .DS_Store para uma única pasta global
brew cask install asepsis

brew cask install iterm2
# brew cask install rightzoom # nao funciona no yosemit
brew cask install lightpaper
brew cask install gitx-rowanj
brew cask install sequel-pro
brew cask install firefox
brew cask install google-chrome
brew cask install phpstorm
brew cask install rubymine
brew cask install vagrant
brew cask install virtualbox

# add beta versions of softwares: https://github.com/caskroom/homebrew-versions
brew tap caskroom/versions
# install beta sublime3
brew cask install sublime-text3

sudo -v
# extras
brew cask install robomongo
brew cask install appcleaner
brew cask install adobe-air
brew cask install git-annex
brew cask install pdftk
# para trabalhar com pdf e vetores
brew cask install xquartz
# painel de configuração de associação de extensões/URL Scheme
brew cask install rcdefaultapp
brew cask install vmware-fusion

sudo -v
# pessoal
brew cask install vlc
brew cask install subtitle-master
brew cask install transmission
brew cask install quickcast
brew cask install stella

# CASK MISSING: snes9x adobeair-sdk flexsdk

# colocar meu usuário como dono de /usr/local, para não precisar utilizar sudo
sudo chown -R $USER /usr/local
# npm global packages
brew install android-sdk ios-sim ant
npm install -g coffee-script bower gulp cordova plugman

# instalar a última versão do android sdk (visual)
android

# uninstall all rubygems
for i in `gem list --no-versions`; do sudo gem uninstall -aIx $i; done

# utilizar rbenv ao inves do ruby nativo do Mac, pois precisa de sudo
brew update
brew install rbenv ruby-build rbenv-gem-rehash rbenv-default-gems
# sempre instala o bundler ao instalar um novo ruby
echo 'bundler' >> "$(brew --prefix rbenv)/default-gems"
echo 'gem: --no-ri --no-rdoc -V' >> ~/.gemrc
source ~/.bash_profile
rbenv install 2.1.3
rbenv global 2.1.3
gem install bundler

cd ~/Downloads

cat <<'EOF' > Gemfile
source 'https://rubygems.org'
gem 'rails'
EOF

#git up
sudo gem install git-up

# mac command line stats
gem install iStats

bundle install --verbose

# mysql
brew install mysql
# automatic start
# ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
# manual start
mysql.server start

mkdir -p ~/Applications
cd ~/Downloads

# ======================================================== NÃO PRECISA MAIS, UTILIZAR AGORA PELO CASK ===========================================

# iTerm2
cd ~/Downloads
wget https://iterm2.com/downloads/stable/iTerm2_v2_0.zip
unzip iTerm2*
mv iTerm.app /Applications
rm iTerm2*

# Sublime Text
cd ~/Downloads
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg
hdiutil mount Sublime*.dmg
cp -R "/Volumes/Sublime Text/Sublime Text.app" ~/Applications
hdiutil unmount /Volumes/Sublime*
ln -s ~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
rm Sublime*.dmg


# Sublime url protocol: https://github.com/saetia/sublime-url-protocol-mac
cd ~/Downloads
wget https://github.com/saetia/sublime-url-protocol-mac/archive/master.zip
unzip master.zip
mv sublime-url-protocol-mac-master/Sublime\ Protocol.app ~/Applications/
open ~/Applications/Sublime\ Protocol.app
rm master.zip
rm -rf sublime-url-protocol-mac-master

# Sublime Extensions
# https://github.com/gornostal/Modific
# http://editorconfig.org/

# GitX
cd ~/Downloads
wget http://builds.phere.net/GitX/development/GitX-dev.dmg
hdiutil mount GitX-dev.dmg
cp -R "/Volumes/GitX 0.14.95/GitX.app" ~/Applications
hdiutil unmount /Volumes/GitX*
sudo ln -sf ~/Applications/GitX.app/Contents/Resources/gitx /usr/local/bin/gitx
rm GitX*.dmg

# DiffMerge
cd ~/Downloads
wget http://download-us.sourcegear.com/DiffMerge/4.2.0/DiffMerge.4.2.0.697.intel.stable.dmg
hdiutil mount DiffMerge*.dmg
cp -r "/Volumes/DiffMerge 4.2.0.697 intel stable/DiffMerge.app" /Applications/
hdiutil unmount /Volumes/DiffMerge*
sudo ln -sf /Applications/DiffMerge.app/Contents/Resources/diffmerge.sh  /usr/bin/diffmerge
rm DiffMerge*.dmg

# Google Chrome
cd ~/Downloads
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil mount googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" ~/Applications
hdiutil unmount /Volumes/Google*
rm googlechrome.dmg

# FireFox
cd ~/Downloads
wget -O firefox.dmg "https://download-installer.cdn.mozilla.net/pub/firefox/releases/28.0/mac/pt-BR/Firefox%2028.0.dmg"
hdiutil mount firefox.dmg
cp -R /Volumes/Firefox/Firefox.app ~/Applications/
hdiutil unmount /Volumes/Firefox
rm firefox.dmg

# DropBox
cd ~/Downloads
wget -O dropbox.dmg "https://www.dropbox.com/download?src=index&plat=mac"
hdiutil mount dropbox.dmg
open "/Volumes/Dropbox Installer/Dropbox.app"

# Sequel Pro
cd ~/Downloads
wget https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg
hdiutil mount sequel-pro-*.dmg
cp -R "/Volumes/Sequel Pro 1.0.2/Sequel Pro.app" ~/Applications
hdiutil unmount /Volumes/Sequel*
rm sequel-pro-*.dmg

# PhpStorm
cd ~/Downloads
wget http://download.jetbrains.com/webide/PhpStorm-8.0.1.dmg
hdiutil mount PhpStorm-*.dmg
cp -R "/Volumes/PhpStorm/PhpStorm.app" ~/Applications
hdiutil unmount /Volumes/PhpStorm
rm PhpStorm-*.dmg

# JetBrains Plugins
# https://github.com/editorconfig/editorconfig-jetbrains
# angular

# RubyMine
cd ~/Downloads
wget http://download.jetbrains.com/ruby/RubyMine-6.3.3.dmg
hdiutil mount RubyMine-*.dmg
cp -R /Volumes/RubyMine/RubyMine.app ~/Applications
hdiutil unmount /Volumes/RubyMine
rm RubyMine-*.dmg

# Vagrant
cd ~/Downloads
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.0.dmg
hdiutil mount vagrant*.dmg
sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /
hdiutil unmount /Volumes/Vagrant*
rm vagrant*.dmg

# LightPaper
cd ~/Downloads
wget http://cl.ly/3c370B2o0J2A/download/LightPaper_v0.8.7.dmg
hdiutil mount LightPaper*
cp -R /Volumes/LightPaper/LightPaper.app ~/Applications
hdiutil unmount /Volumes/LightPaper*
rm LightPaper*.dmg

# RoboMongo
cd ~/Downloads
wget http://robomongo.org/files/mac/Robomongo-0.8.4-x86_64.dmg
hdiutil mount Robomongo*.dmg
cp -R /Volumes/Robomongo-0.8.4-x86_64/Robomongo.app ~/Applications
hdiutil unmount /Volumes/Robomongo*
rm Robomongo*.dmg

# VirtualBox
cd ~/Downloads
wget http://download.virtualbox.org/virtualbox/4.3.8/VirtualBox-4.3.8-92456-OSX.dmg
hdiutil mount VirtualBox*.dmg
sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /
hdiutil unmount /Volumes/VirtualBox*
rm VirtualBox*.dmg

# Right Zoom
cd ~/Downloads
wget http://www.blazingtools.com/mac/RightZoom.zip
unzip RightZoom.zip
mv RightZoom.app ~/Applications/
rm RightZoom.zip
open ~/Applications/RightZoom.app
