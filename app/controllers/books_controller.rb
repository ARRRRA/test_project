class BooksController < ApplicationController

	before_action :set_book, only: [:show, :edit, :update, :destroy]

  	before_action :authenticate_admin!, :except => [:index, :show]



	def index
		#@books = Book.search(params[:search])
		@books = Book.search(params[:term])


		if user_signed_in? && current_user.admin
				redirect_to index_admin_books_url
		end
	end

	def import
	  Book.import(params[:file])

	  redirect_to root_url, notice: 'Book imported.'
	end

	def index_admin
		@books = Book.all
	end

	def show

	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to @book, success: 'Book create'
		else
			render :new, danger: 'Book don`t create'
		end
	end

	def edit

	end

	def update
		if @book.update_attributes(book_params)
			redirect_to @book, success: 'Book update'
		else
			render :edit, danger: 'Book don`t update'
		end
	end

	def destroy
		@book.destroy
		redirect_to books_path, success: 'Book delete'
	end



	private

	def set_book
		@book = Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:name, :autor_id, :genre, :descriptions, :treasure, :available)
	end

	def authenticate_admin!
		if user_signed_in?
	    	# check if current user is admin
	    	unless current_user.admin
	      	# if current_user is not admin redirect to some route
	      	redirect_to books_url
	    	end
	    	# if current_user is admin he will proceed to edit action
	    else
	    	redirect_to books_url
	    end
  	end
end