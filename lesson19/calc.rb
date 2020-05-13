puts "Первое число:"

num1 = gets.to_i

puts "Второе число:"

num2 = gets.to_i

puts "Выберите операцию (+ - * /):"

oper = gets.strip

result =
  case oper
  when "+"
    num1 + num2
  when "-"
    num1 - num2
  when "*"
    num1 * num2
  when "/"
    begin
      num1 / num2
    rescue ZeroDivisionError
      puts "На ноль делить нельзя."
      puts "Введите второе число:"
      num2 = gets.to_i
      retry
    end
  end

puts "Результат:"
puts result
