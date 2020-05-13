require 'rexml/document'
require 'date'

puts "В этом сундуке хранятся ваши желания."
puts "Чего бы вы хотели?\n\n"

wish_text = STDIN.gets.strip

puts "До какого числа вы хотите осуществить это желание?
(укажите дату в формате ДД.ММ.ГГГГ)"

date_input = STDIN.gets.strip

wish_date = nil

if date_input == ""
  wish_date = Date.today
else
  wish_date = Date.parse(date_input)
end

path = File.dirname(__FILE__)
file_name = path + "/wish.xml"

file = File.new(file_name, "r:UTF-8")

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  puts "Проблема в XML файле!"
  abort e.message
end

file.close

wishes = doc.elements.find("wishes").first

wish = wishes.add_element "wish", {
  "date" => wish_date.to_s
}

wish.text = wish_text

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts "Ваше желание в сундуке."


