source 'https://rubygems.org/'

ruby File.read('.ruby-version').match(/\d\.\d.\d/)[0]

# App Stack
gem 'sinatra', '~> 1.4'
gem 'puma', '>= 2.11.3'

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
end
