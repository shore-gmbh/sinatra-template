RSpec.describe 'GET /v1/:oid/documents/:id', type: :request do
  context 'with existing document' do
    before { get('/v1/1/documents/1') }

    it 'responds with status 200' do
      expect(response_status).to eq(200)
    end

    it 'responds with json content type' do
      expect(response_content_type).to eq('application/json')
    end

    it 'responds with a document' do
      expect(response_json).to include('id', 'name')
    end
  end

  context 'with non-existing document' do
    before { get('/v1/1/documents/9999') }

    it 'responds with status 404' do
      expect(response_status).to eq(404)
    end
  end
end
