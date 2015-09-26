Pry.config.editor = 'subl'

# show the dir name in prompt
Pry.config.prompt_name = File.basename(Dir.pwd)

Pry.config.prompt = [
  # folder/2.2.2|4.2.4/devel⮁
  proc do |obj, nest_level, pry|
    red = "\e[31m%s\e[0m"
    blue = "\e[34m%s\e[0m"
    green = "\e[32m%s\e[0m"
    magenta = "\e[35m%s\e[0m"

    prompt_name = '%s/' % blue % pry.config.prompt_name
    ruby_version = '%s' % red  % RUBY_VERSION
    context = "(%s)" % green % "%s:%s" % [obj, nest_level]
    rails_version = magenta % Rails.version if ENV['RAILS_ENV']
    rails_env = green % ENV['RAILS_ENV'][0..4] if ENV['RAILS_ENV']
    rails = ENV['RAILS_ENV'] ? "|%s/%s" % [rails_version, rails_env] : ''

    prompt = ''
    prompt << prompt_name
    prompt << ruby_version
    prompt << rails
    prompt << context if nest_level > 0
    prompt << " \u27a1 "
    # save prompt length without colors to use on the waiting prompt proc below
    $_pry_prompt_last_length = prompt.gsub(/\e\[[\d;]+m/, '').length
    prompt
  end,
  proc do
    s = "\u21aa " # ⮁
    # align prompt to the last prompt length
    ' ' * ($_pry_prompt_last_length - s.length) + s
  end
]

# begin
#   require 'awesome_print'
#   puts 'awesome_print loaded!'
# rescue LoadError => err
#   puts 'gem install awesome_print'
# end

ActiveRecord::Base.logger = Logger.new(STDOUT) if ENV['RAILS_ENV']

puts '~/.pryrc loaded!'

Pry.config.should_load_plugins = false
puts "Loadings plugins: #{Pry.plugins.keys.join ' '}" if Pry.config.should_load_plugins
