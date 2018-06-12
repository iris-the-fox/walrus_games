json.extract! book, :id, :autor, :name, :year, :genre, :reading_time, :rate, :created_at, :updated_at
json.url book_url(book, format: :json)
