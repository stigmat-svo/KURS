day = Time.now
week_day = day.wday

path_file = File.dirname(__FILE__ ) + "/data/holidays.txt"
file = File.new(path_file, "r:UTF-8")

holidays = file.readlines
file.close

holidays.map do |day|
  day.chomp!
end

date = day.strftime("%d.%m")

result = case
when holidays.include?(date)
  "Сегодня государственный праздник! Отдыхай..."
when week_day == 0 || week_day == 6
  'Сегодня выходной день, отдыхай!'
else
  'Сегодня будний день, иди на работу!'
end

puts result












