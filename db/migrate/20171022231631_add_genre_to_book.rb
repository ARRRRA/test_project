class AddGenreToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :genre, :string
    add_column :books, :descriptions, :text
    add_column :books, :treasure, :string
  end
end
