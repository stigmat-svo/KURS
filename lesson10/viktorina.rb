path_files = Dir["#{__dir__}/data/*.txt"]
questions = path_files.map { |path| File.readlines(path, chomp: true) }

quest_data = questions.sample(3)
total = 0

quest_data.each do |quest, answer|
  puts quest
  user_answer = STDIN.gets.strip

  if user_answer == answer
    total += 1
    puts 'Верный ответ!'
  else
    puts "Неправильно. Правильный ответ: #{answer}"
  end
end

puts "Правильных ответов: #{total} из 3"
