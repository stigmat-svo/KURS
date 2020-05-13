puts 'Введите строку, которую надо проверить на «палиндромность»:'
original = gets.strip.downcase.gsub(/[^a-zа-яё]+/iu, '')
polindrom = original.reverse
if original == polindrom
  puts 'Да, это палиндром!'
else
  puts 'Нет, это не палиндром!'
end
