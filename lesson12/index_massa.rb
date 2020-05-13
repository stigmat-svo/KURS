def index(weight, height)
  weight / (height / 100)**2
end

def index_bmi(index)
  case index
  when 0...16
    "\nВыраженный дефицит массы тела"
  when 16...18.5
    "\nНедостаточная (дефицит) масса тела"
  when 18.5...25
    "\nНорма"
  when 25...30
    "\nИзбыточная масса тела (предожирение)"
  when 30...35
    "\nОжирение"
  when 35...40
    "\nОжирение резкое"
  else
    "\nОчень резкое ожирение"
  end
end

puts 'Введите ваш вес (в кг.):'
weight = gets.to_f
puts 'Введите ваш рост (в см.):'
height = gets.to_f

index = index(weight, height)

puts "\nВаш индекс: #{format('%.2f', index)}"
puts index_bmi(index)
