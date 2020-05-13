puts 'Курс доллара:'
kurs_valuti = gets.to_f

puts 'Сколько у вас рублей?'
rub = gets.to_f

puts 'Сколько у вас долларов?'
dollar = gets.to_f

rub_dollar = rub / kurs_valuti

difference = ((dollar - rub_dollar) / 2).abs

if difference < 0.01
  puts 'Портфель сбалансирован. Ничего менять не нужно.'
elsif rub_dollar > dollar
  puts "Нужно купить #{format('%.2f', difference)} долларов."
else
  puts "Нужно продать #{format('%.2f', difference)} долларов."
end
