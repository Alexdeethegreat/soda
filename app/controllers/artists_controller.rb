class ArtistsController < ApplicationController
	before_action :require_user 
	before_action :require_current_user, only: [:show, :new, :update]
	before_action :set_artist, only: [:show, :edit, :update, :destroy]
	

	def index

		songs = Song.where(user_id: @current_user[:id])
		found = false
		artists = []
		songs.each do |song|
			artists.each do |artist|
				if artist == song[:artist_id]
					found = true
				end
			end
			if !found
				artists.push(song[:artist_id])
			end
			found = false
		end

		@artists = []
		artists.each do |artist|
			@artists.push(Artist.find(artist))
		end

		@artists.each do |artist|
			artist.songs = Song.where(artist_id: artist[:id])
			puts artist[:name]
			puts artist.songs
		end

	end

	def show
	end

	def new
		@artist = Artist.new 
	end
	def create
		@artist = Artist.new(artist_params)
		if @artist.valid?
			@artist.save
			redirect_to @artist
		else 
			flash[:artist] = @artist.errors.messages
			redirect_back fallback_location: new_artist_path
		end 
	end
	def edit
	end
	def update
		if @artist.update(artist_params)
			redirect_to	@artist
		else
			redirect_back fallback_location: edit_artist_path(@artist)
		end 
	end

	def destroy 
		if @artist.destroy
			redirect_to songs_path
		else 
		    flash[:error] = "Could not delete artist."
      		redirect_back
		end

	end

	private 
	def artist_params 
		params.require(:artist).permit(:name, :genre)
	end

	def set_artist
		@artist = Artist.find(params[:id])
	end


end
