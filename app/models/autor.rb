class Autor < ApplicationRecord
	has_many :books

	def name_with_initial
    "#{last_name} #{name}"
  end
end
