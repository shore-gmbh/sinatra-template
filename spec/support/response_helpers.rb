RSpec.configure do
  private

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
