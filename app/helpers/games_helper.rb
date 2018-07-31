require 'open-uri'
require 'nokogiri'
require 'json'
require_relative '../../config/environment'

    

module GamesHelper

  def release_date(i)
  	dates = [i.release_date_PS4, i.release_date_Xbox, i.release_date_PC, i.release_date_NS] 
      if dates[0].nil? or dates[0] == ""
        if dates[1].nil? or dates[1] == ""
          if dates[2].nil? or dates[2] == ""
            release_date = dates[3] 
          else release_date = dates[2] 
          end 
        else release_date = dates[1] 
        end 
     else release_date = dates[0] 
     end
 end

def get_image(someurl)
    url = someurl
    html = open(url)
    doc = Nokogiri::HTML(html)

    images=[]
    doc.css('div').each do |i|
      i.css('img').each do |k|
    #puts k["data-thumb"]
    #puts k.class
      images.push (k["data-thumb"] )
      end
    end
    @image=images[1]
    
  end

end



  



