# http://myrepos.branchable.com/
# gerenciar varios git ao mesmo tempo
brew install mr

# https://github.com/thoughtbot/rcm
# http://thoughtbot.github.io/rcm/
# gerenciar dotfiles
brew tap thoughtbot/formulae
brew install rcm

# MongoDB
brew install mongodb
# autoload
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
# load
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
# or just mongod or mongod-start mongod-stop

# exemplo de como utilizar bash como shell padrão
# chpass -s /bin/bash

# pip para instalar pacotes python
sudo easy_install pip
# Amazon command line interface
sudo pip install awscli

# gerenciar varios git no $HOME
brew install vcsh
# salva em .config/vcsh

# http://www.docker.io/
brew install boot2docker
boot2docker init
# boot2docker up
# boot2docker ssh # password: tcuser

# local internet share tunnel
# http://progrium.com/localtunnel/
gem install localtunnel

# tunnel
# https://github.com/progrium/keychain.io
# https://ngrok.com/
mkdir -p ~/bin
cd ~/Downloads
wget https://dl.ngrok.com/darwin_amd64/ngrok.zip
unzip ngrok.zip
mv ngrok ~/bin/
rm ngrok.zip

# ====================================================================================================================================================================

# Subtitle Master
# check url: curl http://updates.subtitlemaster.com/ | md5
cd ~/Downloads
wget "http://updates.subtitlemaster.com/app/Subtitle%20Master%200.6.zip"
unzip Subtitle*.zip
rm Subtitle*.zip
mv Subtitle* ~/Applications/

# VLC
cd ~/Downloads
wget http://get.videolan.org/vlc/2.1.4/macosx/vlc-2.1.4.dmg
hdiutil mount vlc-*.dmg
cp -R /Volumes/vlc-2.1.4/VLC.app ~/Applications
hdiutil unmount /Volumes/vlc-*
rm vlc-*.dmg

# git-annex
cd ~/Downloads
wget http://downloads.kitenet.net/git-annex/OSX/current/10.9_Mavericks/git-annex.dmg
hdiutil mount git-annex.dmg
cp -R /Volumes/git-annex/git-annex.app ~/Applications
hdiutil unmount /Volumes/git-annex
rm git-annex.dmg

# https://gist.github.com/trinitronx/6217746
install_command_line_tools() {
	set -e
	OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

	# Get Xcode CLI tools
	# https://devimages.apple.com.edgekey.net/downloads/xcode/simulators/index-3905972D-B609-49CE-8D06-51ADC78E07BC.dvtdownloadableindex
	TOOLS=clitools.dmg
	if [ ! -f "$TOOLS" ]; then
	  if [ "$OSX_VERS" -eq 7 ]; then
		  DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg
	  elif [ "$OSX_VERS" -eq 8 ]; then
	  	  DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_mountain_lion_april_2013.dmg
	  elif [ "$OSX_VERS" -eq 9 ]; then
		  DMGURL=http://adcdownload.apple.com/Developer_Tools/command_line_tools_os_x_mavericks_for_xcode__late_october_2013/command_line_tools_os_x_mavericks_for_xcode__late_october_2013.dmg
	  fi
	  curl "$DMGURL" -o "$TOOLS"
	fi
	TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
	hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT"
	installer -pkg "$(find $TMPMOUNT -name '*.mpkg')" -target /
	hdiutil detach "$TMPMOUNT"
	rm -rf "$TMPMOUNT"
	rm "$TOOLS"
	exit
}
