
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
