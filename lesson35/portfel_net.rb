require 'net/http'
require 'rexml/document'
require 'uri'

def balance(rate, dollar, rub)
  (dollar - rub / rate) / 2
end

begin
  url = URI.parse('https://pf-soft.net/service/rates-dnr/')
  response = Net::HTTP.get_response(url)
  doc = REXML::Document.new(response.body)

  rate = doc.root.elements['Valute[@id="1"]'].elements['Value'].text.to_f

  puts "Курс доллара: #{rate}"

rescue SocketError
  puts "Нет соединения с интернетом!"
  puts "Введите курс доллара вручную:"
  rate = STDIN.gets.to_f
end


puts 'Сколько у вас рублей?'
rub = STDIN.gets.to_f
puts 'Сколько у вас долларов?'
dollar = STDIN.gets.to_f

result = balance(rate, dollar, rub).abs

if result < 0.01
  puts 'Портфель сбалансирован. Ничего менять не нужно.'
elsif result > 0
  puts "Нужно продать #{format('%.2f', result)} долларов."
else
  puts "Нужно купить #{format('%.2f', result.abs)} долларов."
end

