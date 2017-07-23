class UsersController < ApplicationController
    protect_from_forgery with: :exception
    before_action :require_user, only: [:show, :index, :update, :edit]
  	before_action :require_current_user, only: [:show, :edit, :update]

    def search
    	@users = User.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%").order(:name)
    	render :json => {:users => @users}
  	end

    def profile
      @user = @require_current_user
      render "users#show" 
    end

  	def show
      @user = User.find(params[:id])
      if Time.now.strftime("%d/%m/%Y") != Currentdate.last[:date]
        songs = Song.all
        votes = []
        found = false
        songs.each do |song|
          votes.each do |vote|
            if votes.length>0 && vote[:spotify_id] == song[:spotify_id]
              found = true
              vote[:votes] = vote[:votes] + song[:votes]
            end
          end
          if !found
            votes.push(song)
          end
          found = false
          song.update(votes: 0)
        end

        sorted = votes.sort_by { |k| k[:votes] }

        @song_of_the_day = sorted.last
        Currentdate.last.update(date: "#{Time.now.strftime("%d/%m/%Y")}", song: "#{@song_of_the_day[:spotify_id]}")
      else
        @song_of_the_day = Song.where(spotify_id: Currentdate.last[:song])[0]
    	end
      @artist = Artist.where(id: @song_of_the_day[:artist_id])[0]
    end
  
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user = User.update(user_params)
        redirect_to "/users/#{@current_user[:id]}"
      else
        redirect_back fallback_location: edit_user_path(@user)
      end
    end


  	def new
   		@user = User.new
  	end

  	def create
   		@user = User.new(user_params)
   		# @user.avatar = "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(@user.email)}?d=identicon&f=y"
   		if @user.save

     	  session[:user_id] = @user.id
     	  redirect_to "/users/#{@user[:id]}/edit"

   		else
        p "user is being saved"
     	  redirect_to '/signup'
   		end
 	  end

  	private

   	def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :genre, :image_url, :location, :id)
   	end

end
