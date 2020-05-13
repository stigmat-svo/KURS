def currency_to_exchange(rub, usd, usd_rate)
  ((rub / usd_rate - usd) / 2).round(2)
end

puts 'Сколько у вас долларов?'
usd = gets.to_f
puts 'Сколько у вас рублей?'
rub = gets.to_f
puts 'Какой сейчас курс доллара?'
usd_rate = gets.to_f

amount_to_exchange = currency_to_exchange(rub, usd, usd_rate)
if amount_to_exchange.zero?
  puts 'Ваш портфель сбалансирован!'
elsif amount_to_exchange.positive?
  puts "Вам надо купить #{amount_to_exchange}$"
else
  puts "Вам надо продать #{amount_to_exchange.abs}$"
end
