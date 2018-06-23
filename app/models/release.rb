class Release < ActiveRecord::Base
  belongs_to :game
  validates :game_n, uniqueness: true
end
