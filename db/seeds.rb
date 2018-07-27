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


	

