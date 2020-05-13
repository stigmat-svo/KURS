list = %w[масло молоко хлопья картошка курица помидоры]
puts 'Нужно купить:'
puts list.join(', ')
until list.empty?
  puts 'Что купили:'
  product = gets.chomp
  if list.delete(product)
    puts 'Нужно еще купить: '
    puts list.join(', ')
  else
    puts 'Такого продукта нет в Вашем списке!'
    puts "Осталось купить: #{list.join(', ')}."
  end
end
puts 'Вы все купили!'
