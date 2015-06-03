require_relative(File.expand_path('../../../app/service', __FILE__))

RSpec.configure do |config|
  config.include(Rack::Test::Methods, type: :request)

  config.before(:each, type: :request) do
    def app
      Service
    end
  end
end
