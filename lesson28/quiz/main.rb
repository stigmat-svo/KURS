require_relative "lib/question"
require "rexml/document"
require "timeout"

puts "Мини-викторина. Ответьте на вопросы."
puts "\nНа ответ у вас есть 20 секунд."

path = "#{__dir__}/data/quiz.xml"
file = File.new(path)
doc = REXML::Document.new(file)
file.close
questions = []

abort "Не найден файл для чтения!" unless File.exist?(path)

doc.root.each_element("//question") do |element|
  variants = []
  quest = element.elements["text"].text
  answer = element.elements["variants/variant[@right]"].text
  points = element.attributes["points"]
  time_off = element.attributes["seconds"]

  element.elements.each("variants/variant") do |item|
    variants << item.text
  end

  questions << Question.new(quest, answer, points.to_i, time_off.to_i, variants.shuffle)
end

total = 0
ok_answer = 0
questions = questions.sample(5)

questions.each do |question|
  puts question
  question.variants.each.with_index(1) do |var, index|
    puts "#{index}. #{var}"
  end
  user_answer = nil
  begin
    Timeout::timeout(question.time_off) do
      print "\n>> "
      user_answer = STDIN.gets.to_i
    end
  rescue Timeout::Error
    puts "Увы! Время истекло!"
    exit
  end

  if question.variants[user_answer - 1] == question.answer
    ok_answer += 1
    total += question.points
    puts "Верный ответ."
  else
    puts "Не правильно. Правильный ответ - #{question.answer}."
  end
end

puts "\nПравильных ответов: #{ok_answer} из #{questions.size}."
puts "Вы набрали #{total} баллов."





