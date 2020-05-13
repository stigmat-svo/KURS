puts "Введите строку с хэштегами:"

str = STDIN.gets.encode("UTF-8").strip

template = /#[[:word:]-]+/

hash = str.scan(template)

puts
puts "Нашли вот такие хэштеги: #{hash.join(", ")}"
