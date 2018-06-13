module GamesHelper

  def release_date(i)
  	dates = [i.release_date_PS4, i.release_date_Xbox, i.release_date_PC, i.release_date_NS] 
      if dates[0].nil? 
        if dates[1].nil? 
          if dates[2].nil? 
            release_date = dates[3] 
          else release_date = dates[2] 
          end 
        else release_date = dates[1] 
        end 
     else release_date = dates[0] 
     end
 end


end
