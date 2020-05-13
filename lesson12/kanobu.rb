def who_won(user_choice, comp_choice, win_conditions)
  return 0 if user_choice == comp_choice

  code = "#{user_choice}#{comp_choice}"

  win_condition = win_conditions.include?(code)

  return 1 if win_condition

  2
end

variants = %w[камень ножницы бумага]
win_conditions = %w[01 12 20]

10.times do
  puts 'Введите вариант:'

  variants.each_with_index do |variants, index|
    puts "#{index} - #{variants}"
  end

  user_choice = gets.to_i
  comp_choice = rand(variants.size)

  user_text = variants[user_choice]
  puts "Вы выбрали #{user_text}"

  comp_text = variants[comp_choice]
  puts "Компьютер выбрал #{comp_text}"

  case who_won(user_choice, comp_choice, win_conditions)
  when 0 then
    puts 'Ничья!'
  when 1 then
    puts 'Вы победили!'
  when 2 then
    puts 'Компьютер победил!'
  end
  puts
end
