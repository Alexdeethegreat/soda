class ArtistsController < ApplicationController
	before_action :require_user, only: [:show, :index, :update, :edit]
  	before_action :require_current_user, only: [:show, :edit, :update]

	before_action :set_artist, only: [:edit, :update, :destroy]
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
