source 'http://rubygems.org'

gem 'browsercms', path: '~/projects/browsercms'
gemspec

# Avoids unnecessary Content Length warnings that Rack 1.3.6/Rails 3.1.3 + Webrick throw
#	Removed if http://stackoverflow.com/questions/7082364/what-does-warn-could-not-determine-content-length-of-response-body-mean-and-h is ever fixed.
# Must run with `rails s thin`
gem "thin"

# Gem Environments
group :development do
  gem "mysql"
  gem "mocha"
end

