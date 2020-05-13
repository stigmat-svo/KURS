require "rexml/document"

current_path = File.dirname(__FILE__)
file_name = current_path + "/data.xml"

abort "Не найден файл для чтения!" unless File.exist?(file_name)

file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

card = {}

["name", "phone", "email", "about"].each do |line|
  card[line] = doc.root.elements[line].text
end


puts "┌──────────────────────────────┐"
puts "│   #{card["name"]}  │"
puts "│        #{card["phone"]}         │"
puts "│    #{card["email"]}     │"
puts "│#{card["about"]}│"
puts "└──────────────────────────────┘"
