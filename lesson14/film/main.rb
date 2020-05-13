require_relative 'lib/film'

path_files = Dir["#{__dir__}/data/*.txt"]

film_base = path_files.map do |path|
  line = File.readlines(path, chomp: true)
  Movie.new(line[0], line[1], line[2])
end

ok_answer = 0
directors = film_base.map(&:director)

puts 'Добрый день, любитель кино!'
puts 'Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?'

film_base.sample(3).each do |film|
  guess_who =
    (directors.reject do |person|
      person == film.director
    end).sample(3).push(film.director).shuffle

  puts "\nКто снял '#{film.title}' (#{film.year})?"

  guess_who.each_with_index do |item, index|
    puts "#{index + 1}. #{item}"
  end

  choice = STDIN.gets.strip.to_i - 1

  case choice
  when guess_who.index(film.director)
    puts "\nВерно!"
    ok_answer += 1
  else
    puts "\nНеправильно! Правильный ответ — #{film.director}"
  end
end

puts "\nВы угадали #{ok_answer} режиссеров из #{film_base.sample(3).size}"
