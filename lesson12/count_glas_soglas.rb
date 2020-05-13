def count(word)
  glas = %w[а у о ы и э я ю ё е]
  letters = word.chars
  result = 0
  letters.each do |item|
    result += 1 if glas.include?(item)
  end
  result
end

def count_all(word)
  glas_count = count(word)
  [glas_count, word.length - glas_count]
end

puts 'Введите слово:'
word = gets.chomp.downcase
puts
result = count_all(word)
puts "Гласных: #{result[0]}"
puts "Согласных: #{result[1]}"
