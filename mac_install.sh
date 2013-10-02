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
