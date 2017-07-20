class BlastSodJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # job is place in the user's controller profile method to wait 1 day before doing the job
  end
end
