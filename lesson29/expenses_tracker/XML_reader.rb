require 'rexml/document'
require 'date'

current_path = File.dirname(__FILE__ )
file_name = current_path + '/my_expenses.xml'

abort 'Файл my_expenses.xml не найден!' unless File.exist?(file_name)

file = File.new(file_name)

doc = REXML::Document.new(file)

amount_by_day = {}

doc.elements.each('expenses/expense') do |item|
  loss_sum = item.attributes['amount'].to_i
  loss_date = Date.parse(item.attributes['date'])

  amount_by_day[loss_date] ||= 0

  amount_by_day[loss_date] += loss_sum
end

file.close

sum_by_month = {}

current_month = amount_by_day.keys.sort[0].strftime('%B %Y')

amount_by_day.keys.sort.each do |key|
  sum_by_month[key.strftime('%B %Y')] ||= 0
  sum_by_month[key.strftime('%B %Y')] += amount_by_day[key]
end

puts "------[ #{current_month}, всего потрачено: #{sum_by_month[current_month]} р. ]------"

amount_by_day.keys.sort.each do |key|
  if key.strftime('%B %Y') != current_month
    current_month = key.strftime('%B %Y')
    puts "------[ #{current_month}, всего потрачено: #{sum_by_month[current_month]} р. ]------"
  end

  puts "#{key.day}: #{amount_by_day[key]} р."
end
