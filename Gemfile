source 'http://rubygems.org'


gem 'decko'


gem 'mysql2', '>= 0.3.18', '< 0.5'

# WEBSERVER
# To run a simple deck at localhost:3000, you can use thin (recommended), unicorn, or (Rails' default) Webrick
gem 'thin'
# gem 'unicorn'

# To set up a production webserver, see http://wagn.org/wagn_in_production


# BACKGROUNDING
# The daemons gem is needed to run tasks like sending notifications in a background process.
# See config/application.rb for configuration details.
# gem 'daemons'





# load gems needed in Gemfiles
# You may need to alter this code if you move your mod(s) to an unconventional location.
Dir.glob( 'mod/**{,/*/**}/Gemfile' ).each do |gemfile|
  instance_eval File.read(gemfile)
end
