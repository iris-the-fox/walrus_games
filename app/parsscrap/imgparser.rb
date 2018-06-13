require 'open-uri'
require 'nokogiri'
require 'json'
require_relative '../../config/environment'

    

  def get_image(someurl)
    url = someurl
    html = open(url)
    doc = Nokogiri::HTML(html)

    images=[]
    doc.css('div').each do |i|
      i.css('img').each do |k|
    #puts k["data-thumb"]
    #puts k["data-thumb"].class
      images.push (k["data-thumb"] )
      end
    end
    @image=images[1]
    
  end



get_image("https://www.youtube.com/watch?v=JM_UdSUW1ao")
