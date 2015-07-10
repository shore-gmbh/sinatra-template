source 'https://rubygems.org/'

ruby File.read('.ruby-version').match(/\d\.\d.\d/)[0]

# application
gem 'sinatra', '~> 1.4'
gem 'puma', '>= 2.11.3'

# rendering
gem 'tilt-jbuilder', require: 'sinatra/jbuilder'
gem 'multi_json'

# persistence
gem 'kaminari'
# gem 'mongoid'
# gem 'activerecord'
# gem 'sequel'
# gem 'pg'

gem 'airbrake', '>= 4.1.0'

group :development do
  gem 'rake', '~> 10.0'
  gem 'rubocop', '>= 0.31.0', require: false
  gem 'overcommit', '>= 0.25.0', require: false
end

group :test, :development do
  gem 'pry-byebug'
end

group :test do
  gem 'rspec', '>= 3.2.0'
  gem 'rack-test', '~> 0.6'
  gem 'json_spec'
end
