class CreateAutors < ActiveRecord::Migration[5.1]
  def change
    create_table :autors do |t|
      t.string :last_name
      t.string :name
      t.integer :year_of_birth
      t.integer :year_of_death

      t.timestamps
    end
  end
end
