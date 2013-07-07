class SessionsController < ApplicationController

	def create
	  p "---Sessions--create---"
	  p params
	  p "---Sessions--create--"
	  user = User.where(:name => params[:signin][:name]).first
	  if user && user.authenticate(params[:signin][:password])
	  	session[:user_id] = user.id
	  	flash[:notice] = "Signed in successfully."
	  	
	  	redirect_to root_url
	  else
        flash[:error] = "Sorry. Sign in failed."
        render :new
	  end
	end
end