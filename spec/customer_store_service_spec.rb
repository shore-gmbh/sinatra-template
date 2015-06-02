require_relative "spec_helper"
require_relative "../customer_store_service.rb"

def app
  CustomerStoreService
end

describe CustomerStoreService do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
