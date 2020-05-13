cars = %w[Opel Mazda Toyota Skoda Mercedes BMW Cadillac Ferrary Mitsubishi Seat]
puts "У нас всего #{cars.size} машин. Вам какую?"
answer = gets.to_i - 1
if answer >= 0 && answer < cars.size
  puts "Поздравляем, вы получили: #{cars[answer]}"
else
  puts 'Извините, машины с таким номером у нас нет :('
end
