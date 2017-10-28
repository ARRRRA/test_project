class AddCountAndAvailableToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :count, :integer
    add_column :books, :available, :integer
  end
end
