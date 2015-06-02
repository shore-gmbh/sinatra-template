require_relative '../config/boot'
require 'sinatra/base'

class Service < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :welcome
  end
end

