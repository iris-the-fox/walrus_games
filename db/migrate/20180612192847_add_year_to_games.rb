class AddYearToGames < ActiveRecord::Migration
  def change
    add_column :games, :year, :integer, default:2018
  end
end
