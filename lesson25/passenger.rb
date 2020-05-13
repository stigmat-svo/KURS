pass = [
  {"ticket_num" => "РМ2010398 050298",
   "sending_point" => "Москва",
   "destination" => "Петушки",
   "name" => "Венедикт",
   "f_name" => "В.",
   "surname" => "Ерофеев",
   "passport" => "45 99 505281"},

  {"ticket_num" => "РМ2010399 050298",
   "sending_point" => "Павловский Посад",
   "destination" => "Орехово-Зуево",
   "name" => "Иннокентий",
   "f_name" => "П.",
   "surname" => "Шниперсон",
   "passport" => "46 01 192872"},

  {"ticket_num" => "РМ2010399 050298",
   "sending_point" => "Москва",
   "destination" => "Владимир",
   "name" => "Иван",
   "f_name" => "В.",
   "surname" => "Бунша",
   "passport" => "47 33 912876"}
]

puts "Пассажиры поезда Москва — Петушки"
puts

pass.each_with_index do |passenger, number|
  puts "* * * Место № #{number + 1} * * *"
  puts "Билет № #{passenger["ticket_num"]}"
  puts "Маршрут: #{passenger["sending_point"]} - #{passenger["destination"]}"
  puts "Пассажир: #{passenger["name"]} #{passenger["f_name"]} #{passenger["surname"]}"
  puts "Паспорт: #{passenger["passport"]}"
  puts
end
