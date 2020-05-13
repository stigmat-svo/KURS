require 'translit'

puts "Введите фразу для транслитерации:"

frase = gets.strip

new_frase = Translit.convert(frase, :english)

puts new_frase

puts "Введите фразу для обратной транслитерации:"

frase = gets.strip

new_frase = Translit.convert(frase, :russian)

puts new_frase