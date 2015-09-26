# simplifica o uso de for loops
loop() {
  if [ $# -lt 2 ]
  then
    echo 'Usage: loop ''ls -lah $fullpath'' dir/*'
    echo 'Variables: fullpath, name, ext, prefix'
    echo 'Sample (convert pdf to png): loop ''convert $fullpath png/$prefix.png'' pfds/*.pdf'
    return
  fi
  cmd=$1
  # remove o primeiro argumento do array
  shift
  # loop no restante dos argumentos
  for fullpath in $*
  do
    # nome sem diretorio
    name=$(basename "$fullpath")
    # imprime o nome do arquivo em verde para stderr
    echo -e "\e[32m$name\e[0m" 1>&2
    # apenas extensao sem o ponto
    ext="${name##*.}"
    # apenas o nome, sem extensao
    prefix="${name%.*}"
    # executa o comando passado no primeiro parametro entre aspas
    eval $cmd
  done
}

# mv files from folder to parent and remove folder
# mv -f */* . && for dir in */; do echo $dir; rmdir "$dir"; done

# extend image and center to a size
# src, size, dest
center-image() {
  if [ $# -lt 3 ]
  then
    echo 'Usage: center-image path.png 320x240 output.png'
    return
  fi
  convert $1 -gravity center -background transparent -extent $2 $3
}

# ip do gateway da rede
gateway() {
  netstat -r | grep default | awk '{ print $2 }'
}

# rails template: rt nome-da-receita
rt() {
  if [ $# -lt 1 ]
  then
    echo 'Usage: rt recipe-name'
    echo 'Listar: rt help'
    echo 'Comitar rt <recipe> commit'
    return
  fi
  bin/rake rails:template LOCATION=~/Dropbox/projects/rails/template/template.rb RECIPE=$1 COMMIT=$2
}

# open gem with sublime
subl-gem() {
  if [ $# -lt 1 ]
  then
    echo 'Usage: subl-gem rails'
    return
  fi
  subl $(bundler show $1)
}

# parar o rails iniciado com rails server -d
alias rails_stop='(test -f tmp/pids/server.pid && kill -INT $(cat tmp/pids/server.pid) && echo Rails Stopped) || echo pid not found'

alias rails_restart="spring stop; rails_stop; rails s -d; rake log:clear tmp:clear &;"

# disable plugin loading for faster startup
alias pry="pry --no-plugins"

function colorspace() {
  identify -verbose "$1[0]" | grep Colorspace
}
