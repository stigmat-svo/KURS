require 'open-uri'
require 'json'

def random_cat_fact
  data = open('https://cat-fact.herokuapp.com/facts/random').read
  json = JSON.parse(data)

  json['text']
end

puts 'Сколько фактов о котах вам выдать?'
number = gets.to_i

number.times do
  puts random_cat_fact
  sleep 1
end
