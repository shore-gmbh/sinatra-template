require 'active_job'
require 'rspec/active_job'

ActiveJob::Base.queue_adapter = :test
ActiveJob::Base.logger = nil

RSpec.configure do |config|
  config.include(RSpec::ActiveJob)

  config.after(:each) do
    ActiveJob::Base.queue_adapter.enqueued_jobs = []
    ActiveJob::Base.queue_adapter.performed_jobs = []
  end
end
