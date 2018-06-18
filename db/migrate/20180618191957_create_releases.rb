class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :game_n
      t.date :date
      t.string :platform
      t.string :note
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
