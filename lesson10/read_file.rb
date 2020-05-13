current_path = File.dirname(__FILE__)
file_path = current_path + '/data/file.txt'

if File.exist?(file_path)
  file = File.new(file_path, 'r:UTF-8')
  line = file.readlines
  puts line
else
  puts 'Файл не найден'
end
