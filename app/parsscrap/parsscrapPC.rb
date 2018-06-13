require 'open-uri'
require 'nokogiri'
require 'json'
require_relative '../../config/environment'

url = 'https://www.finder.com.au/e3-2018-pc-games'
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
    genre = game.css("td")[3].text
    description = game.css("td")[4].text
    ff = game.css("td")[5].css("a")[0]["id"]
    trailer = "https://www.youtube.com/watch?v=#{ff}"
    
     
    som=Game.where(:name_g => name_g).pluck(:name_g)
    somels=Game.where(:name_g => name_g).pluck(:platform)

    if som.include?(name_g)
      Game.find_by(:name_g => name_g).update(release_date_PC: release_date)
      
      if somels.include?("PlayStation 4, Xbox One")
        puts "уже есть в двух платформах #{name_g}"
        Game.find_by(:name_g => name_g).update(platform: "PlayStation 4, Xbox One, PC")
      elsif somels.include?("Xbox One")
        puts "уже есть в Xbox #{name_g}"
        Game.find_by(:name_g => name_g).update(platform: "Xbox One, PC")
      elsif somels.include?("PlayStation 4")
        puts "уже есть в PlayStation #{name_g}"
        Game.find_by(:name_g => name_g).update(platform: "PlayStation 4, PC")
      else
        puts "новое #{name_g}"
      end

    else
      
      games.push(
        name_g: name_g,
        developer: developer,
        release_date: release_date,
        genre: genre,
        description: description,
        trailer: trailer)

    end

  end
end

=begin
puts "___"
puts games[0]
puts games[0][:name_g]
puts games[0][:trailer]

=end

games.each do |i|
  Game.create(name_g:i[:name_g], developer:i[:developer], release_date_PC:i[:release_date], genre:i[:genre], description:i[:description], trailer:i[:trailer], platform:"PC", wanna_play:true)
end


