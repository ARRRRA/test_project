class RemoveCountFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :count, :integer
  end
end
