class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :autor_id
      t.string :genre
      t.string :treasure

      t.timestamps
    end
  end
end
