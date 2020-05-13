puts "Какая у вас на руках валюта?
  1. Рубли
  2. Доллары"
choise = gets.to_i
if choise == 1
  puts 'Сколько сейчас стоит 1 доллар?'
  dollar = gets.to_f
  puts 'Сколько  у вас рублей?'
  rub = gets.to_i
  result = rub / dollar
  puts "Ваши запасы равны: #{result.round(2)} долларов."
else
  puts 'Сколько сейчас стоит 1 доллар?'
  dollar = gets.to_f
  puts 'Сколько  у вас долларов?'
  rub = gets.to_i
  result = rub * dollar
  puts "Ваши запасы равны: #{result.round(2)} рублей."
end
