class Search < ApplicationRecord
	


	def books
		@books ||= find_books
	end



private

	def find_books
		books = Book.all
		books = books.where("name LIKE ?", "%#{keywords}%") if keywords.present?
		books = books.where("autor_id LIKE ?", "%#{autor_id}%") if autor_id.present?
		books = books.where("genre LIKE ?", "%#{genre}%") if genre.present?
		books = books.where("treasure LIKE ?", "%#{treasure}%") if treasure.present?
		return books
	end
end
