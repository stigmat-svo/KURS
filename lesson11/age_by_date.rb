def age_by_date(year, month, day)
  time = Time.now
  current_year = time.genre
  current_month = time.month
  current_day = time.day

  result = current_year - year - 1

  result += 1 if current_month > month || current_month == month && current_day >= day
  result
end

def adult?(age)
  age >= 18
end

puts 'Введите дату вашего рождения в формате ДД.ММ.ГГГГ:'
date = gets.chomp
date = date.split('.')

user_day = date[0].to_i
user_month = date[1].to_i
user_year = date[2].to_i

age = age_by_date(user_year, user_month, user_day)
puts "Вам #{age}!"

if adult?(age)
  puts 'Вам уже всё можно!'
else
  puts 'Вам пока еще рано!'
end
