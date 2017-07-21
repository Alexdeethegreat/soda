class SongsController < ApplicationController
	include HTTParty
	before_action :require_user, only: [:show, :index, :update, :edit]
  	before_action :require_current_user, only: [:show, :edit, :update]
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
		puts params[:add][:name]
		@artist = Artist.new(name: "#{params[:add][:artist]}")
		@song = Song.new(name: "#{params[:add][:name]}", votes: 0, user: @current_user, artist: @artist)
		puts @song
		if @song.valid?
			puts "SUCCESS"
			@song.save
			redirect_to "/users/#{@current_user[:id]}"
		else 
			puts "FAIL"
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
		if params[:query][:artist] == "" && params[:query][:song] == ""
			@tracks = []
		else
			if params[:query][:artist] != "" && params[:query][:song] != ""
				artist = "artist:" + params[:query][:artist]
				song = "%20track:" + params[:query][:song]
			elsif params[:query][:artist] != ""
				artist = "artist:" + params[:query][:artist]
				song = ""
			else
				song = "track:" + params[:query][:song]
				artist = ""
			end

			spotify_token = ENV['SPOTIFY_API_TOKEN']
			url = "https://api.spotify.com/v1/search?q=" + artist + song + "&type=track"
			puts url
			response = HTTParty.get(
				url,
				headers: {
					Authorization: "Bearer " + spotify_token
				},

			)

			@tracks = response["tracks"]["items"]
		end
		
		render :results
	end

	private
	
	def song_params
		params.require(:song).permit(:name, :genre, :votes)
	end
	def set_song 
	@song = Song.find(params[:id])
	end

end
