def balance(kurs_valuti, dollar, rub)
  ((dollar - rub / kurs_valuti) / 2).abs
end

puts 'Курс доллара:'
kurs_valuti = gets.to_f
puts 'Сколько у вас рублей?'
rub = gets.to_f
puts 'Сколько у вас долларов?'
dollar = gets.to_f

result = balance(kurs_valuti, dollar, rub)

if result < 0.01
  puts 'Портфель сбалансирован. Ничего менять не нужно.'
elsif result > 0
  puts "Нужно купить #{format('%.2f', result)} долларов."
else
  puts "Нужно продать #{format('%.2f', result)} долларов."
end
