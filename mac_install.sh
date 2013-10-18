install_brew() {
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	brew install git wget
}

install_iterm() {
	curl -O http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip
	unzip iTerm2*
	mv iTerm.app /Applications/
	open /Applications/iTerm.app
}

install_command_line_tools() {
	curl -O http://neves.zz.mu/upload/command_line_tools_os_x_mountain_lion_for_xcode__september_2013.dmg
	open command_line_tools_os_x_mountain_lion_for_xcode*
	open /Volumes/Command\ Line\ Tools\ \(Mountain\ Lion\)/Command\ Line\ Tools\ \(Mountain\ Lion\).mpkg
}

install_sublime() {
	cd ~/Downloads
	wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203047.dmg
	open Sublime\ Text\ Build\ 3047.dmg
}