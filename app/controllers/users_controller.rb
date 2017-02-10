class UsersController < ApplicationController
	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to the Library #{@user.username}"
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update 
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "User have been updated"
			redirect_to root_path
		else
			render :edit
		end
	end

	def show
		@user = User.find(params[:id])
		@favorites = @user.favorite_books
	end

	def index
		@users = User.all
	end

	private

		def require_same_user
			if current_user != @user
				flash[:danger] = "You can edit only your books"
				redirect_to root_path
			end
		end

		def user_params
			params.require(:user).permit(:name, :username, :email, :password, :admin)
		end
end
