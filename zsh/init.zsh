export DOTDIR=$HOME/.dotfiles

# definir o prompt padrão
#autoload -Uz promptinit
#promptinit
#prompt sorin

# corrigir fn+arrow no prompt
# $key_info[End]
#bindkey "^[[H" beginning-of-line
# $key_info[Home]
#bindkey "^[[F" end-of-line

export PATH="$HOME/bin:$DOTDIR/bin:$PATH"

# trocar alias do l
unalias l &> /dev/null
unalias gls &> /dev/null
unalias gl &> /dev/null

# brew install coreutils para funcionar --group-directories-first
alias gls="gls --color=auto --group-directories-first"
alias l="ls -lh"
alias gl="gls -l"
alias gl="gls -l"
alias gla="gl -a"

# git aliases
unalias gs &> /dev/null
unalias gd &> /dev/null
alias gst="git s"
alias gs=gst
alias gd="git d"
alias ga="git a"
alias gc="git c"
alias gamend="git amend"

alias ghost=$(brew --prefix ghostscript 2&> /dev/null)/bin/gs

alias rails_stop='kill -9 $(cat tmp/pids/server.pid)'
alias rails_stop_global='kill -9 $(lsof -i :3000 -t)'
alias rails_restart="rails_stop; rails s -d"
alias rails_reload=rails_restart

# cat key.pem | fingerprint => 84:b8:56:92:2a:5f:43:a5:34:79:e0:62:9d:8d:66:d3:e7:e4:85:31
alias fingerprint="openssl rsa -outform DER -pubout | openssl sha1 -c"

# gulp with coffee-script
alias gulpc="gulp --require coffee-script"

# aws zsh autocomplete
which aws_zsh_completer.sh &>/dev/null && source aws_zsh_completer.sh

export AWS_DEFAULT_REGION=sa-east-1

# http://docs.docker.io/en/latest/installation/mac/
export DOCKER_HOST=tcp://localhost:4243

# android SDK HOME
export ANDROID_HOME=/usr/local/opt/android-sdk

# utilizar o sublime como editor padrão
export EDITOR=subl

alias fsize="stat -f %z"

lw() { l $(which $1); }

bkp() { mv "$1" "$1.bak"; lw "$1.bak"; }

# converte pdf em ps e novamente em pdf para reduzir o tamanho
# NÃO EXIBE ACENTOS!
pdf2ps2pdf() {
  pdf2ps $1 $1.ps
  ps2pdf $1.ps _$1
  du -h $1    | awk '{print "original: " $1}'
  du -h $1.ps | awk '{print "      ps: " $1}'
  du -h _$1   | awk '{print "compress: " $1}'
  rm -f $1.ps
}

# screen   (screen-view-only quality, 72 dpi images) (qualidade apenas para preview, metade do tamanho do ebook)
# ebook    (low quality, 150 dpi images) (qualidade aceitável e tamanho 5 a 15 vezes menor que prepress)
# printer  (high quality, 300 dpi images) (não funciona, usar o abaixo)
# prepress (high quality, color preserving, 300 dpi imgs) (melhor qualidade/tamanho)
# default  (almost identical to /screen)
# trocar/juntar -dPDFSETTINGS=/ por -r150
pdfzip() {
  level=$1
  input=$2
  output=$3
  gs=/usr/local/bin/gs

  $gs 2&> /dev/null \
    -q -dNOPAUSE -dBATCH -dSAFER \
    -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.6 \
    -dEmbedAllFonts=true \
    -dSubsetFonts=true  \
    -dColorImageDownsampleType=/Bicubic \
    -dGrayImageDownsampleType=/Bicubic  \
    -dMonoImageDownsampleType=/Bicubic  \
    #-dColorImageResolution=$dpi \
    #-dGrayImageResolution=$dpi \
    #-dMonoImageResolution=$dpi \
    -dPDFSETTINGS=/$1 \
    -sOutputFile="$output" \
    "$input"
}

pdfziptest() {
  name=${1%.*}
  echo screen
  pdfzip screen   "$1" "$name".1screen.pdf
  echo ebook
  pdfzip ebook    "$1" "$name".2ebook.pdf
  echo prepress
  pdfzip prepress "$1" "$name".3prepress.pdf
  echo default
  pdfzip default  "$1" "$name".4default.pdf
}
