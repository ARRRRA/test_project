class SearchesController < ApplicationController
	def new
		@search = Search.new
		@categories = Book.distinct.pluck(:autor_id)
	end

	def create
		@search = Search.create(search_params)
		
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

private
	def search_params
		params.require(:search).permit(:keywords, :autor_id, :genre, :treasure)
	end
end
