require_relative '../config/boot'
require 'sinatra/base'

# Add your documentation for the HTTP service here.
class Service < Sinatra::Base
  get '/ping', provides: :json do
    [200, '{}']
  end
end
