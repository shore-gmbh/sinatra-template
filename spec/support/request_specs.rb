require_relative '../../app/service'

RSpec.configure do |config|
  config.include(JsonSpec::Helpers, type: :request)
  config.include(Rack::Test::Methods, type: :request)

  config.before(:each, type: :request) do
    def app
      Service
    end

    def response_status
      last_response.status
    end

    def response_content_type
      last_response.headers['Content-Type']
    end

    def response_json(key = nil)
      parse_json(last_response.body, key)
    end
  end
end
