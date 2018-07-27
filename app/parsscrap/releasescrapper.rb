require 'open-uri'
require 'nokogiri'
require 'json'
 require_relative '../../config/environment'
require_relative './right_date'

url = 'http://ru.riotpixels.com/games/filter/recent/page-2/'
html = open(url)


doc = Nokogiri::HTML(html)


#Release.destroy_all


=begin
doc.css("table.table-games-list-3-columns").css("tr").each do |row|
  row.css("td").each do |i|
    i.css("a").each do |a|
      puts a['href']
    end
  end
end





games.each do |i|
  Game.create(game_n:i[:game_n], developer:i[:developer], release_date_PS4:i[:release_date], genre:i[:genre], description:i[:description], trailer:i[:trailer], platform:"PlayStation 4", wanna_play:true)
end
  
=end

releases = []
platform = []
yourfile = 'releases.txt'
doc.css("table.table-games-list-3-columns").css("tr").each do |row|
 
  if row.css("td")[0]===nil
    puts "ololololololo"
  
  else
    
    date = right_date(row.css("td")[0].text)
            
    row.css("td").each do |i|
    
      if i.attr('class')=='is-addon-cell'
        #puts 'this is addon i dont want it'
        File.open('addons.txt', "a") { |f| f << i } 
        break
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

                game_n = a.text
                link = a['href']
                puts date
                puts game_n
                puts link
                #puts platform.class
                
                releases.push(
                game_n: game_n,
                platform: platform,
                date: date,
                link: link) unless releases.include?(game_n: game_n,
                platform: platform,
                date: date,
                link: link)
                File.open(yourfile, "a") { |f| f << ("#{game_n}||#{platform}||#{date}||#{link}\n")}
                # unless releases.include?(game_n: game_n, 
                 # platform: platform, 
                 # date: date,
                #link: link) } 
                 
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
puts releases[0]
puts releases[1]
puts releases[2]
puts releases[60]


=begin
releases = releases.uniq
releases.each do |i|
  check_match = Game.where(game_n:i[:game_n])

  if check_match.first.nil? 
    Release.create(game_n:i[:game_n], date:i[:date], link:i[:link], platform:i[:platform])
    puts "Ждём"
  else
    foreign_key = check_match.pluck(:id)
    puts "вышло"
    puts foreign_key = foreign_key.join.to_i
    r = Release.create(game_n:i[:game_n], date:i[:date], link:i[:link], platform:i[:platform], game_id:foreign_key)
    puts r.game_id
    

  end
    
end
=end