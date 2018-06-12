require_relative '../../config/environment'


# Use Active Record Model methods to implement the following methods.
class Gamescrapper

  #
  # Insert rows in DB
  #
  def create_game(params)
    Game.create(name_g:params[:name_g], developer:params[:developer], release_date:params[:release_date], genre:params[:genre], description:params[:description], trailer:params[:trailer], platform:"dunno", wanna_play:true)
     
  end
end


=begin
  def find_allusers(offset, limit)
      # accept offset and limit input parameters
      # use the User Model class to find all Users, ordered by `updated_at` 
      # ascending, with specified row offset and row limit
      # return a collection of User instances that represent the specified rows
      au=User.offset(offset).limit(limit).order(:updated_at)

  end

  def find_alllists(offset, limit)
      # accept offset and limit input parameters
      # use the TodoList Model class to find all TodoLists, ordered by `list_due_date` descending, with specified row offset and row limit
      # return a collection of TodoList instances that represent the specified rows
      al=TodoList.offset(offset).limit(limit).order(list_due_date: :desc)
  end

=end