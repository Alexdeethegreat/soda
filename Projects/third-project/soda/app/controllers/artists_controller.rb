class ArtistsController < ApplicationController
	before_action :require_user 
	before_action :logged_in, only: [:index, :show, :new, :update]
	before_action :set_artist, only: [:show, :edit, :update, :destroy]
	def index
		@artists = Artist.all 
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
			redirect_back fallback_location: new_artist_parth
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
