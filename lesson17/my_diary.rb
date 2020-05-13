puts "Привет! Я - твой дневник."

path = File.dirname(__FILE__ )

line = nil
all_lines = []

while line != "end"
  line = STDIN.gets.strip
  all_lines << line
end

time = Time.now

file_name = time.strftime("%d-%m-%Y")

time_string = time.strftime("%H:%M")

separator = "------------------------------------------------"

file = File.new(path + "/" + file_name + ".xls", "a:UTF-8")
file.print("\n\r" + time_string + "\n\r")

all_lines.pop

all_lines.each do |item|
  file.puts(item)
end

file.puts (separator)

file.close

puts "Ваша запись сохранена в #{file_name}.txt"
puts "Запись сделана в #{time_string}"
puts