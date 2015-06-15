require 'spec_helper'

RSpec.describe '/v1/:oid/documents', type: :request do
  context 'without params' do
    before { get('/v1/1/documents') }

    it 'responds with status 200' do
      expect(response_status).to eq(200)
    end

    it 'responds with json content type' do
      expect(response_content_type).to eq('application/json')
    end

    it 'responds with page meta' do
      expect(response_json).to have_key('meta')

      expect(response_json('meta/current_page')).to eq(1)
      expect(response_json('meta/total_pages')).to eq(1)
      expect(response_json('meta/per_page')).to eq(Service::DOCUMENTS.size)
    end

    it 'responds with a collection of documents' do
      expect(response_json).to have_key('documents')
      expect(response_json('documents')).to be_kind_of(Array)

      expect(response_json('documents/0')).to include('id', 'name')
      expect(response_json('documents/0')).to_not include('oid')
    end
  end

  context 'with pagination params' do
    before { get('/v1/1/documents', per: 2) }

    it 'responds with status 200' do
      expect(response_status).to eq(200)
    end

    it 'responds with page meta' do
      expect(response_json).to have_key('meta')

      expect(response_json('meta/current_page')).to eq(1)
      expect(response_json('meta/total_pages')).to eq(2)
      expect(response_json('meta/per_page')).to eq(2)
    end
  end

  context 'with non-matching :oid' do
    before { get('/v1/9999/documents', per: 2) }

    it 'responds with status 200' do
      expect(response_status).to eq(200)
    end

    it 'response with an emptycollection' do
      expect(response_json).to have_key('documents')

      expect(response_json('documents')).to be_kind_of(Array)
      expect(response_json('documents')).to be_empty
    end
  end
end
