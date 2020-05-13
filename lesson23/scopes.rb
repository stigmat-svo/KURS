def method
  c = 10

  puts "Переменная '$a': #{defined?($a)}"
  puts "Переменная 'b': #{defined?(b)}"
  puts "Переменная 'c': #{defined?(c)}"
end

$a = 5
b = 6

method

puts "Переменная '$a': #{defined?($a)}"
puts "Переменная 'b': #{defined?(b)}"
puts "Переменная 'c': #{defined?(c)}"
