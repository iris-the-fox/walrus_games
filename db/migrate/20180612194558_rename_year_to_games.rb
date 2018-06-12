class RenameYearToGames < ActiveRecord::Migration
  def change
  	remove_column :games, :year
  	add_column :games, :date_added, :date, {default:"12.06.2018"}
  end
end
