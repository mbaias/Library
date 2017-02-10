class SessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to root_path
		end
	end
	def create 
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome #{current_user.username}"
			redirect_to root_path
		else
			flash[:notice] = "Email or password is invalid"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You logged out"
		redirect_to root_path
	end
end
