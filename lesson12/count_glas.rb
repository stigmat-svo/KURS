def count(word)
  glas = %w[а у о ы и э я ю ё е]
  word = word.chars
  amount = []
  word.each do |item|
    amount << item if glas.include?(item)
  end
  amount.size
end

puts 'Введите слово:'
word = gets.chomp.downcase
puts "Гласных: #{count(word)}"
