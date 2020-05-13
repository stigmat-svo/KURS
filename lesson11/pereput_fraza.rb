def shuffle_letters(word)
  word.downcase.chars.shuffle.join
end

def shuffle_phrase(phrase)
  words = phrase.split

  result = []
  words.each do |word|
    result << shuffle_letters(word)
  end

  result.join(' ')
end

puts 'Введите фразу:'
word = gets.chomp
puts

puts shuffle_phrase(word)
