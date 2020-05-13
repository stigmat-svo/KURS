array = []
puts 'Введите N: '
n = gets.to_i
x = 0
sum = 0
while x < n
  x += 1
  sum += x
  array << x
end
puts array.to_s
puts "Сумма чисел: #{sum}"
gets
