require 'active_job'

# Configure ActiveJob to use the service's preferred backend (e.g.  `sidekiq`).
#
# `:inline` means: Process all jobs synchronously.
ActiveJob::Base.queue_adapter = :inline
