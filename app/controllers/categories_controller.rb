class CategoriesController < ApplicationController
	# before_action :require_same_user, only: [:new, :create, :edit, :update, :destroy]

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category has been created"
			redirect_to categories_path
		else
			flash[:notice] = "Category has not been created"
			render "new"
		end
	end

	def show
		@category = Category.find(params[:id])
	end

	def index
		@categories = Category.all
	end

	def destroy 
		@category.destroy
		flash[:danger] = "Category has been destroyed"
		redirect_to root_path
	end

	private 
		def category_params
			params.require(:category).permit(:name)
		end

		# def require_same_user
		# 	if current_user != current_user.admin?
		# 		flash[:danger] = "You can not edit categories"
		# 		redirect_to root_path
		# 	end
		# end

end
