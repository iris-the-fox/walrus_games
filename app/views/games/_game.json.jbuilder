json.extract! game, :id, :name_g, :developer, :release_date, :genre, :description, :trailer, :platform, :wanna_play, :created_at, :updated_at
json.url game_url(game, format: :json)
