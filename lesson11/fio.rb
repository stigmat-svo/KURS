def initials(name, father_name)
  "#{name[0]}.#{father_name[0]}."
end

puts 'Введите фамилию:'
surname = gets.chomp
puts 'Введите имя:'
name = gets.chomp
puts 'Введите отчество:'
father_name = gets.chomp

puts 'Ваше ФИО сокращенно:'
puts "#{surname} #{initials(name, father_name)}"
