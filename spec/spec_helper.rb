ENV['RACK_ENV'] = 'test'

require 'bundler'

Bundler.setup
Bundler.require(:default, ENV['RACK_ENV'])

require 'rack/test'

require "find"
%w{./config/initializers ./lib}.each do |load_path|
  Find.find(load_path) { |f| require f if f.match(/\.rb$/) }
end

RSpec.configure do |config|
end
