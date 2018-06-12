require 'open-uri'
require 'nokogiri'
require 'json'

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


games = []

doc.css('tr').each do |game|
if game.css("td")[0]===nil
  puts "ololololololo"
else
  name_g = game.css("td")[0].text
  developer = game.css("td")[1].text
  release_date = game.css("td")[2].text
  genre = game.css("td")[0].text
  description = game.css("td")[0].text
  trailer = game.css("td")[0].text
games.push(
  name_g: name_g,
  developer: developer,
  release_date: release_date,
  genre: genre,
  description: description,
  trailer: trailer)
end
end

puts JSON.pretty_generate(games)
