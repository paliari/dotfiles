iso2img() {
  name=$(basename $1 .iso)
  hdiutil convert $1 -format UDRW -o $name;
  mv $name.dmg $name.img
}

img2iso() {
  name=$(basename $1 .img)
  hdiutil convert $1 -format UDTO -o $name;
  mv $name.cdr $name.iso
}

localhost() {
  port=8081
  if [ -e cli-server.php ]
  then
    cmd=cli-server.php
  else
    cmd="-t ."
  fi
  line="-S 0.0.0.0:$port $cmd"
  echo "php54 $line"
  php54 $line
}

# @TODO try .bashrc and .profile
alias reload-bashrc="source ~/.bash_profile"

alias ip="ifconfig | grep -o 192.168.*n"

alias ipdsl="curl http://host64.appspot.com/ip"

alias qi="hardlink /Users/neves/Dropbox/github/qi/lib/Qi Qi"

alias mongod-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias mongod-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
