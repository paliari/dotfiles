#!/usr/bin/env ruby

# http://duti.org/
# brew install duti

assoc = "softwares.csv"
assoc = File.expand_path("../#{assoc}",  __FILE__)
lines = IO.readlines assoc
parts = lines.collect { |line| line.split /\s+/ }

hash = parts.collect { |p| {role: p[0], uti: p[1], ext: p[2..-1]} }

hash.each do |assoc|
  puts assoc[:role] + ' ' + assoc[:uti]
  assoc[:ext].each do |ext|
    print ext, ' '
    `duti -s #{assoc[:uti]} #{ext} #{assoc[:role]}`
  end
  puts
  puts
end
