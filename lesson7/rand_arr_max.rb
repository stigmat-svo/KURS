array = []
puts 'Введите длину массива: '
n = gets.to_i
x = 0
while x < n
  array << rand(101)
  x += 1
end
puts array.to_s
max = 0
for item in array do
  max = item if item > max
end
puts "Наибольший элемент массива: #{max}"
