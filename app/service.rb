require_relative '../config/boot'
require 'sinatra/base'

class Service < Sinatra::Base
  get '/ping', provides: :json do
    [200, '{}']
  end
end

