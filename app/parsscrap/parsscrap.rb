require 'open-uri'
require 'nokogiri'
require 'json'
require_relative '../../config/environment'

url = 'https://www.finder.com.au/e3-2018-ps4-games'
html = open(url)


doc = Nokogiri::HTML(html)
=begin
doc.css('tr')[1].css('td').each do |i|
  puts i.text
end

allgames=doc.css('tr')
puts allgames.class

doc.css('tr').each do |game|
  if game.css("td")[0]===nil
    puts "ololololololo"
  else
  puts game.css("td")[0].text
  #a=game.css("td")[0]
  #puts a.text
  puts "---------"
end
end
=end

Game.destroy_all

games = []

doc.css('tr').each do |game|
  if game.css("td")[0]===nil
    puts "ololololololo"
  else
    name_g = game.css("td")[0].text
    developer = game.css("td")[1].text
    release_date = game.css("td")[2].text
    genre = game.css("td")[3].text
    description = game.css("td")[4].text
  
    ff = game.css("td")[5].css("a")[0]["id"]
    trailer = "https://www.youtube.com/watch?v=#{ff}"
 
    games.push(
      name_g: name_g,
      developer: developer,
      release_date: release_date,
      genre: genre,
      description: description,
      trailer: trailer)
  end
end
puts "___"
puts games[0]
puts games[0][:name_g]
puts games[0][:trailer]


games.each do |i|
  Game.create(name_g:i[:name_g], developer:i[:developer], release_date:i[:release_date], genre:i[:genre], description:i[:description], trailer:i[:trailer], platform:"PlayStation 4", wanna_play:true)
end

