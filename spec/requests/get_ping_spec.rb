RSpec.describe 'GET /ping', type: :request do
  before { get('/ping') }

  it 'responds with status 200' do
    expect(last_response.status).to eq(200)
  end

  it 'responds with content type application/json' do
    expect(last_response.content_type).to eq('application/json')
  end
end
