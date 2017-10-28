class AddAutorToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :autor_id, :integer
  end
end
