class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name_g
      t.string :developer
      t.string :release_date
      t.string :genre
      t.string :description
      t.string :trailer
      t.string :platform
      t.boolean :wanna_play

      t.timestamps null: false
    end
  end
end
