sumall() {
  echo RSS: `sumrss`
  echo VSZ: `sumvsz`
}

ssh-add-all() {
  # add all identities in ~/.ssh
  for f in ~/.ssh/*.pub
  do
    DIR=$(dirname $f)
    NAME=$(basename -s .pub $f)
    ssh-add $DIR/$NAME
  done
}

# benchmark disk speed
iobench() {
  bs=${1-16k}
  count=${2-16k}
  conv=sync
  if [ -e /etc/debian_version ]
  then
  conv=fdata$conv
  fi
  dd if=/dev/zero of=iobench.tmp bs=$bs count=$count conv=$conv && rm iobench.tmp;
}

rename() {
  DIR=$(dirname $1)
  NEW=$DIR/$2
  mv $1 $NEW;
  ls -la $NEW
}

# compile and run a .go file
go() { 8g $1.go && 8l -o $1.bin $1.8 && rm $1.8 && ./$1.bin; }

# tar+bz2 a folder
tbz() { tar -c $1 | bzip2 -k9c > $1.tar.bz2; l $1.tar.bz2; }

# ajuda descobrir onde esta determinado executavel e ja exibe dados sobre ele
lw() { l $(which $1); }

# backup a file to name.bak
bkp() { mv "$1" "$1.bak"; lw "$1.bak"; }

# change recursively the owner to www-data
wdata() { chown -R www-data:www-data $1; }

# return a random password
mkpw() { head /dev/urandom | uuencode -m - | sed -n 2p | cut -c1-${1:-8}; }

# logo apos executar cp /path/a path/b, executar cpback /path/a /path/b para copiar ao contrario
cpback() { cp $2 $1; }

gspush() { curl -s --form key='${filename}' --form file=@$1 http://w3b.commondatastorage.googleapis.com; }
gspop() { wget -O $1 http://w3b.commondatastorage.googleapis.com/$1; }
gsdel() { curl -s -X DELETE http://w3b.commondatastorage.googleapis.com/$1; }
gslist() { curl -s http://w3b.commondatastorage.googleapis.com | grep '<Key>[^<]*</Key>' -o | sed 's/<\/*Key>//g'; }

findBySize() {
    find $1 -type f -size $2 -exec ls -lh {} \; | awk '{ print $5 "\t" $9 }'
}

alias reload-bashrc="source ~/.bashrc"
# mostra os 10 processos ordenados pela utilização de memória (em MB)
alias pstop="ps -Ao rss,comm --sort=rss | awk '{printf \"%.0f %s\n\", \$1/1024, \$2}' | tail"
alias psvtop="ps -Ao vsz,comm --sort=vsz | awk '{printf \"%.0f %s\n\", \$1/1024, \$2}' | uniq -f1 | tail"

# sum memory usage
alias sumrss="ps -e --format rss --no-heading | awk '{tot=tot+\$1} END {print tot}'"
alias sumvsz="ps -e --format vsz --no-heading | awk '{tot=tot+\$1} END {print tot}'"

# pretty print xml and json
alias xmlp="tidy -indent -quiet -xml -raw"
alias jsonp="python -mjson.tool"

alias iso2utf8="iconv -f iso-8859-1 -t utf8"
alias sumlines="awk '{sum+=\$1} END{printf(\"%d\n\",sum)}'"
alias fsize="stat -f %z"

# observa a pasta atual para compilar .coffee
alias coffee-watch="coffee -c -b -w ."

# converte um diretorio de png em jpg
alias png2jpg="mogrify -format jpg *.png"

# mostra todos os paths separados por linha
alias paths='echo -e ${PATH//:/\\n}'

# decode/encode base64 from commandline (base64 -D)
alias base64_decode="php -r \"echo base64_decode(trim(file_get_contents('php://stdin')));\""
alias base64_encode="php -r \"echo base64_encode(trim(file_get_contents('php://stdin')));\""
