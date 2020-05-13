require_relative 'lib/thing'
require_relative 'lib/thing_collection'
require 'rexml/document'

collection = ThingCollection.from_dir(__dir__)

puts "Сколько градусов за окном? (можно с минусом)"
temp = STDIN.gets.to_i

recommendation = collection.type_for_temp(temp)

if recommendation.empty?
  puts "Для такой температуры у вас нет одежды."
else
  puts "Предлагаем сегодня надеть:"

  recommendation.each do |item|
    puts item
  end
end


