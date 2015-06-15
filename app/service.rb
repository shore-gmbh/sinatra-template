require_relative '../config/boot'
require 'sinatra/base'

# Add your documentation for the HTTP service here.
class Service < Sinatra::Base
  ##
  # GET /ping - Return serice ping
  #
  # ## Response
  #
  #   {}
  #
  get '/ping', provides: :json do
    [200, '{}']
  end

  ##
  # GET /v1/:oid/documents - Return all documents
  #
  # ## Request parameters
  #
  #   oid [String] The organization id
  #
  # ## Response Code
  #
  #   200
  #
  # ## Response Body
  #
  #   {
  #     meta: {
  #       current_page: 1,
  #       total_pages: 3,
  #       per_page: 25
  #     },
  #
  #     documents: [
  #       { ... },
  #       { ... }
  #     ]
  #   }
  get '/v1/:oid/documents' do
    # ... add implementation here ...
  end
end
