class Question
  def initialize(quest, answer, points)
    @quest = quest
    @answer = answer
    @points = points
  end

  attr_reader :quest

  attr_reader :answer

  attr_reader :points

  def inclination(points, singular, singular_rod, plural_rod)
    modul = points % 10
    modul_2 = points % 100
    if (11..14).cover?(modul_2)
      return plural_rod
    elsif modul == 1
      return singular
    elsif (2..4).cover?(modul)
      return singular_rod
    else
      return plural_rod
    end
  end

  def to_s
    "#{@quest} (#{@points} #{inclination(points, 'балл', 'балла', 'баллов')})"
  end
end

puts 'Мини-викторина. Ответьте на вопросы.'
puts

path_files = Dir.glob(File.join(__dir__, 'data', '*.txt'))

quest_random = path_files.sample(5)

quest_data = quest_random.map do |path|
  lines = File.readlines(path, chomp: true)
  Question.new(lines[0], lines[1], lines[2].to_i)
end

total = 0
ok_answer = 0

quest_data.each do |question|
  puts question
  user_answer = STDIN.gets.strip

  if user_answer == question.answer
    total += question.points
    ok_answer += 1
    puts 'Верный ответ!'
  else
    puts "Неправильно. Правильный ответ: #{question.answer}"
  end
  puts
end

puts "Правильных ответов: #{ok_answer} из #{quest_random.size}"
puts "Вы набрали #{total} баллов"
