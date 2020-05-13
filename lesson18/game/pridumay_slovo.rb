require 'net/http'

def word_exists?(word)
  url = "https://ru.wiktionary.org/wiki/#{word}"

  wiktionary_page = Net::HTTP.get(
    URI.parse(URI.encode(url))
  ).force_encoding('UTF-8')

  if wiktionary_page =~ /текст на данной странице отсутствует/
    return false
  else
    return true
  end
end

def random_regexp_string
  patterns = ['торф', 'скат', 'свал', 'крик', 'спир']

  pattern = patterns.sample

  letter = pattern.split('').sample

  return pattern.gsub(letter, '.')
end


regexp_string = random_regexp_string

puts "Придумайте как можно больше слов, содержащих шаблон."
puts "Игра подключается к сети, и проверяет ваши варианты через Викисловарь."
puts "За каждый удачный вариант вам дается очко. За неудачный вариант минус очко."
puts
puts regexp_string.gsub(".", "*")
puts
puts "Для выхода наберите 0"
puts

count = 0

loop do
  word = STDIN.gets.chomp

  if word.downcase == "0"
    break
  end

  if word_exists?(word)
    if word =~ /#{regexp_string}/
      puts ".. OK =)"
      count += 1
      puts "Ваш счет #{count}."
    else
      puts ".. неа =("
      puts "Ваш счет #{count - 1}."
    end
  else
    puts "Нет такого слова в Викисловаре"
  end
end

puts "Игра закончена, ваш счет: #{count}"
gets
