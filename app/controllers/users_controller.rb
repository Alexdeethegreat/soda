class UsersController < ApplicationController
    before_action :require_user, only: [:show, :index, :update, :edit]
  	before_action :require_current_user, only: [:show, :edit, :update]

    def search
    	@users = User.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%").order(:name)
    	render :json => {:users => @users}
  	end

    def profile
      # BlastSodJob.set(wait: 1.minute).perform_later 
      @user = @require_current_user
      render "users#show"
    end

  	def show
    	@user = User.find(params[:id])
  	end
  
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user = User.update(:email, :password, :password_)
      redirect_to @user
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
     	  redirect_to @user

   		else
        p "user is being saved"
     	  redirect_to '/signup'
   		end
 	  end

  	private

   	def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
   	end

end
