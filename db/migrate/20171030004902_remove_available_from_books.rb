class RemoveAvailableFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :available, :integer
  end
end
