require 'open-uri'
require 'nokogiri'
require 'json'
require_relative '../../config/environment'
require_relative './right_date'

url = 'http://ru.riotpixels.com/games/filter/recent/'
html = open(url)


doc = Nokogiri::HTML(html)





=begin
doc.css("table.table-games-list-3-columns").css("tr").each do |row|
  row.css("td").each do |i|
    i.css("a").each do |a|
      puts a['href']
    end
  end
end





games.each do |i|
  Game.create(name_g:i[:name_g], developer:i[:developer], release_date_PS4:i[:release_date], genre:i[:genre], description:i[:description], trailer:i[:trailer], platform:"PlayStation 4", wanna_play:true)
end
  
=end

releases = []
platform = []

doc.css("table.table-games-list-3-columns").css("tr").each do |row|
 
  if row.css("td")[0]===nil
    puts "ololololololo"
  
  else
    
    date = right_date(row.css("td")[0].text)
            
    row.css("td").each do |i|
    
      if i.attr('class')=='is-addon-cell'
        puts 'this is addon i dont want it'
      else
        if i.css('i')===nil
          puts 'косяк'
        else
          z = 0
          i.css("i").each do |nn|
            
            puts z +=1
            if nn.attr('title')=='Android' || nn.attr('title')=='Microsoft Xbox One' || nn.attr('title')=='Sony PlayStation 4' || nn.attr('title')=='PC' || nn.attr('title')=='Nintendo Switch' || nn.attr('title')=='Nintendo 3DS' 
              #puts nn.attr('title')
              platform << nn.attr('title')
              print platform
              puts

              i.parent.css("a").each do |a|

                name_g = a.text
                link = a['href']
                puts date
                puts name_g
                puts link
                #puts platform.class
                releases.push(
                platform: platform,
                date: date,
                name_g: name_g,
                link: link)
              end
        

            else
              puts "Не выпущен на платформе: #{nn.attr('title')}"
            end          
          end
        end


      end
platform = []
    end
    puts "===================="
  end
end

 # puts platform = platform.join(", ")
puts releases[60]


releases.each do |i|
  

  Release.create(game_n:i[:name_g], date:i[:date], link:i[:link], platform:i[:platform])
end
