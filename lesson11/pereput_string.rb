def shuffle(word)
  word.downcase.chars.shuffle.join
end

puts 'Введите слово:'
word = gets.chomp
puts
puts shuffle(word)
