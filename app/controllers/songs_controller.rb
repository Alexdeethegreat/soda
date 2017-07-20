class SongsController < ApplicationController
	include HTTParty
	before_action :require_user 
	before_action :logged_in, only: [:index, :show, :new, :update]
	before_action :set_song, only: [:show, :edit, :update, :destroy]
	def index
		@songs = Song.all
	end

	def show
	end
	def new
		@song = Song.new
		@artist = Artist.all
	end
	def create
		@song = Song.new(song_params)
		if @song.valid?
			@song.save
			redirect_to @song
		else 
			flash[:song] = @song.errors.messages
			redirect_back fallback_location: new_song_path
		end
	end
	def edit
	end
	def update
		if @song.update(song_params)
			redirect_to @song 
		else 
			flash[:song] = @song.errors.messages
			redirect_back fallback_location: edit_song_path
		end
	end

	def destroy 
		if @song.destroy 
			redirect_to songs_path
		else
			flash[:error] = "Could not delete song."
			redirect_back fallback_location: @song 
		end
	end

	def query
		BlastSodJob.set(wait: 1.second)

		search_term = params[:queryterm]
		spotify_token = ENV['SPOTIFY_API_TOKEN']
		url = "GET https://api.spotify.com/v1/search"
		response = HTTParty.get(
			url,
			headers: {
				Authorization: "Bearer " + spotify_token
			},
			query: {
				type: "track",
				term: search_term
			}

		)

		@tracks = response["tracks"]
		render :search

	end

	private
	
	def song_params
		params.require(:song).permit(:name, :genre, :votes)
	end
	def set_song 
	@song = Song.find(params[:id])
	end

end
