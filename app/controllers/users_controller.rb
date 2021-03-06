class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def new
    p '---users--new---'
    p params
    p '---users--new---'
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      session[:user_id] = @user.id
  		flash[:notice] = "You have signed up successfully."
  		redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  	  flash[:notice] = "Profile has been updated."
  	  redirect_to @user
  	else
  	  flash[:alert] = "Profile has not been updated."
  	  render action: "edit"
  	end
  end

  private
    def set_user
	    @user = User.find(params[:id])
	 rescue ActiveRecord::RecordNotFound
	    flash[:alert] = "The user you were looking" + " for could not be found."

	    redirect_to users_path	
	  end

    def user_params
    	params.require(:user).permit(:name,
    								               :email,
                                   :password,
    								               :password_confirmation)		
    end
   
end
