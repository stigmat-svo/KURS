names = []
input = nil

while input != ''
  input = gets.chomp
  names << input
end

for item in names do
  puts 'С нами ' + item
  sleep 1

  next unless item == 'Элис'
  puts 'Элис?? Кто такая Элис?'
  sleep 3
  break
end

puts 'А что это за девочка и где она живет?'
sleep 2
puts 'А вдруг она не курит, а вдруг она не пьет?'
sleep 2
puts 'Ну а мы в такой компании возьмем да и припремся к Элис.'
