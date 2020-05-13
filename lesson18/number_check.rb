puts "Введите номер телефона:"

template = /^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$/
number = STDIN.gets.strip

if number.match(template)
  puts "Спасибо!"
else
  puts "Это не номер телефона"
end
