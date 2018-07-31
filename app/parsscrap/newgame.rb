 require_relative '../../config/environment'
 yourfile = 'games.txt'
 Game.all.each do |g|
   
   File.open(yourfile, "a") do |f| 
     f << ("#{g.name_g}||#{g.developer}||#{g.release_date_PS4}||#{g.release_date_NS}||#{g.release_date_PC}||#{g.release_date_Xbox}||#{g.genre}||#{g.description}||#{g.trailer}||#{g.platform}\n")
   	
   end
end