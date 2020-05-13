if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'net/http'
require 'uri'
require 'rexml/document'
require_relative 'lib/forecast'

# Словарик городов, собранных с сайта метеосервиса. Можно написать код, который
# будет собирать все города и их названия с сайта автоматически, но мы пока
# этого делать не будем. При необходимости добавляйте свои города руками.
CITIES = {
  14 => 'Донецк',
  9083 => 'Дебальцево',
  9018 => 'Енакиево',
  24276 => 'Иловайск',
  9068 => 'Макеевка',
  9098 => 'Докучаевск',
  23736 => 'Новоазовск',
  33 => 'Мариуполь'
}.invert.freeze

# Сделаем массив из названий городов, взяв ключи массива CITIES
city_names = CITIES.keys

# Спрашиваем у пользователя, какой город по порядку ему нужен
puts 'Погоду для какого города Вы хотите узнать?'
puts
city_names.each.with_index(1) { |name, index| puts "#{index}: #{name}" }
puts "\nВыберите город:"
print ">>"
city_index = gets.to_i
unless city_index.between?(1, city_names.size)
  puts "\nВведите число от 1 до #{city_names.size}"
  print ">>"
  city_index = gets.to_i
end

# Когда, наконец, получим нужный индекс, достаем city_id
city_id = CITIES[city_names[city_index - 1]]

# Сформировали адрес запроса
url = "https://xml.meteoservice.ru/export/gismeteo/point/#{city_id}.xml"

response = Net::HTTP.get_response(URI.parse(url))

doc = REXML::Document.new(response.body)

date = Date.today

city_name = URI.decode_www_form_component(doc.root.elements['REPORT/TOWN'].attributes['sname'])

# Достаем все XML-теги <FORECAST> внутри тега <TOWN> и преобразуем их в массив
forecast_nodes = doc.root.elements['REPORT/TOWN'].elements.to_a

# Выводим название города и все прогнозы по порядку
puts "\nМестоположение: #{city_name}."
puts
puts "Прогноз погоды на #{date.strftime('%d.%m.%Y')}."
puts

forecast_nodes.each do |node|
  puts Forecast.from_xml(node)
  puts
end

gets
