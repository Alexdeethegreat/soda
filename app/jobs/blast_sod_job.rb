class BlastSodJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # job is place in the user's controller profile method to wait 1 day before doing the job
    p "Andrew's Pie and High"
    @songs = Song.first 
    p @songs
    render :body @song => 'users/edit' 
  end
end
