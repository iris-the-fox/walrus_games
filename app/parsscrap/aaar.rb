require 'open-uri'
require 'nokogiri'
require 'json'
 require_relative '../../config/environment'
require_relative './right_date'

url = 'http://ru.riotpixels.com/games/filter/recent/page-2/'
html = open(url)


doc = Nokogiri::HTML(html)



releases = []
platform = []
yourfile = 'releases.txt'
doc.css("table.table-games-list-3-columns").css("tr").each do |row|
 
  if row.css("td")[0]===nil
    puts "ololololololo"
  
  else
    
    date = right_date(row.css("td")[0].text)
            
    row.css("td").each do |i|
      
      i.css("a").each do |a|
        game_n = a.text
        link = a['href']
        puts date
        puts game_n
        puts link
        File.open(yourfile, "a") { |f| f << ("#{game_n}||#{date}||#{link}||")} 
      end
     
          
    end
     row.css("i").each do |nn|
            platform << nn.attr('title') unless nn.attr('class').include? "flag" or nn.attr('class').include? "inactive"
            print platform
            puts
          end
            puts "======final pl"
            print platform
            File.open(yourfile, "a") { |f| f << ("#{platform}\n")} unless platform==[]
            puts
  end
  platform = []
end


puts releases[0]
puts releases[1]
puts releases[2]
puts releases[60]

