class Song < ApplicationRecord
	belongs_to :artist
	belongs_to :user
	validates :spotify_id, uniqueness: true

end
