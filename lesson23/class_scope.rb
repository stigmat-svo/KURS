variable = 5

class MyClass
  def initialize
    @variable = 5
  end

  def check_variables
    puts "В классе:"
    puts "Переменная 'variable': #{defined?(variable)}"
    puts "Переменная '@variable': #{defined?(@variable)}"
  end
end

a = MyClass.new
a.check_variables


puts "Вне класса:"
puts "Переменная 'variable': #{defined?(variable)}"
puts "Переменная '@variable': #{defined?(@variable)}"
