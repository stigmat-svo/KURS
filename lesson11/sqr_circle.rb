def sqr_circle(radius)
  3.1415 * (radius**2)
end

puts 'Введите радиус круга:'
radius = gets.to_f

sqr = sqr_circle(radius)
puts "Площадь круга: #{eval(format('%8.4f', sqr))}"
