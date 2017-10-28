class BooksController < ApplicationController

	before_action :set_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.search(params[:search])
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
		params.require(:book).permit(:name, :autor_id, :genre, :descriptions, :treasure, :available, :count)
	end
end