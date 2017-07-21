class Artist < ApplicationRecord
	has_many :songs, :dependent => :destroy
	validates :email, confirmation: true, 
	presence: true, 
	uniqueness: true, 
	format: {
		with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
		message: "Invalid email address" 
	}
	validates :email_confirmation, presence: true 
	validates :name, presence: true
end	
