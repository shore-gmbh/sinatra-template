require_relative '../config/boot'
require 'sinatra/base'

class Service < Sinatra::Base

  set :public_folder => "public", :static => true

  get '/ping', provides: :json do
    [200, '{}']
  end
end

