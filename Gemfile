source "https://rubygems.org/"

ruby File.read('.ruby-version').match(/\d\.\d.\d/)[0]

# App Stack
gem "sinatra", "~> 1.4"


group :development do
  gem "rake", "~> 10.0"
  gem "minitest", "~> 5.2"
  gem "rack-test", "~> 0.6"
end

group :test, :development do
  gem 'pry-byebug'
end

group :test do
  gem 'rspec', '>= 3.2.0'
end
