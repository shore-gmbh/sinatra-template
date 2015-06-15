require_relative '../config/boot'
require 'sinatra/base'

# Add your documentation for the HTTP service here.
class Service < Sinatra::Base
  ##
  # GET /ping - Health check
  #
  # ## Response Code
  #
  #   200
  #
  # ## Response Body
  #
  #   {}
  #
  get '/ping', provides: :json do
    [200, '{}']
  end

  ##
  # Stub for a collection of documents.
  # Remove when starting real implementation.
  #
  DOCUMENTS = [
    OpenStruct.new(id: '1', oid: '1', name: 'foo'),
    OpenStruct.new(id: '2', oid: '1', name: 'bar'),
    OpenStruct.new(id: '3', oid: '1', name: 'baz')
  ]

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
  get '/v1/:oid/documents', provides: :json do |oid|
    documents = DOCUMENTS.select { |d| d.oid == oid }
    @documents = Kaminari.paginate_array(documents)
                 .page(params[:page])
                 .per(params[:per])

    jbuilder :index
  end

  ##
  # GET /v1/:oid/documents/:id - Return a single document
  #
  # ## Request parameters
  #
  #   oid [String] The organization id
  #   id [String] The document id
  #
  # ## Response Code
  #
  #   200
  #
  # ## Response Body
  #
  #   {
  #     id: '522f78b8-6f39-4dce-be8e-ce0fc0f816e6',
  #     ...
  #   }
  get '/v1/:oid/documents/:id', provides: :json do |oid, id|
    @document = DOCUMENTS.find { |d| d.oid == oid && d.id == id }
    halt 404 unless @document

    jbuilder :show
  end
end
