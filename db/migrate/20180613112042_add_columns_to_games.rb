class AddColumnsToGames < ActiveRecord::Migration
  def change
  	remove_column :games, :release_date
  	add_column :games, :release_date_PS4, :string
  	add_column :games, :release_date_Xbox, :string
  	add_column :games, :release_date_PC, :string
  	add_column :games, :release_date_NS, :string
  	add_column :games, :note, :string
  end
end
