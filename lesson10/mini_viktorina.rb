list = Dir['data/*']

puts 'Какой файл вам показать? (Введите номер)'
list.each_with_index do |file, index|
  puts "#{index}: #{file}"
end

input = gets.to_i
puts
file_name = list[input]
file = File.open(file_name, 'r:UTF-8') do |f|
  puts f.read
end
