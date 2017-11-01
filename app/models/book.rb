class Book < ApplicationRecord


	belongs_to :autor

	validates :name, :autor_id, :genre, :descriptions, :treasure, presence: true


	def self.search(search)
		if search
   			self.where("name like ?", "%#{search}%").where(available: true)
    	else
    		self.where(available: true)
  		end
	end


def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    book = find_by(id: row["id"]) || new
    book.attributes = row.to_hash
    book.save!
  end
end  

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
