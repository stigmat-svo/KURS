day = Time.now
week_day = day.wday
if week_day == 0 || week_day == 6
  puts 'Сегодня выходной день, отдыхай!'
else
  puts 'Сегодня будний день, иди на работу!'
end
