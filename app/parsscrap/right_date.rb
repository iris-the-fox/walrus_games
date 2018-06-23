require 'date'

def right_date(someday)
  if someday == 'Сегодня'
    someday = Date.today
  elsif someday =='Вчера'
    someday = Date.today
    someday -=1
  else

    month = {"января" => 1,
         "февраля" => 2,
         "марта" => 3,
         "апреля" => 4,
         "мая" => 5,
         "июня" => 6,
         "июля" => 7,
       "августа" => 8,
        "сентября" => 9,
        "октября" => 10,
        "ноября" => 11,
        "декабря" => 12}
        mass = someday.split
        mass[1] = month[mass[1]]
        mass.reverse!
        Date.new(mass[0].to_i,mass[1],mass[2].to_i) 
  end
end

#puts right_date('Сегодня')
#puts right_date('Вчера')
#puts right_date ('15 ноября 2018')
