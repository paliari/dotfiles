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

  if [[ $(which brew) ]]
  then
    if [[ $(brew --prefix php55) ]]
    then
      php5="$(brew --prefix php55)/bin/php"
    else
      if [[ $(brew --prefix php54) ]]
      then
        php5="$(brew --prefix php54)/bin/php"
      else
        return echo "php54 or php55 not found!"
      fi
    fi
    echo "$php5 $line"
    $php5 $line
  else
    echo "brew not found!"
  fi
}

# change default mac path: /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# to put /usr/local/bin before the others
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

alias ip="ifconfig | grep -o 192.168.*n"

alias ipdsl="curl http://host64.appspot.com/ip"

# nao precisa mais
#alias qi="hardlink /Users/neves/Dropbox/github/qi/lib/Qi Qi"

alias mongod-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias mongod-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"

alias mac-resolution="system_profiler SPDisplaysDataType | grep Resolution"

[[ $(which rbenv) ]] && eval "$(rbenv init -)"
