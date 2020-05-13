require 'rexml/document'
require 'date'

puts "На что потратить деньги?"
expense_text = STDIN.gets.strip

puts "Сколько потратить денег?"
expense_amount = STDIN.gets.strip.to_i

puts "Укажите дату траты в формате ДД.ММ.ГГГГ, пустое поле - сегодня"
date_input = STDIN.gets.strip

expense_date = nil

if date_input == ""
  expense_date = Date.today
else
  expense_date = Date.parse(date_input)
end

puts "В какую категорию занести трату?"
expense_category = STDIN.gets.strip

path = File.dirname(__FILE__)
file_name = path + "/my_expenses.xml"

file = File.new(file_name, "r:UTF-8")

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  puts "Проблема в XML файле!"
  abort e.message
end

file.close

expenses = doc.elements.find("expenses").first

expense = expenses.add_element "expense", {
  "amount" => expense_amount,
  "category" => expense_category,
  "date" => expense_date.to_s
}

expense.text = expense_text

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts "Запись успешно сохранена."






