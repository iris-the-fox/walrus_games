# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
users = User.create! [
  { username: "iris", password: "123456" },
  { username: "loki", password: "987654" }
]
=end


def hashing(string)
	a = string.split("||")
	if a.count == 4 
    h = {:game_n => a[0], :date => a[1],  :link => a[2], :platform => a[3], :note => ''} 
  else
    h = {:game_n => a[0], :date => a[1],  :link => a[2], :platform => a[6], :note => 'addon'} 
  end
end

def hashing_game(string)
  a = string.split("||")
    h = {
      :name_g => a[0],:developer => a[1],:release_date_PS4 => a[2],:release_date_NS => a[3],:release_date_PC => a[4],
      :release_date_Xbox => a[5],:genre => a[6],:description => a[7],:trailer => a[8],:platform => a[9]
      }
end

Game.destroy_all

games = File.open('games.txt', "r").each do |line| 
  
  h = hashing_game(line)
  g = Game.create(
      name_g:h[:name_g],developer:h[:developer],release_date_PS4:h[:release_date_PS4],
      release_date_NS:h[:release_date_NS], release_date_PC:h[:release_date_PC],
      release_date_Xbox:h[:release_date_Xbox],genre:h[:genre], description:h[:description],
      trailer:h[:trailer],platform:h[:platform])

end

Release.destroy_all

releases = File.open('releases.txt', "r").each do |line| 
	
	h = hashing(line)
	

  check_match = Game.where(name_g:h[:game_n])

  if check_match.first.nil? 
    Release.create(game_n:h[:game_n], date:h[:date], link:h[:link], platform:h[:platform], note:h[:note])
    #puts "Ждём"
  else
    foreign_key = check_match.pluck(:id)
    #puts "вышло"
    foreign_key = foreign_key.join.to_i
    r = Release.create(game_n:h[:game_n], date:h[:date], link:h[:link], platform:h[:platform], game_id:foreign_key, note:h[:note])
    #puts r.game_id
   end
 
end


	

