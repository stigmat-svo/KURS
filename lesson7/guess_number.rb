puts 'Загадано число от 0 до 15, отгадайте какое?'
target = rand(16)
3.times do
  guess = gets.to_i
  if guess == target
    puts 'Ура! Вы выиграли!'
    exit
  end
  if (guess - target).abs < 3
    puts 'Тепло'
  else
    puts 'Холодно'
  end
  if guess > target
    puts 'Нужно меньше'
  else
    puts 'Нужно больше'
  end
end
puts "Вы проиграли! Было загадано число #{target}"
gets
