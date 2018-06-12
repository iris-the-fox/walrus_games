class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :autor
      t.string :name
      t.integer :year
      t.string :genre
      t.integer :reading_time
      t.integer :class

      t.timestamps null: false
    end
  end
end
