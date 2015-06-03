require_relative "../spec_helper"
require_relative "../../app/service"

RSpec.describe 'GET /ping' do
  def app
    Service
  end

  it "responds with status 200" do
    get '/ping'
    expect(last_response).to eq(200)
  end
end
