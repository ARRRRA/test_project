class Book < ApplicationRecord


	belongs_to :autor

	validates :name, :autor_id, :genre, :descriptions, :treasure, presence: true


	def self.search(search)
		if search
   			self.where("name like ?", "%#{search}%")
    	else
    		self.all
  		end
	end

end
