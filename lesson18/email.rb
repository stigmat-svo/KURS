puts "Введите email:"

template = /^[a-z*\.]+[a-z*]+@[a-z*\.]+[a-z*]/m
email = STDIN.gets.strip

if email.match(template)
  puts "Это email!"
else
  puts "Это не email!"
end


