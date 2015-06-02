ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

# Load initializers
Dir[File.dirname(__FILE__) + '/initializers/*.rb'].each { |f| require f }

