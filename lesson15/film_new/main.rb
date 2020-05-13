require_relative 'lib/film'
require_relative 'lib/film_collection'

path_files = Dir["#{__dir__}/data/*.txt"]

film_base = path_files.map do |path|
  line = File.readlines(path, chomp: true)
  Film.new(line[0], line[1], line[2])
end

list_of_choice = FilmCollection.new(film_base)

puts "Программа «Фильм на вечер»"
puts

list_of_choice.dir_list.each_with_index do |person, index|
  puts "#{index + 1}. #{person}"
end

puts "\nФильм какого режиссера вы хотите сегодня посмотреть?"

choice = STDIN.gets.to_i

puts "\nИ сегодня вечером рекомендую посмотреть:"

puts "#{list_of_choice.mov_list(choice)}"
