require 'json'

file = File.read("table.json", encoding: "UTF-8")
data = JSON.parse(file)

puts "У нас всего элементов: #{data.keys.size}"
puts "\nЭлементы: (#{data.keys.join(", ")})"

puts "\nО каком элементе хотите узнать?"
print ">>"

element = gets.strip.capitalize

if data.key?(element)
  item = data[element]

  puts "\nПорядковый номер: #{item["number"]}"
  puts "Название: #{item["name"]}"
  puts "Первооткрыватель: #{item["discoverer"]} (#{item["year"]} г.)"
  puts "Плотность: #{item["density"]} г/см³"
else
  puts "Извините, про такой элемент мы еще не знаем."
end
