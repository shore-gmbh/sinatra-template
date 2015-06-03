RSpec.describe 'GET /ping', type: :request do
  it "responds with status 200" do
    get '/ping'
    expect(last_response.status).to eq(200)
  end
end
