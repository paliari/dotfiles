install_brew() {
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	brew install git
}

install_iterm() {
	curl -O http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip
	unzip iTerm2*
	mv iTerm.app /Applications/
	open /Applications/iTerm.app
}

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

install_sublime() {
	cd ~/Downloads
	wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203047.dmg
	open Sublime\ Text\ Build\ 3047.dmg
	rm Sublime\ Text\ Build\ 3047.dmg
}

install_dotfiles() {
	cd
	git clone https://github.com/neves/dotfiles.git .dotfiles
	cd .dotfiles
	source bashrc
	bash install.sh
}

install_php55() {
	brew tap homebrew/dupes
	brew tap josegonzalez/homebrew-php
	brew install php55
}
