class BooksController < ApplicationController
	before_action :require_same_user, only: [:new, :create, :edit, :update, :destroy]
	def new
		@book = Book.new
	end

	def create 
		@book = current_user.books.build(book_params)
		if @book.save 
			flash[:notice] = "You have created a book"
			redirect_to books_path
		else
			render :new
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update 
		@book = Book.find(params[:id])
		if @book.update
			flash[:notice] = "Book has been updated"
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash[:danger] = "Book has been deleted"
		redirect_to books_path
	end

	def index
		@books = Book.all
	end

	private
		def book_params
			params.require(:book).permit(:name, :author, :photo, :year, :category_id)
		end

		def require_same_user
			if current_user != current_user.admin?
				flash[:danger] = "You can not edit books"
				redirect_to root_path
			end
		end

end
